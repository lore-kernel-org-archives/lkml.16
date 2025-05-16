Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C1B2114;
	Fri, 16 May 2025 00:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747355773; cv=none; b=j9VopZsb/2pcIsedJVFn+9XXabLaungJ9wtXyYZTLmZf/GhSERPLJEkhvc9ZqR5u+t7BzRKYJxqzrv1go3UAMT5tSzCXq0tC/YyWAzzKD2VgJUUP1meCoDcD4xwPM8UVy/rOYlYfFe/NVIDUWo98oRzoZFlESxT4mDEEiCjJDaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747355773; c=relaxed/simple;
	bh=rGRI7pv9FOnDN5ARj/451B9SqwqBg+xlKaVmt3lL+Uk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dUAPceRx2uY8AcdyQStHIJCtF9XKFdw5naIQMCN2fNHdstl/5qU8140+mJHv1WNxziCiWmvFJZ5bS2Hhv57fKgNsC3SgzDRkZXsryiPXHjfLUvT6tD2D7bhFhuJW4Mp2gewTnTxzXCE+/gXD/PUOl8Z+ZIIJG1sWek1/F7ixO54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=SVglxsZe; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="SVglxsZe"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=p3TP/VPMxxlEonz02VIawXMvSXarvt5nx0vp3mbv6Z4=; b=SVglxsZee/njbichUMAoYWcZUJ
	WrDx1MfXZ1iX19DCOZPzCu2YsVGZZpMkXyDVdoJ7L6Qgk+38RrS5PNzr2JDwat2ZhyBA4UOP+/LG5
	t9OfOft7yKTBzPXbHe8ZLJQmTqDsiJkOAebombxkUaFBqlb84FquCOB6evC8mgkIiD9ojt6eBMn8m
	F0gCPWkdsKnMRwR2Wh+FeX2cRZtS+l/hVgMN2rkAOHy68HGqryiFrkv/kR0/QFs/LpT+bYopZ9KqE
	YV8mCQmx8hgtth6W+XPgVnVXZ+/2M3EVVns3vwbsYuK4CLL6868A52dsB51AVCWVf1yIIPVnwHaIg
	M/cui+tg==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uFj3O-000000000s6-3vup;
	Fri, 16 May 2025 00:36:01 +0000
Message-ID: <5baa0fc5-bdb4-45bc-a986-171fa440e2e5@infradead.org>
Date: Thu, 15 May 2025 17:35:55 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: ipmi: fix spelling and grammar mistakes
To: Praveen Balakrishnan <praveen.balakrishnan@magd.ox.ac.uk>,
 corey@minyard.net, corbet@lwn.net
Cc: openipmi-developer@lists.sourceforge.net, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linux.dev
References: <20250515234757.19710-1-praveen.balakrishnan@magd.ox.ac.uk>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250515234757.19710-1-praveen.balakrishnan@magd.ox.ac.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/15/25 4:47 PM, Praveen Balakrishnan wrote:
> Corrected various spelling and grammatical mistakes in
> Documentation/driver-api/ipmi.rst to improve readability.
> 
> No changes to the technical content has been made.
> 
> Signed-off-by: Praveen Balakrishnan <praveen.balakrishnan@magd.ox.ac.uk>

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

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

-- 
~Randy
