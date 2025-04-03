Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9963198A11
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 05:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743659592; cv=none; b=T91X28HjbC/zsNzCw9Pw7+iN16EEf5TD54hkBCYfmB3I2iG4+jaR3I7jlB+g83A9KiDVtAJULaih+zp3+fTCL8Mi3/gOzvX0+pr/1GTQuO2gZCkzIQK8mc1ZxKQUM9TzV7wXxth/1hsC+htIoLVdM1H9nBwATh3eWeXQei5SoQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743659592; c=relaxed/simple;
	bh=4bS5onAMqnZXsH3MQL3fZNQzN/QQVysLsc6zj/UJdIQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MH4qbLCbzjNwTW60na6Vjtqu6SJB80Rmu3942hYZSTBMxDSOnw4R6JH966GPcOA+rAn0iniGxS5mKsopB194R475U+gd2HqfgjJ2bbFnZz0ewUMHWtEs6t3PJTZHf0tTNK72lIKyvEgHm7KLBcoZf+RIEaoRPfEp8PRrhM2kASA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=U5p7U2Xz; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="U5p7U2Xz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743659588;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W3jbd2doY1NSOX00VkbRurvkdLq9F5tN6tB0xPnD0Og=;
	b=U5p7U2XzKE/QDl8ZXuLr5dvZXS3Xh131BVbeK7JeAefhEMPfn0+AgXbsfJOMAI4/vcjn9p
	hAThUNzOEMsfF/PH3hB2Y3GFy+VfFHv4zdqnSJjqN65pGXtSQsLnW++Zk5UHkbs7FEUcd+
	qaQK1e8lrUTbzK6ytH8tAmSLuDeyixU=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-513-RLs-qN3tNfW296jZo-1W8g-1; Thu, 03 Apr 2025 01:53:07 -0400
X-MC-Unique: RLs-qN3tNfW296jZo-1W8g-1
X-Mimecast-MFC-AGG-ID: RLs-qN3tNfW296jZo-1W8g_1743659586
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-ac27f00a8a5so33647766b.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 22:53:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743659586; x=1744264386;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W3jbd2doY1NSOX00VkbRurvkdLq9F5tN6tB0xPnD0Og=;
        b=KJgpTeljFn2TFeVjzrbhmWSM14H8RfWRFCA0NMBtPc7sYNqYqJGDIwu9ZSjZkyrfvW
         zMTX+NlKo4sxFomycjjDoRoH/NIfNarMDjOHlOWtkTMSI0NhOMdBvlckb4ztUhTvswSf
         Eyxy9BG8/nLgw+vuuT+VpR3vl3x2WLjETGJkOgZVTxlowp0ZUFfSB9rih8dWo4IDZQYc
         6w7za6UBVh1J2eb4rdOmrkglmThy3utSN3IOAm/NzVjEzGtxt0TEqtSwaJ/mDaPL4zGT
         9DkiG6Ytj+pbl7vy1MR/ayuZXgb6Dm3KyIhAiMq7/OCB5SGRigMsf/pWpbMT1nmUTIxw
         Mx0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXT5ewXmqhB+8Wf6bh6jTc88OvJOo5aX9hPpHdypNnlDYychXUcR+RIgIgps4widKZiY/CCrJqVG6jFTHc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRKGCLY8CjxyfkcM9WNUtuTlUqiyx9i33MucVMb1RE9XzMTtIV
	qUT1C70EEP3Nh6rXSmzU9L+Lf2q0aIe6OZBJuEMEZ0Jcd3GGAzRPsfb0Kwf1dB/tLLtuwJ57XcJ
	/D7tDqscGMtHZKl3WbqalHmY7mBrEWUmGSFDZVyUcYlFwYuvR5qs27jtHOqJFgE0E2a6qSsoyon
	r4H2KhvM5zOVkeFr3TQN+/pKr2l79nSQE8ZWbs
X-Gm-Gg: ASbGncvrSFygg9BB9lKmszZouKjio+bD3beZaI4ymN1VQcROyV/sFu0tiyafsgGe3lZ
	Pv8e2ctWqbzZ3G00VHYXSsk/cc5Di69SKkhD+5HPjdM1VMHMhocY7jw4U8av3HVb78r2cB8nsKw
	==
X-Received: by 2002:a17:907:7daa:b0:ac7:322c:fd0c with SMTP id a640c23a62f3a-ac738be4bc5mr1287977866b.40.1743659586302;
        Wed, 02 Apr 2025 22:53:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+Z7xb5HzuAp3VvTBF4XJMRYjpTwnMri/J3XyJV/X24GWV812YboBMK2hckDCVRlWhGZcOzWwt5e0C8UfpFi8=
X-Received: by 2002:a17:907:7daa:b0:ac7:322c:fd0c with SMTP id
 a640c23a62f3a-ac738be4bc5mr1287975866b.40.1743659585908; Wed, 02 Apr 2025
 22:53:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250328100359.1306072-1-lulu@redhat.com> <20250328100359.1306072-2-lulu@redhat.com>
 <74u5ppfmuf4gwjup3eotpnd6bulocerdk4l54qvykfcnesf6hm@udabnuiw2v6y>
In-Reply-To: <74u5ppfmuf4gwjup3eotpnd6bulocerdk4l54qvykfcnesf6hm@udabnuiw2v6y>
From: Cindy Lu <lulu@redhat.com>
Date: Thu, 3 Apr 2025 13:52:29 +0800
X-Gm-Features: AQ5f1Jo1foH-PvZGrIRlU2VXTP0saZl6MC9BSYsmGgkgWtc7Py14P3qzqSSJo7E
Message-ID: <CACLfguW+k0BJQMMU7fRKqJtidA=+p=Ky555bhcZ0kdU8fJOhhQ@mail.gmail.com>
Subject: Re: [PATCH v8 1/8] vhost: Add a new parameter in vhost_dev to allow
 user select kthread
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: jasowang@redhat.com, mst@redhat.com, michael.christie@oracle.com, 
	linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 1, 2025 at 9:30=E2=80=AFPM Stefano Garzarella <sgarzare@redhat.=
com> wrote:
>
> On Fri, Mar 28, 2025 at 06:02:45PM +0800, Cindy Lu wrote:
> >The vhost now uses vhost_task and workers as a child of the owner thread=
.
> >While this aligns with containerization principles,it confuses some lega=
cy
>
> nit: missing space "principles,it"
>
> >userspace app, Therefore, we are reintroducing kthread API support.
>
> nit: "userspace app, Therefore" -> "userspace app. Therefore"
>
> >
> >Introduce a new parameter to enable users to choose between
> >kthread and task mode.
>
> I would explain that by default this is true, and so we are not changing
> the behavior with this patch.
>
Sure,I will change these
Thanks
Cindy
> >
> >Signed-off-by: Cindy Lu <lulu@redhat.com>
> >---
> > drivers/vhost/vhost.c | 1 +
> > drivers/vhost/vhost.h | 9 +++++++++
> > 2 files changed, 10 insertions(+)
>
> Anyway, the patch LGTM with or without the commit tweaks:
>
> Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
>
> >
> >diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
> >index 63612faeab72..250dc43f1786 100644
> >--- a/drivers/vhost/vhost.c
> >+++ b/drivers/vhost/vhost.c
> >@@ -552,6 +552,7 @@ void vhost_dev_init(struct vhost_dev *dev,
> >       dev->byte_weight =3D byte_weight;
> >       dev->use_worker =3D use_worker;
> >       dev->msg_handler =3D msg_handler;
> >+      dev->inherit_owner =3D true;
> >       init_waitqueue_head(&dev->wait);
> >       INIT_LIST_HEAD(&dev->read_list);
> >       INIT_LIST_HEAD(&dev->pending_list);
> >diff --git a/drivers/vhost/vhost.h b/drivers/vhost/vhost.h
> >index bb75a292d50c..19bb94922a0e 100644
> >--- a/drivers/vhost/vhost.h
> >+++ b/drivers/vhost/vhost.h
> >@@ -176,6 +176,15 @@ struct vhost_dev {
> >       int byte_weight;
> >       struct xarray worker_xa;
> >       bool use_worker;
> >+      /*
> >+       * If inherit_owner is true we use vhost_tasks to create
> >+       * the worker so all settings/limits like cgroups, NPROC,
> >+       * scheduler, etc are inherited from the owner. If false,
> >+       * we use kthreads and only attach to the same cgroups
> >+       * as the owner for compat with older kernels.
> >+       * here we use true as default value
> >+       */
> >+      bool inherit_owner;
> >       int (*msg_handler)(struct vhost_dev *dev, u32 asid,
> >                          struct vhost_iotlb_msg *msg);
> > };
> >--
> >2.45.0
> >
>

