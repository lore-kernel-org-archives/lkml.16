Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C19BA1F2BAE
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 09:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743672161; cv=none; b=pZskkdKW3CxbjK9BSdBr71fx9JbP5TqI5oDxnLbxWJZlt4Z814jLnaXKhJq1bht7cLxtYHM2jVIrt1NfMkRjJsJZxPD3s221DdFRXI22+lupgXzbEhtWodhbT4PJCbRBcKGyrSGKQ9rR4Xth2ymJdgrbce0MZ1GDF/LiLXyo0RQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743672161; c=relaxed/simple;
	bh=jIvSgp3QHSSo75SMXWe+snWjL5ZMUrvjDSWSx3wx2KU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rMzrNmoUoSeAMsqNXlXGc7hOFFy0/524s4WW4u1XW6M8bXVlLVDCnsR9fsZ69LLxpd5Fn+kHz1LU+4UMO6sDTHf32Pqucx/3xrGnrzfNK7h8zt6t5G2HzqF/8KlVw3LK9HSWeSfg5vZtsLZrZ8+Vdma5nAWEoXtUI1NsZr/2uZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=aJnvBk0D; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="aJnvBk0D"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 326B140E023D;
	Thu,  3 Apr 2025 09:22:35 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id TeEvGuiuu5Ln; Thu,  3 Apr 2025 09:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1743672152; bh=LCqcTCbMmwIN90UlzGn87wVHHpFhlDig/ToECo4WZCw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aJnvBk0DaNsVFoD0tQZudT7y7e5Bj5+E5nyUutFiLHEFcHJ2l++Bfy4vX/9WI28CK
	 dPJz/okIB+ObpQb4MtGgiT8zjUqfy8bGiGCyWBzzoY/Nt/EzeYLioAe7Ntwcy+8WZi
	 jqE3d/COreVtLqee1k/Ph8+eb9/hjEMZWXVeeThAClfh753WywjLh9MvbAwxc9R2n3
	 7BVNVfYVF1RlYYJGT4Uq3GaIyevVni8KKotDOuJU5AQe1OrwmxcDPV6m0l8UPhiJ76
	 YFr6+JTpIqUSap3ZEMRMShqPaTWuzRrnjwyujukSikLCNozMouJQ/nzwRG6U3y1PQE
	 O7kFmCgSb39FCsx38o+fC1eKf465ye3NHBSpvk22b1EpPAloti8cVrJpUiNYDpy/ir
	 wSGeEbyrJZ3T3EFpXMp3oUOUVwkwHXH3k6leqkCB2b1/UqT5WhIXmdcsdsLjYkvZPo
	 9jgkOF3N//yzH+PL7G6OmGN6kJmgljsSflnZ1++Lei70XpjoICaHG/5KolOmNtFpYz
	 xfO8oRqrOWq+4pKX9i9MFl0xh9e0xrwN/8k/76ZMoJuLLJQgwS/TqyIoj3L1zpkHAv
	 KGlr4ml9fqA7fLKivFXWKjzNEtk9MKysCyit7N/sbYWSp+q24In+buK/R7PYaBdeYE
	 WC9c0Hz0pdUSVhbY3lmyy8uo=
Received: from zn.tnic (pd95303ce.dip0.t-ipconnect.de [217.83.3.206])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 03CFB40E021F;
	Thu,  3 Apr 2025 09:22:23 +0000 (UTC)
Date: Thu, 3 Apr 2025 11:22:18 +0200
From: Borislav Petkov <bp@alien8.de>
To: Uros Bizjak <ubizjak@gmail.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH -tip] x86/idle: Work around LLVM assembler bug with
 MONITOR and MWAIT insn
Message-ID: <20250403092218.GBZ-5TSiyjNRAcBxQo@fat_crate.local>
References: <20250403070453.214190-1-ubizjak@gmail.com>
 <20250403082508.GAZ-5F5EMVZq3-6Zoo@fat_crate.local>
 <CAFULd4a49RRMKrSVh3Q5zpeK4EJVW61tm=fCN4aOWX8=x8rKnw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAFULd4a49RRMKrSVh3Q5zpeK4EJVW61tm=fCN4aOWX8=x8rKnw@mail.gmail.com>

On Thu, Apr 03, 2025 at 11:06:02AM +0200, Uros Bizjak wrote:
> The least common denominator is an insn with implicit operands. I'll
> post V2 that fixes it that way.

I guess.

You don't need to post a patch ontop - your previous one should be removed and
the whole effort can start all over again.

Maybe Ingo would let the test bots chew the patches a bit first before
applying them so quickly so that we can avoid this churn too.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
