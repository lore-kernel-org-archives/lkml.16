Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC67F1624D5;
	Fri,  4 Jul 2025 05:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751606344; cv=none; b=FzB3rQkwUKFOdN1g+jLMy4Gm/CAffdR/D4jKWmDbr9n54zr8Dbus2S/Hr9hzIoiBdgj+7C4HiAlxNn31vmj5af7H8XlRBVu8711kcTnf74xXQWMUSNWKSj8M/rsZD+moTctwjOSvmCbKUn/u81fmwttsCyVH8JjCAFtMuVLw+EI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751606344; c=relaxed/simple;
	bh=fy2czFwCVDTZMlkTjGWZ9ETYAcyTdWu1ljEEbONCQ9s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X3sSNT0mpCHCJK+NWZPG6EpyNmIImgQ7zTIF8ikEXk1rzEPpwxMcIARG9HcTMG3B7AmyRDpsDz4xOqKzsUzWH++uJolSyxmzjhwi6UKRo5u7P+23FVVdbHTtbesOVxoC9twEBOYimWzZnQ0SyWeqaNpj2CiIpi87MC8+w+//1jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=2J+z80zt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="2J+z80zt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AC36C4CEE3;
	Fri,  4 Jul 2025 05:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1751606344;
	bh=fy2czFwCVDTZMlkTjGWZ9ETYAcyTdWu1ljEEbONCQ9s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=2J+z80ztP3tx/o1F2yt8ODNIlNRk8avjIxv59SvtcY+Ch3O8vzouj1fGzQ3QMFHyh
	 tl9gKvNa9m89QNdD/o0akyRoP4lbSaU26NRTsrgowbFqyab0zDxWwJwwuivIbSiIlQ
	 EQkWk93+HqwTZUF4w0ZL/pv+VetEgsEEm1lLMY9I=
Date: Fri, 4 Jul 2025 07:18:59 +0200
From: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To: Ryan Mann <rmann@ndigital.com>
Cc: "johan@kernel.org" <johan@kernel.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] NDI FTDI USB driver support
Message-ID: <2025070406-saloon-craving-70fa@gregkh>
References: <YQXPR01MB49870CB7B3075ADDF88A3FD4DF43A@YQXPR01MB4987.CANPRD01.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YQXPR01MB49870CB7B3075ADDF88A3FD4DF43A@YQXPR01MB4987.CANPRD01.PROD.OUTLOOK.COM>

On Thu, Jul 03, 2025 at 07:51:38PM +0000, Ryan Mann wrote:
> From: Ryan Mann <rmann@ndigital.com>
> This represents changes to the FTDI USB serial device drivers to support a new NDI (Northern Digital Inc.) product called the EMGUIDE GEMINI. The EMGUIDE GEMINI will support 1.2Mbaud the same as other NDI FTDI virtual COM port devices. It was noticed in making this change that the NDI Aurora was included in this "quirk", but it does not support rates as high as 1.2Mbaud, so it was replaced by the EMGUIDE.
> Previous FTDI devices produced by NDI all used the FTDI VID (0x0403) and a very limited set of PIDs that Future Technology Devices allowed NDI to use (0xda70 to 0xda74). Since then, NDI has reserved its own VID (0x23f2), and used two of the PIDs for two experimental, non-production products that didn't use the FTDI chip for USB connection.
> This patch adds the new VID as "FTDI_NDI_VID" in the ftdi_sio_ids.h header file. It also reserves PID 0x0003 for the EMGUIDE GEMINI, as well as stubbing out PIDs 0x0004 through 0x0009 for "future" NDI devices. In the unlikely event that the NDI hardware team chooses to implement the USB functionality using something other than FTDI chips, those "future device" lines may need to get removed.
> As the EMGUIDE GEMINI product development has not been completed and the step to write over the default VID and PID has not been completed, these code changes have not been tested with an EMGUIDE GEMINI. However, the code changes were compiled successfully using Ubuntu 24.04 locally and tested as a module using an NDI Aurora system.

Take a minute and read other patches in the kernel, and on the mailing
lists to see if your changelog text matches up with what they contain.

> By making a contribution to this project, I certify that:
> 
>         (a) The contribution was created in whole or in part by me and I
>             have the right to submit it under the open source license
>             indicated in the file; or
> 
>         (b) The contribution is based upon previous work that, to the best
>             of my knowledge, is covered under an appropriate open source
>             license and I have the right under that license to submit that
>             work with modifications, whether created in whole or in part
>             by me, under the same open source license (unless I am
>             permitted to submit under a different license), as indicated
>             in the file; or
> 
>         (c) The contribution was provided directly to me by some other
>             person who certified (a), (b) or (c) and I have not modified
>             it.
> 
>         (d) I understand and agree that this project and the contribution
>             are public and that a record of the contribution (including all
>             personal information I submit with it, including my sign-off) is
>             maintained indefinitely and may be redistributed consistent with
>             this project or the open source license(s) involved.

Hint, you don't have to duplicate the whole of the DCO in your
changelog, where in the documentation did you see that?

Try reading the submitting patches document again please.

> 
> Signed-off-by: Ryan Mann <rmann@ndigital.com>
> ---
>  drivers/usb/serial/ftdi_sio.c     | 16 +++++++++++++++-
>  drivers/usb/serial/ftdi_sio_ids.h | 16 ++++++++++++++++
>  2 files changed, 31 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/serial/ftdi_sio.c b/drivers/usb/serial/ftdi_sio.c
> index 6ac7a0a5cf07..a41a9ed7e946 100644
> --- a/drivers/usb/serial/ftdi_sio.c
> +++ b/drivers/usb/serial/ftdi_sio.c
> @@ -803,6 +803,20 @@ static const struct usb_device_id id_table_combined[] = {
>  		.driver_info = (kernel_ulong_t)&ftdi_NDI_device_quirk },
>  	{ USB_DEVICE(FTDI_VID, FTDI_NDI_AURORA_SCU_PID),
>  		.driver_info = (kernel_ulong_t)&ftdi_NDI_device_quirk },
> +	{ USB_DEVICE(FTDI_NDI_VID, FTDI_NDI_EMGUIDE_GEMINI_PID),
> +		.driver_info = (kernel_ulong_t)&ftdi_NDI_device_quirk },
> +	{ USB_DEVICE(FTDI_NDI_VID, FTDI_NDI_FUTURE_4_PID),
> +		.driver_info = (kernel_ulong_t)&ftdi_NDI_device_quirk },
> +	{ USB_DEVICE(FTDI_NDI_VID, FTDI_NDI_FUTURE_5_PID),
> +		.driver_info = (kernel_ulong_t)&ftdi_NDI_device_quirk },
> +	{ USB_DEVICE(FTDI_NDI_VID, FTDI_NDI_FUTURE_6_PID),
> +		.driver_info = (kernel_ulong_t)&ftdi_NDI_device_quirk },
> +	{ USB_DEVICE(FTDI_NDI_VID, FTDI_NDI_FUTURE_7_PID),
> +		.driver_info = (kernel_ulong_t)&ftdi_NDI_device_quirk },
> +	{ USB_DEVICE(FTDI_NDI_VID, FTDI_NDI_FUTURE_8_PID),
> +		.driver_info = (kernel_ulong_t)&ftdi_NDI_device_quirk },
> +	{ USB_DEVICE(FTDI_NDI_VID, FTDI_NDI_FUTURE_9_PID),
> +		.driver_info = (kernel_ulong_t)&ftdi_NDI_device_quirk },
>  	{ USB_DEVICE(TELLDUS_VID, TELLDUS_TELLSTICK_PID) },
>  	{ USB_DEVICE(NOVITUS_VID, NOVITUS_BONO_E_PID) },
>  	{ USB_DEVICE(FTDI_VID, RTSYSTEMS_USB_VX8_PID) },
> @@ -1333,7 +1347,7 @@ static u32 get_ftdi_divisor(struct tty_struct *tty,
>  			     (product_id == FTDI_NDI_SPECTRA_SCU_PID)	||
>  			     (product_id == FTDI_NDI_FUTURE_2_PID)	||
>  			     (product_id == FTDI_NDI_FUTURE_3_PID)	||
> -			     (product_id == FTDI_NDI_AURORA_SCU_PID))	&&
> +			     (product_id == FTDI_NDI_EMGUIDE_GEMINI_PID)) &&
>  			    (baud == 19200)) {
>  				baud = 1200000;
>  			}
> diff --git a/drivers/usb/serial/ftdi_sio_ids.h b/drivers/usb/serial/ftdi_sio_ids.h
> index 9acb6f837327..6e162a73f64c 100644
> --- a/drivers/usb/serial/ftdi_sio_ids.h
> +++ b/drivers/usb/serial/ftdi_sio_ids.h
> @@ -197,13 +197,29 @@
>  
>  /*
>   * NDI (www.ndigital.com) product ids
> + * Almost all of these devices use FTDI's VID (0x0403).
> + * Newer devices use NDI Vendor ID

"newer" is going to age badly, these lines are not needed.

>   */
> +/* Using DA70 to DA74 block of FTDI VID (0x0403 ) */

What does this comment mean?

>  #define FTDI_NDI_HUC_PID		0xDA70	/* NDI Host USB Converter */
>  #define FTDI_NDI_SPECTRA_SCU_PID	0xDA71	/* NDI Spectra SCU */
>  #define FTDI_NDI_FUTURE_2_PID		0xDA72	/* NDI future device #2 */
>  #define FTDI_NDI_FUTURE_3_PID		0xDA73	/* NDI future device #3 */
>  #define FTDI_NDI_AURORA_SCU_PID		0xDA74	/* NDI Aurora SCU */
>  
> +#define FTDI_NDI_VID 0x23F2 /* NDI Vendor ID */

Missing tab?

> +/*
> + * VID 0x23F2 PIDs 0x0001 and 0x0002 were used for products that do not use FTDI

There is no need for that line.

> + * The following NDI devices use NDI VID

That's kind of obvious and not needed :)

> + */
> +#define FTDI_NDI_EMGUIDE_GEMINI_PID	0x0003  /* NDI Emguide Gemini */
> +#define FTDI_NDI_FUTURE_4_PID		0x0004 /* NDI future device #4 */
> +#define FTDI_NDI_FUTURE_5_PID		0x0005 /* NDI future device #5 */
> +#define FTDI_NDI_FUTURE_6_PID		0x0006 /* NDI future device #6 */
> +#define FTDI_NDI_FUTURE_7_PID		0x0007 /* NDI future device #7 */
> +#define FTDI_NDI_FUTURE_8_PID		0x0008 /* NDI future device #8 */
> +#define FTDI_NDI_FUTURE_9_PID		0x0009 /* NDI future device #9 */

No need to list future devices like this, why not just add them to the
driver when you have them, with the proper name then?

thanks,

greg k-h
