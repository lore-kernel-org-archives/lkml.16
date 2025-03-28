Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB667170826
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 13:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743169573; cv=none; b=a1zQ/O/XEmfcw85xlSXXG/R95TlcTP1WeIQxdfmv7T+yIoadYMA0/Ge21Lm/A3xbp8KJp+fwollIW8KktZQww633FtwrXqb14tDJes5QkH4TCbn5IJOpEs0EQzZJVZbolCvGSMgbv0nM/5HEDzA04gd4Vk9BYUnTDGT2jEbpfNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743169573; c=relaxed/simple;
	bh=9BRPU3SLPzWh1YZglZtMUckHPTeFm2DeHxJjHOAN8xU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WKVQGVvwEqqcrkVbStSO+VfwLQ6/wAfbgjELY0mug/3cYxHG8McTY60hSzgGLdNjhuEXCzOs6SNiM9CzePDkG6CexEQOsfmGj8fPmOlkarlTReh6OKfD/OFKjC73tHk5FifS1BKNYTTNlmfzhdUXrPN3ne1voqlsdlQhaW+tjBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=iu/iMcap; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="iu/iMcap"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 156D340E021E;
	Fri, 28 Mar 2025 13:46:07 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 2m_CWlbsjyX2; Fri, 28 Mar 2025 13:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1743169559; bh=hPVp/OPa3Ze/KbpWnC5nvMVpALBy036QuWooz7xHvWU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iu/iMcapJyIA5/UbUPjAAhbEllpR2Lk03J30TXPx6PNHWhjUyJmdNE4QHA6gRosmk
	 BGadSuc2D8GVrRcq5NRy3b1peLjalyaLpxdlDG1k8AfziKuQ+IRIKgdlVtR7udxMKJ
	 48aD9/sCSdP/uwFap8bJGyHjqb1V0hKwYtBp45iEK8iY3gK7qulLBg1brvzi8feudy
	 2lzXWXIRXA+SGTrj7gCcyTJ70pjnW2w+a/x5+vRBc/z5iDsnpyqUjzykXLealEUJJR
	 ZuJx9v0QlTdW4rzoflm3uDhvJSTWb4UNHIWL2dXIjtJ8cx9oE7oH2huwvnN4Af1yIw
	 rX3w8wfWZpQcXTIU+2YblIZrMn1KlyjGrls1MtnJEdh5o2BC/Vc9pwiWlgm/191FyS
	 F5oKglkygQldptmyHiRyG5owSHRY0nMgFNMekDJWz0VVD+80bO6y9b2YcXOPq/tmt4
	 wdCYsSQCxtMOECawA5I6PG5vn1VeUKU2SolbS9OIBL7OTgMS8PkBnfGvzKBLhwTb8h
	 pPLo77KFZet4V+qaSIWIP3WFWw1/0KSWdTTJMInYmDiNY93qD8SWqSOhfqhHSVBY7k
	 ztc5XwVYJVEAKXfH/LdSfBY6S/+wg1AnLUfHQeLkwNH2NATfZKaxcZfS5tWCixzbxw
	 9yME1uvK5IvObOfp9Kl79ovw=
Received: from zn.tnic (pd95303ce.dip0.t-ipconnect.de [217.83.3.206])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id B5CE140E015D;
	Fri, 28 Mar 2025 13:45:51 +0000 (UTC)
Date: Fri, 28 Mar 2025 14:45:44 +0100
From: Borislav Petkov <bp@alien8.de>
To: Ingo Molnar <mingo@kernel.org>
Cc: boris.ostrovsky@oracle.com, linux-kernel@vger.kernel.org,
	tglx@linutronix.de, mingo@redhat.com, dave.hansen@linux.intel.com,
	x86@kernel.org, hpa@zytor.com
Subject: Re: [PATCH 0/2] Clear AMD's microcode cache on load failure
Message-ID: <20250328134544.GAZ-aoCA03g9SygDnW@fat_crate.local>
References: <20250327210305.1694664-1-boris.ostrovsky@oracle.com>
 <Z-XEPVvEDhC5vzR4@gmail.com>
 <f8ec905f-04d4-46f6-909c-7f79b151c0df@oracle.com>
 <Z-alzhvfSXN4liNE@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Z-alzhvfSXN4liNE@gmail.com>

On Fri, Mar 28, 2025 at 02:36:14PM +0100, Ingo Molnar wrote:
> It would be a pretty common usecase to attempt to load the earlier 
> version if the loading of a new one doesn't succeed, right?

This is only for late loading and no one should do that anyway.

And load failure almost never happens - unless you're a cloud guy doing
special hackery.

So no need to expedite this as a fix - the majority does not care.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
