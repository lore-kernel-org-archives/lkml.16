Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01608218ABD
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 20:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738700875; cv=none; b=CrvvB/CVGYLFJvGr/SsXjwIauXVxBl+yOX6gckJjgisrd0Phjlwb35aCR1doYIJGQLvxWaBCLQXP3+XjEGmvJThL7V9TOfHcN/4x3H3ssmq7HC+BDMahScYEdt/0jBOAB9wSn6Vnoz7RbVvnTxU3Hli3XFwzBkenE6h9pj6AzGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738700875; c=relaxed/simple;
	bh=ZhfAZnDJgHsp4g3A5U2aBrP5viFVs+Efw9vK/2u5x58=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=holCcZVXaHkEQoEsPF5DeGZrgR5hlkfFaVqp3/qrB385ywK99z8iHgI7q4/ns+JbQnfk1W9ZAn1lsHYjL6LdoreZibM7NfXKEtJjlcV/WD9DEQNQpH/0m1nX0HQOaAI/Quf9sFvt5AkeVAlfHNkuyJ/pfirXs2qV3TFOuGq89x8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=wJPZ2ZR1; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="wJPZ2ZR1"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4362bae4d7dso43138135e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 12:27:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1738700871; x=1739305671; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ZeHY/2J2Yuo8dxLF3vbNvohBC3qjQ1SOEuo/Ri1m5w=;
        b=wJPZ2ZR1ApTBihOxBZbZcl4iaod9O406/8W2yq92BkgCSpeXHFvEIEd1Q73E39rlPD
         p7zJKRAN3oM2xLsjRzIGTZ2GIAVdm4ddND97dh1WpjX5MciETuv8HOoiKaKyKX6kxyWL
         CWYDK2hiko/lQQ9+gmTcHE52nQZCH7oHY4r7pwGg4nSZfFlHpqOiiygbxgoEXhVTCawV
         2UrDW2zCitYRs3Ht3QPyAI8j+COIRsPm+BQv1s2I0FGnUTM0GZKOLwPnEywlPtGt5E/8
         l6dJedUhf1nP/XvfW3OFBtY+cwHMrUuXQLkfZB8yIwYl7bkDBXu1+mazeQfi0dM9b93Q
         o4VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738700871; x=1739305671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+ZeHY/2J2Yuo8dxLF3vbNvohBC3qjQ1SOEuo/Ri1m5w=;
        b=XBRBgAwIlFh35/9xxH/fxeKbD+Q2cq9Q4Xd7xNxQa3hOdKT67ZqG1gHiAmTWoY+BHL
         QBKBRRukNY7Tbuxt1wzua7a/jkNwiFv8NtktULCy7BprOIbAy0IxI8pgiS9uBlpl2jq1
         mCDjvYUy+5zORYu+gwusiLvmyYaQouBN8tce0Z3qh69EFW1D+Ea4xlCsowAQcGU32feR
         TeGa/A/VkkzZQ3Sm6qI4obMO7MnnYSe9JjOyqVCar59LNSLja3W/zWGyHpKuxpEGIjam
         PRsP2emmVLx5qx6Fgfw1PzWy+LZ97xADr6Sll2W2VsHCvuO6AsBl48HRt8lyj1rsGNJ0
         TnPw==
X-Forwarded-Encrypted: i=1; AJvYcCXLal/Ci3Gjn7tAJt1ZP3um9PjL8oBZzJAjdPEkWl7pPPMK/khxy3FfmgJXaMKk0EpM+C9SK790rxcQnfM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw88us4fpAlKd3ImZU3hXbqch8nsA1z3S4vAD4i0+oHx2b2UDGJ
	OqXunjOErMtm52ZhSO5ES/8RBvA/8MrOM65ZZwy0YUf5yjPWwsQkJ14x36UWPGs=
X-Gm-Gg: ASbGncv3vJCFwnM92fJSk5rXgm3T3dZPSIBH/IVU7mG+tkoVNnKpSxqIa1qNKqKbJdg
	0GKRHh4EnAt83YfvrgmpbCp9D39Q1S3FmBmxGs+JvGaL01FXBXKWw+paypLio5a74KfW/dYr0u3
	KmNkem4SV0dRrdumM3X3o+Lx4U41AZuoCS0oPRE4O46My+efh1i25EqO1gwg6TAMIiNVetvW4ZK
	nN8ko/w+OOGTgqNyrV0Yxw7/qKP2B3onmSO2HgJJBilBT7qA/dElKuTz//+gaIr8Bw09i4aSHTP
	IinXVeepvVWx5P8=
X-Google-Smtp-Source: AGHT+IEoYW5pVEP/c4CSgEK9useH3xzBCLlbEG/oukqupf8k+442HpqGKOGL5DkBe0Nx4uPAzc6nNA==
X-Received: by 2002:a05:600c:1994:b0:434:9fac:b158 with SMTP id 5b1f17b1804b1-4390d42ccfbmr299195e9.1.1738700870983;
        Tue, 04 Feb 2025 12:27:50 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:4fb0:17c9:a494:227f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438dcc6df36sm245420855e9.25.2025.02.04.12.27.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 12:27:50 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linus.walleij@linaro.org,
	brgl@bgdev.pl,
	Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: pca953x: Improve interrupt support
Date: Tue,  4 Feb 2025 21:27:46 +0100
Message-ID: <173870057719.106350.17999921686110317967.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240606033102.2271916-1-mark.tomlinson@alliedtelesis.co.nz>
References: <20240606033102.2271916-1-mark.tomlinson@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Thu, 06 Jun 2024 15:31:02 +1200, Mark Tomlinson wrote:
> The GPIO drivers with latch interrupt support (typically types starting
> with PCAL) have interrupt status registers to determine which particular
> inputs have caused an interrupt. Unfortunately there is no atomic
> operation to read these registers and clear the interrupt. Clearing the
> interrupt is done by reading the input registers.
> 
> The code was reading the interrupt status registers, and then reading
> the input registers. If an input changed between these two events it was
> lost.
> 
> [...]

Queued for fixes. Thanks Andy for taking the time to review it.

[1/1] gpio: pca953x: Improve interrupt support
      commit: d6179f6c6204f9932aed3a7a2100b4a295dfed9d

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
