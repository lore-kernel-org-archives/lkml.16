Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2708438FB9
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 13:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749129355; cv=none; b=ZPG9r6wPN77JklN2qLR5GKC26gNMrPCbGzeabd2gZ64pQnVSvfapxzomcu18Sk+AHkcfZB+M4jARVxYJmqlENWMZJOA48SGFrzIxoDVvkffflvCdacq1RArqOQ/A+1r/vRwJZBfFl3R/pba8LxE3y90+cz2r9fDEugji/dqY/Bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749129355; c=relaxed/simple;
	bh=Mwb/jLXwRXPfYZnLqb7tkfhCgR/oyf6dOSjCAMxAP6M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fTJzE/+8QQyJ5xFGNHx0Ic1O1tmuoJNg+i4DOeAzLT+Ek+vU+iRlZfQtLyraMJ0LoDEF2jjbYLCx4RnsAZO8eGMnMcEz4diIuqZOAeueyvFZ1xN/Rrg8HWvrohGWU3yeDdL+1GTLwXaX/iQMmwwyO2HWiYPMx+PtC4EAqtLiV2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WIRrTon7; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WIRrTon7"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-551ed563740so1190122e87.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 06:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749129352; x=1749734152; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H/jHbf1z3/GwHh0dqw8iaphItBx/HLohsmLRkiqAGrw=;
        b=WIRrTon7arVaxhwMRCSiNp644v40J+ucWEEM2kfaUPzcVNf0kUpMi0zOKYbCeBuJrl
         fhG2TXKrj/cCv+wN4qp//qSfp+E9Q/tL/PEOr+WIzdiSx6Byi5DXRMf3oXMa7h6ZlLoc
         zGI1Ukv8B/sRpE7DJ7Z/ZizLvX/2g27JTzrrmNsMEBfkzbZKyToRcAMe94d6hKUtBJqk
         FUZR4GDP4RQ1rAsy9ZlzZmLsQcDEV7QA8+dKm2sezarraj0H7l1aPTmXCoR2BJjCBFY2
         2xDYYB2uvg8vAgP7Oes+jlampo+R3p9VF/lZg//dC+n3+xxYZ6btwktWdcTaHjdj35DC
         Rcnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749129352; x=1749734152;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H/jHbf1z3/GwHh0dqw8iaphItBx/HLohsmLRkiqAGrw=;
        b=TW4u3YR41QwbKAbcF3KYEjNQrJ2ZNEXXBUVcdN6XeOwPQEOsluNa4pDNZGssbFfE/x
         DawGfv9xVHrzFEdB9DjaQALia8FUwSFrFZXyNPmn8ymXD2FDaqO3wn4wQlU28GwUB7u8
         zKZv8UwzkqctpzFamu2rUlekPq5U8fhVFaN7nBAPYlsw2jfcePFpvSkgnkQTyisAhn6m
         8pZyKcb4VZiiAhIPSRgflcsNab58zrr5yJWAgmS6Ihv/jQVlKAxyJ61GfjPEj2XVAVP2
         zW1sU5lMV5Iei8FSxKmhdcMiWWJ9X2HFmPVP60X0RBOgvEh8d44pZpYIfz6lX7yy2Taj
         G8Lg==
X-Forwarded-Encrypted: i=1; AJvYcCUP9il+bdCapDKl7z+4pDAxfJkVgSUNHmbiiOSM5N48cl7Ipnj58KJZSTk9M1ZS/SNJZvRUN0TC2WsOKQs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzuuRopjmBpH8Fn0HuzVbrsuI06Gl1HS/v6Wh+e+MPsMPjlTiCb
	Fl0bG7jHdNv+IEPN6oArC7z0QSSFQqC2+E3zK5tzbZqdAcvhyaQCqVEaGOVL/TOjFFXw7ao8Ax+
	T0vTwjcD1/e83oErYAT/rnPLPVtchYgTnbyRsLYyVWt/QcCCB0vBR
X-Gm-Gg: ASbGncvDc88hbvV+mYiZOq5dHMcIVbcJnMi2050MS7yPy4T5EEI10lctj72SbKG33xG
	Gmpail0qbx68iUnPd9HiTXixTJwizIsHA4Dzlq5lCZfQzYSJouRHKFFYGxb1LQ/oy1+eufvEKu7
	GuLRPeRadO0MGT+8uZL6elfWdtJsR980MW
X-Google-Smtp-Source: AGHT+IEtw+KFs74hmFMtpGQr1aKa935b0NpsGGWQpNnG5XrBRWdWQpRB3tC7HlaBnfp0RMDHb822Vw1dn34eoThSi1s=
X-Received: by 2002:a05:6512:3d9e:b0:553:2eff:8d74 with SMTP id
 2adb3069b0e04-55356c04ba8mr1984451e87.42.1749129352237; Thu, 05 Jun 2025
 06:15:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250528092201.52132-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250528092201.52132-2-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 5 Jun 2025 15:15:40 +0200
X-Gm-Features: AX0GCFuNPPFv5Vg_JE6Z7nHnr_dSwu-FURjQf4TaIcbuLPNkU0UKRo1LK_MzVe8
Message-ID: <CACRpkdand3H_XzUk_hSXxstPhbdfxd-hUP-nZUcEe_Qa0D5j7A@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: st: Drop unused st_gpio_bank() function
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Patrice Chotard <patrice.chotard@foss.st.com>, Srinivas Kandagatla <srini@kernel.org>, 
	Mark Brown <broonie@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 28, 2025 at 11:22=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> Static inline st_gpio_bank() function is not referenced:
>
>   pinctrl-st.c:377:19: error: unused function 'st_gpio_bank' [-Werror,-Wu=
nused-function]
>
> Fixes: 701016c0cba5 ("pinctrl: st: Add pinctrl and pinconf support.")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Patch applied for fixes!

Yours,
Linus Walleij
