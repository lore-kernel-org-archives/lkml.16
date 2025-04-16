Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42CF322FF2D
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 08:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744792877; cv=none; b=gmuR9ukqS6WRrN92CLDopi0Cem39DlEzBgR7oiLh59+V4PCoc1a3NqXZcWRkvQyhMqGknPp4gGgViyTbqIvFcY0xyZRRIN2SB0icunz7riOREvta6F5Sk7lpwzEYSgeCSdBS4d2rxLXHaHa2Kbq+lRVjdV7+/Yp8yx6sCp/29cI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744792877; c=relaxed/simple;
	bh=kxf0AqUhSEyeWtBULLKmCMmtv5hyuRRkxXqiUsElL50=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CChh76B+dRLjCbyfp1NNoDjtFIXI1C+lHp2y/kgzKkUghRaEdXnbTEQBcYHYTzPUPFn1JnldzZW18p8rBcWnVgpTIuGC/qbaqq9IqDoKnvH375AgfXHtIzHQkZmpac/2QSxUug6VzzURuU0ix+MXbrIObxwq4nH3Btt+VJC0XQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=z3b1vqnR; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="z3b1vqnR"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-54afb5fcebaso8119486e87.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 01:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744792873; x=1745397673; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kxf0AqUhSEyeWtBULLKmCMmtv5hyuRRkxXqiUsElL50=;
        b=z3b1vqnRQW2hkxo+c1smDcVsC7DptsJJ+RMdg9H63IRMOw4sM72mdSk7ppb0vCXMdD
         zZN34g6FRuG5L5zcrAghJBhMZWaXhM/l3MLyaC9A9P0mZsOCMrZkvEbjTCC3K2+H9JIr
         RXTZg9p8p/OP7hZ2SptBLfJ6vpsXa0Yb1Iao4xljt7Xxh2TTm+pn7Hw1DlVA1hpfUTEQ
         dYc8iuZWEV8j+EKO28QmXM+AvEVuwjQYdCMhum77UYLoPsXyL5MM3AeLXe3FSGp4Zz6M
         P5RXL1w47U7wCd7K87QcqkB7wdds8yzvAis1Xh5XzprnZEG45gDaM1s6f8wgvjDNOQXP
         Md7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744792873; x=1745397673;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kxf0AqUhSEyeWtBULLKmCMmtv5hyuRRkxXqiUsElL50=;
        b=uXZNcgiFEYQQRyi813CyN+u4UgrbUMQEIuQulG6FpGBzylXKDbpwBxK15SDygEhvca
         lTnUPCh823SRkVAEGT2dBv4+wmjcOOWp//biKGvPP5R+HrSw5cdlkgCfDy/TRphJQYsv
         ZtiZf8HfNnSewX8RTaJ/NsNnAnxhYT7iRqpGglDoZ/STD+HXg+K2ZdKRdZbVZPjDtvb1
         w6zMydg6cf3xP4UEQptsu/e//tV92c1sLckUxOfbBdaQJN54JuhcJa2hGizSGjWDsd91
         /e0LvTxQs1hUclfZvHMyoNAuHGAJfW4ApKfMF/9q5glItYpXOhGMTh8cU9kVHjJP3R3J
         2Eiw==
X-Forwarded-Encrypted: i=1; AJvYcCVkXXDaCokYxIQVSqQ1uBM3Um2tllQmuGIPhqPxmc9dScSIpXx7sSOox2ojU4LXAUVfpFe14GtE9lHirv8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWc/Ct+MtqL+5HEScuBuOsx/QiYokTnNMHiVDtXelhDiQqC/nA
	dGHGDhMTK5Gkte/DqB+h7Vnreo8PdRoYPTcsslAEzvY35H7YBH6iETNWpUvmdyQusGza1KvV/Hy
	T4RFGqCsfYGZf7Mjvs5rvozQ5EsbMVDyKPFC0lw==
X-Gm-Gg: ASbGncvlo2JcoUOigUDM2GOsLof1m6oNIEBc7sNhXlc6f0DBVcrIRvt3ECq9ZmTbWb3
	PJYmETEAmMlAZkGuuXSU2Krnv84VsiXljcACbfTL8Ea/wlAe53ZB7Ob/XbCgTHRkVPKHSMRa/kA
	QnByjoUoA9wdLGnr0ik/ks4w==
X-Google-Smtp-Source: AGHT+IH8mo6xpMWNcNdJIoeRY1eieSGQRWpdljySoJo2oFh+1rfwiEfyJ4W1HXlDeTDoHfIKfBC6KiTuMxrkOiZWAAk=
X-Received: by 2002:a2e:9a10:0:b0:30d:e104:b795 with SMTP id
 38308e7fff4ca-3107f738f76mr3366791fa.39.1744792873359; Wed, 16 Apr 2025
 01:41:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250415111124.1539366-1-andriy.shevchenko@linux.intel.com> <20250415111124.1539366-3-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20250415111124.1539366-3-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 16 Apr 2025 10:41:01 +0200
X-Gm-Features: ATxdqUHW4QWAWi7HIzYahxDVWb0xBJmLw-NFLTCrGCQlxhs2EcqoJMd9xzITsLQ
Message-ID: <CACRpkdb9guK5hUuA+p4_EdwVVhbZPea8y83g1fY4Q+40JvZ7_Q@mail.gmail.com>
Subject: Re: [PATCH v1 2/7] gpiolib: Revert "Don't WARN on gpiod_put() for
 optional GPIO"
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 15, 2025 at 1:11=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> No need to double check the pointer for NULL since gpiod_free()
> is using VALIDATE_DESC_VOID() which simply returns in that case.
>
> This reverts commit 1d7765ba15aca68f3bc52f59434c1c34855bbb54.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Well spotted!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
