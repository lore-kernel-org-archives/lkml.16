Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D0AC218EBA
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 23:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.67.55.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748389263; cv=none; b=ou5HfYkFQI9hT/t14toI8HjSPxVPenYIF+25hCO5Ws3doZKt2GxVep7jj6jdC//58+LXyHcHlcnPq68wD0qqPs7/rPV54MyVuz17F4K6NFN0bqsMYnNL+5MGXor91mvdjbJOP35JRGdEmZV0wqfHXe2QvUDYsXTgBREDoisQkwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748389263; c=relaxed/simple;
	bh=4oAaP8cPHkScrrFa1pNySbpyzo9XJU3CNRr8g9Av+Uc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ewTWyfev62h9BgUzpZGBKwqUmonhOao7L+dSu3/UdDHHM0xXtEl/ythauPhrIQszyJj/PS9Jp/ovlZrtnA3xquegoYawX3puEcRwjkD8NYUm7RgB4KfoKI8115F+1ZwWjsjm6SdgxgW3IQKcs+s7lkQ6qD6ZAJlZHbzRpwtxDps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com; spf=pass smtp.mailfrom=surriel.com; dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.b=N7aMmile; arc=none smtp.client-ip=96.67.55.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=surriel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.b="N7aMmile"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=surriel.com
	; s=mail; h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=4oAaP8cPHkScrrFa1pNySbpyzo9XJU3CNRr8g9Av+Uc=; b=N7aMmileg3SLvvuiav5TJLu9iE
	O4flxZ/ABPrRSzRGMRQRaqxBtyfG1hWco/iiFxhcpMpgLpVOjUZKvYBhyt464oTLzyf3/MDM56JO2
	Y19MG8MNV2SK6UWX7t2/E5201hO4sSKtWnvZJvohNbs+clg3nendVrFxc8dkA19es5HcI3XKhsyth
	f9BHgexeLai6qdzPan02nwKN5aJTPw0mu2EHdi8z24zk5hLSB+6C0NMF9P72L5ud7Q1YoOEKmY1ir
	q7vqJ0+lYa4QPULdVwqTlZv3xJgooaclS381GDE6/Zm3W6sDzvA4R1ozy+GcBgHxNPmyKFFI/S+Mx
	steCO11A==;
Received: from fangorn.home.surriel.com ([10.0.13.7])
	by shelob.surriel.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <riel@surriel.com>)
	id 1uK3tk-0000000018X-0v1C;
	Tue, 27 May 2025 19:39:56 -0400
Message-ID: <c92a1f85eae86b49916ee1d0a8b3214962b18c4f.camel@surriel.com>
Subject: Re: [PATCH] x86/mm: Limit INVLPGB to VA in
 invlpgb_flush_addr_nosync()
From: Rik van Riel <riel@surriel.com>
To: Jann Horn <jannh@google.com>, Borislav Petkov <bp@alien8.de>, Ingo
 Molnar	 <mingo@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>, Andy
 Lutomirski	 <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org
Date: Tue, 27 May 2025 19:39:56 -0400
In-Reply-To: <20250527-x86-overbroad-invlpgb-v1-1-64ca98aa2a3a@google.com>
References: <20250527-x86-overbroad-invlpgb-v1-1-64ca98aa2a3a@google.com>
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

On Tue, 2025-05-27 at 23:56 +0200, Jann Horn wrote:
> The intent of invlpgb_flush_addr_nosync() is to flush a specific
> virtual
> address range, but INVLPGB_FLAG_VA is not set.
> If I understand AMD's documentation correctly, this means this will
> flush
> the entire TLB (except entries for guest ASIDs).
> That's safe, but seems like an unintentionally broad flush.
> Fix it by setting INVLPGB_FLAG_VA.
>=20
> Fixes: b7aa05cbdc52 ("x86/mm: Add INVLPGB support code")
> Signed-off-by: Jann Horn <jannh@google.com>

Reviewed-by: Rik van Riel <riel@surriel.com>

> ---
> I am not entirely sure about this; Rik, can you confirm if this was
> an
> oversight, or if there's actually a reason for not passing
> INVLPGB_FLAG_VA here?

This was totally an oversight, and probably lost
in one of many rounds of cleanups.

Good catch!

--=20
All Rights Reversed.
