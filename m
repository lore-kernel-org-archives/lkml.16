Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB16124C083
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 09:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745745037; cv=none; b=n/xlZc7Vw9ZMJltp306U0Ti7PisfVoti3aRDos1xIULjEjC89Z7MkprXICHjIkHqqKsY0hIqzi7fndlk/NYGi9H+B+QI+SZWvbGzKTK8vBzgAsxgXmaR5mMaoSpVK771AwI4JgCRuB1/xMzt9AMPdPCNVTFDnj1xHhJDTSrHKzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745745037; c=relaxed/simple;
	bh=UA+cvZElZlyjZuyFX2EFMnvtlOX6L661FSlIyfzkuwc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g6ER4VFFddDAwWGJQZdYIRlFmnylGpBCxDRx14JIRPAszskvP+yTnAMJKDWlIxGfqBbTUVlsUh4ksNFs4xSuUSxLXhZNllPI3O5dzHdTO8SAkgb4TMtU8JgBIoco6A2gnmFG5UX/bGtqcxNfD7f33Oeju0EJazFaAFDP2slvfyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LNAhfZm6; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LNAhfZm6"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3995ff6b066so1864632f8f.3
        for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 02:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745745033; x=1746349833; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V99EMTWWXaGhjrbD4OzKCKARxP+WZmBldZfdsQ6WV0I=;
        b=LNAhfZm6iiA6hacEnD/s5vsnw04gH4BMbBq8w4hza4bVajLKJCv3FNAu45XE9C/egL
         6nCFfEkT+QmgHw2WMu2LO/l2RBGtgIvqwTw5nNyLkDfxzP4FBj9sQGuaxnXhVxLZx2pH
         LzhLTkpkF6udsUyVAi48vEEqhQQepznP33IWtNM1ilVfsoMPP6lpBjTSI6vlABdIMkfT
         Rp34CfNJBihoFzA+02ciSSFP9lxMzfxJZu04gZ43SiKCNbS+kZNrRn6N1sPQ9EsTPzFB
         qoE+1CMtHdUKranGp6648Rd8xok4KpToQv5Onu6IZUtFlTQtGfzO69lAdqI65DLB2aip
         s3+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745745033; x=1746349833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V99EMTWWXaGhjrbD4OzKCKARxP+WZmBldZfdsQ6WV0I=;
        b=e8GzXIk1rxxPg6mMRxcE5Sg/Ii7y/sJ5Qegb9zDx8FTKDI7kgGdK/yTawy4xCZM8rU
         jPAezi861WTW87cttyVCCcXP9hyz3oI8sem8jrtxMgmjNHCuMRq1tcAPrpP5W6QimOsH
         EGxDQ16HISaMR6yTwwpCtB85tTKqraqfsdlYV0Zkg0jIbIpsLN+Q3MH5wiNoKQovcVLs
         GILowq0OxX8XD1izs9LHYIhzByiwh/iOcv4rr6W5VIxebE0eWToVt/jHc1T/maJTEvi8
         aPPseONX3EuUW5x3BI73ebp1k6S5bPihqtw+jApJDPfXzlxaRrxVS0l8Tz9/voLs0ASn
         Tp3w==
X-Forwarded-Encrypted: i=1; AJvYcCUMfg8e6m2kb7yEGFUetMoCeNOcjAqDBRpqoCSpHJNkhh9vAoV0aw4Typf4ms5Ra/8vLzST7u5s+XAoHCk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmtHI7lw9PpMBvtsftbejAnRC23cXQDeN9U5ZI+tIuXdAHcjnL
	K7TVmW0KAAuP4pQNfB5E5zoUOCjYRoISRSeSJSDA4NanOm9nqxcT
X-Gm-Gg: ASbGncupQlC4FKOGM9pwBl1oObk6wq6XU7RKNtI6gpBX5fGBJQ7s54Y6vXJjzQGFsCo
	f75fR7yCTYOs4qipSf20qj7KJJcIvKuW86/xPvs7PR/ePVw+ttLvd1vCMAxKteCMfZXX7utpkNm
	EUCWvPl53Xbdz3INEQyBGAFaL8PZvziaMqEFV5M0dGri22ZYeFQyc+7CZdzhGpXOl2q9ofQW22m
	YSHeNqwkWI9XS7jYF82V/SeH3UOxhwoA18OzqHoT6gB3zYrqECXcuXbFh+8LymYHfvc+6ArxE2N
	TnGes/14YbfPn9ZmiKDniKYHUb6iIl3asIpSoR4Wew9e+gx4mT0VivymkspoaB8C3kEddJeTCDC
	c1K0hKBWotNI=
X-Google-Smtp-Source: AGHT+IGnbRIp4zIDH5q0X081pg4Kq7T7MoVVMLlgJURBzSJHHwVVHobY7sMzHUn9prbYxlGdYJHoWg==
X-Received: by 2002:a05:6000:4202:b0:3a0:833b:a1e2 with SMTP id ffacd0b85a97d-3a0833ba364mr570019f8f.46.1745745032832;
        Sun, 27 Apr 2025 02:10:32 -0700 (PDT)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073ca557bsm7925805f8f.35.2025.04.27.02.10.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 02:10:32 -0700 (PDT)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH 3/3] staging: gpib: Avoid unused variable warning
Date: Sun, 27 Apr 2025 11:10:18 +0200
Message-ID: <20250427091018.13705-4-dpenkler@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250427091018.13705-1-dpenkler@gmail.com>
References: <20250427091018.13705-1-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This addresses a warning produced by make W=1 with the configuration
parameter CONFIG_GPIB_PCMCIA=y

ines/ines_gpib.c:1115:28: warning: variable 'dev' set but not used [-Wunused-but-set-variable]

Remove the declaration of the unused variable.

Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 drivers/staging/gpib/ines/ines_gpib.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/gpib/ines/ines_gpib.c b/drivers/staging/gpib/ines/ines_gpib.c
index a16219c0f7c8..3f79d3c850d5 100644
--- a/drivers/staging/gpib/ines/ines_gpib.c
+++ b/drivers/staging/gpib/ines/ines_gpib.c
@@ -1112,7 +1112,6 @@ static int ines_gpib_config_iteration(struct pcmcia_device *link, void *priv_dat
  */
 static int ines_gpib_config(struct pcmcia_device *link)
 {
-	struct local_info *dev;
 	int retval;
 	void __iomem *virt;
 
-- 
2.49.0

