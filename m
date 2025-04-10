Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C20284B51
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 13:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744290877; cv=none; b=WIFhi0VTRhDFXmboeLGj+TBcM2j8mMYsvaSSEMHQaL8TQVGxJ2SynQJZ8/lQuKThdiaXr78ymG8wdltU8f0svhvyjlj47FDtKr1wlLJYPni3fIlPy6issyCDgxzAJyVdnGrU4FQlMjTJhIkF6XFlOs1gTUw2NOWQh7Pfdkd+jYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744290877; c=relaxed/simple;
	bh=BcmKMDnLPpAVp3vzSciPmvFfbhWnoxQlSPB9efG3ZPs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U6N5zPo1/6uwZIgdsKAOg1GBM9Si+NEoFVw0RmcnqhnwmmFNMPi2jwotaxJJKZMGDTttZURXagn2z7QWjE+DYG9KrEC0CPg4AnuVf1QIUi45S7xAfnIt8oCR2iODvaNZ3YoL/L7YREzDjKYzaMNzjBk80L0l0mJ2EtQAlcmfIAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=a6ioDff5; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="a6ioDff5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744290874;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5CWh61VoBeWDkhfINVEgBQUPREI3OeT7vB60AjBLh4k=;
	b=a6ioDff5p4pJ0jNuu8AEUWBsdjKDw3dn9/4up6+cCx/nBCHw0K48EYWD0oMdV3koStCEy1
	JBYHJ67yxRwW8+xOkXPN3jL1IYJXwmYfWCQ2tiK84Ter8Biroov/PlZreiA0fFxqzMMXd5
	/J7qhcUWYjwpC92f6DIVk2jXfaMaXTU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-342-dS9iMp4FMTezSoe9p9b8bA-1; Thu, 10 Apr 2025 09:14:33 -0400
X-MC-Unique: dS9iMp4FMTezSoe9p9b8bA-1
X-Mimecast-MFC-AGG-ID: dS9iMp4FMTezSoe9p9b8bA_1744290872
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43eea5a5d80so4563065e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 06:14:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744290872; x=1744895672;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5CWh61VoBeWDkhfINVEgBQUPREI3OeT7vB60AjBLh4k=;
        b=D0QzLx9nOs1D1m24gC6JhYcFCkO3JZ25CYFRbbYXjKedt00Qyep4/tpWpZe6GMumZy
         t1EnLFF1NCzBDRqCF2NRbbDHwaPIfmnbHmWaNgT2qkxyNBfs5D26Wx0+6YlY0VdvCTPR
         SOLOAVU+QE0BtMxY8GJySD9zx8tLZOg6XUR8E0KCzwOdZr7aXiLtWcEUFyQJs2zN87P9
         LpPNCP13H+k99I4F2A2qivFwpXl+BFugYyQe9Ww8Z8/z9mcHyahXnGUzLqHHtS5MkGVy
         ucTPkKMoASREvr8uz5gVQZ2uHvnK5rDAcDQnemzCoX0yr8g2jRyOGtBIj0bmlkeb5z2v
         SPxA==
X-Gm-Message-State: AOJu0YwvhuPcDHcI9uT3+kl11EqFw8SniGKuKEvEFscKfWTVZ2MrqE2r
	B2JNuBSxdHB0nTFtRs9tWPAnq3JTbH4B8L4ohRw/lrS7nU/rp7jn/BgheTTS1pVePt/vKq4iJ68
	7gLBb/4BV6YWj4WzUB8Ayl5fsaZbOuNOwkdDXGgpV5HOUMSizXEgksWs3SKXZ1v3vEZ6u7g==
X-Gm-Gg: ASbGncvXL0D2esrml/ofWhMWEtpObgEi7Wx5d4XN4+nXK2g1BMDZCa8F+7i74r9tuva
	5A5PzhhckurFy/8eiMMxYcKLjGMIMvPnvdS02TvvEauT5Ky1B/di+AKWKI58NBm4fdN3NyO14Kj
	6iiS0LgEggeMcSyGXBzkHJAlbXxLsiQ+xqTEg5Pe/CIpm2WxDOO5iNiWWzM2WzNkbM/mz8vrE0N
	kxhjd0k7fk0ayJ2twjOpMGaNC7O9EIsMEUNOx51wL7iC8rPb55jhagANkOUyeIMmy+ivUm5E2f5
	Uo6DoQ==
X-Received: by 2002:a05:600c:674a:b0:43c:eeee:b70a with SMTP id 5b1f17b1804b1-43f2d97bc34mr26435685e9.22.1744290871754;
        Thu, 10 Apr 2025 06:14:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEV4Lyb/tgfnVcyyFGflhKQfwEnIUsEBhqCrwWvjfkvUDgCHowyRpN3WF1pM6qN8aW55vrjDw==
X-Received: by 2002:a05:600c:674a:b0:43c:eeee:b70a with SMTP id 5b1f17b1804b1-43f2d97bc34mr26435315e9.22.1744290871261;
        Thu, 10 Apr 2025 06:14:31 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f207aeaccsm53922205e9.33.2025.04.10.06.14.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 06:14:30 -0700 (PDT)
Date: Thu, 10 Apr 2025 09:14:27 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jocelyn Falempe <jfalempe@redhat.com>
Cc: linux-kernel@vger.kernel.org, David Airlie <airlied@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Gurchetan Singh <gurchetansingh@chromium.org>,
	Chia-I Wu <olvaffe@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Simona Vetter <simona@ffwll.ch>, Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	dri-devel@lists.freedesktop.org, virtualization@lists.linux.dev,
	Eric Auger <eauger@redhat.com>
Subject: Re: [PATCH RFC] virtgpu: don't reset on shutdown
Message-ID: <20250410090619-mutt-send-email-mst@kernel.org>
References: <0d24e539766c9220b2380839472d1dc8739b5322.1744268995.git.mst@redhat.com>
 <07b30329-b4f0-4655-87fb-3ac52f9c64ff@redhat.com>
 <20250410084651-mutt-send-email-mst@kernel.org>
 <f1f3cfb2-86c4-42f9-b540-6feff196d426@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f1f3cfb2-86c4-42f9-b540-6feff196d426@redhat.com>

On Thu, Apr 10, 2025 at 02:51:47PM +0200, Jocelyn Falempe wrote:
> > > So it looks like the shutdown is called in the middle of console drawing, so
> > > either wait for it to finish, or let drm handle the shutdown, like your
> > > patch does.

The cleanest approach is actually just fixing surprise removal
of virtio-gpu. Because that's the path the generic shotdown takes -
pretends the device is gone.  I don't feel confident enough to work
on this, though.
Gerd, what's your take on it? Have some cycles to fix it properly?
Now? Eventually? Ack my hack for now?

-- 
MST

