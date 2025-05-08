Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD542153DA;
	Thu,  8 May 2025 08:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746693942; cv=none; b=UWNqQx3yf5hQKxVDTWmRpQtpx5ISAgFuG6ZnBlBzz+t+xKRdD8X6QcMxwmxlIwr6Kf/Xba1BSOKmUUdPINUAI7ZwCzhGt/LbML1aOO+L+lu+ecQ6ukMUyffGOyTCJo3+mc9/lgUF9jBkQ/JRB4+2wZRwt/ZG32O1SIqAHF/Xd8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746693942; c=relaxed/simple;
	bh=1bNWQpvAZw2h4146M/a5cSVgUYygfrJDdqUT3sy4QxQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=RcfAuCzRbyMpx3em6RskYZw2GAht9Gz5chVia3N9lMZRdaC4VHyr17LBLrDKgGhrUZ4BX7IFooYIlMxDTqU0rHZhKwlST6AWVCgGQdDYUrfaTbgJTQWDcI4HSxgWZr2iwDkcxGOEIXiqqYy40bQlsCoZjMJBS5VnzHcSBg7M2Xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B/wKW6Si; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B/wKW6Si"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5e5e8274a74so1063397a12.1;
        Thu, 08 May 2025 01:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746693939; x=1747298739; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WQbbYwiKIeSwnEfdIBvlGucq6uB6GiW1ELyN7NX3z8w=;
        b=B/wKW6SifoTI4fLZd77qD5UDzHMdJB0BhBOMILCC+Ztx+JfIjz8udWyBUJE8sYkxoF
         kvEsFePHUafOtVL+Y98DPo2J40+atkvdPhDTLoYilKHrKcG9xtpkZz5GQGmhrvQnZ8Ei
         AWHGvXqNFmtEJ4yesPuAVDjie08Z04WbcnVOfBXttNyD11nm+A1zxgXBn3LlD3Ko9mZj
         UETSfFpdMDJBmKk1UE+bGf07ugtR/WCejKk++9ooHj3sbsCfqlBfRawYYf1IXWiPEIfs
         a1iGr9xhwiqqso1d8dFtxYrFZj+Uq6rnjqrjoASCsYCD8RAJ3d687TNvNQTyr6WNpdno
         PKhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746693939; x=1747298739;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WQbbYwiKIeSwnEfdIBvlGucq6uB6GiW1ELyN7NX3z8w=;
        b=bJM4WN4li/Az3IGW0uXfQ3rdIBFguEYvldR315JYwnos2ps9vZbYUgIPHxNApkqKV9
         gm16f0Go7vHBvO3tNReAKCbTP7Jld71PL9KuHgUicVKgDn0ost+C9UT7lgEK1THt/OJ/
         JTSuSVUAWFaVZpBNHA4J2cB00/3dfrY11N2xuM9lLVz0ytmmbtPff8bnQAHZs2VXG+WH
         3UQplTvatWXoxQJPpNOKFOTfAoXrlmJ/tTynwrIrEhiEbqeaA/w3LicBS4P00Gmg2cDD
         qUeslKi3T2rP1Rp8sfSG7uZjC1Lc+pRKqECMIFrRM0XZ9xY9DmSK50xsxYUmEZZwon43
         4NQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdmQE39DxeOlp2eJC9qOgp7XJw3ca6ely5uF7HVAdoxp+pTrix5dPjalKvMap7MC5HpTH3lLsAsBf7ndc=@vger.kernel.org, AJvYcCWGIjsqJHrvTv8cnVgWf3RP0LrcHp14YcPLabLH5FagMytVaoznGfVwYVpfr6MENf23ap5dXoBbWDTfa3M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyz17f9YlqKO5wUlOtCl9QaTyZZ2iiiSIzxHd0I0jkL2MWL/MiI
	Odu4nXpEWi9JrYNqh7g4vbBe5rIHyO3vOz+STCtJgb1nZxgcfzC0
X-Gm-Gg: ASbGncvj+MVAeSiDrYmkLJ45gEpaNzxPtni5o4PMH+zk7XkVX65E/bie5NwEW5aX16K
	s6g4LAC9OxCrOi8T/eo9DIqkQBNooNJpZG43D/nyAFFtefu1LC/tV/FJsiDbK9MCEdghx8Ke2Sd
	keyaFV+qoI9i8FGANDyMsHFwvKUbFykLRTYpEwoGapJQYOF2oEYKG8Ahf/UwJvZCunHqx7FePth
	CCmPSXsVcVJ57hrz4ag7qzsexkhDqVuerK3WEyedG3sSIYmMXArrOzV+qoJ2i1N4TlucXqkuNTA
	Qh5nX/WA0/WkeY8PA/NlYbfVTj9bELwNizsd0Tm0cZlu6T6ZDA==
X-Google-Smtp-Source: AGHT+IH24p67igfdoula/1tlisDjnAjfpuyudgDk/8KRPxpYnmMhfgAbgVxwh+zLalj7Cvnpz0xCWQ==
X-Received: by 2002:a17:906:fe02:b0:aca:d5a1:c324 with SMTP id a640c23a62f3a-ad1e89ff513mr696332766b.0.1746693938830;
        Thu, 08 May 2025 01:45:38 -0700 (PDT)
Received: from localhost ([87.254.1.131])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ad1eba4af90sm297000766b.112.2025.05.08.01.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 01:45:38 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Oder Chiou <oder_chiou@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	christophe.jaillet@wanadoo.fr
Subject: [PATCH][V2][next] ASoC: rt712-sdca: remove redundant else path of if statement
Date: Thu,  8 May 2025 09:45:27 +0100
Message-ID: <20250508084527.316380-1-colin.i.king@gmail.com>
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

V1: Fix just for rt712-sdca.c
V2: Fix for both rt712-sdca.c and rt712-sdca-dmic.c

---
 sound/soc/codecs/rt712-sdca-dmic.c | 8 ++------
 sound/soc/codecs/rt712-sdca.c      | 8 ++------
 2 files changed, 4 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/rt712-sdca-dmic.c b/sound/soc/codecs/rt712-sdca-dmic.c
index db011da63bd9..4d044dfa3136 100644
--- a/sound/soc/codecs/rt712-sdca-dmic.c
+++ b/sound/soc/codecs/rt712-sdca-dmic.c
@@ -263,12 +263,8 @@ static int rt712_sdca_dmic_set_gain_get(struct snd_kcontrol *kcontrol,
 
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

