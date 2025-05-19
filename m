Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19EA0243364;
	Mon, 19 May 2025 06:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747635498; cv=none; b=jYO74EDaqeg0ydUGowm2as31we9sDVlE6XjZHhh63LHyf8LQG28GBHJFpaPLSL/GSswViqBBLhVaC5DadUquXokn+4g/6nCBMXgyBDrsI7tIM/j1Nu6W8fw6kXxZ2INLqUKbr+d9x3F48kjNVr3OGJuOyGBlxKyHzug1b+6jmcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747635498; c=relaxed/simple;
	bh=A3YL5vvapbDLoEzJ7mjbIniovbQDwObEL9/l+CCpXsk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CRGxprR7cNPGhAfub39SlrWjn/NJEKxhtVAYf96s3aEDeti18+iLyuxCB6ComZPjKrWhWcQSpUPSwwuztDH8LjUW8Z5/Ij7zB2TM2kxGOswzH2TeSzb0+lCzpP02wdQ4R2p04j++yFEBXfHekywSyXgUwBjdZHHmfwpHUESpfi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TBwpWzth; arc=none smtp.client-ip=209.85.214.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TBwpWzth"
Received: by mail-pl1-f193.google.com with SMTP id d9443c01a7336-231f325366eso20993025ad.1;
        Sun, 18 May 2025 23:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747635495; x=1748240295; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wftKwkW2rzIJq0NllUEEj0qL/M/uMq8buplfSNT2F2M=;
        b=TBwpWzthy9zlDblPQ/Lp2FAWfYSV/wyDdFYBALRDZ9lkYGANImzC0lqd/4Wzlb1KiB
         /77aZCfYlvxyurg15NKO7AY9j6J7eUS/nyXv+z9tJO+cPAf+YgQz9d+x8E14aCCMFQ00
         lCiStvO3K0GRAWJ1CRbMNRMsYxytyiSzERQJTUKOqYA3DyTGnXt5Iagv+EhrkTAg5gAy
         bd67ysaB28FRSOTA/wJk/cZEnAgNFJLdOWHxlDQC+kTN14Agms95iuILEEWm+AgUgijY
         Pn1M6tA+FpxXQElO3yeoikxAf5gS/M6DYnuYoNdubU/CR+jUJfoseYUQNs+PsVtczAiZ
         mtPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747635495; x=1748240295;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wftKwkW2rzIJq0NllUEEj0qL/M/uMq8buplfSNT2F2M=;
        b=lVTFg5Wcv/C1Ms+QJsYm9qXsuNN03U8Ah5+9Sxli63dyCBK1SOIFZM5il09cKq4Usg
         bSzcN8SD8zzxozTyUP5yWLm8PWH9aCYbAaJI91y7lz42NqaaJJS22cpwVaZ/D5ckzvIi
         pHRc2Ud3ZDjUmzAaERC85bH47kQuEfhhlkCz0z2re6cZsYaxjq9aeUqrVqCz40zJqSzy
         uZ8mPt+u+0nBja5BjwbDNI07FxlZIiqWmTVT2GUJXSjsLCV2TjgkRVkQpBvQEhW9SLp8
         qNfF5yavmUqbngWk5x/Fs/u9NvF38t/ruKDgNP3Vnv0eRR0MxwS+cv6XGz/4i38OrO/o
         yRkg==
X-Forwarded-Encrypted: i=1; AJvYcCXOiTF/NSLqHOWTkTocgQLtK1W73wunHvqcBjw1pnl4IERcstdHMmFuFJb31dPsNhbN5IzX7htpZRjiOVHT@vger.kernel.org, AJvYcCXbyv21HhrlbPPD5Tzw7UmFUrm3MveAryt8yslWyFhXVGHtSH3at6CdNdyGol62whvXHSVR2YqQOw0aQQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1Vz+SZ0tRxNSF41OMJ41rGD/L7hExqJPGUrVNiJXSX9THLRYq
	xGT6AP8gh5V100flUWV2A7csF0UU6YD3cmnE426z4K0T0vgICj1XRd6U
X-Gm-Gg: ASbGncsi0SqOpqLOH88bEG/Oaqb1PF/4094CoQvFLHhbpTlCuDlU6HDA0LfVsfgqnfi
	Qnv28m/RV7W+jGEIwi+uzJvDrnAvd9c3I29HwT9zcPKsoEY3hDSAjuogP4XMjrOfP3LwyDyAh4u
	oxYN+C2R6RkiLwavxu9Ph5o3zR2uEwxKi6ex9ylWH5GqLBBoQhlmI4iUBBeJOqHEbTRcWQiFXYk
	JDKjg76EDv9ZBp0oEqoe7aKj6v0PdcJTWqhuMa8sMvSC3KgmAdZzpOE3urUk5LhBW3sGD6cbx99
	CBiuhgdfpaSGlPmw5A6ScUYlFTNdHB04/I7wAXT/+iFwctZxliS6k2v49hRMqGgL33Tv8yVhr/W
	L+qmWmh7Of7u3mmuxulf7C37UKeDvdVEly3L/j3AC5SJDYA==
X-Google-Smtp-Source: AGHT+IEIXF1Jo0Z35ZLOvs54nEH8iQZnWbTxwiQ/1zfEN7e+ERAuOZqbHO2Vbh2N3A/KqTQ1JQoeyA==
X-Received: by 2002:a17:903:1b6d:b0:22c:336f:cb54 with SMTP id d9443c01a7336-231d454c879mr169704805ad.29.1747635495308;
        Sun, 18 May 2025 23:18:15 -0700 (PDT)
Received: from ubuntu20.wiwynn.corp (39-14-65-183.adsl.fetnet.net. [39.14.65.183])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4eedb3csm52200935ad.259.2025.05.18.23.18.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 23:18:14 -0700 (PDT)
From: Yikai Tsai <yikai.tsai.wiwynn@gmail.com>
To: patrick@stwcx.xyz,
	=?UTF-8?q?Carsten=20Spie=C3=9F?= <mail@carsten-spiess.de>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: Yikai Tsai <yikai.tsai.wiwynn@gmail.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/1] hwmon: (isl28022) Fix current reading calculation
Date: Mon, 19 May 2025 14:16:36 +0800
Message-Id: <20250519061637.8796-2-yikai.tsai.wiwynn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250519061637.8796-1-yikai.tsai.wiwynn@gmail.com>
References: <20250519061637.8796-1-yikai.tsai.wiwynn@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

According to the ISL28022 datasheet, bit15 of the current register is
representing -32768. Fix the calculation to properly handle this bit,
ensuring correct measurements for negative values.

Signed-off-by: Yikai Tsai <yikai.tsai.wiwynn@gmail.com>
---
 drivers/hwmon/isl28022.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/isl28022.c b/drivers/hwmon/isl28022.c
index 1fb9864635db..6d8cdf80c9ea 100644
--- a/drivers/hwmon/isl28022.c
+++ b/drivers/hwmon/isl28022.c
@@ -161,8 +161,9 @@ static int isl28022_read_current(struct device *dev, u32 attr, long *val)
 				  ISL28022_REG_CURRENT, &regval);
 		if (err < 0)
 			return err;
-		*val = ((long)regval * 1250L * (long)data->gain) /
-			(long)data->shunt;
+		sign_bit = (regval >> 15) & 0x01;
+		*val = (((long)(((u16)regval) & 0x7FFF) - (sign_bit * 32768)) *
+			1250L * (long)data->gain) / (long)data->shunt;
 		break;
 	default:
 		return -EOPNOTSUPP;
-- 
2.25.1

