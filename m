Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C60B0267B92
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 06:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746770767; cv=none; b=s1b+N9PFN3bMpQZzoM8fCIIqMUrRqPmoVX3Y7NFHQ8lRl7Yojo8lvDKfzT60sJKnd/d1yUBn4eSAQiuC068tRKzy1v70PUYNIxHpIF+7XbtanyTefX8t+GLZP5A8pDO3lOO3tipHnxfp7c+VH4bgO03yBut3Kic/h0/aXtAI24k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746770767; c=relaxed/simple;
	bh=TH9PeFQY8q94hxRo5V+cT19JOfiNEkHT9PZ6U92hPZs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EKWlMBb+J5pHmXzcxhyvGnUlYCuLfaS9Xm4ougigRhDCbUoTihZoMTzMcQq39yj4exUlwp6u2LRGLWLRF3uBRUZ2P2+jf7pITvrnLo1MCsbH/9XMKvJxW4KaJZb3O/JbCCuB5h6mWyAQ8S02OHALaCt8BjDI0IrV6APsAKjHYJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RjQhxwTl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RjQhxwTl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE849C4CEE4;
	Fri,  9 May 2025 06:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746770767;
	bh=TH9PeFQY8q94hxRo5V+cT19JOfiNEkHT9PZ6U92hPZs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RjQhxwTlVlQpWPRg645XZXCWXR7PwGKKLj5Mk/sl8bzUwD/sdChUHyAFaBuWy8A05
	 zMM1S6NYGianLsBtkOJ3unXumiRYRsJ/035yKh6rNrkwYb76HZBdSlFyLqy7monYbV
	 sRB5u2iCM22FM39vk8NNJMKghKDri+sagL3hRHsu3nZb+mXL+5kUcbG8kbjflBjBq3
	 hoEc3Gs3eovhjfttaRRh0FFOfaHxpWdck6nexV/uB4ZqVf3p8f5Vz8jTGLYC0IPiDK
	 wnGzhzkvCtz/44ftNNkFhkfLjI9WAHICs04KS9YboQn7oOTsZ9p/eqzMNt+LVhEHEe
	 OjSmly+UG+IwA==
Date: Fri, 9 May 2025 08:06:02 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dmukhin@ford.com, mingo@redhat.com, andriy.shevchenko@linux.intel.com,
	x86@kernel.org, daniels <daniels@collabora.com>,
	Daniel Stone <daniel@fooishbar.org>,
	robdclark <robdclark@gmail.com>, lumag@kernel.org,
	linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: x86: Boot failure on select chromebooks with v6.15-rc5
Message-ID: <aB2bStp8efMHPjet@gmail.com>
References: <a8638f85-1cc2-4f51-97ba-7106a4662885@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a8638f85-1cc2-4f51-97ba-7106a4662885@collabora.com>


* Vignesh Raman <vignesh.raman@collabora.com> wrote:

> Hi,
> 
> With v6.15-rc5, the below chromebooks were not booting with the following
> message. These tests were run in drm-ci.
> 
> Starting kernel ...
> [    1.843801]  ? __pfx_kernel_init+0x10/0x10
> [    1.909838]  ? __pfx_kernel_init+0x10/0x10
> 
> https://gitlab.freedesktop.org/vigneshraman/linux/-/pipelines/1420485
> 
> Failing jobs:
> amdgpu:stoney (AMD Stoney Ridge chipset):
> https://gitlab.freedesktop.org/vigneshraman/linux/-/jobs/76000926
> 
> i915:amly (64 bit Intel Whiskey Lake):
> https://gitlab.freedesktop.org/vigneshraman/linux/-/jobs/76000929
> 
> i915:whl (64 bit Intel Amber Lake):
> https://gitlab.freedesktop.org/vigneshraman/linux/-/jobs/76000931
> 
> These tests were passing till v6.14-rc7, and the issue was seen starting in
> v6.15-rc1. This issue is seen only with these 3 boards and does not affect
> other chromebooks (the pipeline log shows the other i915 driver tests).
> 
> On bisecting the commits, the commit which introduced this issue is,
> 3181424aeac2f6596534bf43021a10eae294a9b0 x86/early_printk: Add support for
> MMIO-based UARTs
> 
> After reverting the below commits in v6.15-rc5, the board boots and tests
> are executed:
> 3181424aeac2 x86/early_printk: Add support for MMIO-based UARTs
> 996457176bb7 x86/early_printk: Use 'mmio32' for consistency, fix comments
> (this fixes 3181424aeac2)

What boot cmdline does your kernel have? The MMIO-UART patches should 
only have an effect if the feature is specifically enabled via a boot 
option:

+               if (!strncmp(buf, "mmio32", 6)) {
+			buf += 6;
+                       early_mmio_serial_init(buf);
+                       early_console_register(&early_serial_console, keep);
+                       buf += 4;
+               }

The only other change I can see is the moving of an #if line.

Thanks,

	Ingo
