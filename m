Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF00158553;
	Tue,  8 Apr 2025 19:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744138876; cv=none; b=TKmhYgwTjyIXESjnUutUJSECpf316sAFIE0XpAeRI1eJQ5kSiU8s+J5WMMa8YMlD/qZejvP6ShEGI34VHV04Ob61XW/1YEt3a5qhh5R/fx7Ex6vxkOod6e+WtUDOlLMdV97mJ6DXR5QRd513AvpEAQ/fllt6hgXICbwuveVYc20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744138876; c=relaxed/simple;
	bh=sHfhxuZIQSO5aubGAGZJMSZaqXquLPjutyks3Ab0bmY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BOH/PX4oCT+Bc+TuUMiPKCSDR6x0+rZ2yaYB/+9of4wC+Xe+bSyCK1qsWNAixDRfye4EeAveHrD/276r6Rdy652z8TK5XkzGC7rlIY5NjPoMMBE0Ua0chRH+dnQzv55v3+ZVNzWTTkywwrrgSS33KQWx2MKIqnLi9iAU42RyT4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=W2pj7XE1; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="W2pj7XE1"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 8C20040E01A3;
	Tue,  8 Apr 2025 19:01:11 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id HQOofhFlsyOu; Tue,  8 Apr 2025 19:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1744138861; bh=mifN9dUH7robv2c9Z86cUKGUFRxqEcBWzOtSGDBSvV4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W2pj7XE1KeskhnNR3PBis+3jQ60c/FULM+K4NUrPKbjycpt2Z+cZ6VilBfDT0bS6H
	 abE9wzH2DkDiAdiKZGVR7kADjM6qNvBmAY6fbeTQSs5TlhlBPk/cTndxpY/tqinHYr
	 OgttJBu5vMQbpPz65yt4NQydAPtSzkcxqDxvrJXm9dq4nkbPSr7NNaY/cPVbZ2ikP5
	 4y3rhPRdER0netXMhqrsFMGLZ6xRQmxRWNGBvkipzMwtyZN3b9UDlvaUFC/1BENI3s
	 YVwdR+EVb27KF5eE7siQcMaL+aGjXbVKIQyvpyJuyLeQNz2boGOci3B8k+ThbH7bva
	 ZET5r2r47eG8Okw9hgASaJpGfLeqPXvzw7Z/klEhYKyBUy/CXVsVMS3JoLyINv/i8y
	 Wsz/tcsmyUJNKYBQ+azleOWv7XcZITI9DTw9HvqSLtjyaTqQHHkC53+k1okC9C0gki
	 Ylq5mUpYsMG981RaMhN4/9sEZu3myBIyXPJTapWmuUUb0ef8lmzUpsXOkju/71cAjv
	 AJRumUOnPuzc/vwaK1r+JrQaRmy4UT17vuri/fgSbCJdQDtl5rSM+Hofrray53xcee
	 BgBJe1uFLoiJKH5G7fuo3aths38C5Ebxo+aXy3P0VUpD9W+0wY0SD1Ytl1Bvqy8ZbI
	 FpiGlSc8t3AdM5/lXzwmhlL4=
Received: from zn.tnic (pd95303ce.dip0.t-ipconnect.de [217.83.3.206])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 6052240E019F;
	Tue,  8 Apr 2025 19:00:50 +0000 (UTC)
Date: Tue, 8 Apr 2025 21:00:44 +0200
From: Borislav Petkov <bp@alien8.de>
To: Mario Limonciello <superm1@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
	"H . Peter Anvin" <hpa@zytor.com>,
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	Yazen Ghannam <yazen.ghannam@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: [PATCH v2 2/2] x86/CPU/AMD: Print the reason for the last reset
Message-ID: <20250408190044.GGZ_VyXCG4H25ce6cF@fat_crate.local>
References: <20250408174726.3999817-1-superm1@kernel.org>
 <20250408174726.3999817-2-superm1@kernel.org>
 <20250408181451.GFZ_Vnm6JXaItfwVpK@fat_crate.local>
 <a8bed98e-0393-4b0a-8b5b-3007015a9af6@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a8bed98e-0393-4b0a-8b5b-3007015a9af6@kernel.org>

On Tue, Apr 08, 2025 at 01:19:42PM -0500, Mario Limonciello wrote:
> Or do you mean directly in the RST itself?  The RST documentation [1] said
> and I quote: "Choose whatever sucks least."

Self-contained sucks less, no?

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
