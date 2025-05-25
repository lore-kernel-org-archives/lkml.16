Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA09614B092
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 06:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748156394; cv=none; b=E0KpIzjvrRPjMPn+Wxw+eXbMKrx+bATRqZOUeK4pLOAoWZFLW1texP1LXcfrWd2Xi6+ers4NGEW+CtsNvWMtzYe2MrLIijkdpku9oRsL8s6/g1VSBJLGXCA82G3tni6Rw/Err/91M+9aYTaDN3WDj4ZuUl+6amEPgmmDhvvJN04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748156394; c=relaxed/simple;
	bh=n6woNA1KAB7A7cPpCh7C05v8CU7LoOLG7R9vYiUjRdA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lYlCf7ZyqFcJn8bBtkfyM+psYq4DWpiguKbebyZWw4V+JgmHVjX3o8WN3QFYEHYDKymk6lM8fYfz7v4LiUUlXeDXN7btX+22wo76mgCgEiThDSQCDgZqDDqAK1ILIAQOar48B26KYKWikTScKDelkCo+sy5Xl1Tui9DnKM2w494=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UVvhBPTP; arc=none smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UVvhBPTP"
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-604f0d27c24so535556eaf.2
        for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 23:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748156392; x=1748761192; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n6woNA1KAB7A7cPpCh7C05v8CU7LoOLG7R9vYiUjRdA=;
        b=UVvhBPTP7HmOm9yKbRkz20Mr8ZEov1O9XhPd3CBuNcgADp6AM9fSJ6oB+8jCUMzaxc
         I/LfhU0eshomUeP4sQ2NeOEC8L7AWJuCyC1fIBK9SOqPjfKQjzY9m4x/+l5M51dRNpkX
         uhnSQY8M7p/q+JyV1kbyB3p0z2/ACL6h9k8gpn0B3krEN96Nl5rompNeIxPkSkKmwDgn
         t8jAV/DLvnt45tIkUc0i7vfDylRDcXKNf6xEl4ap3Y0SLn2BiZFCn97oIXfcl8qU6CH7
         yivfdGNzRpLh6UPckD1G2TRbBkrd/DtzuiKTdzS2Y4LGj5lIvfoMz5U+JT+ASN8/ZUr1
         /bJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748156392; x=1748761192;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n6woNA1KAB7A7cPpCh7C05v8CU7LoOLG7R9vYiUjRdA=;
        b=j98myNV/2axeykqVxOvJGqR69ziN6Hh3UwtQG0y/IEUFU2pDlxrpka6VuYm8UXFFxQ
         XDQHVIK+6uv21k1oBONPyWvtA+r0fIWv4CHoyy3hUwnWTM5PS4grDLrZ6Vcak7n/fUXO
         ptzEQIuB30A7S/4a0bQQrlLMow+m/LJASLCsNuTDuJipBzx3kbzmdiDHBQupKN5E06XO
         ktEm77oslTuys2NVktDpxFj2/Q4WgJb1ozo5/OzfPOPqc3/6zVwkv8AxzpWx4msdr+bw
         UG0iaLJaLjF3Ys1LgavOgJu2uc6e8KxcWahZDzmEOo97F2WRglKMEQbLmLQQ+ypO7qMk
         bqVA==
X-Forwarded-Encrypted: i=1; AJvYcCX+n6SAd/GXciqK8JqKQ4JeBXhfKTw8OXh/f0j1FyK4URAZe8XDL2w63adIA+m7YlUSDJY7dB1jEtsFxxk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzC031CHyv/QzZw+aaBJBMPX1M/9gx8SepPUYvbcXtqyKZPZOa3
	To/3IU1KPuVJGl+8wgwpGnAl9tbEihVK+2l+lIUFlR8J8fNFwZG4eD/Sbqo9tHlp4nCT9aZAzzn
	+Me8rNZtGfcBPUy7VrBt2h7HUdcPAdMx7fiImGlvocQ==
X-Gm-Gg: ASbGnctAh9iPRL9Lu9p9AelZzTNCAnPBn5/+AkCQdeYmWd0JBUmAtBjfCdYS/jTx9D0
	xB8okmBXCBWfzyPAmbfKF1KsTOq5b3U3Ges5dqEckLte22X3JQvo3ePufOCZN4kmk60WxNwVYqh
	Ziz9GclrgzU309dD33+IhLFvDRPAttczOvmHHY2S/d0R4pU5164savOQWGvHVfFQ8K+w==
X-Google-Smtp-Source: AGHT+IFgDLGOtCqohcdRalUhWXVpC+KpngWsK/Rw8iIAXMgLPGD2nNaWQvQPUiC4kmvZXurqEyjrTqM9NmLsfftktkQ=
X-Received: by 2002:a05:6820:450a:b0:60a:bee:497a with SMTP id
 006d021491bc7-60b9fa62424mr2365200eaf.2.1748156391776; Sat, 24 May 2025
 23:59:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250524-b4-max77759-mfd-dts-v2-0-b479542eb97d@linaro.org> <20250524-b4-max77759-mfd-dts-v2-1-b479542eb97d@linaro.org>
In-Reply-To: <20250524-b4-max77759-mfd-dts-v2-1-b479542eb97d@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Sun, 25 May 2025 07:59:40 +0100
X-Gm-Features: AX0GCFtzlZ4NN5rM8kQ4Ddqkxfr236WnLwsk7oYUXbS3dPkq764kPsxxis5Ykos
Message-ID: <CADrjBPr2ie+6vNZK0oUH75whXDqX-oXdOODcrM75gMc0LmxoYg@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] arm64: defconfig: enable Maxim max77759 driver
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Will McVicker <willmcvicker@google.com>, 
	kernel-team@android.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 24 May 2025 at 06:21, Andr=C3=A9 Draszik <andre.draszik@linaro.org>=
 wrote:
>
> Enable the Maxim max77759 as this is used by the gs101-oriole and
> gs101-raven (Google Pixel 6 and Pixel 6 Pro) boards,
>
> The child devices' defaults are based on this MFD driver's state, so
> this commit enables those implicitly as well.
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
