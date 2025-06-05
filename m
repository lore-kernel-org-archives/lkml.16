Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B9326AD0
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 16:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749141144; cv=none; b=Fbbn14GJV/8PzuoHJjcZamjrGAFpwmR7NzcMrP/YqUY/Gp0kyDz/RMuT1uDApI44UbNMEIuVdB1vjdUQ8UhTJft4IyupSY/j0OWpBpSRnBSsj5Q5hZ63A/mIqYbh3rF67hDJWzkzvd84wVN9wkOTA9x+gILEUscS7s/1wiQmgjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749141144; c=relaxed/simple;
	bh=XgJg7hlJSi5mVzXbPXgTglQhcjc9Je/fRCk+eeukVYc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HrYNwB5Ndoh/8/WmtlKbQ/oXyNoAifYbBnu/aVil8iUeFBOUUOONezZMlV9QNAeDk4V1cv7yKCBdAI0vOUBBW/Ckdto/he/wu5sEaHIPv5/ulEJ4IuZXEvcnX4xQVBaaBgXnwMq9lwa+piWz3N5Taw+v+FXBlg/6Yg/ocx8g0AU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net; spf=pass smtp.mailfrom=tomeuvizoso.net; dkim=pass (2048-bit key) header.d=tomeuvizoso-net.20230601.gappssmtp.com header.i=@tomeuvizoso-net.20230601.gappssmtp.com header.b=VMhOGsLg; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tomeuvizoso-net.20230601.gappssmtp.com header.i=@tomeuvizoso-net.20230601.gappssmtp.com header.b="VMhOGsLg"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-70e6bddc30aso11221587b3.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 09:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tomeuvizoso-net.20230601.gappssmtp.com; s=20230601; t=1749141140; x=1749745940; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XgJg7hlJSi5mVzXbPXgTglQhcjc9Je/fRCk+eeukVYc=;
        b=VMhOGsLgFv2tYEeoj2acbsAiOt1gaXfTEwToDsHFeO7mBz3PhPOxFVkT3tfUpCB77t
         YWsBiGV1T3mwisI5Zp3soDw11/oAnn7NVIBWl/nIKdp/JpEiFfqXkxmDGKaraAE0UFgb
         kupnozp0XjGIShDrwNBlJ+Eog9jKfU3DDG1jkS/+T5WcCCq8D15xntUoOxJ84Lp9srqZ
         4ecw54u6IZaXk2SMyqRdGYtHvPhhTsoi8aezU2FIoZTWPu4S1YuLCrcC3XAxJ92el0fH
         wZ6DIawsNcYVeKGmZz7ijqjV1B/Of/knxuV4ACf8bp4Zkj3wbx7YUdA8Zb85pJsa7LoK
         QNMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749141140; x=1749745940;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XgJg7hlJSi5mVzXbPXgTglQhcjc9Je/fRCk+eeukVYc=;
        b=FtaY94eGuR/cpDWibsjAr2JeJavl59AVYnmnUJvUstcK4IS6ZCoTPZRw8juxwzXz3w
         yVPNVy3KKrXnfCZp4wXUw8eUqkMAXupum1aIbgJ2KU9QM7wTlYv1jp25fW/h/tjpyDAg
         1avSym6x0Dgq4Ou752BqLsXRdxA1Y1tsSKpclf9aaK/+qA5D1vawbPgjQxD78S920Ulj
         0yvnKytMWRpEyNc2oiRWyaiIRuznLWWVT27RdoWIvHT2TeNlIdzQZV9k+9tJLT+u/GYf
         FR04koZ9KlNjCu8Y/q3cjPaIIC4FJVnHvRblRHIAcaVfwZCX7iubXXkvxgLt1Em/bTsX
         Br4A==
X-Forwarded-Encrypted: i=1; AJvYcCWCjHOLoenZ+Zbsyl90bX9QE+PQuf9XBJ3MqcT8reT4zBqu7hWGodzk6Fw8Yn/jhrjDQh7wHuudjfk3eIQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6W1+g8LTL//ZZGtLlq/OcbP12VtpF+iEM4C6LjmYOPZrbYJQb
	0ATQzJq/uQlR7z8DbgrOg9TpkHj3I0AiS5ZMc2WqRLF/1OyaNUEeq+1N2tN+9NWivzf8iEG4iJg
	+T5Ev96uAhA==
X-Gm-Gg: ASbGncvA79HFIFqxW5IouuH4xJeFcJUXTEKkleEPLiUKe15fKn6QpQiUydZy3B8KchC
	fLP4gnXxDfGm/n1xZ3T1NmRXkNzr+FwvT0W+q0PcGLfOh/cQCd+HtqBFq15cqSbzNtl+usawnVy
	S/FvKt+G/nz9S9uYTDm23jKLsSk1829Ui5wi3SkNtq+9Sm1+hHPbtX/hYj1iSWGVLwK/9Csuncq
	Yg5V3H6kVWOvO0uOUQjbH3Xy7uzParOU70PnTyvMsjmvhK1rXLwuA2N/5R1yJKnqiH/7RdKzQDq
	OmSxXPl0+OMFRdWF95pUPyikUI/FCRKX0/x9j7Lqj3jUFf3uhcYzkhwW653dMqbzvS3A96wquvb
	kqMIAe5ZQbpyTe3Kz52QbOxvWyxYkDQ==
X-Google-Smtp-Source: AGHT+IGGxZZvgZR4bN4ZjKjXYKo0JqH+AmjWB/AV2g8LvJeOJpo0JKn6oc5aMnqRNNm+cVSSa6zo9Q==
X-Received: by 2002:a05:690c:fc2:b0:710:e6b0:1688 with SMTP id 00721157ae682-710f7696824mr760187b3.14.1749141139971;
        Thu, 05 Jun 2025 09:32:19 -0700 (PDT)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com. [209.85.219.182])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-70f8ac0d92dsm35107497b3.58.2025.06.05.09.32.17
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jun 2025 09:32:17 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e75668006b9so1251306276.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 09:32:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXA0xs3bcloNjG8k1oAziGkRl+xhBYWG73JUwExRWAmnMwHyXq8v0HzOwh7QV+WW9+realZe6mVlLOC26g=@vger.kernel.org
X-Received: by 2002:a05:6902:2d05:b0:e7d:a012:290a with SMTP id
 3f1490d57ef6-e81a21fbac2mr580525276.44.1749141137124; Thu, 05 Jun 2025
 09:32:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250604-6-10-rocket-v6-0-237ac75ddb5e@tomeuvizoso.net>
 <20250604-6-10-rocket-v6-6-237ac75ddb5e@tomeuvizoso.net> <CAPj87rPv7Pd5tbXhpRLaUJCGB8JmD4kfF50WRsEiST2gvtg3Bg@mail.gmail.com>
 <cc21a090-801d-4b32-bac2-01cebf896c85@arm.com> <CAAObsKDMhuqYtn=+xR6-n=Uk+5_rU91OqVKyQ5cxhqfTo5svjg@mail.gmail.com>
 <3a8e1101-469b-4686-b160-6fdb1737a636@arm.com>
In-Reply-To: <3a8e1101-469b-4686-b160-6fdb1737a636@arm.com>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Thu, 5 Jun 2025 18:32:06 +0200
X-Gmail-Original-Message-ID: <CAAObsKCjv=K7Dk=QD+MAqwWUNyw_pCh2Eqij3Qwx1jzKoKg4zw@mail.gmail.com>
X-Gm-Features: AX0GCFsWffXR5BsCRkmesm8xllL45jWGaGp3TKLEXqW1VbkssrelSRfCs4YLano
Message-ID: <CAAObsKCjv=K7Dk=QD+MAqwWUNyw_pCh2Eqij3Qwx1jzKoKg4zw@mail.gmail.com>
Subject: Re: [PATCH v6 06/10] accel/rocket: Add IOCTL for BO creation
To: Robin Murphy <robin.murphy@arm.com>
Cc: Daniel Stone <daniel@fooishbar.org>, Rob Herring <robh@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, Kever Yang <kever.yang@rock-chips.com>, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 5, 2025 at 3:37=E2=80=AFPM Robin Murphy <robin.murphy@arm.com> =
wrote:
>
> On 05/06/2025 8:41 am, Tomeu Vizoso wrote:
> [...]
> >> In fact this is precisely the usage model I would suggest for this sor=
t
> >> of thing, and IIRC I had a similar conversation with the Ethos driver
> >> folks a few years back. Running your own IOMMU domain is no biggie, se=
e
> >> several other DRM drivers (including rockchip). As long as you have a
> >> separate struct device per NPU core then indeed it should be perfectly
> >> straightforward to maintain distinct IOMMU domains per job, and
> >> attach/detach them as part of scheduling the jobs on and off the cores=
.
> >> Looks like rockchip-iommu supports cross-instance attach, so if
> >> necessary you should already be OK to have multiple cores working on t=
he
> >> same job at once, without needing extra work at the IOMMU end.
> >
> > Ok, so if I understood it correctly, the plan would be for each DRM
> > client to have one IOMMU domain per each core (each core has its own
> > IOMMU), and map all its buffers in all these domains.
> >
> > Then when a job is about to be scheduled on a given core, make sure
> > that the IOMMU for that core uses the domain for the client that
> > submitted the job.
> >
> > Did I get that right?
>
> It should only need a single IOMMU domain per DRM client, so no faffing
> about replicating mappings. iommu_paging_domain_alloc() does need *an*
> appropriate target device so it can identify the right IOMMU driver, but
> that in itself doesn't preclude attaching other devices to the resulting
> domain as well as (or even instead of) the nominal one. In general, not
> all IOMMU drivers support cross-instance attach so it may fail with
> -EINVAL, and *that*'s when you might need to fall back to allocating
> multiple per-instance domains - but as I say since this is a
> Rockchip-specific driver where the IOMMU *is* intended to support this
> already, you don't need to bother.

Ok, I did just that and it's working great in my testing:

I create a domain when the client opens the DRM connection and map all
its BOs to it. Then when a job is about to start, I detach whatever
domain was attached to the core's group and attach that client's
domain.

Will send a v7 with it in a couple of days.

Thanks!

Tomeu
