Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4209B18FC92
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 17:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743789079; cv=none; b=Dm8jU7Bd20VA03H1o5XNyKVm5wC6KzPpr0WMVUuO46xakzivv8LJorT6NWLHfHehWrkQP8joaQZ7oWd6G8oIZhS5jBezASCdbgRNUbtBsdgZXrtMH1xLxQZeGw5Yc4YQr0kBqcWdXvLr9HgCRu1tp7DAjPAHAX9oV7Lj72YzgWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743789079; c=relaxed/simple;
	bh=E8qASIkuqS+UHYppgECeHxBVXmF4MW92oRTu4RV4bF8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FOoYhpbmSrj4MkEMrFtLcQRlvyLO9EHK8zo71CGA8fbz6X5ja4NLOKLqP5Q2gFcG0lgr0JAWvWcFYx1HN/MUivab/0cRsrjB5jWUdiIb3GXPWSWufK73dzp2V0VPmRBVOR4GdRsiDnc4PsLf7p3vsYvwnpJTMAxUxCaQDyD2ThU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=dpnETJ2z; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=+/8yR/Gj; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="dpnETJ2z";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="+/8yR/Gj"
Date: Fri, 4 Apr 2025 19:51:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1743789076;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=roPg+Rq5sWXxVItWSgRbmJ2vThb05jD5xeVljY49TuI=;
	b=dpnETJ2zs+ZaNCdymm8AwYGx5ZnVpX6wjw3Yf7LpAKhc2jyC0tN+jSpS5bAXZSwCbTYDcD
	ynT9WF5WgSLQUg06l6zj93xfVpBS3+qM3mP2kqF9VT+m48bktPxo9Tro0ficosCTSYwTvA
	MK3A0ojETSYn/kaWvxFqjcKihemg4lrVGa9iS6Qrq9QlaHATyKVUvGdVx/EUybc3f2xVX4
	rt7C2KjxI4riaAuyljnfryzolE1eJPCe+DKuyCR4bfUV3QUN6RbjPrbp9COCcj+yGLQY4z
	TMoiu18YtTUzhfAOTpTKGkt+iWfLVwYVky0NaF3EOg9FoyGdw0nnmKZi20dKxg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1743789076;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=roPg+Rq5sWXxVItWSgRbmJ2vThb05jD5xeVljY49TuI=;
	b=+/8yR/GjPCgFYlT6pXCAnKbsXmWmBwh6xiYvFyJIHlVKXYZcPb2TPI8VI6CgSM0qCOk5or
	is0NcfMXcD2bovDQ==
From: Nam Cao <namcao@linutronix.de>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	x86@kernel.org, Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [tip:timers/cleanups 2/10]
 drivers/pps/generators/pps_gen_tio.c:230:9: error: implicit declaration of
 function 'hrtimer_init'; did you mean 'hrtimers_init'?
Message-ID: <20250404175115.6lAXZLAX@linutronix.de>
References: <202504050126.K62Di5RY-lkp@intel.com>
 <20250404174855.MPAaPNjT@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250404174855.MPAaPNjT@linutronix.de>

On Fri, Apr 04, 2025 at 07:48:56PM +0200, Nam Cao wrote:
> This new user of hrtimer_init() was recently added by c89755d1111f ("pps:
> generators: Add PPS Generator TIO Driver").
> 
> git grep shows me there's also bf3624cf1c370 ("netdevsim: call
> napi_schedule from a timer context") adding another hrtimer_init().
> 
> I will send patches converting them over to hrtimer_setup()

Never mind, I see you have already fixed it up.

Best regards,
Nam
