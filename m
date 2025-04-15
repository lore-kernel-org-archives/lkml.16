Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A9127A90B
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 08:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744704597; cv=none; b=Y0RnUmVGN4w1hm6yd0Z0Zr86vqnq2uIjYbuEtRHEPo32NZsEsceuowvEc9BIOSqHCd1fLVxL+P5CEXknx3fI7OwM+K6bYGtEJFHFwgD9hRbr27Df5+HDd9pNJ53KHATyZizNVLb8og/ADSuF/EM2SEwAbzhteYkQlFK8UO8QRHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744704597; c=relaxed/simple;
	bh=tLEWsOGdQhM0Zjsf3h6/8bfBGD6fRYml+UveW8GvJwE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xlf68K/RoDmpXFdEZjlqZqti0zecN5sX2vI7BhaOCUQPq5VFTlrVRAOHwyFqeEf52F5AiAeZxsDOEWIifGpMbPYRiysnhgoHzOI0uL9znveXIcqofOgmy4md6qHKw/ExMDV0q1czQ/A/Q7wQoPLgtQnSwB5gWbNw9EkYDCwkA6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LkBrx0Mk; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LkBrx0Mk"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-30bfb6ab47cso48444871fa.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 01:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744704594; x=1745309394; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tLEWsOGdQhM0Zjsf3h6/8bfBGD6fRYml+UveW8GvJwE=;
        b=LkBrx0Mk+N6nGorcTlMQNKhYWvmiAZvigVLyo51ogtVx9APzBCjOjiT/BIzG7NK2Ur
         t5I6SACfBdKpdzM3WWO4ofcKf+QVtgR3YTubGuHDY3U6zZrUyAbgUEPZav7QBe6LEF0V
         RXtX8C3ybnsc8b8vmHgMdfHEq9VSYV2rx4xEuhi5smhmhrh3u01HtWYbQoXkZx+AkTEC
         x4cWgigPtt+jaLh4qpU3UjQHU2WoV3XFpHkXZjGstPXFO+U+bW/PBF4MqPUzIj/PER9H
         K8AVi+a8r9R+vJqREAJ69ufC0Ev8jnW1vezKUf9eJqZGyz3jZpGCLtt0YR8C2Nr987y8
         USzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744704594; x=1745309394;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tLEWsOGdQhM0Zjsf3h6/8bfBGD6fRYml+UveW8GvJwE=;
        b=I8V8AGUVrR9Sg+V8fNrzb73rI+WddCT2PSl9ArM+ryfap96+1DIFpXe/GIwVhC6JVq
         5VpdTi5PmEaU9G7BAofX7sa/+8T2D3FnULy3VQD2u4QNLa1w6a7bon20JApL1+xZYXrO
         M6rMKK8HeXcEAYZXF1KxzD29VNDXmIldPcFwteYRWLzYDAeRHIgrvMd/A5YO67Mz5kTP
         +c0+7jXVM4Hl6JCRuS5NbwkuaOWAnOta5UY+/yIrpyvgC79CywaQONgk/hkfsCGwbTd+
         nmLIN5eMSLxb5kV3EuNCkdAX76AJ0f2B/OrabBi/5mRjgStC+qBh0ZiOko4k7mEyTWaa
         8HNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCXp5Z+kyE+PVe63FnV91pJtMDB2ZTDLZJJE6CsNXzrGw3vSB6gFmMIt2ZaEdS/ze4wcHFTOIvJNldpwA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxcfIMrDY/2MlpR+7W6IyEyYMPPvAtpKjy05oKvOVDrMHYZrrY
	1RRQW/7w2uI8/zSp9k2kG1D0RdxEizjnvTbOhjDhEYGmM8h6vEPcrVmv05OpH6nrQ+cuN4ZL036
	Lvdw6D7aqJ58Cv8CFl6tioZWpzk/pyuJf+xFzrg==
X-Gm-Gg: ASbGncu3ANuysf8CFzsgvDvMSphLOM2nMOECikW3uuzwCxE8Z3wjNwh6Qb6pdY6/UF0
	LQKExCrfhjSBrYKoywSxhkgU6jsKe4mDdgUlyl/T9AheE0lVIl0qH+Q+flzwW5PvvdBj7kzM6E9
	K2UC4iP34VxsRffg8Dkx08qQ==
X-Google-Smtp-Source: AGHT+IEMlMqsPAGJBzvZT2lPJQosRhpvoETScw1sCKukc31T9fTkGic2VsMp5FRUxyJuWIZeSw3pyLssyZGpIRA+vOE=
X-Received: by 2002:a2e:ad07:0:b0:30b:a187:44ad with SMTP id
 38308e7fff4ca-31049a80842mr52529351fa.26.1744704593653; Tue, 15 Apr 2025
 01:09:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250404115719.309999-1-krzysztof.kozlowski@linaro.org> <20250404115719.309999-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250404115719.309999-2-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Apr 2025 10:09:42 +0200
X-Gm-Features: ATxdqUEiPhEWajxjZ0u616Ca2IYOkRClv6g0V-9rh2iDXiM0Iv0_Uzdx0X_IW4c
Message-ID: <CACRpkdYJNLwKFyzjzOeuZofBzoHci39UH-0H5cEM=97koyW1FQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: uniphier: Do not enable by default during
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
> drivers.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

No comments, but the patch makes perfect sense to me, so applied.

Yours,
Linus Walleij
