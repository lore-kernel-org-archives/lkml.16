Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA50B6AD3;
	Sun, 27 Apr 2025 21:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745788129; cv=none; b=CkZbVwiEEfYTIEqdpB4Qfbtc6JVa/k4heptDSTHbSOgBG4QE/7TST6vVie664VTOdMeQ24DMN4xPanqBx/rccr5KA+bEe5vlEWY/QgEGpM1/h9HnmIVLr79F6xkiaA1lyrQ4Bsbx57y9txA0HWPyzi+iDAkYudYEdiPYSEvwP0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745788129; c=relaxed/simple;
	bh=irNnhpUPyAbG1p4UJfyash5hUpMHlzekZFDQuw5FsnE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q9xeyVwAHJFc8vzF5XqHi1HAUvfdnJ/jXXxkbBSVldRK+G8hCZbge2YWMTF/xxcYpmfSH367tbIa6uafKrZ4YkDNReCE5ZDOzrgYWmR3nTOxfiuMqfu4op88A8GTVEPbkCczH2qt39dvenO8FMHxsohCX9a0D1qPrU9gIto+WC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=CpM1N37n; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="CpM1N37n"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2243803b776so68573525ad.0;
        Sun, 27 Apr 2025 14:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1745788127; x=1746392927; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=irNnhpUPyAbG1p4UJfyash5hUpMHlzekZFDQuw5FsnE=;
        b=CpM1N37nb72G7EWEAUm7qOvPLdaaykIGpdWlgeDNxb6IMs/3WTw52uLGoXot50QRl/
         zVOV4ECpLyvSMyRuDhhK3hb6nYDM4zyEV6hzMflpfj++pCLY86zsdDEzDHuBWt4/eWqK
         4YHA2tJIK5iYUcV1MdlGr6UZ381XVWB2IYXChn6rgC7S1l3wzHTqOp6HbP6MKpHpxzUq
         WI9acW8I4AFRMRW7cnLqegmRg1P+zfwhr7EIkfKIEmTwjYGQI7Mj49bTqHHdOVr2B5Qx
         r64RIoduKauMA66Ose8XYotoqdIx52C8DVBGGUA9Br1U9J46cwt66ek6UU9HwPPRpExJ
         4J6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745788127; x=1746392927;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=irNnhpUPyAbG1p4UJfyash5hUpMHlzekZFDQuw5FsnE=;
        b=jw9lJk/4XkAvjEBleM+nn93yWL/nZmtkniDFbAKV4C/FS6G/bKs1JsDrP6Se0ec2fv
         yoZgneMuEV2S4PRhSPCSNWjNM2YUz0vtbjnAxwC8R6UqveBSHRiATDQw2pw7tGGMzrLf
         flSQ63vfNsExmddICP1iLmU8045p6yYw8sdHyZuL4aO5/QVz6TPOmOri2YtLSCMq44if
         381035ryIignb9FfbeifUPyIIXmrJZjoyHhYUtlRdn3zRLjDbn+3NhrVaf8kXPdqNN0J
         WA8uEA3JS1ZrQRdyYu56xhvuM96wJiqDR0s9Tl7FilgrgtFqVaBtYhkbqb+2RmEeALmb
         IMjg==
X-Forwarded-Encrypted: i=1; AJvYcCWeZvtksC/ZKypYiir2ybEAYdTuYNql/3j1azsqnfPQtrPp3EcJHuUWQNMmvS/vHuHJ/bYDzYwdcjn54Qvz@vger.kernel.org, AJvYcCXDTg5ynkkYfDi6Gkbk9ZFrIznEIin+F9zOSclPD/dtavf21g0lJJsokaed0EbF65dBB/gqGjTslzlH@vger.kernel.org
X-Gm-Message-State: AOJu0YwC1NsnPykj7FlfdzINt2RNKu6iN/CgfGg0sPtXT4C1Hdl5kj2N
	f/DH79YTM/Z8PdvAg6mitpUbSlJrtws5vhNMGvNdBkxF+TWIHMHgwP3zeYz05Yezb5kjxrSfGli
	I4075smobTdp8TOB37CCAGiCSCRM=
X-Gm-Gg: ASbGncvmr+jy2PtyiJT8XTivNbixAe2PgDR64tRQViEftMMZbTW9FjDVB3nh0huqnoH
	KXTcaVki0eR9dcKudVzMw3SLXPCg0PRBkmiOTWqG3LOb5UMinXT5Ae6CoEWnZbqzK6+kV2JPBPS
	HJxQUC2/gDNZrlGBH6kr0FG330bDZPxadu2zfX
X-Google-Smtp-Source: AGHT+IGocl2yWOvr1gre0imG54JUGmymGatHDiDz76Em4CMmar3dxa70AKrZPaM7gcVEnNhp2xdwjHK7XXGAPUa+e2E=
X-Received: by 2002:a17:903:1986:b0:224:1074:63a0 with SMTP id
 d9443c01a7336-22dbf6218c2mr150456335ad.34.1745788126873; Sun, 27 Apr 2025
 14:08:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250425203118.1444481-1-da@libre.computer>
In-Reply-To: <20250425203118.1444481-1-da@libre.computer>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 27 Apr 2025 23:08:36 +0200
X-Gm-Features: ATxdqUH4ngC-BX3cBpEPOaM7UIKT2zGBTpdyLjm5NqfvqkKNl138-a_D7ZyE064
Message-ID: <CAFBinCCUQizs=XWq7knm-4=3=hzPDNee9RZj9LDD2Mi6DHYBrQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: amlogic: gxl: set i2c bias to pull-up
To: Da Xue <da@libre.computer>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 25, 2025 at 10:31=E2=80=AFPM Da Xue <da@libre.computer> wrote:
>
> GXL I2C pins need internal pull-up enabled to operate if there
> is no external resistor. The pull-up is 60kohms per the datasheet.
>
> We should set the bias when i2c pinmux is enabled.
>
> Signed-off-by: Da Xue <da@libre.computer>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

+Xianwei Zhao (who has recently upstreamed Amlogic A4 pinctrl support).
I suspect we need a similar change for all other (Meson8, Meson8b,
GXBB, G12A, ...) SoCs as well.
Can you confirm this? And if not, why does only GXL need this special treat=
ment?


Best regards,
Martin
