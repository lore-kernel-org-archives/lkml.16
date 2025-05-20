Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D93819F137
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 14:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747749714; cv=none; b=ODHbm7NdW1bmG5AxFDAUw6rx6aY/uPrXWfe+PcxiTNjyH/cRXt/rlDw0xKF0wrmgmOPX7pylUB114mBbHktqGOjZSXkyDMQ8QWoQBEe957sIZwL72kqH7EQIe4tChzU2Q1ryN/FMZcmrMHASE5LStTRTsyubJDhFpaYSZyDtg/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747749714; c=relaxed/simple;
	bh=Uq2OjYZIAwXGcKxfVxUqOz+LEZTbzNoiTVuTAioXdMU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QyiWHJJfx4vwKJb+iOIWGPYYBhZ9Haj1WxwSpLI2vrJGr12zv+Lyb3HfJjVneo+/u0SKi+u4Biq+djJEO+jDrNh/JE7JWB6z5SlMqOLZ5Z2q7LRGA3ZIxrz7/AbkgXjffn75rFZlfyCh0gxOc1WD7GBPw9qLWP2/tdnf/py8hmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JJEaKcSX; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JJEaKcSX"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ad51ef2424bso824282566b.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 07:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747749711; x=1748354511; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PV1FL/a31fFF87tKpEa3eS5r97RWRD8TAOaHpu3NmaI=;
        b=JJEaKcSXp6e+hbOViQ19n+lM5VdDdoyaYu8+xGpSvCHj0nJVB1TVcRSc4u+FBLEa+J
         w85Me7FPYorSGK8zhwzAetdBUXlm4VDlWHJs9uQtKzZXSOo9jJWl4B4Gm124ehI2AhFq
         VA+7XKJ/9flv7KIZ9eW+EECo83RpuquqcHpFHY8SDVDkVvk6sYrx3WeVC9UmHUORLZKu
         B/V2M4YCkg07luu+oDivRtwwCKgeN4d8v89SiFD1vD0SprxG1SPYd6ErpAZaZ5vjWluo
         5a46r6i/I5t2dehPlnLB0MMpmreKtzqXkEJPOtsRIupAVG10LxVCrJ9iN4PJmkN7bOoo
         NCHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747749711; x=1748354511;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PV1FL/a31fFF87tKpEa3eS5r97RWRD8TAOaHpu3NmaI=;
        b=t9K4tmUnaY+LIB5hpTBXznr+vOrLB/PSqwIUjdTsbAFJotXt61Ixe5yKBprGjdiDAO
         vCOC8bXeI/vSra2dvIALOqQRPItv4YBq/2Iafi6IndtikwkjIOZYDcyBy4hf32UuW/Cq
         ar7TknOpvy5lZDsS9QXYHn7srhQQmqAfauSCtAsYkrO7y18PMC4CIwJZAYX2lcvbdbC/
         T0BlOstN6yPwIRFrDwNWPBWGXd+JcBCe2aUEhXvDdq/BK2K7qReR+2douVQSFewHvcON
         GaIC6nD9LhD97A6X3Jm5MEFQ/7UcRsdtOVnV3hZCY3QIhSRx3+qfnbg4h3MZ6flVD3Yv
         6xWg==
X-Forwarded-Encrypted: i=1; AJvYcCXseM6tnMY3Ps2X3hXsr1+hOzDn2/JE8oui/ychEwnIrqDfkb0I87Ny3reQ4K/f69Js2dFKzolUjzC38jc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAv1rTHq7Cy/nG8kkW1OPF+3nc315zfrrfTN5RzidqTpna/m5a
	2i3Idd5njq9E+aCzBcrU6yZKyoXAJ0AdgZjzUyz6Rd25P+GwVrzKWZ7m
X-Gm-Gg: ASbGncvBp2s9ftRKx0ZfoQGoGHM0BJAk1kad0sLXRBatJK5Tda9bo3RNTAAbvPwsJH5
	dzEVptlrvgQjLH8y3mvIECez8lkOSoBpfYy27AQxhVEz39QgxQ81JsZqt6rJGXcd8enee7/VZri
	5jjfZc/Kj0IBqwBwKZ9/RInshGy3GO3lDS8hHHhj5TpbG/TZ2MEAPBRvn5RMMF4HPv9kAtbdZIX
	idn9Dez1i0oAttQ/bUnoUzaqr+jYCDyHBYXgSgKvXBW7m3cfvnZLXiz/LHanZM6BZ+cQUFatpeW
	jXxasNcgB+PBOW8oZ1UMzK7DaDcfCiwVg9qtUh0qhF+eKs7wuE3e5rkHSKmgpC3DA2YERjXdjKT
	TB0+GXjagA5EvuXtBiLBASjq2
X-Google-Smtp-Source: AGHT+IHYDfOBB6XOAPFWgeSvqBqbLUR4EmvrA6HlSBGcoEyDnSyMz9RMu73gKqe3sYbMbufPdTMBXQ==
X-Received: by 2002:a17:907:3e82:b0:ad4:f5ee:3c0 with SMTP id a640c23a62f3a-ad52d49b412mr1830301766b.16.1747749710121;
        Tue, 20 May 2025 07:01:50 -0700 (PDT)
Received: from ?IPV6:2a03:83e0:1126:4:1c0a:f3ac:4087:51c8? ([2620:10d:c092:500::7:66a9])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d06bc66sm731573466b.46.2025.05.20.07.01.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 07:01:49 -0700 (PDT)
Message-ID: <89553e3b-48a2-4867-a082-5a530620c427@gmail.com>
Date: Tue, 20 May 2025 15:01:48 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] mm: slub: allocate slab object extensions
 non-contiguously
To: Andrew Morton <akpm@linux-foundation.org>, surenb@google.com
Cc: hannes@cmpxchg.org, shakeel.butt@linux.dev, vlad.wing@gmail.com,
 linux-mm@kvack.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org,
 kernel-team@meta.com
References: <20250520122547.1317050-1-usamaarif642@gmail.com>
Content-Language: en-US
From: Usama Arif <usamaarif642@gmail.com>
In-Reply-To: <20250520122547.1317050-1-usamaarif642@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 20/05/2025 13:25, Usama Arif wrote:
> When memory allocation profiling is running on memory bound services,
> allocations greater than order 0 for slab object extensions can fail,
> for e.g. zs_handle zswap slab which will be 512 objsperslab x 16 bytes
> per slabobj_ext (order 1 allocation). Use kvcalloc to improve chances
> of the allocation being successful.
> 
> Signed-off-by: Usama Arif <usamaarif642@gmail.com>
> Reported-by: Vlad Poenaru <vlad.wing@gmail.com>
> Closes: https://lore.kernel.org/all/17fab2d6-5a74-4573-bcc3-b75951508f0a@gmail.com/
> ---
>  mm/slub.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/mm/slub.c b/mm/slub.c
> index dc9e729e1d26..bf43c403ead2 100644
> --- a/mm/slub.c
> +++ b/mm/slub.c
> @@ -1989,7 +1989,7 @@ int alloc_slab_obj_exts(struct slab *slab, struct kmem_cache *s,
>  	gfp &= ~OBJCGS_CLEAR_MASK;
>  	/* Prevent recursive extension vector allocation */
>  	gfp |= __GFP_NO_OBJ_EXT;
> -	vec = kcalloc_node(objects, sizeof(struct slabobj_ext), gfp,
> +	vec = kvcalloc_node(objects, sizeof(struct slabobj_ext), gfp,
>  			   slab_nid(slab));
>  	if (!vec) {
>  		/* Mark vectors which failed to allocate */

I forgot the freeing part, This will need the below fixlet as well.
I will add it to the next revision if there is another one,
otherwise it can be folded into this one. Thanks!


commit fa48eab7faddfdb94faa80a1575ac1840919071e (HEAD -> prctl_huge_v3)
Author: Usama Arif <usamaarif642@gmail.com>
Date:   Tue May 20 14:58:10 2025 +0100

    mm: slub: change slab_obj_exts freeing to kvfree
    
    This is to match the kvmalloc.
    
    Signed-off-by: Usama Arif <usamaarif642@gmail.com>

diff --git a/mm/slub.c b/mm/slub.c
index 97cb3d9e8d00..2245e8d8fffb 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -2045,7 +2045,7 @@ static noinline void free_slab_obj_exts(struct slab *slab)
         * the extension for obj_exts is expected to be NULL.
         */
        mark_objexts_empty(obj_exts);
-       kfree(obj_exts);
+       kvfree(obj_exts);
        slab->obj_exts = 0;
 }
 

