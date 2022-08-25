package com.laoxu.game.common;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.*;

/**
 * @Description: 文件工具类
 * @Author laoxu
 * @Date 2020/2/4 12:59
 **/
public final class FileHelper
{
    
    private static final Logger logger = LoggerFactory.getLogger(FileHelper.class);
    private FileHelper() {}

    /**
     * 删除指定位置的文件。
     * @param path 要删除的文件的完全路径
     */
    public static void deleteFile( String path )
    {
        try
        {
            File file = new File( path ) ;
            file.delete() ;
        }
        catch( Exception ex )
        {
            logger.error(ex.getMessage()) ;
        }
    }

    /**
     * 在指定位置创建文件。
     * @param filename 文件路径
     */
    public static void createNewFile( String filename )
    {
        File file = new File( filename ) ;
        if( !file.exists() )
        {
            createNewFileOrDir( file, "f" ) ;
        }
    }

    /**
     * 在指定位置创建文件夹。
     * @param dirname 文件夹路径
     */
    public static void createNewDir( String dirname )
    {
        File file = new File( dirname ) ;
        if( file.exists() )
        {
            createNewFileOrDir( file, "d" ) ;
        }
    }

    /**
     * 将字符串写入指定文件。使用配置节 "framework.web.charset" 指定的编码集。
     * @param filename 文件路径
     * @param content 写入内容
     */
    public static void setContentString( String filename, String content )
    {
        setContentString( filename, content, "UTF-8" ) ;
    }

    /**
     * 将字符串写入指定文件。
     * @param filename 文件路径
     * @param content 写入内容
     * @param charsetName 字符集名称
     */
    public static void setContentString( String filename, String content, String charsetName )
    {
        try
        {
            setContentBinary(
                    filename,
                    content.getBytes( charsetName ) ) ;
        }
        catch( UnsupportedEncodingException ex )
        {
            logger.error(ex.getMessage()) ;
        }
    }

    /**
     * 将二进制数组写入指定文件。
     * @param filename 文件路径
     * @param arybyte 二进制数组
     */
    public static void setContentBinary( String filename, byte[] arybyte )
    {
        BufferedOutputStream bufferedStream = null ;

        try
        {
            bufferedStream = new BufferedOutputStream( new FileOutputStream( filename ) ) ;
            bufferedStream.write( arybyte ) ;
        }
        catch( Exception ex )
        {
            logger.error(ex.getMessage()) ;
        }
        finally
        {
            try
            {
                if( bufferedStream != null )
                {
                    bufferedStream.close() ;
                }
            }
            catch( Exception ex )
            {
                logger.error(ex.getMessage()) ;
            }
        }
    }

    /**
     * 将输入流写入指定文件。
     * @param filename 文件路径
     * @param inputStream 输入流
     */
    public static void setContentStream( String filename, InputStream inputStream )
    {
        try
        {
            byte[] bytes = IOUtils.toByteArray( inputStream ) ;
            setContentBinary( filename, bytes ) ;
        }
        catch( Exception ex )
        {
            logger.error(ex.getMessage()) ;
        }
        finally
        {
            try
            {
                if( inputStream != null )
                {
                    inputStream.close() ;
                }
            }
            catch( Exception ex )
            {
                logger.error(ex.getMessage()) ;
            }
        }
    }

    /**
     * 将字符串添加进指定文件。使用配置节 "framework.web.charset" 指定的编码集。
     * @param filename 文件路径
     * @param content 写入内容
     */
    public static void appendContentString( String filename, String content )
    {
        appendContentString( filename, content, "UTF-8" ) ;
    }

    /**
     * 将字符串添加进指定文件。
     * @param filename 文件路径
     * @param content 写入内容
     * @param charsetName 字符集名称
     */
    public static void appendContentString( String filename, String content, String charsetName )
    {
        try
        {
            appendContentBinary(
                    filename,
                    content.getBytes( charsetName ) ) ;
        }
        catch( UnsupportedEncodingException ex )
        {
            logger.error(ex.getMessage()) ;
        }
    }

    /**
     * 将二进制数组添加进指定文件。
     * @param filename 文件路径
     * @param arybyte 要写入的二进制数组
     */
    public static void appendContentBinary( String filename, byte[] arybyte )
    {
        BufferedOutputStream bufferedStream = null ;

        try
        {
            bufferedStream = new BufferedOutputStream( new FileOutputStream( filename, true ) ) ;
            bufferedStream.write( arybyte ) ;
        }
        catch( Exception ex )
        {
            logger.error(ex.getMessage()) ;
        }
        finally
        {
            try
            {
                if( bufferedStream != null )
                {
                    bufferedStream.close() ;
                }
            }
            catch( Exception ex )
            {
                logger.error(ex.getMessage()) ;
            }
        }
    }

    /**
     * 将输出流添加进指定文件。
     * @param filename 文件路径
     * @param inputStream 要写入的流
     */
    public static void appendContentStream( String filename, InputStream inputStream )
    {
        try
        {
            byte[] bytes = IOUtils.toByteArray( inputStream ) ;
            appendContentBinary( filename, bytes ) ;
        }
        catch( Exception ex )
        {
            logger.error(ex.getMessage()) ;
        }
        finally
        {
            try
            {
                if( inputStream != null )
                {
                    inputStream.close() ;
                }
            }
            catch( Exception ex )
            {
                logger.error(ex.getMessage()) ;
            }
        }
    }

    /**
     * 创建文件并将指定的字符串写入文件。使用配置节 "framework.web.charset" 指定的编码集。
     * @param path 文件路径
     * @param content 写入内容
     */
    public static void writeFileString( String path, String content )
    {
        createNewFile( path ) ;
        setContentString( path, content ) ;
    }

    /**
     * 创建文件并将指定的字符串写入文件。
     * @param path 文件路径
     * @param content 写入内容
     * @param charsetName 字符集名称
     */
    public static void writeFileString( String path, String content, String charsetName )
    {
        createNewFile( path ) ;
        setContentString( path, content, charsetName ) ;
    }

    /**
     * 创建文件并将指定的二进制数组写入文件。
     * @param path 文件路径
     * @param content 要写入的二进制数组
     */
    public static void writeFileBinary( String path, byte[] content )
    {
        createNewFile( path ) ;
        setContentBinary( path, content ) ;
    }

    /**
     * 创建文件并将指定的输入流写入文件。
     * @param path 文件路径
     * @param inputStream 要写入的流
     */
    public static void writeFileStream( String path, InputStream inputStream )
    {
        createNewFile( path ) ;
        setContentStream( path, inputStream ) ;
    }

    /**
     * 根据文件名获取扩展名。
     * @param filename 文件名
     * @return 扩展名
     */
    public static String getExtFromFileName( String filename )
    {
        int t = filename.lastIndexOf( "\\" ) ;
        if( t != -1 )
            filename = filename.substring( t + 1 ) ;
        t = filename.lastIndexOf( "/" ) ;
        if( t != -1 )
            filename = filename.substring( t + 1 ) ;
        t = filename.lastIndexOf( "." ) ;
        if( t != -1 )
            return filename.substring( t + 1 ).toLowerCase() ;
        return "" ;
    }

    private static void createNewFileOrDir( File file, String type )
    {
        try
        {
            if( type.equals( "d" ) )
                file.mkdirs() ;
            else
            {
                file.getParentFile().mkdirs() ;
                file.createNewFile() ;
            }
        }
        catch( Exception ex )
        {
            logger.error(ex.getMessage()) ;
        }
    }





}
