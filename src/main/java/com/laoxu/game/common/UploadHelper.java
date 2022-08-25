package com.laoxu.game.common;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.io.FileSystemResource;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.URLEncoder;


/**
 * <p>在 web 容器中进行上传/下载的静态工具类。</p>
 * <p>不可继承，不可实例化。</p>
 * @author laoxu
 */
public final class UploadHelper
{
    private static final Logger logger = LoggerFactory.getLogger(UploadHelper.class);
    
    private UploadHelper() {}

    private final static String REFERENCE_FILE = "framework-config.xml" ;
    
    /**
     * 应用程序的根目录（物理路径）
     */
    public static String BASE_PATH = null ;

   /* static
    {
        try
        {
            PathMatchingResourcePatternResolver resourceResolver = new PathMatchingResourcePatternResolver ( Thread.currentThread().getContextClassLoader() ) ;
            org.springframework.core.io.Resource resource = resourceResolver.getResource( REFERENCE_FILE ) ;
            BASE_PATH = resource.getFile().getParentFile().getParentFile().getParentFile().getPath() + "\\" ;
        }
        catch( Exception ex )
        {
            logger.error(ex.getMessage());
        }
    }*/

    /**
     * 取得请求的服务器根地址(没有虚拟路径)，格式为 "http://主机名:端口"。
     * @param request 请求实例
     * @return 请求的服务器根地址
     */
    public static String getRequestServerUrl( HttpServletRequest request )
    {
        return new StringBuffer( "http://" )
            .append( request.getServerName() )
            .append( ":" )
            .append( request.getServerPort() )
            .toString() ;
    }

    /**
     * 为下载页面提供指定位置的文件流内容。
     * @param response 下载页面的响应实例
     * @param filePath 要下载的文件路径
     * @param downloadName 下载提示显示的文件名称
     * @param mimeType mime类型
     */
    public static void sendFile(HttpServletResponse response, String filePath, String downloadName, String disposition, String mimeType )
    {
        InputStream inStream = null ;
        OutputStream outStream = null ;
        try
        {
        	/*filePath="D:\\WorkingSoftware\\apache-tomcat-7.0.59\\webapps\\ZZ_OA\\upload\\2015\\9\\111.doc";*/
            String fileName =URLEncoder.encode( downloadName , "UTF-8");
            response.reset() ;
            response.setHeader( "Content-disposition", disposition+"; filename=" + fileName ) ;
            response.setContentType( mimeType ) ;

            FileSystemResource resource = new FileSystemResource( filePath ) ;
            inStream = resource.getInputStream() ;
            outStream = response.getOutputStream() ;

            byte[] ba = IOUtils.toByteArray( inStream ) ;
            outStream.write( ba ) ;
        }
        catch( Exception ex )
        {
            logger.error(ex.getMessage()) ;
        }
        finally
        {
            try
            {
                if( inStream != null )
                    inStream.close() ;
                if( outStream != null )
                    outStream.close() ;
            }
            catch( Exception ex )
            {
                logger.error(ex.getMessage()) ;
            }
        }
    }
    

    /**
     * 提供重定向文本。
     * @param response 响应实例
     * @param context 文本内容
     */
    public static void redirectText(HttpServletResponse response, String context )
    {
        PrintWriter writer = null ;
        try
        {
            writer = response.getWriter() ;
            writer.write( context ) ;
        }
        catch( Exception ex )
        {
            logger.error(ex.getMessage()) ;
        }
        finally
        {
            try
            {
                if( writer != null )
                    writer.close() ;
            }
            catch( Exception ex )
            {
                logger.error(ex.getMessage()) ;
            }
        }
    }

    /**
     * 为下载页面提供字符串内容，如果text、xml等文档。
     * @param response 下载页面的响应实例
     * @param context 文本内容
     * @param downloadName 下载提示显示的文件名称
     * @param mimeType mime类型
     */
    public static void sendText(HttpServletResponse response, String context, String downloadName, String mimeType )
    {
        PrintWriter writer = null ;
        try
        {
            String fileName = new String( downloadName.getBytes(), "iso-8859-1" ) ;

            response.reset() ;
            response.setHeader( "Content-disposition", "attachment; filename=" + fileName ) ;
            response.setContentType( mimeType ) ;

            writer = response.getWriter() ;
            writer.write( context ) ;
        }
        catch( Exception ex )
        {
            logger.error(ex.getMessage()) ;
        }
        finally
        {
            try
            {
                if( writer != null )
                    writer.close() ;
            }
            catch( Exception ex )
            {
                logger.error(ex.getMessage()) ;
            }
        }
    }

    /**
     * 为下载页面提供二进制内容，如果word、pdf、execl和zip等文档。
     * @param response 下载页面的响应实例
     * @param binary 二进制内容
     * @param downloadName 下载提示显示的文件名称
     * @param mimeType mime类型
     */
    public static void sendBinary(HttpServletResponse response, byte[] binary, String downloadName, String mimeType )
    {
        OutputStream outStream = null ;
        try
        {
            String fileName = new String( downloadName.getBytes(), "iso-8859-1" ) ;
            
            response.reset() ;
            response.setHeader( "Content-disposition", "attachment; filename=" + fileName ) ;
            response.setContentType( mimeType ) ;

            outStream = response.getOutputStream() ;
            outStream.write( binary ) ;
        }
        catch( Exception ex )
        {
            logger.error(ex.getMessage()) ;
        }
        finally
        {
            try
            {
                if( outStream != null )
                    outStream.close() ;
            }
            catch( Exception ex )
            {
                logger.error(ex.getMessage()) ;
            }
        }
    }
    
    /**
     * 提供重定向文本。
     * @param response 响应实例
     * @param binary 文本内容
     */
    public static void redirectBinary(HttpServletResponse response, byte[] binary )
    {
        OutputStream writer = null ;
        try
        {
            writer = response.getOutputStream() ;
            writer.write( binary ) ;
        }
        catch( Exception ex )
        {
            logger.error(ex.getMessage()) ;
        }
        finally
        {
            try
            {
                if( writer != null )
                    writer.close() ;
            }
            catch( Exception ex )
            {
                logger.error(ex.getMessage()) ;
            }
        }
    }
}