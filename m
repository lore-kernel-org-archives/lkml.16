Received: from mx.wizmail.org (smtp.wizmail.org [85.158.153.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C9652F29
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 16:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.158.153.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745772961; cv=none; b=bDXzcVLf1IDkPsOh4cAdlnJDTTRlTTU/6sQi1eA2kHr4b2sFlJhtHXgWRmNDZQ4qVsES//eB2xEvJzmEso6dteOYavT2DPoSq8kIHWJOgs4P1uTTBpIj81++vQrKx3pLIHtLWT3EhRQrbyvTeneBkDgGrFXPRr+4VVfucG9HeEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745772961; c=relaxed/simple;
	bh=InqQGBIHxqLrWDI4Z4Oq6ZKwfrJJtQejbprL3nCjLO0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=fvnvORADw2H7mI/0uSiobRFZvKcPwSROl0QHzq+UTvizTuMOtUjZ4Zk9ckO15M/JU1V+t2ONXYF+b2QoFO7FdI0R8Wi/TOltOX3XNhb3uGRMFi0IDB8EucDwQPEPS8b52zPnEktvC54xzNKrEcmR85J72qauf4beDTtBSndHdPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wizmail.org; spf=none smtp.mailfrom=wizmail.org; dkim=permerror (0-bit key) header.d=wizmail.org header.i=@wizmail.org header.b=HsbuDhuJ; dkim=pass (2048-bit key) header.d=wizmail.org header.i=@wizmail.org header.b=flb+AxGK; arc=none smtp.client-ip=85.158.153.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wizmail.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=wizmail.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=permerror (0-bit key) header.d=wizmail.org header.i=@wizmail.org header.b="HsbuDhuJ";
	dkim=pass (2048-bit key) header.d=wizmail.org header.i=@wizmail.org header.b="flb+AxGK"
DKIM-Signature: v=1; a=ed25519-sha256; q=dns/txt; c=relaxed/relaxed;
	d=wizmail.org; s=e202001; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:Autocrypt:From:References:To:Subject:MIME-Version:Date:Message-ID
	:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
	List-Owner:List-Archive:Autocrypt;
	bh=jPI206lrCssCrlEnIuP7vwX92a128AtKl4EZCKIui/8=; b=HsbuDhuJihrX/CNFkg7OtsWLBb
	ZGjrudg3w255GE994XEqnVohGcq+RUQTjTO10tOwGebb9dSrsyOa/k4rndCw==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=wizmail.org
	; s=r202001; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:
	From:References:To:Subject:MIME-Version:Date:Message-ID:From:Sender:Reply-To:
	Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
	List-Owner:List-Archive:Autocrypt;
	bh=jPI206lrCssCrlEnIuP7vwX92a128AtKl4EZCKIui/8=; b=flb+AxGKHSVjmpguu0TwVYX6qo
	WVAMx33UCAvRMBSpodbV5iEtN+/lFQIf/2MePmEfqfeEaZAqVJkWaLCICPIvY6QXgSU1Mws6FD4iW
	8FhfiGpHTrRN2RjXGsKCG439FsN7SH3SX15XJ38elSVUtlCMBzoSqf47rpHDdF622ELvZgesMRhJw
	82bG1llQRRl84/bxKAbVjIfRun1/ZKgGxLccpcUK3oOcbzeL66TONEiJZYlAz7T+TyVRCH2VmWwBO
	PLRHwY5qs0iCTDFVZ8dR5LqIDfbmUZtjP0ZshwNWXxP0w3gZFlMQK1bO87yT7vI5tNH0A1BqxiusY
	UyYO3f1g==;
Authentication-Results: wizmail.org;
	iprev=pass (hellmouth.gulag.org.uk) smtp.remote-ip=85.158.153.62;
	auth=pass (PLAIN) smtp.auth=jgh@wizmail.org
Received: from hellmouth.gulag.org.uk ([85.158.153.62] helo=[192.168.0.17])
	by www.wizmail.org (Exim 4.98.115)
	(TLS1.3) tls TLS_AES_128_GCM_SHA256
	with esmtpsa
	id 1u95IC-000000008wY-13BV
	(return-path <jgh@wizmail.org>);
	Sun, 27 Apr 2025 16:55:48 +0000
Message-ID: <ed15dbce-a69f-4d37-a1de-9392623a712e@wizmail.org>
Date: Sun, 27 Apr 2025 17:55:47 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net:ipv4: Use shift left 2 to calculate the length of the
 IPv4 header.
To: Chaohai Chen <wdhh6@aliyun.com>, LKML <linux-kernel@vger.kernel.org>
References: <20250427061706.391920-1-wdhh6@aliyun.com>
From: Jeremy Harris <jgh@wizmail.org>
Content-Language: en-GB
Autocrypt: addr=jgh@wizmail.org; keydata=
 xsBNBFWABsQBCADTFfb9EHGGiDel/iFzU0ag1RuoHfL/09z1y7iQlLynOAQTRRNwCWezmqpD
 p6zDFOf1Ldp0EdEQtUXva5g2lm3o56o+mnXrEQr11uZIcsfGIck7yV/y/17I7ApgXMPg/mcj
 ifOTM9C7+Ptghf3jUhj4ErYMFQLelBGEZZifnnAoHLOEAH70DENCI08PfYRRG6lZDB09nPW7
 vVG8RbRUWjQyxQUWwXuq4gQohSFDqF4NE8zDHE/DgPJ/yFy+wFr2ab90DsE7vOYb42y95keK
 tTBp98/Y7/2xbzi8EYrXC+291dwZELMHnYLF5sO/fDcrDdwrde2cbZ+wtpJwtSYPNvVxABEB
 AAHNJkplcmVteSBIYXJyaXMgKG5vbmUpIDxqZ2hAd2l6bWFpbC5vcmc+wsCOBBMBCAA4FiEE
 qYbzpr1jd9hzCVjevOWMjOQfMt8FAl4WMuMCGwMFCwkIBwIGFQoJCAsCBBYCAwECHgECF4AA
 CgkQvOWMjOQfMt946ggAvqDr2jvVnGIN2Njnjl2iiKyw4dYdFzNhZgjTaryiV90BftUDxRsB
 uTVFUC6XU+B13MEgSK0zRDyI5NpEH+JTW539gWlmz2k2WTTmoBsm/js1ELoAjGr/i32SByqm
 0fo3JPctn/lc7oTo0muGYvB5xWhTHRlcT9zGTRUb/6ucabVLiJUrcGhS1OqDGq7nvYQpFZdf
 Dj7hyyrCKrq6YUPRvoq3aWw/o6aPUN8gmJj+h4pB5dMbbNKm7umz4O3RHWceO9JCGYxfC4uh
 0k85bgIVb4wtaljBW90YZRU/5zIjD6r2b6rluY55rLulsyT7xAqe14eE1AlRB1og/s4rUtRf
 8M7ATQRVgAbEAQgA6YSx2ik6EbkfxO0x3qwYgow2rcAmhEzijk2Ns0QUKWkN9qfxdlyBi0vA
 nNu/oK2UikOmV9GTeOzvgBchRxfAx/dCF2RaSUd0W/M4F0/I5y19PAzN9XhAmR50cxYRpTpq
 ulgFJagdxigj1AmNnOHk0V8qFy7Xk8a1wmKI+Ocv2Jr5Wa5aJwTYzwQMh4jvyzc/le32bTbD
 ezf1xq5y23HTXzXfkg9RDZmyyfEb8spsYLk8gf5GvSXYxxyKEBCei9eugd4YXwh6bfIgtBj2
 ZLYvSDJdDaCdNvYyZtyatahHHhAZ+R+UDBp+hauuIl8E7DtUzDVMKVsfKY71e8FSMYyPGQAR
 AQABwsB8BBgBCAAmAhsMFiEEqYbzpr1jd9hzCVjevOWMjOQfMt8FAmRaa+cFCRKczCMACgkQ
 vOWMjOQfMt8wLQgAuNQkQJlPzkdm/mvKWmEp/MW5SsYROINr21cFqPXYy+s8UwiDshe+zuCQ
 fXxxSH8xbQWYEKHOgQx7z0E5x8AppAUj0RoN7GxkPzBdoomfKhx7jV8w43YjjpMFbktM2/44
 lTaselejQbcGH7jrgFVK0iifeoPS0x2qNE6LhziIU8IWMSLZffXP32+nEqMr4m1uKna3j3jt
 9jQh8ye2oz4VdVy0NbQDVKgMP4b7gShtIq1i0cxJNviyQ+tOANW92I2Kla6kUvwL6g9ovBVH
 xf01RBCxE+ppjb9N8y58qzwnP0c5X2UqTIBhfNWKRLonvJ5RQeb3R1ZJQJ5Ek2AV21/7Zw==
In-Reply-To: <20250427061706.391920-1-wdhh6@aliyun.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Pcms-Received-Sender: hellmouth.gulag.org.uk ([85.158.153.62] helo=[192.168.0.17]) with esmtpsa

On 2025/04/27 7:17 AM, Chaohai Chen wrote:
> Encapsulate the IPV4_HEADER_LEN macro and use shift left 2 to calculate
> the length of the IPv4 header instead of multiplying 4 everywhere.

Isn't that better left for the compiler to decide?
-- 
Cheers,
   Jeremy
