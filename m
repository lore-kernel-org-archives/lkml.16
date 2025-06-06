Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D371E3772
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 06:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749190919; cv=none; b=Uh96QJ69pJvowo844HbW3z93VXtppb6rtEvztKWzTr7DTneHsIdN9VBhIJPRbAgww6v46vnLAKliaCSNpkT32Z9HLKA5S5dq8XTd00ThRjDwH41fRfmK/xYz23IxlI76X+LaqQwZatqREy2PS5W0UjD1xG7veG6Taai+8gyo3no=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749190919; c=relaxed/simple;
	bh=/hhxPKyV8c7R5WACfSoGjG5FxM2Pcy7H7mzTrEBAWvs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RJ8/yL6H1bsGtcV0p6A6RmWNYu32cfaAC0xQaMvXTLhl6njlYjiv0b0Tb3Y6syZV7zocDpD+WN+oeQfhqu44R2U7AxPdczYI/eW1/dN60nZ6mv+eVdsK10nz46F4daE99yZ/Xqja75Fm3jJlh4af7/NWFbqRQ21rjsLhkQj5Pf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HQnMGtUW; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HQnMGtUW"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4a44b9b2af8so11171071cf.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 23:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749190916; x=1749795716; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vsBMtfbagVpHr2dWUudDAezMnERXc8jN5mmlbFaIuMI=;
        b=HQnMGtUWRNYW1Ra+BlcGaVdvg3UN7hXU48xL1tKnCfy8Wu40BoOlcY5JO9nRvwgwar
         vxdP8729uX5+STQi0/R9dXt1XF4PByR2A9ngmhQHieqBClyeNykPXtpV1fwv0xJ9m3CR
         IImLRbdpqZjxAkJmfQ+cDgo7BzOwniwiHEbcXqqlnt/HmdAAnlDVKQrhMa00u9LrG7qG
         ovuheDUXiXracDuD34K+5MVvbIkYGTWqf+f4Vz61qFy3gDsMI9HUAjmkk8mmQt3Kx7Vq
         TIHbRXxiLlgPs3AfY9/901/4Jviiu3ZNwdcJyVqc4LNGbfwHtLv7Ur3GaTPKlFHoBH6M
         5zqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749190916; x=1749795716;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vsBMtfbagVpHr2dWUudDAezMnERXc8jN5mmlbFaIuMI=;
        b=fTSMOs5k4PqAkA0f66JhSuKQwhwmajznGxPEd5PhsF8sRP2RJpOUZ0ON9iJ5Q+zXyp
         WxF/g6AVyUAiuu9MioSQrOhOWFO5tRnxEXleh9ADzVCzivDrR37a519kf47dxebeJ+Dg
         sSehIDxAwNJ1Aw1YEDoxFv9QphXGfjkAOwn4ct0ZnpIcifCDWCfDU24XvlPLNSzrYNFV
         muJY8W3DA84YJduCEJovQ7Eyct2GGx/tW3zSrhfyl/NtYswvGUUkel4duf9pk60xzKWt
         6nMQNw9O7SSCCohyxR7JKfViLOo+FFsgAA5l9CjGWYhNKLKz8PPyPivLvlN8pRN5L07z
         pg+g==
X-Forwarded-Encrypted: i=1; AJvYcCVHCHdQwdJZjVEXZ2lGMjNVxV+dvis8eCWvlfpEWPwaCbxgCQVp1Xebiqo4s72AIznu50KiefcIS2c2ndg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsKS03p03hXvEDJ/Kp5q/2zStPOpcm1y7sTGByrWO9BHz47unP
	aGSK2pDatI1EeyVT+o0IAwwpN2ZWI4KfeFKrcMSRri4R5tgF9pMFjgsvBmq0BmMJPkD8DjnCHBt
	0essVFfqrdf98DVf895p7S19DzlnEKBwEk+RLv306
X-Gm-Gg: ASbGncv+zeTSQqXOi3QeRDU8rqalzYXugbPOFXIyFcr3bKe8r26Z/z7MmOn3QAmhKp1
	FZoBwbfdj9UwjRRbfekfe3rPF6rL+SrDy/UhM0DkrZj9dWm+JbjUYVqbx5SL2n4Pm/iC1RPnvdO
	Z5XFpd8V78fdAiAebNWMfy9mjrluie052+/x1wskysQZdgf4TDPt27zBOdzzLcC2eBKP6roTTc
X-Google-Smtp-Source: AGHT+IHSnKSNTajMIDeaip5sd8sIZfLqFKnW5zqtsvkLtQLXGTWBXvW+v3e338cE6mS/LSFh7KNJ0hL2rtVDd3KBbrg=
X-Received: by 2002:a05:622a:488a:b0:4a5:afa8:b3f with SMTP id
 d75a77b69052e-4a5b9a052b9mr43763231cf.3.1749190916414; Thu, 05 Jun 2025
 23:21:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250606052301.810338-1-suleiman@google.com> <20250606053650.863215-1-suleiman@google.com>
 <2025060650-detached-boozy-8716@gregkh> <CABCjUKA-ghX8MHPai5mfC4dZgS8pxi3LAvh3Wnm0VCt4QmU2Hw@mail.gmail.com>
 <2025060620-stainless-unedited-ddfc@gregkh>
In-Reply-To: <2025060620-stainless-unedited-ddfc@gregkh>
From: Suleiman Souhlal <suleiman@google.com>
Date: Fri, 6 Jun 2025 15:21:45 +0900
X-Gm-Features: AX0GCFvRUMvIRxLmq81-oToKmXjpNnaQGe54t1cYDvCDvW8q6W4X7-0XyGhmifI
Message-ID: <CABCjUKB4OgQoGv+Eg7q3zmJXXw8dWfEo_AP-XfzxHDoodtxhXg@mail.gmail.com>
Subject: Re: [RESEND][PATCH] tools/resolve_btfids: Fix build when cross
 compiling kernel with clang.
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, Ian Rogers <irogers@google.com>, 
	ssouhlal@freebsd.org, bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 6, 2025 at 3:20=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org>=
 wrote:
>
> On Fri, Jun 06, 2025 at 03:08:09PM +0900, Suleiman Souhlal wrote:
> > On Fri, Jun 6, 2025 at 3:05=E2=80=AFPM Greg KH <gregkh@linuxfoundation.=
org> wrote:
> > >
> > > On Fri, Jun 06, 2025 at 02:36:50PM +0900, Suleiman Souhlal wrote:
> > > > When cross compiling the kernel with clang, we need to override
> > > > CLANG_CROSS_FLAGS when preparing the step libraries for
> > > > resolve_btfids.
> > > >
> > > > Prior to commit d1d096312176 ("tools: fix annoying "mkdir -p ..." l=
ogs
> > > > when building tools in parallel"), MAKEFLAGS would have been set to=
 a
> > > > value that wouldn't set a value for CLANG_CROSS_FLAGS, hiding the
> > > > fact that we weren't properly overriding it.
> > > >
> > > > Cc: stable@vger.kernel.org
> > > > Fixes: 56a2df7615fa ("tools/resolve_btfids: Compile resolve_btfids =
as host program")
> > > > Signed-off-by: Suleiman Souhlal <suleiman@google.com>
> > > > ---
> > > >  tools/bpf/resolve_btfids/Makefile | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > You forgot to say why this is a resend :(
> >
> > I wasn't sure how to say it. It didn't occur to me that I could have
> > replied to it with the reason.
>
> That goes below the --- line and it would be a v2, not a RESEND as you
> changed something:
>
> > It was because I had "Signed-of-by:" instead of "Signed-off-by:".
>
> Which means it was not identical to the first version (a RESEND means a
> maintainer can take either as they are the same).

Ah. Should I resend it as a v2?

Thanks,
-- Suleiman
