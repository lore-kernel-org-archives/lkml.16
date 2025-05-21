Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE221A9B23
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 05:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.208.246.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747806097; cv=none; b=hXLCi3yoRNaoJqr0wdbik/9lMrCXZQ/+h7d2H39HBKVQa8vTCZuWdDT4b/Ti3wsQKwWYIcYSb135FZrwevzioGt9ZNJV5A4FbUY6kCAJi54IbyaAGy1Q8dk+u/GVcF9EDeVUNzMLzJBsko3JmwZdwXhsGHDoWr+SQo9rorgSHjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747806097; c=relaxed/simple;
	bh=/5x94+g+HwreplXOJJwMxKmIixq50Z1jAwaVFvflsa0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ywk0UtusIxXC68xbXre7q1DUbeH+phXuvMR+Wgj9otikWgVPvfVGdIU0WSUsiJi+qQvZXPYH5SVSzi0KIifWq6md0CGK8rQQwpnWCtXKIQOzUoohmSfmKimF9InyYOsap08nu1mfAMwV+9JxUPtZD3hU1cFeVEz2XpVdWbjQllQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site; spf=pass smtp.mailfrom=xry111.site; dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b=GIpUt/Q4; arc=none smtp.client-ip=89.208.246.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xry111.site
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b="GIpUt/Q4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xry111.site;
	s=default; t=1747806089;
	bh=RGZBoFNO30D9TpBIuKnBH4Z7D9w4h9NHy/Fyb64gALU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=GIpUt/Q4twfNI/zn9dz9H9jv0LP6/5saNRt9Qs4oJXE1tx8W2FBL+0LfFGlcSnkeq
	 9fby9XfNBk5YDSR27i8l4BtzB7BjRZYt+6qQvvQHgJM5w11+1qy3vGp7swulU9ChKD
	 SdslJNKn9NFT8YoAOqAb1KthoJMxes3+alXKgb5k=
Received: from [127.0.0.1] (unknown [IPv6:2001:470:683e::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 638CA65992;
	Wed, 21 May 2025 01:41:28 -0400 (EDT)
Message-ID: <e005dd551aec8bea185b3d37295876bd75d7b3e4.camel@xry111.site>
Subject: Re: [RFC PATCH] LoongArch: Do not include larchintrin.h
From: Xi Ruoyao <xry111@xry111.site>
To: Tiezhu Yang <yangtiezhu@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Date: Wed, 21 May 2025 13:41:26 +0800
In-Reply-To: <20250520064936.32291-1-yangtiezhu@loongson.cn>
References: <20250520064936.32291-1-yangtiezhu@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2025-05-20 at 14:49 +0800, Tiezhu Yang wrote:
> larchintrin.h is a system header of compiler, include it in the
> kernel header may lead to the fatal error "'larchintrin.h' file
> not found".
>=20
> There are two related cases so far:
>=20
> (1) When compiling samples/bpf, it has been fixed in the latest
> kernel [1].
>=20
> (2) When running bcc script, it has been fixed in the latest
> bcc [2] [3], like this:
>=20
> $ /usr/share/bcc/tools/filetop
> In file included from <built-in>:4:
> In file included from /virtual/include/bcc/helpers.h:54:
> In file included from arch/loongarch/include/asm/page.h:7:
> In file included from arch/loongarch/include/asm/addrspace.h:9:
> arch/loongarch/include/asm/loongarch.h:11:10: fatal error: 'larchintrin.h=
' file not found
> =C2=A0=C2=A0 11 | #include <larchintrin.h>
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 ^~~~~~~~~~~~~~~
> 1 error generated.
>=20
> Maybe there are same errors for the other unknown projects, it is
> annoyance to add the include path each time. In order to avoid such
> errors once and for all, do not include larchintrin.h, just use the
> builtin functions directly.

Sorry, but in GCC those builtin functions are not documented and may
subject to change in the future.  Only the larchintrin.h interface is
documented.

Thus if you don't want to rely on GCC for those operations, you may need
to write inline asm...

--=20
Xi Ruoyao <xry111@xry111.site>
School of Aerospace Science and Technology, Xidian University
