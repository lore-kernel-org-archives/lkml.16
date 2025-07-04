Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1CE128C01C
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 09:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751620114; cv=none; b=cgWeMk1aaVvE1UazjWLT4RVj7XCUz9vshbEV2Xgroxi6u1/8yQ4lujOZAa5aKM/8wYgnZ8riSyJ/zWG02/KQl9SN5GXptBLrgEqdicOLIAJmH8UCX0HL8A8ewRf7h2+MG2qcfUtmzOVgb4vy7WuFxOU55PdF3zxjd7i5Tfzy5Fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751620114; c=relaxed/simple;
	bh=nD+4P1Bz3uz3iVUljIyC5j66TnIismntlTPPL4CrSxc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=N+AIRXwhe7GAJFvAY3DDXWsstONhy8d5UzXQUFWCuYYPkrW2oLki8K/koB5wzVgRkKgnmolR7OTiDankPCTcVWMExqyRDvRzQD12gwFGLiVVUy6QV8Ac79NJtR6Yxabk2jCfKg04p3IkXDTxpj7hqWq9YGFJDbNSVktqeOnW6OE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=iTDSd4iP; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="iTDSd4iP"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a4e742dc97so1192904f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 02:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751620109; x=1752224909; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/jrF37oGgCnykTmpySTEV/xGCAvsTJIol9lj96a0tbc=;
        b=iTDSd4iP0ecTUrFwMzso37nd6pUJ7mX0OpEmbqEQIyP23xqX+nI898IjXtFnTpel8n
         5i8G/4KC8WbH5+L8FjiNwq3rthnkdumD7oTv25zU/p9rSahtDFYWSpsgy7Zhe64WhLnf
         /c1DPdsrFO9FGTyv25KvjRvDHl6XHEkiSd3wy7foajsJw1xY54RytgPE+EW4rBTyKFwY
         Oj985pTRpyUAN4FlbmvzT7ttkNKE1PBy6OoL0RGvrLKBT9bjUimK60ZdhlkMc8xx4YXs
         tLLyTLNOnYDUozMjrUkuNMIYQ41ZNxIBLkD2iWr3u/kd5axOWDJrdofPEaNSUECu5pRr
         Y+Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751620109; x=1752224909;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/jrF37oGgCnykTmpySTEV/xGCAvsTJIol9lj96a0tbc=;
        b=lqhaN1JjzDEFR/fZ4M/ZeacXUX0G8vSjDFiAVZ0+YcYPfd2IIjjwW44RsxiGWxJHbG
         JooCh/xOMmCg9qQHw6Z77V7otgblupzWcrLuDrHaK0Emw+WR858R6faIIUoCd2MbLG9b
         KJ875AGTuZZ5sFdydFwNAVoLHxn1uyx3FgNxoEoJfvgWhENYPMDZM+qQ531jI8sr3f4i
         S+szMMiYILepXQJbZHfZaKoyiQMxv9WY75o/daCsewOnVA3NymJnUoDArwR+BZGJVQVQ
         kybvbp+J7/We7G6EpOxfbiNhPtib0mBm1ZfxYc4L7UUF9G8tMF1Y/1OKfRQI+10AiTig
         gqQw==
X-Forwarded-Encrypted: i=1; AJvYcCVrJPzTp536wYLQgof4VHCkKdAlP3OC5catk6+1YRyUhT2m35NKAuFSMg+ihNQTn7LYv9dt4DQ7uRA3VkM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0/EboQ10b/QQaEDiroOlCov5lgR0C2y9d7JJwgTp0HxWxluTi
	G5fgtWrBI48mNwI/4V33ThF2vPrIjcAc55U6RPQH6x0zvuOhOTM5De6Egh/SR9Tc1k0=
X-Gm-Gg: ASbGnctFTW4jeMVrduv+83hFxYgoxRbNYAp0Lz+VZHxRkEuNy7MeoEHTt+jXD8ABLaQ
	qJ3oOaUd14GySmwpqMWeBOaXRri+twdiPwhM2H6MEb9Yc/+u/NjX98Bb+aSD/8SamE2we3AIqfn
	5aax1KALvH0DJ2O52Un+VL6SRwZg+I2Z3SpzfB6p4aXPrM2RBwO3pfAQNlGU4QSe6JFVlwBpxf8
	4FuAYOINeyzssPdvtulCVI3htY0SdA+7s2xJv2ZeU/rc/mP4NIFRhu/mzwe8HmR9FQymjE7zMaG
	5CDa4YCdH7zJW1Lippyg/zru2KYrlRsEP+68VcaE8pIeVz9jEsiKm8+EXYA0jJUCSw==
X-Google-Smtp-Source: AGHT+IESyVVs6vjvZzD+5wM7FVIZkOxve3ELsSsRYqjQF8xqgzIy5laJwxD6Fmxp6vokEcj1TurgrQ==
X-Received: by 2002:a5d:5846:0:b0:3a4:e231:8632 with SMTP id ffacd0b85a97d-3b495b94922mr1942693f8f.12.1751620108789;
        Fri, 04 Jul 2025 02:08:28 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:e0a:e50:3860:51a7:9db7:1d49:a8ae])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b47285c919sm1957296f8f.92.2025.07.04.02.08.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 02:08:28 -0700 (PDT)
From: Guillaume La Roque <glaroque@baylibre.com>
Date: Fri, 04 Jul 2025 11:08:24 +0200
Subject: [PATCH] pmdomain: ti: Select PM_GENERIC_DOMAINS
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-depspmdomain-v1-1-ef2710556e62@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAAeaZ2gC/x3MTQqAIBBA4avIrBNMFKWrRAvRqWbhDwoRiHdPW
 n6L9zo0rIQNNtah4kONcppYFwb+dulCTmEapJBaGKF4wNJKDDk6Slx6bZVROnhnYSal4knvv9u
 PMT5GgIe7XgAAAA==
To: vigneshr@ti.com, nm@ti.com, Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, vishalm@ti.com, 
 Guillaume La Roque <glaroque@baylibre.com>
X-Mailer: b4 0.14.1

Select PM_GENERIC_DOMAINS instead of depending on it to ensure
it is always enabled when TI_SCI_PM_DOMAINS is selected. This
simplifies the configuration process and prevents build errors
if PM_GENERIC_DOMAINS is not explicitly enabled.

Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
---
 drivers/pmdomain/ti/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pmdomain/ti/Kconfig b/drivers/pmdomain/ti/Kconfig
index 67c608bf7ed0..35a4c73da17a 100644
--- a/drivers/pmdomain/ti/Kconfig
+++ b/drivers/pmdomain/ti/Kconfig
@@ -10,7 +10,7 @@ if SOC_TI
 config TI_SCI_PM_DOMAINS
 	tristate "TI SCI PM Domains Driver"
 	depends on TI_SCI_PROTOCOL
-	depends on PM_GENERIC_DOMAINS
+	select PM_GENERIC_DOMAINS
 	help
 	  Generic power domain implementation for TI device implementing
 	  the TI SCI protocol.

---
base-commit: 8d6c58332c7a8ba025fcfa76888b6c37dbce9633
change-id: 20250704-depspmdomain-2c584745dca8

Best regards,
-- 
Guillaume La Roque <glaroque@baylibre.com>

