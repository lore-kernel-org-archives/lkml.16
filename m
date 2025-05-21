Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E17A0283684
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 15:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.67.55.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747843170; cv=none; b=Yh5AazdtUzIQ4qljly+9q082YAZKUv6mPokt/royaGbtpzfBoSllMAsWndZlRRQEEEfvReXoGgnAypEfCqfHige+aMzyPIj+SJWF4dLP+d8EMw2fHfh2OGqVChzupNd/TDaJb13y/znu0lUcSEmR/VvLqhg2UB2myTJd+tyuwcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747843170; c=relaxed/simple;
	bh=gyHoNs4jjORV9q6OAf+fIVSurKEhNqhM1hW154BfTUo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Rn8eHqFlz9je6GRvmwEOuldCjz7g2UUmx9p7rhpbl1LgceuTfKbNrpHKwoWgS6QF2UOh/WjdrQlp4GnJaB8HbozBZ/wU83l0vHV9xgu53a31jHsChvr6XSC40WVVbUaLqTJ8Ld4VoKsmh6p0y3FtJsa5rp2JisTktTXhFMVHmuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com; spf=pass smtp.mailfrom=shelob.surriel.com; arc=none smtp.client-ip=96.67.55.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shelob.surriel.com
Received: from fangorn.home.surriel.com ([10.0.13.7])
	by shelob.surriel.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <riel@shelob.surriel.com>)
	id 1uHlqW-000000007vu-0Xwj;
	Wed, 21 May 2025 11:59:08 -0400
Message-ID: <4ed8b8998a18ff5ceeaec803244897d127998ae4.camel@surriel.com>
Subject: Re: [RFC v2 6/9] x86/apic: Introduce Remote Action Request
 Operations
From: Rik van Riel <riel@surriel.com>
To: Dave Hansen <dave.hansen@intel.com>, linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org, x86@kernel.org, kernel-team@meta.com, 
	dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, hpa@zytor.com, 
	nadav.amit@gmail.com, Rik van Riel <riel@fb.com>, Yu-cheng Yu
	 <yu-cheng.yu@intel.com>
Date: Wed, 21 May 2025 11:59:08 -0400
In-Reply-To: <036f8679-485a-4c99-92e7-f271a972fbf8@intel.com>
References: <20250520010350.1740223-1-riel@surriel.com>
	 <20250520010350.1740223-7-riel@surriel.com>
	 <036f8679-485a-4c99-92e7-f271a972fbf8@intel.com>
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

On Wed, 2025-05-21 at 08:28 -0700, Dave Hansen wrote:
> > diff --git a/arch/x86/include/asm/smp.h
> > b/arch/x86/include/asm/smp.h
> > index 0c1c68039d6f..1ab9f5fcac8a 100644
> > --- a/arch/x86/include/asm/smp.h
> > +++ b/arch/x86/include/asm/smp.h
> > @@ -40,6 +40,9 @@ struct smp_ops {
> > =C2=A0
> > =C2=A0	void (*send_call_func_ipi)(const struct cpumask *mask);
> > =C2=A0	void (*send_call_func_single_ipi)(int cpu);
> > +
> > +	void (*send_rar_ipi)(const struct cpumask *mask);
> > +	void (*send_rar_single_ipi)(int cpu);
> > =C2=A0};
>=20
> I assume Yu-cheng did it this way.
>=20
> I'm curios why new smp_ops are needed for this, though. It's not like
> there are a bunch of different implementations to pick between.
>=20
You are right, this was in the code I received.

> I feel like this patch is doing three separate things:
>=20
> 1. Adds smp_ops
> 2. Refactors native_send_call_func_ipi()
> 3. Adds RAR support
>=20
> None of those are huge, but it would make a lot more sense to break
> those out. I'm also still not sure of the point of the smp_ops.
>=20
I am not very familiar with this part of the kernel,
but would be happy to make whatever changes the
maintainers want to see.

--=20
All Rights Reversed.
