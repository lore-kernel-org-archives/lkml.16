Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4F3F2248A4
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 07:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744009286; cv=none; b=krexsJ9x+MtctohmhGWZEETS2RZQQGkKH4HhZbZtJLuUNUd/aW5mxKVVTwFUkhrJnt24rtOWT9u+t81vOhFbG/0O/0b1+J4/qJ0WnNOULzOESl6Nm+ijq3vRk3jLfDdTf3QdD9WgdpG0SJ3xjdM6n7Ufwjg0ltiGEzPA8wCEweY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744009286; c=relaxed/simple;
	bh=5TPgUqd0HmcoLMpGeoe7qeEmcG79pUiSBKIbcb34IvI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n3JvLEFUipCPlqFTeRlUtBKm3VZzhf5iSPuxOwEuGnxDZZ68z9ZXhFW5tFrQy7G0jnfus7TYAORHjj6YY4dBgx+6CvBKWM51+Sabj7oDL8/PE5hyz7RZd93S8k5KK93fssEWi37GzQpPeRJq6Dm+7dU7DFbNm0xJU6MwRn7UmOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ooH3VC2F; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ooH3VC2F"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43cf848528aso32803375e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 00:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744009283; x=1744614083; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O+T/7mYVfolcbjOkCvza3DGMsGSnj+rqjgg+o32/m+M=;
        b=ooH3VC2FeKZdnJ4sLdyFqlfYzIGhaSKg4ym7EzByTIKtKEexoPeaAwNOcZ8QHWy0EN
         ASp4MyeMJsOF4+c4mal4RIfabeGadIgbdrX2fdW17eTDk5GShob+V5MAxuf5nG6Lt8hk
         Yx4DHDB2eiZG/H9qRusVf4qvEzifMpPimPrSPEQ65eeIJgCcxkBdJ3TkSI2aCpnipqxJ
         PMiABwC0TOd9rmHp3ANDno11qA5jGnaHtLCC3KDbiMdOpKEWUNIDxTFM+4V4+oEWqC+B
         XMVT79nKxnqe/4lP2RlX4CCKlCmHzi4LeHg/AFi1RXk2Q0ugDRyAKBYaGkf+zy5HJO+R
         A9hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744009283; x=1744614083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O+T/7mYVfolcbjOkCvza3DGMsGSnj+rqjgg+o32/m+M=;
        b=pbMD68jNTF5oJCbKmGTEoxCqxhD6qu7/hS/h3kbK8ZEaydH3XH9ZB+RZhNp+SZgb7/
         Y0MI6XuPGg8enJJhgY3EfjZxeYlL/B+bWNBxWxkVPQbb58KZ8JhdME7+weIIEdG9rQqC
         cGgzUcUDGxSDgF1iq7cWFrdjmrGYqtX7uUMwQOZkNgwSrRU8UtoTvqHgM2gb6ZKPUlzK
         V683h1g3hVAtzSPO77zy5brxMT2C581W1b+nOm+wlh9mmVy3w2nZM9kVI3a0CYnBkDXW
         qJmqwIZTh44eIDVt+Frke5d7cXfhpGSOQqwepHk213jHheZjCR6Vpa+0nJzMaa1vzjM/
         hHYA==
X-Forwarded-Encrypted: i=1; AJvYcCWoGHWCKMNEBMzawc8pCol7SDGw3hlrwQfCV2cQTUWY179eVYvTtNCwxdV/w++eI/PHThY4PhL0O0CdeEE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYT0gU629nO1aXza4TBxtfSBMjjwrxV+P5zrLb45tlB7e4r5H5
	BVgtX9hvO/VRVuRnL/2MBTK6rWAUVJjOniospUIxjmmLEWqYsoHYFnGk4LffLSE=
X-Gm-Gg: ASbGncvUQyTGzPXhRh72W1lXVM3NGz+EMQGg1KySMqwjp5ioHxssTyvc1b7hMgMwYUJ
	2HDpkRf2RlOiTCyZW6YAjt9tP5ZpREGn495Xx1P5aW6XkuPL6ArufkPuGyVtdt61ZBF1Mu8OD7E
	U36clfj7wiIlqKw0INCBvwp3GhIZMhEkZ/jLiVRlzZFnYFXZEGd2CMTevt1pz5BDShkyz8q0Nb9
	yWWoIgYq/ksVhEP2da3BPdEXBQ88C6oewSpgeTjCriSnfiV22P2/8XifWMhpoVGMePblS0goK+U
	Misc9vwRmcQswda+aGtqIlAoyc4J/m4gM/XRVVyrZ2gc
X-Google-Smtp-Source: AGHT+IGcKOBCa7rGoBkgj13Vd1NuCr6A6oAtcMZqy4G7ftLcXmeJWLhRH4aHf0T9S0fwKZIHepyjOw==
X-Received: by 2002:a05:600c:a4c:b0:43c:e7a7:aea0 with SMTP id 5b1f17b1804b1-43ee0768c6dmr50754655e9.26.1744009282797;
        Mon, 07 Apr 2025 00:01:22 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:8c64:734d:705a:39a7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec364d071sm119155095e9.32.2025.04.07.00.01.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 00:01:22 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Kent Gibson <warthog618@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpiolib: don't allow setting values on input lines
Date: Mon,  7 Apr 2025 09:01:21 +0200
Message-ID: <174400927858.9816.1582317982480672248.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250311-gpio-set-check-output-v1-1-d971bca9e6fa@linaro.org>
References: <20250311-gpio-set-check-output-v1-1-d971bca9e6fa@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Tue, 11 Mar 2025 15:19:51 +0100, Bartosz Golaszewski wrote:
> Some drivers as well as the character device and sysfs code check
> whether the line actually is in output mode before allowing the user to
> set a value.
> 
> However, GPIO value setters now return integer values and can indicate
> failures. This allows us to move these checks into the core code.
> 
> [...]

Applied, thanks!

[1/1] gpiolib: don't allow setting values on input lines
      commit: 92ac7de3175e3c17cbb76ae752b598cfb9dadf49

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
