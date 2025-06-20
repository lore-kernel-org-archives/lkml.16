Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD00028A1FC;
	Fri, 20 Jun 2025 13:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750425787; cv=none; b=FthmTSm3OUpvAGC6clEaju3C4jPPCBH/g05i0V6qaUd32IPYwHRdpELQTF5f0Mcm9ZZNlKAcSm0mJJpvAHOcCFbq/dfM9d8Qmxd0buYMYyHlLSDfNelVyJtIusVShjm7O2KyE2+UMIkDDLolpKazlpLRFV+zQuRfVjNj7WDiQJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750425787; c=relaxed/simple;
	bh=vVbVRFQUAznwYxpCtzkO4d0c66o8bC/lMZQmfZTPce8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VINNoCroEZb8fzH1GACCjnsdpoMGMmyWIIUXB5h+6iZUNuN23+ffK5QKFPKaJA5rNwVFitHzQK2A1n8c4vFS25ukwf8KuWWlJaPbMrtqPbEthF8nx2jZekkQEC/48C4P2Hohp5Na0/uf8YbpiajRvQDgWWjONCz+qpd7tFVQzAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MtebPBvk; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MtebPBvk"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-31329098ae8so1548636a91.1;
        Fri, 20 Jun 2025 06:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750425785; x=1751030585; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vVbVRFQUAznwYxpCtzkO4d0c66o8bC/lMZQmfZTPce8=;
        b=MtebPBvky1kL4iru3D24DKY3LLy3rAJSKB+QRR8/FUvLRaGKVtTn2sXxYnQcrKICoi
         iQTOiaJ9DN9fMbHUdiIysteYtK7esdIyZyoJ3HJ3F8csfQzmECdoZKskIt++RU2dImW3
         +VSPVMTXoBfec2rcaZmA0veMJJ58+zjYXoSjIb4nhnI2GOjYGydTNbknf7pHNh5Vb2nO
         vGMisuANz+SHrpJOE15wQV+rGwQTz9blK0CFDeOCv5gU6L+6+AiNT8o/M19nl2LT6Bm/
         Pg/BtTh7iSsLpIX6vi9ebYWD7Yv795PtNIa+GeqykZJ9fJZgg/pqEzAXMEinYeQpw4Ey
         zWVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750425785; x=1751030585;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vVbVRFQUAznwYxpCtzkO4d0c66o8bC/lMZQmfZTPce8=;
        b=KJQuRr8RBFjTk0IZLy6CEzYyFFM4ngVJEZ08Xs70sP54RLQJg7+vuXCi9nrUaKldzH
         ZUzmdGtU57rcN0YyvJrSYJ8u0CT2/Hmt2BG1Ei7WCzwmSZLj0+A6hAmoJI2sCHjLrM3h
         ztFqnTb49mpHBS/UgiRtv9Zh0eeO9GmYjqewTNmXxJDPuYUZ5iLyIG1INLCNELRsvcTz
         DkMHSm1/tlyFGEC3AkH8jq3Bfgcr+jvOTa2nawycimymd8gCpLhkeaTRxFnBYMFiYvMW
         kKZzAJwXvAynIbmlAm04BQNKQF095mky0oo+jBxiOcGQlUva6Yu7CtvYu9+ouwX3n5Vg
         x7lw==
X-Forwarded-Encrypted: i=1; AJvYcCUlePn7ItkrqMSnOPTdY3i/Wpf/kA+Ma44dJlIQ5u+I/NRtkDbIq7tTV8Jr3Qwysi5xP3VsOO37n7GjNgd2@vger.kernel.org, AJvYcCXhXfatwXBPMYPA7lYbs2yd7oGN94rT4tON7DJnPISK1n/pDvkyG+sAViVFbJh6ojMlZiFkojyvQ6Cb@vger.kernel.org
X-Gm-Message-State: AOJu0YwNX8Fqrey/P5nhsGbkV5DvwW4gc2wMQdot3nPqcMloaYNkYA8l
	AyfI3GT1RmAqWG2ZFGKbgsehaygCHE6VtFc3jLL1N87W64QzQLYGJaj/1cFCTIhJ7PiaQfdwruG
	+7manGySReoy5juZv27kg+3dlg/9H3+M=
X-Gm-Gg: ASbGnctMSl7q3Eq7bKnEE9u71wH0pgipcXECa70Gm+VRVf/FJQ3qa3igeMjyyYXlL9B
	EZ4CYkV3lCEmZUt+X31Lg6fQ/7fug2Hzn93CFFy8JGOsc+96oW5avql9XRIUqWSMfdaKF+vv3fa
	cqmnVhCCmX0A+LIzqpq1XIn5y745vR+ElOpXyhL8Ur
X-Google-Smtp-Source: AGHT+IE1J/3agy2pvlBUpx5CZrzP7qFSI3FtPdha4ZfRPlkfSyGlRzieK+BAcz2I5VxrRAtzHU31ktVhErvAuBdqNfo=
X-Received: by 2002:a17:90b:288f:b0:310:8d4a:4a97 with SMTP id
 98e67ed59e1d1-3159f518ab7mr3470283a91.15.1750425785075; Fri, 20 Jun 2025
 06:23:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250610160152.1113930-1-laurentiumihalcea111@gmail.com> <20250610160152.1113930-7-laurentiumihalcea111@gmail.com>
In-Reply-To: <20250610160152.1113930-7-laurentiumihalcea111@gmail.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Fri, 20 Jun 2025 16:25:04 +0300
X-Gm-Features: AX0GCFu22qEJwTwiXYLJyDUpuSZfvl_dtoxWhsBOKOtPed2Sd_Y2mWRPu5m8p4M
Message-ID: <CAEnQRZAhsCc==X1At+s5pb1bocnVmb2sFKmzNo+gqkiWAqFHag@mail.gmail.com>
Subject: Re: [PATCH v7 6/6] arm64: dts: imx8mp: make 'dsp' node depend on 'aips5'
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Shengjiu Wang <shengjiu.wang@nxp.com>, 
	Frank Li <Frank.Li@nxp.com>, Marco Felsch <m.felsch@pengutronix.de>, 
	Marc Kleine-Budde <mkl@pengutronix.de>, Alexander Stein <alexander.stein@ew.tq-group.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 7:04=E2=80=AFPM Laurentiu Mihalcea
<laurentiumihalcea111@gmail.com> wrote:
>
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>
> The DSP needs to access peripherals on AIPSTZ5 (to communicate with
> the AP using AUDIOMIX MU, for instance). To do so, the security-related
> registers of the bridge have to be configured before the DSP is started.
> Enforce a dependency on AIPSTZ5 by adding the 'access-controllers'
> property to the 'dsp' node.
>
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
