Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD9D92980A1
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 19:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745869090; cv=none; b=DiRp+PyfTpGvtJjd9lgn6Me4foBR2WpvblR5yFbjrlQHn8SgnqT2tphHsYPlNzXvKQzwup5iWdrvsxQSKcJpHMneeOk2BemjEKlzcyPW0HDn7dCtW0MaiUmz9ADbwfS+jgPC+e/kvmMy3wbK6OA8e8Yh/r2GA2JZaBTySjhqiZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745869090; c=relaxed/simple;
	bh=ti1qMv4NvH9CmMP3OH0AQa2stewX9HPWI7ryLNxsa5k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dDcsPHnWUXV9yK6sTkCw3cHNmoLcXqVNkm58GWoIuT17zETjbpjlGq/5UZ+abnZ9HQo0tXe2YNLJ3NTZjg+wUzk57RDUSrMHMiH+csbmVMB2EvfGWft0pwx6s09mA/qo9xIwIpfpt5CCb8u17VyZY+ExoIrIHV6QdeDA3InKW7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3htoiUbD; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3htoiUbD"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2264aefc45dso79201065ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 12:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745869088; x=1746473888; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kZL+y4O4nVB6WkTciMzCG9+Q8Gw1aprj/ilNSB+S7lA=;
        b=3htoiUbD9sQAUmBhJtglS4FV+B3cGwD+CXGCHvYQ78DFuZ5GNMIxILk6yG1JrjB2Ls
         23U62VAX28J5FTYGYnNFdWMwo6revluYyYsz3WMbRhnSs3M9lGOKACdR/L8P0shTN5OX
         qO5N0N+RQwjjk4vp1H3Qq28qNV5G67tH1KF3PBfkmNdRVZSpdmR5qqBL2GA6EOyQ5DrI
         H3UZMzPbE0gzVM7NgId0ZzFomOvQVFzWlaZXNsmvi9j2bwSjABWQGtnFHV8BOLEkFUdn
         iQJIQiPmP3+Ch7FvFwE/5oenvcKeRD1AuLSAlO2BGYfh0PvN+vw/ApS6HIh80XUhbb/W
         Ti3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745869088; x=1746473888;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kZL+y4O4nVB6WkTciMzCG9+Q8Gw1aprj/ilNSB+S7lA=;
        b=O+NTBl4GMGDZ0+gpmUbKjVdSwVIkkfntFFM95MG6G36TCDTZTcvFxST+0WLXlO/7wt
         xznqrClzW3G+0UdQbDwxTMwf2dT93s8S4KEMV72JdJpkYMi9KRU+8PhPH71XkeEm8ZdB
         XquKizMrwhM1o5o8UkjcPnPEhFbUPwVAEWepD9Lrir9RYeq8y+5eqo0cNJAlbKLwggyA
         +WIzvtc2GShP0af2S1rGHTFPEc6B7YmEm4ZALR/IJuh6zyTg7PKlqeCNLT60B1zjt7ff
         PZNvohZAD2a0x+e28cAD9Z2I3c6CrYdGzxPrMJkTCIaJx0klPjJuszgLBtGT7tdp+j0u
         lpzA==
X-Forwarded-Encrypted: i=1; AJvYcCWDDcZP5RWAAbUB5rG8KNEg82XYVdftr+lb+4ueo6UCYf+FCi/sZk6ImEUgjGm4DfXJfVtyDKlG++zIMRc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzg+B1s6jw5Aqqs21A/oCZcjVTPPSv7B91MOgsVe77eD+JN49Pa
	2fj5PbyXkGZg24dSrD0OOy7EBRT7u+Sc8DE2/JaSkkeVyLYmfXwNTNA1/NohCEp8CsGO/3Knyzr
	r8w==
X-Gm-Gg: ASbGncvjiL1UwbA7qm7oREeljuzyKQOommHvXUoxS99xz3aXr77KlmhDUIPCXdZvguG
	gv4bjvqV3iC4cx3xBs8uDRTZMvEmizUNm4QPhUhV1KYw9PtiBzzydHqvShp34qe57TMqWhKfTGz
	jJwELexuZsQzv6UpOkUG+l3bMcaSjYxD7ID7d+6qYol/iQa68lMeiJaDlXFV86kcj9sJDBSj71R
	0UTNg6fVb70Dnw+FQb545RhOnztALm5SVtw6wgYXtryJcC4aKYLbaExlsWblVbgXy3zkgQXTyaP
	w5uHURj1pPCdPM2ItfwFl5xiRJ4q7EUsqIjQ/lju+b/ju4S5UZkfZsO6G3JU0yWSOsKPHjZlGw=
	=
X-Google-Smtp-Source: AGHT+IEb7sjPxHBoM6DBUpDHrBYIpIDFqqlG7FLfEAc+dm0pnpCG2yrmeVJ4VnqTunSOtGlfHUdVJg==
X-Received: by 2002:a17:903:4405:b0:21f:164d:93fe with SMTP id d9443c01a7336-22de608f23emr13724175ad.53.1745869087882;
        Mon, 28 Apr 2025 12:38:07 -0700 (PDT)
Received: from google.com (28.67.125.34.bc.googleusercontent.com. [34.125.67.28])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dbdb4bsm87169915ad.92.2025.04.28.12.38.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 12:38:06 -0700 (PDT)
Date: Mon, 28 Apr 2025 19:38:02 +0000
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
Subject: Re: [PATCH v2 2/8] dt-bindings: arm: mediatek: Merge MT8186 Voltorb
 entries
Message-ID: <aA_ZGndUwSLY9yQ3@google.com>
References: <20250421101248.426929-1-wenst@chromium.org>
 <20250421101248.426929-3-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="coaj1VmWJVD9+zVN"
Content-Disposition: inline
In-Reply-To: <20250421101248.426929-3-wenst@chromium.org>


--coaj1VmWJVD9+zVN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 21, 2025 at 06:12:40PM +0800, Chen-Yu Tsai wrote:
> There are only two different SKUs of Voltorb, and the only difference
> between them is whether a touchscreen is present or not. This can be
> detected by a simple I2C transfer to the address, instead of having
> separate compatible strings and device trees.
>=20
> Drop the SKU-specific compatible strings and just keep the generic
> "google,voltorb" one.
>=20
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: Benson Leung <bleung@chromium.org>

> ---
> Changes since v1:
> - Added Rob's ack
> ---
>  Documentation/devicetree/bindings/arm/mediatek.yaml | 3 ---
>  1 file changed, 3 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Docume=
ntation/devicetree/bindings/arm/mediatek.yaml
> index 108ae5e0185d..49ddc504c160 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
> @@ -339,9 +339,6 @@ properties:
>            - const: mediatek,mt8186
>        - description: Google Voltorb (Acer Chromebook 311 C723/C732T)
>          items:
> -          - enum:
> -              - google,voltorb-sku589824
> -              - google,voltorb-sku589825
>            - const: google,voltorb
>            - const: mediatek,mt8186
>        - items:
> --=20
> 2.49.0.805.g082f7c87e0-goog
>=20

--coaj1VmWJVD9+zVN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCaA/ZGgAKCRBzbaomhzOw
wnOoAQDrlivFR72rlTsDjXpRDqb5IDQN68oHJxMoVtwn/gvj5QEAwGk6b5hoLf1D
239knHKArUipas1DEpyXfJVjZk3+VQ0=
=L6Rm
-----END PGP SIGNATURE-----

--coaj1VmWJVD9+zVN--
