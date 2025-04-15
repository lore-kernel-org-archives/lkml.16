Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED7D0253938
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 22:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744754999; cv=none; b=StIIaV8R/WPNVfhlIVkYukdtKrbDWFv5wNKMKs8RoiK5YkNgBHCXnc8QqiEyVKQQMBJJEZh772ulx8ccKY0vVtOtFJFrac6mYI9mLyDqpa48szkjzn2MP6HHL1vDXe4zTohDWJ2J8SzPM9Jx4rGqaSQdbrXrdbTesACnj3AobhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744754999; c=relaxed/simple;
	bh=BMZDbfJYgBYYsrYfrjT1g3jBLaGULzwTXCbAyy2bq4w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a8TDXpXmycL1erv8yjhWh1P4p+WhNML+47kp8acL4zwL9spY0mH71sHe18+aB80BUeCBgp+i3woqMtrJevqlX1fWe6iv5OhTlgN0QfMq5FJ6moY5dp3/gjTIk+qTkoI91Zycu+MBet3I158iU3l4oCeNQumrC+tKOK6WyGrQ5jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kHuF3zzn; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kHuF3zzn"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-30db2c2c609so65864031fa.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 15:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744754994; x=1745359794; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BMZDbfJYgBYYsrYfrjT1g3jBLaGULzwTXCbAyy2bq4w=;
        b=kHuF3zznt0wAgtDxx5rBMS6i9u+WxyY2mZY5WSg9Mcte2bHhpNuIOgH3osVmLNrXOx
         UFmgiZ8L39OVHPh9F9617j4luOSZ13mvIVUILSAepJ4ZilR+fQNt6BnM94/jFabz/122
         W/fW66NXrRUVs2T0J0Fg/4+w3lTFZDYAZU0Y4CivaNNIDaHOhR3YStXfw3zF2rq+6sRD
         J9NU81zWbhirXu9i9vCdJ/vU4BbJ1akUweooUxo64K5Av+p/QJmnGKScW9/R+llSnN7K
         u7+JJY3tVh21Ni8ncEnNonvSS8yLnIGmS9wJaoJymYsliHTCNjHLqm4VMX9k07l9aibq
         9Buw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744754994; x=1745359794;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BMZDbfJYgBYYsrYfrjT1g3jBLaGULzwTXCbAyy2bq4w=;
        b=tHTi9MW48UktmoeMbLDLzH+MdE++aPVFZB3QCiyKIt9XVmolyOE83HnUBQrcuw40Lh
         BFYXsqyUdgAy7d/Y8yFf7DliP/J2/e4XDqwNz5m2ucodWSAF++aubfyq+wIFEKKiPA3l
         2QU+RzldzOu9DZx9gaI3ycNcJmC+I9V5HMpngG8l4CmcpSLdRBrNUjis4WKqShrnw5a1
         Kh8ZDHU01YiM7vlvVfFZLlAHEAG+GdL/dD9DtvwNxhcfNmvRlsdS2HObz4YZ3eXUPBz3
         0gcovfs2bAd2bzcev4NdGovpxGQJc6Vd8GjHgaW8VtP6+H1qkRTz2hXQ62Y3RdxVSR3P
         BGCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUT+R6NYYT3kSdkLWG3NRD1GkO+kwLZvT5054NvP8XMDPKvO7X9wOCMTxh5CVYHtgJvuoaedXmCOr3bRbQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMoevN9qU+s4A53nfyh29SJ/bE2pEtQjVtIhLLOCmCqdW0aUEK
	lqCL1VnkrddOIZUi3S1xFYcCRb8pj8jIU1fsDfo1Lg3MRSZCyhv0ATks66srCAtAms+qUbFXuIW
	/Wb0b9dC7tt/GjsDWAuCJnLIDTlra5bZBsTzAtg==
X-Gm-Gg: ASbGncvAlfnGYms4x4Vv96nSfoFnr0BSDxPH1p73EHDVFtgPQ8B3PO9GFeeYuPgXc8L
	rfyN+tJ1htQCMdEMiMddQlObiQJth0BtCoIw0DMb0tSTVnXSROKLXHg43+S7OAKohEVJNxJqbP2
	8/D10BEpX2Qi39ND2YGQ54dNDB0RCjhVnM
X-Google-Smtp-Source: AGHT+IGCYPQ+b5FRodJ8wxuEHegzDnmUa6Evm4QmQdnqKruHFaVQ55qUyUsMYu12ZNgCb46mTc3ah90RckpXK0EBciM=
X-Received: by 2002:a05:651c:1989:b0:30d:629c:4333 with SMTP id
 38308e7fff4ca-3107c36cd96mr1776621fa.34.1744754993762; Tue, 15 Apr 2025
 15:09:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250409080030.62254-1-wojciech.slenska@gmail.com>
In-Reply-To: <20250409080030.62254-1-wojciech.slenska@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 16 Apr 2025 00:09:42 +0200
X-Gm-Features: ATxdqUHZ5uDLzgQCP5maQ9X1ZgCSKxId_N-06QIwPSuLwaXV3MxBAYqEvsqUNCU
Message-ID: <CACRpkdaY440anO7WX-em3b80RD_ZrRGcgTa8me+ys6sd=v0m1g@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: pinctrl-qcm2290: Add egpio support
To: Wojciech Slenska <wojciech.slenska@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 9, 2025 at 10:00=E2=80=AFAM Wojciech Slenska
<wojciech.slenska@gmail.com> wrote:

> qcm2290 supports the egpio feature on GPIOs ranging from 98 to 126.
> This change is necessary to allow these GPIOs to be driven by TLMM.
>
> Signed-off-by: Wojciech Slenska <wojciech.slenska@gmail.com>

Patch applied.

Yours,
Linus Walleij
