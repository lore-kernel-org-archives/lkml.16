Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFC166136;
	Mon,  5 May 2025 15:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746458837; cv=none; b=Bt/JjYHCWUBd5DaMO1rRHsZLkA4OXy+OkTyKum7gY0RGB/DcusaJWsd5vC9NfhgzmUKEHUOn1Xzvp/9BJXItBcG77G8vlEnFJVAuWeu75IVsAmv/aqYr/Xp6Nx3Wi4eLD9+r5LKkT4BM6SkAyQi05PZpqzyUAhLLjXZnbq/KPFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746458837; c=relaxed/simple;
	bh=QfypFRiO0wYweEhw+WJRV8IIwwOcXNM3eHLcqLcmj4I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dm7uGOQXcFhptLogM+w2PB9nNjydoPRKQKa4FKBXo2+5+CQxq4ZPodE2cMuBHL2qRgjWrvjfpIFJnfVADxGaN8+IK40oGiDYLxiInFqrf1N7rzkPvjrFx/A8bggkv/CFSCGCCIzZiduSavE7VAx9jIvLM8CjJ4WLhVbWvMYnOrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=LwWW1X+u; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="LwWW1X+u"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
	:Subject; bh=uJPiWQMB1HfcvEVN6Ei74SaXaoGtJv6b2u7SOhtjNbc=; b=LwWW1X+u2UcI7hXk
	Uuj535ml45wJxt0hzIqiBZ96qaVRz0hhPpExQbDywXumQ7WGQebTCe92AIuAEXa5h9hNcR95rT4yt
	xlb4D36BjhumAzqYa4cSV4KHX3NH4SSM/lY9gL5ueG+la7VGkqZk4MQsy37WqUz/18OIW3N2p+6of
	lkGO6F/rbIQcnTqI0IzrySm9B0YC5ET8XuJrFjhcgzNAarUML7BGs3NHupLpdd1d950hvT89VHQLz
	fTsw5z4e3D0nGwHWVSWCW4G70H2O5PwdIvE+rlkWvx5QvXIa8O/bQ5rJnycBnia9nVYZ400z6godo
	FW25ClXGS0sud01EJA==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
	(envelope-from <dg@treblig.org>)
	id 1uBxij-001Swz-1M;
	Mon, 05 May 2025 15:27:05 +0000
Date: Mon, 5 May 2025 15:27:05 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: malattia@linux.it, Hans de Goede <hdegoede@redhat.com>,
	hverkuil@xs4all.nl, platform-driver-x86@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] platform/x86/sony-laptop: Remove unused sony laptop
 camera code
Message-ID: <aBjYyY26SEsIH88Q@gallifrey>
References: <20250505005539.336183-1-linux@treblig.org>
 <bbd883e2-7615-c37b-3a6a-acddd76bf3ad@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bbd883e2-7615-c37b-3a6a-acddd76bf3ad@linux.intel.com>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-34-amd64 (x86_64)
X-Uptime: 15:26:07 up 7 days, 23:39,  1 user,  load average: 0.02, 0.04, 0.00
User-Agent: Mutt/2.2.12 (2023-09-09)

* Ilpo Järvinen (ilpo.jarvinen@linux.intel.com) wrote:
> On Mon, 5 May 2025, linux@treblig.org wrote:
> 
> > From: "Dr. David Alan Gilbert" <linux@treblig.org>
> > 
> > commit ba47652ba655 ("media: meye: remove this deprecated driver")
> > removed the meye driver but left behind the code in sony-laptop.c
> > which that driver used to call.
> > 
> > Remove the sony_pic_camera_command() function, and the set of
> > defines (SONY_PIC_COMMAND_*) in a header used for the interface
> > and the static helpers it called.
> > 
> > Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> > ---
> >  MAINTAINERS                        |   1 -
> >  drivers/platform/x86/sony-laptop.c | 135 -----------------------------
> >  include/linux/sony-laptop.h        |  39 ---------
> >  3 files changed, 175 deletions(-)
> >  delete mode 100644 include/linux/sony-laptop.h
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 2aed76827090..6c865b5d8fae 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -22671,7 +22671,6 @@ W:	http://www.linux.it/~malattia/wiki/index.php/Sony_drivers
> >  F:	Documentation/admin-guide/laptops/sony-laptop.rst
> >  F:	drivers/char/sonypi.c
> >  F:	drivers/platform/x86/sony-laptop.c
> > -F:	include/linux/sony-laptop.h
> >  
> >  SOPHGO DEVICETREES and DRIVERS
> >  M:	Chen Wang <unicorn_wang@outlook.com>
> > diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
> > index b52390fbd743..4efd0d7031a5 100644
> > --- a/drivers/platform/x86/sony-laptop.c
> > +++ b/drivers/platform/x86/sony-laptop.c
> > @@ -48,7 +48,6 @@
> >  #include <linux/acpi.h>
> >  #include <linux/slab.h>
> >  #include <linux/sonypi.h>
> > -#include <linux/sony-laptop.h>
> >  #include <linux/rfkill.h>
> >  #ifdef CONFIG_SONYPI_COMPAT
> >  #include <linux/poll.h>
> > @@ -3619,22 +3618,6 @@ static u8 sony_pic_call2(u8 dev, u8 fn)
> >  	return v1;
> >  }
> >  
> > -static u8 sony_pic_call3(u8 dev, u8 fn, u8 v)
> > -{
> > -	u8 v1;
> > -
> > -	wait_on_command(inb_p(spic_dev.cur_ioport->io1.minimum + 4) & 2, ITERATIONS_LONG);
> > -	outb(dev, spic_dev.cur_ioport->io1.minimum + 4);
> > -	wait_on_command(inb_p(spic_dev.cur_ioport->io1.minimum + 4) & 2, ITERATIONS_LONG);
> > -	outb(fn, spic_dev.cur_ioport->io1.minimum);
> > -	wait_on_command(inb_p(spic_dev.cur_ioport->io1.minimum + 4) & 2, ITERATIONS_LONG);
> > -	outb(v, spic_dev.cur_ioport->io1.minimum);
> > -	v1 = inb_p(spic_dev.cur_ioport->io1.minimum);
> > -	dprintk("sony_pic_call3(0x%.2x - 0x%.2x - 0x%.2x): 0x%.4x\n",
> > -			dev, fn, v, v1);
> > -	return v1;
> > -}
> > -
> >  /*
> >   * minidrivers for SPIC models
> >   */
> > @@ -3754,124 +3737,6 @@ static void sony_pic_detect_device_type(struct sony_pic_dev *dev)
> >  #define SONYPI_CAMERA_REVISION 			8
> >  #define SONYPI_CAMERA_ROMVERSION 		9
> >  
> > -static int __sony_pic_camera_ready(void)
> > -{
> > -	u8 v;
> > -
> > -	v = sony_pic_call2(0x8f, SONYPI_CAMERA_STATUS);
> > -	return (v != 0xff && (v & SONYPI_CAMERA_STATUS_READY));
> > -}
> > -
> > -static int __sony_pic_camera_off(void)
> > -{
> > -	if (!camera) {
> > -		pr_warn("camera control not enabled\n");
> > -		return -ENODEV;
> > -	}
> > -
> > -	wait_on_command(sony_pic_call3(0x90, SONYPI_CAMERA_PICTURE,
> > -				SONYPI_CAMERA_MUTE_MASK),
> > -			ITERATIONS_SHORT);
> > -
> > -	if (spic_dev.camera_power) {
> > -		sony_pic_call2(0x91, 0);
> > -		spic_dev.camera_power = 0;
> > -	}
> > -	return 0;
> > -}
> > -
> > -static int __sony_pic_camera_on(void)
> > -{
> > -	int i, j, x;
> > -
> > -	if (!camera) {
> > -		pr_warn("camera control not enabled\n");
> > -		return -ENODEV;
> > -	}
> > -
> > -	if (spic_dev.camera_power)
> > -		return 0;
> > -
> > -	for (j = 5; j > 0; j--) {
> > -
> > -		for (x = 0; x < 100 && sony_pic_call2(0x91, 0x1); x++)
> > -			msleep(10);
> > -		sony_pic_call1(0x93);
> > -
> > -		for (i = 400; i > 0; i--) {
> > -			if (__sony_pic_camera_ready())
> > -				break;
> > -			msleep(10);
> > -		}
> > -		if (i)
> > -			break;
> > -	}
> > -
> > -	if (j == 0) {
> > -		pr_warn("failed to power on camera\n");
> > -		return -ENODEV;
> > -	}
> > -
> > -	wait_on_command(sony_pic_call3(0x90, SONYPI_CAMERA_CONTROL,
> > -				0x5a),
> > -			ITERATIONS_SHORT);
> > -
> > -	spic_dev.camera_power = 1;
> > -	return 0;
> > -}
> > -
> > -/* External camera command (exported to the motion eye v4l driver) */
> > -int sony_pic_camera_command(int command, u8 value)
> > -{
> > -	if (!camera)
> > -		return -EIO;
> > -
> > -	mutex_lock(&spic_dev.lock);
> > -
> > -	switch (command) {
> > -	case SONY_PIC_COMMAND_SETCAMERA:
> > -		if (value)
> > -			__sony_pic_camera_on();
> > -		else
> > -			__sony_pic_camera_off();
> > -		break;
> > -	case SONY_PIC_COMMAND_SETCAMERABRIGHTNESS:
> > -		wait_on_command(sony_pic_call3(0x90, SONYPI_CAMERA_BRIGHTNESS, value),
> > -				ITERATIONS_SHORT);
> > -		break;
> > -	case SONY_PIC_COMMAND_SETCAMERACONTRAST:
> > -		wait_on_command(sony_pic_call3(0x90, SONYPI_CAMERA_CONTRAST, value),
> > -				ITERATIONS_SHORT);
> > -		break;
> > -	case SONY_PIC_COMMAND_SETCAMERAHUE:
> > -		wait_on_command(sony_pic_call3(0x90, SONYPI_CAMERA_HUE, value),
> > -				ITERATIONS_SHORT);
> > -		break;
> > -	case SONY_PIC_COMMAND_SETCAMERACOLOR:
> > -		wait_on_command(sony_pic_call3(0x90, SONYPI_CAMERA_COLOR, value),
> > -				ITERATIONS_SHORT);
> > -		break;
> > -	case SONY_PIC_COMMAND_SETCAMERASHARPNESS:
> > -		wait_on_command(sony_pic_call3(0x90, SONYPI_CAMERA_SHARPNESS, value),
> > -				ITERATIONS_SHORT);
> > -		break;
> > -	case SONY_PIC_COMMAND_SETCAMERAPICTURE:
> > -		wait_on_command(sony_pic_call3(0x90, SONYPI_CAMERA_PICTURE, value),
> > -				ITERATIONS_SHORT);
> > -		break;
> > -	case SONY_PIC_COMMAND_SETCAMERAAGC:
> > -		wait_on_command(sony_pic_call3(0x90, SONYPI_CAMERA_AGC, value),
> > -				ITERATIONS_SHORT);
> 
> Hi,

Hi Ilpo,
  Thanks for the quick review,

> Shouldn't sony_pic_call3() be removed too? AFAICT, all users are gone 
> after this removal?

That one is already gone - see right at the top of the patch.

> And what about SONYPI_CAMERA_* ? Also SONYPI_DIRECTION_BACKWARDS that is 
> among the CAMERA defs seems unused.

Ah right, OK - I've deleted those in a v2; see message
  20250505152558.40526-1-linux@treblig.org

Thanks again,

Dave

> -- 
>  i.
> 
> 
> > -		break;
> > -	default:
> > -		pr_err("sony_pic_camera_command invalid: %d\n", command);
> > -		break;
> > -	}
> > -	mutex_unlock(&spic_dev.lock);
> > -	return 0;
> > -}
> > -EXPORT_SYMBOL(sony_pic_camera_command);
> > -
> >  /* gprs/edge modem (SZ460N and SZ210P), thanks to Joshua Wise */
> >  static void __sony_pic_set_wwanpower(u8 state)
> >  {
> > diff --git a/include/linux/sony-laptop.h b/include/linux/sony-laptop.h
> > deleted file mode 100644
> > index 1e3c92feea6e..000000000000
> > --- a/include/linux/sony-laptop.h
> > +++ /dev/null
> > @@ -1,39 +0,0 @@
> > -/* SPDX-License-Identifier: GPL-2.0 */
> > -#ifndef _SONYLAPTOP_H_
> > -#define _SONYLAPTOP_H_
> > -
> > -#include <linux/types.h>
> > -
> > -#ifdef __KERNEL__
> > -
> > -/* used only for communication between v4l and sony-laptop */
> > -
> > -#define SONY_PIC_COMMAND_GETCAMERA		 1	/* obsolete */
> > -#define SONY_PIC_COMMAND_SETCAMERA		 2
> > -#define SONY_PIC_COMMAND_GETCAMERABRIGHTNESS	 3	/* obsolete */
> > -#define SONY_PIC_COMMAND_SETCAMERABRIGHTNESS	 4
> > -#define SONY_PIC_COMMAND_GETCAMERACONTRAST	 5	/* obsolete */
> > -#define SONY_PIC_COMMAND_SETCAMERACONTRAST	 6
> > -#define SONY_PIC_COMMAND_GETCAMERAHUE		 7	/* obsolete */
> > -#define SONY_PIC_COMMAND_SETCAMERAHUE		 8
> > -#define SONY_PIC_COMMAND_GETCAMERACOLOR		 9	/* obsolete */
> > -#define SONY_PIC_COMMAND_SETCAMERACOLOR		10
> > -#define SONY_PIC_COMMAND_GETCAMERASHARPNESS	11	/* obsolete */
> > -#define SONY_PIC_COMMAND_SETCAMERASHARPNESS	12
> > -#define SONY_PIC_COMMAND_GETCAMERAPICTURE	13	/* obsolete */
> > -#define SONY_PIC_COMMAND_SETCAMERAPICTURE	14
> > -#define SONY_PIC_COMMAND_GETCAMERAAGC		15	/* obsolete */
> > -#define SONY_PIC_COMMAND_SETCAMERAAGC		16
> > -#define SONY_PIC_COMMAND_GETCAMERADIRECTION	17	/* obsolete */
> > -#define SONY_PIC_COMMAND_GETCAMERAROMVERSION	18	/* obsolete */
> > -#define SONY_PIC_COMMAND_GETCAMERAREVISION	19	/* obsolete */
> > -
> > -#if IS_ENABLED(CONFIG_SONY_LAPTOP)
> > -int sony_pic_camera_command(int command, u8 value);
> > -#else
> > -static inline int sony_pic_camera_command(int command, u8 value) { return 0; }
> > -#endif
> > -
> > -#endif	/* __KERNEL__ */
> > -
> > -#endif /* _SONYLAPTOP_H_ */
> > 
> 
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/
