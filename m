Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702D91EF0A9
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 09:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739265367; cv=none; b=KlT+vHdnuc5DGZash1VxtJQVIhh+Dl0vxgFhIX74m/vNFBic1pzvABMYJg8e9NvY0TRVaeYW14M/l+DqKyXswQuudVaZ1XVcRqD9gn/FB9tc6xaOLE26NZ4PB0sTY4hqUv/Kg53PCEYB7Ne/glluwceGKnCRsjq3UIGCTLaKDlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739265367; c=relaxed/simple;
	bh=8UfEMiOEBOeaIBtwImceNCmamRpFFTjgv2GGzdM5I7s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DEIz8wC9jhfGJ39SICuSjP7gfTh4o52l+2VYwiGpgGUN8FBDuymmgxRRQKDkbVW1sifkDlxzM78GeywTMqikrE8lwM7HbqJv6D/mu5FUtHUnqIKyFFnlg61U+MP82ULjg3dE01BqZqKO5a+QicyK1tYvAQtxblT5uXVqbh937hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FDIrcK87; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FDIrcK87"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5450abbdce0so2065125e87.3
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 01:16:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739265362; x=1739870162; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8UfEMiOEBOeaIBtwImceNCmamRpFFTjgv2GGzdM5I7s=;
        b=FDIrcK87hwYMj3ThVP/bpXvBTIwTIxc2CDQk1BsZHgA+tP1wTU0omUWu/JdUadLlpA
         E4prB+oV2f6vzyyU4eOb0rrIoj2Vp8MsO75xNE5zveAndNG0FNGkidoeuYtFBgExAnPb
         OOrP7R+ioGeslyZjvHUQ3+Ncf9dl3Wqcu1VYBZHiGWF1nPrPNqrwMDYkr6DxXqOAR2dm
         xcysla+vtHS1+M7ZKgQyTgUp67cIC1nEUSVEmM0pm54mecRjEuT1qyBPh4vJ0aLJdeMe
         DzKXCdB86OEIamIfNzv65JdBGTGyLZ6rwMEcwHDClXSmQZkLoh6HtYCDD3/lr/TQ2Yj1
         G8bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739265362; x=1739870162;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8UfEMiOEBOeaIBtwImceNCmamRpFFTjgv2GGzdM5I7s=;
        b=IucuYltE4f6w1ZzfuESZYO0Y8vpJPeizUi8J2Pua0IeN0KqRFUjFPxvVro04ShmQOW
         Tj+Q4Gjcj9h5t2xYRavT+z6vEm0T2VM0yRbBvwVeUYddpvfQ0CzVgeyCPKm4ZGK6IuLh
         ln7plAi7UA+mtA/1IP1KqwEBPIrDw//LPLad6ikuLzvluRpltqCjgT+RdIH0IgDpCk7w
         WUXh3tgpeZNxQyFiPUoorIsQnB2Eg4a6igQPy9d8INuB7rIX+qlSBew2fsUnD2As45l9
         d9P+ooyKMWibIXWnaHvlHNpC8uDzIGpTcue2GldsHeR/4+rZGYwIUqw4Na2IPecc2EBC
         ElEg==
X-Forwarded-Encrypted: i=1; AJvYcCUHdnRk00SxQncbwi5SHgy3bxaoW6gI2+spzZ703fz5aMVur7i1IB/e0tbKaWqVfMvKfKzbPxOsjUYojS4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzn+z+obszGD5wVx5z72afIZqRMWV1Tp0hs7Qj7OIalpzLO+OJN
	JzlT27o4oBCujtjYf54Sia9pdbKgT3mgBZtvYJAp02kjBBGK/92G+3fJn8pycOe6vXGUW2igecG
	foAuqiyswaExi2TjLmY8qhJHIRFFQ0kvPXvE1BA==
X-Gm-Gg: ASbGncvNNEPObIE34p11+8a3a/hceifs53bruji/wuqhK+5azwAKIWMCq1Nt6W6exG6
	W0DEaeDMixnVLH7O9cDv689plkhEP7h8f5Crsd+L5kj3qI8PCoXF4fVM2EXQhP0rMIYeDAnok
X-Google-Smtp-Source: AGHT+IGUDw4T7meBLRLmxvDNfzzNRFxj3H+A9DNaY0nmeEagW6HROntcqR+BTGp7fazad8t23/Foxxtov8jsByu1Lis=
X-Received: by 2002:a05:6512:118f:b0:545:a1a:556f with SMTP id
 2adb3069b0e04-545118767edmr854568e87.50.1739265362482; Tue, 11 Feb 2025
 01:16:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250203121843.3183991-1-andriy.shevchenko@linux.intel.com> <20250203121843.3183991-7-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20250203121843.3183991-7-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 11 Feb 2025 10:15:51 +0100
X-Gm-Features: AWEUYZmKsMFSUUUDA-6QujaPBWCv-A0WnPWsEIS9Ys7-p_cNmYjrYPDZOgguks4
Message-ID: <CACRpkdYgfpYAGaWdoULMhFgXRj49j5Jkf9Do+wmG=NiH83nSRg@mail.gmail.com>
Subject: Re: [PATCH v1 6/7] gpio: 74x164: Switch to use dev_err_probe()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 3, 2025 at 1:18=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Switch to use dev_err_probe() to simplify the error path and
> unify a message template.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
