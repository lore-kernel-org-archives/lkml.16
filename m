Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D89412D9EC1;
	Fri, 27 Jun 2025 13:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751030353; cv=none; b=px3Y98eNKEGEc69I8pVggLLCzgLjvbkvJyFrTGQJ7Y9D8HeLLlZlydOUsg8dv/+gflF4qTHKC3MTlq2ivjOp6Av3D+CIorrcsJ/Riq8H+GtgeDsShXZDbR/oi3n91ToXmRtZPJmCOa6oXuYc3rzpSTEUqHcCLWOimrSViQYQRkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751030353; c=relaxed/simple;
	bh=r+vCHV0VQ3uqAEqelpGMeu4mfO4ZLC4xRqRONU7l88I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GmYO9OhOWbSr46TrCSTYgccO3GIAOG16Xn8T8r748hQz5fcBrxrqJ5pUTsAUFjXch5CynoFhPSoP/TZr6TkYVNt9C8MhfS/2SUlxZLBHwUWj5sI6r3O2VxEcsJJS9/boZxqNzh3vsVLXfVtmfoKVPlTi/tJZk9yCXGoI/vfYORs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GR+4/pf+; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GR+4/pf+"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b34a8f69862so1831689a12.2;
        Fri, 27 Jun 2025 06:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751030351; x=1751635151; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c9vYtlh7hRicrNQ+wKv3jmRTnFEYxCRjACepYVSWnxA=;
        b=GR+4/pf+Mx3FaeJLpG55x89cKpj2JXlYf2CQqBj42mgTSglp8hSZxI9yPRi6kqhsUB
         +dsCfE5nUodu5e93j3j9/A9mdPtgmkpdBrAsuZEjywbAqG2vkvyHYc4884q9QYR71DoM
         agXxfqro1syoR2tUvE1B0DPJ54lDDZj9i0JMBMApC356J6+TwtWCexoNyJYK/wC/NyzB
         FpA+lfP/Ogxtq3kWV0+ki6+G6shFcUAJUo86Nc356c5xQT9JNBNI/6t4muHnB4xfuoVR
         VqXP0pcTk5cXY7YZdeNlBxJETDEvGiUIkAlyWjRqMdQPmmEEjWhgrK+pZ1K0lkzM6O4W
         hOFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751030351; x=1751635151;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c9vYtlh7hRicrNQ+wKv3jmRTnFEYxCRjACepYVSWnxA=;
        b=RFmdupJMC2pvYo5Zkf4VPAT4dhQ8Sq/BYmLP7TcBkMXAgpL5rfOtq9KHjaZslkdXyW
         oxMO508kAMyDVBpVcbR4IMYKlQR5ABnZLnJxdedQU/8AW3lW/kJVIWSlNMo33jOhXXOu
         VZco0uq6A+AL/vO/C03mJcMlsitIq+sHNk+NV6MDI3tVFdNQohKeUKDn1+r6bBvh2xfS
         JCKfOwolrlSjJONS6sQbEorUwHkLH0n1I5qeBr89QMHKtgaCsnEcnO+GduCJBAdgJaGN
         mYvUAJCg2fB8mZZ4S8y9Q5obxKyiFT/WzHXWuiWIcZqmDSVqFnsSLoGDprb4AO7KnLU2
         DnaA==
X-Forwarded-Encrypted: i=1; AJvYcCVf03v8UduMZ8zJc6eojZtJrqhTpfWvWGnA1HNj99JA1nSXhIbXmFFJhX640LPVMuipyIfgzz4cN0nJ@vger.kernel.org, AJvYcCXtBOjgugEoruRypr6cS5Bc7id31FLoMxzQzKIbiQh0Of3DRveHzzb+o8wMSjH0XZ97m31XS/Hl5TsAdEVB@vger.kernel.org
X-Gm-Message-State: AOJu0YwYmQjO/QO3Gbhr3rHZPUYgU5y5sgyDBvtaasrElgFbzithNA14
	ltYAQ0YAMYLQVFdrkIanphgc4BCL/CD2f4WDkqInpBNkSxcTngy2X3dR5jyXde/UxsLCuOKygtJ
	WIWLLkGIJALIp59sp2CanTmMJW6kFcjs=
X-Gm-Gg: ASbGncu6MkvFyUNRTIWrgyJoUbiHQujaNW8d18v9MlJdC9zROFQW8hKPYVH65QgYMBb
	t6530LMUw5d5vh4tnAPR0umwdt4IZA5i4ZsgE5Uho7/9nnbIEZSry73mTaRUVt/uqyH6QCps0BC
	9RR6mKI2Wt+20M4FVInu+WZvpeG8YCO0vUH/59U3nRYHVNevA0TiZsIw==
X-Google-Smtp-Source: AGHT+IGuDUwfIqzzDEvXavoJTZSrH/5OLn85eSiig5eyOQ5l/CyM5CDTHx0eNi8xE3Ifw6y62UefXmBp5cIFyf+XDbE=
X-Received: by 2002:a17:90b:530c:b0:313:28f1:fc1b with SMTP id
 98e67ed59e1d1-318c9225e3cmr4981774a91.9.1751030350976; Fri, 27 Jun 2025
 06:19:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250530221713.54804-1-aford173@gmail.com> <20250530221713.54804-2-aford173@gmail.com>
 <20250605013023.GB29462@nxa18884-linux>
In-Reply-To: <20250605013023.GB29462@nxa18884-linux>
From: Adam Ford <aford173@gmail.com>
Date: Fri, 27 Jun 2025 08:18:59 -0500
X-Gm-Features: Ac12FXxtQU4Km0iG8bo0b1N6dVq9hbbMuCpXJFyZ-RZRycrANe1s_6GUKni-xpQ
Message-ID: <CAHCN7xJFm5qcnVkiOt2+vQG=oeys=_4gonc7BkMWbXM-p0iURQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] arm64: dts: imx8mp: drop gpcv2 vpu power-domains and clocks
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: linux-arm-kernel@lists.infradead.org, aford@beaconembedded.com, 
	m.felsch@pengutronix.de, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 4, 2025 at 7:20=E2=80=AFPM Peng Fan <peng.fan@oss.nxp.com> wrot=
e:
>
> On Fri, May 30, 2025 at 05:17:08PM -0500, Adam Ford wrote:
> >From: Marco Felsch <m.felsch@pengutronix.de>
> >
> >The GPCv2 G1, G2 and VC8000E power-domain don't need to reference the
> >VPUMIX power-domain nor their module clocks since the power and reset
> >handling is done by the VPUMIX blkctrl driver.
> >
> >Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
>
> LGTM: Reviewed-by: Peng Fan <peng.fan@nxp.com>
>
> Just curious is there any issues without this change?

The vpumix_blk_ctrl driver handles the timing between the vpumix and
the g1, g2 and vc8000 devices.  From what I can tell, this is required
to make it not hang on an 8MPQDL where the VPU is not present.

adam
>
> Regards,
> Peng
