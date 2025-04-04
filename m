Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA721624C9
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 14:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743778361; cv=none; b=q5NvIwAdT8vtr+oKd1mIBJBGeuh+qxZwfkhxEg5V5RxsTdg/zub+8bSgg6dfhVsWwlLBWCabS2WbwcMPCYyA31/3PsErqw8ZcRiAi6HQjGaByq+8zTwAmgN6pIwk0bdGFQLd3L44eL3lMvjdpelMNYULD646SN1dscDxxIl641o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743778361; c=relaxed/simple;
	bh=HQEwVFo23Mr3erq7OYuxzmfb7ImgX/7WpQUlZtxKNVw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fyD/rKXlEVHaiy+r/CKhqwCpAFGtSo+WtgzVQF71N4IHCMPR3hNKgcMiImJqYk1D1+KMTigH+79PUo7zfbQHkU866/8+L1FJuSReVWiuLsrHQ7fy6ar6xXACHRU5Ve/n/6X6bTKDDapKEmk5+mEYAck7pzcZx0XRiobZPIK2ovI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=AK5dZbe5; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="AK5dZbe5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1743778357;
	bh=HQEwVFo23Mr3erq7OYuxzmfb7ImgX/7WpQUlZtxKNVw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=AK5dZbe5u1Q8thHivk2etDFByqBQib3ESC+QWMrdfiTL8JOQz527MQUAa4mO8RlPR
	 e9mHhS4X6Rpk2yMAONLbgRdUMPeY6/ECC6mu6tDzyDSquI8DVUW/zaoITnBBQQso1M
	 xRaUgreQgne87px2bCaUEgdhr3iWNWd6sCdMnkDb89twFURpogR1aHPggVOqQ2x7SW
	 lJUfpBLxujR6NsosDOh9c7d0K5shN/3NspDRkmHZantnMfIluOYaFQolJFNOg3waDR
	 qg08P3rtOxfBjA+HNsrT18riIHeW3GpH37mWFnDuCBneJRjUP0qEmM2ygT/bi+EaUw
	 4RRnoMre1bt0Q==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2E25117E0B0B;
	Fri,  4 Apr 2025 16:52:37 +0200 (CEST)
Date: Fri, 4 Apr 2025 16:52:33 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>, Gerd Hoffmann
 <kraxel@redhat.com>, Qiang Yu <yuq825@gmail.com>, Steven Price
 <steven.price@arm.com>, Frank Binns <frank.binns@imgtec.com>, Matt Coster
 <matt.coster@imgtec.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCH v20 09/10] drm/shmem-helper: Switch
 drm_gem_shmem_vmap/vunmap to use pin/unpin
Message-ID: <20250404165233.139814ee@collabora.com>
In-Reply-To: <29cfb98b-fe27-4243-abe4-ce66aa504573@suse.de>
References: <20250322212608.40511-1-dmitry.osipenko@collabora.com>
	<20250322212608.40511-10-dmitry.osipenko@collabora.com>
	<ea4f4059-7748-4bfd-9205-8e95222144da@suse.de>
	<710cdbd4-2c6e-48b7-b12b-972ab6d12abf@collabora.com>
	<20250402152102.01d9cfee@collabora.com>
	<a8ed4b8b-5116-4ac2-bfce-21b2751f7377@suse.de>
	<20250403105053.788b0f6e@collabora.com>
	<29cfb98b-fe27-4243-abe4-ce66aa504573@suse.de>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 4 Apr 2025 10:01:50 +0200
Thomas Zimmermann <tzimmermann@suse.de> wrote:

> >> In your case, vmap an pin both intent to hold the shmem pages in memory.
> >> They might be build on top of the same implementation, but one should
> >> not be implemented with the other because of their different meanings.  
> > But that's not what we do, is it? Sure, in drm_gem_shmem_vmap_locked(),
> > we call drm_gem_shmem_pin_locked(), but that's an internal function to
> > make sure the pages are allocated and stay around until
> > drm_gem_shmem_vunmap_locked() is called.
> >
> > I guess we could rename pin_count into hard_refcount or
> > page_residency_count or xxx_count, and change the pin/unpin_locked()
> > function names accordingly, but that's just a naming detail, it doesn't
> > force you to call drm_gem_pin() to vmap() your GEM, it's something we
> > do internally.  
> 
> Such a rename would be much appreciated. page_residency_count seems 
> appropriate.

On a second thought, I think I prefer
'unevictable_count/inc_unevictable()/dec_unevictable()'. But looking at
the gem-vram changes you just posted, it looks like gem-shmem is not the
only one to use the term 'pin' for this page pinning thing, so if we go
and plan for a rename, I'd rather make it DRM-wide than gem-shmem being
the outlier yet again :-).
