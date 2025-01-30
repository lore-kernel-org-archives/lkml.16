Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2869192D87
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 19:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738265990; cv=none; b=EG5H79HVCVH+MPGwJbsz4rbMUI5OSXptPpsVXPLUF/LOCDYTm9KgU4sA+Qmdbq0PeZjv32rQOfndrO3uLoX3MOadymTH/PnD/HtrHaFXyzZ5UYs8983vCIbxohsu23FxPZ2yNDH4PUhT6ULhTLKTvK/TF0Bxokn2OMl5z/Cvg3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738265990; c=relaxed/simple;
	bh=DzlC+X0WZW0niB4gvbmLbEseL93wg5RUoZ89xtMXXj8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Kf38aFb8cbxnHZyYwARKgUjylM6bVL5Lpv8tRNUJNKIpC4GAj45L/9PnUUFC8Zt8pJUu4LoS+Bugt/i7r3lalwtBS2rkKmaxDNJsRZlVj6WzNdxZB9HSfaJC8R1+8BlTKenW+mBrGcLEi0o2jLlQni64VCm94D77ygylJTRfJes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ms0zfubG; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ms0zfubG"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4368a293339so13995245e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 11:39:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738265987; x=1738870787; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fbrBbtetW+eFSRSujFwF+D0y+0c8n01YuDApoGFtoHM=;
        b=ms0zfubGYPRZ8gvE+yA7fT2uiWiLW7YeoJgpQXtoyh26vD0Y+YcsaAUW8mvFhC706t
         /r9mUr3pnPW+yQjewZj5OtHrD72av7076sO5O+0764aZFQH5YDG347qL4dbbnKXOTJ2e
         tOY9aodzxck4klu5XaJRGWMLyecK8CVbaE+GGGtIn8AW3o44obXhWM9Yt/YWVFzWBraR
         KL0T1tebyk4RUQgyZD8N2ygpQZWio0v8gdZMUHdbqx7pPWh/U1GpGzunfqkwF3luE+W7
         rejXvmtZEmR0dgZcd8ttdKGqyDzoSwG/YWmwsW1qm/zGdKEEd9EHbOC0/g2QMumTjPc+
         ZGNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738265987; x=1738870787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fbrBbtetW+eFSRSujFwF+D0y+0c8n01YuDApoGFtoHM=;
        b=K8AotJAbcMyDFvPjkSPqSmSh+JnRNsOvvQEtxHotG6JUBzPUHf+1gC5EIgsTWDVWZm
         nJ6XZfzkhAhv6OPowV3aCaEiNqd2ocRLfv6gsK5FddwMh77ByHs0nB+oxv+MAJqSut0+
         0nyhjiHHH415sFYsaM7ysELK6bWW6e0VCDvh8DYFPkCgOJ/HFB1oQ1pRSRFP+sxOuMXQ
         xrlORJ2YuBV0Fdosttef3r0zk9pKVBGevYYTPJwc9ExsV19nK7lxjY4Hga3IIu6an6SW
         SnBGynWQvntyjUBvxVlnx0ce/Gw2AWfo19pVmQ6VMdCKm33lHI9XxbKoC/VTdxZh9Ctt
         b1iA==
X-Forwarded-Encrypted: i=1; AJvYcCWJdPNSidP0qBXa75mVYaDxNjTr72vC7Dv27mHQqf0z8dVep8U/rFFdjEYm3iucOwkFKpznt5Fnz8kOGF8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0LM5z/LU+iV3MTbMnnbh8U4bnKDuPqWdm+bTrk2b5TijF6fJx
	JLBz3eM9ZX0+H4JceZvIdupsSINIAzBpMDQ5avvCgpk7Ci8AEKdB
X-Gm-Gg: ASbGncvDFHuUbes7At0Z8vBlFtgH1Bn4GDqBQvPhbuo2hPx6002zuXTQk4YuIwqCSG4
	CuJI7xtmM4zZkLNAnWL9m3phQIRkUV/02UilsoLT5kMzDs2jrUUtXoOT9FwrThFU+sYDRVYbKdu
	oKoE6E/3ZCHEkRtdL+VdTQH3F2ViRpxvLChAp8UWDGaYgksHbzI5Fg4aVtF7IvFLGy+kuMPd9X4
	k/XFOj1Y31g9w9bFSv7fYmyAU/IJcVSLmY/rJEfbIfABQaC7HybXX4mbNW5cUTffVFRPpNyzK78
	BLZxXIyVd5Q6eNW4J+/hxYiRWOgHdo+kaNizHlewYo1EZjhK4MxlfA==
X-Google-Smtp-Source: AGHT+IH+dsWzoPqJ1FZkEn31AznVDwohTc/WMVbBodZ7oPmqAAzLBa26jUpO3bFpM05kGf7eu9Dy3w==
X-Received: by 2002:a05:600c:3501:b0:434:a7e3:db5c with SMTP id 5b1f17b1804b1-438e2446708mr43887285e9.11.1738265986805;
        Thu, 30 Jan 2025 11:39:46 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438dcc2ede0sm68629125e9.21.2025.01.30.11.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 11:39:46 -0800 (PST)
Date: Thu, 30 Jan 2025 19:39:44 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: lkft-triage@lists.linaro.org, open list <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>, Linux ARM
 <linux-arm-kernel@lists.infradead.org>, David Laight
 <david.laight@aculab.com>, Arnd Bergmann <arnd@arndb.de>, Dan Carpenter
 <dan.carpenter@linaro.org>, Anders Roxell <anders.roxell@linaro.org>, Ankit
 Nautiyal <ankit.k.nautiyal@intel.com>, Suraj Kandpal
 <suraj.kandpal@intel.com>
Subject: Re: linux: master: x86_64: gcc-8: error: call to
 '__compiletime_assert_909' declared with attribute error: clamp() low limit
 dsc_min_bpc * 3 greater than high limit dsc_max_bpc * 3
Message-ID: <20250130193944.478cae8f@pumpkin>
In-Reply-To: <CA+G9fYtNfM399_=_ff81zeRJv=0+z7oFJfPGmJgTp6yrJmU+1w@mail.gmail.com>
References: <CA+G9fYtNfM399_=_ff81zeRJv=0+z7oFJfPGmJgTp6yrJmU+1w@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 30 Jan 2025 15:01:21 +0530
Naresh Kamboju <naresh.kamboju@linaro.org> wrote:

> The x86_64 and i386 build failed with defconfig with gcc-8 toolchain due to
> following build warnings / errors on the Torvalds Linux master branch.
> But gcc-13 builds pass.
> 
> First seen on v6.13-9485-g72deda0abee6 on Jan. 27, 2025
> Good:  v6.13-7644-gc2da8b3f914f on Jan. 27, 2025
> Bad:  v6.13-8265-g9c5968db9e62 on Jan. 27, 2025
> 
> i386:
>   build:
>     * gcc-8-i386_defconfig
> 
> x86_64:
>   build:
>     * gcc-8-x86_64_defconfig
> 
> Reported-by: Linux Kernel Functional Testing
> 
> Build log:
> ---
> make --silent --keep-going --jobs=8
> O=/home/tuxbuild/.cache/tuxmake/builds/1/build ARCH=x86_64 SRCARCH=x86
> CROSS_COMPILE=x86_64-linux-gnu- 'CC=sccache x86_64-linux-gnu-gcc'
> 'HOSTCC=sccache gcc'
> In file included from <command-line>:
> In function 'intel_dp_dsc_compute_pipe_bpp_limits.isra.80',
>     inlined from 'intel_dp_compute_config_limits' at
> drivers/gpu/drm/i915/display/intel_dp.c:2547:3:
> include/linux/compiler_types.h:542:38: error: call to
> '__compiletime_assert_909' declared with attribute error: clamp() low
> limit dsc_min_bpc * 3 greater than high limit dsc_max_bpc * 3
...
> drivers/gpu/drm/i915/display/intel_dp.c:2506:25: note: in expansion of
> macro 'clamp'
>   limits->pipe.max_bpp = clamp(limits->pipe.max_bpp, dsc_min_bpc * 3, dsc_max_bpc * 3);

The code is:

static void
intel_dp_dsc_compute_pipe_bpp_limits(struct intel_dp *intel_dp,
                                     struct link_config_limits *limits)
{
        struct intel_display *display = to_intel_display(intel_dp);
        int dsc_min_bpc = intel_dp_dsc_min_src_input_bpc();
        int dsc_max_bpc = intel_dp_dsc_max_src_input_bpc(display);
 
        limits->pipe.max_bpp = clamp(limits->pipe.max_bpp, dsc_min_bpc * 3, dsc_max_bpc * 3);
        limits->pipe.min_bpp = clamp(limits->pipe.min_bpp, dsc_min_bpc * 3, dsc_max_bpc * 3);
}

with:

int intel_dp_dsc_min_src_input_bpc(void)
{
        /* Min DSC Input BPC for ICL+ is 8 */
        return 8;
}
     
int intel_dp_dsc_max_src_input_bpc(struct intel_display *display)
{
        /* Max DSC Input BPC for ICL is 10 and for TGL+ is 12 */
        if (DISPLAY_VER(display) >= 12)
                return 12;
        if (DISPLAY_VER(display) == 11)
                return 10;

        return 0;
}

Although the little functions aren't static the compiler can assume that the local
versions will be called and inline them.

It can then move the clamp() code into the conditionals in
intel_dp_dsc_max_src_input_bpc()
It then sees clamp(limit->pipe.max_bpp, 24, 0) and quite rightly complains.

Broken by 160672b86b0dd

	David

