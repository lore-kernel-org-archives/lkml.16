Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E392822330F;
	Mon,  5 May 2025 12:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746446708; cv=none; b=Qe0ihOmvyUar/N8Iqjd17p59uC6XaTL/CDO9xlCDhFBX6BE9aiLeDpu0cXvs/uO3lmnIztaaJ210Uk9vezfbHU0sx6YT/EzZhSGHJ4cABReLm4+meqU5v1p3pwB1JRr0OVV05HbSBtEu3mT4Z+TPaXs+T5dMFmQjojgwYzJ3OKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746446708; c=relaxed/simple;
	bh=ftZh6TKo9+W+imfi7WNfcJBEgK/zvIp5wBxTBAO8JFE=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ng8YqY5MRD8zB6JJD9hRC5iEIFgzTTj+hSuIOftbpgBPLhFXnFPTyo88kFeFG6EsVQOA4a+WSqlUsi0g/3WrGI/lTA4XHaxPeoZVsPabEnyZOR2Bdu1CGVevwsINeKxsloyxTDRND2ZEnjyB4OP5kAnwirVxCC5wbjkrtGFgUUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xukvo/L7; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xukvo/L7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746446707; x=1777982707;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=ftZh6TKo9+W+imfi7WNfcJBEgK/zvIp5wBxTBAO8JFE=;
  b=Xukvo/L7Ptg23eV0VHDl54BusXrBsYbwh8a0MjepCnQH971Am3+Njdeb
   pqEpFKQKZ+W99FBShH5Z1E6Y2t7+0xTeOP6fAVdFhYeHLTGhfCBKMISD/
   nGf4L5fJmM41lGh/kg5Z3J88ZQZpKsXFwV9nvvaordBEx5GFz3Txt4n/U
   hBUEcoWbwHbX706XRoxQBRG6y36qD8TARxmEAl82OSlzhbsM5FIofxw7b
   8enIbyTASurvHGY1s0zn/vneRGU0s5eEuK342iidi59aSuuITZt8Jw23K
   3ayVDC3r+KtuVnsYBaehy1XYbFlWcaQ+o+YohBkDsN4KO4aslrBeG6r4m
   A==;
X-CSE-ConnectionGUID: XoMyeaieTFOsNFH+bIXj1g==
X-CSE-MsgGUID: +laki70jTj209HzGqSRM3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11423"; a="70555765"
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; 
   d="scan'208";a="70555765"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2025 05:05:06 -0700
X-CSE-ConnectionGUID: 2VW5DpuERNufmn+6vRDtfg==
X-CSE-MsgGUID: WeupW2oJRnyu8Jf6Cxl/Ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; 
   d="scan'208";a="158450381"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.68])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2025 05:05:02 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 5 May 2025 15:04:59 +0300 (EEST)
To: "Dr. David Alan Gilbert" <linux@treblig.org>
cc: malattia@linux.it, Hans de Goede <hdegoede@redhat.com>, hverkuil@xs4all.nl, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] platform/x86/sony-laptop: Remove unused sony laptop
 camera code
In-Reply-To: <20250505005539.336183-1-linux@treblig.org>
Message-ID: <bbd883e2-7615-c37b-3a6a-acddd76bf3ad@linux.intel.com>
References: <20250505005539.336183-1-linux@treblig.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 5 May 2025, linux@treblig.org wrote:

> From: "Dr. David Alan Gilbert" <linux@treblig.org>
> 
> commit ba47652ba655 ("media: meye: remove this deprecated driver")
> removed the meye driver but left behind the code in sony-laptop.c
> which that driver used to call.
> 
> Remove the sony_pic_camera_command() function, and the set of
> defines (SONY_PIC_COMMAND_*) in a header used for the interface
> and the static helpers it called.
> 
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> ---
>  MAINTAINERS                        |   1 -
>  drivers/platform/x86/sony-laptop.c | 135 -----------------------------
>  include/linux/sony-laptop.h        |  39 ---------
>  3 files changed, 175 deletions(-)
>  delete mode 100644 include/linux/sony-laptop.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 2aed76827090..6c865b5d8fae 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -22671,7 +22671,6 @@ W:	http://www.linux.it/~malattia/wiki/index.php/Sony_drivers
>  F:	Documentation/admin-guide/laptops/sony-laptop.rst
>  F:	drivers/char/sonypi.c
>  F:	drivers/platform/x86/sony-laptop.c
> -F:	include/linux/sony-laptop.h
>  
>  SOPHGO DEVICETREES and DRIVERS
>  M:	Chen Wang <unicorn_wang@outlook.com>
> diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
> index b52390fbd743..4efd0d7031a5 100644
> --- a/drivers/platform/x86/sony-laptop.c
> +++ b/drivers/platform/x86/sony-laptop.c
> @@ -48,7 +48,6 @@
>  #include <linux/acpi.h>
>  #include <linux/slab.h>
>  #include <linux/sonypi.h>
> -#include <linux/sony-laptop.h>
>  #include <linux/rfkill.h>
>  #ifdef CONFIG_SONYPI_COMPAT
>  #include <linux/poll.h>
> @@ -3619,22 +3618,6 @@ static u8 sony_pic_call2(u8 dev, u8 fn)
>  	return v1;
>  }
>  
> -static u8 sony_pic_call3(u8 dev, u8 fn, u8 v)
> -{
> -	u8 v1;
> -
> -	wait_on_command(inb_p(spic_dev.cur_ioport->io1.minimum + 4) & 2, ITERATIONS_LONG);
> -	outb(dev, spic_dev.cur_ioport->io1.minimum + 4);
> -	wait_on_command(inb_p(spic_dev.cur_ioport->io1.minimum + 4) & 2, ITERATIONS_LONG);
> -	outb(fn, spic_dev.cur_ioport->io1.minimum);
> -	wait_on_command(inb_p(spic_dev.cur_ioport->io1.minimum + 4) & 2, ITERATIONS_LONG);
> -	outb(v, spic_dev.cur_ioport->io1.minimum);
> -	v1 = inb_p(spic_dev.cur_ioport->io1.minimum);
> -	dprintk("sony_pic_call3(0x%.2x - 0x%.2x - 0x%.2x): 0x%.4x\n",
> -			dev, fn, v, v1);
> -	return v1;
> -}
> -
>  /*
>   * minidrivers for SPIC models
>   */
> @@ -3754,124 +3737,6 @@ static void sony_pic_detect_device_type(struct sony_pic_dev *dev)
>  #define SONYPI_CAMERA_REVISION 			8
>  #define SONYPI_CAMERA_ROMVERSION 		9
>  
> -static int __sony_pic_camera_ready(void)
> -{
> -	u8 v;
> -
> -	v = sony_pic_call2(0x8f, SONYPI_CAMERA_STATUS);
> -	return (v != 0xff && (v & SONYPI_CAMERA_STATUS_READY));
> -}
> -
> -static int __sony_pic_camera_off(void)
> -{
> -	if (!camera) {
> -		pr_warn("camera control not enabled\n");
> -		return -ENODEV;
> -	}
> -
> -	wait_on_command(sony_pic_call3(0x90, SONYPI_CAMERA_PICTURE,
> -				SONYPI_CAMERA_MUTE_MASK),
> -			ITERATIONS_SHORT);
> -
> -	if (spic_dev.camera_power) {
> -		sony_pic_call2(0x91, 0);
> -		spic_dev.camera_power = 0;
> -	}
> -	return 0;
> -}
> -
> -static int __sony_pic_camera_on(void)
> -{
> -	int i, j, x;
> -
> -	if (!camera) {
> -		pr_warn("camera control not enabled\n");
> -		return -ENODEV;
> -	}
> -
> -	if (spic_dev.camera_power)
> -		return 0;
> -
> -	for (j = 5; j > 0; j--) {
> -
> -		for (x = 0; x < 100 && sony_pic_call2(0x91, 0x1); x++)
> -			msleep(10);
> -		sony_pic_call1(0x93);
> -
> -		for (i = 400; i > 0; i--) {
> -			if (__sony_pic_camera_ready())
> -				break;
> -			msleep(10);
> -		}
> -		if (i)
> -			break;
> -	}
> -
> -	if (j == 0) {
> -		pr_warn("failed to power on camera\n");
> -		return -ENODEV;
> -	}
> -
> -	wait_on_command(sony_pic_call3(0x90, SONYPI_CAMERA_CONTROL,
> -				0x5a),
> -			ITERATIONS_SHORT);
> -
> -	spic_dev.camera_power = 1;
> -	return 0;
> -}
> -
> -/* External camera command (exported to the motion eye v4l driver) */
> -int sony_pic_camera_command(int command, u8 value)
> -{
> -	if (!camera)
> -		return -EIO;
> -
> -	mutex_lock(&spic_dev.lock);
> -
> -	switch (command) {
> -	case SONY_PIC_COMMAND_SETCAMERA:
> -		if (value)
> -			__sony_pic_camera_on();
> -		else
> -			__sony_pic_camera_off();
> -		break;
> -	case SONY_PIC_COMMAND_SETCAMERABRIGHTNESS:
> -		wait_on_command(sony_pic_call3(0x90, SONYPI_CAMERA_BRIGHTNESS, value),
> -				ITERATIONS_SHORT);
> -		break;
> -	case SONY_PIC_COMMAND_SETCAMERACONTRAST:
> -		wait_on_command(sony_pic_call3(0x90, SONYPI_CAMERA_CONTRAST, value),
> -				ITERATIONS_SHORT);
> -		break;
> -	case SONY_PIC_COMMAND_SETCAMERAHUE:
> -		wait_on_command(sony_pic_call3(0x90, SONYPI_CAMERA_HUE, value),
> -				ITERATIONS_SHORT);
> -		break;
> -	case SONY_PIC_COMMAND_SETCAMERACOLOR:
> -		wait_on_command(sony_pic_call3(0x90, SONYPI_CAMERA_COLOR, value),
> -				ITERATIONS_SHORT);
> -		break;
> -	case SONY_PIC_COMMAND_SETCAMERASHARPNESS:
> -		wait_on_command(sony_pic_call3(0x90, SONYPI_CAMERA_SHARPNESS, value),
> -				ITERATIONS_SHORT);
> -		break;
> -	case SONY_PIC_COMMAND_SETCAMERAPICTURE:
> -		wait_on_command(sony_pic_call3(0x90, SONYPI_CAMERA_PICTURE, value),
> -				ITERATIONS_SHORT);
> -		break;
> -	case SONY_PIC_COMMAND_SETCAMERAAGC:
> -		wait_on_command(sony_pic_call3(0x90, SONYPI_CAMERA_AGC, value),
> -				ITERATIONS_SHORT);

Hi,

Shouldn't sony_pic_call3() be removed too? AFAICT, all users are gone 
after this removal?

And what about SONYPI_CAMERA_* ? Also SONYPI_DIRECTION_BACKWARDS that is 
among the CAMERA defs seems unused.

-- 
 i.


> -		break;
> -	default:
> -		pr_err("sony_pic_camera_command invalid: %d\n", command);
> -		break;
> -	}
> -	mutex_unlock(&spic_dev.lock);
> -	return 0;
> -}
> -EXPORT_SYMBOL(sony_pic_camera_command);
> -
>  /* gprs/edge modem (SZ460N and SZ210P), thanks to Joshua Wise */
>  static void __sony_pic_set_wwanpower(u8 state)
>  {
> diff --git a/include/linux/sony-laptop.h b/include/linux/sony-laptop.h
> deleted file mode 100644
> index 1e3c92feea6e..000000000000
> --- a/include/linux/sony-laptop.h
> +++ /dev/null
> @@ -1,39 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -#ifndef _SONYLAPTOP_H_
> -#define _SONYLAPTOP_H_
> -
> -#include <linux/types.h>
> -
> -#ifdef __KERNEL__
> -
> -/* used only for communication between v4l and sony-laptop */
> -
> -#define SONY_PIC_COMMAND_GETCAMERA		 1	/* obsolete */
> -#define SONY_PIC_COMMAND_SETCAMERA		 2
> -#define SONY_PIC_COMMAND_GETCAMERABRIGHTNESS	 3	/* obsolete */
> -#define SONY_PIC_COMMAND_SETCAMERABRIGHTNESS	 4
> -#define SONY_PIC_COMMAND_GETCAMERACONTRAST	 5	/* obsolete */
> -#define SONY_PIC_COMMAND_SETCAMERACONTRAST	 6
> -#define SONY_PIC_COMMAND_GETCAMERAHUE		 7	/* obsolete */
> -#define SONY_PIC_COMMAND_SETCAMERAHUE		 8
> -#define SONY_PIC_COMMAND_GETCAMERACOLOR		 9	/* obsolete */
> -#define SONY_PIC_COMMAND_SETCAMERACOLOR		10
> -#define SONY_PIC_COMMAND_GETCAMERASHARPNESS	11	/* obsolete */
> -#define SONY_PIC_COMMAND_SETCAMERASHARPNESS	12
> -#define SONY_PIC_COMMAND_GETCAMERAPICTURE	13	/* obsolete */
> -#define SONY_PIC_COMMAND_SETCAMERAPICTURE	14
> -#define SONY_PIC_COMMAND_GETCAMERAAGC		15	/* obsolete */
> -#define SONY_PIC_COMMAND_SETCAMERAAGC		16
> -#define SONY_PIC_COMMAND_GETCAMERADIRECTION	17	/* obsolete */
> -#define SONY_PIC_COMMAND_GETCAMERAROMVERSION	18	/* obsolete */
> -#define SONY_PIC_COMMAND_GETCAMERAREVISION	19	/* obsolete */
> -
> -#if IS_ENABLED(CONFIG_SONY_LAPTOP)
> -int sony_pic_camera_command(int command, u8 value);
> -#else
> -static inline int sony_pic_camera_command(int command, u8 value) { return 0; }
> -#endif
> -
> -#endif	/* __KERNEL__ */
> -
> -#endif /* _SONYLAPTOP_H_ */
> 
