Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA1FE226548
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 21:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744060227; cv=none; b=BE8dJ78AP29Kv/kWCLgPtB8i3No8Wu9UNdKAn0QA/BS9NRWeqlUWBswkz4mlwy5uZzQum+KxGy0bf7r8b1wkgs+fOb2nsoU76cnDqgJGPB+e8wYNEiZRRRozozOkFyeY+7mKyv6C++/Np9rVzIZH+Cjm2QSz+DtOKpLVAI24vvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744060227; c=relaxed/simple;
	bh=Cs3JRT0u4iOUCEOdJXAbObwY/0a42FVTlXSMgmPRyko=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KL4jjN9dAYkvWjvM/7/TxSm1ldxsVhRZq6s4bXmGCfc7XnFLbG2mAz13Q5q50AlQvGHjzz9ebXk1G4vG7zwBxj1a8eQykGcHfHZyg3m/9tA0PzBoynbpwlL2n3QmRNoa6SNPbbJGNBKPF3TSXAPpqdlktp6ri4VYM9F5SVvUueg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SHhmdzaQ; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SHhmdzaQ"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3054e2d13a7so902378a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 14:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1744060225; x=1744665025; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cs3JRT0u4iOUCEOdJXAbObwY/0a42FVTlXSMgmPRyko=;
        b=SHhmdzaQ0SnbKZzDA4+KG9aoc7VcEEEfr9NP0dlit2xmv2vsj3Z/cRjeLtQy0lcNSZ
         7ObFCCxtGhDQn7kZSURYNBIHCn4F9n9ClP8pb5SLLhB4ShZ6s4KpJoxoTI2bI6KZpo2Q
         Mba1RN4thkC923zt9/+PirTx196cHB51paKIs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744060225; x=1744665025;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cs3JRT0u4iOUCEOdJXAbObwY/0a42FVTlXSMgmPRyko=;
        b=sVGQmk/Zo+QnRcExxJCxtu44P2DNb2YrWPwr/yvQsBQrlMLgMDIw+UlzZ9m9dRUjw9
         /GtFwW2j9NbB98fa67E2+rN2uPozXv/zNVAaA5BnTywjDg9DLFAeFX3SaDv8Q48SLO6T
         iKr6zMfBMMFhPXUWDLT7d07xk6M5mFME/KyJeNEk2+r7pUJlTZv1wEAzMsDoO5yAwMor
         6ToSgZTD3M+dZhbdKZDRnsMjKlz+L1B9i8DGN8WY3eXKUbx0kvrRYqm/LSNGhHre3R18
         68fwlw0o3EBDoJiyBH+KLAPPkKBCRfkt2d4rszQN7tv55U+UD8l2PSXknCJvyoqJr/zs
         JKjQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/Zh6dtxKckiZumW+4h9QoXMj6SM7ZtkqtMa3PmJox6o7uDyG8PFMxHXOlBa8ieYDsC0DCHDUuBOgm4rM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzIuKSj1A/APA11l2DhbemNtPE3nFipBRgp9btiOF7Un8H+l6l
	HZH1NyExMCC2hJ4pEv2SRwVXS9xc6GXw0loX4Q41T+AHKkuuAbjpyVpzqhtWU38YcuUwvTjMRjv
	4Sg==
X-Gm-Gg: ASbGncvYWBSWAjkn7Y3Qe3O5EYfDk64jqcQlrVlFKJg3UXwLuXTWI6n1L2Im31v9Azb
	YJQJmxeO506vb19FVXqyCfM4r/aSGo4/vg379BgilieBWz4/EUjbse4ScNO4HakT+Gx+tGTtG9p
	bBaMwGWZN8g2wKL/UCVXof9lbkAjatFMSLa722YgOpQFXKFNbuidGjOGopt+Fl4hoYIdhUtKYtY
	cVwRvJr622iev1QlLXzNIqWA5Kxiki2n8H6Wytcc1A1BawHkAUgrn4IYwZ/pAfmt78C7cChURUT
	e4lCcPOsOa0MAFhsDe+2pst7EODgcGdovN4SXUwFlr4gfFzMYeaboltduD69vZLrTjLjGDWb5nd
	ZlFGEIO+b
X-Google-Smtp-Source: AGHT+IHBVfxstZr3iU3q2jcl+5qxiooja6n1Y6f/urrhaBNwOH6g+O3gk2fuFu90iFpUt1GgoncsrQ==
X-Received: by 2002:a17:90b:4f4a:b0:2fa:6055:17e7 with SMTP id 98e67ed59e1d1-306a49ab484mr7321848a91.8.1744060224694;
        Mon, 07 Apr 2025 14:10:24 -0700 (PDT)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com. [209.85.216.49])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3057ca47f57sm10707087a91.11.2025.04.07.14.10.23
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Apr 2025 14:10:23 -0700 (PDT)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-306b78ae2d1so1893361a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 14:10:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVc1vIvmYyqKeVAapjiVs+BXYquQfeR407LUaweUeyuNnn2zoeHBSyURLZ8xndyAHhQ2hkjLwt6+LZmi5w=@vger.kernel.org
X-Received: by 2002:a17:90a:d646:b0:2fe:ba7f:8032 with SMTP id
 98e67ed59e1d1-306a485e486mr21065018a91.9.1744060222504; Mon, 07 Apr 2025
 14:10:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <d6f5f854-1294-4afa-b02a-657713435435@redhat.com>
 <20250404160025.3ab56f60.pasic@linux.ibm.com> <6f548b8b-8c6e-4221-a5d5-8e7a9013f9c3@redhat.com>
 <20250404173910.6581706a.pasic@linux.ibm.com> <20250407034901-mutt-send-email-mst@kernel.org>
 <2b187710-329d-4d36-b2e7-158709ea60d6@redhat.com> <20250407042058-mutt-send-email-mst@kernel.org>
 <0c221abf-de20-4ce3-917d-0375c1ec9140@redhat.com> <20250407044743-mutt-send-email-mst@kernel.org>
 <b331a780-a9db-4d76-af7c-e9e8e7d1cc10@redhat.com> <20250407045456-mutt-send-email-mst@kernel.org>
 <a86240bc-8417-48a6-bf13-01dd7ace5ae9@redhat.com> <33def1b0-d9d5-46f1-9b61-b0269753ecce@redhat.com>
 <88d8f2d2-7b8a-458f-8fc4-c31964996817@redhat.com> <CABVzXAmMEsw70Tftg4ZNi0G4d8j9pGTyrNqOFMjzHwEpy0JqyA@mail.gmail.com>
 <3bbad51d-d7d8-46f7-a28c-11cc3af6ef76@redhat.com>
In-Reply-To: <3bbad51d-d7d8-46f7-a28c-11cc3af6ef76@redhat.com>
From: Daniel Verkamp <dverkamp@chromium.org>
Date: Mon, 7 Apr 2025 14:09:55 -0700
X-Gmail-Original-Message-ID: <CABVzXAnLjNeTYFvBBXyvB=h63b-rkjncBMzkV=+PY-Mi5fvi3g@mail.gmail.com>
X-Gm-Features: ATxdqUE0HO7NR8RDwJ6zzKPsdwnp2tanOwCvCL2_IqsDFdqHWotUVnDaMU86evY
Message-ID: <CABVzXAnLjNeTYFvBBXyvB=h63b-rkjncBMzkV=+PY-Mi5fvi3g@mail.gmail.com>
Subject: Re: [PATCH v1] s390/virtio_ccw: don't allocate/assign airqs for
 non-existing queues
To: David Hildenbrand <david@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Halil Pasic <pasic@linux.ibm.com>, linux-kernel@vger.kernel.org, 
	linux-s390@vger.kernel.org, virtualization@lists.linux.dev, 
	kvm@vger.kernel.org, Chandra Merla <cmerla@redhat.com>, Stable@vger.kernel.org, 
	Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>, Eric Farman <farman@linux.ibm.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Wei Wang <wei.w.wang@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 7, 2025 at 11:47=E2=80=AFAM David Hildenbrand <david@redhat.com=
> wrote:
>
> >>> Heh, but that one said:
> >>>
> >>> +\item[ VIRTIO_BALLOON_F_WS_REPORTING(6) ] The device has support for
> >>> Working Set
> >>>
> >>> Which does not seem to reflect reality ...
> >
> > Please feel free to disregard these features and reuse their bits and
> > queue indexes; as far as I know, they are not actually enabled
> > anywhere currently and the corresponding guest patches were only
> > applied to some (no-longer-used) ChromeOS kernel trees, so the
> > compatibility impact should be minimal. I will also try to clean up
> > the leftover bits on the crosvm side just to clear things up.
>
> Thanks for your reply, and thanks for clarifying+cleaning it up.
>
[...]
> >> IIRC, in that commit they switched to the "spec" behavior.
> >>
> >> That's when they started hard-coding the queue indexes.
> >>
> >> CCing Daniel. All Linux versions should be incompatible with cross-vmm=
 regarding free page reporting.
> >> How is that handled?
> >
> > In practice, it only works because nobody calls crosvm with
> > --balloon-page-reporting (it's off by default), so the balloon device
> > does not advertise the VIRTIO_BALLOON_F_PAGE_REPORTING feature.
> >
> > (I just went searching now, and it does seem like there is actually
> > one user in Android that does try to enable page reporting[1], which
> > I'll have to look into...)
> >
> > In my opinion, it makes the most sense to keep the spec as it is and
> > change QEMU and the kernel to match, but obviously that's not trivial
> > to do in a way that doesn't break existing devices and drivers.
>
> If only it would be limited to QEMU and Linux ... :)
>
> Out of curiosity, assuming we'd make the spec match the current
> QEMU/Linux implementation at least for the 3 involved features only,
> would there be a way to adjust crossvm without any disruption?
>
> I still have the feeling that it will be rather hard to get that all
> implementations match the spec ... For new features+queues it will be
> easy to force the usage of fixed virtqueue numbers, but for
> free-page-hinting and reporting, it's a mess :(

If the spec is changed, we can certainly update crosvm to match it; I
think this only really affects a few devices (balloon and technically
filesystem, but see below), only affects features that are generally
not turned on, and in many cases, the guest kernel is updated
simultaneously with the crosvm binary. I'm not opposed to changing the
spec to match reality, although that feels like a bad move from a
spec-integrity perspective.

Regardless of the chosen path, I think the spec should be clarified -
the meaning of "queue only exists if <feature> is set" leaves the
reader with too many questions:
- What does "if <feature> is set" mean? If it's advertised by the
device? If it's acked by the driver? (To me, "set" definitely hints at
the latter, but it should be explicit.)
- What does it mean for a virtqueue to "exist"? Does that queue index
disappear from the numbering if it does not exist, sliding all of the
later queues down? If so, the spec should really not have the static
queue numbers listed for the later queues, since they are only correct
if all previous feature-dependent queues were also "set", whatever
that means.

The way crosvm interpreted this was:
- "if <feature> is set" means "if the device advertised <feature>
*and* driver acknowledged <feature>"
- "queue only exists" means "if <feature> was not acked, the
corresponding virtqueue cannot be enabled by the driver" (attempting
to set queue_enable =3D 1 has no effect).
- Any later virtqueues are unaffected and still have the same queue indexes=
.

The way QEMU interpeted this (I think, just skimming the code and
working from memory here):
- "if <feature> is set" means "if the device advertised <feature>" (it
is checking host_features, not guest_features)
- "queue only exists" means "if <feature> was not offered by the
device, all later virtqueues are shifted down one index"

---

The spec for the filesystem device has a similar issue to the balloon devic=
e:
- Queue 0 (hiprio) is always available regardless of features.
- Queue 1 (notification queue) has a note that "The notification queue
only exists if VIRTIO_FS_F_NOTIFICATION is set."
- Queue 2..n are supposed to be the request queues per the numbering
in the spec.

This is how it has been specified since virtio 1.2 when the fs device
was originally added. However, the Linux driver (and probably all
existing device implementations - at least virtiofsd and crosvm's fs
device) don't support VIRTIO_FS_F_NOTIFICATION and use queue 1 as a
request queue, which matches the QEMU/Linux interpretation but means
the spec doesn't match reality again.

Thanks,
-- Daniel
