Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 456E3285C9F
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 13:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750080188; cv=none; b=TM6paEheK6kTxI4Py1HCXIRESXu45H0R2htVCxL4AykvCPUtFQyP9+Dp68hx8JhB2jQyVxW0rWLcOYkY2goHH2oXmyn4ydXeLC7KBTcx2SIIGE21ykMRenFY4trLef6MNKOOjgbV++cfAHSBvDiCHGdWIugtTmrvGOWcDDh5JnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750080188; c=relaxed/simple;
	bh=KCD5428E2V4OWj4bxH6DMumzOTk0rgOlJJTO5eLsA3E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bh2C/6T1QWyUXXm7JF4tdRJUJhYCCb8NhxiIpVWCgOx0kthK7NEzjjLzVbA783Kh7kGKo2HhAojTpdIAC4GtfKrTqgXpWZnjh2G5Fff/Stc5hgOvip9DjolvUrSIovG9pz8IVlRONg9dPRHxkY1wGRg3OGmS3Up+XpvGy5w39Ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Q/6P2ggl; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Q/6P2ggl"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-32b2f5d91c8so36333991fa.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 06:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750080184; x=1750684984; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QPiIwXPnB/QPRp9lTZSU0TIMgfDz8msjPC5y3Zu6Zog=;
        b=Q/6P2gglNhFX5JSn/TNYE4WC/y4jwf+pWVN1Lu4HiwbgF5ULtY009pZEG/m1pgfsr5
         j7XuoFzua6NKkNS+QmxHGrFBKXCI5QPYt5xzT5retPkHNd03RUtN+vCzD2y/zee5xkyc
         /jxu0YcIh6GustVWC5FflYDCJCqyeLquzdyJk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750080184; x=1750684984;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QPiIwXPnB/QPRp9lTZSU0TIMgfDz8msjPC5y3Zu6Zog=;
        b=jKO2+C6jzWv04ZoEDFuo6Zlc9JfCOGlrxYnuUk/19BRzr8j54eYZiPSKLoB8b0e4m9
         XJIjCnJdbqPXTyYMjs5YZkZiso3FmnJ8s+XZGsuS3rsBugAwhetvQdb//XVyw9/yY666
         9hhVjWjnpYbhVyFZHTeUfv7ptY/HprSPjCb0L8J+pF1dFkaEtKDe2VwlX8489SOofou6
         eg3ROwf8CGTJOGHPbLSR9YkSrkWaxPcLwppSw5Tyb+l4jWD9udT2nxY1ThDcAKZRRgln
         DO5YUcx+sX6D7+a5sgAfnoKLz6fU+HW+i98phdqLKu34hhbv1+F9dg04klXZFQCIUUNi
         Wk8A==
X-Forwarded-Encrypted: i=1; AJvYcCUzhct3hgYuei90Hae+/RDjUsRZTdh0Iyk6jO8swymy75rNX22UsyD2epYSe51Cmn1EmqMoOvTJCqdJegY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIRw/+cJKejfFKZjHHOX7kV4VCB/Xr+LTQiGQw/FOtPeEtM1MY
	vJ93nX65GmgX2Jd3szON64oWBAr7BQftVygZ0Mkie1k97QO0gvouKH4jFIzqYIPssovPTRyaMj4
	e8fE=
X-Gm-Gg: ASbGncvR1uZ2q4fRA3R5K8zE6uAl2TfRXe5gtr0kmyidjcTMThxE332Uy/ObVetL7KD
	m4kgQhPaRH3bN5lVa/BwnwvKaWdWV6SZm4h2KFjjDKCOJrdQ1G5gNPziLhveEi3KRiVaMf309Z/
	uBMJESQ33YCxznXF0x7djGKuO0w3rX/5DMZhB8Ch0PAgyDuE5/MaBQt97LkYr3yEgPPSbPi19vS
	8ZTjq7q6NN7CKXp+M1o+ffV6KdRWufIivM3ZAz9uxaeBNbI5vX30Mwx1nARFwQ7ZZh0kNraxh4i
	FmOesUtAnkB1V8b0UXOZu0gtJtxQ6Pzjwj8CZktFD9wr4idqrnudVtxNymlSyoGMduFvWif3cqq
	EYaG9av993BpThMDpesK/LbK2N4JDfQL4L+4=
X-Google-Smtp-Source: AGHT+IHI25Lmv6QNsScKcnkP/rp8EsU0TtGI6aL9qL16iPxNpB9wmIHh/n47hh6ryqzgLejzDstuYg==
X-Received: by 2002:a05:651c:a0b:b0:32a:6eea:5c35 with SMTP id 38308e7fff4ca-32b4a2ff940mr19804101fa.15.1750080184022;
        Mon, 16 Jun 2025 06:23:04 -0700 (PDT)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com. [209.85.167.51])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32b331ca96asm15922441fa.101.2025.06.16.06.23.03
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 06:23:03 -0700 (PDT)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-553b82f3767so2069931e87.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 06:23:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUq4LFYU1zlQJZk4WCW7bUAtGBtbmFdgU0J6zYEMifQckDyzhS7dATaQu1bqpqidcfaDTL/3sevHPQqWQ0=@vger.kernel.org
X-Received: by 2002:a05:6512:1150:b0:553:2a0f:d3d4 with SMTP id
 2adb3069b0e04-553b6f4268dmr1908878e87.49.1750080183070; Mon, 16 Jun 2025
 06:23:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250429-keep-sorted-v1-0-2fa3538c0315@chromium.org> <f9275079-842a-406e-8bb7-b22a22b7c7e6@kernel.org>
In-Reply-To: <f9275079-842a-406e-8bb7-b22a22b7c7e6@kernel.org>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 16 Jun 2025 15:22:49 +0200
X-Gmail-Original-Message-ID: <CANiDSCt18PUWo2Z-9T2nBMMJfpRcdAGhO5S0jE85-1ZPO1qD7g@mail.gmail.com>
X-Gm-Features: AX0GCFuqWLgUehzKJAibYIjgFF6eDhR6nU8vRFEBGE8EDAHBKBOg2zBL7WW-dyc
Message-ID: <CANiDSCt18PUWo2Z-9T2nBMMJfpRcdAGhO5S0jE85-1ZPO1qD7g@mail.gmail.com>
Subject: Re: [PATCH 0/2] media: uvcvideo: Enable keep-sorted
To: Hans de Goede <hansg@kernel.org>, Hans Verkuil <hans@jjverkuil.nl>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hdegoede@redhat.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Hans

On Mon, 16 Jun 2025 at 15:05, Hans de Goede <hansg@kernel.org> wrote:
>
> Hi Ricardo,
>
> On 29-Apr-25 15:47, Ricardo Ribalda wrote:
> > When committers contribute quirks to the uvc driver, they usually add
> > them out of order.
> >
> > We can automatically validate that their follow our guidelines with the
> > use of keep-sorted.
> >
> > This patchset adds support for keep-sorted in the uvc driver. The two
> > patches can be squashed if needed.
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>
> I've no objections against these 2 patches, but these need to be
> rebased on top of the latest uvc/for-next. Can you send out a new
> version please ?

I was waiting for HansV to say that keep-sorted was useful and then
add it to the CI.

Right now it is probably just useful for the Makefiles and uvc.

>
> Also for patch 2/2 can we not just add the 2 keep-sorted headers
> and then actually run keep-sorted to auto-fix things ?

Do you mean removing the annotation after running keep-sorted?

We can do that, but we will be unsorted again in the future after N
patches unless we add it to CI.

If we do not handle this automatically I do not think that there is
much point on this series.


Thanks for looking into it anyway :)

>
> Or can it not auto-fix ?
>
> Regards,
>
> Hans
>
>
>
> > ---
> > Ricardo Ribalda (2):
> >       media: uvcvideo: Rewrite uvc_ids for keep-sorted.
> >       media: uvcvideo: Add keep-sorted statement and sort uvc_ids
> >
> >  drivers/media/usb/uvc/uvc_driver.c | 660 +++++++++++++++++++++++--------------
> >  1 file changed, 409 insertions(+), 251 deletions(-)
> > ---
> > base-commit: 398a1b33f1479af35ca915c5efc9b00d6204f8fa
> > change-id: 20250429-keep-sorted-2ac6f4796726
> >
> > Best regards,
>


-- 
Ricardo Ribalda
