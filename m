Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B057C227BA4
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 08:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744015314; cv=none; b=qXicU7CSZ2qPyWXP5MBJ5EdCfNnPmAxvrsKxJcOfA3vDfbUplUebJ/KWfV10qIeGh6UNHeC+y83ZXZTE5zSSwYRzm5G9ZfKftzQ+zKXHLzJzOqMgk+emG36puFRRL+f5oDs7oTsRFTxnLs/+Zf5g3UHT2+ABzutqH+xXuekvQw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744015314; c=relaxed/simple;
	bh=dubat8tCLJKpXwu98mOgPZCaGLWjN3X5sHoHO7zCnlE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V4uyc9e0TiCdv1jfbYvQQK4rIZi2RfVt/Sltk9ZWeyw3hI0TpatZLZtqOXEYEzz2CcchmcIN06S3p2EbwP4q2e/4XsmYHeqsAt22IONhc9gxNI4XcISUrbikoLDjdGOanQK9ijmXUHdEuboSl4GzkE1BATwhDr/Km3cPR9AUDC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bx5ZAoS3; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bx5ZAoS3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744015311;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=m3pK6yIdPNYZ4p3nnxwbYWeXbQyAyM0EzrK62OMGx28=;
	b=bx5ZAoS3UwOKTWEVPCAen1bCVlFGjOUbOSPgB/Q2yxSxkKyOrfQbALqBG0ANrnoSXWuUM1
	GqjHJG4opdNzy/+jNfBVl0tUccgzpfJgViYAEtTzqi/loIpSqqKxw+K3cRSMjF1CBAVFqH
	vSUhdWj7ZoviBRJ99M11TmGXjRJUTCg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-584-RWkjQHMxN2abtEPttYwWKQ-1; Mon, 07 Apr 2025 04:41:50 -0400
X-MC-Unique: RWkjQHMxN2abtEPttYwWKQ-1
X-Mimecast-MFC-AGG-ID: RWkjQHMxN2abtEPttYwWKQ_1744015309
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43cec217977so26286125e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 01:41:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744015309; x=1744620109;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m3pK6yIdPNYZ4p3nnxwbYWeXbQyAyM0EzrK62OMGx28=;
        b=CYHfzUB8Km39I1ZT0Ad4UZpcczx5f/K23QP707Yhj/Z9epRNe95GDvSArgjxcrswwm
         pAzcqCsBZVSzsPlWIunHsI92bdJ/N+z1HQdRI6WYKfZRQxm2YBrpL/Fp9SEwFZ8W1Sss
         OZRc7XKvc9lDmQoItz1YIGh4KQ1tz/jCovk3s0tSACfLBseqG5fcwTYJzogX01dVjhf4
         cK1mrPRNO5SslOW0Mck83RpJ6cRI1qAVb7YyIEpcJisLljD6d0iHKgB9orI2Lthh8qXH
         BIzrVbhAnyegW+nT8KjXJaBd3PXMsu0ayQpYQLvWJqaXLNhL7+YCj/XrGcmSHTvfWcFr
         djgg==
X-Forwarded-Encrypted: i=1; AJvYcCWw335b2Bd7lXiYdI4ZMtTRDYxo1uJutgQMgYGio8pCqjlit5rd4BjnQOAMd9VNhdaIYtYltsv3GFl2WLQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPO653VgpftccZsg4O4bIsVJFB991KhJSoM+4MC1FdpMxREIZc
	PHUIiBzr8DgLeKKlL9/fjQ7JCErTRxPxV/393UfN5/OJv51vDgUE9XYx//8Anlb3T07QD53wKgS
	4DFrWGzaMgTW+t7cpYdqbDFeDBEH7xF+BBA9jFQN+hFlVQT40P+V/EA6BwxsTQw==
X-Gm-Gg: ASbGncvjtiC3uDCVhVeGUw5+4EHI2Xa7mUbVntVqIdieTbN2W6BMylt37B0BNheTOqI
	vkzudekgGTawpawMjGpeI4OjiyOK0iTcCBgNwto3O/OVb5q00IYizvBDYYbjj/4+c8ELwcFFf1M
	qtqDqYO97cGM+yLaWgv9vnvFuVwd70Qkh9Uo4+T6FC/hL2Wxyz6A/ItMOfOb4k1qfKTu6v4mW3M
	JTvEKgJC5cxhRu783xH4vWUDVkeWYJxXnLfqFpxDFX+xzG4Jb/0pJtJfefS05PLrveeAS0xNUek
	uGHdfjpHsg==
X-Received: by 2002:a05:600c:5248:b0:43c:eeee:b70a with SMTP id 5b1f17b1804b1-43edf8a28d1mr45333075e9.22.1744015309274;
        Mon, 07 Apr 2025 01:41:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEnMOiX9O9gk9kURjhnnuCNT1UVrytArjtGV7ecRUIBKrJSc0PSzOsjWjaDnmkVaY/+rUOMfQ==
X-Received: by 2002:a05:600c:5248:b0:43c:eeee:b70a with SMTP id 5b1f17b1804b1-43edf8a28d1mr45332875e9.22.1744015308965;
        Mon, 07 Apr 2025 01:41:48 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c302269a2sm11484143f8f.91.2025.04.07.01.41.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 01:41:48 -0700 (PDT)
Date: Mon, 7 Apr 2025 04:41:45 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Halil Pasic <pasic@linux.ibm.com>
Cc: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org,
	linux-s390@vger.kernel.org, virtualization@lists.linux.dev,
	kvm@vger.kernel.org, Chandra Merla <cmerla@redhat.com>,
	Stable@vger.kernel.org, Cornelia Huck <cohuck@redhat.com>,
	Thomas Huth <thuth@redhat.com>, Eric Farman <farman@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Wei Wang <wei.w.wang@intel.com>
Subject: Re: [PATCH v1] s390/virtio_ccw: don't allocate/assign airqs for
 non-existing queues
Message-ID: <20250407044029-mutt-send-email-mst@kernel.org>
References: <20250403161836.7fe9fea5.pasic@linux.ibm.com>
 <e2936e2f-022c-44ee-bb04-f07045ee2114@redhat.com>
 <20250404063619.0fa60a41.pasic@linux.ibm.com>
 <4a33daa3-7415-411e-a491-07635e3cfdc4@redhat.com>
 <d54fbf56-b462-4eea-a86e-3a0defb6298b@redhat.com>
 <20250404153620.04d2df05.pasic@linux.ibm.com>
 <d6f5f854-1294-4afa-b02a-657713435435@redhat.com>
 <20250404160025.3ab56f60.pasic@linux.ibm.com>
 <6f548b8b-8c6e-4221-a5d5-8e7a9013f9c3@redhat.com>
 <20250404173910.6581706a.pasic@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250404173910.6581706a.pasic@linux.ibm.com>

On Fri, Apr 04, 2025 at 05:39:10PM +0200, Halil Pasic wrote:
> That basically means that if I was, for the sake of fun do
> 
> --- a/drivers/virtio/virtio_balloon.c
> +++ b/drivers/virtio/virtio_balloon.c
> @@ -1197,7 +1197,6 @@ static unsigned int features[] = {
>         VIRTIO_BALLOON_F_MUST_TELL_HOST,
>         VIRTIO_BALLOON_F_STATS_VQ,
>         VIRTIO_BALLOON_F_DEFLATE_ON_OOM,
> -       VIRTIO_BALLOON_F_FREE_PAGE_HINT,
>         VIRTIO_BALLOON_F_PAGE_POISON,
>         VIRTIO_BALLOON_F_REPORTING,
>  };
> 
> I would end up with virtio_check_driver_offered_feature() calling
> BUG().


I mean, yes, this is exactly to catch drivers that use
features without negotiating them first. 


-- 
MST

