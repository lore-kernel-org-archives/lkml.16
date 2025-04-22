Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AA3A22ACE3
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 09:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745313162; cv=none; b=FtzFU1CUTCekLF3PVcub6+308NOA3MtvtCdsd81sfpidT3G4zrRu8gTECEzaWGu/KMJrIBSXF2+oAp2Uk6OOyDOpzYmYO1Ko81s0UaFvGD+r994GIz4S+cT+NxNPsJhmdg7UNxAVwZBT/jWOv07mcK+idbLOMaYOxTiQ52/ddXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745313162; c=relaxed/simple;
	bh=zA34jL7vFyl2zOYsZFNfzulv4zQICPA6LcSEUuoLWGU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G8y2y86CfjV3wP65/FwloYapiTUeTbLgs52H7UXoecxV8/4qZqg6xa0mV5xVNIT8lDX7wJqjiZkPSb+aAMZzVpeLH9wL041g0jkpti6baAger17KuyIU3XOxgRuEAp4Io/QMSxs4q4HbzsaNxcMAjRkJCpRA2ChqCPHqvAYAgFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PzlQRCXY; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PzlQRCXY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745313159;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zA34jL7vFyl2zOYsZFNfzulv4zQICPA6LcSEUuoLWGU=;
	b=PzlQRCXYqQHym/1PjZzBoKVQ9TZSLE2p4PyVBH1ItMAm0o885RyfC6BwV+65zApxfc9KyN
	5/T7Rk4V7H9/pSTt5D+3nymvbrKdS3cSbHWLGFX1nGXH7fAejB0mdsBVkvjhOgiYjV5r9Y
	svVmHNzLAyaOqRPgs8axasEbhxOQxQo=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-304-JRYnuFvgMma8kb6UeC7ceA-1; Tue, 22 Apr 2025 05:12:37 -0400
X-MC-Unique: JRYnuFvgMma8kb6UeC7ceA-1
X-Mimecast-MFC-AGG-ID: JRYnuFvgMma8kb6UeC7ceA_1745313157
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-309c6e43a9aso2300798a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 02:12:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745313156; x=1745917956;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zA34jL7vFyl2zOYsZFNfzulv4zQICPA6LcSEUuoLWGU=;
        b=ASkRP2s4pnsbHTj+RCY0YKm9C9OJhljil4qa5kxf2qJ6ePbbRABn6WDG7XHMRrX3aS
         ZiQqqRQb0cnxvU7RUlSwBOSoqMA++dJRQV2WurZHI/WK/WRPQwEQkbYm2LhxzKIOhldJ
         W7ssQAhrso5dbekYELrQh//f4TkuHhIAdCAwogKMnhVpUdvNZbeNkPn1nYseXlFHK7/g
         Khyg3bto1DbxTnvkZkdMQxkQCz6yiN7ZzGWVQPPG8/paYL/uojkJ1ty9iG+xZava82Jh
         hffpZ1ZlZLHUyO3M+WbAReyXyVIEOVsV1DQ2FLxb3KXWjiPRA8/V019/r/CAOrywjNSt
         jsCQ==
X-Gm-Message-State: AOJu0YxKKUVaspSlJTXvLwmteXDHXUV3LC5tq0NQ9NiNeN69iCR3MEbG
	Kx6QsBsGSE9X+9Dx7Z/+Dxed/Xxesx7fWLuGDPJ/IpRM9aHHFt441W21qo9kv3DKXo9expk68e3
	koRJJz7xiBrgCPnHa/nruE0FliWSdeyojh9TATe8vuG+CqYz7JNJIivu7RwYHCEmSE/L/7U19T7
	jpWPmDJsP8mvawLIShixKMpZAM/LsNNoZLKfs0
X-Gm-Gg: ASbGnctL3KVcX+27Mtj/DbeAG5W4o33R9KUjbliaDO7lJDWx7qXwLd4JaBTcdJja9Qu
	75meYxREokrv/tMQdNrxgoa6zUAoXGkUrQJ7ePoLE00gZjnufe1zI+jUlvHnJqqlLKi4=
X-Received: by 2002:a17:90a:c105:b0:2ee:9e06:7db0 with SMTP id 98e67ed59e1d1-3087bb5708bmr22803332a91.11.1745313156610;
        Tue, 22 Apr 2025 02:12:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHmFyXRnQz9RO/mHWbk7s2cKRhqANS/cQ1plzUnn9+JwuMYCJ9qXRmKH3V1BqKujIVZ//EDQm5UO/1jGkfHgVo=
X-Received: by 2002:a17:90a:c105:b0:2ee:9e06:7db0 with SMTP id
 98e67ed59e1d1-3087bb5708bmr22803312a91.11.1745313156316; Tue, 22 Apr 2025
 02:12:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAJaqyWfcY0Hi=B9rPAqAfkJoXBgf0jYm_dUXrRX=sZ4XRCxjOw@mail.gmail.com>
 <shmvjznci4e7m3oeqzqrhmvsljzatafwpnauyyrlpv4xcntljo@w4ip2b3m34w4>
In-Reply-To: <shmvjznci4e7m3oeqzqrhmvsljzatafwpnauyyrlpv4xcntljo@w4ip2b3m34w4>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Tue, 22 Apr 2025 11:11:59 +0200
X-Gm-Features: ATxdqUGbklM2ksjl-txrIV_R23OlQit5nT7PdK09WTmge7TcOQW_jox7abFi9s8
Message-ID: <CAJaqyWciYsRk2kKc=A51yD49HRH_r3ruscDDVhwwUdAVZU71rA@mail.gmail.com>
Subject: Re: Merging CVQ handling for vdpa drivers
To: Dragos Tatulea <dtatulea@nvidia.com>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, Maxime Coquelin <mcoqueli@redhat.com>, 
	Jason Wang <jasowang@redhat.com>, Michael Tsirkin <mst@redhat.com>, 
	Xie Yongji <xieyongji@bytedance.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 17, 2025 at 2:36=E2=80=AFPM Dragos Tatulea <dtatulea@nvidia.com=
> wrote:
>
> Hi Eugenio,
>
> On Wed, Apr 16, 2025 at 12:58:01PM +0200, Eugenio Perez Martin wrote:
> > Hi!
> >
> > At this moment mlx driver and vdpa_net_sim share some code that
> > handles the CVQ and are not very backend specific. In particular, they
> > share the vringh usage and the ASID code.
> >
> > Now VDUSE could benefit from implementing part of the CVQ in the
> > kernel too. The most obvious example is to avoid the userspace device
> > being able to block the virtio-net driver by not responding to CVQ
> > commands, but all DRY principles apply here too.
> >
> > I propose to abstract it in two steps:
> >
> > 1) Introduce vringh-based CVQ core
> >
> > Let's call it "struct vringh_cvq". It manages CVQ, and sends to the
> > vdpa backend driver just the CVQ commands. No more buffers,
> > notifications, etc handling for the driver.
> >
> > The backend driver can interact with this in many ways, like a
> > function to poll commands.
> I would like to quickly explore this direction as well: how would
> polling work actually here? The entrypoint would still need to be the
> .kick_vq op, right?
>

Right, at least in this first iteration.

> > But I think the best way is for the driver
> > to specify a struct of callbacks per command. This way vringh has its
> > own thread able to run these callbacks, so the backend driver does not
> > need to handle this thread too. If the driver does not specify a
> > particular callback, vringh_cvq returns error to the driver.
> >
> So does this mean that the driver doesn't need to create its own work
> queue anymore? It would only need to implement the handlers? This sounds
> good.
>

Yes, all the CVQ workqueue can be moved to this vringh_cvq.

> How would the .kick_vq happen for the cvq? Would the backend call the
> into this new CVQ mechanism which would read the commands and dispatch
> them to the callbacks? Or is this also abstracted away from the backend?
>

I guess it would be hard to avoid the conditional if
(is_ctrl_vq_idx(mvdev, idx)) in mlx5_vdpa_kick_vq for a first
iteration. But my idea for a second stage is to move all of that to
drivers/vdpa/vdpa.c, a new drivers/vdpa/vdpa_net.c, or similar.

> > Just implementing this first step already has all the intended benefits=
.
> >
> Could you explain a bit more how ASID handling would happen?

Maybe ASID handling needs to be delayed until the second stage.

All the current net devices handle ASID the same way: By having an
array of iova trees, and checking how each vq group translates to each
ASID. As long as the backend driver reports the number of vqs with
.get_vq_num_max, the frontend knows what is the cvq, how to respond to
.get_vq_group, etc etc.

For all the core vdpa new code, the backend device only has one ASID.
But it would be easy to add devices with many ASID, just make the vdpa
frontend code add one ASID extra and forward the request to the device
if it does not belong to the last ASID / queue / vq group etc.

> It is easy
> to imagine how the CVQ commands would be handled in the callback based
> API.
>
> > 2) Driver-specific CVQ callbacks
> >
> > Move the vringh_cvq struct to the vdpa core (or to a new vdpa net
> > core?), and let the backend driver just register the callback ops.
> >
> > This has less benefits compared with the first step, and it has more
> > effort comparatively. But it helps to move shared logic out of the
> > backend driver making it simpler.
> >
> > Is this plan interesting to you? Does anybody have the time to work on
> > this? Comments are welcome :).
> >
> Interesting: yes. I could help with the callback implementation for mlx5.
>

That would be great, thanks! :).

