Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 238AE156F2B
	for <linux-kernel@vger.kernel.org>; Sat,  1 Feb 2025 12:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.208.246.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738412269; cv=none; b=ogRSVPOmiX55wiyrB2twRgnVt+/zDwtBEn3KHmhe9B5flMIMoZZSOHkbw3VLGUeXhXWfHfM76tGtL9snT7qNm7Py6w9DL6KBbjTUN7QgY4intzSgzR/xbvt80qCMc5Q2++lSG3yAdvMKQqpWTMSLXM7mEd0yDFElqRYe/Ln4x/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738412269; c=relaxed/simple;
	bh=x+ntTXU/FWk/bNt3LwvZLk1Hf+8VoO1qxFzWi4zWQY4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mEp5NvtoFiKr0nyipijqHDD1w5fV2zhzQie5J/BORb3L2IwqLZwaFYwjhIU/+0Ovj2a4dV+qmozucnkEJjOxkJF2WsKHdpiiM7xMS8PG8mVNRPnVlwnp+YmUXWZM9UZWMeqX5dkR/k9SfSEzAdiPdzotbIkK9dCxLV34zErqdrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site; spf=pass smtp.mailfrom=xry111.site; dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b=bl8o5gQs; arc=none smtp.client-ip=89.208.246.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xry111.site
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b="bl8o5gQs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xry111.site;
	s=default; t=1738412267;
	bh=npjSYdUKFiKHmWY759vCSQMQIYrqZTGlxSbAFphl1wg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=bl8o5gQsu8x5IKikXPPi4TkdetWVXLrORGhW5/UTGnGvp/MXJJ8cUhAfq9NFVp/Wa
	 ofmPLiW1ERi+o9b+k9uDmjmAF5pt4gpMpWaoujwPIw8HJRk6LQUgGDBAY83UDsdHzi
	 D9zv5cEunvWkuaXLbMFTjyjzBjiCcu26EKvpQbfA=
Received: from [127.0.0.1] (unknown [IPv6:2001:470:683e::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1))
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id B41FB67342;
	Sat,  1 Feb 2025 07:17:46 -0500 (EST)
Message-ID: <6c129a4e822e8504a48daa0db7b385a813f96c69.camel@xry111.site>
Subject: Re: [PATCH] riscv/atomic: Do proper sign extension also for
 unsigned in arch_cmpxchg
From: Xi Ruoyao <xry111@xry111.site>
To: Andreas Schwab <schwab@suse.de>, linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Date: Sat, 01 Feb 2025 20:17:45 +0800
In-Reply-To: <mvmed0k4prh.fsf@suse.de>
References: <mvmed0k4prh.fsf@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2025-01-30 at 10:25 +0100, Andreas Schwab wrote:
> Sign extend also an unsigned compare value to match what lr.w is doing.
> Otherwise try_cmpxchg may spuriously return true when used on a u32 value
> that has the sign bit set, as it happens often in inode_set_ctime_current=
.
>=20
> Do this in three conversion steps.=C2=A0 The first conversion to long is =
needed
> to avoid a -Wpointer-to-int-cast warning when arch_cmpxchg is used with a
> pointer type.=C2=A0 Then convert to int and back to long to always sign e=
xtend
> the 32-bit value to 64-bit.
>=20
> Fixes: 6c58f25e6938 ("riscv/atomic: Fix sign extension for RV64I")
> Signed-off-by: Andreas Schwab <schwab@suse.de>

It fixes the gnulib test-stat-time failure for me.

Tested-by: Xi Ruoyao <xry111@xry111.site>

> ---
> =C2=A0arch/riscv/include/asm/cmpxchg.h | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cm=
pxchg.h
> index 4cadc56220fe..427c41dde643 100644
> --- a/arch/riscv/include/asm/cmpxchg.h
> +++ b/arch/riscv/include/asm/cmpxchg.h
> @@ -231,7 +231,7 @@
> =C2=A0		__arch_cmpxchg(".w", ".w" sc_sfx, ".w" cas_sfx,		\
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sc_prepend, sc_append,			\
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cas_prepend, cas_append,			=
\
> -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __ret, __ptr, (long), __old, __n=
ew);	\
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __ret, __ptr, (long)(int)(long),=
 __old, __new);	\
> =C2=A0		break;							\
> =C2=A0	case 8:								\
> =C2=A0		__arch_cmpxchg(".d", ".d" sc_sfx, ".d" cas_sfx,		\
> --=20
> 2.48.1

--=20
Xi Ruoyao <xry111@xry111.site>
School of Aerospace Science and Technology, Xidian University
