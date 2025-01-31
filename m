Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE3DEED8;
	Fri, 31 Jan 2025 08:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738312851; cv=none; b=agkf/srZnGKPDxJnrh2/kAvdv5MpMz/HcCDx4JwG3JZwLvq3qlkhr6Y0/YOd1L61we4J2vaUQmLVEo6QTUqbsP5eyytGodzoZMhKCP2x53pL680pfjTQYeWJ8DCxCLblrvbKxqGXnltxUP8ZrVAULu00XnFcqqQ74NiXo5YHBf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738312851; c=relaxed/simple;
	bh=nOqr9hwPo8yt7LUEGZprvueIA1IFMhddBYLqtpUV2ns=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K00sf2nSN16Y060iz2CM5jPinqFvMb6bvK/cqga1QssxuijrEv2/gbRPCqYCXvlFSoGW8ysskqFsLP0zqqelgGX3KADtR/UMsXR06Y+HTu/DY5UMjh/1SobqMuo2Il/lzbMIY55kKGVUA2qi7m6TKmzlPlI23XYFxoai08lTJt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dRVNNjFb; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dRVNNjFb"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-385d7b4da2bso1431502f8f.1;
        Fri, 31 Jan 2025 00:40:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738312847; x=1738917647; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TW/Jk6AHRJuQHT82twXaYQqc4zjBEepsqdONtoOlsw4=;
        b=dRVNNjFbqSTkxp0Ze243OLABB6krlk4Yy1PRi6FrY0ssNzygrmJW/vQzWchUGeyqgM
         mbnDWv5gimkDazbfW8hhauVj5Jy+YjTdtbJNwqlkmNbjCmshiuyzdD72ZVulJ7jQutV6
         PU6hQynKJe3cjmwmb/PEkvguxCJUP2W2iE7d6e8IiJXbXT/AfzIwZDo4+OJL8qyPx5BD
         WZQusciplBVKhx92N8W/OlBj2n8T21sc/+mOstJ4xbW5E/+UIl13fRR8bp8zzZ+dSnXg
         piBZW/+SXbz0GcoZABEljh91ReJICjV/Ok7PYiDF0DsUv4uJ1AqKMzu9s/c3VwWPBxFl
         iL2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738312847; x=1738917647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TW/Jk6AHRJuQHT82twXaYQqc4zjBEepsqdONtoOlsw4=;
        b=Uwgqcfh8HmpEQTHybk/7XMxWpMkYwo2PKKKSgSZfTR5Avvzqv8FjwYpGVAhmYn4+k+
         6zlgCRDVzafkYkOIzmLRyfnqsBd9lGPtaJNgKSjucbMPUSD3ScKGwlNxTQzCVgAodr7f
         cQbjTKUPFV85ZRy0MAGSWk6nRuisjOMn20h3bAjQoYkGxrERTH5m3jQHAnLmMo3cO3Nh
         hDreAXuC9chG+b6CT28GDfc+sJLHkLYAq4JLyuWQdVFqWSduOd+ErI0Cw6JCikHFl/Wn
         ckAUYfUf6IBGz3TSPMdHfrh0iVJ37sarRV4Gd6r1Fquv0Jx4+m0DI9joYuTpNQ4tOU1F
         h3Zw==
X-Forwarded-Encrypted: i=1; AJvYcCW2ozir8+NMG+Zhc8Ora/pyC9FEwhw9+xRNrrF2unzNvVMJ0rC3iq+Jze+5/10mtussbNARnJXN3tQ8MBne@vger.kernel.org, AJvYcCXC4mQbAVwjWTw1cSkGKV03nkbrojCD1pC7lHJVUCRe8nr80vVUi0KfwD5/OI+IHnIiri/ciO80lsY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXaEH3KefN0g3LB8VRSVPuKFceFqRIOc50KE1SvQIqK73uEfTw
	F2sm1y7/ELGVijKvMZHJKOtcRlzTbNc//BBmV/+ghKszUpNId/id
X-Gm-Gg: ASbGncuQzu5bcf7S5IaiMwl5/OtIpjJcq8mLP8IhiWY0E2e2B3FfrJmbPzA3w5RmIo+
	q2Hsw7+PyCHFO9o7bCGbD0zvPz6qnPXGE9HULXptmTmHvMao/wji+6hDDnzqzvVPq+7WQoGxR4T
	6n0andzx8pCFTiI1t257J/79E7V56o/e0MlJvbsaH4fVa6ilElnFSrv0bCneyIdZ9je7WfxhSvn
	AH57zcgDJCF0/JVe2giAibnc9IqixCbzMeWML3r4xN6cxNI9HJ0NYY79kqBMO+GvG35sR6UfW/u
	27apReCYwsDAwnBt
X-Google-Smtp-Source: AGHT+IGLZ7dclEPxy7l0oMnBB+13a8iscVbSdcuAWf67ZXDM9KAY5KRxxtRghjO34bfzpqVLfXp54A==
X-Received: by 2002:a5d:6d88:0:b0:38a:418e:1179 with SMTP id ffacd0b85a97d-38c519380afmr10198224f8f.2.1738312847155;
        Fri, 31 Jan 2025 00:40:47 -0800 (PST)
Received: from fedora.. ([94.73.37.161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c102ac9sm3990757f8f.29.2025.01.31.00.40.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 00:40:46 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: airlied@gmail.com,
	arthurgrillo@riseup.net,
	corbet@lwn.net,
	dri-devel@lists.freedesktop.org,
	hamohammed.sa@gmail.com,
	jeremie.dautheribes@bootlin.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	maarten.lankhorst@linux.intel.com,
	mairacanal@riseup.net,
	marcheu@google.com,
	melissa.srw@gmail.com,
	miquel.raynal@bootlin.com,
	mripard@kernel.org,
	nicolejadeyee@google.com,
	pekka.paalanen@haloniitty.fi,
	rdunlap@infradead.org,
	rodrigosiqueiramelo@gmail.com,
	seanpaul@google.com,
	simona.vetter@ffwll.ch,
	simona@ffwll.ch,
	thomas.petazzoni@bootlin.com,
	tzimmermann@suse.de
Subject: [PATCH v16 3/7] drm/vkms: Drop YUV formats TODO
Date: Fri, 31 Jan 2025 09:40:45 +0100
Message-ID: <20250131084045.2874-1-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250121-yuv-v16-3-a61f95a99432@bootlin.com>
References: <20250121-yuv-v16-3-a61f95a99432@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Louis,

Thanks a lot for the patches.

I'm not well versed in YUV color formats, so I did my best reading the kernel
documentation before reviewing this series... But I'll most likely ask some
basic/dump questions.

> From: Arthur Grillo <arthurgrillo@riseup.net>
> 
> VKMS has support for YUV formats now. Remove the task from the TODO
> list.
> 
> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  Documentation/gpu/vkms.rst | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
> index ba04ac7c2167a9d484c54c69a09a2fb8f2d9c0aa..13b866c3617cd44043406252d3caa912c931772f 100644
> --- a/Documentation/gpu/vkms.rst
> +++ b/Documentation/gpu/vkms.rst
> @@ -122,8 +122,7 @@ There's lots of plane features we could add support for:
>  
>  - Scaling.
>  
> -- Additional buffer formats, especially YUV formats for video like NV12.
> -  Low/high bpp RGB formats would also be interesting.
> +- Additional buffer formats. Low/high bpp RGB formats would be interesting.

I see that you implemented support for 6 DRM_FORMAT_NV* formats, but
DRM_FORMAT_NV15, DRM_FORMAT_NV20 and DRM_FORMAT_NV30 are not implemented.

The same applies to DRM_FORMAT_Y210 or DRM_FORMAT_YUV410 among others.

Could it be useful to implement all of them in the future? If so, should we add
it to the ToDo list?
It might be a great task to get started in kernel development, as there are
already similar examples and tests.

>  
>  - Async updates (currently only possible on cursor plane using the legacy
>    cursor api).
> 
