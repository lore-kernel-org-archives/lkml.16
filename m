Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3072F2973BB
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 19:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745869139; cv=none; b=RXTVq/YsyqR9BRQTDS1hDkdQbLCrRe4pJzBWssdzQM0/CSISD7280PRzo+nLjVN4MfRQruxnvwhGXWYSWYUgSPg7WdW77EJVxi8t0EeL6freOV9pHuTsVO9YyqIVAvfRjXvEiC+kjSDxdH3GvJgvuQCNrN3zZS10dYfcBS13VdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745869139; c=relaxed/simple;
	bh=13xUiVobxzRSH7gXywjwaNcP6SoEC7CZkLAaSA9kBcU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HtBSpwhlyHZZ7x8Nv37S0GUcwju5FtjeLBq1EV653D6lafjTfvz0C1QC5BIqqqZzIVIxUYNaNpB6lFPbK13K6taAP7guCXhhjml+/eih6QqCYKRZP8AqnSn6oif7hwyCUdpfvxFe5aj19F8mmjGme2BJUCbZ4bga5NY+ebqASZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wxuP+dtB; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wxuP+dtB"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7369ce5d323so4318390b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 12:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745869137; x=1746473937; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=14iGLLoPFCaZQPh6Psc3FLMwpAjwEZFNk7aZejXSCSk=;
        b=wxuP+dtBkcJUysgq1FhpfXRRRQToT/in7/hqNm7AxK0QAZuLo/EuhT9VVX4op6MtZc
         bU5SKS1YD4M1NZ+clOUzUZA/u47f1YyZ1JQxdkUL+JR7gUWlsG6OI5GIwFS4CIVMw6TI
         2Xc+Y4Fo2E7XPhlnEXKkG/gc2rc48dMtQDTlzhmVBN7NCx34e/PSsVC3SnHZPurZk5ao
         il0pR82z14ABHlW/DQwBiBSK5QCQHCcddki8wFEGC3AZVGXtV4Q4GA7BSyScRC5HZbAN
         /zoPw4pxVT3SYtQ08H2091rQOGCV/fxgWz3/N2lC1lurDdDrBz4+Pl1fYv/RFaEYkQ2v
         ckfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745869137; x=1746473937;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=14iGLLoPFCaZQPh6Psc3FLMwpAjwEZFNk7aZejXSCSk=;
        b=e1QeCNKQpzSQDDioXTDaKNd4GuKZI8QPuilOmFBshzsGr7XLZ+4mAarDhX9p7VmiUv
         8V3+1JNdi5a6yAnVY4WkKngpSKiviGEO5A18AU4gUddtTuy6QI9knLr8Bgy7DZRs4Wa3
         jHYQ/Qi2cLSj8uEG5GNL4lSEJmhpRPOXYe2CPKHJD7LEZnS0z//403G4gxCMtjpbIOl0
         KNR8B4gkUm18zYFEJ05AsB1PrAsH69/aO5ZkCdKljTNpoDrIfTQIe/bZJ3icy4wL0C67
         2NAy+hmbMOnY6a4hdAOoK4x4QcDYEbcIjtBxJQqmrOFnSJTizb5XqrCp/5yM38dNnX9/
         vpNw==
X-Forwarded-Encrypted: i=1; AJvYcCUQeec4byylZZB9bS040GSVKtp3YugudhqVLUjmPzjvcSc1F3ADk/x/3pEGlfibAQSS1kraza1mJKF408o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/SSO2QiymFjeXk2qbpkUBefqxavy9Ehyx4RK+L8rI+9W93AEq
	aTcoK78Su3L72RsDW9HuMS1jITqEMv4yMyXLkgs3ShqxkvOnmWLjQBNsiyp7Aw==
X-Gm-Gg: ASbGncu7cAhLeJQ4yOYtHVmdTZVLfNoflp1lmF4yTchwqrJ7U4iNFPw2g18hPP6Cfsk
	SjBAebJQc3GK2nBpKc2WbbPeCNH0eP1NLQ69+mI7cPmhu7wjlFmhTWoyWcL+vrbCns96/F4XGc9
	OQk48VGLZ2agJ9w6lFpiPfHxMKESmF0lGVAZOJcKvjpNrMlxAhfdxgN/k4247pU3dSbzJhnLxS/
	AHzrtYZsz4omzoIO0l8PG1PeqQztJudD+YWrJ7MJXdMD66kILJTeuLJDwWM8Gdyq/CZBKccODA4
	+oQQQiK7UV1EKn/CQ/i4VMh9/2kAjYej2f44SxsEFiLD1TT7y50S8FCNgS9W9kFkk3Sh+BUAWg=
	=
X-Google-Smtp-Source: AGHT+IHmlLzT3YLWMcB9dRwkEoEHVu8JunNQRTVgpY+NajhMftB1PbhiEiMvQy73a8wiTuoNqCPhhg==
X-Received: by 2002:aa7:88cb:0:b0:739:50c0:b3fe with SMTP id d2e1a72fcca58-74027139a2cmr1699641b3a.8.1745869137003;
        Mon, 28 Apr 2025 12:38:57 -0700 (PDT)
Received: from google.com (28.67.125.34.bc.googleusercontent.com. [34.125.67.28])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25941e7bsm8721326b3a.52.2025.04.28.12.38.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 12:38:55 -0700 (PDT)
Date: Mon, 28 Apr 2025 19:38:51 +0000
From: Benson Leung <bleung@google.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v2 3/8] dt-bindings: arm: mediatek: Add MT8186 Squirtle
 Chromebooks
Message-ID: <aA_ZS8cNneR_fyDK@google.com>
References: <20250421101248.426929-1-wenst@chromium.org>
 <20250421101248.426929-4-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="XymM9xtRtIWUo1hO"
Content-Disposition: inline
In-Reply-To: <20250421101248.426929-4-wenst@chromium.org>


--XymM9xtRtIWUo1hO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 21, 2025 at 06:12:41PM +0800, Chen-Yu Tsai wrote:
> Add an entry for the MT8186 based Squirtle Chromebooks, also known as the
> Acer Chromebook Spin 311 (R724T). The device is a 2-in-1 convertible.
>=20
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: Benson Leung <bleung@chromium.org>

> ---
> Changes since v1:
> - Added Rob's ack
> ---
>  Documentation/devicetree/bindings/arm/mediatek.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Docume=
ntation/devicetree/bindings/arm/mediatek.yaml
> index 49ddc504c160..f0b4ccd81c4d 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
> @@ -291,6 +291,10 @@ properties:
>            - const: google,steelix-sku196608
>            - const: google,steelix
>            - const: mediatek,mt8186
> +      - description: Google Squirtle (Acer Chromebook Spin 311 (R724T)
> +        items:
> +          - const: google,squirtle
> +          - const: mediatek,mt8186
>        - description: Google Starmie (ASUS Chromebook Enterprise CM30 (CM=
3001))
>          items:
>            - const: google,starmie-sku0
> --=20
> 2.49.0.805.g082f7c87e0-goog
>=20

--XymM9xtRtIWUo1hO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCaA/ZSwAKCRBzbaomhzOw
wmjGAP0Rjz88KZq9wxTkLmE2fLTGJpXJLEOGhasJsrHYmQgrDQEA+/raQJKGPQgA
EgvDbveTPRWunILosNFF76r3ozB4zwo=
=vSwx
-----END PGP SIGNATURE-----

--XymM9xtRtIWUo1hO--
