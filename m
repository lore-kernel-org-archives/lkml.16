Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [81.169.146.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D20200BB8;
	Mon,  3 Feb 2025 10:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=81.169.146.217
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738578076; cv=pass; b=EO0Nq5xMEk4le+PDn1mVRnDvRvETr2FLJbxHh6evSr39Ye50uA9eaulP1Fo+Ntltrhib/GvxfipEr75W3etsZ6ihxEJeuXdO8Cgj7Y6y+5omKWPgTZVp/W84SPu9MUg1px0doti795RF5oyYUZVnb7QKQMHEPHrYXF0XvVQCtdM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738578076; c=relaxed/simple;
	bh=yg4hGb4USFIVGjISOl0It9wOi2kLBPjvbP4IijuWXfs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CqxNUW8epjpmhrWzaW/V2wIk1Wzg0t0Wy6Pap1FmLHoJ7V3rW0+YKPelgwz4x1HChfOhlMi0LfMNYoNiJPe5maS5NNxUixVaDR/uiKJBRtk0R/TSvTwgYi7SEeHZ8oWTx5aViJemNuHj/NFxrgOKR6npfwthuK+vLoDm0NbNCtE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=outer-limits.org; spf=none smtp.mailfrom=outer-limits.org; dkim=pass (2048-bit key) header.d=outer-limits.org header.i=@outer-limits.org header.b=KwmAmA+y; dkim=permerror (0-bit key) header.d=outer-limits.org header.i=@outer-limits.org header.b=iA0q8raf; arc=pass smtp.client-ip=81.169.146.217
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=outer-limits.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=outer-limits.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outer-limits.org header.i=@outer-limits.org header.b="KwmAmA+y";
	dkim=permerror (0-bit key) header.d=outer-limits.org header.i=@outer-limits.org header.b="iA0q8raf"
ARC-Seal: i=1; a=rsa-sha256; t=1738578070; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=rZNx1sY4z5DhGdQos6sRC5MdQ0amLoI+pPc+NkYhfiTTfRpvlMClcXB29N6Uyhp5EB
    e/VdYxm8NCHDJPbkQazxicCgdab3W81XAImd4imzuYI+Akq2qx7+EOYj3SyA174KfpZ6
    FPfLxlnvBMBPJfm/5taxgzhZW5YsGL4X+5SJ1NwH1MjMRufDVgVLqgkFlncW5diYS9ja
    WGQV0X9SPI2Xz7/7ANzF1mbLSoyrO5ZHKki0Bx5RKvJY1UXHYyg7xJNFO7qRKQd1ebMz
    1KCqdmKgV/K+E4hDgIGJtJiJ11LPtKEMMwHB+QmQMKr3p/7J1reNmbyp/YQvk33uk0wY
    J+5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1738578070;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=e3sRkAJ3HR+ur2h1b9Hze+8hMs3GEmu6JmR5unu3DiQ=;
    b=opHtSaLX/5vqR+oglgynm48kHB5EgoC8WS9P3ucZLOYtMl+Nho6c5hpM6eb3HOGu1T
    qkV3CSia2FR2i3UDJk7uolpLgZD1Oi4ouA4XFQ1+6uigX6lWoQ8D/WvgpV8jiyT7ABvM
    fFclpCbRgZrD1tVILrgBWiiHR9rk/ruMvwWc8fdgR0trR5qP7taw0G0P3fJl/RkB4QL8
    FXR8hsWDBrHmB5dEm6iQzv2DRZ2i3wPS09UJ6CgFEDbViVtNtBFCr8XjUNR2ce6cBx05
    PYmCf7XCFvVI+eoIfaoAkMZt2LPEEhRbuEQAlAqMFYBuLm3kyU6/b1zTDPjJ4k7sJGpZ
    Lc7w==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1738578070;
    s=strato-dkim-0002; d=outer-limits.org;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=e3sRkAJ3HR+ur2h1b9Hze+8hMs3GEmu6JmR5unu3DiQ=;
    b=KwmAmA+yTQgxLIRw+uNJdG0Azb6b1P/YlUgZaa2v5RtNXMod1vfbPr91cGmFbBuzUm
    nRSCUctprloq4leVQrKg79rM4kM/V6yh0nZiCvtbOil8m4tXgQcZZB6L6vQ0rVc0SuAp
    0+DDNLxfZ37SQqqwTL8xUjiVFj11Jh59SgZh2daBD1krAkjZkv64w2kw8CUdCqbx8OoZ
    R7ddjKKlhvhckTChA6IAzJjE6hYgBwCT5vAOQy0l80rX5JradpCWvB6KV8NwYSxqk/AG
    uYtxystOsn3V9inF+l+UcPFeoSPSMOuubcW/WilYEJRrcMAtdEmTjSi3X16fp7B2WUE5
    mV1Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1738578070;
    s=strato-dkim-0003; d=outer-limits.org;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=e3sRkAJ3HR+ur2h1b9Hze+8hMs3GEmu6JmR5unu3DiQ=;
    b=iA0q8rafFNn+nHEluf+L2pi9M9I319RRPkV7bMjwRvvZ2NK2/BgvtJdaVYP4cJ3UNl
    hHs+z1lIso3ldVO4UHAw==
X-RZG-AUTH: ":JnkIfEGmW/AMJS6HttH4FbRVwc4dHlPLCp4e/IoHo8zEMMHAgwTfqBEHcVJSv9P5mRTGd2ImeA=="
Received: from [192.168.37.162]
    by smtp.strato.de (RZmta 51.2.17 AUTH)
    with ESMTPSA id J1a251113ALABS7
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Mon, 3 Feb 2025 11:21:10 +0100 (CET)
Message-ID: <65e57211-7983-477a-af94-1bdab57574b4@outer-limits.org>
Date: Mon, 3 Feb 2025 11:21:09 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] parisc: Remove memcpy_fromio
To: Arnd Bergmann <arnd@arndb.de>,
 "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>
Cc: linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250130134825.2646380-1-julian@outer-limits.org>
 <543bd0f6-b25d-48b4-8039-496b8ddd10ce@app.fastmail.com>
Content-Language: en-US
From: Julian Vetter <julian@outer-limits.org>
In-Reply-To: <543bd0f6-b25d-48b4-8039-496b8ddd10ce@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/31/25 08:28, Arnd Bergmann wrote:
> On Thu, Jan 30, 2025, at 14:48, Julian Vetter wrote:
>> Fully migrate parisc to the IO functions from lib/iomem_copy.c. In a
>> recent patch the functions memset_io and memcpy_toio were removed, but
>> the memcpy_fromio was kept, because for very short sequences it does
>> half word accesses, whereas the functions in lib/iomem_copy.c do byte
>> accesses until the memory is naturally aligned and then do machine word
>> accesses. But I don't think the single half-word access merits keeping
>> the arch specific implementation, so, remove it as well.
>>
>> Signed-off-by: Julian Vetter <julian@outer-limits.org>
> 
> Acked-by: Arnd Bergmann <arnd@arndb.de>
> 
> This one looks fairly obvious. It might be nice to also
> clean up the {in,out}s{b,w,l} helper functions in the same
> file, but I don't understand why those are special
> in the first place.
> 
Not sure, either. But some comments contain: "just using the inlined 
version of the inw() breaks things". This is clear, and what you point 
out below already, these parisc specific functions deal with unaligned 
buffers, so using, e.g., the generic "inw()" will surely break things.

> Those functions have been unchanged since before the git
> history and there are some comments that I don't find helpful.
> One thing they do is to deal with unaligned memory buffers,
> which the generic ones don't, but that could be easily added
> using get_unaligned/put_unaligned, expecting the compiler
> to optimize the memory side of the transfer.

I'm not sure what you suggest. Do you mean adding 
get_unaligned/put_unaligned in the generic include/asm-generic/io.h 
functions, or just adding get_unaligned/put_unaligned to the body of the 
parisc specific functions? Instead of all the "switch... case 0x2..." code?

Julian

> 
>       Arnd
