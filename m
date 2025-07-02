Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1924286D4C
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 13:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751462593; cv=none; b=DiGoTxrdeqozTKNmBtj8l9I+MxCEfEY6tXojr6oceXekfORBOFKRh/t6GVQka2pSPxq/+eolF9CoDf/zE3cy1poWxw/qHUvmwAIV+HkZTiT9kIz4ZI5vVi2YuTRqx1l3KFnQrYsBfC6u+ON142HQq5WEFyBUOXWSUD1PZTdpUVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751462593; c=relaxed/simple;
	bh=uguVMOs498CfTrH9plrVHdny1EJQ4gyCxJEXAN6fCIo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=PfH9bYDnjjv6yapzDeawsIWtUGFCxMv+eyBQ4NGpSkoO6DtHjkInuuE32vfZrPohOjJWTBLc7loTCdm0HDgbsUq59Rzlp3Db5lRoFbRKjnqS2j9048C8AEC+Xngy9N5PY4dJY8y/FmbFAely0Wne4XhBOjU1jPflgt3IdaKhWaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=cMsg5OFk; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="cMsg5OFk"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-73afbe1497bso2460331a34.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 06:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751462590; x=1752067390; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gFYt4T4iLFFrKBdNoVxkXLX7CJ/267haK8Kjvmqh/Zs=;
        b=cMsg5OFkehjeWeyHp81+0gjXf1bv2s+PHAxJF188edLQkRuKce7icgaiC369lLitvl
         PYxao9E+uTg6bohRacKCQ4pCHAZacyK0qEQMCp1uj5cPclfmQ0ssq6pny4GuJ9cKMPr7
         jP2O65zo1p0tDBMM8Dj2AG270uzFfsiqWi00qTdKrKgD9F8ceDxS7Omm79TTh2pv8rgM
         Vlt01dLDW6NYd/1EqpXrKGROBDrHjtFFPlbZI1l3/9c3oB71/J/HiW0v+18XH/F9b25i
         auY2Qadx0tQy9YlHzabBGW8OFdry0/woc4WJQatOLGpOQFyAwsICnSEP+GPvkGoX877K
         WZTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751462590; x=1752067390;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gFYt4T4iLFFrKBdNoVxkXLX7CJ/267haK8Kjvmqh/Zs=;
        b=DXRSaLUOecEt54vAC8NlhsEsl4K8jTqY7Ss4KKrS8mtQmBUhzhSn6EvYFUYgyouiCG
         iDKpytx4uGEPHO2577d1H/o2XxehAVlGy+930oukTXq/fb9wgvkSMJh9NjOIaojdFzSU
         kaqznxfk4eKfFjk3mgUJqorrS3O6C6+rn24QT1obLyx1PvQfKuhXURU986O6swb/yy83
         k9HU1vK4GXCOA+zI4F4ZR1hc5P1UbzsHJzM1Qr7DP0uyhxmtLoO+xv9VUHhh+6P7HIoG
         PRx3eb8yQBd9o3GkCP5uX18VuPIzx6rXaa+f2cW9iFFZkrjBcXsx0td1ehTU6cyovNat
         t0Vw==
X-Forwarded-Encrypted: i=1; AJvYcCUruAhohwKop1qDQotlqWtj4Ic98vGQrk9iM+UD6zVlMuY0r6QhCj622/CRJHaq6oVA6uGfgmi0KvBzoU8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyyjg4HWPBR8Wn2IWPG8QfBbiuL3A6BFJ74V5qztHgfkSWMmgxk
	FkQ/qkbhKefH5r1hZjiVbssZUj7ScYLLeRbQ7jKhiExzwuhZwfpI4eHCT52pMHmMYSC79O/zLwM
	tUip2nCM=
X-Gm-Gg: ASbGncsRWXQTZS4f9K6KigeOTORulS1oblCyraHGM4XE+a2FvKtw27CLfqBllFodsfT
	XIWF3pgyY8Aa726OhbapIQiXSTf9wGJ/cgh7WAsvkNDSpkcEmUrJsGXocOuEnrhEKphYgw+K6Kd
	CxgfA01kVe7mvDhvwddArtrsUEPA6DXQBJEQ+BjolKYQ4svMRfb2MnnVhvg+kWi5c8Plv6vSJeF
	TL2DeuQ9Q3nx9lVuu1Qb7dXDH7Xn5QMMrRCEwDJDAJ6EpeLwuqm9Z0tN7wULIBEJxbG8v0gFMbE
	hoYaaLfHBWq0/7kcGNj/W4AuYsZN4hHUoE3eq+Ritm7GTX5lBYldc5s0kgCo/KvTvmaj
X-Google-Smtp-Source: AGHT+IHTP90D/tIbM0vI5viWghRKqSu7vf4yQyWV8XoRE6XmmGTkMX/3hx6lvhsRabQ3z3feWtHVkA==
X-Received: by 2002:a05:6830:9ca:b0:73b:2480:7eb9 with SMTP id 46e09a7af769-73b4d1ee887mr2015865a34.24.1751462589740;
        Wed, 02 Jul 2025 06:23:09 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:70a7:ca49:a250:f1d5])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73afb122a27sm2502107a34.62.2025.07.02.06.23.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 06:23:09 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Wed, 02 Jul 2025 08:23:00 -0500
Subject: [PATCH] iio: adc: ad4000: don't use shift_right()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-iio-adc-ad4000-don-t-use-shift_right-v1-1-041c2d6c3950@baylibre.com>
X-B4-Tracking: v=1; b=H4sIALMyZWgC/x2NwQrCMBAFf6Xs2YVNaCv4KyKSNtvmXRLJRhFK/
 93gYQ5zmTnItEKNbsNBVT8wlNzFXQZaU8i7MmJ38uInuYpnoHCIa2cUEY4lc+O3KVvC1p4Ve2q
 8xDDr6Nzkl5l66lV1w/e/uT/O8we+ax5tdgAAAA==
X-Change-ID: 20250702-iio-adc-ad4000-don-t-use-shift_right-bda6e41152b6
To: Marcelo Schmitt <marcelo.schmitt@analog.com>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1314; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=uguVMOs498CfTrH9plrVHdny1EJQ4gyCxJEXAN6fCIo=;
 b=owGbwMvMwMV46IwC43/G/gOMp9WSGDJSjbZNqWpsqz/PlWXa+Wfm8pg6+ZlrtmeX3L/y6en96
 /IpDpk+nYzGLAyMXAyyYoosbyRuzkvia74250bGDJhBrEwgUxi4OAVgIjwt7P+M+Hek/DUWV97d
 eSeHYdIndoEdB1943QuKWbYvxcBt1UTrFzu+NeSx9bHLyTMYnmrXNL23i72O5ZaP/bzLPoVC59r
 17Zvjw2+oPBaImvGvYOHz7Nl93kGyikUibCGeM+RL7ujwfFK5PlVgorF7rpvbYsfXatOffBHpNq
 hWnHzDhXvThdkLpDZdUT5euHKDR5ptm2n7/Ljga1XVP793B51lTuGI9uh7b/c0IOC9nGGT2wS3a
 P/Eo0oZv7Yp3v6/bXZL2SfZx/9iasqzj8Zuy+NYpqOu6xpY/m7Dx3uu1ccndMxbXaXOKr721W/V
 fkMPs3Z3eyffzTytOQp/lI9ELBLvyJ6h5u/Quyep9mkLAA==
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Drop use of shift_right() macro for unsigned value. The shift_right()
macro is intended for signed values and is not needed for unsigned
values.

This was found by a static analysis tool [1].

Link: https://github.com/analogdevicesinc/linux/pull/2831/files#diff-c14a34a6492576d22e7192cc0f61ad0083190aeb627191596fe12462f0c6f21aR557 [1]
Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/adc/ad4000.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/adc/ad4000.c b/drivers/iio/adc/ad4000.c
index 5609a7845b6f50b5818613170df6b234f8f0c496..fd3d79fca78581e51bb904d0bcfeda3d3663ea25 100644
--- a/drivers/iio/adc/ad4000.c
+++ b/drivers/iio/adc/ad4000.c
@@ -554,7 +554,7 @@ static void ad4000_fill_scale_tbl(struct ad4000_state *st,
 	val = mult_frac(st->vref_mv, MICRO, st->gain_milli);
 
 	/* Would multiply by NANO here but we multiplied by extra MILLI */
-	tmp2 = shift_right((u64)val * MICRO, scale_bits);
+	tmp2 = (u64)val * MICRO >> scale_bits;
 	tmp0 = div_s64_rem(tmp2, NANO, &tmp1);
 
 	/* Store scale for when span compression is disabled */

---
base-commit: 6742eff60460e77158d4f1b233f17e0345c9e66a
change-id: 20250702-iio-adc-ad4000-don-t-use-shift_right-bda6e41152b6

Best regards,
-- 
David Lechner <dlechner@baylibre.com>

