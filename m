Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9AC72CCC0
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 15:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748358393; cv=none; b=hB0VN8VlIK8iRyWusv2aWm7ueB1FYvPjAJ+5AsSsvmLTbMJz3ILja//4dbKkamofRanLN7q0cOyJYWgp2vbDaj5YMWIta50NTmif/abrTACWKidsyXQPO1UwYiz5xJJo0MWcJfUgbsOTijCk2heOHaiDhP4lSQis2cB4tsa5c+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748358393; c=relaxed/simple;
	bh=OeMg/n4s+XUyV+zOygmzjEvKMcK4qz4amGuZH9Z+N+M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N8POQacDXNfcBVyEtXqHxOLItPJnu5Ula5zrkItuuEAb5MHFqB6UjHUk6zcw0+sS/oOR6x/az4Rka3QGRJKbGLCX/kjEw7IgXR2MQ8ZInMnYQno6WtDl116YUvLcAdHVvlNBsr3pDJ3LkP5tIvMCx2XIHZhdVke+4wY9nqTUqt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=erkcgR94; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="erkcgR94"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748358390;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XZ29RQMR69m4K9xLY43phEvDycHRnJ7kzp42BGznxp0=;
	b=erkcgR94j+n1GRaGfxd+TrzE6ucnxJrRKb1FH2wHFIAfmOFJQEZ+TKp8vdjTTOt31NLUts
	ChS5GAIyG8LvnyIsd+nl5RyvAVtkA3cdSHjYYh/UkMF3aVBDSlqRzDMhCURMxfRVf315WC
	NRipkKCh45TDidgioHQIM2h1hjkLmcg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-423-HO_dkJLSOfmSUuG2iHwc2A-1; Tue, 27 May 2025 11:06:29 -0400
X-MC-Unique: HO_dkJLSOfmSUuG2iHwc2A-1
X-Mimecast-MFC-AGG-ID: HO_dkJLSOfmSUuG2iHwc2A_1748358388
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a4d6453521so1267968f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 08:06:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748358388; x=1748963188;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XZ29RQMR69m4K9xLY43phEvDycHRnJ7kzp42BGznxp0=;
        b=MvRCzxIltuqMjW++ZwK/nNRTvnAitjV4vqTRIvumf6LnY16U102/sugfSre+SoA1Er
         m7iGKjNhZAXTJBdDgVIxT6ekeIMcNAaQRh5WoLRd+CJ9kO2avO5i5XRTTaeGYq0e0+Ta
         PXEmpMCVDf/QKGZf6lmj0lB2wM2/UXy0m77TkQb4wO9oCJ61j5i4/rMb30moJRakfNNx
         pawGTNHMXOY6ox5kxeSA3N1vlM+DcOz8y5iu5tIuq8rok/JR3vlnu13Ef2sBE0Ltjh0y
         3fUjPUSsyogZHqhKsGoHz6w1o7ZLVNZDAZGcrnl+CvX2jYqCix/VkkJXwsaQiPyhehcO
         gQQw==
X-Forwarded-Encrypted: i=1; AJvYcCX10dXGwLBCtKeJuuqHrBq67dHi9TQF3oQucH5A85p9FM+TvkhUe5Mlq8Fupf54g+tqLqXoZeorvpezeoA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrbaVH0BqsMDEPqevPAz40Bi+GIn1rTIwJKANrxfBbydlOlnsq
	6FYIV0uKe+pZ8D0FP9qf4N8IZ2rGULjKkXOq2AU1O+Fqn9D7FmUTMjH2pykMLnX7LlVkNjpnYtk
	VCQ4yuD7lgVLpe4b9EfW/uw80ywbrKNQp66o7YI7K57/+x/Kq0AOsuxXPy6U2g+HMsw==
X-Gm-Gg: ASbGnctylhRw8NqUOOJGbHzjyL7zmpLImWtUOac4IIhPQrZgRWAmQWCLKo5Bar4XDSy
	mVZJElLQ7kIhBV98EThQ+zwls/zdBtK5Kgna3VkZE8GrBfs8uszTc6LIa8p8L3QA3C4wScQmOgT
	msqynXpXv7YnFbpKd4HH89t3vjFxJDGsK8cZibnr69Gt1dnkJVwzB7mCYH2mX3nf01sOzQu8Bvf
	HIy08cYnC3Ho6/dUwg8AGeVtrB1l48+GyeSov2jTJPUAIgZZ9hyMLfeqiyxG13JNnyxEBvaMt97
	OpgamA==
X-Received: by 2002:a05:6000:2890:b0:3a4:d7ba:940f with SMTP id ffacd0b85a97d-3a4d7ba9678mr6493705f8f.8.1748358387887;
        Tue, 27 May 2025 08:06:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHnxRACmfRB0RLkxdi7utBGmJ2uHTW6WSbB3UldnlI9CQBfujtwCkHpHjFnwqjC0VngKmP3KQ==
X-Received: by 2002:a05:6000:2890:b0:3a4:d7ba:940f with SMTP id ffacd0b85a97d-3a4d7ba9678mr6493637f8f.8.1748358387264;
        Tue, 27 May 2025 08:06:27 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4e1632825sm2396185f8f.43.2025.05.27.08.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 08:06:26 -0700 (PDT)
Date: Tue, 27 May 2025 11:06:23 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Alexandre Courbot <gnurou@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Albert Esteve <aesteve@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	gurchetansingh@google.com, daniel.almeida@collabora.com,
	adelva@google.com, changyeon@google.com,
	nicolas.dufresne@collabora.com, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, virtualization@lists.linux.dev,
	Alexandre Courbot <acourbot@google.com>
Subject: Re: [PATCH v3] media: add virtio-media driver
Message-ID: <20250527110444-mutt-send-email-mst@kernel.org>
References: <20250412-virtio-media-v3-1-97dc94c18398@gmail.com>
 <20250526141316.7e907032@foz.lan>
 <20250527102111-mutt-send-email-mst@kernel.org>
 <20250527163927.02924adc@sal.lan>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250527163927.02924adc@sal.lan>

On Tue, May 27, 2025 at 04:39:27PM +0200, Mauro Carvalho Chehab wrote:
> > It's up to you though.
> > I can keep it in next for now, so it gets some coverage by
> > tools scanning that tree.
> 
> Sure, feel free to keep it on next if you prefer so. Just
> please don't submit it upstream while we don't review and
> properly test it.

No prob. I just want to see it get reviewed and merged.
My understanding is, it wasn't because maintainers were
not Cc'd so that should be all ironed out now.
Alexandre, do you want this in next for now or just drop it?

-- 
MST

