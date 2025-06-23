Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D50A06EB79;
	Mon, 23 Jun 2025 14:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750687271; cv=none; b=kdQJPHiNnsy7S1y0d72z81RNWM9cQrINT33faQ+JpM+z2jmGEuLl52en7HxNCBa8bPJ4dXzaeO284fBIdOmDt70R9s6MUVWPfXkScZq/3uAQ05QLqv1B2hBwimt5aD2ZNC6Ye/NWDM3mnCz7kLyNhthbEdUkr+quc36wDXLpJy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750687271; c=relaxed/simple;
	bh=Eio71w/pYJ//+HPI/HFvrWn6wFXbMzWKf+fC/EVlazI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oSIdstz/tHkMDAbHfxbfQEetvitA2dM9rX2oadC2CaykRVxuudsvKnqIMvb8dPoHCGlh0Kux4MAwYKMtH/WlU7SMZiOSO109Q3CCcp2mkI3RtUNXWF0galV6HjOOk8DSo7aFuV7DMYsPKLs0WTVdVfYLF6cYWmzl6ppWTX7Xb30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lyy7E898; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lyy7E898"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-553dceb342fso3450255e87.0;
        Mon, 23 Jun 2025 07:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750687268; x=1751292068; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Eio71w/pYJ//+HPI/HFvrWn6wFXbMzWKf+fC/EVlazI=;
        b=lyy7E898qrSpZg0SnZTPADmkhYdf/Nrek8mUh3bgr8+GIBGrIRvkKJWKA5889NwqQJ
         +Oyfl9S6g+92HAe2a9QBW8TCe9M577yM9zrV02dUAxtw/UPmv8tnx2ExZlMNPw/XhLAu
         UIu9UPYcUyeY1GYU/uV9AdzeGN/zkgOBy0emg3y0JAOPiFTUf7gYgPOw3+LpH1Dp1Vk8
         o3IiuAEnB5XmqAImbKY/mvOsR1qdMHZTctU5sovh/dxPHTwYWzTopYMcLOSIsbdfXb4J
         tvmn1qDWyszdD+pvboJ0lp7x46Iw0kwJ4GoJoL2gwDhuz/5c6Z5OPUs8bbPdvADcv0N4
         pCyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750687268; x=1751292068;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Eio71w/pYJ//+HPI/HFvrWn6wFXbMzWKf+fC/EVlazI=;
        b=RP1o8lqyop/WL1ahHg2RHgIcG0LNPK5bVqb/hj5ntq0y8A2Et1YjvAtvMxNNqpflfn
         ydHK7h5GoxsNm8ljzw7ZiZBDNwb73OUeZoPu9KJPluf6CmDQ1KTOWvEeeS5eY/dK8eek
         EYRO+i5U2gUGp/gEkO+MECA/UrXgZ9iBOB+r25vuByBuRHHVN/hPnIHBFlQ8EoxajaTL
         A8sXKjO2rdv6DSewgSeOLQQcTwplwXE7fhGvxJeozjXRWiwQC89tG7nDsDwjs4j3uQxD
         ogMo1pfInVIfJL959boX78+9vcPhmjdNLAKXR8AZfMCUOjmvKowg7ZfJaHq8jUeDvAHD
         7Cww==
X-Forwarded-Encrypted: i=1; AJvYcCUNcOkhzz8f/t3/JDVUie8FKF5u8BpQ5vaHdEyGEugSStbp4LqNdWpIAEkUya8/Gaj5snkXTWUHO1+CSyyk@vger.kernel.org, AJvYcCWn5TdHC5yeJ2hclu6EFUqSBJk4e3Iu0Yq2dBSQ3Vqi2dFP2vaTmBLn27ZuxwZi1SD3Tyc/nGF8iXwi@vger.kernel.org
X-Gm-Message-State: AOJu0Yzv2/08zdAZAcg2H76N5ZgSov0rspkEVFWB2PVoUQvCbiuNnpjZ
	fnZNYSUS86xs3TeEPtdLAdJX5L1o+mIWnb/+p7tYQsdcXXfoVI+SNCVknBAAOR1BXvDT4vgmrp8
	mA9WuX9RoNTvFKWIWTvxpkrswKFzzYjo=
X-Gm-Gg: ASbGncv5PpBe1rYnek4uLH1xqLmYJlTOEJF0cHqekjDrow4vmN/VMWua2G79KwUWYej
	Upc3Txu7xsxDpMJPOWQYJuX47QoJ41bO84bzZBXDLeEfiXNTO9hohZPE8/7GCegYgdmHhSGoC2L
	2UKp9g4QG7WMh84GYUYJCG4rdje6hrMqCnOxEq7OOfB25g+CliCGwUK/4U3g1VMmrasYzmjalAJ
	m0=
X-Google-Smtp-Source: AGHT+IGR9uZU02Z1imHj7MAxQiJrfcrFgQl4Iwi1qMx4X/39RI/yLTLvi2E9TpExz966iw2AnrUaGavuIu6muZwN6T8=
X-Received: by 2002:a05:6512:3ca6:b0:553:24f4:872a with SMTP id
 2adb3069b0e04-553e3bf9f18mr3657639e87.40.1750687266759; Mon, 23 Jun 2025
 07:01:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250620122353.150700-1-goran.radni@gmail.com>
 <20250620122353.150700-4-goran.radni@gmail.com> <aFVz48C3d+HHVHvv@lizhi-Precision-Tower-5810>
 <00cf9c47-e101-4335-b918-f0b3a3c71de9@gmail.com>
In-Reply-To: <00cf9c47-e101-4335-b918-f0b3a3c71de9@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 23 Jun 2025 11:00:55 -0300
X-Gm-Features: AX0GCFty6Y9honVX8KF-AR5BMA9uPsSpLblXjl7-3v4sjeMadYrJm6ZLkkE2tuQ
Message-ID: <CAOMZO5B39pBzWuXBoo5=eqQzZLxS3zBxCJw_GBYmABKT_cdQww@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] arm64: dts: imx8mp: Add initial support for
 Ultratronik imx8mp-ultra-mach-sbc board
To: Goran Radenovic <goran.radni@gmail.com>
Cc: Frank Li <Frank.li@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?B?QsO2cmdlIFN0csO8bXBmZWw=?= <boerge.struempfel@gmail.com>, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 23, 2025 at 10:17=E2=80=AFAM Goran Radenovic <goran.radni@gmail=
.com> wrote:

> I was using git send-email, and I did not notice any problems with
> dry-run. I have 3 patches and a cover letter. All were marked correctly
> v3 0/3 - v3 3/3.
> Everything looks fine here:
> https://lore.kernel.org/all/20250620122353.150700-1-goran.radni@gmail.com=
/
> Or am I missing something completely?

I only received the patch 3/3 in my Inbox.

It seems you missed copying everyone on the three patches.
