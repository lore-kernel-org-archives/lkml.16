Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E5A347D5;
	Sun,  6 Jul 2025 08:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751789988; cv=none; b=QrXT/WJo+jCQo0K1bCYiVoCbuKIG148vsRuJ4imsm5HMyn8hX7wY994ujZzSJLwRY4Q4dvKKas+5gA6JzY0+6mokhqkxqWmtuWbFTywZf7/VG1UCIfSWlEoQ9WKBRnW1Ivp19UR9fVqmIeYbvkyfq47p43EhlJ73+kTI4cWrfEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751789988; c=relaxed/simple;
	bh=tZqDqUp3XIjooRMozbHMXVkTOrN103981WeXtlD/b0I=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=GzIF9UbngqF39a3ohMWlIK6CrTiFp6g+9TSMCgLTc++dt1CDEnsBcjsyGWxmTmxiBkG7VpC5n+ffzpBkGqv9P3sK+EYzLjktrYjtdmKp2hxUwodsP/K2pcbbwH9lePoAwtl1tmfRBl6ou4twR65JX/qn60Cbz5/ULsG/IQlKPPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=j17gaSMP; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Tff7wdFM; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="j17gaSMP";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Tff7wdFM"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1751789985;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Z5x3AaIZkt8PB2z4OEFY2rJlTgKgwVrKyPWTrYoZU28=;
	b=j17gaSMPFt/UYXrxDoZLykp1wJ5ItLDYQCp/V1scS/+ADnySA3o7NKE88RbELCqcEwgw8c
	XYOa/BKNcqOfMjZ6WBtm10PjVyOM9LPVj4vrNztDxdjyKjZu4BknSfokGGBAExUqj37owt
	V+eeKT9p8CTjrlkKAckg0ASsgcIU5SkI5RsTxdgQAAiK5iCau/pO9BfrU8yb1hFdcc0UoW
	CBhzvEdG6AVp92Y8TWtkwpy8RzRCsSqEQNWP69p039xS4z86Iv6Xw4s2rnxQoDvNv/zeXz
	vZpUoBGzQzqg2t8VNmJOyKP3//q3MM3p3Za6tnFKPPBFxO1nzbwyCmT6vsfu/w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1751789985;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Z5x3AaIZkt8PB2z4OEFY2rJlTgKgwVrKyPWTrYoZU28=;
	b=Tff7wdFMry/IgwryC0ZzQkVycjF0nTpYPNKVzkuELpEu66qX24qIXwuoQg4UeTRg5Gbxd6
	Evp1FJicHdgHEIDg==
To: Ben Zong-You Xie <ben717@andestech.com>
Cc: mingo@redhat.com, peterz@infradead.org, dvhart@infradead.org,
 dave@stgolabs.net, andrealmeid@igalia.com, shuah@kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 tim609@andestech.com, Ben Zong-You Xie <ben717@andestech.com>, Cynthia
 Huang <cynthia@andestech.com>
Subject: Re: [PATCH v2] selftests: futex: define SYS_futex on 32-bit
 architectures with 64-bit time_t
In-Reply-To: <20250627090812.937939-1-ben717@andestech.com>
References: <20250627090812.937939-1-ben717@andestech.com>
Date: Sun, 06 Jul 2025 10:19:44 +0200
Message-ID: <87ldp1spcv.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Jun 27 2025 at 17:08, Ben Zong-You Xie wrote:

> glibc does not define SYS_futex for 32-bit architectures using 64-bit

Kinda. The kernel does not provide sys_futex() on 32-bit architectures,
which do not support 32-bit time representations. As a consequence glibc
obviously cannot define SYS_futex either.

> time_t e.g. riscv32, therefore this test fails to compile since it does not
> find SYS_futex in C library headers. Define SYS_futex as SYS_futex_time64
> in this situation to ensure successful compilation and compatibility.
>
> Signed-off-by: Cynthia Huang <cynthia@andestech.com>
> Signed-off-by: Ben Zong-You Xie <ben717@andestech.com>
> ---
> Changes since v1:
>   - Fix the SOB chain

Mostly.

If Cynthia authored the patch, then this still lacks a 'From: Cynthia...'
at the top of the change log so she can be identified as the
author. Otherwise tooling will attribute autorship to you.

Thanks,

        tglx
