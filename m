Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC68C188A0E
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 12:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744978349; cv=none; b=PBjamVVceL/MzHpxg9OsUQT2CDjVqBJDP+cIdY1T3Cl1BSHAbxiKNidXnM8ttyzZMj5AkQ46x8wdQ8H5QGd9VlVXa9ul4lXWT5DGNES2xkFQnwKckknaTNraeoIEEJPxrK8W1IMpItUFS/+Cm8T/U/UnlQouVe+vh1OiP5jpKcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744978349; c=relaxed/simple;
	bh=EHAI/Ze5Z77RHaJUoTI6HIcTKdQvN2jeRtZzR0KE7yQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V3sBXzDyEyeb0dF0TsVti0b7SmjxR2DZhUJOScMc+dUvVmeLVMQo0aF3CV0kMGUsx4L9nPrisy6bd481HwdNN9d1iOPp7x0KVwVyWq32qPLNlVnhZ0lWtdDZfxMQlk/JRXTHB1tTGur1wZ2TOUlKKBcS+d6htgw1b2geVdzU4og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=I2cyK2zL; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="I2cyK2zL"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 5BFEC40E0214;
	Fri, 18 Apr 2025 12:12:24 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id EePCHwC0qnNz; Fri, 18 Apr 2025 12:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1744978337; bh=UEreqpSTPvb3Nr08mwYWPFS4C5O8jWczuLv1/fTwZzA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I2cyK2zLeNNi9+FrsB+tBaF8lgZtUdw7UecafSdFtDJa1mrgHg1fCkyqzmACtABXI
	 KAqcPHmuclfOpa0NlVZ3vay56loQ99TMPYY1aW9hPfOj42Wndk5TSe7+zWnSxiU434
	 AVMbYk9KscFErfXWfRdJPJqFfXLxSB07bS1EmVJdaI81oFrzBIMl44il27EbgaBEuC
	 hxLE9193Jw1usfc92alKCdt+lNTgLA8m+c3+XsDcZ/3RramHq03oeiisBt6E+jopXz
	 qj1lvtxaKHLIwnmUrHSQTJpNVkjdS/NYlWuKyYJ21yCQalOG6tkZiAHbrEOePaQnwv
	 BkxPBfbta/20o4WEJV3bhoUn1TBcv5ujsU6ISAtinwKiuJ7s3gFhHvAc5GffLLZrlK
	 aJP+FOwbIXVQOjPNSZdU9fWRpfZfLi56ZiIvQ1UTR1RxaDLU3eEc06PM0NEjWWAiSr
	 Wr1DclQIPxX5BXJkjXxUjZx8hXGNwavhoACcJLVD2hYD7oa/9Wbtkowq+GJOUXpPUL
	 wZeYY4Zzi18jl9x077e67zW4Q8wr+6iposs1hgPy140JTfdALOGx5BHQf0hTff0UN4
	 u7PTq8CQLW+VbVhHfGy4t6IOYwmIKZVCP0CtpyGFyv60HkpsBB1lBOwRICnUBlU+Q8
	 ruzY2PPuF37oxY7cTQ/LlSQo=
Received: from zn.tnic (p579690ee.dip0.t-ipconnect.de [87.150.144.238])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 908B440E0247;
	Fri, 18 Apr 2025 12:12:09 +0000 (UTC)
Date: Fri, 18 Apr 2025 14:12:03 +0200
From: Borislav Petkov <bp@alien8.de>
To: Dmytro Maluka <dmaluka@chromium.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Yue Haibing <yuehaibing@huawei.com>,
	"open list:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] x86/extable: include asm/processor.h for cpu_relax()
Message-ID: <20250418121203.GBaAJBk9bOo7ad1d4L@fat_crate.local>
References: <20250418115710.4154311-1-dmaluka@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250418115710.4154311-1-dmaluka@chromium.org>

On Fri, Apr 18, 2025 at 11:57:00AM +0000, Dmytro Maluka wrote:
> Include asm/processor.h to prevents compilation failures due to implicit
> declaration of cpu_relax() in ex_handler_msr_mce() when compiling with
> CONFIG_X86_MCE disabled.

Builds fine here:

$ grep X86_MCE .config
# CONFIG_X86_MCE is not set

$ make -j...
...

  OBJCOPY arch/x86/boot/setup.bin
  BUILD   arch/x86/boot/bzImage
Kernel: arch/x86/boot/bzImage is ready  (#1)
$

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
