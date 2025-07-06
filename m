Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB86728F930
	for <linux-kernel@vger.kernel.org>; Sun,  6 Jul 2025 17:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751821686; cv=none; b=k5ZBq9QflQNPY3nLqkw04Xr7+6nonOqi9/LYBWLECbGWtirMl7V/nBZk/J7/8aRjKZHYq1Pu52lHvrMXJkooe5c5la3/JqfIeGINbUrY7mFSyXXgb7IY+in6avkYb9GCxu3z39jBdaN/U/7kCwb6bdznTxcaxhZD2TudfQMPL8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751821686; c=relaxed/simple;
	bh=I7x6eWhJt8np9v/ZB3ijft0EZO0r/w4RHpRRD141e/U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mLIotZhiqqWd8CTyOvr4MHjKHYFXNPv/mJ1qpXe/J0VuNBpUfmjC52lWmRjkHLTeDeIuO4WXUFM+G7XgvB3/pPjIlzJiD3raThxuZpV+FQAqn+0ATxt7vSjbVfB7fcbmKN37KyDmc0aeCtHUUeVUHgwdLjSEBwZdDSXAnojXLKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=fail (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=ZcoaMj1+ reason="signature verification failed"; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="ZcoaMj1+"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 35FF040E0198;
	Sun,  6 Jul 2025 17:07:59 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=fail (4096-bit key)
	reason="fail (body has been altered)" header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id wZ8768tEhcc1; Sun,  6 Jul 2025 17:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1751821675; bh=GIJVZV1ImBuCwY7VcnGimrzovJhVBsmqyLwxKPxBJsE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZcoaMj1+qQeymTBpAo/sDpdF5akmAl5wS1HoW9W99XgCRabmFI2g+kREazyc8uOkr
	 Mb5HHH0SkoSGbnE5vXbGQqqJD7CkKerKrSxgsnJVwZIAw46sY+c+MUGI90g0oPwy1y
	 IitNM4fDQBZNB9SU77DrxbQBjzQSFHyS/3Qx9kD0w/cEXJySgRUOpMmXRu5jAbIXzh
	 1BaY9oyIhNfRLXgMc8M5GtL8Wu8h7UHNOCGNWPyh25NwU8wmJaWy8K1A+JpsIEKXKS
	 d1xy0IcpJ6O5fZgSvcxrpGMp+G7Hc339/Zu5chsoMdH3LCW/VaoBdOgtwy+jA4UhLW
	 nWS9K9Wug7e6mhAdUI+LATZDbx02NDf1VWrz3iwHtsncWn9YOfJnSHvR9tpmSDov5H
	 VGsf89krAxCOW1aTkzqs08D2PWyR0XDyAZK3al0aKJ3RbyllJk0vdbBKpnU9LaRER0
	 L1p/8U8vbtE7evlrvfNY2VY4mqfUKE1Rie3L/XjIlzCqGTKwZvdtia/jQ6vuGwfZbF
	 6XGmRlvEVihsmTwKBroBGM4aROdY98gK05Metr0Xih+yoyVpR1d0FfvI2OAg82a2Ws
	 BNPvF0S65ahdwOV5GOem0ouAyxHJn6LIT9vFUAEwLpGYF8Y7gsAMQzfkZ/yLR1weix
	 w7QWPQSYjZex7I8OCMIy0EGU=
Received: from zn.tnic (p57969c58.dip0.t-ipconnect.de [87.150.156.88])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 9D35040E01CF;
	Sun,  6 Jul 2025 17:07:47 +0000 (UTC)
Date: Sun, 6 Jul 2025 19:07:41 +0200
From: Borislav Petkov <bp@alien8.de>
To: Mikhail Paulyshka <me@mixaill.net>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	linux-kernel@vger.kernel.org, Rik van Riel <riel@surriel.com>
Subject: Re: [PATCH v2 1/1] x86/rdrand: disable RDSEED on AMD Cyan Skillfish
Message-ID: <20250706170741.GAaGqtXT99yYVoEmCh@fat_crate.local>
References: <20250524145319.209075-1-me@mixaill.net>
 <20250617200551.GIaFHKnyPV_XsSjlMP@fat_crate.local>
 <1ebe845b-322b-4929-9093-b41074e9e939@mixaill.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1ebe845b-322b-4929-9093-b41074e9e939@mixaill.net>
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 06, 2025 at 07:42:39PM +0300, Mikhail Paulyshka wrote:
> On 6/17/25 11:05 PM, Borislav Petkov wrote:
> > Does this one work too?
>=20
> It works, however, there is another issue with the BC250 that appeared =
since
> Linux 6.15.
>=20
> Commit 4afeb0ed1753ebcad93ee3b45427ce85e9c8ec40 ( x86/mm: Enable broadc=
ast
> TLB invalidation for multi-threaded processes)[1], merged in Linux 6.15=
-rc1,
> breaks the device =E2=80=94 it starts to oops and panic under any load =
[2].

Looks like it GPs because CR4.PCID =3D=3D 0.

Looks weird, we need to check PCID support somewhere, it seems.

Ok, let's get a common code base - 6.15. Pls boot it, send me full dmesg
again, your .config and the output of

cpuid -1r

Thx.

--=20
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
