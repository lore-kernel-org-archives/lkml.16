Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD3E1C5D55;
	Thu, 24 Apr 2025 11:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745495679; cv=none; b=pF17FRjTmZ6MzIg8QwBEApy7k0x85W4LTfR/w9ZKOIrUiz8K/+l2cJ9Pho0ARPk5RgHE1lnQbuPyLmV3V5RFLcF417L90uMCZ6l81/ncTrGzxYwTr5tygRH5Va4hqUvVvu+76+nb4rThsIAsZpJ6SB3jZRLIVCzrf2lumwRQaC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745495679; c=relaxed/simple;
	bh=2LfjVBYMaapqG+RGUDzyZUCD3VsHLRQTARBAX5EftSM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qrDgPLEq56KbU4PHbs7YCGHEj7HwJuXheb3RUluSnssed1/ixjy3jA8TyA7pc5DSPg1RPf+HwX6UKnTER891pVkT6zscNiifdTU0x2khtTC+VnM+73GhMbt5P1lpX9cqg5sK0eOaWWstxNmVPxHKWu1CRmGBVi3xvnuWa19aM+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kv5BtFUS; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kv5BtFUS"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-223fb0f619dso9582365ad.1;
        Thu, 24 Apr 2025 04:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745495678; x=1746100478; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cOeIljM0dsLpiUp3sMIwGCn1MBf/0oPhJSiBM5sc4As=;
        b=Kv5BtFUSMcO3r4Rmm0vtZiWU1KtW6zLyykVoEAFecAxqsCFRYpwRt5pp1VDPKEfvIy
         W+wwwhl4fBgY44XKBrSoNlduK1JMQK93aV3979AZ0e3E5LVKYZT0eLXhaLR62FSIimOj
         SYD37cYr+mpfU3etx352lG0igXHMeItNrzcxYrZ7MgVQb/L6SmG74H42WUZgqzEHAMzI
         kpgN/OPY1WoFtvv/XQtScf28ctzREUd3oHTY4Mvs66TgDbiZyY8h36zHX9iOCz1pKhom
         TKIW225o3vV+C2Jp+qX16xsMPEMEP3x0gbwgW4xKb58M96w5Ar734RWjsJzGcUCq4xCT
         ZEKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745495678; x=1746100478;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cOeIljM0dsLpiUp3sMIwGCn1MBf/0oPhJSiBM5sc4As=;
        b=qguGVToOP7vUo+VUWlMUPP/cC5IgzYwZ/rMLGpqX9pxGettl0dg8tsil3bu+eMbAwl
         twGXzU0a/H52yR7WGGqHrtPIc3PpXtPZ74qzILpi0a/df8NWHcqXHY1DG00GXlvqxeUJ
         nbuLwW3/Hf8zBolng82EvfrClmRNxJ8cFNee8RIQq629HXVuAfLlEuOJrFoT1Eiy+Wkz
         C1u14ozzj1k/YXWIuISbolo0xnWuvAnZJLfpH7qguBO/v99i/IneeLQ3+eZNmHbR/fp0
         2jeXYppjVQvMT1UJU7ijFn7CIOO+x799iKJZbLcMVMmCx9qHnSH5EhR7Yfa98UjNojUZ
         IYNg==
X-Forwarded-Encrypted: i=1; AJvYcCUWauvcQYe1FRGxmWQr3DF7t4NDAnDFiYY2Xe0jSjr62X56dc6DTTgVdV/OyreZXDkvX4f76E5+hLRb@vger.kernel.org, AJvYcCVR5yK+6hxQ18/HnxCe16gNoJOjevzDi4sVyfH11FuGRZsTt0ALz1kbkKdDGaSb+ENp+Wg0bQXRLdJqXrMe@vger.kernel.org
X-Gm-Message-State: AOJu0YyvUPln/KrK0kJJBBEr+sn1BQk+GaQmGZXzDY/DjlvfTrMvoyun
	PsdN8I2MyUR/28Jn3tUiy3uyuOu7JgPLHLmC3zhjsTnbHt5iajx7Fnd+cZ0MqCIK6D0sGPLB8me
	13OVFk7Zuhqb3f/Hqz0KXvQj3xiU=
X-Gm-Gg: ASbGncsmUqme6owxfitLbfOoYLaPJMw8glbeIoAz1gfXAs3KHMpOmed87NghP7jQNdP
	oAXwE/rhvx3Dt/lIqjdsU1DuwoOdw52Y3j5AVxuzbzaw8douFQjYHZMRvZBxuV3fYPJ48oIEfNZ
	gUp9vySLA5DEYwIrm8bQ==
X-Google-Smtp-Source: AGHT+IEwa/y2fOKiJtPJOHNNBAcDhjfvq/eByFcVBE+2/Yf64GYFD5P4bbwNs4WymJaSgMNAyONJWmAiuB1qSHp44q0=
X-Received: by 2002:a17:903:2a83:b0:227:e980:9190 with SMTP id
 d9443c01a7336-22db3dc0b8bmr41057205ad.44.1745495677805; Thu, 24 Apr 2025
 04:54:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250424084800.105300-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250424084800.105300-1-krzysztof.kozlowski@linaro.org>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 24 Apr 2025 14:56:28 +0300
X-Gm-Features: ATxdqUHiE5YmwRp_Og4qSAkF2P9kcgp5oyollWnIMyXy-GIrHjsW43cM8hbn2Gw
Message-ID: <CAEnQRZDjKpUDgj5FwxGT-vK8WNGqdtf0JXoebsYqCYbWkOnUww@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: imx: Align wifi node name with bindings
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, 
	Christoph Niedermaier <cniedermaier@dh-electronics.com>, Marek Vasut <marex@denx.de>, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kernel@dh-electronics.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 24, 2025 at 11:52=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Since commit 3c3606793f7e ("dt-bindings: wireless: bcm4329-fmac: Use
> wireless-controller.yaml schema"), bindings expect 'wifi' as node name:
>
>   imx8mm-var-som-symphony.dtb: bcrmf@1: $nodename:0: 'bcrmf@1' does not m=
atch '^wifi(@.*)?$'
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
