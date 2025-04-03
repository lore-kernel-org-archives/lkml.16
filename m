Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B7E24337D
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 11:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743680185; cv=none; b=lMWzemwMFNyITLDSYdFhk2R4nqUPvykBgV6w1NmpQDqfHeIw/WSd23Jsp9jIZMoLLw1qwdNn70tW489wYbcCldSf6LU1254f+7pdH4hv2hhudRlHN07BsamPDuYKgIzEDCojbzw3m97QWC6vhqVFg2TG+o119rJUzJ2a8cC/GRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743680185; c=relaxed/simple;
	bh=Leuod2XYWAMopkmAob78LhpRv/n4TWgqU7CWEH2aAs0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tlxe1azBdjSRvyOeDU7BeEDNIqR5nCES9KVdpGQCIO5fbjdIZnzulTAeQerRxPIFIbQ5f9pAgmhlhXikpuM/l+oGzyT3HcP8YLyk+ag+sBtYPPaltjMdTMsOFBqiww5+dSERqdBJ1U+qsNKnQSqc9xPhKSdxqprJt8Osf15ZK5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mts2Fukl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mts2Fukl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70D3DC4CEE5;
	Thu,  3 Apr 2025 11:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743680185;
	bh=Leuod2XYWAMopkmAob78LhpRv/n4TWgqU7CWEH2aAs0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mts2FuklWOMA9HHXUnazxY5fu+EY0LvxnDQ+b4TSJ8mMGKLQtRoW6hr8pdNhU8nJH
	 HT/sRI7X/GouSf+rMzyFjj9QvYgLGm9GiMPcuEkRd0pg5J2ZD5rECWpA6R+sEpF1l7
	 vyFZiKKCVpEGHjHkHTGQnrDS5ZBJ610TpSv14nROczUxv59wEaqs+cozjsSGEvkTAP
	 L32zcRVMLl7EnSLaDQJkVJLNQ0/LOOP3p9ZOAA6k+XE1xz3/dTvZwVXYgY+InDV/2+
	 EHIT5AQmypiMK/pSkwuHpFwKMjTW1Mx9u+pzH1YVpTF7YVVbNbbx/tRw1YIBgC8l/b
	 HxqXRpuWFKxpg==
Date: Thu, 3 Apr 2025 13:36:20 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Borislav Petkov <bp@kernel.org>
Cc: X86 ML <x86@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
	"Borislav Petkov (AMD)" <bp@alien8.de>,
	Rik van Riel <riel@surriel.com>, "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH] x86/tlb: Simplify choose_new_asid()
Message-ID: <Z-5ytG_1vnf3uj8t@gmail.com>
References: <20250403085623.20824-1-bp@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250403085623.20824-1-bp@kernel.org>


* Borislav Petkov <bp@kernel.org> wrote:

> From: "Borislav Petkov (AMD)" <bp@alien8.de>
> 
> Have it return the two things it does return:
> 
>  - a new ASID and
>  - the need to flush the TLB or not,
> 
> in a struct which fits in a single 32-bit register and whack the IO
> parameters.
> 
> No functional changes.
> 
> Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
> ---
>  arch/x86/mm/tlb.c | 63 +++++++++++++++++++++++++----------------------
>  1 file changed, 34 insertions(+), 29 deletions(-)
> 
> diff --git a/arch/x86/mm/tlb.c b/arch/x86/mm/tlb.c
> index e459d97ef397..d00ae21d0ee2 100644
> --- a/arch/x86/mm/tlb.c
> +++ b/arch/x86/mm/tlb.c
> @@ -215,16 +215,20 @@ static void clear_asid_other(void)
>  
>  atomic64_t last_mm_ctx_id = ATOMIC64_INIT(1);
>  
> +struct new_asid {
> +	unsigned int asid	: 16;
> +	unsigned int need_flush : 1;
> +};
>  
> -static void choose_new_asid(struct mm_struct *next, u64 next_tlb_gen,
> -			    u16 *new_asid, bool *need_flush)
> +static struct new_asid choose_new_asid(struct mm_struct *next, u64 next_tlb_gen)

Nice!!

Note how the cleaned up return signature not only makes the code easier 
to read, but also helps the compiler generate better code:

  # arch/x86/mm/tlb.o:

   text	   data	    bss	    dec	    hex	filename
   9341	    753	    516	  10610	   2972	tlb.o.before
   9213	    753	    516	  10482	   28f2	tlb.o.after

Personally I also like the non-bool new_asid::need_flush easier to read 
in this 'HW interface' context.

Thanks,

	Ingo
