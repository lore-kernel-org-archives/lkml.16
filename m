Received: from out30-110.freemail.mail.aliyun.com (out30-110.freemail.mail.aliyun.com [115.124.30.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9BB5290BB4
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 05:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.110
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751522058; cv=none; b=SAfzrgvEyRJTYkftLpU9fLiWULPb2Ftno4ocwJo4V1MUlD1Z5t2Vn3Kuw3eAR4ClC7T7YcGruYvTh6hmL75qbeECqyE23/TCB743xUp3px41lHrm1Ct9tlg0403600zT4CQzfLWEwVDnMMipqD+Po1QFNtS/mYdjoG8s8I2Xklo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751522058; c=relaxed/simple;
	bh=LGGJ0z+1LyFmot+XimswgRB3XJu+MVZgowjZDsPUmhQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FfgiflG/AK/6s/G40lI1CQsx6wc2HiGw3Je6kWhONa4FWtrrL3paexzZIfdXc0YG198ZljwihsccarDqPSqh06VJubD06LrR7hHj9IN0qR0GNqQdNJiirsZI86/r5hCufy92yF5ExXVEalyBvvLp37nd0o8KhbKUGNB6WQTmZPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=NjyEMB2f; arc=none smtp.client-ip=115.124.30.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="NjyEMB2f"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1751522053; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	bh=BKfyvhg4kmZYPtB8JV4m1pS7sT/RIGrIVwBPecfpkBY=;
	b=NjyEMB2fpGsSJZe7OmDbvk3JJBAT5S8RijSbR8eOrvmYkRWs6O44RALtW19wOxYUsmWzaiXTkA2IafE8fOFWyYhwUvSOIFnhgV0ujvH/mPmIf6mMh1wq/kxPuNuDPenz+d8g0ROtVa67HeQMgwpmu0ACIpu1Ld2T/ev3RM5nRcQ=
Received: from localhost(mailfrom:feng.tang@linux.alibaba.com fp:SMTPD_---0WgtHsJZ_1751522052 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 03 Jul 2025 13:54:12 +0800
Date: Thu, 3 Jul 2025 13:54:12 +0800
From: Feng Tang <feng.tang@linux.alibaba.com>
To: Lance Yang <lance.yang@linux.dev>
Cc: paulmck@kernel.org, john.ogness@linutronix.de,
	Andrew Morton <akpm@linux-foundation.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Petr Mladek <pmladek@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/5] generalize panic_print's dump function to be used
 by other kernel parts
Message-ID: <aGYbBEgx7quu01wo@U-2FWC9VHC-2323.local>
References: <20250703021004.42328-1-feng.tang@linux.alibaba.com>
 <5f4f048e-02ff-4669-b4b1-e411c6be536b@linux.dev>
 <0b5934aa-7788-480c-93f8-2906396f44fe@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0b5934aa-7788-480c-93f8-2906396f44fe@linux.dev>

On Thu, Jul 03, 2025 at 12:56:54PM +0800, Lance Yang wrote:
> 
> 
> On 2025/7/3 11:23, Lance Yang wrote:
> > Just hit a build failure with this patch series when building for arm64
> > with a minimal configuration:
> > 
> > kernel/panic.c: In function ‘setup_panic_sys_info’:
> > kernel/panic.c:151:23: error: implicit declaration of function
> > ‘sys_info_parse_param’ [-Wimplicit-function-declaration]
> > 151 |         panic_print = sys_info_parse_param(buf);
> > |                       ^~~~~~~~~~~~~~~~~~~~
> > make[3]: *** [scripts/Makefile.build:287: kernel/panic.o] Error 1
> > make[2]: *** [scripts/Makefile.build:554: kernel] Error 2
> > 
> > 
> > To reproduce it:
> > $ make ARCH=arm64 allnoconfig
> > $ make ARCH=arm64 -j$(nproc)
> 
> Realized that now: the root cause of the build failure I saw is the
> missing "v3" tag in the subject of the patch #03 - sorry!
> 
> b4 reported that it couldn't find patch #03 when I tried to apply
> this patch series, which is why I was getting the "implicit function
> declaration" error ... Obviously, I missed that error before ;(
 
I see, as I just rerun 'allyes' and 'allno' build and they passed. I didn't
know that the patch version tag will cause the patch applying issue.

Thanks for the review and compiling test!

- Feng

> ```
> ---
>   ✓ [PATCH v3 1/5] panic: clean up code for console replay
>     ✓ Signed: DKIM/linux.alibaba.com
>   ✓ [PATCH v3 2/5] panic: generalize panic_print's function to show sys info
>     ✓ Signed: DKIM/linux.alibaba.com
>   ERROR: missing [3/5]!
>   ✓ [PATCH v3 4/5] panic: add 'panic_sys_info=' setup option for kernel
> cmdline
>     ✓ Signed: DKIM/linux.alibaba.com
>   ✓ [PATCH v3 5/5] panic: add note that panic_print sysctl interface is
> deprecated
>     ✓ Signed: DKIM/linux.alibaba.com
> ---
> Total patches: 4
> ---
> WARNING: Thread incomplete!
> Applying: panic: clean up code for console replay
> Applying: panic: generalize panic_print's function to show sys info
> Applying: panic: add 'panic_sys_info=' setup option for kernel cmdline
> Applying: panic: add note that panic_print sysctl interface is deprecated
> ```
> 
> Thanks,
> Lance
> 
