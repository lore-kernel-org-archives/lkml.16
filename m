Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A27FB2989BD;
	Tue,  6 May 2025 05:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746510305; cv=none; b=jVQikv+raKJtq7VQS9e5Yj9o6fFixQeOBWcbYcwWzCBmxYxM62kOPGbENluRWFQyd/IS75r1WKs9LRybO2JjTztVcRFPkWGJnJVkjJ8NkVSy4fX5Oo5rPpyj7iBucIQamxd2cwfkTrgb8dZFoDWvl/FgNNNg1T6GVUq8cfx0x08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746510305; c=relaxed/simple;
	bh=7QMw+5nA2GGVua9gtBE8dFrWvOjPIYNtXm8x/tSpfgU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iRKFSlssWPSjwOVRhMpkgy6DU4HWLHjPpj0u4NcRGNfX44mn5ld1gDuoTdCP7YCftAUKN977akb0xCShVbAXlHLeD8aCokqBixV5kRylWPz0f3t+gCHfgcec4EnKa9bpz1HeD2XmW524dfoAr6U6j/Q7VIT2qq5ckQ+5Ryj6uzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=KLizDeGY; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="KLizDeGY"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-22438c356c8so50925245ad.1;
        Mon, 05 May 2025 22:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1746510303; x=1747115103; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7QMw+5nA2GGVua9gtBE8dFrWvOjPIYNtXm8x/tSpfgU=;
        b=KLizDeGYMr+2DlL93H/0AaSzG+kkX61+yeYpHNTIdfUprLxPvcQmQVx6T9OWs2yMur
         jMELMTaU98zHR8d0MlHKeVdhYwpJqK51gYOxR133qsyLoVvcyXFRy4SodueFHTX1pPhi
         MePeym3RntrJeCd/Ty7yErKLoMjJQ4ldpKjWIDDzZ6gYoBXzVey+cKHxd8nYByoO2NKa
         MCae3Wjv1kLcG+wR/V+SENOuF0rMiTME/L6lqT2O4npcA98AaRNFPHxy4lYTsNa8CyNt
         HXkiVGtXV7/ZMAvheL0Vt5ejvAa8KQrUSwSqE/vQwNzpcTtS1Xl8do4dmL5ROe+p5ZFm
         IfqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746510303; x=1747115103;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7QMw+5nA2GGVua9gtBE8dFrWvOjPIYNtXm8x/tSpfgU=;
        b=DtrgnYNL9N4/vx0tuOGItSnlg0asLiUr7bYtXBhxzhbWIGJRik24Yei+tSv0WwjmTs
         7urehqt66n7Cdu2wklHootTWS1mZdV0TiVe/J0LQsmWRnTD2iF8Q8nOdX26hGV1YDONE
         rB235An6WhbdKk6McTkmDa8GHuUZb7bCRzoYQq4RG0nAmB4LEnt3V5d8EiS7DK/99Mtx
         DDPGO7yKdN8YgT1DSFh5zqydKSWYjopD5pxHakAjL+qApFAyHOS11xilJf/kqEngP0q9
         UKeVtC2sPuUsML/duMFQ/OGGWbb9jPxr1p9U501ghIrcuHFIdfESGQZxMZ9eHNmsDucm
         bLOQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8iNR6qtA7rbz+DC/d4uuHXhwpaX22Wu+ThyRCuAaU2fudtuYWEtkUkjrif4tpHot7gA7jgbDCzJmU/Opu@vger.kernel.org, AJvYcCXZAJkf+vt2DWouLpt3dCF39om07aBsovXXVIBpy3a2oGF7ig/O+pSPnh4TDaza2Eq7VsaeHYCUTXoD@vger.kernel.org
X-Gm-Message-State: AOJu0YxXWI8piEHwsd8iu1t1g4DgoaLqxvES2PJxmnZK+f5tLDpVP5A3
	GnTeUIGM5p3zjzU1moPNycs7H8Pg+O4UN+UNZ5CZk38LlWcZQGWQZVpCt8G8QqwdiJBIyIDJJJA
	LlC9Li9rKZ6ZM7L6beNlQ8TkPBfs=
X-Gm-Gg: ASbGncuHDh4dSVoLqlR8LT5/ZHzuqsC+tCH2UlrTm5yJKTc5HlLlkRVPaCgS7kRsfCc
	bLO42JOJMMTTGq5RaKkbstpiGNYAg0336m55tkfuw6tpJYQTb/USwYkblbLlcIG39g21NQ+iAIz
	rJLAr+P07V6pW220NTEoOBURCM0Lsj27BLrXt87ab8TWYmwnE=
X-Google-Smtp-Source: AGHT+IEAtjZAiVW9FmeIPs+b2L0Cy/C7fmszykHtPtzqcf1LWGqQ9MrO3WWZWQisFX6hdN6dX2Pwfb6vvI+jq0mf724=
X-Received: by 2002:a17:903:1ac3:b0:216:7926:8d69 with SMTP id
 d9443c01a7336-22e1ea95042mr127743175ad.47.1746510302790; Mon, 05 May 2025
 22:45:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250428-fernsehfee-v2-0-293b98a43a91@posteo.net> <20250428-fernsehfee-v2-3-293b98a43a91@posteo.net>
In-Reply-To: <20250428-fernsehfee-v2-3-293b98a43a91@posteo.net>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 6 May 2025 07:44:51 +0200
X-Gm-Features: ATxdqUE0-lwrubrO18uAn6fPR3DZquMt1RXTKqplWpMfrQ3jLYv5ONhvDdTbeEQ
Message-ID: <CAFBinCBVZeGk1QXMhwqQR9k9vJqDR3Hew2gxMxGZh4+SdbARFg@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] ARM: dts: amlogic: Add TCU Fernsehfee 3.0
To: j.ne@posteo.net
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 28, 2025 at 12:44=E2=80=AFPM J. Neusch=C3=A4fer via B4 Relay
<devnull+j.ne.posteo.net@kernel.org> wrote:
>
> From: "J. Neusch=C3=A4fer" <j.ne@posteo.net>
>
> Fernsehfee[1] ("TV fairy") 3.0 is a set-top box with HDMI input and
> output ports. It originally ran Android 4.4 and a Linux 3.10 kernel.
>
> The following features are tested and known to work:
>
> - Ethernet
> - Power LED (switching between green and red)
> - Power button
> - eMMC
> - SD Card
> - USB
> - Wifi
>
> The following features are untested or not working:
>
> - HDMI input and output
> - Infrared remote control input and output
>
> [1]: https://fernsehfee.de/ (German), https://telefairy.com/ (English)
>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: J. Neusch=C3=A4fer <j.ne@posteo.net>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
