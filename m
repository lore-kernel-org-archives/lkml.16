Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B64C21322F
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 07:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746601570; cv=none; b=OOvuOwfdPCCHUmns2qEgAjzu6dOPSQ2n4Zqxa134Gi3xhGECw7Y7LmjrYRHLwyPqwAlPiLF4CB9Q30AqNHt2Y8NKETfnvuiqr7C6XN5sMXWwyFxWIYBBXJPOPB8AQTlDbjbRuXi0ePX/m+Ions4bi+61LMFBzpFi+Gp6gylUjio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746601570; c=relaxed/simple;
	bh=FpwjGacwhaY9kZl59YWuCAhiL+olHRZOUpT5HisyEJI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HGBEsdSL00FENx1tmEvxsK6YtPW6V97Uez9guNC7/bomBsWyyEk7sKZxjZhVacWGxrg6RvKxhilDNIjAvH+Uvt969OkUycpBaSIE8vmgm7AmX/cJtT8/zzKyDlhKxKB/ZYsE1nWmdXXxglMyJJkoBOsKhrYVWxrVgl8UVvfjZ90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ryOHF0Vl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ryOHF0Vl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73CCEC4CEE7;
	Wed,  7 May 2025 07:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746601569;
	bh=FpwjGacwhaY9kZl59YWuCAhiL+olHRZOUpT5HisyEJI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ryOHF0VlY+5ct3A928IV4oRJhllRsR+f/AYziw6maq+C58FF/+fAMk851I7ikHgRu
	 wVEYoMNiAPxWD7I6G2nsKEN9XbXJy7EsO4PbaXIM9lVEaN8Kcq0MeNHjZ7Hm7e/TyA
	 rJ0YFVtPtEl1Pfaw28Gvv3649vPwmcGP4Fm7fTKCfUDaZzM6vKLYkQIYBwMLFQBM3g
	 A8sjcGZcUdjJ6+pqH/txhE75nO75pjFJOHaTqP2L5BVtw72tJI8p5yI5Hq8MLujzHu
	 MannzQp7slurCqeHhu+ZAlzVKCoKSzhGUmb/ZydhR9njOpB4cUa7n5jyId3HsB57Eg
	 u0t1zyGP4TyIw==
Date: Wed, 7 May 2025 09:06:04 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Yafang Shao <laoar.shao@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>
Cc: ardb@kernel.org, arnd@arndb.de, bp@alien8.de, dwmw@amazon.co.uk,
	hpa@zytor.com, linux-kernel@vger.kernel.org,
	michal.lkml@markovi.net, peterz@infradead.org, tglx@linutronix.de,
	torvalds@linux-foundation.org, vkuznets@redhat.com,
	yamada.masahiro@socionext.com
Subject: Re: [PATCH 13/15] x86/kconfig/64: Enable popular scheduler, cgroups
 and namespaces options in the defconfig
Message-ID: <aBsGXCKX8-2_Cn9x@gmail.com>
References: <20250506170924.3513161-14-mingo@kernel.org>
 <9b31f1df-7dc6-468b-9418-0b13239df8bc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9b31f1df-7dc6-468b-9418-0b13239df8bc@gmail.com>


* Yafang Shao <laoar.shao@gmail.com> wrote:

> Hello Mingo,
> 
> > +CONFIG_VIRT_CPU_ACCOUNTING_GEN=y
> > +CONFIG_IRQ_TIME_ACCOUNTING=y
> 
> Enabling CONFIG_IRQ_TIME_ACCOUNTING=y can lead to user-visible behavioral
> changes. For more context, please refer to the related discussion here:
> https://lore.kernel.org/all/20241222024734.63894-1-laoar.shao@gmail.com/ .

Yeah. I actually agree with your series. It (re-)includes IRQ/softirq 
time in task CPU usage statistics even under IRQ_TIME_ACCOUNTING=y, 
while still keeping the finegrained IRQ/softirq statistics as well, 
correct?

The Kconfig option is also arguably rather misleading:

config IRQ_TIME_ACCOUNTING
        bool "Fine granularity task level IRQ time accounting"
        depends on HAVE_IRQ_TIME_ACCOUNTING && !VIRT_CPU_ACCOUNTING_NATIVE
        help
          Select this option to enable fine granularity task irq time
          accounting. This is done by reading a timestamp on each
          transitions between softirq and hardirq state, so there can be a
          small performance impact.

It only warns about a small performance impact, but doesn't warn that 
CPU accounting is changed in an incompatible fashion that surprises 
tooling...

But I think we should probably treat this as a bug, not as lack of 
documentation. Peter, do you concur?

> If we decide to enable it by default, we should clearly document this 
> behavior change. Below is the patch I wrote earlier but haven’t sent 
> out for review yet.

Note that it's not enabled by default - this patch is just about the 
x86 defconfig.

Thanks,

	Ingo
