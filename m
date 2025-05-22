Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AC4019ADBF
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 18:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747936984; cv=none; b=q4UeKhJ+dxWUP1FeL0owtQzOs241ptF5lTYdWNG4HQCbwu/E1OoecxSvWFXlaBUQeznLRCa6nVqV7KP6PhwmWesihl2c7M3tL72mU6F0hsu85gESqSEga85E5M775/pXyEZCf+Od2e8UPWxGc5JwcXNIMJ8Nhcf2wN5ohMRmCNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747936984; c=relaxed/simple;
	bh=FxxX0vUJtKaNXqzLdoqggeCYHolCl4yYnO/ZhwccBfg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=H+VdiiOxT64FdlMHSC6x3eDRuDp3BRpW7CVWa2JWUVM81mzqEma5ssDJQPhQeWjzHvGRAPy2EvGpF0QGW4XVmIWJauF1CyJNfuRzCP03Heoo5bwMuBEaOgbBCcCgR8AtIFH/fZuMPJoB7rkiSUjPE9X5OoOvJrIB2DBixPIxqH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=oh9YootI; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="oh9YootI"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7c55500cf80so697180685a.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 11:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1747936982; x=1748541782; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=J/udtId/XxzUAgerzFd20anDTdLUkEu2nN7uwbduy4g=;
        b=oh9YootIbWnH8SMykgh6BWZEzVgesUrH2Ho0VNkUAcUNLj1Yhl8iWMUHRliFvWUpuy
         8PvUSME4aSfj1KLSivcB3HMw9dbOZ6EW39KqyIf5OFNMNZrV+Q4tQwjtRnNpSexsVwi+
         8xA8y3cO4hipcEC/hkCpPR7ro6hmDiHbLsTo5z6qu9lU3AHOll0SXjn2YkxET1ejUOHm
         LFT666MyneQv6QpOMSLcbra1Fj8Kfuc9j8eeqqKiR3GGmosCWtfdlxpd/Kawb+4nXEXD
         BERGxsqQiU59hmeoZuhzB4KoGXeRtQNtjdhugNh9fJwrI3MzR4LNt1TPdzYMaRBqXliY
         hRnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747936982; x=1748541782;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J/udtId/XxzUAgerzFd20anDTdLUkEu2nN7uwbduy4g=;
        b=BX4Z1vPY5PE267YtIRo1j4kxkXvt1zJI69IbWNYcW8p2s6HcraN5QNdxBz82pv3kj0
         sj14VCH1OhOqpM+0dm8gGcLEETRQ620pkn11cyS0x31cacQ/y47mu91dtHOXkI8nfCht
         U0o4QxC/GUdndn4Dyl7ouadgChX+UNA2qro8c0hpB7CMB2nK1xRAiQgIqCZhuTw2tfNb
         XFX6adx+h0/5mhHKC5hBcd+6rnMyr/7lgsPbnTRbGUL43PTndj0jMIKSy3PyMu7/d7H1
         ZJxz7K5awq/TvsbxXRDJ2N4StBeCyDxd1dSjRUhMWxRPQLL11BfZuwKT5XeoSEUI6qz2
         4x9A==
X-Forwarded-Encrypted: i=1; AJvYcCUD1xDxywzAeQAajxXRdSz5SCUNR4bZD10HBtl/DdpfdcbXxT9KZY/5W+LyPqEg0TrCWjVQ6md35Djq8L0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4WYqVLWDMIF38UIsCc/7+TmJxLGrXIG6zZWK9jlfGfav/Vt3G
	sZOMCKcp3egn1ID+R4QsqvhD8JjFyU+0TjPCjXsvBNbW0hHWOVDsgtvXSLHq538hrmc=
X-Gm-Gg: ASbGncs3pe5GYzhtKU6BTpwfL2P58UTsVjrkfMNMrndbeI4jQgiovCZuHq/17CY3FET
	G0AIetEnuWuJNOoqmrGVllRUFbnjgKdex/BkXgoJFrR44tdXM5K5LGfjTgH/pFuHYV1WZMP8gS+
	nqSi1x0HpZwFLA1AdHodsKBKTi5fewyefLQIx9rKveZ9Cldo7zoOanxrAcG266hIbgUCp+txVaz
	+oKPOKIbHr/Hb3XCH3BocBJ0wybX51NKWpK2PjTjoLtuKRH0nkD4aCzB0BdUBpgMr6MAZiEXqqZ
	Vlea39DtNbKAWqGolhD/w9s0gjqbBPdksuQmvVfQZlVynbDo2fOOokMlgIjyvBmoLVM=
X-Google-Smtp-Source: AGHT+IHh4iw4dgUV3S3EY22uzVTY0YQII61ellrTPDPBr9fV911fwzk1oNA0AI/vndoigz6Eq9Za+A==
X-Received: by 2002:a05:620a:d8d:b0:7c5:60c7:339 with SMTP id af79cd13be357-7cd46718a88mr4026950085a.9.1747936981809;
        Thu, 22 May 2025 11:03:01 -0700 (PDT)
Received: from ?IPv6:2606:6d00:17:b2fc::5ac? ([2606:6d00:17:b2fc::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd468b62ecsm1052642185a.82.2025.05.22.11.03.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 11:03:01 -0700 (PDT)
Message-ID: <0c261c9aad759d791e0a576a47bbd064f28148e9.camel@ndufresne.ca>
Subject: Re: [PATCH v3 01/10] dt-bindings: npu: rockchip,rknn: Add bindings
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: "Rob Herring (Arm)" <robh@kernel.org>, Tomeu Vizoso
 <tomeu@tomeuvizoso.net>
Cc: David Airlie <airlied@gmail.com>, devicetree@vger.kernel.org, Thomas
 Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>,
 linux-kernel@vger.kernel.org,  Conor Dooley <conor+dt@kernel.org>, Oded
 Gabbay <ogabbay@kernel.org>, Maarten Lankhorst	
 <maarten.lankhorst@linux.intel.com>, Jonathan Corbet <corbet@lwn.net>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 Christian =?ISO-8859-1?Q?K=F6nig?=	 <christian.koenig@amd.com>, Jeff Hugo
 <jeff.hugo@oss.qualcomm.com>, Sumit Semwal <sumit.semwal@linaro.org>, Heiko
 Stuebner <heiko@sntech.de>, Krzysztof Kozlowski	 <krzk+dt@kernel.org>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,  Simona Vetter
 <simona@ffwll.ch>, linux-rockchip@lists.infradead.org,
 linux-doc@vger.kernel.org
Date: Thu, 22 May 2025 14:03:00 -0400
In-Reply-To: <174742024812.3649303.12389396177218408388.robh@kernel.org>
References: <20250516-6-10-rocket-v3-0-7051ac9225db@tomeuvizoso.net>
	 <20250516-6-10-rocket-v3-1-7051ac9225db@tomeuvizoso.net>
	 <174742024812.3649303.12389396177218408388.robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 (3.56.1-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Rob,


Le lundi 19 mai 2025 =C3=A0 06:35 -0500, Rob Herring (Arm) a =C3=A9crit=C2=
=A0:
>=20
> On Fri, 16 May 2025 18:53:15 +0200, Tomeu Vizoso wrote:
> > Add the bindings for the Neural Processing Unit IP from Rockchip.
> >=20
> > v2:
> > - Adapt to new node structure (one node per core, each with its own
> > =C2=A0 IOMMU)
> > - Several misc. fixes from Sebastian Reichel
> >=20
> > v3:
> > - Split register block in its constituent subblocks, and only require
> > =C2=A0 the ones that the kernel would ever use (Nicolas Frattaroli)
> > - Group supplies (Rob Herring)
> > - Explain the way in which the top core is special (Rob Herring)
> >=20
> > Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
> > Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> > ---
> > =C2=A0.../bindings/npu/rockchip,rknn-core.yaml=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 162 +++++++++++++++++++++
> > =C2=A01 file changed, 162 insertions(+)
> >=20
>=20
> My bot found errors running 'make dt_binding_check' on your patch:

Yes, and it found and reported it 25 times, can you fix it please ?

Nicolas

>=20
> yamllint warnings/errors:
>=20
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/n=
pu/rockchip,rknn-core.yaml: properties:reg-
> names: 'oneOf' conditional failed, one must be fixed:
> 	[{'const': 'pc'}, {'const': 'cna'}, {'const': 'core'}] is too long
> 	[{'const': 'pc'}, {'const': 'cna'}, {'const': 'core'}] is too short
> 	False schema does not allow 3
> 	1 was expected
> 	3 is greater than the maximum of 2
> 	hint: "minItems" is only needed if less than the "items" list length
> 	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/n=
pu/rockchip,rknn-core.example.dtb:
> npu-core@fdab0000 (rockchip,rk3588-rknn-core-top): compatible: 'oneOf' co=
nditional failed, one must be fixed:
> 	['rockchip,rk3588-rknn-core-top', 'rockchip,rknn-core-top'] is too long
> 	'rockchip,rk3588-rknn-core-top' is not one of ['rockchip,rk3588-rknn-cor=
e']
> 	from schema $id: http://devicetree.org/schemas/npu/rockchip,rknn-core.ya=
ml#
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/n=
pu/rockchip,rknn-core.example.dtb:
> npu-core@fdab0000 (rockchip,rk3588-rknn-core-top): reg: [[0, 4255842304, =
0, 36864]] is too short
> 	from schema $id: http://devicetree.org/schemas/npu/rockchip,rknn-core.ya=
ml#
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/n=
pu/rockchip,rknn-core.example.dtb:
> npu-core@fdac0000 (rockchip,rk3588-rknn-core): compatible: 'oneOf' condit=
ional failed, one must be fixed:
> 	['rockchip,rk3588-rknn-core', 'rockchip,rknn-core'] is too long
> 	'rockchip,rk3588-rknn-core' is not one of ['rockchip,rk3588-rknn-core-to=
p']
> 	from schema $id: http://devicetree.org/schemas/npu/rockchip,rknn-core.ya=
ml#
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/n=
pu/rockchip,rknn-core.example.dtb:
> npu-core@fdac0000 (rockchip,rk3588-rknn-core): reg: [[0, 4255907840, 0, 3=
6864]] is too short
> 	from schema $id: http://devicetree.org/schemas/npu/rockchip,rknn-core.ya=
ml#
>=20
> doc reference errors (make refcheckdocs):
>=20
> See
> https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250516-6=
-10-rocket-v3-1-7051ac9225db@tomeuvizoso.net
>=20
> The base for the series is generally the latest rc1. A different dependen=
cy
> should be noted in *this* patch.
>=20
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
>=20
> pip3 install dtschema --upgrade
>=20
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your sch=
ema.
>=20
