Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45CF65BAF0
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 07:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746431373; cv=none; b=REN3vSnAkKJPCE4XGk+9om1veAy8qzc+ADuoLDrJcS6J0J4QLga8PNk+TMb6ysCWapM8GrYcII9zOzOQSPDO0lMCM24qBgNq/VNEKrI2TWw+1CaFalihlfVrpmKg9mKbCYPe3fVli89LmMNiho89mkxtjJn6bGNGdeXRdv4UN0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746431373; c=relaxed/simple;
	bh=0iBwICTaMoIdQPJte0yeJHdCETBj+Uzs8MZ96/ahkFc=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=nWBs1zkaTGn6jAW69uu2j+8iZ2Xf70iqdjuvht1pzJgV5ERO9qZvM3+Av9IkDpdxcqOpGNI/Cl7n9HG64PO72Ve0PwCUflF4o5gtTppePUZThPU9NjEWk4kWM5GrxR3GPuBAvRKxwJ/6Ft3enhL7nei6NWDV8zfe43fr+CCHGBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GoDCzraY; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GoDCzraY"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-af548cb1f83so4001407a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 00:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746431371; x=1747036171; darn=vger.kernel.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9n62oCxRgeeTCTbh9dONu/vhmceSSlNkgyqeLcA3kK4=;
        b=GoDCzraYtswmF2S515s0u6zf73pUSsJyZQQSCUF+q9cODb7ci9idUKmrrZ269vL3KW
         T+yJpEOxWJPrjJ4+ZzA1nIe/C54psJwj6cV7ehelcLy+U0Q+G+yfqfAMEg7L2mcaErC6
         Yv8q8sy9aUD9V3RQkcHv5fZ7tt5UGrN3MAAJVRMWHuWdM1PNO26nWgnxIzU6Z5mFefpJ
         8SJxN9f8TLkfTSIH0Pjtlls+Pzf2Q547sZIGbXzdk94o5WHDFoNWws1akk+vezKo2D0M
         F6aIyB/WA3IekeJtTDWkxTNWkYdqneP5bE31j3MT0oQE54SWcybmzCVL7FNO5eiIz87j
         x9qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746431371; x=1747036171;
        h=references:message-id:date:in-reply-to:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9n62oCxRgeeTCTbh9dONu/vhmceSSlNkgyqeLcA3kK4=;
        b=viG5Ps8NIyQVfwKe9KOJNSR2MEfexPga8UQBbK58OLiADCA0eunIM7agFGVxFf7O/M
         e7aoWWpWPnvx2wd5ghR0QJjxJKpGcABjrS06uSr8y7AVbzmr04P9XOdG28CxUZJqIIoI
         qZEl30drX5BNV464wOnq+cu6r1lVQ4XOBJdGd+V4OGBS3Ju+vAzdJjoJWy/ZTYa+c5Ko
         veXCfM0AO7YYTstbK1dpW+0yE/S4F6fvj4HNAMaf2d0f5SITnK4IgxfawxD/VKAor5Eg
         f+ydHfaH1NZNVfdhY6d7BlqmcwMfyyDr8usVXGWWzU0Av7mqh7p1FGwj06nvTjD9f5kG
         KC1g==
X-Forwarded-Encrypted: i=1; AJvYcCW50UFsksok9z+wOLIdZHMnsu+uvYxnSp6BVh/ESyDg8Zws3duwnQkVJvH6UQZ4Ee9u0HJhiD+Ag+kwVM0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/nJRqFSMToA8BkrkFGyKXfdNcwiS3lej64mVjJd+16g0yg0kd
	4D5XrToZlrnwCCV10NJZWfXoYuwn9/9L4/Ar2SYHULB+ZRQJNOiq3nOGIvjU
X-Gm-Gg: ASbGncvLfdl1PPEi70PBQ8lKSUPebMqzMfk05TxNJ+bMQAntaBhO1xcW0vyvbj5vG71
	yhUWBXZC/touAO/t7YIp4sR0Sq6MhTTtGy98M7tEQK3I769SFxWG1AxQRLpj//Y8E/oi/JqiqZr
	ZJNtTeLgPoj/pa1cOrPKroAGQ2CrzHgYKNMhQosVLd8xxGtXLl6btNrJx+hVbZ7pryWMCzA0O2u
	BZjDaCeqt80TDZ6S0DY8yq4Fj7t0mjdsJT+6KcfTuErL2ggM1xxzjdtk/G8ZjmQAZF3seYFiLp/
	T6B0Z9+FaGLpbERQwpVfjG8lfT/AAiM=
X-Google-Smtp-Source: AGHT+IEYuFVDnIjzV9K0AMi7hDserIpOlUBVkVj9T9bwXFqSmujqxRySnLvmGH8T8VDjHoioU6VPfg==
X-Received: by 2002:a05:6a21:3388:b0:1fe:61a4:71d8 with SMTP id adf61e73a8af0-20e96ae4c9amr8488842637.22.1746431371369;
        Mon, 05 May 2025 00:49:31 -0700 (PDT)
Received: from dw-tp ([129.41.58.7])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fb3b5b6d2sm4923970a12.25.2025.05.05.00.49.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 00:49:30 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Donet Tom <donettom@linux.ibm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Hari Bathini <hbathini@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, open list <linux-kernel@vger.kernel.org>, Donet Tom <donettom@linux.ibm.com>
Subject: Re: [PATCH for-next 1/2] book3s64/radix : Handle error conditions properly in radix_vmemmap_populate
In-Reply-To: <e876a700a4caa5610e994b946b84f71d0fe6f919.1746255312.git.donettom@linux.ibm.com>
Date: Mon, 05 May 2025 13:06:21 +0530
Message-ID: <87zffrpkzu.fsf@gmail.com>
References: <e876a700a4caa5610e994b946b84f71d0fe6f919.1746255312.git.donettom@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Donet Tom <donettom@linux.ibm.com> writes:

> Error conditions are not handled properly if altmap is not present
> and PMD_SIZE vmemmap_alloc_block_buf fails.
>
> In this patch, if vmemmap_alloc_block_buf fails in the non-altmap
> case, we will fall back to the base mapping.
>

We are trying to create mappings for vmemmap area. In this, we first try
to allocate pmd entry using vmemmap_alloc_block_buf() of PMD_SIZE. If we
couldn't allocate, we should definitely fallback to base page mapping. 

Looks good to me. Feel free to add:
Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>


-ritesh

> Signed-off-by: Donet Tom <donettom@linux.ibm.com>
> ---
>  arch/powerpc/mm/book3s64/radix_pgtable.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
> index 9f764bc42b8c..3d67aee8c8ca 100644
> --- a/arch/powerpc/mm/book3s64/radix_pgtable.c
> +++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
> @@ -1173,7 +1173,7 @@ int __meminit radix__vmemmap_populate(unsigned long start, unsigned long end, in
>  				vmemmap_set_pmd(pmd, p, node, addr, next);
>  				pr_debug("PMD_SIZE vmemmap mapping\n");
>  				continue;
> -			} else if (altmap) {
> +			} else {
>  				/*
>  				 * A vmemmap block allocation can fail due to
>  				 * alignment requirements and we trying to align
> -- 
> 2.48.1
