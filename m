Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C74F1A5BB9
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 09:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746435956; cv=none; b=RNzns3r93rhNOO1YAcXRBToqvfziAMPT+FZ3/P7l6v+7vNafjEFs00t/NkfUNrl3Je1+h6hYRXHgi64Tsa0NeORgwvlusNHqLQn90io8pHDBuckrCJ8I7zvn5M6fOr3Q6Ks/2uuOO5SnzUZy36z7RFkxGYrtfyJ62r9q1Nq540I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746435956; c=relaxed/simple;
	bh=jaVB3sx5ejThu8wEUg5nUqvMM3/yIkqZP4MpKH/Gvus=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DbUlOTYwiZLxm/PtVHz94KglojVfZeXxVjHCB83WTsdaW8zt6JsdJf9j75Ul3Xz2QjaOHkTjgWikiu/i08rRPKWmqi3I3kBAOavhsMzH5gbFeCkgmjFXdL+/EAL/cuWpVYu7wMDrncsVK2cpLADbZAJymCO/vfdUnuiG+PvdjPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MlL7nBW/; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MlL7nBW/"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-54b1095625dso5078297e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 02:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746435951; x=1747040751; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jaVB3sx5ejThu8wEUg5nUqvMM3/yIkqZP4MpKH/Gvus=;
        b=MlL7nBW/px4/CIrOcDVdTNLRXOHn8yS4tkl8gahouAGayJGPJqKG7TovPRz6OZflQ7
         HrxkSxMMF2EGr29W1/2JgxnxPb/qX9uIb23pv7gXw8tqn0fB/SaqXK1Lp+p0Vk2xU23l
         LZZRy5uq+6LmDkYfAOtc4U3E8P4ZaMU0hFF6m9aX03TaP3+twc2rXMw+f83YhOABl0S3
         hB0EUgKimx8KloaODdiVeQ0hw9ejIGmwvHM23m4Jy6jqECJthkTg9Nq4OFj7UcJIREOw
         ZJUDneEhIBtERekDd9C4bih9FI56DBBCMu2BDfDBp9vbmYYAurypYzemB/N3Co+b9dlc
         +E7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746435951; x=1747040751;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jaVB3sx5ejThu8wEUg5nUqvMM3/yIkqZP4MpKH/Gvus=;
        b=K4Rjy8DHJGwYv0zbW6rS18+xmXArZt2dcU/n8dLJR54kmsm3PGWQ5EyMPBjpst9N6r
         KqSUNgSJkIT4O6DfrEH9yhzNbcCK4mk/fE+Is5C0+zjY442fM0+4pO1UrY7mVZDo4zhu
         WttBl3q4Vgr8GBZc3b+FVbbcAYlMIo9pSTho5WRG3ra6XbwBI2ZBf/uk9siaAN2jc/lc
         vw+yWUIBDK8mNFR5pC/1wQhcFTJuxj8a5yf6r3hWFToG+OKHnnxdiSvDZiT+1Tyn4yfN
         rq9/QPelHzXK3NNcFQXeK9y6bt5M2K4PLRwvyFe5lTSgObr5YyhismoHfZBUhAmxlMbM
         qwGg==
X-Forwarded-Encrypted: i=1; AJvYcCVVbMmY9qN7OwBfwT42D7x6lXMh97qdyUPYDein4dLxrybLNC4EVwmQU4DuScJVNgEqo1QqFE+Zpf77/LU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5EMxZmPt9w36C2xfMdF/7PsM1pr8bZ2O6pHYrGwAesPXTll69
	P4K1vxmonrGUyPYuDXqXCbF1h5lz4O7eO8VDYpBB2iNhs3LcsW7ZSGhsOida28q7VtZtvmMDCQh
	31jwfCQgUIiAhC29ol8YGR8Sr7+EaXYigq7E1Tw==
X-Gm-Gg: ASbGnctxD50Bk3zgBgI0xVYIqPeLrcwygQRNMTfmS3zPl0CH9k8lFYHEJAUEpbyQ+Ua
	bQirIGBOzsz4fV3VH92YjJwbY0yfsU6Ng5VsNOyovwCkd1FiWE4eggigHRGzoDY7FILnb2wLrLD
	4DXngBuka/2n84UFQ6GaJjig==
X-Google-Smtp-Source: AGHT+IG1Gg4cqaY2027Xkt9vszcojc1RUUWP69uzjNjCzPb0+lNxfxbfad5R/RgzScrc0f+PobFDAQA8A6a3BcrID1g=
X-Received: by 2002:a05:6512:118d:b0:54a:f76a:6f83 with SMTP id
 2adb3069b0e04-54eac200d31mr3042013e87.13.1746435951218; Mon, 05 May 2025
 02:05:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250503-smc-6-15-v4-0-500b9b6546fc@svenpeter.dev> <20250503-smc-6-15-v4-1-500b9b6546fc@svenpeter.dev>
In-Reply-To: <20250503-smc-6-15-v4-1-500b9b6546fc@svenpeter.dev>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 5 May 2025 11:05:40 +0200
X-Gm-Features: ATxdqUG40K92Q6cLhA-jiK9adWrE64up9leFqXIiQtBvPLIG9_nqRk1Z9BFEJZw
Message-ID: <CACRpkdbCfUEZd06yeZTNecGFPwBgJkpMH3hqkvJw4J+iSENG=Q@mail.gmail.com>
Subject: Re: [PATCH v4 1/9] dt-bindings: gpio: Add Apple Mac SMC GPIO block
To: sven@svenpeter.dev
Cc: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
	Hector Martin <marcan@marcan.st>, Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sebastian Reichel <sre@kernel.org>, Lee Jones <lee@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 3, 2025 at 12:07=E2=80=AFPM Sven Peter via B4 Relay
<devnull+sven.svenpeter.dev@kernel.org> wrote:

> From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
>
> Add the DT binding for the Apple Mac System Management Controller GPIOs.
>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> Signed-off-by: Sven Peter <sven@svenpeter.dev>

LGTM
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
