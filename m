Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6EC51DA109
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 11:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743852382; cv=none; b=mYupoORQCaANKyNH1u31QfJpjOV3VmJa9tYl7HGrnNBAReYmECiwuyzHlc4nodmeBSB1M/GqC3vcrVl9a62/1pIY9QkSOTEKlcVURBB45uuybHZRjiC+O6dLTTbqlsvbckU1ZBEZ5BlWAJonZ41RZ1SdiGullRtAxZN0y/KIaQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743852382; c=relaxed/simple;
	bh=MyzrTV49tPT/I8ZLEfXEdlf8hIyFJIg3rw5Q0V8+g34=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YJnnHIMBu9MW+6Fg1QevmuSevacAOBfTSKiVRf1IjHG71P4Uqdq3a7oQOmsWukOkIdW6yNCzVB7gaupg+gDOEsjVmQQz9CELloqBqW7bGni9yXPb2yQ33pB0L/Krb9eCTcRoOkQz1Fdq5i/AXoy7vgSWmde5ymlkpq+HQNVp8MM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VF3i546H; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VF3i546H"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3914aba1ce4so2319711f8f.2
        for <linux-kernel@vger.kernel.org>; Sat, 05 Apr 2025 04:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743852379; x=1744457179; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/vMViTK1C/TsFdnnOXr80gaLAfBrdRoZO6TBtYl1Oqw=;
        b=VF3i546H/fgidmadZK/ZS/h1CPrFxb9IpLATnBMQqyMCHPNccoRhz/xX/cVcYh9Oz8
         LRZXVP8M/h6oGHFuVPg9gfSjR7CMNP+0QSQikroamVKgQw3RLnnt7TGhDmhteyY4N7YJ
         s6w/0qIN76w52HFU98RzW1JFP2e1fjSLUinxUVEoeH5Yu6jDXH/ZzRCWzeO6IMNzdjEN
         Hwx358fBjkgjVrm4zSRZ9b7pNSp1qC3jNQdBkWdyXWWbG38TO6UPzBSjfVA0PgFXEI4k
         ecCWIl+eYM7c04HLxEXQIZOTtPCQv7Pcgxt/mtCf+WUZesGoQ9TrnJQ7ORdgmzLwuuAZ
         RUFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743852379; x=1744457179;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/vMViTK1C/TsFdnnOXr80gaLAfBrdRoZO6TBtYl1Oqw=;
        b=Zh1KBhBB/excd9Umyt/mnQdLyUz9kQK5z1HVARJ/MphKU+yx2ZZvIN06OTPG/bRR4A
         ab+MOPNfNDV/Ax5LX3Y7RYkTIo9v40wCfbs3DXVwSNO4jz8pd0oGha5kNfvbGSAGAnVt
         V9iJKQwvNaYYCmw1AqtvV60YuCH+BTwcv0d+ntG73c3iWF5rCrZan5T/wdM7eNNMuuMz
         GChwGnsuY9hXRhpxkqR863Y2h1j5ZLfV1jlxiETsRpKPoTzEddiHoGx4TjKsEEfUI4mL
         PPnMdZVGWwY7/KMM12Wswq0Wu86jY9lTMLJtPK5ZyYsUgDEcv03NXMDo13Tq1/LYU/Ee
         hSHg==
X-Forwarded-Encrypted: i=1; AJvYcCWAY0/goXoMdUUZ/c0UkN/5IuKhb1b8ajHyNy2aRBG8T+p+3qilwUou7iLWbX2etZ0BBlP6Hbvd7cgX/uQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyazr1xyszqnQAwwqclr0enCcQ6dhgixVHKiDNkc2iFuw6djf0l
	aEWynVwiI8520AepttKQzkae0gSRlyhqw6RG1YqcqmoWiXgKPNgrrNxl6I7S8Yc=
X-Gm-Gg: ASbGncsN66uIYvBegEh/K4QjD9hTXMZco9gexNlHA7vxfg+vHQdkkf7SprgJRdFFbFU
	oXWtnf8EOIrTDhjC6138EGrXaVz+ghUoDTHk8nylW0Bm6YrFjhqu1Hu9hzqYrlCy1cDCESaJun3
	f/rBxWvml+Ry5l5TkwA2ToVlRyq1p8/qAkdDDpazmkeEvG1Zm5dVcQWeq5dZJquW711AGoLTB+Z
	JKFwBZN13bEm45FFcieNKjgOmRmUrKGghdAG1O6wdT7gzJYBqNYWtUamPVXcNKJvg7snJ7vavv0
	W1P6yDxSxD+JpoirkkI2WfRAPaMjsQfbhOHdm0VsvQ==
X-Google-Smtp-Source: AGHT+IHRVgnhkeEy0I01njxzR2nfKc/ot+I5VzUkqthMq0BKQexQcZeRBf8jb+REOsGAUv9e+axi5g==
X-Received: by 2002:a5d:5c84:0:b0:390:f552:d291 with SMTP id ffacd0b85a97d-39d0de1b814mr4559551f8f.22.1743852378697;
        Sat, 05 Apr 2025 04:26:18 -0700 (PDT)
Received: from pc.. ([197.232.62.173])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec17b0d06sm74361705e9.35.2025.04.05.04.26.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 04:26:18 -0700 (PDT)
From: Erick Karanja <karanja99erick@gmail.com>
To: gregkh@linuxfoundation.org,
	outreachy@lists.linux.dev
Cc: karanja99erick@gmail.com,
	philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] staging :rtl8723bs: Cleanup patches
Date: Sat,  5 Apr 2025 14:26:03 +0300
Message-ID: <cover.1743851473.git.karanja99erick@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Address checkpatch complains for the staging/rtl8723bs module.
This patches can be applied in any order.

Erick Karanja (2):
  staging: rtl8723bs: add spaces between ternary and binary operators
  staging: rtl8723bs: use preferred comparison order

 drivers/staging/rtl8723bs/hal/hal_btcoex.c    | 22 +++++++++----------
 .../staging/rtl8723bs/hal/odm_CfoTracking.c   |  4 ++--
 2 files changed, 13 insertions(+), 13 deletions(-)

-- 
2.43.0

