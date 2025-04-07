Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B06521660D
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 17:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744047583; cv=none; b=DnrfA365Gf6hWGNWHrEgFt2EJ4HA9AAzo2954lA5qdgYdOk0gHsNk1tJ2ZGfy+Bm7Iyt5vRAYmCHA4MJZOE5D9eXLVH9h0PaENTrzAlKdFWwR1pzYyyEzjdQvbEJl+P8SFsn6KIDF/1WOs5x3zIUui1fAVgE6COHKB8DE3Qa4Kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744047583; c=relaxed/simple;
	bh=gk7Pms5ggU4Mz+jBefE6aQUbZOdAXgc3uKZ/o8JLcRw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T/x8SRcROQD0UzdDMZHcILZ7YyOFCFd3JOgfvqEz8NGgrXX++LiyuhX8ygg29ZAJRoAnFFT8lVjz+kD/uwbKL5hgJ8KodJDTqoB4/sOWxWbKWx1gUY/b6mYhE74N3oAVVfHrIcbuWQWXcAUdUDMFHLlCLLe4pWb4BVqUrehT/Q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bokn3DaP; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bokn3DaP"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2241c95619eso8378245ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 10:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1744047581; x=1744652381; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PDFKuqPeswYIIkk2eM8stbEtqZO/k06yxbdJkpWX+KA=;
        b=bokn3DaPFVsvsfbqw29TvH/CT81hG8/ft1va6APxQ2x+bPYxr6shlKypVHWJRb4ri4
         IMk9giv55sOfq2QD2cuexvIuI9MfVPDF8ddbnZjtTnAVV3ueGA3kLrT052tBF9R6muFv
         qKFlTdDKdRI6gLdokPe31Lk6PcvkPgfMGzpNA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744047581; x=1744652381;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PDFKuqPeswYIIkk2eM8stbEtqZO/k06yxbdJkpWX+KA=;
        b=f8WZZAu7DH03Ule2fZIsnK9QRQXGYP0MmfP/cmxA4MgZHFd50dp/eMuiLAsh/61wVl
         W5G93HvgushBComDo1Y6q3Rfty6jHkoDZq+VzpFqz5Uyqtk2QmvE9jT3KxJzpNErapPJ
         hVhuCXTziFIQb6y83j+9DxXKYEpD7T1xyg+6HbC1b/9i5zFIhEZ/kRRkGB1DZJTEUIsS
         7meNb1ymqlEnjAXK8VRZbIKG3ZBNN60VOi27rDBx/V8hZYgNTPfbXOA+9EcqD1nYNmKD
         mDAZkbEu+g0pkmbYG6y801W45Al/SB8f1vpLzO/haMj2DcuTEYnUvgbM+rUFzKtotRpc
         e88A==
X-Forwarded-Encrypted: i=1; AJvYcCUnW/gUlBbceMW/35e5gMkpJz1BR9cSZTjrsaa7tyyUW6Nk8WLfurqIRbn2hbfyKyYqzEkYiR4tBY0f2ZQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlWKmMdoycKGD08fOEMA/l+9wADAIDjrwc/SzCujqUDroSYjPz
	vTXKnpOyRXoOjc5gEBvYeAX+ndKZGuLVlE3ASMMD/M1Ku8xontyiC1VL6G3QTrVHmFC6um88W2I
	NKA==
X-Gm-Gg: ASbGncsOmoU9EscW1frpwFQXvzCmiyv0jPs3Yb4pIdSqhLKHseDwjcS+hRQJRYgoCfc
	R90Ar/iCvvN8C7cvj7BNV/rNCaY3vrFRQxHJ2kybJD3ymVe9nrzhzdVV3KYoTUQHBmEgbpUESwn
	am36rJ9l9GXnoHR9EJnE4S7OeP5ouxmFcPUWxhoxgUOnOyPHnxnZGvv0BtM7ll5WjOD5wcNWfIn
	j82cTB71xmBfU0ivizd81TmphjeQ4m9TUK7bigcGHdsN2n9nEeDxNhbrMuXySTCfVwRWtO1a2yt
	jjK/8QmiRmuDRFLwTMfSuZV4vBTeC8stNJ1e1Kmt8mqMKazIb60gBLDueeuYNqD+cmm53/58htQ
	8gAhHf72dWptH
X-Google-Smtp-Source: AGHT+IE3AjYGaT1TldrXXrBL5LdsM3sIvev6cMhtBws4Ks+aMw5EpqJssAvWkDWATQODI9z9QYc/EA==
X-Received: by 2002:a17:902:f609:b0:215:a96d:ec36 with SMTP id d9443c01a7336-22a8a0584ebmr72269795ad.5.1744047581098;
        Mon, 07 Apr 2025 10:39:41 -0700 (PDT)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com. [209.85.215.172])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229785ad9b7sm84093525ad.24.2025.04.07.10.39.39
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Apr 2025 10:39:39 -0700 (PDT)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-af5cdf4a2f8so3395950a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 10:39:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVJn2sSwm0h1V1Tieos9wXWjWHuLS3G2UTvoZttl3UXXUwscDe1GANPnI9dh9Bp6hyk656Q05rsapSq3Qk=@vger.kernel.org
X-Received: by 2002:a17:90a:f945:b0:2f6:dcc9:38e0 with SMTP id
 98e67ed59e1d1-306a4758cf3mr22729577a91.0.1744047578869; Mon, 07 Apr 2025
 10:39:38 -0700 (PDT)
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
 <88d8f2d2-7b8a-458f-8fc4-c31964996817@redhat.com>
In-Reply-To: <88d8f2d2-7b8a-458f-8fc4-c31964996817@redhat.com>
From: Daniel Verkamp <dverkamp@chromium.org>
Date: Mon, 7 Apr 2025 10:39:09 -0700
X-Gmail-Original-Message-ID: <CABVzXAmMEsw70Tftg4ZNi0G4d8j9pGTyrNqOFMjzHwEpy0JqyA@mail.gmail.com>
X-Gm-Features: ATxdqUEz43TGWrMKYfRndFlXjP-cvulXZBTkkQ4WcXYsTky_PROiRhjDfo9dcJs
Message-ID: <CABVzXAmMEsw70Tftg4ZNi0G4d8j9pGTyrNqOFMjzHwEpy0JqyA@mail.gmail.com>
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

On Mon, Apr 7, 2025 at 6:13=E2=80=AFAM David Hildenbrand <david@redhat.com>=
 wrote:
>
> On 07.04.25 11:13, David Hildenbrand wrote:
> > On 07.04.25 11:11, David Hildenbrand wrote:
> >> On 07.04.25 10:58, Michael S. Tsirkin wrote:
> >>> On Mon, Apr 07, 2025 at 10:54:00AM +0200, David Hildenbrand wrote:
> >>>> On 07.04.25 10:49, Michael S. Tsirkin wrote:
> >>>>> On Mon, Apr 07, 2025 at 10:44:21AM +0200, David Hildenbrand wrote:
> >>>>>>>
> >>>>>>>
> >>>>>>>
> >>>>>>>> Whoever adds new feat_X *must be aware* about all previous featu=
res,
> >>>>>>>> otherwise we'd be reusing feature bits and everything falls to p=
ieces.
> >>>>>>>
> >>>>>>>
> >>>>>>> The knowledge is supposed be limited to which feature bit to use.
> >>>>>>
> >>>>>> I think we also have to know which virtqueue bits can be used, rig=
ht?
> >>>>>>
> >>>>>
> >>>>> what are virtqueue bits? vq number?
> >>>>
> >>>> Yes, sorry.
> >>>
> >>> I got confused myself, it's vq index actually now, we made the spec
> >>> consistent with that terminology. used to be number/index
> >>> interchangeably.
> >>>
> >>>> Assume cross-vm as an example. It would make use of virtqueue indexe=
s 5+6
> >>>> with their VIRTIO_BALLOON_F_WS_REPORTING.
> >>>
> >>>
> >>> crossvm guys really should have reserved the feature bit even if they
> >>> did not bother specifying it. Let's reserve it now at least?
> >>
> >> Along with the virtqueue indices, right?
> >>
> >> Note that there was
> >>
> >> https://lists.gnu.org/archive/html/qemu-devel/2023-05/msg02503.html
> >>
> >> and
> >>
> >> https://groups.oasis-open.org/communities/community-home/digestviewer/=
viewthread?GroupId=3D3973&MessageKey=3Dafb07613-f56c-4d40-8981-2fad1c723998=
&CommunityKey=3D2f26be99-3aa1-48f6-93a5-018dce262226&hlmlt=3DVT
> >>
> >> But it only was RFC, and as the QEMU implementation didn't materialize=
,
> >> nobody seemed to care ...
> >
> > Heh, but that one said:
> >
> > +\item[ VIRTIO_BALLOON_F_WS_REPORTING(6) ] The device has support for
> > Working Set
> >
> > Which does not seem to reflect reality ...

Please feel free to disregard these features and reuse their bits and
queue indexes; as far as I know, they are not actually enabled
anywhere currently and the corresponding guest patches were only
applied to some (no-longer-used) ChromeOS kernel trees, so the
compatibility impact should be minimal. I will also try to clean up
the leftover bits on the crosvm side just to clear things up.

> I dug a bit more into cross-vm, because that one seems to be the only
> one out there that does not behave like everybody else I found (maybe goo=
d,
> maybe bad :) ).
>
>
> 1) There was temporarily even another feature (VIRTIO_BALLOON_F_EVENTS_VQ=
)
> and another queue.
>
> It got removed from cross-vm in:
>
> commit 9ba634b82b55ba762dc8724676b2cf9419460145
> Author: Daniel Verkamp <dverkamp@chromium.org>
> Date:   Thu Jul 11 11:29:52 2024 -0700
>
>      devices: virtio-balloon: remove event queue support
>
>      VIRTIO_BALLOON_F_EVENTS_VQ was part of a proposed virtio spec change=
.
>
>      It is not currently supported by upstream Linux, so removing this sh=
ould
>      have no effect except for guest kernels that had CHROMIUM patches
>      applied.
>
>      The virtqueue indexes for the ws-related queues are decremented to f=
ill
>      the hole left by the removal of the event VQ; these are non-standard=
 as
>      well, so they do not have virtqueue indexes assigned in the virtio s=
pec,
>      but the proposed spec extension did actually use vq indexes 5 and 6.
>
>      BUG=3Db:214864326
>
>
> 2) cross-vm is aware of the upstream Linux driver
>
> They thought your fix would go upstream; it didn't.
>
> commit a2fa119e759d0238a42ff15a9aff0dfd122afebd
> Author: Daniel Verkamp <dverkamp@chromium.org>
> Date:   Wed Jul 10 16:16:28 2024 -0700
>
>      devices: virtio-balloon: warn about queue index mismatches
>
>      The Linux kernel virtio-balloon driver spec non-compliance related t=
o
>      queue numbering is being fixed; add some diagnostics to our device t=
hat
>      help to check if everything is working as expected.
>
>      <https://lore.kernel.org/virtualization/CACGkMEsg0+vpav1Fo8JF1isq4Ef=
8t4_CFN1scyztDO8bXzRLBQ@mail.gmail.com/T/>
>
>      Additionally, replace the num_expected_queues() function with per-qu=
eue
>      checking to avoid the need for the duplicate feature checks and queu=
e
>      count calculation; each pop_queue() call will be checked using the `=
?`
>      operator and return a more useful error message if a particular queu=
e is
>      missing.
>
>      BUG=3DNone
>      TEST=3Dcrosvm run --balloon-page-reporting ...
>
>
> IIRC, in that commit they switched to the "spec" behavior.
>
> That's when they started hard-coding the queue indexes.
>
> CCing Daniel. All Linux versions should be incompatible with cross-vmm re=
garding free page reporting.
> How is that handled?

In practice, it only works because nobody calls crosvm with
--balloon-page-reporting (it's off by default), so the balloon device
does not advertise the VIRTIO_BALLOON_F_PAGE_REPORTING feature.

(I just went searching now, and it does seem like there is actually
one user in Android that does try to enable page reporting[1], which
I'll have to look into...)

In my opinion, it makes the most sense to keep the spec as it is and
change QEMU and the kernel to match, but obviously that's not trivial
to do in a way that doesn't break existing devices and drivers.

[1]: https://cs.android.com/android/platform/superproject/main/+/main:packa=
ges/modules/Virtualization/android/virtmgr/src/crosvm.rs;l=3D1079;drc=3Dcaf=
f2827914c0918260ff76cd55f6e3dc6323d51
