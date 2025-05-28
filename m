Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B0B0244695
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 07:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748416868; cv=none; b=VPnTEtZdbVekH7ORoSc1R7YSvZRvcMhPug1h0ubvuEGG6HhhEtjkBunzDB8ZaYq5HyGmjuuKGCOodzqfrV/5VpM9MYXMWZNFHBr9wwtInUAaA+AZKgLNhjToGzmDKWwjvZBJCoXeEpRSl6BaM4n/09TCMmZhkWGQ8nlgyx2Ht7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748416868; c=relaxed/simple;
	bh=2qHmQEB1E1zkN71QCfVoyToUf5ogIWK0R6isdin/Ad0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nr2KZNcxsaHVNn0IYk/ILzdAIqsukRKmWnxIP6vHkqLQM05e4GyavY9g0DVW35xUkH+dORSGKmI0/BKKvSU5d7OVoVxF9cmm1jbm67pZoUoD829RwTBh0g4S2f3pYEAbQXBooKTMT4z9F4cksChfmKCG3JAJ4I/q1fSHn0PXGPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GpvP0Qtu; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GpvP0Qtu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748416864;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Yb7F8w++tHPp3njA+diY9i2D1I8vF7wYtoKldSCXI70=;
	b=GpvP0QtuF1mYahqkmTAqPmOLH/B8RLIhD/cn/+l+3BD0e8pctjDUG62jqgcqmlilUFeSYG
	g+ycD+te2NPKCz8z3WSZoP4X/NCSav5kQ4bVZCTBXfUoEnwGTT/e92JEIWoSLMn1KaDysA
	BF01WznYj+jHyviukGdRFHlk5pgul/Q=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-688-4xfbBtN1NvWzzN-tDPIIWQ-1; Wed, 28 May 2025 03:21:02 -0400
X-MC-Unique: 4xfbBtN1NvWzzN-tDPIIWQ-1
X-Mimecast-MFC-AGG-ID: 4xfbBtN1NvWzzN-tDPIIWQ_1748416861
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-445135eb689so25562455e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 00:21:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748416861; x=1749021661;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yb7F8w++tHPp3njA+diY9i2D1I8vF7wYtoKldSCXI70=;
        b=wIXW2TEuC4Ph1jml0Sy/MtLzHOEWzvnVJcQSYsSPIL5EgLjqASqyKsPRoac+fAbbsH
         /WzzRMZf+SbxaFu6o0CrW4u+V5hDHQUnEc+6wrwf31MQm4G3FUFiYLRBZVe+vp2xFUTB
         y7QkZ2IvDO5qpuKmvoIaDu1WCQWFHvvfZw9OfwHtOw5q95XcqjMd0S53BhHuklLTN1Pt
         sM1yiB+zqrFZt8IHIsYGn1bLNNZYN7JNVNaLKnxsDSzFWxs7cgfj6YjuR4TpGOmlethk
         4YF3WLK72MF59Lle0hpznPliM9zAxSw8NLLH3ujVdqnSab1X1Z7bYdSpEBJ5hzqSikxZ
         ubsQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9Ddwp7BE7V2hOiG5KRyAQhqCRIxTjk6L/AMhTbIuINRtkul1foRpt5LdkaKAuhlDqGVOkr5BDfot5VDw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyeLozJg/z3E7k/OgqNbC/OSDHuYEHg8quP9jvhOiOWugnztHkS
	UzZ1XxHvV7bGAd5/0ZmjZxNp69V+xOxRktavUVWxqTqkJLV092wXkbnGLSCY6sRdIU6QVym/BLJ
	OWiIr578s5xzKNNyHhmt+hrhhm91sECxgIgY1GXUOa3TJt9L36gjywUAsxnpElfbOUw==
X-Gm-Gg: ASbGncsZ6NXZLhSTjv2v6PCcHWvJqMKuqqeBdigBImbZJU529lPua/+S2zwVwJGFGky
	3Ve3FyJPDX5Cn2uNaGQP9c1k/V8nbW4irzmItauQw2H3yLmxDkJ0mpqHaz1VUxsrNq9L2cB4GL3
	AoNXp1NtSz4EfAlKdAQ6M61c/AzPVyoNW5LbtySKTxgdY26lSLFbY0FHNx3c/rgt5szdiufDR+Q
	q1fXlTW22gzKXD6e1W3AtHA3g+pFYiBf9SEb1xzCbunDEBncrlEgzAEmM50ps2YmKFJD1Qh5edu
	g+HGKA==
X-Received: by 2002:a05:600c:4e0e:b0:43c:fa0e:4713 with SMTP id 5b1f17b1804b1-450725459f7mr9070095e9.2.1748416861124;
        Wed, 28 May 2025 00:21:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHtS9Q0iEWdCKqSBK4rpAPZvD0CQFR0nxD5Boy80MHIXn1Qzua/IJWOZxrhYd51QhCIxJ9zSA==
X-Received: by 2002:a05:600c:4e0e:b0:43c:fa0e:4713 with SMTP id 5b1f17b1804b1-450725459f7mr9069825e9.2.1748416860757;
        Wed, 28 May 2025 00:21:00 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4507253becasm8466095e9.2.2025.05.28.00.20.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 00:20:59 -0700 (PDT)
Date: Wed, 28 May 2025 03:20:57 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Paolo Abeni <pabeni@redhat.com>
Cc: Laurent Vivier <lvivier@redhat.com>, netdev@vger.kernel.org,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] virtio: Fixes for TX ring sizing and resize error
 reporting
Message-ID: <20250528031540-mutt-send-email-mst@kernel.org>
References: <20250521092236.661410-1-lvivier@redhat.com>
 <7974cae6-d4d9-41cc-bc71-ffbc9ce6e593@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7974cae6-d4d9-41cc-bc71-ffbc9ce6e593@redhat.com>

On Wed, May 28, 2025 at 08:24:32AM +0200, Paolo Abeni wrote:
> On 5/21/25 11:22 AM, Laurent Vivier wrote:
> > This patch series contains two fixes and a cleanup for the virtio subsystem.
> > 
> > The first patch fixes an error reporting bug in virtio_ring's
> > virtqueue_resize() function. Previously, errors from internal resize
> > helpers could be masked if the subsequent re-enabling of the virtqueue
> > succeeded. This patch restores the correct error propagation, ensuring that
> > callers of virtqueue_resize() are properly informed of underlying resize
> > failures.
> > 
> > The second patch does a cleanup of the use of '2+MAX_SKB_FRAGS'
> > 
> > The third patch addresses a reliability issue in virtio_net where the TX
> > ring size could be configured too small, potentially leading to
> > persistently stopped queues and degraded performance. It enforces a
> > minimum TX ring size to ensure there's always enough space for at least one
> > maximally-fragmented packet plus an additional slot.
> 
> @Michael: it's not clear to me if you prefer take this series via your
> tree or if it should go via net. Please LMK, thanks!
> 
> Paolo

Given 1/3 is in virtio I was going to take it. Just after rc1,
though.

