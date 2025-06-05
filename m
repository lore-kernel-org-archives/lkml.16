Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F111241132
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 16:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749141401; cv=none; b=obRJg77GPQsyrSN/9VB8fv2+0Aa4YVVg73WBB33i7bub0XczCrijvSkXjMXbBtIJ1joGtUX8rHnKffM5lmeR4Acju+PoHl9ouEkIsnsM6X0y49UsZhh/Xp00G1zz9OPB4t70yb4ruG1ldODuuF8ww56muu0xTcKKKCb8JpJoRzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749141401; c=relaxed/simple;
	bh=m/AMED1uCKw6PLorZVcAc+las3T70VIL6/pCq2JraOc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ulIJXaUH4AX2+rpn00X7X5oxntnVj2hKBbjdT+LFtWL+0++g0QOs04VGIhBPAHbDhql1HBp25bXsZSp9yUiTRiYB2j0IFqCrvQFxkKdrOE2Dr95dRdUeWR7oMThcnXCIkTRO5aqYcRiXeoGABHbQna+cf4epWaQuFEEdoeCOnpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org; spf=pass smtp.mailfrom=fooishbar.org; dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.b=RyFmJPTC; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.b="RyFmJPTC"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6fad79433bbso11832636d6.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 09:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1749141398; x=1749746198; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m/AMED1uCKw6PLorZVcAc+las3T70VIL6/pCq2JraOc=;
        b=RyFmJPTCZkMKqRbM7Ion79k1RL7G2vkfmNdNLcYeqgO0eHoplROHT9huBH9+nxMs5P
         UxwJ7bUfVtfU+rNkhTH9ce3Qsmynf7LbiiCOmbh9fOQclpzUOHNccaav3JZvYmssG8RX
         WIExIJPXfCnPtgCQk9efNHw7WYN3MKoPN8N742rwfu3ei0Jn7l2GNFLXLCQJBDNCpZJK
         zydLkdmCrNAjmkaGlhovdzincdVTcsamYxiacJyDTHHvfbLdJlthY0Ry2wuf7pVj1lrl
         +D2ThB5fyfbj791NZ7xLbXWX0dcDXJe7aNi6xphhJ29h3qGYXdHppodsiuDpJ0hmFdl2
         +AYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749141398; x=1749746198;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m/AMED1uCKw6PLorZVcAc+las3T70VIL6/pCq2JraOc=;
        b=E1SO6cuGHT8+Py7PX1F2RK5zeRmpXyphqAAZELG0Mc2S97rXoL6IGa4qSyoMvS9pDF
         Z03W9LPgbrvD33URPs7C9XwE2mW7ZYOeZb9KA2URWtC4WmHwQNE853U7eZ79RJ44qvRP
         yWpyK36U2um74KqpxTwy3unafj9uLT2VAXQGItxwSHYoz9EWOy6DpktMM5TRlo6LWilk
         PM7ZWMrZwyWbFXiZFDD2m2o3Ketcu6wluUxFkhBZzXFKoqiPv1R3ITLzdAtTlek78N3J
         l1pAiCBvQe1buIcor+Op+xPmEQtTOanK4z75w2jo9D1n4be3HTDmzudW4cJUkKkTTd5u
         oYzA==
X-Forwarded-Encrypted: i=1; AJvYcCUessrQVUl05Zaf/uLEBbNZ8Il4ctkmtiBVSqAVCt5WdGC4WLOLG7SRcaaFkp1JBQXUPAFO2f+p3wDrUOc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxihx3N2tgGoNr0BQAptFAlOrFLQHi4w8C4CV7ZY4UnTmTa8KwN
	24Ngz/4UwRN4cnBrxaA5qCetEf8PuMKIyGBcZirxOWg0mhw6MCs+krCzHAzQpT3D7nT7o50Np6u
	aXWgb+btDT9X539VmBswYUDZo6i6688SrkL8g5JKI/Q==
X-Gm-Gg: ASbGncsP+BhEt8zPzw14vwQJMeg0ZT90FuAholsbrppVZ5Mty7b+S2zuknGdnzdcb69
	2V9BkqiP/EaJTuPrCaeNFm7I+Xc6FdQs4YIsJSbITIEPIK8gCpyhiZkwBmRzqm0J8YwqmuQwtiV
	Q5umxhG1jAuZ6Wps2irgWbUfUNusxCNmM=
X-Google-Smtp-Source: AGHT+IH/vUqInLnUsBsqIxZVLljlV2JNq6TLN0zeIbDOndYPLtFZP9dtkbRS+wnOk9zZ8yyAo/Oy9zg7yUbo3S0v9LM=
X-Received: by 2002:ad4:5dc8:0:b0:6f8:8fdf:f460 with SMTP id
 6a1803df08f44-6fb08f4d0a5mr2148076d6.9.1749141397948; Thu, 05 Jun 2025
 09:36:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250604-6-10-rocket-v6-0-237ac75ddb5e@tomeuvizoso.net>
 <20250604-6-10-rocket-v6-6-237ac75ddb5e@tomeuvizoso.net> <CAPj87rPv7Pd5tbXhpRLaUJCGB8JmD4kfF50WRsEiST2gvtg3Bg@mail.gmail.com>
 <cc21a090-801d-4b32-bac2-01cebf896c85@arm.com> <CAAObsKDMhuqYtn=+xR6-n=Uk+5_rU91OqVKyQ5cxhqfTo5svjg@mail.gmail.com>
 <3a8e1101-469b-4686-b160-6fdb1737a636@arm.com> <CAAObsKCjv=K7Dk=QD+MAqwWUNyw_pCh2Eqij3Qwx1jzKoKg4zw@mail.gmail.com>
In-Reply-To: <CAAObsKCjv=K7Dk=QD+MAqwWUNyw_pCh2Eqij3Qwx1jzKoKg4zw@mail.gmail.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 5 Jun 2025 17:36:26 +0100
X-Gm-Features: AX0GCFsF7cxglaKZSX8Koz---6tL_CI5LfT0LL-n_NzmXSV0kUJg5xHMCVro-r4
Message-ID: <CAPj87rOggG6_wNHvv55onxcw00UxASUJYK2pmdkc+oUmYFyp2w@mail.gmail.com>
Subject: Re: [PATCH v6 06/10] accel/rocket: Add IOCTL for BO creation
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Cc: Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, Kever Yang <kever.yang@rock-chips.com>, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 5 Jun 2025 at 17:32, Tomeu Vizoso <tomeu@tomeuvizoso.net> wrote:
> On Thu, Jun 5, 2025 at 3:37=E2=80=AFPM Robin Murphy <robin.murphy@arm.com=
> wrote:
> > It should only need a single IOMMU domain per DRM client, so no faffing
> > about replicating mappings. iommu_paging_domain_alloc() does need *an*
> > appropriate target device so it can identify the right IOMMU driver, bu=
t
> > that in itself doesn't preclude attaching other devices to the resultin=
g
> > domain as well as (or even instead of) the nominal one. In general, not
> > all IOMMU drivers support cross-instance attach so it may fail with
> > -EINVAL, and *that*'s when you might need to fall back to allocating
> > multiple per-instance domains - but as I say since this is a
> > Rockchip-specific driver where the IOMMU *is* intended to support this
> > already, you don't need to bother.
>
> Ok, I did just that and it's working great in my testing:
>
> I create a domain when the client opens the DRM connection and map all
> its BOs to it. Then when a job is about to start, I detach whatever
> domain was attached to the core's group and attach that client's
> domain.
>
> Will send a v7 with it in a couple of days.

Awesome, thanks so much for that Tomeu!

Cheers,
Daniel
