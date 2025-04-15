Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14347215F7F
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 08:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744704580; cv=none; b=s4uMhyZT+hmMkIZOYnqjs9Uh/vMPKD+VlZdR7gT3fCxa092Ld+1KSkbMUYAo1WqbFHx2e4HAIMob6b+tY/0yhHBlyg8b5fFbDSZ8SVM9Q6DM1IZERdpLxN0ia6e31lbd198p7eRv0695xUsePQmxfuNrGM89oEykYS8j/RfvRy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744704580; c=relaxed/simple;
	bh=a1KLlXlZdYC0DQZmxE2jQ7mHnlUnvqQd623UMlv4WaE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ps1iqf9bpOW8GcLG5lJxUAl9icgFJ6YK4nY1M43jgRPw3KAk1+miSPYWtrq/cA8sRhMruq9pM07R/NJ2JB9eBi9k8Hejjdlc+S6g+5h31IolmPAyO4y5dJ2l/bid5cvT1rCbNDDjUI9Qs8FXWCob5Ziarh5kYa/VeqTQURfqvNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MzagwxYg; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MzagwxYg"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-549946c5346so5931810e87.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 01:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744704577; x=1745309377; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ICfwA3EdEWzVcVx+hLIJ6dLtBuJmhGYaj0rjrQ65WG4=;
        b=MzagwxYg9X50BylOmXjHipvJap58tOUpE/nafLw5uaec/GM4h/ADslrhhzRSr/b3+B
         wnXTz6f3D8O7euVuyIVnmJZfxx64pB+zLFUhLAAIPfoDYTyznEsVRjPhwa0otmnsUKp6
         UjzOVquit8zfh5R87GKW0FR5jRE8uzv3k3rfhM9dKXsuQIub8rsE03m2wECV4RkjPYtH
         kqp3aySE0a4mfkKTIZNt6iIIpvEHsr4l46UmChxaawD4hIsiHkPLy4W3ccXBVNHFLN1V
         Ccx5H0ZA9gXWRTmDBrS/OEvKUNPq1f1pnFij9gYu2Y/Kcm1JQPehFqPnHuMS8RZTNh4H
         2OJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744704577; x=1745309377;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ICfwA3EdEWzVcVx+hLIJ6dLtBuJmhGYaj0rjrQ65WG4=;
        b=m9f76aFozfh0/7DzvJCFTZShFKLQb6pLQNOKoVIy3N8T5V5WV/FX9HvIDSAt1lirRw
         9GzE8+v9/sSS8DJX6smeFTEsCPdw6snRNY0cYuRT/XPjOXABjNqwDyogNknjuoip9Fz2
         VvqMz97QL9vDhNeHbBoOcIkxyMXKlvpbtRAnHsHBtUuOCIZ808YBkf0CM6HAHXJQc0UW
         RMyrxJGIjOfsBglT+WkKxfjLdOjpjBbZzZAG9zeGKB126UkIJ3Wual4byMTlR3WR+hIA
         IjVMkDX/czazRLdTeNrrMfGY+g4I0hGmiHA442QYUkl5QrA/e0be1PP84avHJgpLkR0Q
         CP9A==
X-Forwarded-Encrypted: i=1; AJvYcCVBi+t1St4xpTKn0SvfhRBE6QjM7NN9FDFy/sn3tN0W/7h1k/+gDeoz0h5RGJZGYy1DKopeTK37e1D2LnE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvIMkxIrY+0nWZonXODSCMVFA1T7NOSU1ZYP+Z/JGaU2lboNzQ
	nx6fpK8OqUYe/FKgqO+JvwhlY28KCuPBfeiJCpTQHo0NyPnd0kuz4XBI+DVM/W7Io1Cx7/+DlT4
	vTf69p+Za53mnKJkzOycDyoGZIP+zJ5ptCQs/Ow==
X-Gm-Gg: ASbGncsEoYOoZuFnRSFLUVPW3ZOx43eQkFPQTZIExgkPOdputqs4Jh5muPo8XpRZ/5W
	hAy0VDK6ig33a2UERwcuH1t5WE/rpYowqv3ya27TKUhMmeip30NrFbiT7WwPiQsNQXc3eurj+sm
	MtzMfxj9VSoIgJQTNJWqT70Q==
X-Google-Smtp-Source: AGHT+IH0Y4jm0LaYVhqlf4ygy8v6EM0HqVDr1pCml9YV4eSiyilIsQJQAcufVd3/LXkLFdiQwaLxvtXP5qPvFl0mrI0=
X-Received: by 2002:a05:6512:4019:b0:549:8f06:8225 with SMTP id
 2adb3069b0e04-54d452d692amr4312543e87.53.1744704577064; Tue, 15 Apr 2025
 01:09:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250404115719.309999-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250404115719.309999-1-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Apr 2025 10:09:26 +0200
X-Gm-Features: ATxdqUHY0rsQZ362mf1eSV0hA552eBY6l9M2A3A0WPZhzC_XlT3-mPSct8oGVPI
Message-ID: <CACRpkdZr-s2sW07M8f-qr6YzRuNxJ_vRE6-kFaXaX7v+3g01FA@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: meson: Do not enable by default during
 compile testing
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 4, 2025 at 1:57=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> Enabling the compile test should not cause automatic enabling of all
> drivers.  Restrict the default to ARCH also for individual drivers, even
> though their choice is not visible without selecting parent Kconfig
> symbol, because otherwise selecting parent would select the child during
> compile testing.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

No comments, but the patch makes perfect sense to me, so applied.

Yours,
Linus Walleij
