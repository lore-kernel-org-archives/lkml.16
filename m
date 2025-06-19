Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2637A261594
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 09:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750323605; cv=none; b=Eu+3UvomN54hiwueW0Fq1dDxZmKt7TdR51pYXlapFoqWIBIV5ITsg1uuo1hJdUCCzvf/rDAkUPOEL62UI3ZOpuV4mJ3/h14hXeOM/d5vLf88nVwaTcz0rfLK2zA4VEZOjFaQ509p9RnCbusptQ0u+HbS2lPYFWqKiElwKXfbW1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750323605; c=relaxed/simple;
	bh=UzuK/CxyCGnL+YSPUVuW3jK4T0cRHWwLE+0svoU+I9s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hK5gLAoz6qTeOmnQUvtjU7hyTaXFOuz9loM1ee+bm9YPe+A0VwjbQvIdw8+EVicFw/YFESVAwb0VFW679zLi0L5dpBQjHx1KG5PHoJMxDoeEYhEhOPWAz06Y0Pbs7C0S7/5PgauYQfX8Vqt4Hswz5uPifcWMArCK0gUoAYunq1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hbRxkQlR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hbRxkQlR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBB5FC4CEF5
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 09:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750323604;
	bh=UzuK/CxyCGnL+YSPUVuW3jK4T0cRHWwLE+0svoU+I9s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hbRxkQlRExVDwH79ADkhlXgwcMX3ygDlcbmP6ZXM7dXQNpBpOFxP8MCYW4/6U/9F8
	 n0Oq+kPjOZHzEhc6sLC3FXXA3c/NuLYxyphmSY8nf+gV0lnrMYYLiwa2OeKrZdD2CC
	 GZrDq0MXa4Z0d7ZeSZ5s5vsEyfyX8yiepwCeOul1+WPaTgSgKz13GgDHKUv3bEyv+R
	 RS6L0oORVTLA69sTfvqZJvHzZ+KCaamKmXDG8ir7W0uJkZFB7b/P+ddStsNxHBtmKB
	 O+nf2bfMF0UezscT2RMpPEDT44te82KJWxp8Tvgoyql7A4QlB+EDP70XDhGQfqr967
	 KvAzqsn38gkHQ==
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e819aa98e7aso508307276.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 02:00:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU0PrmC87eqc5REK+w0/NbPEC+Y8QvGxZKInYVcR/yg7seUnAWFJlRuO8Me5yN4cbc4CpZCyF2HMy8ha8U=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVy0jhKSrNhkltBTIQNoW7VCdGVId/BzoOPp/hdgu1Bsil9nEu
	C+qgG5ntNtL1rZPgm1mqaw3em4NsmSoLbTtGwI7Aof4E4/e94U0IyT3TzdCbFVSmzoBtyEpH4Ga
	6gFzAgTpSczB5/C2fZWuRGSw1NXMqgvqYhXk4Um9HcQ==
X-Google-Smtp-Source: AGHT+IFTSpIXWJ8aJgks2cku0velW0M+JCR6Rbfmtd6WsoM033VVzHoiXCwOg94pnYfHO2hy+W/9swsQZRSpK6zIGwQ=
X-Received: by 2002:a05:6902:2613:b0:e82:6c9b:8287 with SMTP id
 3f1490d57ef6-e826c9b85e4mr11134815276.9.1750323604035; Thu, 19 Jun 2025
 02:00:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250606-6-10-rocket-v7-0-dc16cfe6fe4e@tomeuvizoso.net> <20250606-6-10-rocket-v7-2-dc16cfe6fe4e@tomeuvizoso.net>
In-Reply-To: <20250606-6-10-rocket-v7-2-dc16cfe6fe4e@tomeuvizoso.net>
From: Robert Foss <rfoss@kernel.org>
Date: Thu, 19 Jun 2025 10:59:53 +0200
X-Gmail-Original-Message-ID: <CAN6tsi4p2wuMVVvQOJ5c6ecT=x2pr2VoZhS4wH27qaR9DptQHA@mail.gmail.com>
X-Gm-Features: AX0GCFskbG-ChYYQk7bGtKWaX4j6fsAKjpFPkM8iQ7QewPkQLLciRbSAzy_fqYo
Message-ID: <CAN6tsi4p2wuMVVvQOJ5c6ecT=x2pr2VoZhS4wH27qaR9DptQHA@mail.gmail.com>
Subject: Re: [PATCH v7 02/10] accel/rocket: Add a new driver for Rockchip's NPU
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Oded Gabbay <ogabbay@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, Kever Yang <kever.yang@rock-chips.com>, 
	Robin Murphy <robin.murphy@arm.com>, Daniel Stone <daniel@fooishbar.org>, Da Xue <da@libre.computer>, 
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-doc@vger.kernel.org, linux-media@vger.kernel.org, 
	linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 6, 2025 at 8:29=E2=80=AFAM Tomeu Vizoso <tomeu@tomeuvizoso.net>=
 wrote:
>
> This initial version supports the NPU as shipped in the RK3588 SoC and
> described in the first part of its TRM, in Chapter 36.
>
> This NPU contains 3 independent cores that the driver can submit jobs
> to.
>
> This commit adds just hardware initialization and power management.
>
> v2:
> - Split cores and IOMMUs as independent devices (Sebastian Reichel)
> - Add some documentation (Jeffrey Hugo)
> - Be more explicit in the Kconfig documentation (Jeffrey Hugo)
> - Remove resets, as these haven't been found useful so far (Zenghui Yu)
> - Repack structs (Jeffrey Hugo)
> - Use DEFINE_DRM_ACCEL_FOPS (Jeffrey Hugo)
> - Use devm_drm_dev_alloc (Jeffrey Hugo)
> - Use probe log helper (Jeffrey Hugo)
> - Introduce UABI header in a later patch (Jeffrey Hugo)
>
> v3:
> - Adapt to a split of the register block in the DT bindings (Nicolas
>   Frattaroli)
> - Move registers header to its own commit (Thomas Zimmermann)
> - Misc. cleanups (Thomas Zimmermann and Jeff Hugo)
> - Make use of GPL-2.0-only for the copyright notice (Jeff Hugo)
> - PM improvements (Nicolas Frattaroli)
>
> v4:
> - Use bulk clk API (Krzysztof Kozlowski)
>
> v6:
> - Remove mention to NVDLA, as the hardware is only incidentally related
>   (Kever Yang)
> - Use calloc instead of GFP_ZERO (Jeff Hugo)
> - Explicitly include linux/container_of.h (Jeff Hugo)
> - pclk and npu clocks are now needed by all cores (Rob Herring)
>
> v7:
> - Assign its own IOMMU domain to each client, for isolation (Daniel
>   Stone and Robin Murphy)
>
> Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>

Reviewed-by: Robert Foss <rfoss@kernel.org>
