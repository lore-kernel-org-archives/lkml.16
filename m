Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DADDEEB1
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 05:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746683903; cv=none; b=kqEY+b5whYuyrij4Hw7rsPc9CvJwSj2gTu8TAtIzaF7kkDz7r451l2wzNNZkJ0sQJbXJYpQqJTOsFrCU3+pd4uXlLJF48iPQHskaFTqABDho6UdBTbmjKRb7QIeyl7togwLGGEbftKfYNC4VlV1FVHdS9W4PFCiIFf4KVGx5dAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746683903; c=relaxed/simple;
	bh=KxndNMWC7r9E1PVcpXKVrtsS3BfaA2Ej3TZoSV8BcCM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yrrt1gsgN/vj2A2S+YE02WYyRxhw9CBAZtuezinnsRbFSyK2ZGGWb2rMu11EfcTx9XMOfXGB/uYIQo8uwRb8AStemaft61itCkFv2IxpcQqWeMBgahKrYVQAp0l8JiUE0mxMrXQwUth/6kglS4hkQyTcUFRlyIdrVijIE3bCe1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=HTDbzQSF; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HTDbzQSF"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-af52a624283so622731a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 22:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1746683901; x=1747288701; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+e5r5WoTNEt+2nCRRiXSbdXuZcVrl4MaI46ssYjydio=;
        b=HTDbzQSFZJqm8/Y0MLZB6e1rG4jGL3T4ZZhdpc5fadEDI/WmSsbxo1FAwz5SI2uW/+
         yn88TNTFUOROiG0Nkqq4YrPKfWTuLBAtiz3SBGTymlo3XB1Ak0q9YfvFfzVFvT2pTtM3
         0K3q7gv7r2kKKa7K4iZzqcuBNdGuyMV3bRg2c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746683901; x=1747288701;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+e5r5WoTNEt+2nCRRiXSbdXuZcVrl4MaI46ssYjydio=;
        b=bf9dFaAv3lXQ7A5DnktfusCnaqHXeI/AW9uIGnoe7JK4AngUYmWBKgv6keMQmFwPSy
         kXQoYSJc7+smT8gdCQdMD3pjwaAokNkMDTT0uZhEDwwN0SNAWFsHMu///Vf11hvESNBo
         bpG5D+dkMZGpZsrp7JXG5oyrrjUTlqhx/sLUwq5z95qeX+x8WiR3GS6rypGVXZvtOnbb
         uZCoBrmXPVl5UcikdzIS3sEa99inqdN0qS/I8lC5o3zJ4S1VAB0Wj1xHvxpFn7dJ3FAx
         f5CBnlVK4MGHUJWFVjWrfpGH+A6ogCIzVCXhnBkat1MBy94RqunPPgRH6UBmvhky/u2k
         rI3g==
X-Forwarded-Encrypted: i=1; AJvYcCWFx6DSnQnb5NPlgOlEXQ9qC1cB1QKoJuhRgMX91JWI0hx8TFAF/k4INLwgbKuylr2x4FwZbqqx5XCikwo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyC1CCbiZQWMcTP/aCgxFZzYvU4xWbA2JWErQKMBfztuV009B8P
	08V5EJn8UwOJBCsCL2Pn8wQ/5VsBCSvU+LBD6tp7ehBMx0X+OifWV4C5Xy454w==
X-Gm-Gg: ASbGnctIG4tb4ZtPOPcwsX4Ll2Jn/v7BJ+PY6TrduO5LCZZeZcNJVOhrucrLQWcQCnK
	AahqPOImE3AR3q/ZRAuGQmGc7RwHym5Hmqh9chqgg7hmGbxQ0oPzmb61x4hIP0b1SQQ0XZ6DNpl
	HC/zZx7ZW6/sKZHnSvZ/Bd3Ej7KYTNMYJUo68LcQJLKundWnd4IXzAJBvUMAhWh/vDOoBeZg0Ox
	oSGKiBX66ZjkQWLfKO8VqMZWvZCowvvC2P6TufSk/c37fMrzZ0NVkUovkjXgjEPNSolL2JTNpz9
	R77Tv3BPk2gGrSLPYTzLNK69FgJQbJj+Xr6AJgceWOFL
X-Google-Smtp-Source: AGHT+IHc/oU3lljiV4zShx/DsL9F8EEmzVZbcTYXDGw7R5XiBo2bpyQ7wNVPTDw7uDaWETzfVwwexg==
X-Received: by 2002:a05:6a20:3d95:b0:1f3:1ebc:ea4a with SMTP id adf61e73a8af0-2159a05e8f7mr3791386637.20.1746683900752;
        Wed, 07 May 2025 22:58:20 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:c794:38be:3be8:4c26])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fb3b5c199sm8907087a12.29.2025.05.07.22.58.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 22:58:20 -0700 (PDT)
Date: Thu, 8 May 2025 14:58:14 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Christoph Hellwig <hch@infradead.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Yosry Ahmed <yosry.ahmed@linux.dev>, Vitaly Wool <vitaly.wool@konsulko.se>, linux-mm@kvack.org, 
	akpm@linux-foundation.org, linux-kernel@vger.kernel.org, Nhat Pham <nphamcs@gmail.com>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Johannes Weiner <hannes@cmpxchg.org>, 
	Minchan Kim <minchan@kernel.org>, Igor Belousov <igor.b@beldev.am>, 
	Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: [PATCH] mm/zblock: use vmalloc for page allocations
Message-ID: <unyov4aypoaotj56m5scgd4qtjfn2mceb4zdmtaek42dfqaq3t@lrrqwojlmudp>
References: <20250502080156.1672957-1-vitaly.wool@konsulko.se>
 <aBoK7f7rtfbPFGap@google.com>
 <m2dmxnhtvxano6lye7lr3saiobn4ygpln55xntlstfo4zwws5g@qpq7aagx3xwq>
 <b42gpp5qsa4j22ai2v4rwwkjhvfbcbf3lcnjoccz7xeidae5c7@ot2ocric3qzs>
 <aBsDj0IGQBJC_JMj@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBsDj0IGQBJC_JMj@infradead.org>

On (25/05/06 23:54), Christoph Hellwig wrote:
> On Wed, May 07, 2025 at 03:08:08PM +0900, Sergey Senozhatsky wrote:
> > > This sounds interesting.  We might get rid of lots of memcpy()
> > > in object read/write paths, and so on.  I don't know if 0-order
> > > chaining was the only option for zsmalloc, or just happened to
> > > be the first one.
> > 
> > I assume we might have problems with zspage release path.  vfree()
> > should break .swap_slot_free_notify, as far as I can see.
> > .swap_slot_free_notify is called under swap-cluster spin-lock,
> > so if we free the last object in the zspage we cannot immediately
> > free that zspage, because vfree() might_sleep().
> 
> Note that swap_slot_free_notify really needs to go away in favor
> of just sending a discard bio.  Having special block ops for a
> single user bypassing the proper block interface is not sustainable.

Oh, I didn't realize that zram was the only swap_slot_free_notify
user.  zram already handles REQ_OP_DISCARD/REQ_OP_WRITE_ZEROES so
I guess only swap-cluster needs some work.  Are there any
blockers/complications on the swap-cluster side?
