Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B966800
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 08:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751875403; cv=none; b=mlT+hirhAAFgHTVC3R280wIQkznAOxzvployVVqmQQd765zejKZasxSHik6ID1yvhui0+PlovpBiN69c0Z6FHhb5Q0JC6dV5YnhhDtODYJxedcdTJ10oLaTmYpZfafiOrGnGhy9bXt4+mim/At/8OR26Kpuks0hWucAcYjnFd/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751875403; c=relaxed/simple;
	bh=WQE2kv3HQ0gTQZ4sJoK5QnluNwdWhUSE4VaZEjb6gBg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BW1HNpbfQTH4LyjXB5aQWK0El1kbw3KrBIcCptqDTsrSVGuGFW6inL28ytfIa3aFJTrQphhsqiQZKciWwtVi8ZNe/j+qwDh6rCfkDKr13dWMha+t7b7eNmS8xocbtWEaklE2bCmdxdUVnOO/mGn09zeF0prR1UYkpN+h/VwDl2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=X9Ev8Ni8; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="X9Ev8Ni8"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a6cd1a6fecso2734093f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Jul 2025 01:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751875400; x=1752480200; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j8ER9RiwBf3a0PNuzWR+wHPlPKYNVAx60ODVLZpCr8E=;
        b=X9Ev8Ni8VR+vXSZ17LvHTTqKiBx58SkM/ADlXFfNLgkbZ252vTGdrnC5PhAyDlzmPq
         tbVIe35BJ8G75QMDg4Ya6L5jTbqbXqTugWaS+uCqUhkVe9Y8CJxIroW5zT9DiuxhS8aT
         i5GIP0TUhNzpooMwpVK2UZCsyUULoymVSO/Jd8cWYLl7FMOyZAqKOPuNSHMMYSr0o10L
         SjhEfnlidBHMSmmZr9Aa07r3cnzzL4lo4wdBO1vAx+IzqKrx0h+9Mh78LGTIdCfz8gNf
         KO3ykplQ709pTXgmxOfDu3x2D/KedTxBSHJsVktTfDMbNTKtVfS3jw2X9hZPc84xszpi
         oSWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751875400; x=1752480200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j8ER9RiwBf3a0PNuzWR+wHPlPKYNVAx60ODVLZpCr8E=;
        b=T+7AHtKCg4KOV5vUCsbZ/Knz2W+QQgOtE2iimzjX50wljY37t9niMN2ctN+07qcjYi
         r/uXFPXjbja0BU/SC/gL4JvAmNT5kvPc20cL6aHANcxQP4VByz8RWr1o/0q0QD3djwnz
         hCNg/bxZiWyCXehRX+UhDHKMKI4ZQmVDZThXQVerPdhVwLWu5mVgEtarQRK29MQ8rGU8
         OJkn676J2jlOlxbRf/UzUhjYoJ5BvjUFquh0kuoWjCrJtIlUD1Weusn7/Iz45hcZXkmw
         XJh4NhaZWG4W2fZEthRjx4oa/7dG4ZGMPckzITAodqEUT8Z7GVuwb/hYhigWz0QDJEau
         OZHA==
X-Forwarded-Encrypted: i=1; AJvYcCX/T2agxd9i+HrgARxjStihNzNwgREYPxKvd7H8/e9IaewBHlhqKmGVvmfvcwCnKQEAfTWy2EoiOWm9A54=@vger.kernel.org
X-Gm-Message-State: AOJu0YzcAsJdu+pDtQOeTXwXsmtxXjOttZsDuXQfUlvAEAKUPtM6spCr
	J9oCB6DlyUeyww3jxAoHgWmE1fH0RHRrTvYSHBekERubODZEMKuoYXbzYrSjM2qBMyY=
X-Gm-Gg: ASbGncthVkwIJOPxoYetzlItvbDVXBFoVWYAWJK5MzxPEF5++bDH6TleCaZoBxjj/1c
	xai1f3tdbsd8i7YfQcrVW41XJy14+u1IeM4gDTeDwn/E0cyCUpWqAX5gBpTKdoxss4r0r8RNH6m
	XAUpDG4YUcy6kwDOaJbmxJXrH+y9uyFOc6J+OHtvMqpYAfHVecASBIvEi9HCb+QtB9nbeG6QUDO
	xbR4A4/yZLdEP0tsre6D40RWPUPovP6E3CtBNsWBKF052d/+ax5TZk9UA5xiEhJQ4XD0gbsW3eI
	q6xcSdabvDjuoZRSHtNSxECE/mRJyLBqha9R+4PBn/f0Q+F9U1sifl4PzY4AEAE=
X-Google-Smtp-Source: AGHT+IEuKhwyI5Z+SjqvtbsXi6ZzIS1X4CZuWomS6qhOy+fAEFEaFFSGiYj31JlHRtL0PKXI2U00Ng==
X-Received: by 2002:a5d:64c9:0:b0:3b1:9259:3ead with SMTP id ffacd0b85a97d-3b49aa73e31mr5001650f8f.28.1751875399847;
        Mon, 07 Jul 2025 01:03:19 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:3cf3:a61f:85ed:69db])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454a997e367sm130980235e9.15.2025.07.07.01.03.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 01:03:19 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linux-pm@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-kernel@vger.kernel.org,
	"Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: (subset) [PATCH 00/80] treewide: Remove redundant pm_runtime_mark_last_busy() calls
Date: Mon,  7 Jul 2025 10:03:18 +0200
Message-ID: <175187539072.14957.12381640890960188309.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
References: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Fri, 04 Jul 2025 10:52:25 +0300, Sakari Ailus wrote:
> Late last year I posted a set to switch to __pm_runtime_mark_last_busy()
> and gradually get rid of explicit pm_runtime_mark_last_busy() calls in
> drivers, embedding them in the appropriate pm_runtime_*autosuspend*()
> calls. The overall feedback I got at the time was that this is an
> unnecessary intermediate step, and removing the
> pm_runtime_mark_last_busy() calls can be done after adding them to the
> relevant Runtime PM autosuspend related functions. The latter part has
> been done and is present in Rafael's tree at the moment, also see
> <URL:https://lore.kernel.org/linux-pm/CAJZ5v0g7-8UWp6ATOy+=oGdxDaCnfKHBG_+kbiTr+VeuXZsUFQ@mail.gmail.com/>:
> 
> [...]

Applied, thanks!

[15/80] gpio: arizona: Remove redundant pm_runtime_mark_last_busy() calls
        https://git.kernel.org/brgl/linux/c/2fd13c8e5be15369d157da3277ac7407fa73f90a

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
