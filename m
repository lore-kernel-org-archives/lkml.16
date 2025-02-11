Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F19AA3EA76
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 02:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.67.55.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739239308; cv=none; b=jCNJh2UvzX2hoQU0iMhjzfNE7omqmxRRLiwAKRYYEu3E/tnhXS8OHWGeZExPU91V/F7bsczqkXyK9E/wbxJEuu0V2f4DeLs99E7nN2OJUOYG4uOk9/K1oz+QnJ8xu3QJDQw/WxCyqwGxjbmPB8Xt4riFVsFZXYx3fzqM4f8swsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739239308; c=relaxed/simple;
	bh=BWZcR6xncAXhNatZF73iqd2VwOt7UMWFCk3fGt5qHYg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=p90EZWX5AVVTwJ84xm0TR3coSKptTk0gTvwX6pvNh8Q769ktMe8NmKvOxYH/GcpGHGNJiiG/aEXQqjq+kg3HQeLwsL0SDf3C29/RrsMtK+RXuK7jPE1OFOyj3qUe8YuZPozp7dX1/AORV3v5zX860nHT3koERXeDgJX3laj/pk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com; spf=pass smtp.mailfrom=shelob.surriel.com; arc=none smtp.client-ip=96.67.55.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shelob.surriel.com
Received: from fangorn.home.surriel.com ([10.0.13.7])
	by shelob.surriel.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <riel@shelob.surriel.com>)
	id 1thfaK-000000000T0-0OkG;
	Mon, 10 Feb 2025 21:01:12 -0500
Message-ID: <24daac05a52fbd62a98eaad2ff689a89615a8287.camel@surriel.com>
Subject: Re: [PATCH v9 06/12] x86/mm: use INVLPGB for kernel TLB flushes
From: Rik van Riel <riel@surriel.com>
To: Brendan Jackman <jackmanb@google.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, bp@alien8.de, 
	peterz@infradead.org, dave.hansen@linux.intel.com,
 zhengqi.arch@bytedance.com, 	nadav.amit@gmail.com, thomas.lendacky@amd.com,
 kernel-team@meta.com, 	linux-mm@kvack.org, akpm@linux-foundation.org,
 jannh@google.com, 	mhklinux@outlook.com, andrew.cooper3@citrix.com, Manali
 Shukla	 <Manali.Shukla@amd.com>
Date: Mon, 10 Feb 2025 21:01:12 -0500
In-Reply-To: <CA+i-1C3LDJTf26WdBo7MvCdTs-dybqsUp3Ze7NowcOUHPWMXrg@mail.gmail.com>
References: <20250206044346.3810242-1-riel@surriel.com>
	 <20250206044346.3810242-7-riel@surriel.com>
	 <CA+i-1C3LDJTf26WdBo7MvCdTs-dybqsUp3Ze7NowcOUHPWMXrg@mail.gmail.com>
Autocrypt: addr=riel@surriel.com; prefer-encrypt=mutual;
 keydata=mQENBFIt3aUBCADCK0LicyCYyMa0E1lodCDUBf6G+6C5UXKG1jEYwQu49cc/gUBTTk33A
 eo2hjn4JinVaPF3zfZprnKMEGGv4dHvEOCPWiNhlz5RtqH3SKJllq2dpeMS9RqbMvDA36rlJIIo47
 Z/nl6IA8MDhSqyqdnTY8z7LnQHqq16jAqwo7Ll9qALXz4yG1ZdSCmo80VPetBZZPw7WMjo+1hByv/
 lvdFnLfiQ52tayuuC1r9x2qZ/SYWd2M4p/f5CLmvG9UcnkbYFsKWz8bwOBWKg1PQcaYHLx06sHGdY
 dIDaeVvkIfMFwAprSo5EFU+aes2VB2ZjugOTbkkW2aPSWTRsBhPHhV6dABEBAAG0HlJpayB2YW4gU
 mllbCA8cmllbEByZWRoYXQuY29tPokBHwQwAQIACQUCW5LcVgIdIAAKCRDOed6ShMTeg05SB/986o
 gEgdq4byrtaBQKFg5LWfd8e+h+QzLOg/T8mSS3dJzFXe5JBOfvYg7Bj47xXi9I5sM+I9Lu9+1XVb/
 r2rGJrU1DwA09TnmyFtK76bgMF0sBEh1ECILYNQTEIemzNFwOWLZZlEhZFRJsZyX+mtEp/WQIygHV
 WjwuP69VJw+fPQvLOGn4j8W9QXuvhha7u1QJ7mYx4dLGHrZlHdwDsqpvWsW+3rsIqs1BBe5/Itz9o
 6y9gLNtQzwmSDioV8KhF85VmYInslhv5tUtMEppfdTLyX4SUKh8ftNIVmH9mXyRCZclSoa6IMd635
 Jq1Pj2/Lp64tOzSvN5Y9zaiCc5FucXtB9SaWsgdmFuIFJpZWwgPHJpZWxAc3VycmllbC5jb20+iQE
 +BBMBAgAoBQJSLd2lAhsjBQkSzAMABgsJCAcDAgYVCAIJCgsEFgIDAQIeAQIXgAAKCRDOed6ShMTe
 g4PpB/0ZivKYFt0LaB22ssWUrBoeNWCP1NY/lkq2QbPhR3agLB7ZXI97PF2z/5QD9Fuy/FD/jddPx
 KRTvFCtHcEzTOcFjBmf52uqgt3U40H9GM++0IM0yHusd9EzlaWsbp09vsAV2DwdqS69x9RPbvE/Ne
 fO5subhocH76okcF/aQiQ+oj2j6LJZGBJBVigOHg+4zyzdDgKM+jp0bvDI51KQ4XfxV593OhvkS3z
 3FPx0CE7l62WhWrieHyBblqvkTYgJ6dq4bsYpqxxGJOkQ47WpEUx6onH+rImWmPJbSYGhwBzTo0Mm
 G1Nb1qGPG+mTrSmJjDRxrwf1zjmYqQreWVSFEt26tBpSaWsgdmFuIFJpZWwgPHJpZWxAZmIuY29tP
 okBPgQTAQIAKAUCW5LbiAIbIwUJEswDAAYLCQgHAwIGFQgCCQoLBBYCAwECHgECF4AACgkQznneko
 TE3oOUEQgAsrGxjTC1bGtZyuvyQPcXclap11Ogib6rQywGYu6/Mnkbd6hbyY3wpdyQii/cas2S44N
 cQj8HkGv91JLVE24/Wt0gITPCH3rLVJJDGQxprHTVDs1t1RAbsbp0XTksZPCNWDGYIBo2aHDwErhI
 omYQ0Xluo1WBtH/UmHgirHvclsou1Ks9jyTxiPyUKRfae7GNOFiX99+ZlB27P3t8CjtSO831Ij0Ip
 QrfooZ21YVlUKw0Wy6Ll8EyefyrEYSh8KTm8dQj4O7xxvdg865TLeLpho5PwDRF+/mR3qi8CdGbkE
 c4pYZQO8UDXUN4S+pe0aTeTqlYw8rRHWF9TnvtpcNzZw==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.1 (3.54.1-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Sender: riel@surriel.com

On Fri, 2025-02-07 at 17:03 +0100, Brendan Jackman wrote:
> On Thu, 6 Feb 2025 at 05:45, Rik van Riel <riel@surriel.com> wrote:
> > diff --git a/arch/x86/mm/tlb.c b/arch/x86/mm/tlb.c
> > index 36939b104561..227e972b6fbc 100644
> > --- a/arch/x86/mm/tlb.c
> > +++ b/arch/x86/mm/tlb.c
> > @@ -1086,6 +1086,30 @@ void flush_tlb_all(void)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 on_each_cpu(do_flush_tlb_all=
, NULL, 1);
> > =C2=A0}
> >=20
> > +static bool broadcast_kernel_range_flush(struct flush_tlb_info
> > *info)
> > +{
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long addr;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long nr;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!IS_ENABLED(CONFIG_X86_BROADC=
AST_TLB_FLUSH))
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 return false;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!cpu_feature_enabled(X86_FEAT=
URE_INVLPGB))
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 return false;
>=20
> I think that first conditional can be shunted off into the header
>=20
> diff --git a/arch/x86/include/asm/disabled-features.h
> b/arch/x86/include/asm/disabled-features.h
> index c492bdc97b05..61376b4e4fa7 100644
> --- a/arch/x86/include/asm/disabled-features.h
> +++ b/arch/x86/include/asm/disabled-features.h
> @@ -129,6 +129,12 @@
> =C2=A0#define DISABLE_SEV_SNP=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (1 << (X86_FEATURE_SEV_SNP=
 &
> 31))
> =C2=A0#endif
>=20
> +#ifdef CONFIG_X86_BROADCAST_TLB_FLUSH
> +#define DISABLE_INVLPGB=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0
> +#else
> +#define DISABLE_INVLPGB=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (1 << =
(X86_FEATURE_INVLPGB & 31))
> +#endif
> +

I'm adding this for v10, with the disabled-features.h
stuff in patch 5, and removing the no longer needed
tests from each subsequent patch.

--=20
All Rights Reversed.
