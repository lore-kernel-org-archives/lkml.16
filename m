Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 227ED1F7569
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 09:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751447459; cv=none; b=fYAyHsXdWohG3/3UpY+1bDqtsWOjas6dew5J7zSrA0fVEJkYJxCzcd+70qZuOJ1f8JjyLbtrfzunX4jNJCxOURsU92gSvlOgS5RNf3EGNoTsWfKWlBt4uLrbU17TKf48QCHqDFY1hfvsmg1/BpVLCWF4WrLLv2dD8AyeBiujo+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751447459; c=relaxed/simple;
	bh=pDH4h4ixIvMXtfqOJpH5T9/Ff7vK1uZlJ2JF7JrxzWs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nzXiszCkoOi/tWSj/K7cSQM7pyv3Lui1f5mCG9u00bYwN99xUtvuBGAIAfB8nm6IZCcJ7lRvvHpRvF1sX00gVcf7zJNbTa6vlYfTTgDd+uYfLhfolG+j2TjA6ucxu6W1U0v9TQDT7VDGelXW2boUpjtyloL/+j1S7q4bSx+Hr50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=YSstOdCz; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="YSstOdCz"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-453426170b6so39751935e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 02:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751447456; x=1752052256; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vd9qz1625SEdu3Xq2Mc3figam6WTA5Wj3do4icwwWIQ=;
        b=YSstOdCzLQRzjL8XGuKC34lZFwl9zIKhiIdN1RcuKh3dL2LTJ77PEtewLoyxXkQoYm
         6nQITK4m7rUchOeZz4HOAjtQMdlX1Al6vATnK4b9Y0NzxcwbxqHx/KM/mioCZUeyE5ZK
         FXkzz6m6SF/OAqecIzGuuSGEKwf0UiGCvFpSipjrRpv4Mwh8Z9l0kn2l5afYB66IJ7M0
         mnYFJc5FYL6KWcDzIPg/pQaIMgn7UYlo8Jw0pmU5V3EOzUYGyG309IB7k7AnW3qPJmOt
         ZXHkXetCUZKkApzXvQYp/MqeWACKpE4B1hvncH76DsZ6bfPWiWya7NYqUQAbGWy8OF9z
         iZEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751447456; x=1752052256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vd9qz1625SEdu3Xq2Mc3figam6WTA5Wj3do4icwwWIQ=;
        b=T2LRgGxivyxnzfsiFJLZ7DZSejq0TAFMymf41t0jAl7v1y3FB7rA0FEgE2ahFwVlXB
         YePbd2eMjx4LpcH2VCyejap1XCbksFyNHt8fCyXIbkH/AIV7jIniG8KV7JE4mQnwXe75
         Ei35xA9bpyKLjRsvhB2IcqTKLdpipRZiz+uw85R/fuHyBrcZd4CpaJS8AG67A0TkIbPN
         kvR4uYPFnm4ma8UErjFTj9mGDQukOzi92oBprJ6F00fetbzJ6tzr9N9ERngbN84Hzyge
         j+vSnDjGN5itFdrLapi72p4ZdczXjGuv7DgEC9oaJOgOfYYbfoygCoVT818pgI4Irx99
         aqgw==
X-Forwarded-Encrypted: i=1; AJvYcCX7qWG5OkVt/fxohOE8RQl50wp/sRjo+lH2FWXqjQw86RIfdVXZTBUYyPWttoecr/1uMn3lEZ9vmNAxlq0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxiAAYvSbu88zcXLfaB86PMsc7GY+ye1EJFCjChTGiMOFtMEkmq
	D8raJP6kektl3kACY9NMtXdYVmsLGY/Oo+li+pwP1GiJk7FTogOtgETXcDm8MNCGMzU=
X-Gm-Gg: ASbGnctQAPDz8wXLe3r0MhSE8fOMOEtTVmkgh0PPiFgAYt/XhED87n7MrOVyQRAoFHx
	AVn+tDDgKNr2qpiBMew2pqU5AHIe5e2OS6Ycom6fuHmnZN9HELtXJMlPCqk3vI93dCiPafstsxy
	AjZA2i8OcdqgeBEgfnEfg435JgBi6tk9wf72liZktAVDh9g/Zj+UGChJ8FcKLR+/8HX+F07fpKm
	m7HuUkPEApcT1jboHKUilJc32ws5GgWFSaxWjI4T7IF+QamA73331W6tR6TPHEfBenPzPpXOJK1
	75ELlTupPeyIMMtQaxuQn8OcYlcgdaTVd7C2LkCBVc06f8OGxoUkiLoe7aKv
X-Google-Smtp-Source: AGHT+IFBiU5+2x1l4XAarHBpf/yXWqDYHDetjcWRe/wFvXFKll6sHtwMjeWcENI20hbqFMgoxKx8Cg==
X-Received: by 2002:a05:600c:c0dc:b0:453:45f1:9c96 with SMTP id 5b1f17b1804b1-454a3c610camr14840535e9.14.1751447456399;
        Wed, 02 Jul 2025 02:10:56 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:8827:d0e:25e:834a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a3fe28dsm192866295e9.20.2025.07.02.02.10.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 02:10:55 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: pisosr: remove unneeded direction_output() callback
Date: Wed,  2 Jul 2025 11:10:52 +0200
Message-ID: <175144745010.23577.14132407627195211474.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250625081222.12744-1-brgl@bgdev.pl>
References: <20250625081222.12744-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 25 Jun 2025 10:12:22 +0200, Bartosz Golaszewski wrote:
> GPIO core can handle input-only chips that don't implement the
> direction_output() callback at all. There's no need for the driver to
> provide a dummy implementation so drop it.
> 
> 

Applied, thanks!

[1/1] gpio: pisosr: remove unneeded direction_output() callback
      https://git.kernel.org/brgl/linux/c/34e61ba8193945c90f1bcaa9d595fc05c586663d

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
