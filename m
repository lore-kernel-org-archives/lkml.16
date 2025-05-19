Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75CCB27817A
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 13:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747660808; cv=none; b=c38DJazvmpKLH4GHRhueD5GHlkItAOKrLxhK472rJnCdJq1uRZC+n4Vi8freuV2iUFT81I5TUkfPCK0QCGpdwInxv0UINbPHHw3Q0IAgryhiLjfeHqw6Ih5Mj8VBR9w2CrsY/xb3piQG0YXQfiay6h1Wpe9Ea+Mt+B4RtISODI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747660808; c=relaxed/simple;
	bh=g3ZozbinENRScyPV2xxw+ZFrBdJFXASo/Co1oK1uMVk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OXQTDZj2yaKqUVQIV+n4vCbVSkm4Fno/V0rlaWxRLQxRA0ennKICN0zZcdU5Aj8yZRnpJ/huajZa59U76CLPMfwuopCe2W9hh5Xwo1pNt4UXB+jTRK67nl1GdtecBAvCTS5U4QKKW83rAhnmLSUSi0KBN8NFqBNnREjss28oC7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=igUglUHe; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="igUglUHe"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 0A64340E0238;
	Mon, 19 May 2025 13:20:04 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id LKmry1jTl_9Q; Mon, 19 May 2025 13:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1747660800; bh=eALvwRRqtlo+1eJlwR+ponANKqmb4Vp8XbSE5dbRFJg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=igUglUHefLy+8mK0I1rx8k904b9ZgNK7sYAov6f0d8vTM2zhD4w+zcyonub6ipTwa
	 76NCrliEMxPT83PEN50t4gBiMAc3F0Cvt6f3sIUshyIdi8tMrzJz0ctRNJGPWdsjbH
	 oBBTcON4ymzHgJ1DGST20qb+ycuO0Yb0Gnh1E0IpHSDlPgIrECbVbXc8CM6Ub+/Ox4
	 2aXH5fiw8jOk07bhqlC68fumXd/F7BwFC6xTi1krxLd0axKIFQSVxS0KjvKV2tcCp8
	 pAGdgMGrsk6bYDcOCMvD2rxy67TIp+0+8C26wsa8BDwsB+xQd3VOMVNuYd6aKbojw/
	 mmb+s3KPzv7MhvnaP3GMwL3m5MszaXObTS543pTMN29xX4x+Kw2YStKDEsdXd5ICwr
	 0goYvuU1Pl7doCuoB0gCo/xxriHVhffFAPljaivdjudZw2nvMHK3yGs1r9mR249u0C
	 p393AIzCOLOxIdIVDw3Itdl/66AUBDin10Yb2I3+KGTyrtqY3bwPzKS2qMnKcgJgnZ
	 +SVTYmcHTHxFbRr0kP8oCSFvj8tOaVeXNconKg9JhgDNRW6sv9PriQpJFKYbIyAYh7
	 Ws0WqKl6r6PeWOdjB1oOlwy8QktEKxS34QsFpg8VzEWE2qRwegghTqBq3l7ORajd3h
	 5DbyZ5D7PcNNZw8uPR8376f0=
Received: from zn.tnic (p579690ee.dip0.t-ipconnect.de [87.150.144.238])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 48EA740E016A;
	Mon, 19 May 2025 13:19:50 +0000 (UTC)
Date: Mon, 19 May 2025 15:19:44 +0200
From: Borislav Petkov <bp@alien8.de>
To: Ingo Molnar <mingo@kernel.org>,
	"Ahmed S. Darwish" <darwi@linutronix.de>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org,
	x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Brian Gerst <brgerst@gmail.com>,
	"Kirill A. Shutemov" <kirill@shutemov.name>
Subject: Re: [PATCH v4 1/6] x86/cpu: Use a new feature flag for 5 level paging
Message-ID: <20250519131944.GCaCsv8A71vn21AB1W@fat_crate.local>
References: <20250517091639.3807875-8-ardb+git@google.com>
 <20250517091639.3807875-9-ardb+git@google.com>
 <20250519094038.GIaCr8ltHvLBYjk8iI@fat_crate.local>
 <aCstaIBSfcHXpr8D@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aCstaIBSfcHXpr8D@gmail.com>

On Mon, May 19, 2025 at 03:08:56PM +0200, Ingo Molnar wrote:
> The second best thing we can do is to have a sane, constant LA57 flag 
> for the hardware capability, and introduce a synthethic flag that is 
> set conditionally (X86_FEATURE_5LEVEL_PAGING) - which is how it should 
> have been done originally, and to maintain compatibility, expose the 
> synthethic flag in /proc/cpuinfo as 'la57' to maintain the ABI.

- we don't expose every CPUID flag in /proc/cpuinfo for obvious reasons:

  Documentation/arch/x86/cpuinfo.rst

- if you want to mirror CPUID *capability* flags with X86_FEATURE flags *and*
  use the same alternatives infrastructure to test *enabled* feature flags,
  then you almost always must define *two* flags - a capability one or an
  enabled one. I don't think we want that.

And since we're dealing with ancient infrastructure which has grown warts over
the years, we all - x86 maintainers - need to decide here how we should go
forward. I have raised these questions multiple times but we have never
discussed it properly.

Also, Ahmed and tglx are working on a unified CPUID view where you can test
capability.  Which means, what is enabled can be used solely by the
X86_FEATURE flags but I haven't looked at his set yet.

So it is high time we sit down and hammer out the rules for the feature flags
as apparently what we have now is a total mess.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
