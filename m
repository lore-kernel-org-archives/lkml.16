Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 463CE1E32CB
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 16:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738341785; cv=none; b=peGhddBGdxzyTGj7L0ddOjDExVJ5rKOQNm17HKyIV0KR3T0l3B/S6e+EFysroGHtQZcticrC3JP98o8kUWvIARM9i5NP1E+5yPdwh9s6VJ9ExGqbmGeiJi5itCmz6WCgBaksVctiIVJWp0kXkt9JTAEUxWmKfvDwE+6SvfK6mfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738341785; c=relaxed/simple;
	bh=Gw6un6QFhyuRHc9+r/O64HTuxDACa3AB5y9V9jrqCP8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=stBJcJFqFwfVwLP/WoX4vh15UCMgQ9BRRpr8Bwn82wmzHwlWkXHOTY2r1xNglwvKa2RugOBfsLR0TLjx0r0yE7r/McAaHGHyBvxDPagSt9YtxHw1ktPyqQ0Bh/zhHiR8z7VVOMgzgUZlHLgLem4SOcI2wqkfqNh/+eIw3e3w9Us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=TUpmzuzk; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="TUpmzuzk"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43624b2d453so26223125e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 08:43:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1738341782; x=1738946582; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HKRgmMqYetFLOTNxQobFBr8LDNPgSKXjFfYEQCH8i8o=;
        b=TUpmzuzk9PdZoNiMOOigaOK9zA+Fb3RKjw/sk0PNvXoW+iqKvP5S/sTR12CMQMgU54
         VCpFNboOhWWSEcfbD9irho4658FVK8XCuh5nUb1qGC+wWYxk23sn5D9Mm3ypptPwlhFn
         cOfQ1nix4+OFf8ou12ziIz68LOIVjO1b8SIhI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738341782; x=1738946582;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HKRgmMqYetFLOTNxQobFBr8LDNPgSKXjFfYEQCH8i8o=;
        b=OftQpvR/OeFryQ9rTjvT9//jsHLNIXc1h1U/WTQarwp6Hy4nk2uIIytEusgdRzEum0
         zq074fLPVkfrxNYDxXFP4y0cp9jy9GmT5IFcgGIg8bLumPj82Zyq3Tnugh1QdX9B/bDv
         yGv7YAIgClNOJGRCrJzAJSR/l3L1N72eUiWm6+5QJKgiZlO0dmr+YAYuFu+aSNQBxS+u
         LcWqZCRlQkT/9G2oJ0DhTf0BecLGtwm4xH/122s51GJplTxXozNSwstkoib7htMyQi9s
         nqMPoxqiCDJOlsWhW/ojsbsfGC0syOB6HJto90kiAzon4Zq/VKnEYqSAE8OB0dyXox7F
         wasA==
X-Forwarded-Encrypted: i=1; AJvYcCUTbqScVYnNeCXGramtLAZyouNW0qqSjK4cTRWVfJrhhKjeVak0tC+uXJur6hCVLGsRILMFMn+1ISyMs0k=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHZoEUYKW5aoqytBwGiSHkmvZrTwdxIPxfyIH+ablRdaLukYOa
	sCSffeXEAFUDLeGzVhFwlVI3JTl2haVcfoF2cR2HwQC+mhkAF958RnPRBBw6lzo=
X-Gm-Gg: ASbGncu5RlSVTwCwgx7y23WcZ1vW7vjWmNhgv+pwGAUsSSDpwp2g3zTocHv9lNCTYeO
	mDSkDudMvpkibzvSRrQL1dSHfDFamWjN13VcNbCjQGJMvpWrp97wEGoNSv5Wfgy28gjq+e2Soqf
	l8F3VxPcrgyUhyn5+wwuylhUMRW5v3vDu9vzTRH+af96t7yFgX+ow47KkjBoxgNGZSz6xS8fN87
	/oKgQscLj2ivvI4uVUjMluaEUYpQ215jWMdb4VbEq3V1n8FgKcvpSaeWi9oGJh0pwplMiCh4pa/
	KoDOYXy34W6MHF5Jdfin8qKkznc=
X-Google-Smtp-Source: AGHT+IESRJvdEj0rBE2ZxrV7whbVWvwLzMQaF6F6GRU1uVTbFe6LW02Yng6iUd1fM4OWkAg8f7zEVw==
X-Received: by 2002:a05:600c:5486:b0:431:5c3d:1700 with SMTP id 5b1f17b1804b1-438dc40d3fdmr115932755e9.21.1738341782253;
        Fri, 31 Jan 2025 08:43:02 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c1cf40asm5052428f8f.83.2025.01.31.08.43.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 08:43:01 -0800 (PST)
Date: Fri, 31 Jan 2025 17:42:59 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Lyude Paul <lyude@redhat.com>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Zijun Hu <quic_zijuhu@quicinc.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Lukas Wunner <lukas@wunner.de>, Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH] WIP: drivers/base: Add virtual_device_create()
Message-ID: <Z5z9kxIKMhU6KGcf@phenom.ffwll.local>
Mail-Followup-To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lyude Paul <lyude@redhat.com>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Zijun Hu <quic_zijuhu@quicinc.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Lukas Wunner <lukas@wunner.de>, Bjorn Helgaas <bhelgaas@google.com>
References: <Z5Nw8kaieLueWyUu@pollux>
 <20250130212843.659437-1-lyude@redhat.com>
 <2025013159-shabby-professor-515b@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025013159-shabby-professor-515b@gregkh>
X-Operating-System: Linux phenom 6.12.11-amd64 

On Fri, Jan 31, 2025 at 09:00:32AM +0100, Greg Kroah-Hartman wrote:
> On Thu, Jan 30, 2025 at 04:28:26PM -0500, Lyude Paul wrote:
> > As Greg KH pointed out, we have a nice /sys/devices/virtual directory free
> > for the taking - but the vast majority of device drivers concerned with
> > virtual devices do not use this and instead misuse the platform device API.
> > 
> > To fix this, let's start by adding a simple function that can be used for
> > creating virtual devices - virtual_device_create().
> > 
> > Signed-off-by: Lyude Paul <lyude@redhat.com>
> > 
> > ---
> > 
> > So, WIP obviously because I wrote this up in a few minutes - but this goes
> > off the idea that Danilo suggested to me off-list of coming up with a
> > simple API for handling virtual devices that's a little more obvious to
> > use. I wanted to get people's feedback and if we're happy with this idea,
> > I'm willing to go through and add some pointers to this function in various
> > platform API docs - along with porting over the C version of VKMS over to
> > this API.
> 
> This is a big better, but not quite.  Let me carve out some time today
> to knock something a bit nicer together...

Yeah I think a really simple api for creating virtual devices would be
nice. We've definitely been abusing platform devices for that purpose too,
and I had no idea virtual devices even exist :-/
-Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
