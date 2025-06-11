Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 646AA23E336
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 21:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749677628; cv=none; b=M3O6tgjyb2RTkG0RpEpmjAie8ZnJG1S6kLtm738/RjFtQHYjPdQB0EJIDKnqn4v+hj71wKYvzfR99CWS+gOaVXbedyl8MgBQdM2r7iGN/ZKhu4YhdCk1Qpwml0FTr07N1+vFkeQ92jCihJK7p+klPFNPcWl29IPbbDVfPlnmea4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749677628; c=relaxed/simple;
	bh=3xGbjEvhtWNk9UZDW4oDQlZf3t0OoAAqRkGj1GJGXjE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=tan4RoYS978nY4cqxn3ReJT3wwnT1CVy6Lo9sDyqV0RPGOI06muQ9tx5q+fUCfevBqjysP6ugmn//9EwYWDyP5EUXfNuayby5p0XlbbH7qzCVEZQyLgzIJgqtGV/i5Lzc+GuNKmhp1m8YWasMkhj/nl8SF9GK5w/k2swPKflwk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=x/d154/y; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="x/d154/y"
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-407a3c0654aso157860b6e.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 14:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749677624; x=1750282424; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Zy6UWwrY4Tniy+czQvdxOfPUTPr6mmKu08OTScCjXL4=;
        b=x/d154/ynLwxgipqS6zH+Jp0vkDJV/uijutulFwNZHN2Me8yAZ18COkZhNUIoPY3+i
         M/Mce1SMSH0nMPw+sx3hZyhRrOK6Yy4F/9RJEvgZywYyqkOoptvpERTm83SNYjog9QEQ
         FJ8ztk8N4IAKrHrTEzxcWP11fnmFa3/SnwUi8bflZFLwvSdMWsz3EfO5Fg7K/e50Z8Eb
         J/vE0YiDiLI8ea8TjMhdGYe1K4nMYntgfq7wem7+AD3I9tLrEzXcaSMf3EqIY8DLr4sg
         W2z/2ms8MPyzMUmAbyJRC/H7N1+Ij+cZs57OYuAxSvqR/nj0nqRqR2ZMPy3HfwaLjOyN
         YSiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749677624; x=1750282424;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zy6UWwrY4Tniy+czQvdxOfPUTPr6mmKu08OTScCjXL4=;
        b=Ph4jqPJrllIj3kkgt8xrRlmp9Oz9NI8YavmB1HEFpoV9QP6/Ny9eF7eMJccXjpT7jy
         S8Q5kkvA1EqpSRfMaUy2azXe+fp4sMIUYGRC7ih6Jfhcfqxsze224mQaV31tVmBJUsWS
         Q8+TouXPeGyXT+x3pj+FMnnWXQnymzilOcN0iAufSXwd8gvO3zvjgQQil6ZpOoNxaCYe
         EXaBbPdWm7zKkm3pZnhSd1cuwCjiyKJXiMUC/ovcoXrwKgJZrchewILnfwxFWRhTgJws
         d0fsuancJgcMrEvOOIKtSrvFddFYYudrWzd5VW/+nC5hQv+Xobs4Pg4TsPYH8bngQlRs
         MtvA==
X-Forwarded-Encrypted: i=1; AJvYcCU1pCk5wE6P63H3jGnmADhuvUGumOtPHW3Zmy9FhWXiFx9XvDl9mfoFkHvAaTXLByC02y/4ev9CGErtV7s=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHaIh8sRdRRp39pjDi04MPyf/Dc0yzwatTyCUrI0ssPk1e8pAl
	6hktTwv7AzgaK3CUEINWeUG30Dcd0vTh+EQKAfpYaIkDd1DjljSPascx+YcR71aGOMPuJCwAQYM
	8gTRj
X-Gm-Gg: ASbGncsNAGSDJYiPddLVT94QecjHNyK3t/jmB30SgYLqorWHt0gtfN6FuLlyiU4h/qF
	+d6MInPSAUj8Hkf1BhIb45IJXWwnyANBVp7cvtkXlE2kXIQpH+xvh+r6Hreq1xaFXIszKD93jWc
	ifd7IVKROkCGJgA/wj9oFk+FU6trnm5qQiD1a3vcMFNC7PnfFofkdR14SrKygTxhdiBN9opISwi
	wFylsikHCY/TDpkhd57nK1OTiNPHwJENbcpVgf40LOXWQOAhqaz5IHLorjI778WlEMVqTGaBUNu
	84jNbe7x2I2KM3ePkE1gOFmr1N9TsGG8wqNTNlsyW+dVnhTVcrMr+stzRpvcDnzo9NZdbT4hOP6
	4Ymw=
X-Google-Smtp-Source: AGHT+IGSrMqexpW6ugcP80DLENJRmDJg90YGu+YfvZUzRlil4e88131PLFwRMPRkaCzUBoSu4y7+9w==
X-Received: by 2002:a05:6808:7005:b0:403:3673:65f0 with SMTP id 5614622812f47-40a5d16118cmr3627488b6e.31.1749677624463;
        Wed, 11 Jun 2025 14:33:44 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:4753:719f:673f:547c])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40a682fb0bdsm2262b6e.23.2025.06.11.14.33.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 14:33:44 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Subject: [PATCH v3 0/5] iio: amplifiers: ada4250: various cleanups
Date: Wed, 11 Jun 2025 16:33:00 -0500
Message-Id: <20250611-iio-amplifiers-ada4250-simplify-data-buffer-in-init-v3-0-bf85ddea79f2@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAz2SWgC/63Ouw7CMAwF0F9BmTFqHqWUif9ADE7jUEt9KSkVV
 dV/J+3ICpKXey35eBGRAlMU18MiAk0cue9S0MeDqGrsngTsUhYqU3lm5AWYe8B2aNgzhQjo0KQ
 NRN67GRyOCPblPQXgLg2PUGqyVmpjVJmLdHkI5Pm9q/dHyjXHsQ/z/sQkt/Y3b5IgoaDCurNDZ
 5S+WZwbtoFOVd+KjZzUHxiVGGl9aTOtEX3+xazr+gFAV9a6YAEAAA==
X-Change-ID: 20250418-iio-amplifiers-ada4250-simplify-data-buffer-in-init-93ebb1344295
To: Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Antoniu Miclaus <antoniu.miclaus@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1190; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=3xGbjEvhtWNk9UZDW4oDQlZf3t0OoAAqRkGj1GJGXjE=;
 b=kA0DAAoBwswgAf8Bj8AByyZiAGhJ9hCiXPBgFvY9Ne8YAtoEsFFlNoNxKf6+93hubX6RyKnwD
 4kBMwQAAQoAHRYhBOwY2Z5iDoPWnNhomMLMIAH/AY/ABQJoSfYQAAoJEMLMIAH/AY/AyggH/0B2
 MKafUNkwRK8U0wJm/ZABhuZBykM3VFl6kaSOvdbVGTgtcmBryRKkc7yZGhwtkXXld07hfFjZM6F
 uYs4z2zNLh/3U9r9fxN8iFwq0yQqAp5xAtOxW81xGJH/yFnI2tDM+2yY4wc4hnh0W/0CCGlNmlz
 ELSrJt7j7jDTEOtRtoplFB+aBw9BsEL+lNT9DCokOzGDs2ZyNpxPdD1e3lcw80tOJq35towUe1j
 0LxMWpv6g3jBMd+3SVMlnKRFc18liG+9IKsM5iSARCmqahGOmTlh1W7JSxYA5h0Sgzw9VPSEX6x
 +zfv8rxRLMmZVbqtIKlSsnxrDe/pipsKE1FHRP8=
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

While investigating some potential bugs, we noticed quite a few
opportunities for small improvements in the ada4250 driver.

---
Changes in v3:
- Split into multiple patches.
- Added even more cleanups.
- Link to v2: https://lore.kernel.org/r/20250418-iio-amplifiers-ada4250-simplify-data-buffer-in-init-v2-1-1bf9b033aaf5@baylibre.com

Changes in v2:
- Totally new patch.
- Link to v1: https://lore.kernel.org/r/20250418-iio-amplifiers-ada4250-simplify-data-buffer-in-init-v1-1-7e7bd6dad423@baylibre.com

---
David Lechner (5):
      iio: amplifiers: ada4250: used dev local variable
      iio: amplifiers: ada4250: don't fail on bad chip ID
      iio: amplifiers: ada4250: use devm_regulator_get_enable_read_voltage()
      iio: amplifiers: ada4250: move offset_uv in struct
      iio: amplifiers: ada4250: use dev_err_probe()

 drivers/iio/amplifiers/ada4250.c | 45 ++++++++++++----------------------------
 1 file changed, 13 insertions(+), 32 deletions(-)
---
base-commit: 4c6073fec2fee4827fa0dd8a4ab4e6f7bbc05ee6
change-id: 20250418-iio-amplifiers-ada4250-simplify-data-buffer-in-init-93ebb1344295

Best regards,
-- 
David Lechner <dlechner@baylibre.com>

