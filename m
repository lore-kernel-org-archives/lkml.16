Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E362AD0B
	for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 15:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746977810; cv=none; b=llwbXB6dEQjOScX/v9rIA0YUkFfTD/u+KTY4meslTJjRfV//6MguZNzQsdZAbvDTRkW7aMAw6msdrFoZr8sEaqCTQpiyQDksOR08UDPacta4+b/QRyK3Ou1lRdyeFbRCNH75YtET6+HWficEqXMI6MB0+x4ifPwClAMUXQx5JG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746977810; c=relaxed/simple;
	bh=qGKacZFH6d9H7gZIy5574lz4sh3DAs6LJsxIoFdhtKg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rYkb2c+RsRKF4AbrSzQ3PnnAtVA5tRljQzl5GYPycg5fXnaN6XZ8ZUGArafBFvMWUFdN5XCPCl9GcbZHYQ0dJGmc86FW9gyout7vhY5tRiNzc0U2dd2PEaH/dtihqNXP4HQ9Xlf6HG7pvgmvVZ6xWxbmjPch4n+jMeBtKbbz0ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EY+AUvID; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EY+AUvID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746977806;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NpNCD9/isg8b1+k2LARZWva+SLP5Kbk/L5GpSCTXRlc=;
	b=EY+AUvIDuP1/ToUb7OyavWjda5NAOgkLGmckDM97zfVkKWKV0f+YO+6NTb3yG/g0kD0mYz
	z3rX36rFuWZM937ZTVuhO+pK1AurrHoHwooJRXdSn9BBPZb3K7hTxdF9ZbRekiSyYZhJ/O
	28//JAULF5PQZz0NgiElASPTtTrjvZE=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-2-x60tSm8SMJy6UrRS6RTsDQ-1; Sun, 11 May 2025 11:36:44 -0400
X-MC-Unique: x60tSm8SMJy6UrRS6RTsDQ-1
X-Mimecast-MFC-AGG-ID: x60tSm8SMJy6UrRS6RTsDQ_1746977800
Received: by mail-lj1-f199.google.com with SMTP id 38308e7fff4ca-326c70002d0so11045621fa.1
        for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 08:36:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746977799; x=1747582599;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NpNCD9/isg8b1+k2LARZWva+SLP5Kbk/L5GpSCTXRlc=;
        b=bwsoSGLiH35ztG/zDNcqWgHsmOpItonmzo2Jb8+2ffuQX46e7qbHNFjXMIwN79qUtW
         yic5NAG0qlFrhDnn8NaUKVQB842XwOumA8iTQa8/xCmZ/Lr2hY14gBCORF+tvLJZQPWB
         XaWB93OQOCvpCebWWhCLsnBKr55rBZp/rYwSL1TJ7cz91LOsK+RKtl1iwLt8gggBa9Pc
         IKEZtBx/xRLhsqna4Jl68UAWmD+QDc2iKekMo6zoXm/p1HdCoYhoUDgEhyBLVdnBNOQ0
         5QrERjHwAPdJbPDZ0Nbgv0xfCqKNG6P4Bhi0tR1OHjLUjKjZ5Zykk57NaZoG1WQFF1AZ
         FLvQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgGjQONjbnfnwRNuFc5lE1qgTpeJ7L9fgxYM0/fAVmaESgIwZWHtorJ4BHCWRKMb5L+SbLUIOgDeVL7Fg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSSHWjM8T5a8P9O3NepwMUvXr/EwTA4vsalbTUqFV1Qq9H9cLT
	u5mA3RgMqU1O7EJS6ooQUL0CV0C97mVbi9SInenochEcq1ymd5VOvH3IfNrbblraX2tVeDjtXBz
	T8wJKS/3RviJ2YNt8sdMVBs5wP/lJ09w1VyS/iH03kgMT7AKBrILQ0xmZVBtO2VtJUF0HEA==
X-Gm-Gg: ASbGncutAoImGcM/yY5BPPGlBv4JUGU5HXPsXUMxgaMISDdcXOZ864w5oFOp5GDE2YD
	kdiQl2XdipI/3nru8Z1/pLEbEPdJaA7wVNBgi9lftBWUB4jBdyclYsMk7YUmDJT7F0CfevJpsvK
	K5cFOPGc44Pgt5yH5zrH0/rGkorZh/1RNfcqSC5fdn/+16xADZlPpmxus3FwsJmDhSCulFSBsoK
	ENsrgHJjTklbrqtFiTRVMXFCOsQRjRy6zpjOQX6iy16Nc4KRg5HlAvYuDTxPX2KZ0C2qhIYgdj5
	x/ipxw==
X-Received: by 2002:a05:6000:22c5:b0:3a0:9de8:88ba with SMTP id ffacd0b85a97d-3a1f64acc20mr8427883f8f.53.1746977788261;
        Sun, 11 May 2025 08:36:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEaLhSnXG7WahQEWlAeW3ZdNW5sVr7QFEWtLXAW+865LoU/9TSABIPR1jvc6EOo3bowtzEPcw==
X-Received: by 2002:a05:6000:4006:b0:39e:cbe3:17c8 with SMTP id ffacd0b85a97d-3a1f6427a7emr7479643f8f.12.1746977777002;
        Sun, 11 May 2025 08:36:17 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58f28f7sm9439635f8f.41.2025.05.11.08.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 May 2025 08:36:16 -0700 (PDT)
Date: Sun, 11 May 2025 11:36:13 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: SamiUddinsami.md.ko@gmail.com
Cc: jasowang@redhat.com, xuanzhuo@linux.alibaba.com, eperezma@redhat.com,
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org,
	Sami Uddin <sami.md.ko@gmail.com>
Subject: Re: [PATCH v2] virtio: reject shm region if length is zero
Message-ID: <20250511113555-mutt-send-email-mst@kernel.org>
References: <20250511114428.2061-1-sami.md.ko@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250511114428.2061-1-sami.md.ko@gmail.com>

On Sun, May 11, 2025 at 09:14:28PM +0930, SamiUddinsami.md.ko@gmail.com wrote:
> From: Sami Uddin <sami.md.ko@gmail.com>
> 
> Prevent usage of shared memory regions where the length is zero,
> as such configurations are not valid and may lead to unexpected behavior.
> 
> Signed-off-by: Sami Uddin <sami.md.ko@gmail.com>
> ---
> v2:
> - Fixed coding style issue: added space after 'if' statement
> 
>  include/linux/virtio_config.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/include/linux/virtio_config.h b/include/linux/virtio_config.h
> index 169c7d367fac..b641b16d42ef 100644
> --- a/include/linux/virtio_config.h
> +++ b/include/linux/virtio_config.h
> @@ -329,6 +329,8 @@ static inline
>  bool virtio_get_shm_region(struct virtio_device *vdev,
>  			   struct virtio_shm_region *region, u8 id)
>  {
> +	if (region->len == 0)
> +		return false;

if (!region->len)

is more idiomatic

>  	if (!vdev->config->get_shm_region)
>  		return false;
>  	return vdev->config->get_shm_region(vdev, region, id);
> -- 
> 2.34.1

