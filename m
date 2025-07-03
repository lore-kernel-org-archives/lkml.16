Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F172367CF
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 22:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751580045; cv=none; b=j1Con51oc/nsPNDGYQpUVw+LQrYd6Oite9Z2LxPptSYeeBkPqoaMiZQGZSF0SSQeZsQnYoQUfm1NfxelGpwVBGkTtrlWwU+3bRIPkpTSOuLoCcNfiSD2G/TtJlIt3huWzOeqrnOzGtyBq27SntqMQniAM7lS9gysQrf0ucPa96I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751580045; c=relaxed/simple;
	bh=QM2hfhKy3jhksca8jVMMVVgPl4y67/QsYQzpDbu/sTE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PnNy0kkbmV6Vi4TLe2iO/8uC+PZMn47tsrOqVhPm2v3DYhdute1qxrWGz/nIcph1gMpsQERK+c8dSP0BFRc35pUROaHtXQ8Kma9AhMYrtPlWbK48J/Cne17vktQSfuI0k2Dh50QQ7lGDBGbCoaXeD8f5GJE/2YntN1eHKGbCsOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B499p7Y8; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B499p7Y8"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-32adebb15c5so2762701fa.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 15:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751580040; x=1752184840; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QM2hfhKy3jhksca8jVMMVVgPl4y67/QsYQzpDbu/sTE=;
        b=B499p7Y8cO8MO11Kk4wVEiUQd39Zw6vdFHuzkxwsIMTMwC42xfdfBFVojJnJAysE6r
         4VMsxAQRRcIjENMz5qtcJ1tJV61to36xZfpg2Q2dyg0k8USQLtDEaDbCHFduCMa3ELJG
         Y4dbEV/lwuE7Lz26UYYDMt3a6zMTOj5/xajZiVUJeAqGCNkJzIp9IrIhWNPjfRbpRnoS
         5UL16+AmFVoexihnQVkwLLUg855Rl48E2K9RLF3Q/j60YF13seyBLHde0pHnImQzpyyD
         zv5dKp7FuV1tcKV2yE2aC5v+ePTQsQsJ7Ft3k8Ki5eNFp/R+/4g2af27A1giyctW2C5R
         fiPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751580040; x=1752184840;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QM2hfhKy3jhksca8jVMMVVgPl4y67/QsYQzpDbu/sTE=;
        b=rdWfz89YiA6SvOO3Q7QtmOLFPQuGIrfRNl0+eE6jkUoUsjIGPtzy3yUidnVI/NRxPj
         +zGMMFJlZ78JZmsI+y6cachDoK4uu8wpbRicEsek8/qJhnlXSjHUiA2p/2fxmJyRe8pV
         AEtn/T6TiZTVRAw+O5hn21E2X19beLpb+yDl59DwDlQZN9pCsxqyw30z4EBNhyjTp4qY
         rKxUtAuxkZLo6IlSmoDY4PieciDMjkVI52wVwBA1foJqMJ5si2gox+U2piCIUnWqwq0J
         //V5TrIUkV41E7bNuXblvjh5yRu/K5NzP9O8u2IB2UqpfTnQDb7a5AcPHYMYANL5iZMa
         nWiw==
X-Forwarded-Encrypted: i=1; AJvYcCWUM9gIYlNimg+IgHzwXXJ4kucD7wDMAnccmoaA+eKwfRyRBPB/fmxsncH7X/CkIYqamytjcPQH3uuVLts=@vger.kernel.org
X-Gm-Message-State: AOJu0YwlpCKUXhS6qiuWGJCOJqZGmgIQMvUMow2+zmLcgSZxEna3oBKU
	V0ntVetXJOGuFgqqzW548y8r9EDIAdzlurn3KPSnjaH49KnDEqfIge6KC4GZGX2ZqGM8nQDQGQk
	EZ1hGWePUha4iRx+TyfKtS6sUPMdxOEiXcFtQe1NvuA==
X-Gm-Gg: ASbGncuL3Smj2FMFgc+uCELFseJnAEF4UqwN2vq8F3yx+g93Zr+asR+U3oLMBCTDG9g
	XOG3YWK8AYuV/vEmd3GJH0k6bjQ9UCjhVtKTSB+gDNDa5VkqBJnRdyckcWwpNAZ4tqaCKBuNa1T
	ScEO6i7fyilH+PUQA6TKlFGcBPjrl+C4Yi0qpg+jLKeOzR5BBFpxvJGg==
X-Google-Smtp-Source: AGHT+IFOg19UiUE3TiCmES8XgOiPoWe7IXHAEBmzFu74XNzMO6mLnJFytBrmkTs0o5+cmuS3yBGZJGpr3iPUNTe0hDI=
X-Received: by 2002:a05:651c:2149:b0:32b:7ddd:279e with SMTP id
 38308e7fff4ca-32e5a501965mr343691fa.14.1751580040326; Thu, 03 Jul 2025
 15:00:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250606160359.1356555-1-Frank.Li@nxp.com>
In-Reply-To: <20250606160359.1356555-1-Frank.Li@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 4 Jul 2025 00:00:29 +0200
X-Gm-Features: Ac12FXzt-R2yT2p2gdap6KBqFivqmoQqCjxQv9f3OTqOhOSRfpfG-x99NP7EpuQ
Message-ID: <CACRpkdYD7eC49n7pxvjvrPE_Z-5MgOZ+VdESPD7AH5CeneVojQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] dt-bindings: pinctrl: convert nxp,lpc1850-scu.txt
 to yaml format
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, 
	"open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 6, 2025 at 6:04=E2=80=AFPM Frank Li <Frank.Li@nxp.com> wrote:

> Convert nxp,lpc1850-scu.txt to yaml format.
>
> Additional changes:
> - keep child name *_cfg to align legancy very old platform dts file.
> - remove label in examples.
> - just keep one examples.
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Patch applied, thanks Frank!

Yours,
Linus Walleij
