Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4DCF79C4
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 05:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744866769; cv=none; b=dhtMGBWuFgfnwrOXWCxDVzeqvITZSi2byptga7fD8425JB+z31HPj9t1vHBbV3O53G7E3pLF/JYS59PkDd6ApPf/U/CFxP720ALCQvrFQUHN0P3Y9/IEz9ovoiqQ4PtNWNYeYgf/XhxgYg0eGtsYM2hfx3L5wRAfYMEAUPnShWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744866769; c=relaxed/simple;
	bh=RwjFwDkBu13PI5sKcOqmuHCEzvAqWpqM2gBR2fnslU8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FoHy4xf20nAJWfoM7HoArBwFan8pF31lGSfM87yuzHqwFo5qE9ZbysXyMd1l83d4yEyipugYZT1hw/NRflf7Qgoh+3vfE2tTjKW9VJHfjTbDMjwgA4PrilgVAhP+SADKn0DcpmtSyAEnFB1hIR6j0C3IGoaqiGofg98qrVOOisw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=DYdnEZdE; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="DYdnEZdE"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2255003f4c6so4533995ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 22:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1744866767; x=1745471567; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hh3kV57LiDX7manrXAEW9HUCJLEmcGX3IJLDmSlBULk=;
        b=DYdnEZdEFgVUJOnsvQNLDUFZIkFTSvByqYt281/oO63o68IigxqoEEde2Ft8EIjWJC
         NjfRa1GEb/gc44Yxft/yS8zbJikWLDVdAsj83AfcfSMi52KmoExgqHx6/+eDCabUPdPm
         tvQfPDSz4FofQsvNHWMF4NwDmRM1RrLZu0uY+ZIXYz5azKRncqhrxjE+4s0TDxPOicDJ
         UVuuplEe2Jg79uGVfl94/e5pxFCU+1GZxTNeOkTzUQsCdC2nhMbEr7xahnGedFNvRszr
         2fyWEHJOow7Q/ih7WnWGUuzJ3+Jj8l8ArQJv5Bf6Dsd9+2DoJBmuQZes5dJ/scmpFf5D
         2sDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744866767; x=1745471567;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hh3kV57LiDX7manrXAEW9HUCJLEmcGX3IJLDmSlBULk=;
        b=L46Jvp9skTChghE7ej+RoQQSru7KPb9b8eyao9VgEsaJ1pTSyRUQb3lFXq5goYJKR5
         1BWKOvyLG/zHQI1xOQPM3wm2wifEth8LZjpBwH01148hlBwj56ZpiS3R0Tl671aSomXr
         BTRGjgT7UpbB7psXtvVoQxRAcF+FVpZN7ywn9OewOPOCCOleGUVu+Fsov06zSSuPETir
         0eODJncvwTCxvKjcO4lXXKwMtJhT1N/cirJyetYpBoqWFAKgdsIzTBBbhxSFrkYaLrFV
         YJ9t4Cn1WXftLby31ku6/qKPDdrLB+ypYBNBfJdW6DbNOJ/ezyfWGcd9N1eEh+0JEczq
         GmMA==
X-Forwarded-Encrypted: i=1; AJvYcCUa4AfQ5X/I4/bA0elW8oBc1uKM2prVxh6ly9ZndlcIsunJFSl+lDRkmGZT5QWBtH67uUhf3MHqMBc9h0o=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFC25sW7Z6wh2WS6i9RlrNpqz/fFzmPUx0L2UwehldBUChCHI3
	ZWURtGDA/DZxvqoWhMPiOYUSHojHYqW7zfFHxwJm/zICknks+AYARca9tUr2BYY=
X-Gm-Gg: ASbGncvU1oL+vvbUDR4DBcU/LTUzvQf9dIz3c8j/s2H4vJmclUGw6GFzd86IEr8gxGQ
	UEcdSm2VMOMvy3WqCYJm9mrPs6amh7TogL4LBG0zINuhoz7C1SKIr/F8Hj7I8Oabd4MwdKIIrFH
	BzKN3jZinUUrhFw3ndTPegj0JxfNrtnQSOayG4WxxpTYMr4LfR1HmUrJoQbMr/MBa2BQ353AuzZ
	2sRQSqXJOzFwProcxgNjKluOxNNd3+wkU/s1ws53C3b+KhvbSnp0MD+z/+t2kd8ApuQCQ3BhFew
	rmCYMMgQGN87iV2seBTWLn986S6/vnr/wGOzdn8qTdXx2IsBMoiqmlnRaoyhkLIoHGw9vwUDuQ=
	=
X-Google-Smtp-Source: AGHT+IG+DJ8hFvCH+e3tMNsQubnMI6xLQ0x1LAhdNsGyukov9JTMdxIRePZdTqUQNcjXeFL0RV3m+A==
X-Received: by 2002:a17:903:2ec5:b0:224:18b0:86a0 with SMTP id d9443c01a7336-22c3597ec0amr63501095ad.37.1744866766946;
        Wed, 16 Apr 2025 22:12:46 -0700 (PDT)
Received: from xldev1604-tmpl.dev.purestorage.com ([208.88.159.128])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd21e00e8sm11393282b3a.80.2025.04.16.22.12.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 22:12:46 -0700 (PDT)
Date: Wed, 16 Apr 2025 23:12:41 -0600
From: Michael Liang <mliang@purestorage.com>
To: Chaitanya Kulkarni <chaitanyak@nvidia.com>
Cc: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
	Mohamed Khalfella <mkhalfella@purestorage.com>,
	Randy Jennings <randyj@purestorage.com>,
	"linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] nvme-tcp: wait socket wmem to drain in queue stop
Message-ID: <20250417051241.b3cnkp5svew3zhud@xldev1604-tmpl.dev.purestorage.com>
References: <20250405054848.3773471-1-mliang@purestorage.com>
 <612d817f-33e1-4e2d-99eb-0ea87e1a958c@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <612d817f-33e1-4e2d-99eb-0ea87e1a958c@nvidia.com>

On Tue, Apr 08, 2025 at 09:00:00PM +0000, Chaitanya Kulkarni wrote:
> On 4/4/25 22:48, Michael Liang wrote:
> > +static void nvme_tcp_stop_queue_wait(struct nvme_tcp_queue *queue)
> > +{
> > +	int timeout = 100;
> > +
> 
> is there a guarantee that above will work for all the setups?
> using configurable timeout values helps creating more generic
> fix, do we need to consider that here ?
The value here primarily reflects the latency between __tcp_transmit_skb()
and the freeing of the skb in the TX completion path. For most scenarios,
100ms should be sufficient. While it's theoretically possible to see higher
latencies, such cases might not be typical or practical for NVMe-TCP (please
correct me if I’m wrong).

That said, I'm open to making this timeout configurable if needed—perhaps
via a module parameter?

> > +	while (timeout > 0) {
> > +		if (!sk_wmem_alloc_get(queue->sock->sk))
> > +			return;
> > +		msleep(2);
> > +		timeout -= 2;
> > +	}
> > +	dev_warn(queue->ctrl->ctrl.device,
> > +		 "qid %d: wait draining sock wmem allocation timeout\n",
> > +		 nvme_tcp_queue_id(queue));
> > +}
> > +
> 
> -ck
> 
> 

Thanks,
Michael
