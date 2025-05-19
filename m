Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE2921C9F3
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 22:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747695575; cv=none; b=ayVybxhwIcW4VZVypm7hULRGq/2X+z+HNVxBBcHT6UD1th7uPqCX8/sf2MMUXVV5BVWHkCmQNhTW/cvI064UFhbsZwFW2AqXjMiTV//IEfiohrvKvlVcmJCceemO0rD3VHJvbC7QB4W77A7uWqManSIBEcVMbwQfzViK6eiVrmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747695575; c=relaxed/simple;
	bh=8iKBEaeTULtgFafUr0Ol7MTdi0PE6fIG33lV9AUp8Zg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IO3FyrlzLiTdbTcoFi8YO5b+8m4vwAU7L8Vv4j1gkDEcwE8ESgrCajqgFm5L3UwRR0NkaWxOQhZihPHWVpagVpMSBIFSW1u2dikZAJf92I2bgH+YD4OPzMqTeY0/hyM56HnZycPHCjZzuYz4yO21b2yACt8NBM/o2K7O26DGnn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gNAhyPiV; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gNAhyPiV"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-231bf5851b7so37969755ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 15:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1747695573; x=1748300373; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qjbz2nd71z1cnZ9EhJ650XuasmqZlHIIfAB+H50JTUQ=;
        b=gNAhyPiVlyCXnmAAIp8fDANO2VGRnDY6bERGKSLW5Y5H6wtvfUy+Tdqsr6JvZYn6Dx
         x1E/dURD6tXDrppSHtiagMIZg+NvJKn5oaJZawC9BxlsLgt1CdRfAsVgA9bjwaibwCmb
         f7tLF6oyFos0N6lsbuIkFd2yv4v+Us/cRRheg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747695573; x=1748300373;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qjbz2nd71z1cnZ9EhJ650XuasmqZlHIIfAB+H50JTUQ=;
        b=jfC1BKWe24CUAvCAP8KDHvkfdz4WjiiPpXP7YHxlGPCSD8Z1wZOLtbrO12MaRxTXc8
         DvWPO728q1hHtfV5YofRciJfDeJc0p0oz5RFhkI8Dqu6j7ZFXROwGDzgKrXQ1wtmnZ5R
         FCWsMKd/hPKqSadc3yM3rR+pmzM6cxGRzfhnUbFLov/p7NMIM+8EzOIlxKviKPBGGP1Z
         z6ZG6KJm2rHuyrH2Y17ukLBT+5/3uPqTTm+4FQ3IYIv/HYC4vOUXo7h+qKgNGc9T0FcA
         D2klp26Fl9aaGijvuOiqW8H0Z3/ntH2uLWdGeaf4aH1a6skf9vnFxZi4PrmKQFNnK7zC
         4/cQ==
X-Forwarded-Encrypted: i=1; AJvYcCXsyTHOduyB75Iu2yh8bJtEGtq1T257T/83dlFj7B/SatKiyg+zjYTbtzmctumd2DtkzQFOIDnfj9IMsiE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3v88vT2EZVWEoscz6pU/NU3cKUW3SdvKRdURQX0UnZJqLuBT3
	Dp/4Ry99j2V1eSeG/eBAfnHPvGLVrEBOh6kUTtI6cbIs1x67rbvJKIHjVEom4EnOsQ==
X-Gm-Gg: ASbGncvRyW3Oq9iuDqo/TLrpmGjUKo5eMVStzrv9ni/My3ObnBS5drK+FqNbQJUQd3F
	rXvDBPexaATqs5iixRgBGlis4IRKrh9gZCukl8JbWGskVrYqud/WqFv7YaMXHTH1GPolslJ3Rk0
	gRQq8FUePZ2idAllHLo5xZmqd869t5zoyarrs8ACtHfhRQnM1+ZpWodv9neAliS2EudoOnnnXbt
	CzQQ5WulpVtQfed4idSNElXMMLEOEQjkJNW6H4wfFRb035dwaRB4sd+vBKiTQClECivmOyrE42A
	4jiqDDyD2WJDWO9WcqbqfoXerJBiHsJdCdnsFS/mFdlJiAHj4rLyUOGlFoTAEPDHfM3iXYaSGI5
	s+951U9G5Ra50WQ==
X-Google-Smtp-Source: AGHT+IFKa6iooFD5GeLGECJwMU3VFaa0UYPWSz+Gr1JGX91aZOI98Hgy8lFsH9A2ZRwAhwprY6+N+A==
X-Received: by 2002:a17:903:24f:b0:215:b9a6:5cb9 with SMTP id d9443c01a7336-231d43d9c8bmr188174925ad.5.1747695572726;
        Mon, 19 May 2025 15:59:32 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e14:7:379b:e49d:8d8d:4983])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-231d4e978e2sm65330445ad.125.2025.05.19.15.59.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 15:59:32 -0700 (PDT)
Date: Mon, 19 May 2025 15:59:30 -0700
From: Brian Norris <briannorris@chromium.org>
To: kernel test robot <lkp@intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	Tsai Sung-Fu <danielsftsai@google.com>,
	linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v3] genirq: Add kunit tests for depth counts
Message-ID: <aCu30rOFY5vL1AU6@google.com>
References: <20250516183213.848182-1-briannorris@chromium.org>
 <202505172307.yTjulMhx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202505172307.yTjulMhx-lkp@intel.com>

On Sun, May 18, 2025 at 12:13:47AM +0800, kernel test robot wrote:
> config: arm64-randconfig-001-20250517 (https://download.01.org/0day-ci/archive/20250517/202505172307.yTjulMhx-lkp@intel.com/config)

Ugh, that config manages to have this combination:

CONFIG_IRQ_KUNIT_TEST=y
CONFIG_KUNIT=m

I assumed that "IRQ_KUNIT_TEST depends on KUNIT" would rule out that
combination, but I see that's not true. I feel like I relearn Kconfig's
language every time I step outside the simplest of dependencies.

> >> ld.lld: error: undefined symbol: kunit_binary_ptr_assert_format
>    >>> referenced by irq_test.c:54 (kernel/irq/irq_test.c:54)
>    >>>               kernel/irq/irq_test.o:(irq_disable_depth_test) in archive vmlinux.a
>    >>> referenced by irq_test.c:54 (kernel/irq/irq_test.c:54)
>    >>>               kernel/irq/irq_test.o:(irq_disable_depth_test) in archive vmlinux.a
>    >>> referenced by irq_test.c:81 (kernel/irq/irq_test.c:81)
>    >>>               kernel/irq/irq_test.o:(irq_free_disabled_test) in archive vmlinux.a
>    >>> referenced 5 more times
> --
> >> ld.lld: error: undefined symbol: kunit_try_catch_throw
>    >>> referenced by irq_test.c:0 (kernel/irq/irq_test.c:0)
>    >>>               kernel/irq/irq_test.o:(irq_cpuhotplug_test) in archive vmlinux.a

I guess I'll need to squash this in:

--- a/kernel/irq/Kconfig
+++ b/kernel/irq/Kconfig
@@ -146,7 +146,7 @@ config GENERIC_IRQ_KEXEC_CLEAR_VM_FORWARD
 
 config IRQ_KUNIT_TEST
 	bool "KUnit tests for IRQ management APIs" if !KUNIT_ALL_TESTS
-	depends on KUNIT
+	depends on KUNIT=y
 	default KUNIT_ALL_TESTS
 	imply SMP
 	help

I'll sit on it and send v4 eventually.

Brian
