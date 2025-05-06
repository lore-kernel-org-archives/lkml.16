Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C221155C83
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 17:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746554104; cv=none; b=h6oQtKB8QSlas51OmmfHMXRGStEGbq/c0kJd2zi/d21r0pLSPu1aLvDzgukNdVO/EUHryJ5GSXz0H/IkuFFnA5uX5Tf9T4q6z3w97ucmD4gNoqzAPWR2EzFtklJEVQahz5KspgzCOZ+NSW0yBQCcFShQjEB8Sbvj7TbqWOi1YkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746554104; c=relaxed/simple;
	bh=zeKQ7SJxlnH4RiLpiGhYDSXYG79t/zm3ZtEOnuEmM04=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=fGH/3vjKJhuPm6ZQD4FcQ7mp8tqo4PDnoD7MUSfi5qnu10eDgbSmxzh4RoFjsR3Nd3TP0+wwpUShfSL930M+4XNXdij3Tzb+F+2MdjqJPbZS/BCZFs/EP8GxsekKMvliYo/ixxctMGLDDRfMWlKgI+hSvzfe+PpALTwC0TJkXrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=c0dYM6Dv; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="c0dYM6Dv"
Received: from [127.0.0.1] ([76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 546HsauH1003209
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Tue, 6 May 2025 10:54:36 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 546HsauH1003209
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025042001; t=1746554077;
	bh=0NXm/XN95lobvCxZ9ctEajsla4qk8Bp9QFGjMN8vb+E=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=c0dYM6DvBZlbms21oI9AfH/nY3vSR9cGc8v5FLB7i1MLQtXPuE20ZYfoEXB7FhfvT
	 PwHfwtyqPstQ3PpucQNFliaX5N9n5MnTi2mlb4Gjp/W3e/bV4NVq6UA5FlSfWPLbOD
	 ITiqmQtqAKV1M6C2j3G88vwJPADtwpvuLKmgQ/8NsE9iDp0V93/osWcEUeNY0MTpHo
	 ATQ6CZchjGMSUTMWm5yMpAt8fGXZ7pzmMYIDzVnYISXhYncgcGEP7BWMwCTl47LgjU
	 zorKHtKIijvvP5Vuaa2x3EtjQFYBGfVZPfcWVLqIeQTdgLRL1IF6urgdEzwh+GYLEw
	 nu/R07Pa9KGOg==
Date: Tue, 06 May 2025 10:54:35 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Uros Bizjak <ubizjak@gmail.com>, x86@kernel.org,
        linux-kernel@vger.kernel.org
CC: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        torvalds@linux-foundation.org
Subject: Re: [PATCH -tip 1/3] x86/asm/32: Modernize memset() functions
User-Agent: K-9 Mail for Android
In-Reply-To: <20250506165227.158932-1-ubizjak@gmail.com>
References: <20250506165227.158932-1-ubizjak@gmail.com>
Message-ID: <F66E73EB-7237-439F-8408-C0C39B1CE2D2@zytor.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On May 6, 2025 9:52:06 AM PDT, Uros Bizjak <ubizjak@gmail=2Ecom> wrote:
>Use inout "+" constraint modifier where appropriate and declare
>temporary variable using __auto_type, similar to what x86_64 does=2E
>
>No functional changes intended=2E
>
>Signed-off-by: Uros Bizjak <ubizjak@gmail=2Ecom>
>Cc: Thomas Gleixner <tglx@linutronix=2Ede>
>Cc: Ingo Molnar <mingo@kernel=2Eorg>
>Cc: Borislav Petkov <bp@alien8=2Ede>
>Cc: Dave Hansen <dave=2Ehansen@linux=2Eintel=2Ecom>
>Cc: "H=2E Peter Anvin" <hpa@zytor=2Ecom>
>---
> arch/x86/include/asm/string_32=2Eh | 24 ++++++++++++------------
> 1 file changed, 12 insertions(+), 12 deletions(-)
>
>diff --git a/arch/x86/include/asm/string_32=2Eh b/arch/x86/include/asm/st=
ring_32=2Eh
>index e9cce169bb4c=2E=2E9152d2c0f60e 100644
>--- a/arch/x86/include/asm/string_32=2Eh
>+++ b/arch/x86/include/asm/string_32=2Eh
>@@ -164,12 +164,12 @@ extern void *memchr(const void *cs, int c, size_t c=
ount);
>=20
> static inline void *__memset_generic(void *s, char c, size_t count)
> {
>-	int d0, d1;
>+	const __auto_type s0 =3D s;
> 	asm volatile("rep stosb"
>-		     : "=3D&c" (d0), "=3D&D" (d1)
>-		     : "a" (c), "1" (s), "0" (count)
>+		     : "+D" (s), "+c" (count)
>+		     : "a" (c)
> 		     : "memory");
>-	return s;
>+	return s0;
> }
>=20
> /* we might want to write optimized versions of these later */
>@@ -197,23 +197,23 @@ extern void *memset(void *, int, size_t);
> #define __HAVE_ARCH_MEMSET16
> static inline void *memset16(uint16_t *s, uint16_t v, size_t n)
> {
>-	int d0, d1;
>+	const __auto_type s0 =3D s;
> 	asm volatile("rep stosw"
>-		     : "=3D&c" (d0), "=3D&D" (d1)
>-		     : "a" (v), "1" (s), "0" (n)
>+		     : "+D" (s), "+c" (n)
>+		     : "a" (v)
> 		     : "memory");
>-	return s;
>+	return s0;
> }
>=20
> #define __HAVE_ARCH_MEMSET32
> static inline void *memset32(uint32_t *s, uint32_t v, size_t n)
> {
>-	int d0, d1;
>+	const __auto_type s0 =3D s;
> 	asm volatile("rep stosl"
>-		     : "=3D&c" (d0), "=3D&D" (d1)
>-		     : "a" (v), "1" (s), "0" (n)
>+		     : "+D" (s), "+c" (n)
>+		     : "a" (v)
> 		     : "memory");
>-	return s;
>+	return s0;
> }
>=20
> /*

So __auto_type is spelled "auto" in newer C versions, but "auto" was a (co=
mpletely useless!) keyword going all the way back to K&R C=2E Can anyone th=
ink of a reason why we don't do:=20

#define auto __auto_type

=2E=2E=2E and just start using the modern keyword right away?=20

    -hpa
