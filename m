Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF611527B1
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 14:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744725661; cv=none; b=QUmb0jmvcWzAPslo1XOOPr3+MN5SpaBRfmfmJWRh7yHBsfGge9W2gE//0AN9wXmB68WOWjC5XJEHIP5iXfOKAY6LvYAo/Zy0HxKCkO2LqPbAyctoKvzPAbX3zX8HuR0qrBEfh99vTjK6mlNvFy+HVGdiJTsfBWQFO+Wb7YBNtwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744725661; c=relaxed/simple;
	bh=709X1rled5cZvOSoP5Fmp+UUPKulHgYpV7XIeh4A7YA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pLfyvqdwOvqc31p2ria9Ku34XhXzlaKW44VItgbLwzeEx40fq5fgr5N8asiw7hNalBj47nu0fdQ9qvasK4Rjxr4/iBTcKlHN8Fsl0GMwZyLZ2uK+n2Ch2P5EfXT3S2y1dzzSuOXEN3gc6tTH0SNbeUzi0nDUKXbdZbPtmCbYZJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=W3TJxSFB; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="W3TJxSFB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744725659;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=igmdI0kSDqZsvsPzw7Io9AH+cSfi52O12B3FfuJtqjg=;
	b=W3TJxSFBTAQ6W7mn58X2wNbI53jK6J6l6xLSqL9s2PilM9Pxhdzh6P4NMXPjJ0BGHO5fS1
	WAIknNU4tgapbg7KJ67CSArc+lFm/nqLaD4uA9pOo12JozeglARs91vq70IJiSi/4ZxJgT
	SR3YP0I/UWdrqTSbueK5cq/jsp7N0mo=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-157-taOsL_5xMTy0yjiinPePVQ-1; Tue, 15 Apr 2025 10:00:57 -0400
X-MC-Unique: taOsL_5xMTy0yjiinPePVQ-1
X-Mimecast-MFC-AGG-ID: taOsL_5xMTy0yjiinPePVQ_1744725656
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-39141ffa913so3230397f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 07:00:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744725656; x=1745330456;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=igmdI0kSDqZsvsPzw7Io9AH+cSfi52O12B3FfuJtqjg=;
        b=VVRl+S+9JdfRLWyzlyOCGO/8dUSu61QOd8UVC+8OEoWf2ZoUjIABxcLU+/P12PxfLr
         tmF0lbieHehMZ76iGN665esc5Jep9CcCupMdPWt+ynFIPsZu1eQd4g5dj+QSdFS6mjQt
         2k0GzJ/sei+T3W886oSBOXXdGKIam/9O8ACPIFo3Og12tUlOEcKBVq37aQ/iOODXCgxY
         kdJ7MZ6CF7D4SvniOmY5L9c00bJxMdvCToEccljpw+7NfybipDlv0JCOZK5IEiD5SL2e
         eLhroE0izv+KUOvAMP2FxPOO5Cx2vmJHYgncauCAXa6ujWul2TnNs7HQBj+c1ToJysYd
         IKcQ==
X-Gm-Message-State: AOJu0YwUIB2pSfjjKkEkxjS5R0sfQr3durKTSIqb54Te6i8kolr6fUAG
	T1AZ9loO5CeH4dq4YpK6Uqt1DtbTC2BZjUFDUfAkew0kMzP7A0QBrdYiwZmDVS/wYxP97JFxFMc
	LNBlsVnqBO8olz/mgTW0PxP/j7Bq5+mhIzalyOopV6yX3rferPorY8ejoaSSHAA==
X-Gm-Gg: ASbGncvybv6hHl7fZ9Jmqk3yYrKaSpm0/m3BmACAMXMINB1eJqyOJFNn6Un0/I2hgam
	mDMEL3UkYyRHV89csN853KnKjgOOsk68kBKlpE1zuDxc5IutInoSbxcfb5AgfsZH+Kd+FzsV1uq
	hH0qtdp8gugWSzOr0i+WfB1o9aIctO3sGnfFQFI3oq1f5XYXg2QQp845EE7wpgCIOR3630tj/sz
	/+5jaZs4Getpl7+gvO8eM0ahzr+AbUuRLfVe7WGbwl6fSCts5qHGxDwRQo8VtzC4Roxw6lJpXbV
	2w3Z6A==
X-Received: by 2002:a05:6000:2911:b0:391:1652:f0bf with SMTP id ffacd0b85a97d-39eaaea8c84mr12562737f8f.33.1744725654611;
        Tue, 15 Apr 2025 07:00:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGv6jlDturxPui6Vb2bbzQw+TvvK2bK5gTukcWi0U1ZLkB+XYbqUougrxO8tQDqdyASZrd5Fw==
X-Received: by 2002:a05:6000:2911:b0:391:1652:f0bf with SMTP id ffacd0b85a97d-39eaaea8c84mr12562649f8f.33.1744725653855;
        Tue, 15 Apr 2025 07:00:53 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f233c8219sm207637185e9.21.2025.04.15.07.00.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 07:00:52 -0700 (PDT)
Date: Tue, 15 Apr 2025 10:00:48 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: linux-kernel@vger.kernel.org, Eric Auger <eric.auger@redhat.com>,
	Eric Auger <eauger@redhat.com>,
	Jocelyn Falempe <jfalempe@redhat.com>,
	David Airlie <airlied@redhat.com>,
	Gurchetan Singh <gurchetansingh@chromium.org>,
	Chia-I Wu <olvaffe@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Simona Vetter <simona@ffwll.ch>, Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	dri-devel@lists.freedesktop.org, virtualization@lists.linux.dev
Subject: Re: [PATCH v2] virtgpu: don't reset on shutdown
Message-ID: <20250415095922-mutt-send-email-mst@kernel.org>
References: <8490dbeb6f79ed039e6c11d121002618972538a3.1744293540.git.mst@redhat.com>
 <ge6675q3ahypfncrwbiodtcjnoftuza6ele5fhre3jmdeifsez@yy53fbwoulgo>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ge6675q3ahypfncrwbiodtcjnoftuza6ele5fhre3jmdeifsez@yy53fbwoulgo>

On Tue, Apr 15, 2025 at 01:16:32PM +0200, Gerd Hoffmann wrote:
>   Hi,
> 
> > +static void virtio_gpu_shutdown(struct virtio_device *vdev)
> > +{
> > +	/*
> > +	 * drm does its own synchronization on shutdown.
> > +	 * Do nothing here, opt out of device reset.
> > +	 */
> 
> I think a call to 'drm_dev_unplug()' is what you need here.
> 
> take care,
>   Gerd

My patch reverts the behaviour back to what it was, so pls go
ahead and send a patch on top? I won't be able to explain
what it does and why it's needed.


-- 
MST

