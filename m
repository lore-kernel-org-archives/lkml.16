Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10835847B
	for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 18:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744569335; cv=none; b=OdzLNpW//V8pGr92b8r101hXrgGUHPLPUtiCyAcmYc0sg4FO13U/SqPzW7Rx9c/eR8p7Q2/CYN7cShUPprWntq5PZV6p3SNXbXwjcvuaGVDRXMykw1o3SZmX17srblTq9x42DL4AWbdg1IAA1pIRoexSRnaojInIWCk3X1/BGis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744569335; c=relaxed/simple;
	bh=8v7P9YNGXbj3MyxGKRqQJap/sUA6h47RcTsVUyQBBEE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ym2Ef5xMg67/7DvnupFnFD1kJvpJCD3q5gNab7RVrsdx1A1BPAbfDOSLpg7pIbek4tgMb03k+2aFZymglYn1v3IGRDty5H+K+SAsOmQrkQB4KgK0g4h+6P4rsU1f9hL8CBlnTt7oqJHSMzg07PtNXFyfQoyQcpdbw+htCuPfssg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KRv0T+AT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KRv0T+AT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB093C4CEDD;
	Sun, 13 Apr 2025 18:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744569333;
	bh=8v7P9YNGXbj3MyxGKRqQJap/sUA6h47RcTsVUyQBBEE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KRv0T+ATwEOIAOSXwcEkcYk5veD6LdUU3tw8EpddobCh7zpUIv+Qj8rMhsS+wqFeR
	 BgCdyR6hBGdE2GjrD2R132jnt/7FWtopmaiVpFhyba1KfzsHdLdTIHL+GTvargTXcj
	 ikSdXQXmJjzBVkGzaTQ5C12EsSxCT4aDC2Mvw3tMCEB4mDdRWBLBHeISn+TS4FMt/L
	 W1mThfBAN5PsBnPwPwL9/fu2DwBIrRa46BZHpvlGtjLU+lzRBtU+jDkm+1+mUoCM2u
	 G4s+6EnYybPm+uJC7My84xb+038L0SrIAYp4Y0a5yHKgj+vZiI+b8L0BdjSQSwZFer
	 paGNXRPopvPpA==
Date: Sun, 13 Apr 2025 20:35:14 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Borislav Petkov <bp@alien8.de>
Cc: linux-kernel@vger.kernel.org, Mario Limonciello <superm1@kernel.org>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH 0/6] x86/platform: Move AMD specific headers to
 <asm/amd/*.h>
Message-ID: <Z_wD4oRAO6mh619e@gmail.com>
References: <20250413084144.3746608-1-mingo@kernel.org>
 <D80EADFE-7336-4007-9E7D-7E2F22F0BF6C@alien8.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D80EADFE-7336-4007-9E7D-7E2F22F0BF6C@alien8.de>


* Borislav Petkov <bp@alien8.de> wrote:

> Cool, /me like.

Thx, I turned this into:

  Acked-by: Borislav Petkov (AMD) <bp@alien8.de>

:-)

	Ingo
