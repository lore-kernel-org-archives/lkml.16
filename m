Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1102C262FEC
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 09:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745399397; cv=none; b=Cgzoo4YQLxginsbj/Rq8l1Ks7meAzr7EqubkEz1UVFI0q73l6YWkjWzyFH28DXkdJ1Q1PwBp2X7Vr0USAOZjs7HIdmMU/L9oHcgDEzoCpVwdNrema7/LENkOb3rBW1phFc3SUsT4ORUIPP23kEZTKwhhIAB27hmteCGLDgQVlPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745399397; c=relaxed/simple;
	bh=D9zJsGGNBKvUtfUTrtoCvCv7NgLrgJG8N+UC8V4uJaY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cin8XJtr30swtFtdAgkSoqfj4O5z6uvvVB3QUqSdSigLDhEe/ZS1zMAD+KxYhn0SB2XKM9amGLH7LeJCekfRqXPGtoCQQwOvdWsHAS7DHm3yuR4MbMVRFD8MfnMuWyvSMtslPh8F1P3gjzFI8sOxL83gNTywOyHo1+kEDmo586M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Pl9VrsOZ; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Pl9VrsOZ"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-54993c68ba0so7075358e87.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 02:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745399394; x=1746004194; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WARUA/SEaM7gTnI/pqNkLOZLeUBM+XHsQtQUHb5intU=;
        b=Pl9VrsOZekY5NXHTUQ3uqtaasg2AmAMWacA56aj4pmYr1Prs/8o1NTQfEBKQSR3MTG
         x33yusnv4hNxBJjwGUA/R8qN4X6htQTjOP6XB+ebq+rSVft1iH/An3bquuLaoLAPv2XI
         SG7p4ZNnMGBVeTrFpsup2WZD/0nMmD+Su9D0petDlET0G7G4UvsXDyXxoasXiuYtQUDm
         OOjs1fsCxFnkFHjbNDEs5GmMyB8QxCQKAoWlb95KDGXZ1y5xn2uqppepECzBvM4qdYgt
         JX9JW6v6ZPbRlJNs2uj0BJN2KMyTAlvNBolSh4MbtPJx2w9WDaBPKlEAn8xjICZMLmsw
         5HLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745399394; x=1746004194;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WARUA/SEaM7gTnI/pqNkLOZLeUBM+XHsQtQUHb5intU=;
        b=hiC/bYfMlZFGBPuEZ1pTlKhCi9acPIRyN9oQ8OCnI72D9S5MA+SpTQn1bjE8PycjjV
         nODj7JOvRHRAFicPZY+t8LbYDHUAwGQ1pdM5Cbp4r8EClEs3uDt4FZ4PXMt8DdSDUG9L
         7Om/gN2+7PNn/p6+/7vLxCoevrQ158BYh3szL9ISmvSlNyghBA+5vX1q5sBELlUDVTOU
         EwA2uDo4KeYVU2dB4uCml26sUyjFFGtKB3V3s1hoGVG3m+arwelSW3HSSjdt/tB79b98
         nib/oNQpx+4tKAd6ssSGyvOVFISpeeB6K9LgRvK4MjDxg5fYxEEKsl1+1hLfuQ+1Z3S0
         lbDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjV239pNCVE7KzZHMbzF2O9wSWfD8qtAOU6hlSI80V+S8ZH60ZNIPe4toOfKoPGkUu4NoBZZ6Yf6yHLEE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwaaXfWVGt0wykUU2Sp6wlL3kkjrXRNRs7c5YdB4MVMXOi9wvAz
	Qq3qvC7QjR2swspScj5eD5g4QX9V7wNJrx1oUSmcQTo+u2UDXtIWU+5GJGgUsHHta0Kw7HQRrEI
	RpHeU+ggY5ahz7sPukOqXVjvczMUI8+LN/hhkiA==
X-Gm-Gg: ASbGnctRvaEHWFmzKfsCl0TzJH7SmW5R8deDjyqsPZ0ZIzFkqoIIwItogvJ2w5ZNtUx
	nWQTukbSDJ7WzFY+Wpm3FVU50ets0feXNoqyGK1OD9GGDflszO+IRJsLP7QbGqLebLgpNSf+ks4
	S0kY+ABRknet3eH9bdc9bsdUUfHwsv26fc
X-Google-Smtp-Source: AGHT+IGGSWx/qXe0KQyY/MREsZlIV6fNVYZhSzegs3sVGQ2Vz/xafsGBBtwjdgGYFha2pmBwx3eFZ0eFO4ELEa/acV4=
X-Received: by 2002:a05:6512:68d:b0:549:7394:2ce5 with SMTP id
 2adb3069b0e04-54d6e663182mr5664661e87.41.1745399393941; Wed, 23 Apr 2025
 02:09:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250422162250.436169-1-uwu@icenowy.me> <20250422162250.436169-2-uwu@icenowy.me>
In-Reply-To: <20250422162250.436169-2-uwu@icenowy.me>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 23 Apr 2025 11:09:42 +0200
X-Gm-Features: ATxdqUGJI5EWHbFKNL1piYfBX7w6VEjwsS65rRDUL2ZIvKqVpjd39nGuBX00R-E
Message-ID: <CACRpkdbGwPyQgVL18iMvUTAvh4XTjo6g3mGT4e_b2aNAjr2obg@mail.gmail.com>
Subject: Re: [RFC PATCH 1/3] dt-bindings: pinctrl: jh7110-sys: add force inputs
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Emil Renner Berthing <kernel@esmil.dk>, Jianlong Huang <jianlong.huang@starfivetech.com>, 
	Hal Feng <hal.feng@starfivetech.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Icenowy,

thanks for your patch!

On Tue, Apr 22, 2025 at 6:23=E2=80=AFPM Icenowy Zheng <uwu@icenowy.me> wrot=
e:

> +  starfive,force-low-inputs:
> +    description:
> +      The list of input signals forced to be low inside the SoC itself.
> +    $ref: /schemas/types.yaml#/definitions/uint32-array

I don't see why you need this hack.

Use the existing per-pin output-low property (see
Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml).

> +  starfive,force-high-inputs:
> +    description:
> +      The list of input signals forced to be high inside the SoC itself.
> +    $ref: /schemas/types.yaml#/definitions/uint32-array

Use the existing output-high property.

Now I *know* these two properties are per-pin. That is more talkative
but way easier for users to read.

Then use pincontrol hogs to make sure these configs are set up
at probe.

Yours,
Linus Walleij
