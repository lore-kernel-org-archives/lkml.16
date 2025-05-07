Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A53120E315
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 12:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746621270; cv=none; b=bVgzpH+rrJEwxwEs4wfQDVQUaKOxFIhmxR+hmF6f96brTMrowaj6c1QaVTmX2NQ1OxLrmnTDOTjT5jgPI/phG8C/inZzfy1y4COC7OdUQJHe004jSNSijURQvqjTsmlXUkITP6Z1UydP/v+dgzUmXqF+cV8ROo637lrEuLjYn1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746621270; c=relaxed/simple;
	bh=ZB6p0b8UH/bESGFVljJSkPx38LKg32CurYlFoIT8hZc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=upIfrEzFJAa3ZhMqepOUNKraU/6SYuJ1aNqb8bpWOtvYPglgHyW8yrJYvW2yXfQMEn7klkbKOTZj6BS2GfjTK3MjIxdKx5bvDCVNnzNfKqn+2ugLYYmG2QDUBQ8RHYMx1eKPr8IotpZCbqCrNQzT3lLCCCZaYvlgFhefa/5wF1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=xGidBM4B; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="xGidBM4B"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5499614d3d2so6148992e87.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 05:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1746621267; x=1747226067; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZB6p0b8UH/bESGFVljJSkPx38LKg32CurYlFoIT8hZc=;
        b=xGidBM4BxDWDPx+kY0CEBMQEkiPYkIlDafiVWfKhbA30+sLcGEG4Bcf3JPOuhjzsqn
         5rgVd5suB3Q/FJGpO6Xy9MbjqcIEXTNVV2WnWCJGxP8iDl5ij64AzY8eZOhrw87Vbfg1
         gXnpO9WkOfxH9En8/AfEZYex82a2u1lYh9DADDfsbXHEo0cYaj6MJbmcYDGBJNTc/mIJ
         UJ0UsT0kfUy7jajqaJuXFu+1jMz5TeNbMmqQsWwQszgqqWHfv84qvRZwo7N9t9WMp7fG
         OtZ4MBwKUV6mfSLXIYNxtbkZBKBIzNPIkxp7SAkfTv96EJFYDNuJkWhEmJksRm0AhcQf
         tFYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746621267; x=1747226067;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZB6p0b8UH/bESGFVljJSkPx38LKg32CurYlFoIT8hZc=;
        b=YF7zX1JOj7TZxIj2nyXd+cepOEOTGZ45BkX+grE5dUBqapxJVqIuKXnxpGtjT7BohG
         RnCAQytTY6HJMuhFMC0C2s5DSFQQv8vmM2dzvP9jcus29N6uDsUyCf9YWd9MXB2Cb9Ap
         SiFe04A3za/NndPkaV1Uy6H/Uj40nlUAK+gUql7yGlCeQ/2GeYMfg+rnCp4Fzlzxb1tS
         h9qczStFdwW0W13NjqY7JHz6LqVmVhF9kD0q9jpcgwCYmY4akrrOBfo4kPdg+WpOtTfW
         gUrbgXts1xtBxAPkva6SbQUmP72asdcqGmRVx8XWG4a0LiQrmZ2UxyOD3vKggouL2Wwo
         LzOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIqclah0DeLTLE7KVLGZL5t2p3Qp0RpTvhunf8aMGxVh9x5XkvwYSELvXvnwEmv1q/ee/U0BDbR26qp/U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzo/HSpStftDRyNhHH7TnaqNimgetYlsODASgvDO6a3UlXvWBVu
	SSWa0xyk8SmLzNxANk3eni6jPN1flHIVSnMaK7bBctdq5ZUovVb7xg7HirRytKOdARLlR1kRQcg
	GXI795bDN+0T3QlqdTiUKJv8NKU5shzsmBOaUPw==
X-Gm-Gg: ASbGnctP1e7GkwquV6letRMKKGy5igaRq8csR3gh7JBgn1SOgSzyBb0rUBDTYD83oDT
	Kore3gsHEVmIGUUew7dh9w0kHZPzbcfKPEVddg1LsAJL6CwtAtPJwbwBTazSk1DVY/mQLlp47ZZ
	ykp4grDKm7VXhM5SuYMvihVA/mp5eSYTO2xO46J+GMUVK7JjKjXP1Qxg==
X-Google-Smtp-Source: AGHT+IFgG+UK5CY55EUMSZUkeEuk/IEYk0VOZ0UOQusDDqiZWUfgLmmWHTO06WOk/G/RNJCbB+WH17/isnZ24eNHT8g=
X-Received: by 2002:a05:6512:31d5:b0:540:2fd2:6c87 with SMTP id
 2adb3069b0e04-54fb9292d7dmr1436866e87.16.1746621266974; Wed, 07 May 2025
 05:34:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250505144903.1293558-1-robh@kernel.org>
In-Reply-To: <20250505144903.1293558-1-robh@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 7 May 2025 14:34:14 +0200
X-Gm-Features: ATxdqUF5eL8gozIaQNQZaqyBb_VdC7-G7d3hXKd0rOv6I6RqAOxjq7im7gawZqQ
Message-ID: <CAMRc=MezTdjGmzTSsfJa-Srrhobz4du4NKVvPWv9zDRMsz2v8Q@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: interrupt-controller: Convert ti,cp-intc to
 DT schema
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 5, 2025 at 4:49=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org> =
wrote:
>
> Convert the TI Common Platform interrupt controller binding to schema
> format. It's a straight-forward conversion of the typical interrupt
> controller.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---

LGTM

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
