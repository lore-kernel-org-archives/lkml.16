Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39DAA28DF0E
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 12:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749557226; cv=none; b=X4xaQrEqivP3IgLbXBN6r00TubCuKzfHkO76XNVAQQ7S5As7l3+dKH0t1UWJJTo5yWpL0B1cjX69GShGXByz2/iH0E3+HP8H6VAMoWCU9EP/BagiOveO9YQ/zJYG0kezJdJS3Rz/FJ78OCRtLp9qP0tunJqBPUEmo5xs3cGPUbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749557226; c=relaxed/simple;
	bh=upEgacp7mnJpqnEV2jZLm7bdZrVLCTZ4Uj3awIoWIUE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qKZ2xfJ7z+PIE4sU9kWZMc/ksfCDQl9OSKMQJDII4aUiJs28Jvic1lMjbsEmeuVZSlW/nIppzXeHKsIKmEL0RS2YH/dOIRYGSM0qGNNuWK/s7XaHG3zL9rAqkjPEUKIQIjIlACyRAWPHYlkuJHheNKG3YQYeMXPbjXtQ9Ygc5Vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=I2Cr7Xjc; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I2Cr7Xjc"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-54afb5fcebaso6404511e87.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 05:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749557222; x=1750162022; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=upEgacp7mnJpqnEV2jZLm7bdZrVLCTZ4Uj3awIoWIUE=;
        b=I2Cr7XjcL6Qqwdyyk8lEcpav4v4NYbibMuKkuNCyWCLV2vwu8n6d+Lp/wRLAoCAFb4
         f8S3onkfwz/AZ/YLNKxTxdSqPGITGRNfO0mNQcwTsqni5VsTD/3LjoOCD+HFdRT7Db3q
         aN+ZVgwlQh1Kh00vXlGrgvZjtMRdWdAFKgTdk5Bf9xfdZX+jRcehCoEDw0vMqeo7vnV7
         fex+mmoZUVsI5lkqDCV5eYxkLtT/S3FiX/TwedMUvsMNWrASwQim2BiAKNChrZ1APfKz
         CCSbUdwNC7ZzGOxqZOpJg0enroMSvqJisuGKxogj7zrY+dtSLueDsqRPvjUiYPQhI3CF
         JgxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749557222; x=1750162022;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=upEgacp7mnJpqnEV2jZLm7bdZrVLCTZ4Uj3awIoWIUE=;
        b=PV1B8IfQyXrndWkNWlhRibRe30D9N/7C4UrMrkxnQQv8HmZyp2PtSUWAS6mIDgiZok
         LdNSJDVVsXnJP+mhPfCCJ/E5fgpC3XwSu9uB19WvEQ3M8P1MRO3BdZ4eiMCX0txTXEzk
         VuTfalKMrCndYh7CDpJ/SNkZmN+GckwMK5TLDzBNUtlQxdOFKipH2+ruyIEZy9XXan0I
         XHnD55TJIizKncDcnQZeffeZj6slC6Cs8wqjdYnPL1eKZCDrX6BKvrpsxRa90EetiH3o
         Xy0qXqAH8kzCvAEo3wjkiKFJ0W5w0zy3vGFok0KEf04gX85aI2So6umbGlNmOddcnh9P
         rT8w==
X-Forwarded-Encrypted: i=1; AJvYcCX6n7xSbOPWYt2hu5/xYOZRm/aflFP9KjpiMsJGgyT2jsmUaMmgT63Jpb6gIrHNfd24A71LpTcXmgUmLTs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyrI1EVwzFHl9tfzpB2s8UgI/p/GDsnR/TdvRTn2vhxkhpLasrK
	Tpe7lRbkAPvHTAkUaLvpXwnjxNpWWktnCcIo+QwoQZghPXnBzDbr2eWHFaLAkXzaBddgu18UKN7
	5S65kswPhBlqN23oL3vrAsoEJ0132XZz5zNxcOymyEw==
X-Gm-Gg: ASbGncvEcOTImmnrsyIBcxR8YPN1kNK1Vbqx++XTq9zluede2mB9ZOTcDWAwdU30tuI
	hW9ORvsiTrn11+UvogECGCgeu4HvbDPb1PqR2gSMgKMRFmIFG/Nq9lC9a05lf0gBElaMrELf8eV
	J9usaIhmLiRYqvT8C7jE3P3hvQigx9D57oiRoJ2SJexbmyjb/3Bw5ScQ==
X-Google-Smtp-Source: AGHT+IEqz0WMqtI0x3GGlKwfWemlBSbd12UaQPMKKY+qV7hhxbjKafYK8sYr8Wg2JEL7ScFpC5Ui0NiE4JM2Acs5Gg8=
X-Received: by 2002:a05:651c:220d:b0:32a:ee4e:56ad with SMTP id
 38308e7fff4ca-32b1533b1aemr8972041fa.33.1749557222298; Tue, 10 Jun 2025
 05:07:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250523094319.10377-1-ot_cathy.xu@mediatek.com>
In-Reply-To: <20250523094319.10377-1-ot_cathy.xu@mediatek.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 10 Jun 2025 14:06:50 +0200
X-Gm-Features: AX0GCFuHU7ZhdHSe32gs089Kj2im6LDUCERAjIX60g6Meb5i30AmFDVd_Qjjj2o
Message-ID: <CACRpkdaGMiNwBAa60hFzsboV3JCj=sWVz-NKah=eNk+vVnUHVw@mail.gmail.com>
Subject: Re: [PATCH 0/3] pinctrl: mediatek: Add pinctrl driver on mt8189
To: Cathy Xu <ot_cathy.xu@mediatek.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sean Wang <sean.wang@kernel.org>, 
	Lei Xue <lei.xue@mediatek.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Yong Mao <yong.mao@mediatek.com>, Wenbin Mei <Wenbin.Mei@mediatek.com>, 
	Axe Yang <Axe.Yang@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 23, 2025 at 11:43=E2=80=AFAM Cathy Xu <ot_cathy.xu@mediatek.com=
> wrote:

> This patch series introduces support for the MT8189 pinctrl driver, inclu=
de
> the driver implementation, new binding document and pinctrl header file.

Cathy will you rebase & resend this patch set based on v6.16-rc1?

I think the code is ready as long as the device tree bindings get finalized=
.

Yours,
Linus Walleij
