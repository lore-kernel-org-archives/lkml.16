Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28799230BCB
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 09:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750669636; cv=none; b=nJIMTtNOSO08TXD4ospVRvEfwjEkjDfll3Gc0oTxbOsWszG7vloQqbCMLGP38ZPP+NIW2RQwjvZzeONI97+y3dkw0tx1qcYSxF2OnS7EmSJVl0drK1yAJCsEhreEMuv5i2biO0sWLwegWhWei+DkzGOrZMXVOEeI3zRmxgB7Az0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750669636; c=relaxed/simple;
	bh=IMn1P+Ks/bP+QpJ9jZdSw40fJOriQfWoh50hrGcZl0Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YBBZt7y3sL36tFyzhikQZ0bu7ch2ZUkGppATWIWQ3VIHQFFREaYes9g1vPTaidBrr+iUhH7JAnXZwOxElLd4+0FyLJJ3gSzK4tKju+myEsoYu1hqrKhNgwJ5cB5SsH0OHZDezolCMVKBs7H3I14AJKZb3qSmm84fyFzHj5g3XtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=fail (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=MHW35Idm reason="signature verification failed"; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="MHW35Idm"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 26E8440E019C;
	Mon, 23 Jun 2025 09:07:03 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=fail (4096-bit key)
	reason="fail (body has been altered)" header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id mPTrE7O2tqK2; Mon, 23 Jun 2025 09:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1750669617; bh=lydqhroFjgZ6ZeKfBnx6w6jtbaclgyltyHQ0uhub7Nw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MHW35Idmn3yisFD+6SXiKxE3yBRmKHgGHomZ81/Tb7zYJ7Rh7wZDTFtjyvZ8+tYpr
	 +n/dr7fuQ0yRQ8w0x0vfFeA96lmqNOaZ45dwL5fIXIP8GwYxlsjvnhLLeLzOOXRdIT
	 cq2X6aS/9WdCBcTpqZOgmYnHvxNDwgrvaj7/jXuRv9SK9PSEEo9v2rlGSGV26vY1NZ
	 HBQObcQNivBgxEIx0LxusCHvuaVvS1/q6CXaNm8i7wjXlN2yvJUwFUSz9VG616IqlT
	 HA0a5C3d6x/FzkWRy/w9+52vTU5Pz8KaDj2vPDfE4igmCdvPNkcaByqDhAOJhRzBut
	 FH/4RvetFQeXJBW/VuWZddqUfYV2kNvXcsaWzKh/9ToxmVFTYxp0uaK4DKUw/ccnLi
	 RtujHGQT/hUMU5IMCrTSbCH3YGMyNBCO0XBtT5fu4n4FeziMb2XimzeNrdxb5zyjoE
	 Q+l5rDHc/uWpawTNWU1G5OiS09PsbVeSYMUxrX3SbLLhexAPd6eIMQzr91puLPEZaG
	 4nTW9WdBKBa2Pm+TGmvONnGLgvKoda0pMMyTlfvAgp+musY+vvRfEnCrYmABBZ8JKE
	 bYjJOu4qSfyAG3a1z1G+mHxbyRo8rlTOxN8kJZbX4DxPG+vfBTY7P1Fuma/AYEvtO9
	 Iv+kTFTiClDzA2LoJdDUa/I8=
Received: from zn.tnic (p57969c58.dip0.t-ipconnect.de [87.150.156.88])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id D561A40E00DD;
	Mon, 23 Jun 2025 09:06:48 +0000 (UTC)
Date: Mon, 23 Jun 2025 11:06:42 +0200
From: Borislav Petkov <bp@alien8.de>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Daniel =?utf-8?B?RMOtYXo=?= <daniel.diaz@linaro.org>
Subject: Re: [PATCH v1 1/1] x86/defconfigs: Explicitly unset CONFIG_64BIT in
 i386_defconfig
Message-ID: <20250623090642.GAaFkZIq__HR0FJE-0@fat_crate.local>
References: <20250623072536.3425344-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250623072536.3425344-1-andriy.shevchenko@linux.intel.com>
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 23, 2025 at 10:25:36AM +0300, Andy Shevchenko wrote:
> From: Daniel D=C3=ADaz <daniel.diaz@linaro.org>
>=20
> A recent refresh of the defconfigs got rid of the following
> (unset) config:
>=20
>   # CONFIG_64BIT is not set
>=20
> Innocuous as it seems, when the config file is saved again the
> behavior is changed so that CONFIG_64BIT=3Dy.
>=20
> Currently,
>=20
>   $ make i386_defconfig
>   $ grep CONFIG_64BIT .config
>   CONFIG_64BIT=3Dy
>=20
> whereas previously (and with this patch):
>=20
>   $ make i386_defconfig
>   $ grep CONFIG_64BIT .config
>   # CONFIG_64BIT is not set
>=20
> Fixes: 0e11f689ec03 ("x86/kconfig/32: Refresh defconfig")
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

No SOB by Daniel?

--=20
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
