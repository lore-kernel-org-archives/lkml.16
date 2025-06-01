Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A3D81AB6DE
	for <linux-kernel@vger.kernel.org>; Sun,  1 Jun 2025 11:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.208.246.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748776081; cv=none; b=UDMxdXCoj5CCGLWpkAoNTgqCPZylFGUCgV+yMBtLvtp2XqsbtZKBlO/MIo4ZDnF5iWAcOBD6ECS21o674LoV8RiyiyK3aVMZRXOxZmlGMgOAezzrc2xZr3w54ZmqWr5MkB77jFRde6egUn0d7t0nc0JWzI8+EZTALQjhFalrz1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748776081; c=relaxed/simple;
	bh=9QMIpAH6NFKQap5Fb+99LAh0q2v1GpqTteKnsAkJVCk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rVkFBSVbBC1vp+D7ZlqDwziYRBYCwRJUOewJ3UeH8f7aJs+aXlKmywRuPjC+yEPMXCwwMGUb3a+6plsKGOmP5kodBPXU+RsTACDHFsn48oTn4+N0/WrNfRT6ywTxxSmpJh8eiTo1eUQ0tk9P+kl6Isegbr1TlpLAgOWjz0jONLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site; spf=pass smtp.mailfrom=xry111.site; dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b=TicGXBwO; arc=none smtp.client-ip=89.208.246.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xry111.site
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b="TicGXBwO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xry111.site;
	s=default; t=1748776070;
	bh=hKhVByH1JS0rBl33pOUWJ5wxT4Cf0woFMhGBqcl6mic=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=TicGXBwO/bwNydRCVk2RXFf5OwhjZkiJc5CmXZo+mWyEKBBgl7Xn7iEYg7HSWETGG
	 BIZffZoFwQREmb1obWA0wAm3Ya38RnomdWMlQpLW4qz/9NebHYYXhk4kaQx9zEIdlo
	 3iYFAEe6bmMO/6G9Ifxa4wrfnf7ysPIzIgNQy440=
Received: from [IPv6:2408:8471:1010:e6f3:578c:2418:85e9:46f9] (unknown [IPv6:2408:8471:1010:e6f3:578c:2418:85e9:46f9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id A15F465F62;
	Sun,  1 Jun 2025 07:07:46 -0400 (EDT)
Message-ID: <280ed3f89c2ca4c97059ef642a092cbcf7cda869.camel@xry111.site>
Subject: Re: [PATCH] LoongArch: Add numa_add_reserved_memblk() support in
 numa
From: Xi Ruoyao <xry111@xry111.site>
To: Yulong Han <wheatfox17@icloud.com>, chenhuacai@kernel.org
Cc: kernel@xen0n.name, broonie@kernel.org, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Date: Sun, 01 Jun 2025 19:07:41 +0800
In-Reply-To: <20250601102924.2417248-1-wheatfox17@icloud.com>
References: <20250601102924.2417248-1-wheatfox17@icloud.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sun, 2025-06-01 at 18:29 +0800, Yulong Han wrote:
> This patch fixes the error below when compiling kernel with
> loongarch's loongson3_defconfig:
>=20
> drivers/acpi/numa/srat.c: In function =E2=80=98acpi_parse_cfmws=E2=80=99:
> drivers/acpi/numa/srat.c:467:13: error: implicit declaration of function
> =E2=80=98numa_add_reserved_memblk=E2=80=99 [-Werror=3Dimplicit-function-d=
eclaration]
> =C2=A0 467 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (numa_add=
_reserved_memblk(node, start, end) < 0) {

>=20
> The error is caused by the missing the newly added=20
> numa_add_reserved_memblk (under include/linux/numa_memblks.h) definition
> inside loongarch's numa related code.
>=20
> The commit's code(style) was formatted by ./scripts/checkpatch.pl

> Signed-off-by: Yulong Han <wheatfox17@icloud.com>

Note that=C2=A0numa_add_reserved_memblk would be declared by=20
linux/numa_memblks.h if CONFIG_NUMA_MEMBLKS, and CONFIG_NUMA_MEMBLKS
would be select after
https://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.g=
it/commit/?h=3Dloongarch-next&id=3Da24f2fb70cb62180486ad4d74f809ff35ddd1cf9
which would be merged into Torvalds' tree soon.  You change fails to
notice this and it's just covering up the issue.

Thus

Nacked-by: Xi Ruoyao <xry111@xry111.site>

--=20
Xi Ruoyao <xry111@xry111.site>
School of Aerospace Science and Technology, Xidian University
