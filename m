Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED3991E0DD8
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 10:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739182872; cv=none; b=Y1JWVXy2oGuJ0cGAHJNCkDkR/gu1TYxnvOwoKbZPMGvQB62qhTzaBJQqC2bog4m0i+5CQL0leSPUdlU3zJqquYxJjleF8KWDXG3n/4xuGXRns9OyAFnUiDBKJ18cyBpDiox+6M47+LKWGbYA3a2jRIm0oiMxuMdFlVLtBYzFwH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739182872; c=relaxed/simple;
	bh=u9GgjGvu0QBWtxvKk+a+VVmREQdmHqfFDcNZEkmI3vQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rw5nQ+rwoFdJ7zesco0sWXeGVorAL4K76JUrgxtRnh5xU7EanH6X7uGez7Any1kvUDSXE5KX5TIun9uEAqg5vqtGmRS4oA7XRnmI8GVdymHvdFwBDUuAka1G5ZwG2JhYO4rl232d0LvDLrJifPmvf6lAKxMsDhlm6jBZiC4nUaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=fail (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=aCYb8bEE reason="signature verification failed"; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="aCYb8bEE"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 352D740E01AE;
	Mon, 10 Feb 2025 10:13:43 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=fail (4096-bit key)
	reason="fail (body has been altered)" header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id VrB6JptckZ0c; Mon, 10 Feb 2025 10:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1739182418; bh=1YxNXPfG6/2a8n/ByV/bMQrXIbwTjsv0SBO9Ud1tCrY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aCYb8bEEoNf3tex9Z+2Lu9EQ/8IUv8LDJwBKVLD6wDc7QvX3Paz7nTXKXSxg1jXvF
	 3zbo5cp5nqw+tOepuzm8bFF7L2WWQHQ4Xj3Q+CsXmekAx6e5F3CUwEselDbjKio6b9
	 vw6mM6xfLu6yljR2nQSAaUk7nIZ1xhsIB92vteG4QI+YPgrh2/yUbGqG60lCdfDkyp
	 Gr+M2dJu/fs8Dpw4OpUm8b3mu1tI1WOPe8WUihJu7wrwHoasJNxwVLIeZKXRZU4E3k
	 sLVGSCM3mEHdRAFe0DDmIwKZ2jWWB6SV6SSLpH40+mKW/s0t1Cb9LGsW3ZacS3w0uN
	 0eGn65AD9OvD/65alq055Tmm1J/Xi/2b462AAVfTxVVVzS6yNf0oZ1OOwWYvfK0BzC
	 Wy1Pv51gx8WdG2RikW8cR/j59jR+yYriDIT/hrYNGc/uYdmetY8ddCLnkHM1lwRVYc
	 Sgj+PVWjMXkaid1Iq//Ro5iQy5iD+U0mDuQVBDcqLRZQuPCEo7R4IXKlO7gCutdwpJ
	 airLOVMYJYiq2FnmdpMZQYzS/K1RFmqB+/NOHnZCxCfkShNUEMz9r9l0YjJs+BbeaT
	 bAyjdnjI9oJ3BmY1f1s7CDfAMX/xkFIWmLC2KcMrBYu+xCXNOswwHpIkBCQ2aBSTGO
	 fOpi4m/D+V4vqMTYQNd6lGDk=
Received: from zn.tnic (pd95303ce.dip0.t-ipconnect.de [217.83.3.206])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 4ACC840E01A3;
	Mon, 10 Feb 2025 10:13:35 +0000 (UTC)
Date: Mon, 10 Feb 2025 11:13:28 +0100
From: Borislav Petkov <bp@alien8.de>
To: shivam tiwari <shivam.tiwari00021@gmail.com>
Cc: Dave Hansen <dave.hansen@linux.intel.com>,
	lkml <linux-kernel@vger.kernel.org>
Subject: Re: Review Required from your side
Message-ID: <20250210101328.GAZ6nRSKnoDcAWpBWi@fat_crate.local>
References: <CALz0HOq4u+24MEpgeX646KJ7V472B_EPfnmcJMC2oo2P=yHpbw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CALz0HOq4u+24MEpgeX646KJ7V472B_EPfnmcJMC2oo2P=yHpbw@mail.gmail.com>
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 08, 2025 at 03:54:10PM +0530, shivam tiwari wrote:
> Hii Team
> Can anyone from team Please Review this PR=C2=A0
> https://lore.kernel.org/kvm/20250128104525.47382-1-shivam.tiwari00021@g=
mail.com
> /#R

Please educate yourself first on how patches are sent for kernel inclusio=
n:

https://kernel.org/doc/html/latest/process/development-process.html

And this especially:

https://kernel.org/doc/html/latest/process/submitting-patches.html

Basically, you submit properly and logically split changes in patches to =
the
relevant maintainers as email messages on a mailing list and incorporate =
their
review feedback when you get it.

HTH.

--=20
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
