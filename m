Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA4A51F193D
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 15:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744818995; cv=none; b=VuKTN7HG8wNAhH7QubQ1eK9LEXoz5zcvefkpKykFiL0bRuqsshgvL2TE/IhCC1bbMppEZbNc4Cerhsy0KZ1Ej31EUKvQU607Q0Q+sF4gBm75rSXT5jztkdI8zKMcFEgElJNH7zM+9ts6wii/QR2+QM82vOQ7fM1uwcwZ6+83yiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744818995; c=relaxed/simple;
	bh=zq9fTS+ACAxKSl0s2mcc8GxghLsBfz3pnTM9Iuqgs7A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XcztSmX1jJVpM+wTidFJnCY3XK+Z2o95qtNqq2BQPW7Q7fLZ6pG/ZUPLHCeGvdpMyDemCMcW2c8rVWpIGzFu5ans1LAUjiL2qKn5WOgCXX5q2I5sGxDob+luMef3MacI5AXKrRj7apn1T32yqD1cpnh+dXpOWK26KFUKV2iu4gA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=AoU7YEwl; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="AoU7YEwl"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3913b539aabso4295927f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 08:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744818992; x=1745423792; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/9YkWFmLJl20Npik27xkHa0wtGlZoa7Us/OtigKWito=;
        b=AoU7YEwll8GbDhRPxRT1QE0/m/ypqNlodZYrzJfJ52ldoayFcXOmo6x+nyTWDMwH9z
         rXxBvGNPiPW6z+F0Opk9DCRS7eM4M1gOvIPWJ8Xt1TA+olHxDUTVNSEBErCEafLaWkO+
         Q3QjJ8tQnimgOcTLZyYoCYGcVyp11R076DCcYXFKFoTJGIKONwfEdpFe4s2YyNWZSqFs
         RNu/qlz2E6glrevWZhIPioEca5HOdYb4xtnqsnXL0B1jURFB0N7N4aW1kdj5vRXiuxg5
         6em37jxNl4ZpqF8hJX5i/M6s2jDeliKUK1kr51fWQCzVPVd/M8R4WHSdTH07dcMproUa
         lgUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744818992; x=1745423792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/9YkWFmLJl20Npik27xkHa0wtGlZoa7Us/OtigKWito=;
        b=N13xMLuMRJex+r+e11+tfiVKQDQSN0JT3zMnTOx6GUAwkNTqKOs2VOfbmmITyrS1Ak
         gnrlN/QoPlrjWswiHpIzu8Bo6FAcChBBDdnCOIIgrc294axyPXSURaWYBFNLPVB+P2pO
         3zU6IChf0zs2L278WjILKLNBRosuH2iFSPAvECkqZ1H7M7Ec0f9ZT1cvrWLf4SeDwLNZ
         PWF5gVYw7FZ0051wWukfe+Neqs6JgdrSubcP6yOPKnVMcUA3suWojhoMlXp2wPXhy733
         /4MrBQY5cPpjwjWdsZ5z5Rcdpo/fIdauguIA45+ewrhbtXdg7553GqcPh9t1EDtgrtiu
         mGdw==
X-Forwarded-Encrypted: i=1; AJvYcCXD83NzSbzqVI5VraMTeWXUcgkKYxBuGtqZexpi+027Bscrs7wDabsu3Szwwkf/jNqKgPZVvDsf7D7Zxr8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyI4k//Yto9rKfu1yBlNScETKIUHPJzOeByhjDrROAb1L7mfOpq
	w1yp2FnygxMmvW+TaBW4aAiUU5odCu0vJsaQLzDrTO4gHOsQzqIrLsTnsu6iw8o=
X-Gm-Gg: ASbGnctXjkG9BKzrBtyDZBETLSbo/ie8iTjvyPcVgjH6qH3OJhX16ZzgMXoysQHZgUV
	wit5ePn4f1XNnsRL1Ix42s6HrU808jkdBC3ZHut29uNWLzOYegXwoaNkDs0owkH5ehcEZa3nFvQ
	4FZzMUveAUg8OSmh+8WnRyG07N6YTVIQsU9SscceSTsXOyoVzkIr8zTRIJ1/x68DkkOSNq0vy+U
	2zB2mZDIM42J8S8/suZAECCZfnSlB2s9i30fzDRWyHMQNqi6tCFsJT8NkqCpRIWsTL8THUrJ8Hx
	wkhUB68VcLcKiTe2mhBDt+93mOczYwRk90gkti1c
X-Google-Smtp-Source: AGHT+IEY5yoj/LzpPEAeUque3+hwbzLjQTdj57zJGOPor/+PkJpSD5MS6ys8unkVVRQeIz6asUlZAw==
X-Received: by 2002:a05:6000:2484:b0:391:4189:d28d with SMTP id ffacd0b85a97d-39ee5b35c8dmr2343871f8f.34.1744818991880;
        Wed, 16 Apr 2025 08:56:31 -0700 (PDT)
Received: from brgl-pocket.lan ([2001:861:4445:5860:9621:2787:c462:7dd5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4404352a5f0sm37224015e9.1.2025.04.16.08.56.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 08:56:31 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 0/6] gpio: extend build coverage with COMPILE_TEST=y
Date: Wed, 16 Apr 2025 17:56:25 +0200
Message-ID: <174481898217.8191.5994115925573733265.b4-ty@bgdev.pl>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250408-gpio-compile-test-v1-0-140e108e9392@linaro.org>
References: <20250408-gpio-compile-test-v1-0-140e108e9392@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 08 Apr 2025 14:59:00 +0200, Bartosz Golaszewski wrote:
> There are some drivers that aren't build with allmodconfig that don't
> have any requirements on arch/ headers so make them depend on
> COMPILE_TEST and extend the build coverage.
> 
> 

Applied, thanks!

[1/6] gpio: zynq: enable building the modules with COMPILE_TEST=y
      https://git.kernel.org/brgl/linux/c/27cdde96fd1eb38cd0675c6ad4be769f852b3528
[2/6] gpio: msc313: enable building the module with COMPILE_TEST=y
      https://git.kernel.org/brgl/linux/c/ce4f4ce18e162c15d7288e78383e9a5000cd0b61
[3/6] gpio: pl061: enable building the module with COMPILE_TEST=y
      https://git.kernel.org/brgl/linux/c/e40952bb8c6c54efbb1ae1dc8dc8ab71e17587ca
[4/6] gpio: rtd: enable building the module with COMPILE_TEST=y
      https://git.kernel.org/brgl/linux/c/27747874cd90a5b61fd50f1df7f7af017b42f479
[5/6] gpio: tb10x: enable building the module with COMPILE_TEST=y
      https://git.kernel.org/brgl/linux/c/90d80a3dc4fb24446d9d423c1c8967a63f136b0b
[6/6] gpio: tn48m: enable building the module with COMPILE_TEST=y
      https://git.kernel.org/brgl/linux/c/a5d8e0cc96eed600a347bbdcd125a9274a92e187

Best regards,
-- 
Bartosz Golaszewski <brgl@bgdev.pl>
