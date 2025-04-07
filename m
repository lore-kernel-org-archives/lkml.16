Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B85F189BB5
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 08:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744015480; cv=none; b=lKiwLTSCaBnXO1WO2nb2dHwaeZdNRZwW54rlGIj7/eU9eegqZJdj6vdTuSPO6XmSS+Z0MVNSub1wHeYbWqeqAGGoTKR/xYjOjqQzZiWAp7gdhjco+5HT2w35Io9NBIsVkt9QlxUoUdFhwBGfAAv9BwhQWvOr4Yxpza/qcGi1Ktc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744015480; c=relaxed/simple;
	bh=PtiFvCi0OCxZqEy7v1TJKjthTCLnjNTw9mDEXSxL+Sk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aXvr+zNZ48HRDdIA2BIdCRHPmTP+zGuLl/Ik7r6haPbhLArajlSPat0Q8ltocjAURTzu35U41JCQB4IYG7I73ADKyQoFGID8BNE6lT3QTSZlGdfDQqr3tXGzFFjEu49H7ZGZEcWz2YbSaSXjB3PTP6ik34EAH4G6aRiV6vui8ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RT/3AVT0; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RT/3AVT0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744015478;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BxsyOJ1xzReb7dqRLf34SXfhgO/SwPIG7kI1XoYIq/U=;
	b=RT/3AVT0TVDl9dvu2MbB0201U/CHSEO4EDr9iNyFFqsPaisifv1cGvXYCBfo4Uis6crzxu
	nRdoBWREaoAKgkk9KJiEJ0MvN7Z1pcd00OGhr5+pkhIGk4K68tYqCINnlw8YTAQaUsgoy2
	2pglUdTqVBApgpu9McWjbkzV6MAI89Q=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-106-LPYCGfJONAuGZtziIlXcpQ-1; Mon, 07 Apr 2025 04:44:37 -0400
X-MC-Unique: LPYCGfJONAuGZtziIlXcpQ-1
X-Mimecast-MFC-AGG-ID: LPYCGfJONAuGZtziIlXcpQ_1744015476
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-39c30f26e31so2703480f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 01:44:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744015476; x=1744620276;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BxsyOJ1xzReb7dqRLf34SXfhgO/SwPIG7kI1XoYIq/U=;
        b=EOCG2kUGsIxIkPO5fy7actvRcXmqo11Im/qzhQYXg89+4MpS0KQHe6kSCmbC6OoCNe
         uPyQjtgLh+jV1uiH7sP7nUDFV82ZbzI3dtZKSkW7wNDOfYGqFYiesxnIn6NYTOeswIuJ
         yloM57dnCHqhg+UtFLLdCdeKne6yLYFoagjcWwflOUx38+6Q1oz+gR+h7hUeTu1rizza
         uF9Lddq76K7h3S2d/QCC5G4KyZsFsiFP1frymFP4fbnwFmxnoVqPSCHvWjigs/sUt3S1
         3c3SICWDR0DpAa46lURrrh1HkpimA9XyhKDXLWbhvbHopFuszQy2yHAYJxL0omWlUlyt
         EypA==
X-Forwarded-Encrypted: i=1; AJvYcCVg9fBcJ9YsuaHXTqUDKSJIdUiAbgJlWXC/96Tcud53Wix4b8yWT+6nx6No1aw1RQ8IibeCPw+P2nLwpQw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzj1sXEsdx3kVetCh7SMrzMDAxtVbQBgGzuRz1BgaDJ2E+NfDsS
	w9LFU6il7Rd5MPrUufp14s4LS7TBJkQZI7EsItVh+Vw0nZbfW5w8BXpfc6oi/vwU9J/3nR42xFS
	wR4BWdnaloC4rCCeTzg65OzMtQ+DRHsz5RmzFCYjfInPIbBEbhZupk4kypjBbSA==
X-Gm-Gg: ASbGncuoi1bp7OmEP9sGmhNkQ4EZYFzwLIYNktMLCPk3caQpgFxXJ8WmMxXH3AO8bOE
	btmibOTMmdDoXJDqq23sfstxOmLFskP0/jh1XpyIC6jm7DZvyYj5OH9UMnBUpP9T6Rmxid5l57/
	0rjh4fWVUOelReExT0pOq3Tpp6K2Nv2ITuvTzilzvujsKubLCWZxeqprD/3r6ruib26tM0QTGTO
	mrNMT8m71+A8QuPz4DPo/saqD5Xn+Q8SQT0S1QKCHW1oytE8m0pFbUpD6XMEZMIQwqfBs9OaUDj
	AQL1PUB2XQ==
X-Received: by 2002:a05:6000:2285:b0:391:3049:d58d with SMTP id ffacd0b85a97d-39cadc85ab6mr9887031f8f.0.1744015476160;
        Mon, 07 Apr 2025 01:44:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE5RHnKh0qDdKz/5Ine63hPlJA3HH3Ym3a+73u+PAR+VrXtWlXlmPf7sT0QkaNygBVDWFb9Aw==
X-Received: by 2002:a05:6000:2285:b0:391:3049:d58d with SMTP id ffacd0b85a97d-39cadc85ab6mr9886995f8f.0.1744015475774;
        Mon, 07 Apr 2025 01:44:35 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c30226be7sm11211086f8f.89.2025.04.07.01.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 01:44:35 -0700 (PDT)
Date: Mon, 7 Apr 2025 04:44:32 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: Halil Pasic <pasic@linux.ibm.com>, linux-kernel@vger.kernel.org,
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
Message-ID: <20250407044246-mutt-send-email-mst@kernel.org>
References: <4a33daa3-7415-411e-a491-07635e3cfdc4@redhat.com>
 <d54fbf56-b462-4eea-a86e-3a0defb6298b@redhat.com>
 <20250404153620.04d2df05.pasic@linux.ibm.com>
 <d6f5f854-1294-4afa-b02a-657713435435@redhat.com>
 <20250404160025.3ab56f60.pasic@linux.ibm.com>
 <6f548b8b-8c6e-4221-a5d5-8e7a9013f9c3@redhat.com>
 <20250404173910.6581706a.pasic@linux.ibm.com>
 <20250407034901-mutt-send-email-mst@kernel.org>
 <2b187710-329d-4d36-b2e7-158709ea60d6@redhat.com>
 <39a67ca9-966b-40c1-b080-95d8e2cde376@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <39a67ca9-966b-40c1-b080-95d8e2cde376@redhat.com>

Wow great job digging through all these hypervisors!

On Mon, Apr 07, 2025 at 10:38:59AM +0200, David Hildenbrand wrote:
> crossvm:
> https://github.com/google/crosvm/blob/main/devices/src/virtio/balloon.rs
> 
> -> Hard-codes queue numbers; does *not* offer/implement
>    VIRTIO_BALLOON_F_STATS_VQ but does offer VIRTIO_BALLOON_F_STATS_VQ
>    and VIRTIO_BALLOON_F_DEFLATE_ON_OOM.
> 
> -> Implements something that is not in the virtio-spec
> 
> const VIRTIO_BALLOON_F_WS_REPORTING: u32 = 8; // Working Set Reporting
> virtqueues
> 
> and
> 
> const WS_DATA_VQ: usize = 5;
> const WS_OP_VQ: usize = 6;
> 
> 
> IIUC, Linux inside cross-vm might actually be problematic? They would
> disagree on the virtqueue for free-page-reporting


That's why things must be tied to negotiated features, not to offered
ones.


> 
> Maybe I am missing something, it's a mess ...

Indeed. Let's fix the implementations while keeping work arounds for
existing ones.

-- 
MST

