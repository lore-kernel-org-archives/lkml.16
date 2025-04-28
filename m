Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A877813D8B1;
	Mon, 28 Apr 2025 09:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745832133; cv=none; b=mKWFWCYa52skyNtottm6b5Iwp6KculFNLrMf1ovKo2nBU/9pici4Ooj0xpQDq6bkbAIVUr+HtFZLhOhFgLJlA8oGLUNtwslxxV2+07NjUtbGmJt4QnOfe/0bg62L3+QDtlcAaojPNL59MyMY+oOzl7+3AHEwPBks9m4x9GCde0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745832133; c=relaxed/simple;
	bh=MtjrE4PsmXvvo9ggtZb5Jr+kxxOmLqBT62x+poj/uZE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g8EwIv8QiJdef5i5awIwggnaxaoGOdf2KUUXQmtFXuIaGNZo2Nve2WeHnXbUqcKwET3DBk7ybXgimfO/+FOQPNE4iVyiIglTwIKoghwP5r49c62rtphsgr9QeBLCIlGu/8EX+j51x1RwNdyEbmih2aE6md5O+NwxFLZ2dN7J7AI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=diqMW+FK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="diqMW+FK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D36AC4CEE4;
	Mon, 28 Apr 2025 09:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745832133;
	bh=MtjrE4PsmXvvo9ggtZb5Jr+kxxOmLqBT62x+poj/uZE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=diqMW+FK2c3SRCqtJgEhR0zRjH2vudEIJwLl8vZSbJf9mbXqPHkiBgc2ivakG3WBg
	 3dWkMm3kOwJzwYWsyvNXHJKO2b/+WPtiUPVToNik0sLL3lyNX/u0EOGhK0DDTKLWqR
	 UhzL4vQ73bicgo1ZrKjGcy/vTW4xS8nNYPUZCB7WQdyN/StX8PVOCv/5JXtP8UcHMc
	 0rNbnbujcTEXA7dREsDW9ni3JpOHcEzhcArGRTW2Wol9Hi97tjNKcYQJav8u9ctuCp
	 85Bi/TSvzJTDHyYyLf4z5sQLFfDnzrqNOAZKSbkD0on0oLJEVyYYKV3NpgmxopLXk/
	 Ols10f7pzcr1g==
Date: Mon, 28 Apr 2025 11:22:10 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: Add BOE TD4320
Message-ID: <20250428-versed-boar-of-charisma-961cbf@kuoka>
References: <20250427-lavender-panel-v1-0-b2611674166c@mainlining.org>
 <20250427-lavender-panel-v1-1-b2611674166c@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250427-lavender-panel-v1-1-b2611674166c@mainlining.org>

On Sun, Apr 27, 2025 at 11:11:11AM GMT, Barnab=C3=A1s Cz=C3=A9m=C3=A1n wrot=
e:
> Document BOE TD4320 6.3" 2340x1080 panel
> found in Xiaomi Redmi Note 7 smartphone.
>=20
> Signed-off-by: Barnab=C3=A1s Cz=C3=A9m=C3=A1n <barnabas.czeman@mainlining=
=2Eorg>
> ---
>  .../bindings/display/panel/boe,td4320.yaml         | 55 ++++++++++++++++=
++++++
>  1 file changed, 55 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/display/panel/boe,td4320.y=
aml b/Documentation/devicetree/bindings/display/panel/boe,td4320.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..65da1c392cafbb7cd3ce32e34=
7fba1b9244c1ad8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/boe,td4320.yaml
> @@ -0,0 +1,55 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/boe,td4320.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: BOE TD4320 MIPI-DSI panels
> +
> +maintainers:
> +  - Barnabas Czeman <barnabas.czeman@mainlining.org>
> +
> +description:
> +  BOE TD4320 6.3" 1080x2340 panel found in Xiaomi Redmi Note 7 smartphon=
e.
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: boe,td4320
> +
> +  reg:
> +    maxItems: 1

No supplies?

> +
> +required:
> +  - compatible
> +  - reg
> +  - reset-gpios

No supplies? This looks really incomplete.


Best regards,
Krzysztof

