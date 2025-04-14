Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 851652BE7B8
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 12:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744634444; cv=none; b=dfdkf53Osfo2r5q9+7F95Al1CDqQeUsdPCVJyZdtnx7Eki/wfLRNZ4ilG9snMnZxn5KAFtZj+/kBSvECrH4W2XTv9mYcGSaorxgJuqajkiJHAdIWLvS7fldLvJKuMZ/G4YqeCAgrA7PIkDl93A58uZQnpWt6cjS6dWNEqYVxR0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744634444; c=relaxed/simple;
	bh=D1V8ghNFhSQVvyCHqapThgtbdBVpNPOOv/+xtuw1fLY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=krnfVOjrE6gLLlY/DPFdPY8yqlVpOkTfhNiXoGVLAsNUF+XDbjwcHeFl5JYUUxBAS+rIoUnXSbR6XZJNeRBfdCujg3FmfJTGo+PBK0MgXgtZtDp0lN7hAYozXVuJerJGQ4cRqwkpQ2xjiuJDamZKvI0tKALlZx0Nb4grLdwMzPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=kK9pTKrV; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="kK9pTKrV"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4767e969b94so74601521cf.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 05:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1744634441; x=1745239241; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=D1V8ghNFhSQVvyCHqapThgtbdBVpNPOOv/+xtuw1fLY=;
        b=kK9pTKrVuB4og9r2Z/xRPl4iPOsx2BnkpigmntR3UA2SUmRZc8P7Ho+s5ii82AK2by
         fzl22L5Nb7auDkyAwZ92hua78rwCsE5tDFS/05dmMIcq6+/GFyioMHLGWdOv0inN8oXY
         lWHGPNAKKxqcLiZfIosG6qbaypXVQV7sJl74c1V+1sEI8pprM3AwlyOskJiqHEy2A9Kn
         xrstPj6QLX/QolAhoKigcwloS2KO0CvhiTU/7O6K0w8lE/yngs9aCW6FUCTnfWNCMoTm
         m44bvEeItL4fA3xqJpXAKSOB9GeeAYnynRfvpl168SjsQILvbCBSfGGBGmD2asHP6jBz
         r1gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744634441; x=1745239241;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D1V8ghNFhSQVvyCHqapThgtbdBVpNPOOv/+xtuw1fLY=;
        b=poOSljK7m0yb4B/ep/nB3wKbe8/CpFkMeAC1krOWg859BNC/NZI8GdV+AU6rn/F2ss
         1HrLrkbNI7w5qoZaTS1bLiII1H507JI3dDwVBButCPy/RSx7CzCtgmr9ExiR0SfLykOd
         8v7Jpw/j2DiYcTLiRuUYQzsTmtHVUqQ5rp+upA+gQWch+hRXzzfKFGXD5L3+z1M/j4NV
         bYXZUmNG/k7ezRbstz1FbIdQS8IvL4I1iva9GVHrBF2ItXuKPvaUacsd5bqdL+/lPK0g
         B5pBMnbJ48wx8PgYpVDeofnqWd98M8qyDI68AVAwKHBXfnWtwWG5z8xoxVI3xtE+IK1Q
         8pHg==
X-Forwarded-Encrypted: i=1; AJvYcCUZqAjXcYvH/BfzqILfURqn3sZLU205suHiDslIF4buG7RixGGOshl3R2Zk1NrajaLmKj3hYUr3L0J/kAs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwoFXRF7NugawKQVrZQhU0/x+aBoM4lGV3QyfHmcmo5wTpaepCK
	DA3Swfzj+0qoQSGounQgXIO4mhu15C3p7VtGEe0nlZrMvH3TK6M9XZzo+SFJDVg=
X-Gm-Gg: ASbGncsH2Eg9sN5eWZtngxc/E9L8pqJmTlOCynE25B1e29CXZMzySqRaDhnEGSBEb0Y
	5zG9Q8CGUltFDAbHg9N8QP/XPOn433S6Y3aprgZiwEVJeRxiLqSwVfvPgq+tLXzFxkXSpzT3SZ7
	zva9JB/a/lFV9FSH5fJtl2uY/mGMjttqhr3H5lfz0VHPV2Hmk68RjFKrZxSPkyoHBcZuTISq8Ta
	R70f0NsEL4utLEchf0VMgQDU3KbGUxwnbt8Swlf/qNMTX6T71iuX4IuEFtZG6fu9LPVZxW4GeWa
	vXgjaqtzYkK93dbzsCn2rJSWgkNUREEyiUePOPBSbZruRvqKqqJaheeV
X-Google-Smtp-Source: AGHT+IHzRC5MPk4gCdZQDiLMvimp8F/pyevk6/f63+hfdgj8+aLB0yoSTDhdEMEr6WLqPX5YOYzzJQ==
X-Received: by 2002:a05:622a:1892:b0:477:6f2c:4a07 with SMTP id d75a77b69052e-4797750fda2mr191211911cf.4.1744634441327;
        Mon, 14 Apr 2025 05:40:41 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:e976::c41? ([2606:6d00:11:e976::c41])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4796eb2b4easm73431781cf.34.2025.04.14.05.40.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 05:40:40 -0700 (PDT)
Message-ID: <e79a3bfb0cb57fea17ad7852ce3b4fe720c2cbd2.camel@ndufresne.ca>
Subject: Re: [PATCH v1 2/3] dt-bindings: media: mediatek: mdp3: Add
 compatibles for MT8188 MDP3
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 mchehab@kernel.org, 	matthias.bgg@gmail.com, moudy.ho@mediatek.com,
 dri-devel@lists.freedesktop.org, 	linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com, 	sebastian.fricke@collabora.com,
 macpaul.lin@mediatek.com
Date: Mon, 14 Apr 2025 08:40:39 -0400
In-Reply-To: <20241218105320.38980-3-angelogioacchino.delregno@collabora.com>
References: <20241218105320.38980-1-angelogioacchino.delregno@collabora.com>
	 <20241218105320.38980-3-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0 (3.56.0-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Le mercredi 18 d=C3=A9cembre 2024 =C3=A0 11:53 +0100, AngeloGioacchino Del =
Regno a =C3=A9crit=C2=A0:
> Add compatible strings for the FG, HDR, RSZ, STITCH, TCC, TDSHP
> and WROT hardware components found in MediaTek's MT8188 SoC.
>=20
> This hardware is compatible with MT8195.
>=20
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Acked-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0.../devicetree/bindings/media/mediatek,mdp3-fg.yaml=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 8 ++++++--
> =C2=A0.../devicetree/bindings/media/mediatek,mdp3-hdr.yaml=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 8 ++++++--
> =C2=A0.../devicetree/bindings/media/mediatek,mdp3-rsz.yaml=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 1 +
> =C2=A0.../devicetree/bindings/media/mediatek,mdp3-stitch.yaml=C2=A0=C2=A0=
 | 8 ++++++--
> =C2=A0.../devicetree/bindings/media/mediatek,mdp3-tcc.yaml=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 8 ++++++--
> =C2=A0.../devicetree/bindings/media/mediatek,mdp3-tdshp.yaml=C2=A0=C2=A0=
=C2=A0 | 8 ++++++--
> =C2=A0.../devicetree/bindings/media/mediatek,mdp3-wrot.yaml=C2=A0=C2=A0=
=C2=A0=C2=A0 | 1 +
> =C2=A07 files changed, 32 insertions(+), 10 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-fg.yam=
l b/Documentation/devicetree/bindings/media/mediatek,mdp3-fg.yaml
> index 03f31b009085..40fda59fa8a8 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,mdp3-fg.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-fg.yaml
> @@ -16,8 +16,12 @@ description:
> =C2=A0
> =C2=A0properties:
> =C2=A0=C2=A0 compatible:
> -=C2=A0=C2=A0=C2=A0 enum:
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - mediatek,mt8195-mdp3-fg
> +=C2=A0=C2=A0=C2=A0 oneOf:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - enum:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - mediatek,mt8195=
-mdp3-fg
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - items:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: mediatek=
,mt8188-mdp3-fg
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: mediatek=
,mt8195-mdp3-fg
> =C2=A0
> =C2=A0=C2=A0 reg:
> =C2=A0=C2=A0=C2=A0=C2=A0 maxItems: 1
> diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-hdr.ya=
ml b/Documentation/devicetree/bindings/media/mediatek,mdp3-hdr.yaml
> index d4609bba6578..d9f926c20220 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,mdp3-hdr.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-hdr.yaml
> @@ -16,8 +16,12 @@ description:
> =C2=A0
> =C2=A0properties:
> =C2=A0=C2=A0 compatible:
> -=C2=A0=C2=A0=C2=A0 enum:
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - mediatek,mt8195-mdp3-hdr
> +=C2=A0=C2=A0=C2=A0 oneOf:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - enum:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - mediatek,mt8195=
-mdp3-hdr
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - items:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: mediatek=
,mt8188-mdp3-hdr
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: mediatek=
,mt8195-mdp3-hdr
> =C2=A0
> =C2=A0=C2=A0 reg:
> =C2=A0=C2=A0=C2=A0=C2=A0 maxItems: 1
> diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-rsz.ya=
ml b/Documentation/devicetree/bindings/media/mediatek,mdp3-rsz.yaml
> index f5676bec4326..8124c39d73e9 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,mdp3-rsz.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-rsz.yaml
> @@ -20,6 +20,7 @@ properties:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - mediatek,m=
t8183-mdp3-rsz
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - items:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - enum:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 - mediatek,mt8188-mdp3-rsz
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 - mediatek,mt8195-mdp3-rsz
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: med=
iatek,mt8183-mdp3-rsz
> =C2=A0
> diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-stitch=
.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-stitch.yaml
> index d815bea29154..1d8e7e202c42 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,mdp3-stitch.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-stitch.yaml
> @@ -16,8 +16,12 @@ description:
> =C2=A0
> =C2=A0properties:
> =C2=A0=C2=A0 compatible:
> -=C2=A0=C2=A0=C2=A0 enum:
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - mediatek,mt8195-mdp3-stitch
> +=C2=A0=C2=A0=C2=A0 oneOf:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - enum:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - mediatek,mt8195=
-mdp3-stitch
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - items:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: mediatek=
,mt8188-mdp3-stitch
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: mediatek=
,mt8195-mdp3-stitch
> =C2=A0
> =C2=A0=C2=A0 reg:
> =C2=A0=C2=A0=C2=A0=C2=A0 maxItems: 1
> diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-tcc.ya=
ml b/Documentation/devicetree/bindings/media/mediatek,mdp3-tcc.yaml
> index 14ea556d4f82..6cff7c073ce4 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,mdp3-tcc.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-tcc.yaml
> @@ -17,8 +17,12 @@ description:
> =C2=A0
> =C2=A0properties:
> =C2=A0=C2=A0 compatible:
> -=C2=A0=C2=A0=C2=A0 enum:
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - mediatek,mt8195-mdp3-tcc
> +=C2=A0=C2=A0=C2=A0 oneOf:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - enum:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - mediatek,mt8195=
-mdp3-tcc
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - items:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: mediatek=
,mt8188-mdp3-tcc
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: mediatek=
,mt8195-mdp3-tcc
> =C2=A0
> =C2=A0=C2=A0 reg:
> =C2=A0=C2=A0=C2=A0=C2=A0 maxItems: 1
> diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-tdshp.=
yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-tdshp.yaml
> index 8ab7f2d8e148..cdfa27324738 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,mdp3-tdshp.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-tdshp.yaml
> @@ -16,8 +16,12 @@ description:
> =C2=A0
> =C2=A0properties:
> =C2=A0=C2=A0 compatible:
> -=C2=A0=C2=A0=C2=A0 enum:
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - mediatek,mt8195-mdp3-tdshp
> +=C2=A0=C2=A0=C2=A0 oneOf:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - enum:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - mediatek,mt8195=
-mdp3-tdshp
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - items:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: mediatek=
,mt8188-mdp3-tdshp
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: mediatek=
,mt8195-mdp3-tdshp
> =C2=A0
> =C2=A0=C2=A0 reg:
> =C2=A0=C2=A0=C2=A0=C2=A0 maxItems: 1
> diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-wrot.y=
aml b/Documentation/devicetree/bindings/media/mediatek,mdp3-wrot.yaml
> index 53a679338402..b6269f4f9fd6 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,mdp3-wrot.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-wrot.yaml
> @@ -20,6 +20,7 @@ properties:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - mediatek,m=
t8183-mdp3-wrot
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - items:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - enum:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 - mediatek,mt8188-mdp3-wrot
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 - mediatek,mt8195-mdp3-wrot
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: med=
iatek,mt8183-mdp3-wrot
> =C2=A0
