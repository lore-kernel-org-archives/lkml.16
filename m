Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 748FC1DF98D
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 08:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747643266; cv=none; b=PA6I2TyVrxhZvFwcXVEQW/MUvC53J1eyE6rrbNaZGLZ+dW0Y+VUl5zE55oOgiKJXTSLPoXbROs/VSOkaOHa3qKg+P7d+L+YJsFr/hO0Fv7bdbrGC+zkuTxLF9gnDDRnIluORO4excTLfxVN3cZkw7sBV8y0kzNZlUT9ybfnr+js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747643266; c=relaxed/simple;
	bh=YzuTL5ZjRytV9gbcngTNllPmgXbnqrXXFbYoBiXX4mg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fAKn5Qb8yQYqt1VIX+iT8+cjf8Jw5Rl1xUwdXpOHCT/3g9G5yMPeviUdjln4z37rkcNfCvbPqBwYTDh1rM6rxs2a4Ub27OrdpKXlqO56M0wI1Xj/Mvk6NURn8v824bs1mDkAHgXmWi4b9J4SCdIvcnFFsckGxPvodyxNUfAjr1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net; spf=pass smtp.mailfrom=tomeuvizoso.net; dkim=pass (2048-bit key) header.d=tomeuvizoso-net.20230601.gappssmtp.com header.i=@tomeuvizoso-net.20230601.gappssmtp.com header.b=CVI8az7w; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tomeuvizoso-net.20230601.gappssmtp.com header.i=@tomeuvizoso-net.20230601.gappssmtp.com header.b="CVI8az7w"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-70900a80907so34980067b3.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 01:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tomeuvizoso-net.20230601.gappssmtp.com; s=20230601; t=1747643262; x=1748248062; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4gJVXQZr2DoDhEpIvCDqKVNiXWu/eEJnqtIkEs4RMio=;
        b=CVI8az7wemEnPl+I9FC28jPuDCRfruLza93FxPTvS+A9LGehhRGdgL/rzI6IqxEklG
         0mUaq4aJEpHBWaOrnP5Ca3mVpONlcHJFL76NT9g2jqe9tYOmK8CsXxEKrf+9P63mKu9H
         L3AoVcHwC9gTe2aqrYVlfq9ED4zMJe9mmIS9V/f7TlpC0KO6FwgVtE4k8natjhupPw40
         /7xo+nr39xK6RxL5vDxFi2s/WThN7umi0Yuvo1XkJ9nyJD2XpZkn+auoQIdxRNHdcGCI
         6yc9Dw+Jel0s1CXhqXZdhKSXq8C6z+I68jp+iT0Ndf5kWEK1Ba9d4BcUto8fajYM27kN
         qutg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747643262; x=1748248062;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4gJVXQZr2DoDhEpIvCDqKVNiXWu/eEJnqtIkEs4RMio=;
        b=SzSFhoBcCGTsafiXV47PDy47C8z9mR0gl0okgwb+rIpYkNnaVTYqZbUZyGYOQTdoq7
         dU6SzxLUsEcRJ/Alhnf7XsQ0S0FZfXZROhFyWjUAtmtCJH2QGwJbNcKdJTKARVIYNgSg
         ZQXqJH7RwLF/nrkUNOyNlf/SXKbb2tjZziwnfOrKulUL0RR0/HDqwPTXGeajh3hIuxxm
         HGS1uJqj0k0TBK2GwGH4dUVlbu8rhmJ+VGT9GdhKtW5b5C/mJRWs5nke73yTs7CiBhHj
         nMSkWQS72MUztLjz8KYi4BBqANO9GGh353Y8dbF1vjnga0AIt8JRoRJjCkV4iDk4OCMG
         /9oQ==
X-Forwarded-Encrypted: i=1; AJvYcCUAn7a0rWSRjjjK/f6DOurLtBWRViN24a03xouVlyw1yn8NVO/GMPxu0suE8e/HT34fwCVSMQ3Cb5+1Drk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yza0L0NHSJnQsmxaIsWSIbmzHESfySS2JEcWbJrnV6DNqrkt25l
	VvaHqTt5SigqEcVa93vZVBX2I0Kjo6APcVBlnc8d2ChLSl0zUHjvu1uZ405rAImn5Xo=
X-Gm-Gg: ASbGncvfYGxzGF5ZOoretRHwuOVbtnYVBm7fIEMLllFrUGEY2YJNqeh0Zer7wqMYxWh
	+/dDqQSlOb/9O1Sg8Vl9HqNMtTl+N9QBMh6VqYY7YyZoS85zCJOqskm1vQL8Vi4FHN4ilQjAzCh
	lCLND9PjgLgv/lQezUZwnQTKaC53NajpKpaBCfYtQgJTjVz2F+p7N2zjeJI0NoWVRYIMU3WjjRZ
	X724BMBv8o32r8H1dAoZMK/ym2bOGpuxoeBl1ofiCLBJR9kjpRsWl5HWynWnAmqN16HPE6BMLTM
	smrLO2111TqFpeMv5r3ml1RoY++ls1HkuvRXh47Wd8xOcpf+QYIL5BhWgG+d+xF3gOfxygz7MRo
	W0aIwC6eTnJ/CaIJyVzk=
X-Google-Smtp-Source: AGHT+IEHDnj3s7mCUUf6jcBSHHMIvC54rWkCxFAVvt+v8KJymoDRAzIHMNfSVnLVKUfwHwcZTvQfIg==
X-Received: by 2002:a05:690c:8e0b:b0:6fd:97a7:1474 with SMTP id 00721157ae682-70ca7a30020mr160333557b3.11.1747643262408;
        Mon, 19 May 2025 01:27:42 -0700 (PDT)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com. [209.85.219.178])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-70ca82f3c1fsm16832067b3.25.2025.05.19.01.27.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 01:27:42 -0700 (PDT)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e7b85f1cbacso1708530276.3;
        Mon, 19 May 2025 01:27:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUeh47lwT1T2QUu36RCLzOlzYP05eYC31z079Yb9isG99IHBsr1B0u6zFm6FXv453XpfpmYfQYSYNepgFY=@vger.kernel.org, AJvYcCVFwTr6N6LUhpO81z/cwXs+locZgsPYaBQAVHZCzvNGZWjXs1FqwnUSCyb6NtFz4+BntGHNfA/19O5o7QYY@vger.kernel.org, AJvYcCXArrJetTDqMsucB7REUlaf87aFK0Mj2JNU3AxfzNUn0uAQO3w1MP5GkccJFH3cxzRbC+n8VzQzeJki@vger.kernel.org, AJvYcCXS9V7wC0kBwJ5VJWaXrw9MyhjxDm2KogBRq0SPyMrM15pdkFsXkDKDUTB2OnyNhWSq1c4cXBwX5A6d@vger.kernel.org
X-Received: by 2002:a05:6902:e02:b0:e7b:96e0:68e0 with SMTP id
 3f1490d57ef6-e7b96e06d2fmr6708556276.13.1747643262000; Mon, 19 May 2025
 01:27:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250516-6-10-rocket-v3-0-7051ac9225db@tomeuvizoso.net>
 <20250516-6-10-rocket-v3-2-7051ac9225db@tomeuvizoso.net> <4bd79c88-7da5-4bf0-9300-cfdb296c8919@kernel.org>
In-Reply-To: <4bd79c88-7da5-4bf0-9300-cfdb296c8919@kernel.org>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Mon, 19 May 2025 10:27:30 +0200
X-Gmail-Original-Message-ID: <CAAObsKDsO=5uK3BEn6BOgatb+y73jc-Se6mmSbhwG9P_1nVtwg@mail.gmail.com>
X-Gm-Features: AX0GCFuGQeY3CKRDKxmbkhGEJEzp8Ivknwdq0OVtRXBXcahkrM5jAa3oB7F__bY
Message-ID: <CAAObsKDsO=5uK3BEn6BOgatb+y73jc-Se6mmSbhwG9P_1nVtwg@mail.gmail.com>
Subject: Re: [PATCH v3 02/10] arm64: dts: rockchip: Add nodes for NPU and its
 MMU to rk3588s
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Oded Gabbay <ogabbay@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, Jeff Hugo <jeff.hugo@oss.qualcomm.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 19, 2025 at 8:08=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 16/05/2025 18:53, Tomeu Vizoso wrote:
> > See Chapter 36 "RKNN" from the RK3588 TRM (Part 1).
> >
> > This is a derivative of NVIDIA's NVDLA, but with its own front-end
> > processor.
> >
> > The IP is divided in three cores, programmed independently. The first
> > core though is special, requiring to be powered on before any of the
> > others can be used.
> >
> > The IOMMU of the first core is also special in that it has two subunits
> > (read/write?) that need to be programmed in sync.
> >
> > v2:
> > - Have one device for each NPU core (Sebastian Reichel)
> > - Have one device for each IOMMU (Sebastian Reichel)
> > - Correctly sort nodes (Diederik de Haas)
> > - Add rockchip,iommu compatible to IOMMU nodes (Sebastian Reichel)
> >
> > v3:
> > - Adapt to a split of the register block in the DT bindings (Nicolas
> >   Frattaroli)
> >
> > Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
> > ---
> >  arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 85 +++++++++++++++++++=
++++++++
> >  1 file changed, 85 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64=
/boot/dts/rockchip/rk3588-base.dtsi
> > index 1e18ad93ba0ebdad31642b88ff0f90ef4e8dc76f..7b961ab838212fad8e4a703=
90fdc917a828433a9 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
> > +++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
> > @@ -1136,6 +1136,91 @@ power-domain@RK3588_PD_SDMMC {
> >               };
> >       };
> >
> > +     rknn_core_top: npu-core@fdab0000 {
>
> npu@
>
> > +             compatible =3D "rockchip,rk3588-rknn-core-top", "rockchip=
,rknn-core-top";
>
> You never tested this. Test before sending instead of relying on us or
> after merging.

Can you please extend on this? I have tested this series before
sending and I don't understand what you mean here.

Thanks,

Tomeu
