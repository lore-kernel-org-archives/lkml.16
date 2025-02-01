Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08781F50F;
	Sat,  1 Feb 2025 05:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738388755; cv=none; b=PmzIzyoprEacIZNEgJp4HqpiAo7SaUdz9DYA/EgO5H5WLxYn9MuhiWaynVXq8tpiLiPi30SyhZSd2rLm4YAn/JJz8zcMzW2D+KPW9BQisPhL3vCWDl41HMRZ8zJcBzb5BnXEcBQI7e9z1zfzfvUedbuU6HKWN7+XcB3xZUVj0as=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738388755; c=relaxed/simple;
	bh=qbawXxUKP6zDQlebdU6+x0n3usE9wNb94Sv/W0Ffz74=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=aW8Zf+DgoEULM9kVf+wL9tZbCbDsoJn6cmkquDd3NloOQaxJkRSqmLJ53T/ndehqbTtwiUrHCHVaSIvAUxfs0UhHQIygAVRuTqGUxh9002+cKfZOroUGZK1sILfevDwBDSMXjl3agWV3S5W/497LjaeQt5NgFkTdXcDajFxgZgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cnlEh6Mp; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cnlEh6Mp"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43624b2d453so31534395e9.2;
        Fri, 31 Jan 2025 21:45:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738388751; x=1738993551; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G85DeTf/oB1QdDKSnZYOTyqELILiv8N6DE1BpyFXcGE=;
        b=cnlEh6MpzV9QR9Y/SV/sPuLkM8eGhlGsOSvvwkn8Febh+ealj8nxOhAAOrm9Kzcp9H
         Hrr+UvJShZdVtUllNIb6a+KuB9BtlQbt2VCPNv6HOJzOislM6N/88WvRPDiLJsLarRqK
         WeI32xDpossGezYIiG2KHFrpbRehq2kZ9x8v8jqZIvsIkYPKJpoFlziLdQzYYglidn4P
         UFJdLQOaei8LRfvaun4Ho10T8EEK2KfHy7HK+0N8GqV3OSG8kPok1IaKshNGbSnQIuie
         yQZROka9LjQPt/955Kx3vCie0j1dfJoGze7N6OgAVhxErQOCPlzCrdE0hhXAt/DgivBT
         h8jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738388751; x=1738993551;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G85DeTf/oB1QdDKSnZYOTyqELILiv8N6DE1BpyFXcGE=;
        b=SSwj+kq7KBuGZes+FxLflWW7J0sfNaIrHEQqpr1FqyysTrEND1lYgnHpIHXYDgOQ84
         mnsPbUBgwLocOuILra4VQUpefeuMudia48fwYNjbMQYNI/C1almbuRYFtQZ+TbpuVnj2
         ooBJQndIbnf8YrD82+XMp7fJdGwRIZkSkHZE0Wds2tHSvwPHcNG5y/s4QO+3LDcwJjAR
         cm0ndg0Xz7uOFoNysRUi3q4eG6WnhHZPOD809+78fY9zrXkwcR0ZifbY0Szn1Urev8KA
         /KYulIFXNeh7NalBfgjK63k0kzMM9SkgyaeSwdiJZ/a542VsVEu/QYtqjBj3YqAfhR4j
         nTQA==
X-Forwarded-Encrypted: i=1; AJvYcCWwy7ZVDrZpOe6Nbfrb5T3rWWfnbdufdy5q4orUggZ3ZeaJ9NsSI9j4yxsxiVtN+F42JEIwIVVutxXG@vger.kernel.org, AJvYcCXRDsN+HQ6pXEdwKaf7DLutCd+aiPCQn7J24O7PP1Wy1ar7yvCwg4zdoaFxlDgicU6OzvdCX3eYAuWFvxKW@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3xK4VetnQFVtUbYLZbEJCocf05UTvJBa6vvi5xOJ2Avd7Yoi3
	Cq/R0u3n3ha1+BDVaKfJUsvBrP7h4QNdfITYe5YJpTUwdtfLLxVr
X-Gm-Gg: ASbGncugF2zXax15xWZgKdT3MgnEtQOWkQqt29sGnHZ1cdLedXMdGj51160PNia6lMa
	6HWh5UFVdNTqTOr+dlxYoiybh3mXydYEVOUwKAqMd9zdAyyE1PORsHazmhuKRIle+jlY/XuyN2M
	+BRoIlCQH+Dj8tBlEvgU+uCTdp65eCR0EeIioI9dqQtkHYGnkm6j+2QzmLUK4zGCJQ/wcHjBeR3
	q8IhXzwVAwBmWp19DV1dVqlFRC97dAr0NWoKGh7armRvMx/WnfwcLjfK1EehaYzo8cbcFQOx1Bl
	LYathi6Y8xXjQPBVjaOOes1CTaI2XNEgBx/7Pg==
X-Google-Smtp-Source: AGHT+IGpv3U1XmTljvPm+aRio29IyVxb1CqNPRL0HcUV182tHRVmnYjMR4+uddkC3ZNgOv4PVJZSsQ==
X-Received: by 2002:a05:600c:5027:b0:434:a26c:8291 with SMTP id 5b1f17b1804b1-438dc40d36emr133099025e9.24.1738388750948;
        Fri, 31 Jan 2025 21:45:50 -0800 (PST)
Received: from smtpclient.apple ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c11b363sm6349836f8f.40.2025.01.31.21.45.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 31 Jan 2025 21:45:50 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.200.121\))
Subject: Re: [PATCH 1/2] dt-bindings: arm: amlogic: add Xiaomi Mi TV Stick
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <20250131200319.19996-2-funderscore@postmarketos.org>
Date: Sat, 1 Feb 2025 09:45:34 +0400
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht,
 Artur Weber <aweber.kernel@gmail.com>,
 Karl Chan <exxxxkc@getgoogleoff.me>
Content-Transfer-Encoding: quoted-printable
Message-Id: <5D2DE475-BD47-4AAB-9638-3F1BF6C57811@gmail.com>
References: <20250131200319.19996-1-funderscore@postmarketos.org>
 <20250131200319.19996-2-funderscore@postmarketos.org>
To: Ferass El Hafidi <funderscore@postmarketos.org>
X-Mailer: Apple Mail (2.3826.200.121)

> On 1 Feb 2025, at 12:03=E2=80=AFam, Ferass El Hafidi =
<funderscore@postmarketos.org> wrote:
>=20
> From: Ferass El Hafidi <funderscore@postmarketos.org>
>=20
> Add support for xiaomi-aquaman.
>=20
> Signed-off-by: Ferass El Hafidi <funderscore@postmarketos.org>
> ---
> Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
> 1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml =
b/Documentation/devicetree/bindings/arm/amlogic.yaml
> index 0647851ae..0db7038b9 100644
> --- a/Documentation/devicetree/bindings/arm/amlogic.yaml
> +++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
> @@ -70,6 +70,7 @@ properties:
>           - enum:
>               - amlogic,p241
>               - libretech,aml-s805x-ac
> +              - xiaomi,aquaman

If this is S805Y not S805X, you should add a new binding section for
S805Y devices, and add the board there.

e.g. I did this for S905L (GXLX) devices:
=
https://patchwork.kernel.org/project/linux-amlogic/patch/20240604084134.33=
15841-1-christianshewitt@gmail.com/

Christian

>           - const: amlogic,s805x
>           - const: amlogic,meson-gxl
>=20
> --=20
> 2.47.1
>=20
>=20
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic

