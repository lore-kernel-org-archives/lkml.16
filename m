Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11FDC347B4;
	Wed, 16 Apr 2025 08:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744791133; cv=none; b=gNxdaVoCaRq2dB3HZwW/P7OdKUhEl/Q7xL9W6PrbxNnh4MZkaA9o/+No/k9l1EMQa8zdGKhWqmjl6fVCB9J9dmwaQ/7jyxYttmT8ybqgcsZaF1oYVNM2o8G6dw9WOuI1bIsEpFpHEzfgYguAdXyQEQUozyhM67A2PTaF6pz/dps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744791133; c=relaxed/simple;
	bh=Jc22Eo0VO10sOvqqMAho7ArsbLj2o1xB+/q3mFoXE5I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=RE/umGDhuH+Zo2O58fM7drpGN02Wa6IjNzP/UsHPslZMlmOn+owKf5I/HBaL7XL/C4AVHhO6Ikg6VeBzoHKkcqmf2Oon9CGlOeItNF6wZoB5k9b/gxIv1jTD7lYja6kC2as3BDt3UFh9pDAlrwvlJTRqcIxBoRnoIuxwXGUfeCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wlg43VpF; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wlg43VpF"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-391342fc0b5so4823426f8f.3;
        Wed, 16 Apr 2025 01:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744791130; x=1745395930; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7xbSwOnHJcl5ihilpvmWsdE0abLroLqOUSXNDhR1Fz0=;
        b=Wlg43VpFcWtKxVjoww5c9JPAhYyrCNo13TO2iXQ5jznCXz7W/gJ59fIfM1kzCb8sgs
         SpE4pm/rwaLlj89/BRWVRW5RAOv3cwQYdGp7p8IgWj4qSjtObwq4XlAxkOGpy6dHbbq+
         zGb+Sufd9JNOzrEwJu1+u68CNQHQmRvJf7Okt2fuP9AtRlQUNOAhaj7XFudil52D+PZC
         O6Nf7OOX0PsZt5mJX/EmjV6IYS4lHrp5kp2hyBArJ8Wittl36kP8C7Qiwg6Py/huj3ZT
         +cc+oqLGqFZhLWZPz7OOIPAwx9pKIzVnYMHP/TPRd4wbCXBpiCwrEF8+w2DpKmABG/ii
         8UOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744791130; x=1745395930;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7xbSwOnHJcl5ihilpvmWsdE0abLroLqOUSXNDhR1Fz0=;
        b=Q78+Ccjj4MempSxk/KZMbKbhjmqB9r0jsDTr9Gmsdky0POnEKTnOp2hpgO7HrPQr7J
         Vvym/GeZeT3SBAKHQIwUgP+caIH82XYR8/LxmNCehyPame9CGz3qvwXDChkyC/m8ktkv
         EN5NR6iR4TbPoq3S7OepWe+cg66kk2bMsgliDUn0t9QfGXOhJbwLikQqgN2axs1dP2V9
         jCONgRGy5VRRuzUBfmSfxqILJAIVLaOkny97Yfsk4EX08V8g9O/RPYJ0gLtRMO2kdgyc
         kGBwA+PqW+fiUvreD+4IPe+b3xUCOwe9SxHLKz3EBov02CUFL8o4xc47gJblW5BZiOeT
         WhVA==
X-Forwarded-Encrypted: i=1; AJvYcCUDlNBTI0hgjTgBVOYpzMBZ8L7nlHMB6rsXyJHGVpq2w5untT6NZt4depe4ER5ZyRlIXh2hsdO/jtXUTCc=@vger.kernel.org, AJvYcCUVfiNZWmlt/w2Jfn156INONIB9wx+2surWlLD2jUlew3io+UIxeh/1E0YhnLAqXMjS5cPdRWC0zpSAciE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzyu2lQLtFnxKp+n+O4y547PRHRAvI77yZBsEn+U6AqYOGOTHl4
	HFJfs+7Mh6jRL8aH+H1NcDIPi8WT5BCWr1eHhjgMfDcuOvBXY1K8
X-Gm-Gg: ASbGncuHVf92QT4+8uk0lzxObuqyLCFBLqmrNLqfM3OPg8olrVmUq3M7RXw1c+lJ0Da
	4JpN63IDbA71ardQq3MNMj1E4XHOnYrvxvvxd3DvGXD0zYVVjRY0LiCNQEUS+dpy0bKX0oYUzKn
	qZ6RLYoOpK+WrquavcpyDgJbTbt8dgbb1/naF0PH2wI63KipwhQD7aB81zJtSouYC7cvmXSftIe
	nSnyO18KKVMIMdeVqe7MPZkp7kM4RNjr0eDyLw9XLDMLXYutNLg1pNKnp6N98Z6uEIDDDQJUs6g
	1dbqyzAUE7vcHZ1JbrebjbAo8brIp4xZXRUNHbx6+YdaDueCfWCP
X-Google-Smtp-Source: AGHT+IEDl5aW4j2p/KlZbpeZlOW6+VxaFPlwv9s2ZrvxmOyoPDUS0nugUIKBDD6JvePtOuISefvMqg==
X-Received: by 2002:a05:6000:2911:b0:399:6dc0:f134 with SMTP id ffacd0b85a97d-39ee5bad76emr774209f8f.51.1744791130000;
        Wed, 16 Apr 2025 01:12:10 -0700 (PDT)
Received: from localhost ([194.120.133.58])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39eae9640a9sm16555399f8f.10.2025.04.16.01.12.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 01:12:09 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] ASoC: cs48l32: Fix spelling mistake "exceeeds" -> "exceeds"
Date: Wed, 16 Apr 2025 09:12:04 +0100
Message-ID: <20250416081204.36851-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There is a spelling mistake in a cs48l32_fll_err message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 sound/soc/codecs/cs48l32.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs48l32.c b/sound/soc/codecs/cs48l32.c
index 4e2bc09773cb..8fd0df671730 100644
--- a/sound/soc/codecs/cs48l32.c
+++ b/sound/soc/codecs/cs48l32.c
@@ -1802,7 +1802,7 @@ static int cs48l32_fllhj_validate(struct cs48l32_fll *fll,
 	}
 
 	if (fout > CS48L32_FLL_MAX_FOUT) {
-		cs48l32_fll_err(fll, "Fout=%dMHz exceeeds maximum %dMHz\n",
+		cs48l32_fll_err(fll, "Fout=%dMHz exceeds maximum %dMHz\n",
 				fout, CS48L32_FLL_MAX_FOUT);
 		return -EINVAL;
 	}
-- 
2.49.0

