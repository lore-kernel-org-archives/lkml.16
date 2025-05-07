Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 675D578F4F;
	Wed,  7 May 2025 14:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746626973; cv=none; b=rQsUwga8hsVIYqZ/1eWC3v71TYjPVWUiUTwgwhqOMdUvYgCRX6cspUTcUaqvIwklgRWkb1AcIPLBrnFVcYnWWl/H39ru+YB0pW+PDN+7qmF3zVcIV0lMWjzFEucyGQJ+2BuDZA8pyASkpLb4T5kHe1qquZyxPpJOexU00DUs7F8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746626973; c=relaxed/simple;
	bh=jx7gKyB/SXu8sa38Np+SuFN6I6XvTrPTXeV2JLqyaDA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Pd9fKBu+3CjLHU3/pbViGkguQOHuxQoCsah4wwrrU5SqkTszU6OtIJJ+aup3MP9yhnDaIkK/9Irix/6CD1wNVvhNmHr4AAROAn8/ftY8xFXndc0hETVbb5iUeAo9+n86CDkeiriGvvZ4eFAHgG0QIvKovrqQ/ru+A4hVjXZBf+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UdJtOUx6; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UdJtOUx6"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5f861d16622so12089403a12.2;
        Wed, 07 May 2025 07:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746626969; x=1747231769; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QavwUUNdSFgBL4KunjxS4uaiYuTvRlvv4rRBg1YmWDU=;
        b=UdJtOUx6+BWLGFQH2xQ8eBgof0D1iW+dFIDVQFwTU2VwrxG0+poYk2u1a+E6o41hV9
         l0fjPCMKxy45TbPVWhqYt1Q4AeP8ol5qEt+1HV7hF2oDitHglvXPikzD44d0CXFpAgQm
         +OLYjkML7gYMQ3lMe2JpVtd0a17R38OvavAmZafI3f18ZrrQ+w/+jMb+AxAG2VrDXhUI
         N7kyCjJ0XUaaK5F7kIpBOTEtFFt0dEEPyKGUlcpCeEpReb2Qu2VehPK9wprCqS9pQrma
         IiftJGfFsi09XBgGRZA0SMJMMfQy+nspZfe/3dpS8JSJhF2HBdIOu9tWBE5z/B/TCBTF
         DzJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746626969; x=1747231769;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QavwUUNdSFgBL4KunjxS4uaiYuTvRlvv4rRBg1YmWDU=;
        b=dDaZAEuseHGg7t8faNQuhmrcKpvipfeHED1yeeaGuXZMbHO221ajKFqTaIDcQn/Nju
         7U5vKvfWVjyeoEr2EJ3e+wmTgePY0eenuYlSKwBdDc5reGMCIrl/LaEwatvrJuqjn+v7
         YVSziSyt20AGQcv0zqSIe285zihooDY3Ek9XI7PhFWHeDHDb2eWMM7r1zK6hPK/NtV3X
         W8FDSg8yteLEnI67ytQdwObfMz1byO8McQhdsewi7WKLK9py6XnyvtuJsbyLz37REqul
         eUB3G7QMivrBUrJ9na7hXztiWBLN6AmEVOTgnqFhXz5ba++GEbWSKOtFxe6nkKFI1Gy3
         cQrA==
X-Forwarded-Encrypted: i=1; AJvYcCWSwASP/niz4Cqkdi1ncLfGxOrxidg+rZ6/cgGYIxQQjT770OSPyMg8m8Iv7qJoxgILf7u0kPJHB2UChOs=@vger.kernel.org, AJvYcCXxue0x1vTJ+JhQ0JXEPjvVW2jNZkyqjMn6o8xCkZwY7XcgN5NiDLFPdYZwtxetreu/f/6+pwP8+Ks26fA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2oivEYsJetr4tIm4ew3LX1VfMCLXT02h4pIslDVMtbBeAJ/d+
	gxmsxKoyjIL4j/fNmxJ+Z078xJzmBppND5zCiMATFWa0SNc6+igT1k8BWDlRMOjNaQ==
X-Gm-Gg: ASbGncuSNMSu3uMCvtiNxg54hrIkmdKDZSX1HEckKflSuUbEoTK0KdrNinaNJVF1WD0
	+3q0EnpDqMZu+HdyPCsDqpxZy+BzteWwFl93Xr3BXa48YkYGdFI8tzi8VaTm6GV52e3Z6W56P5J
	cskqKi5zl2Mj9W7jSnTAt+chPebTbl346yBKGnp4+3k/GFi3cjj29TsTETlgLZLG7HYktpkQ3gM
	AIQR5O7c0Wxl9tAUZUyzeUxehI0XTdm4+1DnnchY5hYaC3mxPPViTKfSNNCBwZL4+i/qymZFt4V
	spysJSlijqCyKMRQrfIKZCe93e7aVycIDfgMTqXvr40bXkTmNw==
X-Google-Smtp-Source: AGHT+IHJvLSRoox5Yyc3NHHibPQ6XI94e/ErZwKeSjZ1RS+a144YIDhWskW1zAsJWUK9QJeo5myUlA==
X-Received: by 2002:a05:6402:35c4:b0:5f4:9017:c6a1 with SMTP id 4fb4d7f45d1cf-5fbe9f46c84mr3216995a12.25.1746626959231;
        Wed, 07 May 2025 07:09:19 -0700 (PDT)
Received: from localhost ([87.254.1.131])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-5fa777c8b70sm9887927a12.29.2025.05.07.07.09.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 07:09:18 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Oder Chiou <oder_chiou@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] ASoC: rt712-sdca: remove redundant else path of if statement
Date: Wed,  7 May 2025 15:09:07 +0100
Message-ID: <20250507140907.255562-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There is an if/else check where the else part is executed if
adc_vol_flag is true, this else path checks if adc_vol_flag
is true (which is a redundant second check) and the if path is
always taken. Remove the redundant check and remove the else
path since that can never occur.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 sound/soc/codecs/rt712-sdca.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/rt712-sdca.c b/sound/soc/codecs/rt712-sdca.c
index 19d99b9d4ab2..570c2af1245d 100644
--- a/sound/soc/codecs/rt712-sdca.c
+++ b/sound/soc/codecs/rt712-sdca.c
@@ -1065,12 +1065,8 @@ static int rt712_sdca_dmic_set_gain_get(struct snd_kcontrol *kcontrol,
 
 		if (!adc_vol_flag) /* boost gain */
 			ctl = regvalue / 0x0a00;
-		else { /* ADC gain */
-			if (adc_vol_flag)
-				ctl = p->max - (((0x1e00 - regvalue) & 0xffff) / interval_offset);
-			else
-				ctl = p->max - (((0 - regvalue) & 0xffff) / interval_offset);
-		}
+		else /* ADC gain */
+			ctl = p->max - (((0x1e00 - regvalue) & 0xffff) / interval_offset);
 
 		ucontrol->value.integer.value[i] = ctl;
 	}
-- 
2.49.0

