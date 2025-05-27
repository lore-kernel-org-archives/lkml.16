Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B7028031C;
	Tue, 27 May 2025 17:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748365953; cv=none; b=ttZVmGpPzn9yWOdAdMSI49QR13dxGLuWKF3eGfwGHM+GceGikHuttlUlJxA5y/3etm+BDNQSfe0mM9oqZbS+nY1qI1lZb39Gk1vfu8rXEuxpAf3x7VuvvnbWA7kw499tK/paEE5KQbwJrNgPmhdaz0FzFpYLJyp/98faEP0MujM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748365953; c=relaxed/simple;
	bh=WUiE6mOkGokIBRawwt92IgfGldTiF8TXF/+mVf5m/OA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZnhqJLS0xGTiDYLUxHMWbEaD+JJxvzEzjbDKuKd7C2SLgsB59e8KoA4BcsSEl/GpYtxvxzgS6DlVENynUtZZMyU19yX5LR5/UHrpk/Xhbe3Xn6vj8RFBR1I3eG+wK7MkJtrAotA5hQtT+8jcflqFZm60l9wpw42TeqApEIWik/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VK6np2KH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VK6np2KH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49EE6C4CEF8;
	Tue, 27 May 2025 17:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748365953;
	bh=WUiE6mOkGokIBRawwt92IgfGldTiF8TXF/+mVf5m/OA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=VK6np2KHaEtjJdmxd5jsELKYx+XF0TAK3SX22xrcVROJu2TxVJ1Zd5Lv0RyqITPeK
	 Gv1sLAibJ52uHX/mtiUNAy8hDLds9us7IB3VN/h3F/I6bEidtQ+ujrRjrHhKGRjvMO
	 1VUcF5yS7FPXXb9mp0r3M/EB0OikLF9juqISLi5kmEiQhiMmLXUDgD6UPxGdlbG+RM
	 12g9F8kJZVpO5l+SCOAufOcn06seqrYnX67KkgkJOI7boxWJRkc3B3zBknheG4OVtN
	 fbdhYayqm9fXJ24zh6+rLdFZo591yVi/fe7ncUF5+eG437iwUwqg6oWGkC9gZgoXnd
	 MLP8krrmVzizg==
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ad52dfe06ceso437845266b.3;
        Tue, 27 May 2025 10:12:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVlPM+zUfQRjZ/+Run0X/FCDCunHqeWzwPKa12b4AyYbsmQcZJoj8sGXlsgoyF/qrvEvuJT87zSFcm6U09a@vger.kernel.org, AJvYcCWuR0eNJOmsIHqtmA2IX+ZP4wik83RjkuPOpeOnLQiUEwvfNQotlVeRAy6s+wwF+fV/0I7J3rJddCUB@vger.kernel.org, AJvYcCXfIZmdq5yq57pc2e9qN3LxQeLHvcf2i4Qr7hT5SgMnQgANpMVYY2mJcCJ8frYiGe84vYlSzWJMcoMI@vger.kernel.org
X-Gm-Message-State: AOJu0YyH+ZN0fv2c8ylzum3292GgXujrdnJ/EvcNtjdGAB7/9Ybd+UQH
	5ye5xu6WRuFaLKN7ZqprlhheNTIzzGQQ2WCJAW2hcrrq5mAOGRbIUEr0juLDFu8kPwVJy1Od6Ja
	1ljDMZXmFmV01Z1o1Z+hnbdUwh9JdGw==
X-Google-Smtp-Source: AGHT+IEj0d2acVTcohj3NhA/pN4kp2Zkm+nnVAoR6tAiRDN91qU4TP+KWNsFVTc7BJ0txLXvs3sXC60T0GPWvmWnF+Y=
X-Received: by 2002:a17:906:c153:b0:ad5:55db:e40d with SMTP id
 a640c23a62f3a-ad85b12060fmr1137001666b.34.1748365951845; Tue, 27 May 2025
 10:12:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250526-b4-k1-dwc3-v3-v4-0-63e4e525e5cb@whut.edu.cn>
 <20250526-b4-k1-dwc3-v3-v4-2-63e4e525e5cb@whut.edu.cn> <20250527-energetic-pink-cricket-a282fd@kuoka>
 <aDWeQfqKfxrgTA__@jean.localdomain> <20250527162539.GA423198-robh@kernel.org> <d855eedf-099f-4396-a79b-ee51b3bf24cb@whut.edu.cn>
In-Reply-To: <d855eedf-099f-4396-a79b-ee51b3bf24cb@whut.edu.cn>
From: Rob Herring <robh@kernel.org>
Date: Tue, 27 May 2025 12:12:20 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKyXBaoYWrAsnyr6ytbvKMA3BaC=CmcgzgNtNvfabnEhg@mail.gmail.com>
X-Gm-Features: AX0GCFsGD9ubX4QqSo6FWt5M75Qo_NKyPFKbJhGfwS1yKHN5rUKKtSNDwBGxVPs
Message-ID: <CAL_JsqKyXBaoYWrAsnyr6ytbvKMA3BaC=CmcgzgNtNvfabnEhg@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] dt-bindings: soc: spacemit: Add K1 MBUS controller
To: Ze Huang <huangze@whut.edu.cn>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 27, 2025 at 11:42=E2=80=AFAM Ze Huang <huangze@whut.edu.cn> wro=
te:
>
> On 5/28/25 12:25 AM, Rob Herring wrote:
> > On Tue, May 27, 2025 at 07:13:05PM +0800, Ze Huang wrote:
> >> On Tue, May 27, 2025 at 08:51:19AM +0200, Krzysztof Kozlowski wrote:
> >>> On Mon, May 26, 2025 at 10:40:18PM GMT, Ze Huang wrote:
> >>>> Some devices on the SpacemiT K1 SoC perform DMA through a memory bus
> >>>> (MBUS) that is not their immediate parent in the device tree. This b=
us
> >>>> uses a different address mapping than the CPU.
> >>>>
> >>>> To express this topology properly, devices are expected to use the
> >>>> interconnects with name "dma-mem" to reference the MBUS controller.
> >>> I don't get it, sorry. Devices performing DMA through foo-bar should =
use
> >>> dmas property for foo-bar DMA controller. Interconnects is not for th=
at.
> >>>
> >> Hi Krzysztof,
> >>
> >> Sorry for not clarifying this earlier - let me provide some context.
> >>
> >> The purpose of this node is to describe the address translation used f=
or DMA
> >> device to memory transactions. I=E2=80=99m using the "interconnects" p=
roperty with the
> >> reserved name "dma-mem" [1] in consumer devices to express this relati=
onship.
> >> The actual translation is handled by the `of_translate_dma_address()` =
[2].
> >> This support was introduced in the series linked in [3].
> >>
> >> This setup is similar to what we see on platforms like Allwinner sun5i=
,
> >> sun8i-r40, and NVIDIA Tegra. [4][5]
> >>
> >> I considered reusing the existing Allwinner MBUS driver and bindings.
> >> However, the Allwinner MBUS includes additional functionality such as
> >> bandwidth monitoring and frequency control - features that are either
> >> absent or undocumented on the SpacemiT K1 SoC.
> > The interconnect binding is for when you have those software controls.
> > If you only have address translation, then 'dma-ranges' in a parent nod=
e
> > is all you need.
> >
> > Rob
>
> Different devices on the SoC may have distinct DMA address translations.
> A common dma-ranges in the parent node may not represent this accurately.

That is solved with different parent bus nodes which would be a more
accurate representation of the h/w. If the address translation is
different then, the devices have to be on different buses.

You can use interconnect binding, but you need to accurately describe
the interconnect provider.

Rob
