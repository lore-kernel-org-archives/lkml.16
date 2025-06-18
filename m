Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9EB0281365
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 09:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750238349; cv=none; b=WHwjnEkzvPTAJZFXhWNPrNTZ3bhIagVW8/6LJxL+sYekxoys1tlocnZcQ6GkuS28TAgAKruDa5cvakOA3XQlGNPSQmxMP/NaKUtsprKxMD1qMBdyBCsTHbp11bR6tmq0vY/bMY2nkqEVF9ShfIU8zutlSspaoSxWw4YuTkasy3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750238349; c=relaxed/simple;
	bh=TSoT5Ck3uCBZrqz+LxFrOK/E5khPUOMPB7P6HPWYt/Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OvpVTd5EaqgfPm9Joe9BD2smzgDesu27dHYL9wsiSr+faAQdNhd2W7Lju6Bp6aYfTM8dunodA36LbtP1JMJGCCAr2P0imr3uHz+xEWFzBP6+gIdmfvZAUZtxaJE5A2DBH2qq1ikzaP5xVnmOLIAC9Md5oTwpPsxjdzD0Yl64LPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xTzFNfW2; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xTzFNfW2"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-553b3316160so4194906e87.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 02:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750238346; x=1750843146; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TSoT5Ck3uCBZrqz+LxFrOK/E5khPUOMPB7P6HPWYt/Y=;
        b=xTzFNfW2eQmscrXSLbo6IrF9LP0y1iD8YrmYy0VFS8Tf/5gnEqXkv7JufStWeSInsc
         Zp/BRFb6Ogo0zWfUxCKSPRi8PJ2lo9k1dWbqgZt4qMopeN+8hBxNzFLrZbw6Kzg0L1Lp
         4tSqkzBM8ESmQ3XMCK+Gy2dGQ2ikjJqCAfjmmhr8Wrum8EybctoCr4MAX5zD4ziP9v6U
         j7IRxxrxqSsTmHVkf3ZmmHj2R0J5EKAwQQh16VVLgU/u6YtAr2VHx05zC176wmArbK7K
         a4koPbcvjjM/ybiuQDyqgUdq3Fnopvp2bWwn8IPfCZuYDbwl/uXpvtB5ml6Jr5XIOrS9
         cEuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750238346; x=1750843146;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TSoT5Ck3uCBZrqz+LxFrOK/E5khPUOMPB7P6HPWYt/Y=;
        b=u6x5Q2aFxHh3f41Eb+gCTAAw7aYpFktflWHP4886qHN39421LKs8M7fAdiCnlI0sge
         IndrUblbKSjncq81fH+rkKRnc/vhuI7uLj/8a+gZPpMcYYr29IR4YlauuQm1GgUCqKFp
         /SM4Zl5yaDYu9TsA3TmwFYp5U71aBzmk9UUqxOn4G5fdnJpQ/Hwg4z9yEnoWGMQxjGAu
         p/sNb/64tkuII9q+/uzd+D2ZDM+geMJqHxmoXV0NCpgeuPoXVabsFrO5YljJe9i+kO3q
         BS/WhLRAR9tYOg9m6B92anv4Vc6kWTmUcyIaxGK9QLmNM1P/RbBMoHvSnMi837uYa7qR
         0B5Q==
X-Forwarded-Encrypted: i=1; AJvYcCVVMJgan4zzLNC/Vx5c0jdlMba/YuCpnDLYB+Ww1XdD5NnT+kMMihFTrUv6sTeAQ2zTgVzu3xbKaEXuoE8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrpV+tGXhTT4vOo1apfniTJFeEdPY+S2+2GndlUrLBEnZtwrHT
	Y55i9iTUTUZYoga3o7IZjdw3Mf7FfeVH+PU4hEBQ7Nq9+J3kS0c40P3H3+sPsAwriNHCn4YPNZg
	begiNE5kjbYiLb62KSw5KkvPdBPsze7JNh6le+je9YQiQL653pRfX
X-Gm-Gg: ASbGncvHriT3dNP7gF1d7T72LhBgNuPis8a6A/HEv/+qHARZgefA/bCzT8ym7Ht7dE0
	rhYfDKAMAcS0Tg2fmiAePj0ApMluLh5hp4qFIb+1SFfxrhBiga7gkqtzheYLa4y5CtbrGPX24fd
	OAKE0eFpTiP3ifj790wpThMNd2xDDpcByWg1ZV39xm0fk=
X-Google-Smtp-Source: AGHT+IGDviP5o5BpdYRHMCQZJ0KKYxkJwy63WpJVsRhdouoscbb+olcEs5D4kGqoukI8Mi1y4ymDThNKrTMCoqXbPKI=
X-Received: by 2002:a05:6512:2212:b0:553:2c93:613d with SMTP id
 2adb3069b0e04-553b6e713b0mr4277828e87.5.1750238345840; Wed, 18 Jun 2025
 02:19:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250606160359.1356555-1-Frank.Li@nxp.com>
In-Reply-To: <20250606160359.1356555-1-Frank.Li@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 18 Jun 2025 11:18:54 +0200
X-Gm-Features: AX0GCFsZz3aglhMm4E6BI1RVEFU98orqUWOtObnRoTsKi2nEtjPjvdxkzVSQEu0
Message-ID: <CACRpkdb9=PxzA8FGR2=Ox+ndnAoh7LBB+QVte4kU246eucvt5Q@mail.gmail.com>
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

Can I have a DT binding maintainer ACK on this patch?

Yours,
Linus Walleij
