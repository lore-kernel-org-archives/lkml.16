Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51E55169AE6
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 21:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.67.55.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747517431; cv=none; b=CBskjZQQXR3WOg78aAO2Og1IkJCegssCOq8rZ5jZpj5uOAHEkKrHrtL3SQIVljTxNURLkKigQb28Em2Orqp31WFrA/IGWWGbl1Dt7OObpS3GrK1VZ32TJtVGe69lAQYzHmADLgdgwxVJpz3ELCnXOk2KRuIU9elEm0yWCRNX3Pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747517431; c=relaxed/simple;
	bh=Y02q1bjUctrONNfHkzfH6DO2cAdSNJ81Hhw5HKi2XEg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cIoqz3a2QOxWz9RIOQoJVCzYqLQv7d/i7xHnWsgEXnvMLUu4pFC18RCzl6Qm1R1SxWfL+3mYrYUmmGlD6DsYiUHXum6hHZABgarartXVb3+tzt/UW6VJy9ILaU/V5LL6axi0MPTvi21MuY4xARfYsmvb73aX4VTveI/S9rfozJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com; spf=pass smtp.mailfrom=shelob.surriel.com; arc=none smtp.client-ip=96.67.55.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shelob.surriel.com
Received: from fangorn.home.surriel.com ([10.0.13.7])
	by shelob.surriel.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <riel@shelob.surriel.com>)
	id 1uGP5e-000000000m0-1sNu;
	Sat, 17 May 2025 17:29:06 -0400
Message-ID: <0cd34b6c8d8009fd6f626f3287ce36e55374b140.camel@surriel.com>
Subject: Re: [PATCH] x86/mm: resize user_pcid_flush_mask for PTI / broadcast
 TLB flush combination
From: Rik van Riel <riel@surriel.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski
 <luto@kernel.org>,  Peter Zijlstra <peterz@infradead.org>, Ingo Molnar
 <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 	x86@kernel.org,
 linux-kernel@vger.kernel.org, kernel-team@meta.com
Date: Sat, 17 May 2025 17:29:06 -0400
In-Reply-To: <aChB9ORFxaL8VfyD@gmail.com>
References: <20250516123317.70506358@fangorn> <aChB9ORFxaL8VfyD@gmail.com>
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
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Sender: riel@surriel.com

On Sat, 2025-05-17 at 09:59 +0200, Ingo Molnar wrote:
>=20
> CONFIG_X86_TLB_BROADCAST_TLB_FLUSH doesn't actually exist, the name
> is=20
> CONFIG_BROADCAST_TLB_FLUSH.
>=20
Argh, cut'n'pasted from the wrong tree :(

>=20
> we could make this a more obvious:
>=20

> And we can drop the ugly & fragile type cast in
> invalidate_user_asid():
>=20
> -	__set_bit(kern_pcid(asid),
> -		=C2=A0 (unsigned long
> *)this_cpu_ptr(&cpu_tlbstate.user_pcid_flush_mask));
>=20
> +	__set_bit(kern_pcid(asid),
> this_cpu_ptr(cpu_tlbstate.user_pcid_flush_mask));
>=20
That is a really nice improvement, and it almost
works, too ;)

In file included from ./arch/x86/include/asm/bitops.h:430,
                 from ./include/linux/bitops.h:68:
./include/asm-generic/bitops/instrumented-non-atomic.h:26:54: note:
expected =E2=80=98volatile long unsigned int *=E2=80=99 but argument is of =
type =E2=80=98long
unsigned int (*)[32]=E2=80=99
   26 | ___set_bit(unsigned long nr, volatile unsigned long *addr)
      |                              ~~~~~~~~~~~~~~~~~~~~~~~~^~~~


I ended up settling for this:

      __set_bit(kern_pcid(asid),
this_cpu_ptr(&cpu_tlbstate.user_pcid_flush_mask[0]));

> 3)
>=20
> If we are going to grow user_pcid_flush_mask from 2 bytes to 256
> bytes=20
> then please reorder 'struct tlb_state' for cache efficiency: at
> minimum=20
> the ::cr4 shadow should move to before ::user_pcid_flush_mask. But I=20
> think we should probably move user_pcid_flush_mask to the end of the=20
> structure, where it does the least damage to cache layout.

Done. V2 to follow in another email.

Thank you!

--=20
All Rights Reversed.
