Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [81.169.146.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9619328A40F
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 09:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=81.169.146.217
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749546237; cv=pass; b=glihon4cuJ9oCjzfjaA1DYfbPgwlqxHdDYLpSgX5Sz/sLyRHNRhPbV0sAvWbspMHhmB/fBjUO6bUoJDcqY2JyTntotV2Hsvezs/zFuANaIty/fDJFHlNpn+crPofVsgAk3c/BJ2yKN5YA3+jnDAsNUVrqaF85lSNIlpxbiEeWpo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749546237; c=relaxed/simple;
	bh=dvigRrY2r7wmZxhQKy6gCcIQgsgLiBgTgd83McTAlUA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QKq2Q17aPaflSedBMkPRg9CPpauBuTKnQGIaES1nDp/BvCw1LgfqGf1D+7qOH87daO2PZtf1rfT5IMY/gQso/IfmTjHdYBDpYnzXhxnf94jspLbs93CiUxHu7UmsZKjqus2ZuqU/Z8SGk8Cj+Kx4KGLuMZeo9T7sk+UMzNywpq0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=outer-limits.org; spf=none smtp.mailfrom=outer-limits.org; dkim=pass (2048-bit key) header.d=outer-limits.org header.i=@outer-limits.org header.b=PW27VKLC; dkim=permerror (0-bit key) header.d=outer-limits.org header.i=@outer-limits.org header.b=oAzmOsZ+; arc=pass smtp.client-ip=81.169.146.217
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=outer-limits.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=outer-limits.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outer-limits.org header.i=@outer-limits.org header.b="PW27VKLC";
	dkim=permerror (0-bit key) header.d=outer-limits.org header.i=@outer-limits.org header.b="oAzmOsZ+"
ARC-Seal: i=1; a=rsa-sha256; t=1749546227; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=bS/USD083zTRf7ENi9gnqo3jVbIkJPh+vDt9nrOFn3c4FRRK3d7GlL8CjVETPwTLVl
    TMagt1JKHr8KnnAaw2cnPrFz95yaHXK+LC2uTsAOfXkR+5td4lvqEu3nIn2PkQHyFhbj
    XKWSW8B8Czc3UW2/vI/s+zmfjAC/ez5ywcR5sfTBvlaJ0Q51HIOe7t+i1o2sbnOvqDxQ
    v3F8TsgdZCM73aDvdYmN9ELg3qH8mPU5C+OClMbqWdKmu1EbIA2wNlm79ed1USKcJgZE
    aRf7nKmmTjcUiLDNK876WFw7lcHFK5BvgcyAuHJWzOPsu96awsORLID7uFFC54EK6ZHZ
    u8jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1749546227;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=mKfggktGiIfSFyfGm6oYDAp/T2BtN/kZh5wQ9bTBSUo=;
    b=RIMOhWME1JeIrQg3yJvY4vZCGvS5AmGT+FX0iCE43nQ5N213bm8LorpEOzoh4ze+oW
    eUkm6kq7tJjj44q0LX2oMyBCF3k4+24OuPu4JtmamhppE/MfEUd87Qlw0448z5KPRl9l
    lmgrqL3Cq3UrvtX98e7CoTx9/bwjSIeEi6tfuIRg8jZB7XRFfxSZoAKAym8heekeJw1U
    erhRamVw/EdbZP2C4jgcl/wh/FUvDtukVmT7EA/AK5OYlBfnoQY1ReYvfkDKoP4sVJ7h
    +ndgBV70eZ8nQf+TttE4jgbh/Eicsvf/hOEn1R8Q2yfNuBmQZTsoisiWhi2jBCsCGumg
    aKyw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1749546227;
    s=strato-dkim-0002; d=outer-limits.org;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=mKfggktGiIfSFyfGm6oYDAp/T2BtN/kZh5wQ9bTBSUo=;
    b=PW27VKLCY2EKGZhkfMA8pXmK6jLrmG7t5KejGeMd6xO8mNBqbXL5GedJ2pzXSI9eWy
    erlmYMow4KZxtgxXaCSxIS5wo+Biexlk/864DKzn1QCboiuSnxuptOAooX3eQagpvrvu
    4EN0P01S2Um19ZDg/xdT7+KiHYZGK/ZdOlsFZ/ZtBjjs2oL9H6ngaP7y0GUeW2tapcuc
    Fs+ZAGPkA3IeYWjbZsbgGJ96Z3eFQjBBX2VtnCeiSYy+R6K4XlBnyjQ89VZmXnMCRzGo
    A3nKV1QME1xo8/8SWJS1MWucuyvJNpzCKqjKrUPm96sMeHJtiEQt6Q9TsSMgNiesVz7C
    RBwQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1749546227;
    s=strato-dkim-0003; d=outer-limits.org;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=mKfggktGiIfSFyfGm6oYDAp/T2BtN/kZh5wQ9bTBSUo=;
    b=oAzmOsZ+Fa55t6G52ntKmIvYD5AKmPY8fvu2ooqn/sprUUG+EBLUTpbckz/S7KFYan
    Oy/82pGTouzlTeQ8u+BQ==
X-RZG-AUTH: ":JnkIfEGmW/AMJS6HttH4FbRVwc4dHlPLCp4e/IoHo8zEMMHAgwTfqBEHcVJSv9P5mRTGd2ImeA=="
Received: from [192.168.37.162]
    by smtp.strato.de (RZmta 51.3.0 AUTH)
    with ESMTPSA id J2b11015A93kApt
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Tue, 10 Jun 2025 11:03:46 +0200 (CEST)
Message-ID: <5d380c93-f179-4599-8f1c-a28cd85250e3@outer-limits.org>
Date: Tue, 10 Jun 2025 11:03:46 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Remove unaligned/packed_struct.h header
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Arnd Bergmann <arnd@arndb.de>, "Jason A . Donenfeld" <Jason@zx2c4.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, linux-kernel@vger.kernel.org
References: <20250603132414.3676142-1-julian@outer-limits.org>
 <20250603142914.GA299672@ZenIV>
Content-Language: en-US
From: Julian Vetter <julian@outer-limits.org>
In-Reply-To: <20250603142914.GA299672@ZenIV>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/3/25 16:29, Al Viro wrote:
> On Tue, Jun 03, 2025 at 03:24:14PM +0200, Julian Vetter wrote:
>> The functions in this header are deprecated and are not used anymore.
>> So, remove the header entirely.
>

Yes, sorry. I messed it up. For now the patch can be ignored. I will 
re-send it once, all appearances of '__get_unaligned_cpu32' are removed. 
I have already send according patches for the 2 remaining files that 
still use it, namely 'include/linux/jhash.h' and 
'tools/include/linux/jhash.h'.

Sorry again.

> ; git grep -n __get_unaligned_cpu32
> include/linux/jhash.h:80:               a += __get_unaligned_cpu32(k);
> include/linux/jhash.h:81:               b += __get_unaligned_cpu32(k + 4);
> include/linux/jhash.h:82:               c += __get_unaligned_cpu32(k + 8);
> include/linux/unaligned/packed_struct.h:16:static inline u32 __get_unaligned_cpu32(const void *p)
> tools/include/linux/jhash.h:80:         a += __get_unaligned_cpu32(k);
> tools/include/linux/jhash.h:81:         b += __get_unaligned_cpu32(k + 4);
> tools/include/linux/jhash.h:82:         c += __get_unaligned_cpu32(k + 8);
> tools/include/linux/unaligned/packed_struct.h:17:static inline u32 __get_unaligned_cpu32(const void *p)
