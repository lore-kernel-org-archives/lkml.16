Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8878132111
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 13:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738762804; cv=none; b=KCZd/bRCkuqMhTWN6tfftj2vwuc1mzR3lCHaxMJvmjMrP2m3puadqOk8fN5TjR2zoso6C/gyh5JRa1TSISZW+UoEVi7nQFBykow0jbbvuK7TFJE8o5doc90MNeVBETC6+7n/c8cyIGsIInlHRl52XUIaVcprykUsyBNYZjtI8V0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738762804; c=relaxed/simple;
	bh=PLo9ekNb2mKGhOqPJ5jYEscWQR6GzGgX5mDmmyYgIDQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Dk1S4L7uuuLnwT3EO2MGS6tEIJvUa/bfRgceSxSN2PyGJJY5QS/BcZHEbtAGvmnl/k9Lg+lXeQacwk6y7PsbJwoeo7t41bva9mFVkQiVzwA/xGbJlfJLe7DMn368T5OlayMC0cgsl98Va2LVWf+2EKS1Ol6dzXgN/Fu+Mu2OSO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=tPhjCD1v; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="tPhjCD1v"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4361b6f9faeso5462955e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 05:40:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1738762801; x=1739367601; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PASFoT5mXyDxz1C4PLJNUKTV2eZ6J8+dyrWeDE9Wios=;
        b=tPhjCD1v5xtcnFBTxS3b1UpfzRUrh2Vupb6ur0F0WPd+EvUjwI6qH7Bv0uOMuoYQW6
         E7IFjr8Spe9rLnzuZM8f56xz2hlPZEF6b8aHZ/KWdR/8+HU4gJcpybEpm+PEfC9UDGZ/
         yMwlpK7DVzZgf8wc8xA/cze+gUAPOPOV4zE1dWcZLUhM/PtapmqtDr+1atdWyAI9OPWo
         vEI0zGx7Wt7ropzn0V30PisdVa4YV284HIQCjhzrdN+R0rjF2pUeLB12SS0I4PcpXCqx
         DO+9aPYsbk69qj5JXa839VhZ0B/S3mFMaySFbQTDiubvqhe8Zmv4x4v377VcUYzLGl3a
         ilQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738762801; x=1739367601;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PASFoT5mXyDxz1C4PLJNUKTV2eZ6J8+dyrWeDE9Wios=;
        b=c3LpokxXCMf0RxzWcEfkKBWoeFEYfekP2kcwkZNpYdCtSjleIyRF+OQU6cL5acGxT4
         JO1qHL3TwVL3msg76zVcHTtxuO1/RPnO0PlNWWiaZvV5QPXRcCG+tuyEmuvRao0EGn/2
         qr0L6WhKqYv353zWa00rB33IOLWisgx4pU2uBJoFQD8QFSofJXYsN5yVtG3S3XYAZ1lV
         3vm3Y7wlY04wyyES2DQzeK8vloh1uxPeQn+Sn9XNY3+2ZS9u/d8uzTpsLC8hx7dm5vGc
         CAcjU4Nv9wIAqKDW3DzUe0eB96r9DOa2tq7gbrNgTtiT3qljJzNg4zFaLT1EBDkTPSj3
         e4iQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1JSnXkxHEkCFfkOb3zHShRALaKqdTrXHKFmaKYCkilW/kpHyXG4na9vFvV41pBkmCvn0PDNCf4KfHCw4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYszehlSvW/rrBRgKtb2zvt2n3RWV00U71tMAlnJqrPFM2gh+n
	Sm5ShlB9e0gRrl5/WD+VTOi6gNCCmlUDtvjnQ9xflUHqvkbRL/dMYxkeKYdLkYxCuQs6F6lLDnz
	nSpE=
X-Gm-Gg: ASbGncsWCl7PMCD+T4hwajVNQkM8Dr3GydxIi9eA9oS2GSqNBJL8o/ES+v7hyDPsmIz
	DMwDplMVr8MP5wNjCHUxqmeR/xl4wcqmaDBPj/TFxBdSWtnKCDnL/Oiy2nrqQOr2ADdX+ye6GfV
	Nnc9lI1xlUX96OR8bujbcc1+m78O8r69Tz52zIMy21vZ0sqk+hKaERmiJfvqFi5rqJad38fgAOa
	gDU0UdNHDnm6dHk+KFP2fWo3j/RKFwY6nLx3gmj0RwTTJlIf5d0l1/jTsDfKS3P7Jo4jYx8G2ij
	UdMQppUNnJs8NGc=
X-Google-Smtp-Source: AGHT+IFq5CZt4RefqVhDnLXc5QwlgFsHEvvq6JuF5fgkAmxF3evmOI2s0at43EjpigaLCtH9U/Rjww==
X-Received: by 2002:a05:600c:4693:b0:434:ffb2:f9cf with SMTP id 5b1f17b1804b1-4390cfbda73mr22108905e9.14.1738762800604;
        Wed, 05 Feb 2025 05:40:00 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:3239:b668:f15e:fed8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390d93369fsm21974185e9.3.2025.02.05.05.39.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 05:40:00 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Koichiro Den <koichiro.den@canonical.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: sim: lock hog configfs items if present
Date: Wed,  5 Feb 2025 14:39:56 +0100
Message-ID: <173876277706.18360.299205391890654246.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250203110123.87701-1-brgl@bgdev.pl>
References: <20250203110123.87701-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 03 Feb 2025 12:01:23 +0100, Bartosz Golaszewski wrote:
> Depending on the user config, the leaf entry may be the hog directory,
> not line. Check it and lock the correct item.
> 
> 

Applied, thanks!

[1/1] gpio: sim: lock hog configfs items if present
      commit: 015b7dae084fa95465ff89f6cbf15fe49906a370

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
