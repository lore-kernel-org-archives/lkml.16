Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80047376
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 00:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747354418; cv=none; b=lBbFwC3SbhNhqaKnBuBYaX7sZuuiRGFc/JeUx0Igxe2Fn0Hu/V+h/Htjn5wm/IuHa4+ZZYe0n0OIUyMnpdN/ojsbhhPMNK+uEPsU8VVsT4bvFgbKDVHg+xKSiyuhwHS84Dg4siiO5aunHJclb84bh1RMJA0EILVUQBx8BRgLVE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747354418; c=relaxed/simple;
	bh=CGG6jGXMIinSQ0YSIHvn85mnGlEINaaQlo/+CW6AhP8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TCfkTkSU1NTU+RDpwvccfIQRAsbvPmiJ+mIKDsPq82UmU+vVPxj97OV1gqmDNvGJ1oAQj8QsqLKmCGzCvXLr2ny9g+les0VI06csGWGfwT2gKbTv88n14B8j4mGIafAXqvO4gtQ6PU/wzVLVyhwEgv91uVaHM1UXvgPamg6lX7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minyard.net; spf=none smtp.mailfrom=minyard.net; dkim=pass (2048-bit key) header.d=minyard-net.20230601.gappssmtp.com header.i=@minyard-net.20230601.gappssmtp.com header.b=KLt8igYK; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minyard.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=minyard.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=minyard-net.20230601.gappssmtp.com header.i=@minyard-net.20230601.gappssmtp.com header.b="KLt8igYK"
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3fb3f4bf97aso874401b6e.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 17:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minyard-net.20230601.gappssmtp.com; s=20230601; t=1747354414; x=1747959214; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fIQzh+d2Cl2iQMRyzQRgpL9ZV/FSzUS9sLNvNDM8pQA=;
        b=KLt8igYKlyM4HV0pKbdTyuu8GU2D7C05GSikv+1kCHjhbRjIfnBrH6eiXow0kVQE+2
         iqmKyjBINNqHUm106f8ban0PT4YGVbFYw8dQdHmoiQO/e/Z6mF0jsXDrvxwp8zlT1u9k
         Nq34Adlk1yagXoXST9lgb9u6Ml7ltvzA5Wg0h1s1LsP07LsmVUDV/pPIshP5wk2WnjLR
         IOZOzva+6u4q/VQ75UP+a0PnEZdg61bwX4w4Y5DEi9TOi4Pos/nGo8HxNAu24ASrf0lv
         azheBEezhjzj+BJjvjcjRBHXxmIG1lhdStS6JLVbMIInMPSFCPx/IT443V8nVA4Hpw96
         wg0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747354414; x=1747959214;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fIQzh+d2Cl2iQMRyzQRgpL9ZV/FSzUS9sLNvNDM8pQA=;
        b=iIly+U6vN2kZ7EUklshFFewzr5HyTtjDL/RHDq6uGlN0RuvBlhRvyagPulLObebi2l
         Ef9Sqy4enhV7a7fkvvANyTu24htGRUbm2hPsx+/Y9YOo03TjBPZdAnPYUUKyzrHXCd5r
         rRXqDMY5sxobrKSkRliToGYlSpgjTa3V3OkR3igBbRLNqsXQmuNlpBims+5ZgABELEne
         ZCZJi89RnnsxbQG2RSMi0aoLHtHOKrmWEof1AQmXNR4L7iJgnPgjpZZxAFw3/EMwYlr3
         bdXWiUD3VZNe4u02Mvg+cmPyWz7dDre/aztjoN/5X7okyrNywpWG4tmq5vKJPNdkC7vy
         VBeQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNKyAK1mu5IGliYp50D9OUYTsqVz3tD7VejTyhJCAUZhvapNOeI06kx3pVNBDtUftXgkGqqb1POp7QUOA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yze0eAkXksVK7puiaNj+bAtqaVxKDwSCGMdStjpy8i/34Us+oER
	kUC5t+ezKgGzIfEL0XA+dwVGy9nA5KDnKLdneBIJwi66nhQsLazKxaw3iDsNGSVwv6M=
X-Gm-Gg: ASbGncsMV1t9bNYzGiEDDDnWJ3evu9NqMlZOAUh04sBUTNiOF14OMiEn1qwu3csV5+4
	kDqIZUeae/nKSVICnobO7zaVCWqSwGRwLB+gyXs630L+F05u/ZMU+JSDMrr2V6P5uNIIlzvT9cw
	aYa5zGFfbV+IBgMynvo4KfRxy/pottFuGaB0t2QQfYG9dbrm5nhVpfNY0BHA1JNfKIhktD7rpwm
	ppt/qpg37e3nZmRiQwnE7ScXAmX4AW8uVFqQnnzbgeol0gsZ4JIkoQRTzk8FWbiGO+BfBTxTLUW
	XN9Pov/8jPeYlvQ44UVVAGVc7TtvKeZxlX9kErpwrEIoL0QJ0HwNXQ0=
X-Google-Smtp-Source: AGHT+IHw+xOETWTyOT89ZTuJ4/7y2Jcun/+WyMsgKHv9WFHVKeTtE/CECud8o+oMJFlD/SDqIiuTug==
X-Received: by 2002:a05:6808:338c:b0:3f9:2fdc:ee93 with SMTP id 5614622812f47-404d87b897dmr1274677b6e.30.1747354414372;
        Thu, 15 May 2025 17:13:34 -0700 (PDT)
Received: from mail.minyard.net ([2001:470:b8f6:1b:d0c5:1ce0:9035:258c])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-609f2f43884sm188602eaf.15.2025.05.15.17.13.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 17:13:32 -0700 (PDT)
Date: Thu, 15 May 2025 19:13:27 -0500
From: Corey Minyard <corey@minyard.net>
To: Praveen Balakrishnan <praveen.balakrishnan@magd.ox.ac.uk>
Cc: corbet@lwn.net, openipmi-developer@lists.sourceforge.net,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH] docs: ipmi: fix spelling and grammar mistakes
Message-ID: <aCaDJyq18soCNMqa@mail.minyard.net>
Reply-To: corey@minyard.net
References: <20250515234757.19710-1-praveen.balakrishnan@magd.ox.ac.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250515234757.19710-1-praveen.balakrishnan@magd.ox.ac.uk>

On Fri, May 16, 2025 at 12:47:57AM +0100, Praveen Balakrishnan wrote:
> Corrected various spelling and grammatical mistakes in
> Documentation/driver-api/ipmi.rst to improve readability.
> 
> No changes to the technical content has been made.

Thank you, I have added this to my tree.

-corey

> 
> Signed-off-by: Praveen Balakrishnan <praveen.balakrishnan@magd.ox.ac.uk>
> ---
>  Documentation/driver-api/ipmi.rst | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/Documentation/driver-api/ipmi.rst b/Documentation/driver-api/ipmi.rst
> index dfa021eacd63..d9fb2376e8da 100644
> --- a/Documentation/driver-api/ipmi.rst
> +++ b/Documentation/driver-api/ipmi.rst
> @@ -45,7 +45,7 @@ manual), choose the 'IPMI SI handler' option.  A driver also exists
>  for direct I2C access to the IPMI management controller.  Some boards
>  support this, but it is unknown if it will work on every board.  For
>  this, choose 'IPMI SMBus handler', but be ready to try to do some
> -figuring to see if it will work on your system if the SMBIOS/APCI
> +figuring to see if it will work on your system if the SMBIOS/ACPI
>  information is wrong or not present.  It is fairly safe to have both
>  these enabled and let the drivers auto-detect what is present.
>  
> @@ -63,7 +63,7 @@ situation, you need to read the section below named 'The SI Driver' or
>  IPMI defines a standard watchdog timer.  You can enable this with the
>  'IPMI Watchdog Timer' config option.  If you compile the driver into
>  the kernel, then via a kernel command-line option you can have the
> -watchdog timer start as soon as it initializes.  It also have a lot
> +watchdog timer start as soon as it initializes.  It also has a lot
>  of other options, see the 'Watchdog' section below for more details.
>  Note that you can also have the watchdog continue to run if it is
>  closed (by default it is disabled on close).  Go into the 'Watchdog
> @@ -317,13 +317,13 @@ This gives the receiver a place to actually put the message.
>  
>  If the message cannot fit into the data you provide, you will get an
>  EMSGSIZE error and the driver will leave the data in the receive
> -queue.  If you want to get it and have it truncate the message, us
> +queue.  If you want to get it and have it truncate the message, use
>  the IPMICTL_RECEIVE_MSG_TRUNC ioctl.
>  
>  When you send a command (which is defined by the lowest-order bit of
>  the netfn per the IPMI spec) on the IPMB bus, the driver will
>  automatically assign the sequence number to the command and save the
> -command.  If the response is not receive in the IPMI-specified 5
> +command.  If the response is not received in the IPMI-specified 5
>  seconds, it will generate a response automatically saying the command
>  timed out.  If an unsolicited response comes in (if it was after 5
>  seconds, for instance), that response will be ignored.
> @@ -367,7 +367,7 @@ channel bitmasks do not overlap.
>  
>  To respond to a received command, set the response bit in the returned
>  netfn, use the address from the received message, and use the same
> -msgid that you got in the receive message.
> +msgid that you got in the received message.
>  
>  From userland, equivalent IOCTLs are provided to do these functions.
>  
> @@ -440,7 +440,7 @@ register would be 0xca6.  This defaults to 1.
>  
>  The regsizes parameter gives the size of a register, in bytes.  The
>  data used by IPMI is 8-bits wide, but it may be inside a larger
> -register.  This parameter allows the read and write type to specified.
> +register.  This parameter allows the read and write type to be specified.
>  It may be 1, 2, 4, or 8.  The default is 1.
>  
>  Since the register size may be larger than 32 bits, the IPMI data may not
> @@ -481,8 +481,8 @@ If your IPMI interface does not support interrupts and is a KCS or
>  SMIC interface, the IPMI driver will start a kernel thread for the
>  interface to help speed things up.  This is a low-priority kernel
>  thread that constantly polls the IPMI driver while an IPMI operation
> -is in progress.  The force_kipmid module parameter will all the user to
> -force this thread on or off.  If you force it off and don't have
> +is in progress.  The force_kipmid module parameter will allow the user
> +to force this thread on or off.  If you force it off and don't have
>  interrupts, the driver will run VERY slowly.  Don't blame me,
>  these interfaces suck.
>  
> @@ -583,7 +583,7 @@ kernel command line as::
>  These are the same options as on the module command line.
>  
>  The I2C driver does not support non-blocking access or polling, so
> -this driver cannod to IPMI panic events, extend the watchdog at panic
> +this driver cannot do IPMI panic events, extend the watchdog at panic
>  time, or other panic-related IPMI functions without special kernel
>  patches and driver modifications.  You can get those at the openipmi
>  web page.
> @@ -610,7 +610,7 @@ Parameters are::
>  	ipmi_ipmb.retry_time_ms=<Time between retries on IPMB>
>  	ipmi_ipmb.max_retries=<Number of times to retry a message>
>  
> -Loading the module will not result in the driver automatcially
> +Loading the module will not result in the driver automatically
>  starting unless there is device tree information setting it up.  If
>  you want to instantiate one of these by hand, do::
>  
> -- 
> 2.39.5
> 
