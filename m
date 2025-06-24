Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D8B922541B
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 19:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750792689; cv=none; b=oN75Lu+V48i4UvtpfeDV/A0ZwVxEn7ft/vzYO58Xp6eUzv+AcOYruRwVcy2odVdSyWayyf+zl0jjCiF6xw1cJwj0vHhsPWXBkUwvrzZvXEfnfQrUtNp5umjmGGrZovQEf4TknJwms2iuV4Z+RJ4xZgZLLoCWJmw60A5cYqHTJeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750792689; c=relaxed/simple;
	bh=rlVXyiPaoDofT68Kl6k4LwYvAUk0MKvVfKfqUm2AAQA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qYKyjrzXR9kB1oia7gpnSz1fFcUVO5GNJplil1IW7Zsk757/Ail+A+10hRiGO+RnEvIwMuttI17R63ToT0vYOqjYYnqYrAceKLRfyKBblonp1IfBAAyh8GEYKmze4lZjIGB++BGJ1BtskPw9Ds0+aasp8WKYQWhgw9kDbZhqaBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nUHQ22oS; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nUHQ22oS"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5535652f42cso871779e87.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 12:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750792686; x=1751397486; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rlVXyiPaoDofT68Kl6k4LwYvAUk0MKvVfKfqUm2AAQA=;
        b=nUHQ22oSLhAFjtUXZm3Ql3svJys8sFwLkxrxP9oWNjDXa5ZwRp/iBNsRTNHPNCDVXf
         WKetQcQQAMZgvWJjIfNvdJ+AwyeRdmT9i9ysBHenLmVJ3wAtNSQ/qHKwc0kE5g64SlKX
         PIvQmpT8zOA2JgAfKKq/La1W/7O+MvnN8jX5IM/I0illIwz+gqkHgUV47S4V1aWnKWIc
         8jMzOQ1nqSavvwqhMKRMGRUiGsbQCx4wKwB26i4elsPiRhcqDqwmapTCNTzIqy09mHBh
         7l33grqynegOasNM9OsRhdOh41yC2escMumM/WxQAW3JtsvBm5bjJyT7FWUrCWTY9PqL
         C1gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750792686; x=1751397486;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rlVXyiPaoDofT68Kl6k4LwYvAUk0MKvVfKfqUm2AAQA=;
        b=LiHvlaN6GEAWpWAaZEO83iPLrevcB1OtxxxPuZaXMiz/BIdSbFfoBSbfFefSl6ncRU
         qv6joVbUiLRVRblah+GWAcfIYW/lC+eCWdmhhiRUUbIMRcU+5dmtbSf11DCxEDSlYtS4
         zjZl3PcLK7dOvhzkBCGvfvrSAMOuzI50Nh/wnPjBPs97mhAbyeJvnjE76d9frYD8XNdm
         KFCnkf25IJ0NTFP1eDu3s0yarwRV22vL4bObNohEHfDKMTHkpTRMtUdaNGkcWwGVtc37
         x6FUEi9+hUeH7VGtY9I3MjRGmlUkYg2iJv0ZnOYnkmPe0GNbh6WLE31sy2tv4NcMR5rG
         TP1A==
X-Forwarded-Encrypted: i=1; AJvYcCV/+7tVdTPjMVvJ6XrMV9R9jalV549TyCud47BgIXXzQvjQKiVvTN+Fxy5mACLv80Tp/r7Lz1pPGUPrkDI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNvIDTstq0WpNUus/2ypVvvR3Sa5tkRSLz4BikWECyAMAFw+pG
	oNoMQcZg+6eSyjhfLuV66s59QQGM5LaEtHlCVdEOsVPdqo/0fl6p6gvsJbuoO6b/xlawpucYr6L
	uEvR6jLlNALqlKYFVrHLyKLjEwVxJxWOWH/rY2xzOjBEmiYlJkdGynvE=
X-Gm-Gg: ASbGncsQD8HoE5etZorQWZDQWeE8Xmssphw6ApLzzhc+1DG3JE4LT2oqiFSgCZhaoZN
	q4U7IHSb9aUh/KV5dmGqswx2sQ10fjPoWWfDcRbWMy6cY1JTP9WmrrwEoGB1mRf8X2/2Kl7prju
	h+sOKBfh5Cs+Axx5R1aRKdpL59RDwebTgnt2kVcTjJxBc=
X-Google-Smtp-Source: AGHT+IFRBqQQlZzmsyWAYd/fJO69xU5qiVZgLBjJUdgfVBCQ+ItkLOaHMARaUX9KAs2hBQpx0fD6NPKZSopDiZk+7Hc=
X-Received: by 2002:a05:6512:3991:b0:553:349c:6465 with SMTP id
 2adb3069b0e04-554fde57958mr25095e87.33.1750792686171; Tue, 24 Jun 2025
 12:18:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250620015343.21494-1-chenyuan_fl@163.com>
In-Reply-To: <20250620015343.21494-1-chenyuan_fl@163.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 24 Jun 2025 21:17:55 +0200
X-Gm-Features: AX0GCFsyN733x2NMyJXFZzqYTBVf21W_AH6wHIRxGUCRJ9WSimGlYAoArQO5BDI
Message-ID: <CACRpkda6EYeKKpVbJ=iuQTC+X2JDmppf+Bq2Lq8MeyHTCOPfJw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: berlin: fix memory leak in berlin_pinctrl_build_state()
To: Yuan Chen <chenyuan_fl@163.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Yuan Chen <chenyuan@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 20, 2025 at 3:53=E2=80=AFAM Yuan Chen <chenyuan_fl@163.com> wro=
te:

> From: Yuan Chen <chenyuan@kylinos.cn>
>
> In the original implementation, krealloc() failure handling incorrectly
> assigned the original memory pointer to NULL after kfree(), causing a
> memory leak when reallocation failed.
>
> Fixes: de845036f997 ("pinctrl: berlin: fix error return code of berlin_pi=
nctrl_build_state()")
> Signed-off-by: Yuan Chen <chenyuan@kylinos.cn>

Patch applied!

Yours,
Linus Walleij
