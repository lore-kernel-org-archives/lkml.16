Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E96C2550D3
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 17:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747329724; cv=none; b=NoaJkWXJmdW4tpHLxHK3zROXuJHL8LqUFw9pyXIiaS3gtMkZ5bUilRxV7d7pXUMr5x/5fRSa1iFK+Yfn90C/nmbvrE9EW45Z8oY9ttZ96fnkKkYX0ebdLkGK3ZdY+73qg2ruunpT+uB7SwBbRlae4ZaXKK99UJVYu4kG3brhs5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747329724; c=relaxed/simple;
	bh=mfCeoOfwRJ2IubXApVWQduxn7NdySIMTBa5CH/dXP+U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GuMkLxTH2HV/4vcSkAWh6tSFxZGs8DQqlvz7N7n9NQTkAjvPinrLiePvCCIYuoAsjqutS02Emh/QL+AhpkBpwbdfybe6YnBVtJCuoGKGGfX+0pWsmChna4kzwz5uZjT2tB6IXVmK2V6IyO/JEKoqZoO4m6i5xzMGtlZ6d6hhkFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=I6BjP5Tq; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="I6BjP5Tq"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7410c18bb00so1822634b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 10:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1747329722; x=1747934522; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AZkQs5Y9+0MeoeQo27zBlTtClsZ5pt01lNLAK9VkB3I=;
        b=I6BjP5TqPJjHzJ3hNkLz89Bs9/WjHbbrHUa0o+uJKjiQ99vBT7bCn09LReAsd7Zk3u
         f3ksnuR3Z1icM2L9C+nO/Y5cN8ghWIEvcJsyHOQPDeUO1ThToF9UZnvHLZsFtWl4vEgD
         8rkDEX02CCOxgTd9oCRoOOE7yo9xKgNXPoScE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747329722; x=1747934522;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AZkQs5Y9+0MeoeQo27zBlTtClsZ5pt01lNLAK9VkB3I=;
        b=XAmW++lXqgV3fNsT8USQNisN38igbXmxFSPQFDLlKOROS05yZOg3y/8LVsqs+VVDO5
         B/nNEIvU/7LZY6JjKGSXb1jCVMX11zbEi+Ypk04jbFjlQ06iY79WrwTJm9+ULljB88U5
         yMt8TyuYhg6oFuwFZqXMwdcS9qziNQLB+SGvXyFYNflMSR4J969bn/xMCinBCsF1qusu
         jYUkvDWdxs0B+akV459gKhjWVeO2E3FdBFWwaivBIjGgECjmtB53jLfH8Czii57z201I
         FhU8hRNXPXpniB8hvXsRtyEJ6i6oBgbgQr9nAD67LeNrBqBzY5hp0gxjWPvFp0OtSi9f
         YXKw==
X-Forwarded-Encrypted: i=1; AJvYcCW/Um1T/A5ZD8KdqpG4hIcoL7xbH4/bwHchWE/q8OltyD6nxR6d9mdYpppR1Mv6UzoTkhGepqoPXDwBwNo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyiozpH5doKAqHXBimEsbjcw8aF0YD33xr71GAHtFbzsgWDpwJe
	UUXw/SLUnhPXKnm0K7wklAHugZwfOBWPysWGYCR1GpoEZeMZ+kJzJ1co1yVDCJntzQ==
X-Gm-Gg: ASbGncsL8akg+e4FL+rm74bmaBrU3SBrFPFL5/kuA7e3OjNN1Z7OlHs/GESCQ++mzyk
	nenIwIku9w7iWmQhyULlH5nXTbsTxr3OycbrpaxOuLMEgKH497qA+UA7kekn6QgImRSpCfH+BcQ
	C5dhPwA0q0T33hkX9TMFksUfoYc0QBNfmASi9cecscKLfjzUY9SSeXlEXAgAFWqT/lBb7b466rA
	jRUVvZoR6S5mYYLJd3h83RFp12y23So419GU9u7T9wt6n1t41AaDIMSCoaV81ICBvuBpRpmLqLt
	UJ+aPRcWKBScWa84Xp2riGqwndfKdbvTBTjiWfz+4+uHAo5d9loxnay2MKlErsUvBgOYPCRJAvK
	mFyEyC2pH3YxISw==
X-Google-Smtp-Source: AGHT+IGoidqfL8uEq7VTSHRz9j2OBbBO6mNxzWcPuV572jAmJW70jDu4s7p58cVo+XRQEqjyzJkCSw==
X-Received: by 2002:a05:6a00:1822:b0:740:a879:4f7b with SMTP id d2e1a72fcca58-742a98a0cc1mr245972b3a.18.1747329722449;
        Thu, 15 May 2025 10:22:02 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e14:7:cd06:335b:936a:7dc1])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-742a973a261sm69730b3a.84.2025.05.15.10.22.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 10:22:01 -0700 (PDT)
Date: Thu, 15 May 2025 10:21:59 -0700
From: Brian Norris <briannorris@chromium.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Thomas Gleixner <tglx@linutronix.de>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	Tsai Sung-Fu <danielsftsai@google.com>,
	Douglas Anderson <dianders@chromium.org>,
	linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 2/2] genirq: Add kunit tests for depth counts
Message-ID: <aCYit48N85WpjmiN@google.com>
References: <20250514201353.3481400-3-briannorris@chromium.org>
 <202505152136.y04AHovS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202505152136.y04AHovS-lkp@intel.com>

Hi Thomas,

On Thu, May 15, 2025 at 10:01:18PM +0800, kernel test robot wrote:
> patch link:    https://lore.kernel.org/r/20250514201353.3481400-3-briannorris%40chromium.org
> patch subject: [PATCH v2 2/2] genirq: Add kunit tests for depth counts

First of all, thanks for the help, and for applying patch 1. I see that:
1) this bot noticed a trivial problem with patch 2; and
2) I received notification that patch 2 was applied to tip/irq/core, but
3) I can't find it there any more.

I'm not sure if #3 is because you dropped it (e.g., due to #1's report)
or some other reason, so I'm not sure what to do next. Possibilities:

(a) send the trivial fix separately, as a fixup (against what tree?)
(b) resend an improved patch 2 on its own, against tip/irq/core
(c) just drop it, because you have deeper reasons to not want these
    tests.

I'm fine with anything you'd like, although I do think there's value in
providing unit tests for corner cases like this.

See below for the trivial fix, for the record. I can send it separately
if you'd like.

> config: i386-buildonly-randconfig-004-20250515 (https://download.01.org/0day-ci/archive/20250515/202505152136.y04AHovS-lkp@intel.com/config)
> compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250515/202505152136.y04AHovS-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202505152136.y04AHovS-lkp@intel.com/
> 
> All errors (new ones prefixed by >>, old ones prefixed by <<):
> 
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/ucs2_string.o
> ERROR: modpost: "irq_domain_alloc_descs" [kernel/irq/irq_test.ko] undefined!
> ERROR: modpost: "irq_to_desc" [kernel/irq/irq_test.ko] undefined!
> ERROR: modpost: "irq_shutdown_and_deactivate" [kernel/irq/irq_test.ko] undefined!
> >> ERROR: modpost: "irq_activate" [kernel/irq/irq_test.ko] undefined!
> >> ERROR: modpost: "irq_startup_managed" [kernel/irq/irq_test.ko] undefined!

The test Kconfig symbol should be bool, not tristate. Some of the
functions required for the test are non-modular.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202505152136.y04AHovS-lkp@intel.com/
Signed-off-by: Brian Norris <briannorris@chromium.org>

--- a/kernel/irq/Kconfig
+++ b/kernel/irq/Kconfig
@@ -145,7 +145,7 @@ config GENERIC_IRQ_KEXEC_CLEAR_VM_FORWARD
 	bool
 
 config IRQ_KUNIT_TEST
-	tristate "KUnit tests for IRQ management APIs" if !KUNIT_ALL_TESTS
+	bool "KUnit tests for IRQ management APIs" if !KUNIT_ALL_TESTS
 	depends on KUNIT
 	default KUNIT_ALL_TESTS
 	imply SMP
