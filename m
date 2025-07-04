Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 016F52857FF;
	Fri,  4 Jul 2025 08:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751617477; cv=none; b=q8V4MSYWHlHzJ9pzJl+gOkVJerR1zSdL3c/VPzc469WXaZFnh3KRDXc7KC+c4Cl+aEHYp2k7lPmF07i9eyAJS0HSlurKFABXC/NutBP6AzPel6yZIUFb8Hxn76qkKAJgxNvpBrIJjIpu6dkjEYJyV/jZwsRXiOZeIXXWXadoivI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751617477; c=relaxed/simple;
	bh=8bQ/kAWmKbMyR8G+zrxH66t6rKnWduiJy6CgnKtxMws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PwFzLGjHUHVi0jhMnT40IjfAfmypmE7H2veafU7RdWnVfHSvxgcgN78xyTt1kxefj0W/j+/uOsoGhhv5CykkiqaJc2V5JSqyyRrAdZuLU5u12jjJguQlpnGElMkdsBdcdvvZXHE+StvFBIPxF01+DcQVFVMKFeS7ukxurAZqXBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=YWc6Gsye; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="YWc6Gsye"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D45D9C4CEE3;
	Fri,  4 Jul 2025 08:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1751617476;
	bh=8bQ/kAWmKbMyR8G+zrxH66t6rKnWduiJy6CgnKtxMws=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YWc6Gsye+ceq3AZl6vz5vCYRgfvWD3+jAzpZp1Vi5asujwWdAYrLyVLGxbIlCW0jm
	 cG2OyGRATW6+jpYColihmvT39vK/oRD9zPQ9qpgA3oUwTDDnLp2+skEk2sEyYE5d/s
	 7+PVQhw+2NF0Z6JtvXHDSBOeAt4sTjP2pY/mFotE=
Date: Fri, 4 Jul 2025 10:24:33 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jie Deng <dengjie03@kylinos.cn>
Cc: stern@rowland.harvard.edu, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net
Subject: Re: [PATCH v2] usb: storage: Ignore UAS driver for SanDisk Extreme
 Pro 55AF storage device
Message-ID: <2025070422-punctured-opal-f51e@gregkh>
References: <2025070329-rinse-engaged-e7af@gregkh>
 <20250704061116.1020646-1-dengjie03@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704061116.1020646-1-dengjie03@kylinos.cn>

On Fri, Jul 04, 2025 at 02:11:16PM +0800, Jie Deng wrote:
> The SanDisk Extreme Pro 55AF storage device(0781:55af) has poor compatibility with UAS drivers.
> The logs:
> [    1.359859][ 0] [  T163] usb 2-1: new SuperSpeed Gen 1 USB device number 2 using xhci_hcd
> [    1.385708][ 0] [  T163] usb 2-1: New USB device found, idVendor=0781, idProduct=55af, bcdDevice=10.85
> [    1.385709][ 0] [  T163] usb 2-1: New USB device strings: Mfr=2, Product=3, SerialNumber=1
> [    1.385710][ 0] [  T163] usb 2-1: Product: Extreme Pro 55AF
> [    1.385711][ 0] [  T163] usb 2-1: Manufacturer: SanDisk
> [    1.385711][ 0] [  T163] usb 2-1: SerialNumber: 323234323935343030343636
> [    1.927603][ 0] [  T306] usbcore: registered new interface driver usb-storage
> [    1.940511][ 0] [  T306] scsi host3: uas
> [    1.940584][ 0] [  T306] usbcore: registered new interface driver uas
> [    1.940843][ 0] [  T188] scsi 3:0:0:0: Direct-Access     SanDisk  Extreme Pro 55AF 1085 PQ: 0 ANSI: 6
> [    1.941363][ 0] [  T188] scsi 3:0:0:1: Enclosure         SanDisk  SES Device       1085 PQ: 0 ANSI: 6
> [    1.941697][ 0] [  T188] sd 3:0:0:0: Attached scsi generic sg0 type 0
> [    1.941783][ 0] [  T188] scsi 3:0:0:1: Attached scsi generic sg1 type 13
> [    1.942296][ 0] [  T189] sd 3:0:0:0: [sda] 1953459617 512-byte logical blocks: (1.00 TB/931 GiB)
> [    1.942373][ 0] [  T189] sd 3:0:0:0: [sda] Write Protect is off
> [    1.942374][ 0] [  T189] sd 3:0:0:0: [sda] Mode Sense: 37 00 10 00
> [    1.942534][ 0] [  T189] sd 3:0:0:0: [sda] Write cache: enabled, read cache: enabled, supports DPO and FUA
> [    1.943586][ 0] [  T189] sd 3:0:0:0: [sda] Optimal transfer size 2097152 bytes
> [    1.976797][ 0] [  T189]  sda: sda1
> [    1.977898][ 0] [  T189] sd 3:0:0:0: [sda] Attached SCSI disk
> [    1.980406][ 0] [  T267] scsi 3:0:0:1: Failed to get diagnostic page 0x1
> [    1.980408][ 0] [  T267] scsi 3:0:0:1: Failed to bind enclosure -19
> [    1.980414][ 0] [  T267] ses 3:0:0:1: Attached Enclosure device
> [    1.981068][ 0] [    C0] sd 3:0:0:0: [sda] tag#10 data cmplt err -75 uas-tag 1 inflight: CMD
> [    1.981071][ 0] [    C0] sd 3:0:0:0: [sda] tag#10 CDB: Read(10) 28 00 74 6f 6d 00 00 00 08 00
> [   33.819186][ 0] [  T188] sd 3:0:0:0: [sda] tag#10 uas_eh_abort_handler 0 uas-tag 1 inflight: CMD
> [   33.819188][ 0] [  T188] sd 3:0:0:0: [sda] tag#10 CDB: Read(10) 28 00 74 6f 6d 00 00 00 08 00
> [   33.843186][ 0] [  T309] scsi host3: uas_eh_device_reset_handler start
> 
> Device decriptor is below:
> Bus 002 Device 003: ID 0781:55af SanDisk Corp. Extreme Pro 55AF
> Device Descriptor:
>   bLength                18
>   bDescriptorType         1
>   bcdUSB               3.20
>   bDeviceClass            0
>   bDeviceSubClass         0
>   bDeviceProtocol         0
>   bMaxPacketSize0         9
>   idVendor           0x0781 SanDisk Corp.
>   idProduct          0x55af
>   bcdDevice           10.85
>   iManufacturer           2 SanDisk
>   iProduct                3 Extreme Pro 55AF
>   iSerial                 1 323234323935343030343636
>   bNumConfigurations      1
>   Configuration Descriptor:
>     bLength                 9
>     bDescriptorType         2
>     wTotalLength       0x0079
>     bNumInterfaces          1
>     bConfigurationValue     1
>     iConfiguration          0
>     bmAttributes         0x80
>       (Bus Powered)
>     MaxPower              896mA
>     Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        0
>       bAlternateSetting       0
>       bNumEndpoints           2
>       bInterfaceClass         8 Mass Storage
>       bInterfaceSubClass      6 SCSI
>       bInterfaceProtocol     80 Bulk-Only
>       iInterface              0
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x81  EP 1 IN
>         bmAttributes            2
>           Transfer Type            Bulk
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x0400  1x 1024 bytes
>         bInterval               0
>         bMaxBurst              15
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x02  EP 2 OUT
>         bmAttributes            2
>           Transfer Type            Bulk
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x0400  1x 1024 bytes
>         bInterval               0
>         bMaxBurst              15
>     Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        0
>       bAlternateSetting       1
>       bNumEndpoints           4
>       bInterfaceClass         8 Mass Storage
>       bInterfaceSubClass      6 SCSI
>       bInterfaceProtocol     98
>       iInterface              0
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x81  EP 1 IN
>         bmAttributes            2
>           Transfer Type            Bulk
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x0400  1x 1024 bytes
>         bInterval               0
>         bMaxBurst              15
>         MaxStreams             32
>         Data-in pipe (0x03)
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x02  EP 2 OUT
>         bmAttributes            2
>           Transfer Type            Bulk
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x0400  1x 1024 bytes
>         bInterval               0
>         bMaxBurst              15
>         MaxStreams             32
>         Data-out pipe (0x04)
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x83  EP 3 IN
>         bmAttributes            2
>           Transfer Type            Bulk
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x0400  1x 1024 bytes
>         bInterval               0
>         bMaxBurst              15
>         MaxStreams             32
>         Status pipe (0x02)
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x04  EP 4 OUT
>         bmAttributes            2
>           Transfer Type            Bulk
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x0400  1x 1024 bytes
>         bInterval               0
>         bMaxBurst               0
>         Command pipe (0x01)
> 
> So ignore UAS driver for this device.
> 
> Signed-off-by: Jie Deng <dengjie03@kylinos.cn>
> ---
>  drivers/usb/storage/unusual_uas.h | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/usb/storage/unusual_uas.h b/drivers/usb/storage/unusual_uas.h
> index 1477e31d7763..6b1a08e2e724 100644
> --- a/drivers/usb/storage/unusual_uas.h
> +++ b/drivers/usb/storage/unusual_uas.h
> @@ -52,6 +52,13 @@ UNUSUAL_DEV(0x059f, 0x1061, 0x0000, 0x9999,
>  		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
>  		US_FL_NO_REPORT_OPCODES | US_FL_NO_SAME),
>  
> +/* Reported-by: Jie Deng <dengjie03@kylinos.cn> */
> +UNUSUAL_DEV(0x0781, 0x55af, 0x0000, 0x9999,
> +		"SanDisk",
> +		"Extreme Pro 55AF",
> +		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
> +		US_FL_IGNORE_UAS),
> +
>  /* Reported-by: Zhihong Zhou <zhouzhihong@greatwall.com.cn> */
>  UNUSUAL_DEV(0x0781, 0x55e8, 0x0000, 0x9999,
>  		"SanDisk",
> -- 
> 2.25.1
> 
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/process/submitting-patches.rst for what
  needs to be done here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
