Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8877A2356DC
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 10:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744801124; cv=none; b=isoyyzQT2O1oPIAwCJxCU9H3p2raK3BIPp1X4V7uVvP/G3+/Dlj1h9tGtfpXg2Twl9PEpN72L+WDLAD+VJZsyIwga1+vOiKXTEwaL3I7xMRs+ODXOvTRLtT9LuWc7IbAi02DzemFZK7z+hCOF43cVY9U0HQrOanJXXXsQhH8sy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744801124; c=relaxed/simple;
	bh=TxoU34tTKNLJHWpe0Teo7XOD7hIqzcz5Qg8UfQsB1oY=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=K5v1WcU8rKFoClO/Lhdayqv6ohUFfa7ATZZsBr9m69tgwzUjLWpXIh3343i/ZLHfx3MrxsNS2eodCi840pY5cForSh1LBaQ/Q1guAcaWTVhQPrBk3FDtoJ0Xk/EmEoi05NAAkz3Urj94o+jFaXCMtwJnZsWhWKKCIfjeFa+acnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=V9c7H2mu; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="V9c7H2mu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744801121;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=TxoU34tTKNLJHWpe0Teo7XOD7hIqzcz5Qg8UfQsB1oY=;
	b=V9c7H2muGPieXmk9OxJwZKzMewBC9YI/wXBip4R2eTZLoDZwc5OdsjGkQL7020mjugI9c1
	9GOzOtmc+7w0C9+lCCmVnwA6f0KTu7dRhCb1LL8jndlTcbuVve98BveXDoqrHe8shhYjWr
	lxBYb3H0nEj6N2tW1qJ3+SciEyZIFjQ=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-133-JhXxStJaPqetW5pILcXSvw-1; Wed, 16 Apr 2025 06:58:40 -0400
X-MC-Unique: JhXxStJaPqetW5pILcXSvw-1
X-Mimecast-MFC-AGG-ID: JhXxStJaPqetW5pILcXSvw_1744801119
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2ff6af1e264so9649911a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 03:58:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744801118; x=1745405918;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TxoU34tTKNLJHWpe0Teo7XOD7hIqzcz5Qg8UfQsB1oY=;
        b=quPWVbbGMSInbwcQGLZWEmkS2wnWJmtxsRKr6bBvuDlru1qIEt3COVaIujUXHGz75w
         6n74tygbUhq3PPszFDZlfD9h+0q74P82CCPPg5CtHKMEZC0ckMBK1EbSmEEkyPjfrkBz
         W0ogIdYdaBSBIE9gjqw1hH+OlYndcjdpa/xlrEKeiWHawYBcWh6s89BIFmprKMbSrNfg
         GMpICFsYC4m3rqugjTEu2/6on0HIrvjglezUDjPbpQRunuVE9p/ycMnIoKTrp1XCamNx
         7X9sGXlnuK8Uy0h5kT8M4W+vcPWei14xfsMQxioYlUBmsR+Q/YURA1Z8cHezXez5AkZf
         3IVA==
X-Gm-Message-State: AOJu0YzcEKARdxReZCEX0sKj+gxAYWn4k/Xkm/EFbW0bhv5+btcIootH
	fnZJuzBwshq6DwXlxpVWzghJEhBm+qddPepIYnXxkGdqFcFXECGj4L3oAYtKv7AtuqkSdyFuOqy
	ME3ZEE4otN9wyTNGb01fqYK7NttwE7zHpK6WAoSFAgX7UP/CJ7eeMVhrgDq1aOI7zH6Be+NM4O7
	VJLi3aDkoSoMuwcREnM4NmTA1/s1C80shpfYzSeo0GfppVwKA=
X-Gm-Gg: ASbGnctZLXc8MELVTx2Vac5IPBxdCNkQzRHIohrLrZCoOMXidlPXynNPboWumq8gDyh
	Vcbe8yYBoBUqpkrUa1UL3TdA6yVHSF0+f9+rAnmRHrFftjU1+iNjyfAISy41TtJ8i+KQ=
X-Received: by 2002:a17:90b:5448:b0:2ee:8427:4b02 with SMTP id 98e67ed59e1d1-30864166cb2mr1845374a91.28.1744801118157;
        Wed, 16 Apr 2025 03:58:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF9rTWjhP3mPR/Rk3R8+yNxA8g2aXGub+h03s6mUyJr3miZGYX/7P74QeCG1qWPoYWEKuNoNfw15PQLW+22ANc=
X-Received: by 2002:a17:90b:5448:b0:2ee:8427:4b02 with SMTP id
 98e67ed59e1d1-30864166cb2mr1845362a91.28.1744801117914; Wed, 16 Apr 2025
 03:58:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Wed, 16 Apr 2025 12:58:01 +0200
X-Gm-Features: ATxdqUHvNGtKzQpiTNEW2b7_QQkEt4Exq5YnQmrZAFT3EWOJFAPuauihsxqc8UA
Message-ID: <CAJaqyWfcY0Hi=B9rPAqAfkJoXBgf0jYm_dUXrRX=sZ4XRCxjOw@mail.gmail.com>
Subject: Merging CVQ handling for vdpa drivers
To: linux-kernel <linux-kernel@vger.kernel.org>, Maxime Coquelin <mcoqueli@redhat.com>, 
	Dragos Tatulea DE <dtatulea@nvidia.com>
Cc: Jason Wang <jasowang@redhat.com>, Michael Tsirkin <mst@redhat.com>, 
	Xie Yongji <xieyongji@bytedance.com>
Content-Type: text/plain; charset="UTF-8"

Hi!

At this moment mlx driver and vdpa_net_sim share some code that
handles the CVQ and are not very backend specific. In particular, they
share the vringh usage and the ASID code.

Now VDUSE could benefit from implementing part of the CVQ in the
kernel too. The most obvious example is to avoid the userspace device
being able to block the virtio-net driver by not responding to CVQ
commands, but all DRY principles apply here too.

I propose to abstract it in two steps:

1) Introduce vringh-based CVQ core

Let's call it "struct vringh_cvq". It manages CVQ, and sends to the
vdpa backend driver just the CVQ commands. No more buffers,
notifications, etc handling for the driver.

The backend driver can interact with this in many ways, like a
function to poll commands. But I think the best way is for the driver
to specify a struct of callbacks per command. This way vringh has its
own thread able to run these callbacks, so the backend driver does not
need to handle this thread too. If the driver does not specify a
particular callback, vringh_cvq returns error to the driver.

Just implementing this first step already has all the intended benefits.

2) Driver-specific CVQ callbacks

Move the vringh_cvq struct to the vdpa core (or to a new vdpa net
core?), and let the backend driver just register the callback ops.

This has less benefits compared with the first step, and it has more
effort comparatively. But it helps to move shared logic out of the
backend driver making it simpler.

Is this plan interesting to you? Does anybody have the time to work on
this? Comments are welcome :).

Thanks!

