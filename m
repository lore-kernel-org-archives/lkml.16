Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B98121F8ADD;
	Wed,  2 Jul 2025 19:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751483994; cv=none; b=QsaA0ugnnGObZwrdaS3nOvbjpnQUy/4Apy/XNOo6z++05oQykpE2RUcZ9ICaJV3YGAeWo2g3LWu1KnuIFsFe4+B56L8ns42czODsCHjyBh0BIVTxGs69dGhVAg7UWydIlwWEdprydQ6xLpnI0969KQo21jZgJezDC2j9/pQ1A9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751483994; c=relaxed/simple;
	bh=U2A2n/nNOOE5Lr+/Zh6nkttWy5BZRLjM2gogFdEHc2c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nqt1ubEC6GrgSIpq+1j7rGFRcWI8VSo14xNo4g3oRi+PaAIDs3F1h9zZJd5G5zjBdQHpuBUlbn27j18FF9bfi3IwXpqeO+Wp6wUbBuEDFN77R6Dlxqdhabpme/mRnSiouR3fyzCh8FDxwUZpEzYGai2COCClT/px76qDwHS0fSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ca2MqxPc; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ca2MqxPc"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5561c20e2d5so3715893e87.0;
        Wed, 02 Jul 2025 12:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751483991; x=1752088791; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U2A2n/nNOOE5Lr+/Zh6nkttWy5BZRLjM2gogFdEHc2c=;
        b=Ca2MqxPcS1ig3F6vxABMoDxkIBXzeuR8Y5qT+AWDTOP8ANITznVzlj6kcCQO+NvRnS
         OXDIRtV3HJKYFm76AqZzFcEdNWHlcwG9Rl6jyrxxa1aOm4ySJ25kZwH0ytZXTQr1Ecku
         o9tguhuRTZ5lLP+MRZhyO4FuMygSk9hydjiE5CdLmf/NuCmcfC6A4qckh7t02pESAnvE
         NiUsZibRY3wbZg2yTGOnnPpMvswnt7QEc9RO/q/yVfdvbldTpNZJbx5ZJ0DjVjiYOFn6
         foNW3pCUVvtkJhWUhX/tELrHcj31r3AYiLP3fhtaGXQEIiLkTVuIBtTYWsT48Ltn9tcp
         yKEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751483991; x=1752088791;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U2A2n/nNOOE5Lr+/Zh6nkttWy5BZRLjM2gogFdEHc2c=;
        b=e8zTMXNNCK8/r7H0DQhLJt/HtBn+17cAijf1duUyh42km9LFFcyDsoa7HBDszSlCvg
         rv0PHHAj84Yj0x127fp+eynWj42YCfeYMjySCgT95I565wKBp5DKdPsT58JQ5rgJBErf
         7bW5XIToHWtETp8glJKkdN5Ab8Sz9aSW8WW4vlBuTs10k7ol/n6XwxLaKrDv6PzIjtfc
         bFCeVKVa2AIhawI5mZm5KGiCw/a09zpMHPO6pFFRSyZFAF1hZ3TYOG1Y5h6ZAPw2XV9Z
         rj5LKAXlRjOccCZVqiby+AA6AzHEQkyCRdPhYMpi7qxgoSKR5YDYc9jtbFM/SQTWy2Y+
         SN2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUU9ZYS7F3rM/jEMIgCT5AqbsrC8hBY5YGuFXcXCOfbiPPKiJSlagBlN92blWvQvbhotTUFSR8x/STBI8y+@vger.kernel.org, AJvYcCWO/AoUfZ6HicpPGGq6ykFWIZRk8XzMvrMrZWiCTp/BhJNhTS+nCnQv+nP9EJc7MsqaVzQCXDNn4Rdg@vger.kernel.org
X-Gm-Message-State: AOJu0YztRy6WH7ONTKs5s4X/jo7/j/NULjwCWWTOSu4+c1c34xWvNg7Y
	wt/0+onUGpxXc71f7AleNg2+JKKdeZ4SWh/GpMTu00KCPmMlZ9b+Rmt4XN096DP6QTf08daI1EM
	Lm6ARwkhB3F5fzFo4ZGY3EQ2PSLhDLn4=
X-Gm-Gg: ASbGncth9Uztq/gEoG9tMQbBECjfl60UMvlyC0SoipTgWlqfU+HW6So6Fv7Rt7K85IB
	FhtfmMuFQLdhrE//bvoqKVYBiI4SFQ5GU63jDdYrLJ76TQgk8ZxIT9N+J+/UsDT9YMYZtnUhnNp
	OXQ6AvAaAJWMVtuKfLz2mE9cbu1tcKDRsIDeGHfBMPDvMZdxUtTIwNDulqLEB98bUTty9c3hqdT
	O29oRI2omLGPw==
X-Google-Smtp-Source: AGHT+IHvelr2Sf9x0pHkrhNzudbB0N7XiiusqPIR1wY9p47fZeSLcVsNT/JVRmmR8/qM5y2EGSD02riNIPD+nyU56ig=
X-Received: by 2002:a05:6512:3994:b0:553:5d00:be7e with SMTP id
 2adb3069b0e04-5562ef25a02mr169873e87.39.1751483990547; Wed, 02 Jul 2025
 12:19:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250702-hb-dts-lic-v1-1-bf15c0a74577@prolan.hu> <ae71768f-303e-445d-971f-e5feaab39e22@prolan.hu>
In-Reply-To: <ae71768f-303e-445d-971f-e5feaab39e22@prolan.hu>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 2 Jul 2025 16:19:38 -0300
X-Gm-Features: Ac12FXyKYcQK1-FZVNpekraID_F80XT5-HRO1qYNpYDshT-udtpBPslocc_9D9I
Message-ID: <CAOMZO5AYXvq7W+SY7H3yb3n1-WwGx6yFGA_q0VGDWmj1FvJtEQ@mail.gmail.com>
Subject: Re: [PATCH] arm: DT: imx6: hummingboard: Replace license text comment
 with SPDX identifier
To: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>
Cc: Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Rabeeh Khoury <rabeeh@solid-run.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 2, 2025 at 4:17=E2=80=AFPM Cs=C3=B3k=C3=A1s Bence <csokas.bence=
@prolan.hu> wrote:

> Several (7) files have been left out. I will resend it tomorrow; it has
> only been 12 hours and I don't want to spam the lists too much. In the
> meantime, please tell me if there's anything else that I should
> incorporate in the v2.

Just a nitpick: the Subject pattern should be:

ARM: dts: imx6-hummingboard: Replace ....
