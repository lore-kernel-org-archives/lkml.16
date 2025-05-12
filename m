Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2137F25B1F9
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 09:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747042245; cv=none; b=VoQQne50eH77xBO6vFWCQjuu1xHnwfgYw9PMaDU+37ZEt1pNGJtmhmKudCgCubjgEFGVTdBk+KWPaU0yHwA1qIlZeYUMJDPqEh9qKzfAVWhVBFp/P1Nycr8s1XpvORN2Z0uL8MmauWAroSqJV9nqsqVuHiuTnuhabaDATfjmpTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747042245; c=relaxed/simple;
	bh=HGdAODDBebTyaprqStd72u6qiNmEmbnZy1TxJrvYj2w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LdZKps/qq5pLbSjFHgPNT5ap1yIq7W/tcrYWoEMYedqixgQi2xWeonGQfAvuIXXBh6Sa5M/4SCeI7SsYvBKUzaD29hxspQKWXTgwFwtDcud+6T/1LaZOGuWv5L6yP6tEbR2hsq9IQ+Vb1XNyy0K86ksNi/I0pVQM1kQ3QMPQdxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=QFA0D/Z3; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="QFA0D/Z3"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=UgrV5pQtxMUhRi/4v50CNYzA9vzCoSuWMiuIa5nhlvs=; b=QFA0D/Z3wcx6K0jxqHWHvppNwK
	+78kdqNEe4Rf3RuKwIyo5ICsbV2aG2kfvpQA3hGQrZpc19GuirdKxM+5e5nDNGOlrjCc16I8N1TeE
	tk52ku3+rQy0QUgG2ouLhQK8cztuMmoowWmofkVN++ru2GGLLP9WMuMgxdaMj8QtnOEMcwNxZ5TRP
	C+5C413hofZms9DStdZjOmksclHHoEvL5K/rsR4lb8HMwA+/mVHW932bYHAxG4ScoOlZlgcHLFCLQ
	dzc0z/P7nTuXVVXPz0Ms5GBLrDDwSoe4xTmIeM00WgqdD9JuaYcI4zTz3Ov3R32dZIEy09rbGoAMN
	nhzA1JvA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uEPUY-0000000Gjw9-45hN;
	Mon, 12 May 2025 09:30:35 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id C1C20300717; Mon, 12 May 2025 11:30:33 +0200 (CEST)
Date: Mon, 12 May 2025 11:30:33 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: "Xin Li (Intel)" <xin@zytor.com>
Cc: linux-kernel@vger.kernel.org, luto@kernel.org, tglx@linutronix.de,
	mingo@kernel.org, bp@alien8.de, dave.hansen@linux.intel.com,
	x86@kernel.org, hpa@zytor.com, brgerst@gmail.com
Subject: Re: [PATCH v4 1/2] x86/fred: Allow variable-sized event frame
Message-ID: <20250512093033.GO4439@noisy.programming.kicks-ass.net>
References: <20250512064353.1535984-1-xin@zytor.com>
 <20250512064353.1535984-2-xin@zytor.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250512064353.1535984-2-xin@zytor.com>

On Sun, May 11, 2025 at 11:43:52PM -0700, Xin Li (Intel) wrote:


> -#define INIT_THREAD_INFO(tsk)			\
> -{						\
> -	.flags		= 0,			\
> +extern unsigned long __top_init_kernel_stack[];
> +
> +#define INIT_THREAD_INFO(tsk)						\
> +{									\
> +	.flags		= 0,						\
> +	.user_pt_regs	= (struct pt_regs *)__top_init_kernel_stack,	\

Should that not have a -1 on or something?
