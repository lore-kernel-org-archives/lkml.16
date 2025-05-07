Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F262A1A4
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 20:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746648932; cv=none; b=lTEuWkfkixNWdr271WNv2alQKhp2x2Z5kKNTU8uHCDsEu5l5ejrauAxq5j3MnvF1X6cKX+urLvxdzPQMmUYklsi4V5/IRgokNW8z/TMUN1eWpbms7Cor9r4mjUgCumKKjcUr9G2ajMP4tdOcFlBZGXvYDLy20jo1TsiqGydSt3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746648932; c=relaxed/simple;
	bh=YkOSqykTU7xdwKL4eEKP8oPS4NqVBRno6U2VJwt5ZvY=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=MH/+siDEdFLHenS3GfAzpfR8icazD3nMLRW7kDJBfmdtcuT/yPfkaKxt02W/SduRsCy+MCDnqFYTIx+Z69huy7e0LR+DroE4kae9H1dEx5JVXxxMBvvtXpRHWcUiPnOWhRE+q06PE5UYNY59RO2JDXguvS8Gk50vrvqVoJaJ1qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=gmWJog+h; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="gmWJog+h"
Received: from [127.0.0.1] ([76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 547KEW3i1601996
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Wed, 7 May 2025 13:14:33 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 547KEW3i1601996
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025042001; t=1746648873;
	bh=FTVPn+BKEVyHcCgjVVxjYsUIdZVQ40FAZIKsA1lrkHU=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=gmWJog+hq93oFlQA0WKn+Uy38Fptd5yT6wbAyIVSsPyS4Dm+TpLzfxUZPUeJMsll+
	 4hHCvrMA0AjVEvz7SKCu4Prr0adJSWN9OMcuiRjkgc8/1De2u/DuIy5layQSBbtoGL
	 Q4ud/y9bj5epcegrNNB3NTmCChdinIUHD3yUAMrGGqHs7Ppry9ItzKzrtkfu6Ip3/Y
	 qMLhWeNTDj3gcgExsmcw5Wda55CaXkjPIDGpdhjLmKSCwEAEBbYzbjQzauOkh0en2K
	 lN6mQtscVWpIO1H9OpMj6xdr2PCMGfojV0xPBpjYnKEqv+01Rd5EeH69iH6bi4vKnk
	 gtaR72jAHROUw==
Date: Wed, 07 May 2025 13:14:31 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Ruben Wauters <rubenru09@aol.com>, Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org
CC: linux-kernel@vger.kernel.org
Subject: Re: [PATCH] x86/cpu/intel: replace deprecated strcpy with strscpy
User-Agent: K-9 Mail for Android
In-Reply-To: <20250507185459.8769-1-rubenru09@aol.com>
References: <20250507185459.8769-1-rubenru09.ref@aol.com> <20250507185459.8769-1-rubenru09@aol.com>
Message-ID: <3AFD7702-7D6F-479C-950A-CA439E01838C@zytor.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On May 7, 2025 11:51:36 AM PDT, Ruben Wauters <rubenru09@aol=2Ecom> wrote:
>strcpy is deprecated due to lack of bounds checking=2E
>This patch replaces strcpy with strscpy, the recommended alternative for
>null terminated strings, to follow best practices=2E
>
>Signed-off-by: Ruben Wauters <rubenru09@aol=2Ecom>
>---
> arch/x86/kernel/cpu/intel=2Ec | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/arch/x86/kernel/cpu/intel=2Ec b/arch/x86/kernel/cpu/intel=2E=
c
>index 584dd55bf739=2E=2Eb49bba30434d 100644
>--- a/arch/x86/kernel/cpu/intel=2Ec
>+++ b/arch/x86/kernel/cpu/intel=2Ec
>@@ -607,7 +607,7 @@ static void init_intel(struct cpuinfo_x86 *c)
> 		}
>=20
> 		if (p)
>-			strcpy(c->x86_model_id, p);
>+			strscpy(c->x86_model_id, p);
> 	}
> #endif
>=20

strscpy() needs a buffer length; this patch wouldn't even compile!

Not to mention that the string in question is generated in such a way that=
 cannot be unterminated=2E
