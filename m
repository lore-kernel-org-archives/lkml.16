Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A78726F44C
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 10:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747649193; cv=none; b=cdkbjsdG9ZxFz4STp1guEIrSP/fGj60JMEMbZDPPdl/iVVGmO+2KYiJVKKcKZM2QTE9TBvX4MrLGxfqsg6icyakNwcRFfd5fVXYVi1brYQ0Ews5AgNTvs4sphYh1NH4/L77Z6P+rGehiJJ8G0MUh7foUl0PiBguRQaHGrP6/Urc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747649193; c=relaxed/simple;
	bh=LXOL75HJcVW91LAW/oQlrCx83jkr4WoGgXP/PF+1LnY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U/tR8DEohqZ/A+0RbZjK0bn3XFOEvBvaXb4ehNdN53uP5gEWowb+ZmWQuluQdCMF7ne0Q7fYJ0MFH8SppHj8gO2nUC7Azlo3cupGJBI65eA/Z9SudpQb5/VEA9djrCS++hr7K1QYzjo9Sbkk8cbyTXIBGp2zq/I+1nCmCo3NeLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net; spf=pass smtp.mailfrom=tomeuvizoso.net; dkim=pass (2048-bit key) header.d=tomeuvizoso-net.20230601.gappssmtp.com header.i=@tomeuvizoso-net.20230601.gappssmtp.com header.b=hJIo0qZU; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tomeuvizoso-net.20230601.gappssmtp.com header.i=@tomeuvizoso-net.20230601.gappssmtp.com header.b="hJIo0qZU"
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e7ba2583e10so612562276.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 03:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tomeuvizoso-net.20230601.gappssmtp.com; s=20230601; t=1747649190; x=1748253990; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LXJkgQZKayvXnZ1xyIN8JI1rxZodq0P8Qo6H5Ts8U1A=;
        b=hJIo0qZUgqzEzrYcq5t6Scv6aDfWKEG34N3C/+KcEuuafsfF7qZHuKIGtqyKeX9t9X
         s8UC9crzXYaB6WD/GpDWPu4j16AR+yDivy3Cpk1K/I/fa0KQreq7uUq6xjtzeLtBbOhV
         L/8xSQfx1/71LgE7i9xrrTFYtjssc/G5yIbaYTy34raqYgpe0+4YMSRG7PCp7J6UnCUP
         hvhu9FSEehWQrYfAoYpSQRNV0uq44ZGAJOqjUDWz1pqJM7OSywBVAUvnuUHt89W9UZoi
         wnC3l2dR01p7t8gNx6VKCCexRv7Xk5BDapnYnNqhe4q5Q4b+EShDhQq++gMAXfeQOc1C
         hTfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747649190; x=1748253990;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LXJkgQZKayvXnZ1xyIN8JI1rxZodq0P8Qo6H5Ts8U1A=;
        b=A/7oENm0CaO6BU38b5Vi7R1VdkWOXwxDlFL2G3As5K0ICmszMgh77YUwxyFcqTuntT
         ktuAP2SL/BFG1lQR6UyV1OyEA96NWhEqhFvkyHKezvaDg9H6W0xINal2HQd7SlI9RPW3
         phnKmKjIiRjNpIKkDYSiIb0FGfcQcRH8Qpjft37nDdIUbSO0fWfJjp+ZKYNHP6Uc7ACV
         akFZPQCLVQ6whvj6RF5pk+GPnJW6vRqbb/Sl/r8PNuRb1FO4E+FgZQe6Wr8onuYfp2X4
         CACtJ/1JTdd/STCcBJsJjDEjmYjaSzdM1ZCNe8pSREhRSezhsoWVdgpj8lkvZaWcbXa2
         pNoA==
X-Forwarded-Encrypted: i=1; AJvYcCV5/ykWjqmTieX0O9VylriTS7vI2Al109thy+LkHB1bWOHd/MWb5tzqQJsTyXM9eQnaYlfsSKKAacZ62Zk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzowIp4+SGxzGHclfnRWFXDqEJizZSms4KvBzxK83YbLCxU+meW
	XeeT78XGGMcEirvF3Tk8ABN8+rsJJEmo4PO1Vhv4Mm/x17FDXZzZqauq7gTbbKoTHug=
X-Gm-Gg: ASbGnct2nHmDkeA2X05If4ajfWyIPB7H9EONNcNpxsIkKVxk4zxTp5XvXnPuZ8awxPg
	y1V9npQHTzv74IXpomU0w6UL73RyLtUL/bHUcyRvUe/4UdxdkCaayyrG41y9ZiP909AzOEo2DGs
	icHsz288u+FvHLkftubOl20cULRZRi6xLLoMizp8CNu/V6axw/atx2dsubORBvYUhMPgbbgEqwM
	DTsnnyQ7Dqo9W7s69tOzwTSW9u6lm6Koq1EEZRH7XoGxPbFL9dqZeT7vq6x98JhGB9NmCNXw1/b
	1RFxES7k4R9q2b6L759yt7nsZ6bPyuViUtFE7dR4PEh1r8aTSmHJl0QnWtpXbIy6iyEeMVBTjXL
	I1yiD//sAZn/ENw82QZMh+b0a3wFdBA==
X-Google-Smtp-Source: AGHT+IHk3NhST4ivdz/T+xe5V4VnGkGxuajgXMEkob/dZaZlEjOROKbrgHnuEaTAM+w53ttXkW+s3w==
X-Received: by 2002:a05:6902:990:b0:e7b:30ef:fcb8 with SMTP id 3f1490d57ef6-e7b6b18d15amr14044040276.14.1747649189866;
        Mon, 19 May 2025 03:06:29 -0700 (PDT)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com. [209.85.219.179])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e7b7b083448sm2329071276.29.2025.05.19.03.06.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 03:06:29 -0700 (PDT)
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e7ba2583e10so612552276.0;
        Mon, 19 May 2025 03:06:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUKydI0iOlXCSO9l+WllAbTXdZBD8pVNZVTUTuprJ8oqisYiat6MgdLheNKk//ugtRTksD6Ia/czcWX@vger.kernel.org, AJvYcCUqXjK0clcldzcFpHtuKl7tANiacVQr54Z0uEQ49jtIl+hpjFfMVneMkMyPDavZg8lwX4TFd6hJXoXNn7w=@vger.kernel.org, AJvYcCV/pOeWFpfW243p+l555XQgJ9q8CzKdgj9iht7I9+bEVnPTntEylA2qllbqNNRhC06/6qT+e31BU4kLeJCw@vger.kernel.org, AJvYcCVH6xHtQ1bRDAFsxQhgNnNqcuijO15kXpsomGVxdbSJE59XFW1Goi+ZC8sM3lAc05mGokIdu5AwZMNO@vger.kernel.org
X-Received: by 2002:a05:6902:e12:b0:e78:f538:1c54 with SMTP id
 3f1490d57ef6-e7b4f7de9a7mr24227419276.4.1747649189461; Mon, 19 May 2025
 03:06:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250516-6-10-rocket-v3-0-7051ac9225db@tomeuvizoso.net>
 <20250516-6-10-rocket-v3-2-7051ac9225db@tomeuvizoso.net> <4bd79c88-7da5-4bf0-9300-cfdb296c8919@kernel.org>
 <CAAObsKDsO=5uK3BEn6BOgatb+y73jc-Se6mmSbhwG9P_1nVtwg@mail.gmail.com> <f8cf2c4e-0ae2-4799-bda8-654b4f515846@kernel.org>
In-Reply-To: <f8cf2c4e-0ae2-4799-bda8-654b4f515846@kernel.org>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Mon, 19 May 2025 12:06:18 +0200
X-Gmail-Original-Message-ID: <CAAObsKD_KUA29-FFGkCDifYJjaNnAbh9uZn25pWmVETSm10CTQ@mail.gmail.com>
X-Gm-Features: AX0GCFuVYFfDeK4R2yep7GIQJ3UmyiYoSLOyKg2oKJC5rUcszB1QB3rVi5LfFuQ
Message-ID: <CAAObsKD_KUA29-FFGkCDifYJjaNnAbh9uZn25pWmVETSm10CTQ@mail.gmail.com>
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

On Mon, May 19, 2025 at 10:47=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On 19/05/2025 10:27, Tomeu Vizoso wrote:
> > On Mon, May 19, 2025 at 8:08=E2=80=AFAM Krzysztof Kozlowski <krzk@kerne=
l.org> wrote:
> >>
> >> On 16/05/2025 18:53, Tomeu Vizoso wrote:
> >>> See Chapter 36 "RKNN" from the RK3588 TRM (Part 1).
> >>>
> >>> This is a derivative of NVIDIA's NVDLA, but with its own front-end
> >>> processor.
> >>>
> >>> The IP is divided in three cores, programmed independently. The first
> >>> core though is special, requiring to be powered on before any of the
> >>> others can be used.
> >>>
> >>> The IOMMU of the first core is also special in that it has two subuni=
ts
> >>> (read/write?) that need to be programmed in sync.
> >>>
> >>> v2:
> >>> - Have one device for each NPU core (Sebastian Reichel)
> >>> - Have one device for each IOMMU (Sebastian Reichel)
> >>> - Correctly sort nodes (Diederik de Haas)
> >>> - Add rockchip,iommu compatible to IOMMU nodes (Sebastian Reichel)
> >>>
> >>> v3:
> >>> - Adapt to a split of the register block in the DT bindings (Nicolas
> >>>   Frattaroli)
> >>>
> >>> Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
> >>> ---
> >>>  arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 85 +++++++++++++++++=
++++++++++
> >>>  1 file changed, 85 insertions(+)
> >>>
> >>> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm=
64/boot/dts/rockchip/rk3588-base.dtsi
> >>> index 1e18ad93ba0ebdad31642b88ff0f90ef4e8dc76f..7b961ab838212fad8e4a7=
0390fdc917a828433a9 100644
> >>> --- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
> >>> +++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
> >>> @@ -1136,6 +1136,91 @@ power-domain@RK3588_PD_SDMMC {
> >>>               };
> >>>       };
> >>>
> >>> +     rknn_core_top: npu-core@fdab0000 {
> >>
> >> npu@
> >>
> >>> +             compatible =3D "rockchip,rk3588-rknn-core-top", "rockch=
ip,rknn-core-top";
> >>
> >> You never tested this. Test before sending instead of relying on us or
> >> after merging.
> >
> > Can you please extend on this? I have tested this series before
> > sending and I don't understand what you mean here.
>
> I mean exactly that: it was not tested, because warnings are clearly
> visible/expected. I also found now Rob's report which even shows you the
> warnings, so how come you still claim this was tested?

Ah yes, I'm working on those warnings. I understood you as saying that
the code hadn't been run and tested that it works correctly (I do have
a test suite that I run as part of my testing).

Regards,

Tomeu
