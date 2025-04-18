Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA8EC70805
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 21:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745012042; cv=none; b=cqQpZBS/3KybmcbLiyz5frnBcrWOeNgb9fscFsm4Rz2gFhdPSmkOB0kzLzOvM8t4zha9xB/k6W4iWIjV0gBCEO/aiSqGa7p9ByO4eeuSCWAMWMV2fDnnfn+k01C0A0ch0SZr/wemPp2yC00191J+PWjxYqmocUPZKtk2LxSHRkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745012042; c=relaxed/simple;
	bh=j3HKMVwna0JghC/ZKdrCuz3s6dNgws4BeUDC2md/yvc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pr1cfig00eEUJg+Xt0xINqZH1j3Teqnf6uNGn19M5Dl3PvHFmeMLGVI0DVQD9hQSFJzyJ/nM7Qyp1EJ0iphJTWRGbcjxc30Z+AMqmmncc4ddHN6fssS6dwJ3UDbPEaxKZ10EKLPyFt5jLz977kk2gR/BS+ctGXlwn1ECF663B+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=KnLxJv9b; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="KnLxJv9b"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 9EE3A40E023A;
	Fri, 18 Apr 2025 21:33:58 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id SvVU1K4sPWiZ; Fri, 18 Apr 2025 21:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1745012034; bh=ipsi9l+RYEm5p0bBNb0+QL49aAV3lI/VZxJkAlgtUI4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KnLxJv9bylHIXbUHUEPeKFuej/sa92VXUcL8lyh2q5qsZ7kSWxHFVRxPn5ldJ6ut+
	 SJRS7giOOND5pwkuMJYSRFy3tZMjERhfMkW2IzomPVfYEd96m9mkqNRcR8zHEHHyqR
	 CB0ngKyYFiKMRT98Fmp7ZsdoZbWyRdGuWXzpJP+1r+AjYUDk3VrRaQenRi4y1/ypO/
	 DfrJVw0XUREKsH+aI9km0PrOPvG4d6XLnxKkWLEWhwADtBGcHbJRiKZ/2uqXXDttqo
	 79lmKBzpMu39HV5Hk0YKSnbbGRQn1IW3YahtN/cFOYs6hxoddw6TtPZjWJFz+SqJFa
	 LiJwI+BEDvCiwSnboR5dDBcEG8psTBMWGNCQgSJibBGqG6qqrYoXldFMSAUGyfn6W2
	 jeRjgaHP6JgU6CTVkNKQQujDNEJq03YZ6wsVi80kpW+bwbeY1BXISmQop1S2kw/lYu
	 +CVUOysNKZcRN9n+IIuUJviaGV9MB545lPcRTCo5kFrIaCDtf4UgfIvd8czVAnhB5A
	 DO8SLh2CLWBIARheQsKVcbXKb/ZZozrMUy8277BuSq3rgfLdAVGHDbbOjeKuhU7sp5
	 2JOLh7m7uiuIyiSu9ev1uQqqFKnWPkAo6SLwqVpFfTHJYA5K4l+wPmYmoT7hbNcZzb
	 jYgw5o86Ttk3fIUoOB2dDfBg=
Received: from zn.tnic (p579690ee.dip0.t-ipconnect.de [87.150.144.238])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 37C1940E0200;
	Fri, 18 Apr 2025 21:33:43 +0000 (UTC)
Date: Fri, 18 Apr 2025 23:33:36 +0200
From: Borislav Petkov <bp@alien8.de>
To: Ingo Molnar <mingo@kernel.org>
Cc: David Kaplan <david.kaplan@amd.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 00/16] Attack vector controls (part 1)
Message-ID: <20250418213336.GIaALFMKSwKKGw7tTd@fat_crate.local>
References: <20250418161721.1855190-1-david.kaplan@amd.com>
 <aAKwHvLTDfyM2UfS@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aAKwHvLTDfyM2UfS@gmail.com>

On Fri, Apr 18, 2025 at 10:03:42PM +0200, Ingo Molnar wrote:
> 	/* Select the proper CPU mitigations before patching alternatives: */
> 	mitigation_select_spectre_v1();
> 	mitigation_select_spectre_v2();
> 	mitigation_select_retbleed();
> 	mitigation_select_spectre_v2_user();
> 	mitigation_select_ssb();
> 	mitigation_select_l1tf();
> 	mitigation_select_mds();
> 	mitigation_update_taa();
> 	mitigation_select_taa();
> 	mitigation_select_mmio();
> 	mitigation_select_rfds();
> 	mitigation_select_srbds();
> 	mitigation_select_l1d_flush();
> 	mitigation_select_srso();
> 	mitigation_select_gds();
> 	mitigation_select_bhi();

The bad side of that is that you have a whole set of letters
- "mitigation_select" - before the *actual* name which is the only thing one
is interested in. With the vectors, one is now interested in the operation too
- select, update or apply.

I'd make *which* mitigation is a lot more visible instead of that useless
amassing of letters - especially since all those functions are internal.

	spectre_v1_select()
	spectre_v2_select()
	...

then

	...
	spectre_v1_update()
	...
	mmio_update()

and then

	...
	srso_apply()
	l1tf_apply()
	...

and so on. Short, sweet, not a lot of bla, that useless "mitigation"
regurgitating is gone and the code is readable again.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
