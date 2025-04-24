Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E473228B4F4
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 19:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745524598; cv=none; b=A0MDY6aiQTMKibsQOIPUF6c0gN/swE03eGxCpCmG5oZq7Y7CpXYQwpInoAlJIn5EJ8FrsGOTll6Hte6pk//3zyelfbtIKz6FMvkC5i0RSkE6cmPRKdGGXpuc2rfKFCBcgaNxA5QsIlZIywNFNVp2tDQQ/PaW723DA6P3RFa+3Ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745524598; c=relaxed/simple;
	bh=qA9YoPq6CuoWeTtRRakNPovo5iHdyScKFmDoSPkkEoA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JPR3Dcoas4UZnL6pqyzfrlUSZ/OfroHfXwoFO6e4mQZSlbz8QO5goEZ05l2CNKVTeBVCgegUMH6Ohwl46HBhTj5SBhxCAdoAv/X0/SQsE1yaEDrHX+68ZbR0vb4pRvtQt4geeyXS3oQjWK20FVhfgkBjFvlNvUrb7yIsPh99TJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VtDhE91x; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VtDhE91x"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43cfe574976so10737835e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 12:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745524595; x=1746129395; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GNd+hGIfs44rRYDBiAICDUAQsHqXFgJsXPqMw+zJJw4=;
        b=VtDhE91xguyzKqqqO+CCTUr7HGYaH2qFOqI+wPgesrVVjas4r0mqbPLuPRirWMMqd/
         Ky1KWp9LQ9V7MIDSDHhPBXvXW0mxOrdcWyCdcihNzmCRPNn3db5X4HgDqCvyXT4ilbKB
         aZjvcHGr87pKIM1izUUQ2e/uT2E2FBjD5+wt1nAham5jkRy2zWfZINZMRL2MfdT45VbT
         vIxf5DKJatsydJalwtIYXRJoBiqSwhRdLDNGECsRhBfQvuMQhpNlQEfHVeAMIkyJhh4C
         NO18aCT4YeiSdUVF9J7teIsVgEG223YaaiXzPQLSR2c87XUUTD9avwnbYz//PBmTiIlg
         y8ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745524595; x=1746129395;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GNd+hGIfs44rRYDBiAICDUAQsHqXFgJsXPqMw+zJJw4=;
        b=K6lprb5+i6qGizbbKpZj+k3nO1BXt//7sOfkYmjgkSqaK58x2lqoL7GGfYdyRSL5gF
         0JPWNKwzWI3LEsk7T0uXWKuIzH9EI7yWeI3SLIQbmg4ggg29Np/+ui0xBKz//xM5xOYF
         jXlbKykD+pWzMbpMgg5i1XoWY6G2DWwAkIN4E+s8bgjoZzc4CjIbvp4UbFUY9ZDqUcyG
         wqgcOexJnU5CSsJ2ySaj3vRmaSQbl5F3B4+XC/yVBz4oHY3gPP6bRnG0GnJYnZT8zmuU
         5bbL9PRW3T5RYs1rrQ0DcI2jtVDm8N2REFUBR/dwx1TFp/Xl/fskIdHpYet72ZXQ2n9L
         3gDQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7PUjpmUSWipga/DjMM5KTPuTN7V7zq9qcm/enaeFkp5sMqemMG2cwmEf1MjRduQ5tHCR9LNakB9znk4g=@vger.kernel.org
X-Gm-Message-State: AOJu0YxX9TXvTBx+W4DAmjLas7uWey+ScW85OlOW7foSLNGxC32AhBiX
	CxlS6ugMR7oeHwe2g+WK1Ac7wgpuDM9G5VfR/yqyHt3hnTs2Yh1y
X-Gm-Gg: ASbGnct2whUynUZNWBpAGJNlluVcLW2z5D7a11Xz660SkTsTULuJt2tAUwk/++5jmgY
	Ko6+n24VHOqkErdhk3ar3s0R23iWjNgZ68rKYwFx5+m0QD3SHqpDh55sZR55/zlqRkmEQJRDRlH
	HB+kOCuIM1Pvrit71crk6zo9A1S2mfxuOn3AvY6uvVrv9e/n3MN2j/Nb9zLrjXmyVMI7BmgCVnk
	hK33EtDC05+AQwkNf8EyUEJ1JsrR47pb1gsWBmZoU/8b3HLBRHxknzYnN3Z8i/55A43YBJ7VzgX
	Lhj4lfLTRhm5TL9Tmgz1uNyclSpc4+fbUWuY0A==
X-Google-Smtp-Source: AGHT+IG7dyXDbntHmwfxv2xygxQxfNjf9DIjhc6tLqZgw8oly1UT1EXhRIpaV2+90MHpm0HStcNuUA==
X-Received: by 2002:a05:600c:444f:b0:43c:fbba:41ba with SMTP id 5b1f17b1804b1-4409bd8e0d0mr25220135e9.28.1745524594894;
        Thu, 24 Apr 2025 12:56:34 -0700 (PDT)
Received: from pc.. ([196.96.160.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2d8842sm32385865e9.31.2025.04.24.12.56.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 12:56:34 -0700 (PDT)
From: Erick Karanja <karanja99erick@gmail.com>
To: gregkh@linuxfoundation.org
Cc: julia.lawall@inria.fr,
	karanja99erick@gmail.com,
	philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] staging: rtl8723bs: Use scoped_guard for mutex handling
Date: Thu, 24 Apr 2025 22:56:24 +0300
Message-ID: <cover.1745523325.git.karanja99erick@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset updates the rtl8723bs driver by replacing manual mutex lock and
unlock operations with scoped_guard(), aiming to improve code clarity and
safety through automatic resource management. This change makes the code
more resilient to early returns and error paths.

Erick Karanja (2):
  staging: rtl8723bs: Replace manual mutex handling with scoped_guard()
  staging: rtl8723bs: Switch mutexes to scoped_guard

 drivers/staging/rtl8723bs/core/rtw_cmd.c     |  14 +-
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c | 281 +++++++++----------
 2 files changed, 132 insertions(+), 163 deletions(-)

-- 
2.43.0

