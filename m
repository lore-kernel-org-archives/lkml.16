Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB572AEE1
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 09:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745918594; cv=none; b=W137AYZySj5S75keIW+gmHGUAFj+w5YfCLZEutXIP02SqJF2exVtmztYpZFLHnRJQdIsyNtWsYkNmQEbxp+xA1I7tSItu9tIRSUyYqHGicvllWoP+mAfgBW4Rx4Fw8pBbpGxR9YkUwJ8nyUdTurGoaqJoIeiSfiSsv6mcGzCOAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745918594; c=relaxed/simple;
	bh=cf0GBv+iG/68uj4JtZfVgycYKG2hp8O3EeO6EJDN6+o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NpBe0k9P29LihBNc86w6Uz0P4g26FJ04Leh2CtCq58LHTZQddyLKWCWLbo74iEsUElLQeXN01d5hYi4nmJXvBiIC5S2t9AtTuXD6bblDbRlm0+rLhoOcjviU7DVpofJ54SpRk1rqCZHZO6swajWn/9Ta7DlKAQDym1KnYLIkmzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=XVvJ7bvC; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="XVvJ7bvC"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id B74B840E0219;
	Tue, 29 Apr 2025 09:23:09 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id nmFeE_18JCFV; Tue, 29 Apr 2025 09:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1745918585; bh=C9zANP39Kv0hkphILl1sT41JxxyiiWYJgiHSVr6v65c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XVvJ7bvCh/KXublAwnwCTMdKUoJfPlqKfkeHbWk1EDw3oCF77MwzIRCESnAkonhL3
	 mN86KUpFLXNj/Qfn186qE6TQN1uiyKwm5cZ2m/8jDpHOFdPFQ8TCx2mXNGq4aPwrzT
	 KtKKCH8gyzkK2z2d0qqalDRX4irVvAJmGjFrAHvPLhlTRorH2WODrPeaZhhd9UOpgO
	 /Qxgj9R5KpMa+g4HoCHpW7sUh4IlNh0+G9INCC+GLIIVwPRSIdUzBHCFKVC2YNgO4L
	 DaT9Jk/2GdzkketssDxZZF4tZWxIZSEIdIPL1T+1awvnEHn83TdCkFbXil7S6ktoq+
	 O4cgM2JlNefhN3X9scu1KMgr/J5d4/2iwo8QH56iPsPp8oaXhN2WfvWeveAlWkIPcS
	 YUnW3xgUaVgxnXFVyXhXXXO0eUpqAd0jMJRS6hPOdjuC7W/ArS5e1x9EuLxLWTYh0E
	 8B0JuDF8O/WiYKPD13BYEobiZC8qyoJYL8VSC/pYGR5OnQ6tIaqYscKzPjJd2TkN3+
	 lWc+JszlEQtURPm3mdiLbK2G0/J4KpVqnF1WXkfHkrx+Qrl+jEd++gI7v6ryrij7Ro
	 AIAJRrMzh1j3MEa/O6rehFPWhIp1hXhyuGzcZMI7BI2nd5D9n/eY07oIvRB3JP0Ug0
	 fjdBjPVLwnYjU2cUKN96S0lU=
Received: from zn.tnic (p579690ee.dip0.t-ipconnect.de [87.150.144.238])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 41B6140E01DA;
	Tue, 29 Apr 2025 09:22:57 +0000 (UTC)
Date: Tue, 29 Apr 2025 11:22:51 +0200
From: Borislav Petkov <bp@alien8.de>
To: Annie Li <jiayanli@google.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Nikolay Borisov <nik.borisov@suse.com>, x86@kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] x86/microcode/amd: fix the return value when microcode
 has no update
Message-ID: <20250429092251.GEaBCaa2Y1tVOnl77A@fat_crate.local>
References: <20250429084317.1619909-1-jiayanli@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250429084317.1619909-1-jiayanli@google.com>

On Tue, Apr 29, 2025 at 08:43:16AM +0000, Annie Li wrote:
> In commit 6f059e634dcd("x86/microcode: Clarify the late load logic"), the
> return value is UCODE_OK if the load is up-to-date in amd platform, which
> leads to load_late_locked() returning -EBADFD.
> 
> This is different from the intel platform, which will return UCODE_NFOUND
> and is more reasonable.
> 
> Fix the return to UCODE_NFOUND to avoid -EBADFD error.

... and return -ENOENT instead?

Is that better?

Or would it be even better for the switch-case to handle UCODE_OK too?

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
