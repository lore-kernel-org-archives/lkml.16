Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFC411E871;
	Fri, 25 Apr 2025 13:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745589521; cv=none; b=AbrOAJvCZKooN6dijSFQJ2jz5W1KbbyU4fd0wG8eO5XxDXWGyI3ToJBH/v0FlH2FFyB2tqomq4kQ0LI+VEoslKiruZaGuwm4MI7FLvfAGsOXnPg039fA4yGdMzUcmO3AnvaVHm25j6KG3SVMKeamMzr5SGncS1IaAkVOcgDzrOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745589521; c=relaxed/simple;
	bh=mcDeEqI6kvtHCCTnr+Wxj6jiPhYKyJEPJh7vjACGgbQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gvqmMjym1hsolb3QIiEA5Nztdfthrl0d7YR/ZFNMQuVSncKdF+8HOcnBeKvsFGeyXOuDxVM6XfVpKl1OKHvcdXnxaVQqjcQDwnHknTc6KIAn8T3WffVPzpIug20HX5yUcuUzpWLyYMIhVH04S0Rd4IDzJxu2cE3uMi3CIeDszsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dV88DOvs; arc=none smtp.client-ip=209.85.128.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dV88DOvs"
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-43edb40f357so16005985e9.0;
        Fri, 25 Apr 2025 06:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745589518; x=1746194318; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6bY380geZnTTfF6UdOaz25cqQI9fCKGT7OepxEdFLjI=;
        b=dV88DOvsulLml0wgSiHZUcx21fN3+M2JgnuH3IYDPz1PCOynXedAtM84CVB7hatMqa
         ONyFYpa8h/7h1VGCrVbPnWpv6z0sb5frtlsnaidbzY/mTlucH9yeJ0/HFMoCkK6U7gTc
         BOEAj1JNo/e2mHp6W57luMpXRIRIoTCcXcdtCPWN8+kpbuoYDLzOksYt6Wjud1j/SNYW
         tWKwa3LEajA3rgoYWHciZD1olqgvJOMbh4TC/E5rBShGPzAeKQnP2uhSzL/zrTCGiz1f
         FzeinFt3TXSa+w7BvzAahKZDhW9NWpA+iew3esYlMOZnlzp//vHo61mLVyx6gOOpzzGk
         tpFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745589518; x=1746194318;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6bY380geZnTTfF6UdOaz25cqQI9fCKGT7OepxEdFLjI=;
        b=jOGGXqjC4SmBM7ekjZfafZ94or8ECCTSrfL4mwXvDwdS49fiFz0NzK/OWRpLtK0jEV
         gzpunLFdTvxBa426RORLr94Wu3y7ud9J0A0E9oXWlmHdcVPRQ5praEJwSrHC8Tx24kfs
         4LV0V88PfZxqjukJTYLr1f4oQ9kVHBFr6MllZDCByDXz9iugEqE+S47/tmEtq5Q/f8Uk
         Cx65Koo+GyaL+whcY8LAKZK+1xNygxCzOANjLmezqaiZLd7+ClFbPniIEQKNxUTfF3D3
         BuAz7nAxGYBbpDdc+Vh7JrA3q0Bm9HLaIeeHSl94ihOjAeXXAqy1NfJzt/Z68sJYbtAX
         oJww==
X-Forwarded-Encrypted: i=1; AJvYcCVtVp+uF7REsbbHkMc48xveJdycTrTdTtREksb+vm/4LmWTPXtSxaqMjWLP4pv0C2ce3mrw1Nwwx/e6nFO+@vger.kernel.org, AJvYcCWMClfV1QUFo7x5/g25Yzv6OZ5B/ZbTZmnU8UjFfMpzTmXS98n0F6BTGOrhAVmrFtkTMytls3LvNf8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWqNtoGLL2+Pc1qrbknxSPPuS7fmtXDuHH2gtgEMWj4PfDx0B+
	k1t/qZSV8+V7iyEQ+GhxMik16zg2SZmuAHKRDFxxEQeP3Orde14j
X-Gm-Gg: ASbGncuPLSMsSVEZHm6OpTeemuWkFapFQTca27xs2IuuoLm8VD6C30LnCXvfvW9+3bH
	3H4HMWPo5l1lMfl85qqxJDwc+IwkMGgAAdh/grvxKEl8uXmwIRHlkDiKZr9ucQSSxdpAmvFr/fX
	NBpCwWvRV1VyCoRfj6tEEg/ddNVCz5leXBmEfZ/4aK5uSQWmNmGagZjjloiT4CulAK1vV5xzW46
	TvXNVvZe5d33QKF0EtZeiqyFd9u0Vu8Vg1GZS0zERK/vQs/D5LwkGyw0atSaFV7S17pwpeRLM1r
	qxUlg63+I42AdTV1EYiECyMBUgQktDjaO5oSSec0Q18UtshUnG+RmVPQYr2r
X-Google-Smtp-Source: AGHT+IGKpsQ5W87vSkvLBRToOXWrynv2kjHbC5PAxLlmph+4bn4NeCpxrGrfeMzWWcgajwAbw4T4eg==
X-Received: by 2002:a05:6000:1ac6:b0:391:3094:d696 with SMTP id ffacd0b85a97d-3a074f42e52mr1989076f8f.54.1745589517898;
        Fri, 25 Apr 2025 06:58:37 -0700 (PDT)
Received: from be-Latitude-E6510.home.local ([2a01:8b82:54fd:b800::4bb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073ca5219sm2430293f8f.27.2025.04.25.06.58.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 06:58:37 -0700 (PDT)
From: =?UTF-8?q?Adrian=20B=C3=BCtler?= <buetlera123@gmail.com>
To: corbet@lwn.net,
	linux-doc@vger.kernel.org
Cc: tglx@linutronix.de,
	hpa@zytor.com,
	x86@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Documentation: x86: Fix a typo in fsgs.rst
Date: Fri, 25 Apr 2025 15:58:36 +0200
Message-Id: <20250425135836.19081-1-buetlera123@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a spelling typo in fsgs.rst.
---
 Documentation/arch/x86/x86_64/fsgs.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/arch/x86/x86_64/fsgs.rst b/Documentation/arch/x86/x86_64/fsgs.rst
index d07e445dac5c..6bda4d16d3f7 100644
--- a/Documentation/arch/x86/x86_64/fsgs.rst
+++ b/Documentation/arch/x86/x86_64/fsgs.rst
@@ -130,7 +130,7 @@ instructions. Clang 5 supports them as well.
 
   =================== ===========================
   _readfsbase_u64()   Read the FS base register
-  _readfsbase_u64()   Read the GS base register
+  _readgsbase_u64()   Read the GS base register
   _writefsbase_u64()  Write the FS base register
   _writegsbase_u64()  Write the GS base register
   =================== ===========================
-- 
2.34.1

