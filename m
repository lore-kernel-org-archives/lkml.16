Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C127202F83
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 12:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749128237; cv=none; b=lMI++nxmMkrjLBeLexAumeOVLejqtMgmeNRN4at9ICB2+i6YYFap+PD2BkeF6C3offF4gQ6yQP/B12rEGL+KNxjZtc0r7mzvLiBUQWtxO7IaWBATBpByZU/CQYldCZovbdAaDGeZDB5iEfRTsoawt5+u+gEOs2UDQyw/HYZDoP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749128237; c=relaxed/simple;
	bh=8P9yRldB8efdjVI/GGOevnbpBNvIMbrliEBkXndufro=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JHAqKui1cp0nuL7nRZvcuUZjlMh/GCnR57WB5GPW8NoyXMw0JbBGnHhUIDDz5qtUSTeoHxq30fsHRV2bUOfW1OgkoB0yv4HOXzAJH6snM565fQ8YoWYEdhEjaaqKDUe2YiqidLVOR3C3dGv9GEJ9SNqcgJPAWP65q5oEpdvRT/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net; spf=pass smtp.mailfrom=tomeuvizoso.net; dkim=pass (2048-bit key) header.d=tomeuvizoso-net.20230601.gappssmtp.com header.i=@tomeuvizoso-net.20230601.gappssmtp.com header.b=zLS+slgB; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tomeuvizoso-net.20230601.gappssmtp.com header.i=@tomeuvizoso-net.20230601.gappssmtp.com header.b="zLS+slgB"
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e7dc3df7ac3so912536276.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 05:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tomeuvizoso-net.20230601.gappssmtp.com; s=20230601; t=1749128234; x=1749733034; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8P9yRldB8efdjVI/GGOevnbpBNvIMbrliEBkXndufro=;
        b=zLS+slgBxclExO+7PrxzQT3gPMRpG4j773E7dpPXjiE87mweShiPW//07hZag4JH/7
         o7Oj9Y4BaHsPCP/IiUh6EOXIYUjNpYMhCU7sDr9AOsx5dnenQubUnI1PGFk44vGc9DqK
         FuH3MuVY0hcvmXWqacmWsXD39/WUchIhFBC+2ivxZRNcw/SV/cfdcbaUsjD45Q959esS
         Ensk1/Tvo1nuxoAzdBRwCAsysDZQstRUXV1Ebg1jxa7//igJN8ulsP8+gJectPp/7RTR
         XOlB0fSxiOwiXT5bG91vtt5V2QyNMc5XPAQ1u6em3weptntZwBX6YEDyPjbukUC5PB0z
         tNLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749128234; x=1749733034;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8P9yRldB8efdjVI/GGOevnbpBNvIMbrliEBkXndufro=;
        b=cm8Wfp7ivcvQA+2iRfcJ/6Oz9hcAh3+bh6zQiqyttnQyjpWnY/X3znEC0vUr0xKclG
         YCucyTmNXNm9MvrPrHQxkZxLP84fSUToQzpRcIPzzOEbwmPxynC8B0Sq/MCnZLbH82y7
         wEuhQYxzoDYqVRZ1wc5UsS6gh+LDx81SYmKpMcitBD15PJHsNQPKaZS6gQvy6Xfqjjwn
         UvReK2bhxsTAU3P7q5LjPUoUx5sPlnlMhjN0JfH4bcRniTpZ1OJaPDiCSIx78R1+4wuG
         0fNfl3T0emo+l3yj+e7zGtOjNYHTQOxVEd6A8GIM00NS/MMj0Pc5aUKBnsTsiBWN039o
         DlHw==
X-Forwarded-Encrypted: i=1; AJvYcCU+ve2m1Gc9t05AQzv1TAg4TFUNMWK4j7kSa0Ql36Zu/B7+bOymQvKuEba0H9OhrlOyCeFUS7gHHBOhpoo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy57tU+zHYHOygpaqBSEpHUg+EI4r/hmHwSEhjLUFOx05zDC6bv
	LugfjCci4cM8OzIAD4Eg0DSoaGdHxtsCD6d29T0vRexcz/j7CqYKeIdYLLQv6JOccfE5aOBSsED
	DpoIQpJbUTg==
X-Gm-Gg: ASbGncsWgF1Tpt7pxuad90eiM0IQb7ms/wjhT6K6vZ0bolDFoHFtHceOWcO3VdkGGrO
	iNUjZ2idtmr0Werq+IHmgIJVTGoV2PwsFFC3CDgRtCcN9diokm9Yx4vmEObg/OJRRVNOK3zq+SF
	QPhI5kxbAE6VgZuQm44/RmwpWk615J9UoMjC2C8qYE1xy/dVW2zYwF8f6PrRHsXTNJxwubPV+EC
	eSG97MorvcrfIlCn7Ut+1X2DtgNfyfEiyaYmhe5MIsg3Mt2e3pS1h9/2xGL9yp5f5saOfQZTOXJ
	rDSig68Z6OgoRCMTJ/Qn52RT2v1NP1GzZnw8ed3lPLKUPyyF/avU284VSqji+zDSyf29Pfc1/Cq
	lxW49tumoWkgX/YHdFhkPtW7s50BF5Q==
X-Google-Smtp-Source: AGHT+IGa945+NMDkzcpiZIGfHLwuePY7D76N58BFYoTrjWZTxEX7gzbPvThg+6TlgnPHGn3AP6vhMg==
X-Received: by 2002:a05:6902:1543:b0:e7d:7504:b39e with SMTP id 3f1490d57ef6-e8179c3a8f1mr8183889276.7.1749128234051;
        Thu, 05 Jun 2025 05:57:14 -0700 (PDT)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com. [209.85.219.172])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e819ef076a8sm61467276.54.2025.06.05.05.57.13
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jun 2025 05:57:13 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e817b40d6e7so917680276.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 05:57:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWhJshMKHcw+56Zrr+wfIqeRxj/SZNvJ1Cj3dvnwnQtna7EEbIqC35TKXnwlm4y4TeX3UOb1gRd9lqnPaU=@vger.kernel.org
X-Received: by 2002:a05:6902:1245:b0:e81:49ba:47ef with SMTP id
 3f1490d57ef6-e8179de2e64mr8284874276.27.1749128233149; Thu, 05 Jun 2025
 05:57:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250604-6-10-rocket-v6-0-237ac75ddb5e@tomeuvizoso.net>
 <20250604-6-10-rocket-v6-6-237ac75ddb5e@tomeuvizoso.net> <CAPj87rPv7Pd5tbXhpRLaUJCGB8JmD4kfF50WRsEiST2gvtg3Bg@mail.gmail.com>
 <cc21a090-801d-4b32-bac2-01cebf896c85@arm.com> <CAAObsKDMhuqYtn=+xR6-n=Uk+5_rU91OqVKyQ5cxhqfTo5svjg@mail.gmail.com>
 <CAPj87rOKGcufM0xB+uMCxhs0SdXCHpViyTd+jQ0+=B1kSihvVw@mail.gmail.com>
In-Reply-To: <CAPj87rOKGcufM0xB+uMCxhs0SdXCHpViyTd+jQ0+=B1kSihvVw@mail.gmail.com>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Thu, 5 Jun 2025 14:57:02 +0200
X-Gmail-Original-Message-ID: <CAAObsKC2UCA2gfcS5M6FHodOGWh-D8_+ia_VJhp5K64wx8F5cA@mail.gmail.com>
X-Gm-Features: AX0GCFvkLrhe0xTjkvrmlzVcmcIDMHbj0V1goAH3SY_Lo_zCTT8XJB_kX_AKtNs
Message-ID: <CAAObsKC2UCA2gfcS5M6FHodOGWh-D8_+ia_VJhp5K64wx8F5cA@mail.gmail.com>
Subject: Re: [PATCH v6 06/10] accel/rocket: Add IOCTL for BO creation
To: Daniel Stone <daniel@fooishbar.org>
Cc: Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, Kever Yang <kever.yang@rock-chips.com>, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 5, 2025 at 2:29=E2=80=AFPM Daniel Stone <daniel@fooishbar.org> =
wrote:
>
> Hey,
>
> On Thu, 5 Jun 2025 at 08:41, Tomeu Vizoso <tomeu@tomeuvizoso.net> wrote:
> > > Indeed if you're using the IOMMU API directly then you need to do you=
r
> > > own address space management either way, so matching bits of process =
VA
> > > space is pretty simple to put on the table.
> >
> > My impression was that the VM_BIND facility is intended for SVM as in
> > OpenCL and maybe Vulkan?
> >
> > Guess my question is, what would such an accelerator driver win by
> > letting userspace manage the address space?
>
> I mean, not a lot gained, but otoh there's also not much to be gained
> by using the kernel's range allocator either, and it saves userspace a
> roundtrip to discover the VA for a BO it just created/mapped?

Oh, I just map on creation and return the VA as an out arg in the
creation ioctl.

So it just seemed the simplest approach, with the least custom code in
the driver.

Cheers,

Tomeu
