Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB0627A938
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 08:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744706007; cv=none; b=ERFHE01Yse+5lU9WbS3mNRZnlgPMpPaRmdjmY8ieo/h/0hLTp7yNZ3IevwCijyioBJJ2ymZeryoAABdShcx4B+0sXy3pBTeomIJL0yQVuL8oLKR/5E8IfoxBI2+VHi6z2WRO2RLhAbC1Q/wVPvT/2EMOX/gxwOClQjAXMbRUxw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744706007; c=relaxed/simple;
	bh=BVq44rUWz2Ng76u3u2UZTBQ+iG1mC9PAk3X824w7T0s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gL00wVT5FcvpYZV92PUxkp0ga6cFzsXRfqME2gtgFsT2MiMozZaZim4zONVyr5t9mkI0TikfbXg+CQs6k8vX+4bFBnee+kTBJuxRo+u6+b87h1zUg0JojE/HYhPCxMsi/IpJ018ebWdBuU56jLyqHaUFsScfr9rcwjlJpfjVz2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NluUiR6w; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NluUiR6w"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-548409cd2a8so6857194e87.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 01:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744706003; x=1745310803; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BVq44rUWz2Ng76u3u2UZTBQ+iG1mC9PAk3X824w7T0s=;
        b=NluUiR6wPTq8SHzWY+yBbO9bw1e9QriXtkVUMaqsbbPWY1xYyUnykSLXlEli583CwJ
         catBIZhrhYGMCqlxNLWYZMDAnRoD9kCTVUcaflYHTwdCI8jIZ7JRM719IyWR3xtXqkP9
         8znovBZF6ozkKUcEFdeSJGMzT3HczEjnOnugFOvXQYXGvyQSSI4hpnr3tVtDCcuGQ5sT
         gkwkO5qWoKI+Y6Qz/Z7P3gDSej2f+9qRf6La5ca+57JWEbZp6GXn31ssr8DdyQWdZ5Iy
         pHirL6BCBm+i8nwyKgILGrpnRreepW0ow/W/GbXgqgRGgvN12LUjNIv4qiLTpAL7HQLw
         y4/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744706003; x=1745310803;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BVq44rUWz2Ng76u3u2UZTBQ+iG1mC9PAk3X824w7T0s=;
        b=fbo0FykWmbkpvD9InqCfCZM0eahwzuFyw4vHEUQVGZZOMC+3WZVzDjLD0OJ/ZUS4rf
         XOHJpEWTRiJ0mPLLLfULvEEhfJ/duW+xfFSWsol8qHyYd0Iw9dwiP1InQylfYas8k//2
         Zw74b7jhM7QJyDRw1AiANK6APcQqFYQaY5fjcqI0V5a5ycWTAZq/5W74d2tBugRUdV1M
         3NQweKz0HLz6EbSKL2a8ZNM5aG5GwPL4WMNZeV8ZekHQyqPAeG2Rc5p1V53VcXFc+CKN
         f0mmEbKWMI8ZoYsW0nKHFH0Cf8CLamwtPdXz5mY0Gf7wQ2i0szJR07WDA4I6t3gH3Fdq
         VkXg==
X-Forwarded-Encrypted: i=1; AJvYcCX4KQy88680ja3q+W0aEAV2OV5u1it/5sQ7owtKndDpPRhMJjgMymrOn5wyZkPOxR3ac/CtIRi0vYoePwk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsxUthyFO2VZRMU43FOmhkLSavD4q220O6VBbzPgUa7zEWFZeR
	Tp0pjRbvlQVASIiHgE4sWeM/pm/orjcx4MfUOEjtGNuaC76QOwoZ3mpuaz1AXctJQc92yKp91ye
	alIqQJn35Q9Jox3mzRhevr5IQqWzBXqTrBIzQIg==
X-Gm-Gg: ASbGncuHGL4pNyaR0e+9WjLE2pZe6a0s9v4U/xbjhARMNthmzbUBJrG+0mswSLM6FjV
	DtG1mEftFJaLI4eyao1cdPXfTI/DWgyUFLvE53xdNQW8Iw/xeYpp6Qxgb2QHpQMQv/MYAXjQma/
	o5Fcc+3BAFNGvFANiuxFWW5Q==
X-Google-Smtp-Source: AGHT+IEd5j3qZm6qDkFbtbUTVHnuADdbaQWk+metpqA/AlzIHuMA1sSiTw/XLml6l2Q9TnXYbPJqqjE1BZkT77NNJ54=
X-Received: by 2002:a2e:ad07:0:b0:30c:aae:6d61 with SMTP id
 38308e7fff4ca-31049a80156mr48550281fa.30.1744706003557; Tue, 15 Apr 2025
 01:33:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407-gpiochip-set-rv-gpio-part1-v1-0-78399683ca38@linaro.org> <20250407-gpiochip-set-rv-gpio-part1-v1-9-78399683ca38@linaro.org>
In-Reply-To: <20250407-gpiochip-set-rv-gpio-part1-v1-9-78399683ca38@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Apr 2025 10:33:12 +0200
X-Gm-Features: ATxdqUEnypAgX3dvdjBuXa1nxNBH1F6RCCsFWROhOuXbV9-fbo2oM-bC4KfkygE
Message-ID: <CACRpkdbjyNqiJjPkhxaWYUp65RYpLvciNyXCKzgd3n7PNgDY5w@mail.gmail.com>
Subject: Re: [PATCH 09/12] gpio: htc-egpio: enable building with COMPILE_TEST=y
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Andy Shevchenko <andy@kernel.org>, Peter Tyser <ptyser@xes-inc.com>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 7, 2025 at 9:25=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Extend the build coverage by allowing to build the module with
> COMPILE_TEST enabled.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
