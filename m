Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED0DF1F55F8;
	Tue, 15 Apr 2025 06:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744699792; cv=none; b=aC0nypW7W/bgDKgQkefAF2o+WaD/vJRRDTUzbyon6YtEli7fTL4VUSeVEHUXwvAVAdyxKL8yyr5cWLwHn4+NJ2xf1hm0MgtCIhHynmdYOhX2K9r2gi2DaMK9k4JpVoDqdTzR554SCJm+EMcksQhhU9tqQQrYdrUAdhkpGtx737Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744699792; c=relaxed/simple;
	bh=kJzx0/ptwNomLA7kasvYM1WLB6lv6Uu5JbFGyyL9hDI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PvkB8SU9S7U7VeqgDCbT7c1aQ38QSm3lGqk6ccSMMG8sfyIfAF9M7p/SWeTWRRaAE/Ilp35sq0Ngo3ufH5z7/lPh45O+fnJskFn9FO5nUbKB19zanewpnATRIFR5ZYuVa5Y9qFh8btVpLTQYt+zwEIP0ZfHL3Z1+McFMs3dFEcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fA0XE7bl; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fA0XE7bl"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b09c090c97eso962461a12.1;
        Mon, 14 Apr 2025 23:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744699790; x=1745304590; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kJzx0/ptwNomLA7kasvYM1WLB6lv6Uu5JbFGyyL9hDI=;
        b=fA0XE7blk31XHkji0RZuXKjmcbTEInPPzk3BZlY/qk8vPdy6mJnPymyhR2TIbMEO+C
         kn1seVTszJWXHSX/ID4tEF+s6yLr14ATeFxVExPFtdx0Bu/hn4aPHcm+J5jn5NDVpgI4
         crfRmhpdz6MSoC+u5RrWuZTLlEIcEOnhbQJY8AcPFmf817PyqLcbq591BBgaMRYY2tuw
         oXVsOx3cG5EKnqom+g65L2hj2CWtuUgDW+PiUbKT9+aUgHa9wMz6sKHucn0qxifvQc+h
         znEBLY59Gd6ibyGaZm0M8iLOOgwTN4zXsc4k1xe+T/8/f/JISZ1/b/uELZk/jdJDscNr
         KoQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744699790; x=1745304590;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kJzx0/ptwNomLA7kasvYM1WLB6lv6Uu5JbFGyyL9hDI=;
        b=bX4ikwSuemZqA1FCDvvLUr0Y8cfhNkyh0XN7ErWgJewfZGpTINWCGyPN4O/ILbDMph
         GXNlovM50eTIHISyOrAZr2ep/E50XzprKtZXIUdstPz5VgrfNeLLjY1rg3S2IFxDYgHo
         ZhlK6xBkgoOc2PUFBLfdjwN+UbGV5is/ZCLi9EZPKCePPletfzYXvSD0qS1rCIKoW3ln
         kZpA/q629Rx5a5C5NQZ/DBjZxXHq+hn2E+M7tnlLRyPpMzS2aY+t6TrKRRXco3mF09Ic
         UBzIst9Yws20oPEq52u06wlMmvtd6NVgsypN9m59p/Yycqr+MFJyAgidoKBXnGe/2dmP
         ntvw==
X-Forwarded-Encrypted: i=1; AJvYcCU/3lpIqr74UKO8qinfeacV8fFOVKsT4ZdW8q6KjZBksLj7semGAe4j66/ya2N2F2wEBZXwqlNRkOFdf2J2@vger.kernel.org, AJvYcCUKlhTvRJtsLm0fOnveYIyv7FQljbvvsBpWUz5mspXkwDJFmPmmpo5R+ae98kuc/E2q9QI64RB4N/1+@vger.kernel.org
X-Gm-Message-State: AOJu0YxrB/ZswS5AQEEiE7rxXFuBgmkjqaJkbflQfKgQXBU3XuzLklnV
	K2vY9Pi3+HfHYg2OIzIUAhgUehUn1vqMSXK5ibkgcomwXUuJHp+sDwIPHBB9MYqSdoudhCQ1b+S
	UbTrt4g4Gha415TKauk5YCoL8EzE=
X-Gm-Gg: ASbGncsfADCgn+HUpJw+LAbfv+Kg42tsrw8Zv0XUXyERFBDgJ2pndcmZY4tNnCwgUTK
	HCxqABUOq7ACM+7p3JykrwnaWbJETyJahGkRvUpYi/dLimBwvpG5/t0d/MmT2BPGbyp8j6ieP4B
	uGa0Y4568rZS+xGT+ufg==
X-Google-Smtp-Source: AGHT+IFMZUtkQbu7mm7ZLs+kY0QKdEKtmThlD5QKRWrM4g1DvYwjmO6k9i/uFm77B2cDKAYrjrYbbSSoguq6moDT3Ig=
X-Received: by 2002:a17:90b:3850:b0:2ea:a9ac:eee1 with SMTP id
 98e67ed59e1d1-3082377bff7mr24287491a91.10.1744699790057; Mon, 14 Apr 2025
 23:49:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250414123827.428339-1-ivitro@gmail.com> <20250414123827.428339-2-ivitro@gmail.com>
In-Reply-To: <20250414123827.428339-2-ivitro@gmail.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 15 Apr 2025 09:51:34 +0300
X-Gm-Features: ATxdqUF2mlCy5wLvRgtr9F6qqRWxDpa7csK2QzF8vZDYH555TrufO2MOn5eZ-98
Message-ID: <CAEnQRZAb9DBVQTZZ-rDkn3aBHjQSxKHe+Ru8d88wr_oNfk6ebQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: fsl: add Toradex SMARC iMX8MP
 SoM and carrier
To: Vitor Soares <ivitro@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Vitor Soares <vitor.soares@toradex.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 14, 2025 at 3:39=E2=80=AFPM Vitor Soares <ivitro@gmail.com> wro=
te:
>
> From: Vitor Soares <vitor.soares@toradex.com>
>
> Add DT compatible strings for Toradex SMARC iMX8MP SoM and
> Toradex SMARC Development carrier board.
>
> Link: https://www.toradex.com/computer-on-modules/smarc-arm-family/nxp-im=
x-8m-plus
> Link: https://www.toradex.com/products/carrier-board/smarc-development-bo=
ard-kit
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Vitor Soares <vitor.soares@toradex.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
