Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16887266EF3
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 10:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744627745; cv=none; b=LeDgWsZRkzqkWeGxZaOrNuJ+CVUftTjWlb1zVRxGpYWSnzQTxA15uKdrojv/35xfreeM8iAEr8wu88bcjywrquc7C+DsmI9+v3Zr90kyXNkFaWqFGxuBpb3intYksYZFvEG66f7jTaj9C9/GrKJQA729xPQ33xjbcy01pY4A+nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744627745; c=relaxed/simple;
	bh=2k3NKqZdXjiNHiaMkWazo2ZQUH2A1EflKcb4qzc6yx8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bw+Uyp1XBsaDwnJBCoJBXBM+mDprtFNuOH1XJUTOzQKQoDP2KgSfD/wKDQ+HgjlT6F5PAJobculi3nesA+0WYIi4nn0Ybj7YYsBdZn8ZT4q+liqH2KljLFSyBDIcXLPe1QhwI5sHhURCWJ9oP3gdBWPtky/sIs3OTs/604hckJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tapdWTGy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tapdWTGy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3ED3C4CEE5;
	Mon, 14 Apr 2025 10:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744627744;
	bh=2k3NKqZdXjiNHiaMkWazo2ZQUH2A1EflKcb4qzc6yx8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tapdWTGyVbrj++0yIXY5D0MUKsSdYRv9pDN1zMprx/pGocI6Svel8CMasbKoTJuVf
	 wMk0iwyTYfB7MaFe/CMgPz8avrVUuxPBXNeNmOj9JlbLi+OKIREPpJnULMvrRPDhAT
	 hYXBbwPoA2m8O8kXKmHQYbHvmcPOmkCM6gUkqoQeY5dVzsTqFpZKzE1f8lcWTXb6wo
	 F6e08lY6/W2yUI3o+r0CvZODXnKdxxb76ce8xIHpcg970mMoaxUREp1SKaQ3WgHaxT
	 4L3Cxnr6IFj/LA5K3TvJND1dXHpkKsLzwLAsFyrci+egO2mH3AhBtk3NwkSkBakscH
	 u6OFfhclmJhFw==
Date: Mon, 14 Apr 2025 12:48:59 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Borislav Petkov <bp@alien8.de>
Cc: Thomas Gleixner <tglx@linutronix.de>, Kevin Koster <lkml@ombertech.com>,
	Oerg866 <oerg866@googlemail.com>, linux-kernel@vger.kernel.org,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH -v2] x86/microcode: Consolidate the loader enablement
 checking
Message-ID: <Z_zoG9Dn0u4ngMrj@gmail.com>
References: <20250406174633.2c581923c145687476191753@ombertech.com>
 <20250406190253.GAZ_LP3RPZInWKcHN7@fat_crate.local>
 <20250407095848.7933a358c9f450fe03fb8234@ombertech.com>
 <20250407102927.GAZ_OpBw5hJ2QTFsKz@fat_crate.local>
 <20250408002150.8955343f4e2f2ac31b4663e8@ombertech.com>
 <20250407135533.GDZ_PZVZ-2CKmhbt7d@fat_crate.local>
 <20250408172250.GCZ_VbaqKsshMYTdaE@fat_crate.local>
 <875xjcteq2.ffs@tglx>
 <20250411110741.GCZ_j3_dLFQ5fGhHqw@fat_crate.local>
 <20250414095933.GAZ_zchcLNPpUHF9IN@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250414095933.GAZ_zchcLNPpUHF9IN@fat_crate.local>


* Borislav Petkov <bp@alien8.de> wrote:

> -static struct microcode_ops	*microcode_ops;
> -bool dis_ucode_ldr = true;
> +static struct microcode_ops *microcode_ops;
> +static bool dis_ucode_ldr = true;

BTW., any objections against:

  s/dis_ucode_ldr
   /ucode_loader_disabled

or so? I had to look twice to see through the obfuscated name. (Okay, 
it was 3 times, and I had to grep the code I confess. :)

As a separate cleanup.

Thanks,

	Ingo
