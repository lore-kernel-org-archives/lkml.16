Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892861EA7CD;
	Wed, 23 Apr 2025 22:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745446249; cv=none; b=OPUL6VngJzj09Qoli0pAqO/e9mSjonzxQy4Yv/0KFMWr5720bzeWX5HQZ9Hx4Az66P2sa2e6aplktOr+TLRBG26UMlFEjaFPt3ZxmTojnUFPYHrePS/3ssOqhSPoUKHbLqODDGIHE/F7PZyyN7uaZOofoE1M6l/Bq59cpk97t1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745446249; c=relaxed/simple;
	bh=wPVwqfvhDxUSgXQZO2FFZ+5lq0NMHtnmq0FFq5U6Ge8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=po56YX6Uwg5/U6B4TdJQtwUrHfq56y27gmxB9TiYnZWQ0VAurZGHmloSuaKEQivSDpco7xWfoD9ADqo0G98PVHQSgEBRuZnkuj84rsU0A2TWT2chWH+W42Nm6inWL7dBSr5YaKASKjzF+2tWWH2wYC7R/QcDv0UMvhbW7I71bOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F4qcdH3x; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F4qcdH3x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E946C4CEEA;
	Wed, 23 Apr 2025 22:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745446249;
	bh=wPVwqfvhDxUSgXQZO2FFZ+5lq0NMHtnmq0FFq5U6Ge8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=F4qcdH3xGnLjeEH9C3Zc/7LWDd9p0hWCghECiOuc9SXp4kgl/w2NovFQn02Xh9pXT
	 ElELxeG1eWSikAk+zaCQBTqyZm9S8GDuMWcLZp7mt97bbPJ74k8Kkg316rCkSZZrrW
	 JbZUXshm6NJ3HFiKwhFTOKm53RSH8qB+Da+yXO50qcJqBfnOjPZemHFnQ29GkVZCDZ
	 iRvDqSqU+UX/xmoevMT3Ve+IZslU/xtub5ehm582XNPEwn8pvzwJNo1Iv/tj4z525e
	 glS10aZ7JNew1aUrFzhce9yxP69whIq+Zs0BRJZWbUh9ladu/CQLaCff/Rnw2ue6QN
	 WsKxbihOAfrzA==
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5f4d28d9fd8so432892a12.3;
        Wed, 23 Apr 2025 15:10:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU5ofvULFeHMAmxgz9lkwCwncTmAnqe3W1SX5Qj1IfItgWhKkwpGUaLAhbXHW087jSu50ObCjoBrcCIrgr3@vger.kernel.org, AJvYcCXnXHN148TrKofjgjemLwVA7wIE15qywczNxvKz+xj/JY6HD7GF0fVrzN8u0TFu3dR9zq/2j7Oj+5cX@vger.kernel.org
X-Gm-Message-State: AOJu0YzBS/95kxurMyfNrla80ZjY0sxizgvjW/iRA2XMlwHbkoc2ulsm
	XWKut7KvUKk976TPAodPV1ojO6yXqKCjrhnHXzftaapPtTaMagejQ9U8GgMEdemCtj/Lc3ytFHW
	R0xNeaUsZyXjTV/tIsfXetO6/sQ==
X-Google-Smtp-Source: AGHT+IFDXb59jsrSiQWazRzVF6MX1xHN2yOvk09fTJp6+S5+KTTfA8GHRCxZzKpcjOL1zz1Lu7BOyABsSp6K1Ir8yTI=
X-Received: by 2002:a05:6402:42c7:b0:5e0:8c55:50d with SMTP id
 4fb4d7f45d1cf-5f6de69507emr566857a12.14.1745446247615; Wed, 23 Apr 2025
 15:10:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <tencent_BA80A2305727877DEE7BE20655D9CA825B09@qq.com> <a4277fb4-c982-43c7-9f02-e0050eff417a@arm.com>
In-Reply-To: <a4277fb4-c982-43c7-9f02-e0050eff417a@arm.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 23 Apr 2025 17:10:36 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLNq6DcLkJm=vSaGKs0cyup5Y6VpQFOWs+-+KeO0qyVJw@mail.gmail.com>
X-Gm-Features: ATxdqUHIu8UauUnkdGsx_QuCD9-EMRnwcpKGlVgg_eSdye0AL5GO0jXOz7y42po
Message-ID: <CAL_JsqLNq6DcLkJm=vSaGKs0cyup5Y6VpQFOWs+-+KeO0qyVJw@mail.gmail.com>
Subject: Re: [PATCH] of: Build warn for missing fn() in _OF_DECLARE
To: Robin Murphy <robin.murphy@arm.com>
Cc: Liya Huang <1425075683@qq.com>, Saravana Kannan <saravanak@google.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 23, 2025 at 7:18=E2=80=AFAM Robin Murphy <robin.murphy@arm.com>=
 wrote:
>
> On 2025-04-17 2:23 pm, Liya Huang wrote:
> > The function pointer fn() in _OF_DECLARE macro might be NULL. For examp=
le,
> > in __reserved_mem_init_node(), only non-NULL cases are handled, and NUL=
L
> > function pointers are ignored.
> >
> > This patch introduces a check to handle cases where fn() is NULL. If fn=
()
> > is found to be NULL, a warning is issued during compilation to notify
> > developers about the missing function pointer.
> >
> > ---
> > The function pointer fn() in _OF_DECLARE macro might be NULL. For examp=
le,
> > in __reserved_mem_init_node(), only non-NULL cases are handled, and NUL=
L
> > function pointers are ignored.
> >
> > This patch introduces a check to handle cases where fn() is NULL. If fn=
()
> > is found to be NULL, a warning is issued during compilation to notify
> > developers about the missing function pointer.
>
> This patch in -next appears to be responsible for syzbot complaining
> about build errors for some configs:
>
> "
> kernel/dma/coherent.c:410:1: error: static assertion expression is not
> an integral constant expression
> kernel/dma/contiguous.c:497:1: error: static assertion expression is not
> an integral constant expression
> "
>
> https://lore.kernel.org/linux-iommu/6808d00a.050a0220.7184a.0010.GAE@goog=
le.com/

Humm, doesn't seem to repro for me with clang-19.

>
> Also on closer inspection, just outside the diff context we still seem
> to be explicitly anticipating fn being NULL with:
>
>         .data =3D (fn =3D=3D (fn_type)NULL) ? fn : fn

No, that is checking that the function parameters match the defined
type. If fn's type doesn't match fn_type, then you get a compiler
error.

Anyway, dropping it for now.

Rob
