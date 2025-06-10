Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AACB21931C;
	Tue, 10 Jun 2025 06:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749538392; cv=none; b=ZLWc06akvV7STXbugAsovkGVw8IK/J2QDoq5u7T2ikbsnizsCDRiWUoy/Q+sOxqqFQbwhN3y9idU1iRwuh94mycE7ozyZDHnIXGoAOasyPN+Ki7npe21uFgpJ+/kKu9So5g0CrPAh3l4vekKCyI7a1teYpahXtdhQCyLUdwfrRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749538392; c=relaxed/simple;
	bh=UG8A5/L+Irb0vjL1NjpfPa+O989gEUIFs600uZGgXt0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oBQQwbTIs9yqiXoaJ0J41DKb5f1VM+b7NO5VddUjKCyGup+bSa3Xv+zY/vdEfVOpJeUFDPSWdUR/oVyWcX30nE825H/ki68tu7tpBfOqC0TX5pfcujfy67PP+S01+5UsCcQk0C5kUMFqizjxsJBX8SKyVlEgYslQxlhymzTlYFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CvIkIgSH; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CvIkIgSH"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2363497cc4dso7692795ad.1;
        Mon, 09 Jun 2025 23:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749538388; x=1750143188; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L40mN9hDD1YShdc9tuvud2gAJyku74rtyG9Hba9Zg7w=;
        b=CvIkIgSH0A/AsKHUK/ziPdY1yegVH+Pei7yfa8TWYB6eLhq8AtX23fjSzmtygBgr9V
         O4mHZhcGCeHUVQ2YxXYqc8RCnfb4tXtoBV16LGWzSFCt41vC6mNxgGK5tmQUTqtxqpfZ
         mxux8lVTljEOo/lsqV33/MUgfsPKfUHSyjAV/OAqzGVVuR1l9UAy+bXEA6G22qfXH4LL
         aB68LwS67pEmjGdYr9zHalnA1EQCndO38zCpOQj/bphA1q0kEjIzlnG9rwPxapAci7oE
         fE+wrG5tLQ7x+Wv0b4W2SwhxMP7Q4e4yHkelavLeeCAPTUMs//7omw1NvtP/an0ZXK4j
         IzIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749538388; x=1750143188;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L40mN9hDD1YShdc9tuvud2gAJyku74rtyG9Hba9Zg7w=;
        b=BhRepuZjQSP6A+DQxmhFqUOi1xGAj2fz2n5VO9nVDlX4c7p79iljsuvg+PRaZaHK+f
         PelOHuCpqbXPg/YFlPKvkg3ToXOd4y7R9n54IjWKV2sKW9Q/EZkVdzvVRm18LO6rfdUN
         pnKKPOcnpcsOAkfFf8kyoJmR0b0bE4udcs4aYZLxTYeu2N+GRt5j5ydaQaMc7mL8IW8d
         5un1EY1vxVP0AF0z/Aksy/k8ZVo0Q+WE/3QyYnbaT+bZRykkU38Dfcf0JOHvYB7iiKUS
         VMeoTWDieKznyMTTC9HD9gho4HymtM+BLrG1JH24za//PTF+pGSJOF2N8N71hNnyc0Nv
         oNqw==
X-Forwarded-Encrypted: i=1; AJvYcCU01Xb7M6WqvtxHUzDFfWx0icgcqAxmS7zOZaTnmauULCcsctnaVbBsH1nZ3FGYtJCOSI5YaKSSzoo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzkViqRjyER5dKo5ds3KO/2M15X4oUjTn3VywtjwFifN1v9PCuT
	R1GusS8Xk4MaIj8DqlPtx7WriIQPBEs/AxrvlvMCDVYK4zawQLtx+THW
X-Gm-Gg: ASbGnctzs+N/L9p1MQ8U65qZhR6jLciSYlEMteHEC10a1TFX8NBDfw4lTDKJfgzFrND
	JkPqaNfsV+b58plUh5EIqJt0KpPbNQ3KS8Jas4x73zm3bqv9sApj9znHYvUUHIw79Xk/nAVF1Ug
	u8uJhNboXuU8jzvISGLRyq+DdX29/kWUh3SmVEaElC+Jc4wPqXoqcO5x4FN4tHHcvxnjQZzDe5x
	4vtNj878IcREJr4WpTg+4g2xYueD4mh1/cgliMT28kBcWzXBm1l6y3N6dSug1Z5FhEo8zAu8hEd
	fA0Ie+bnd5eR2x1nlA5bK1nyefccOunt/F63HUBEG7+qwuqqHQoE1KNRfvc8aQ==
X-Google-Smtp-Source: AGHT+IGGhf4qcSKcWuzkG7Ma2lcSo0wcjny/oVMbLwAkNWZVZHFdXOLtBb5AiH1aGJ8+FB+mlbV4Bw==
X-Received: by 2002:a17:903:3c2f:b0:234:914b:3841 with SMTP id d9443c01a7336-23601d74a16mr222179975ad.39.1749538388441;
        Mon, 09 Jun 2025 23:53:08 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2363ad3492esm4038345ad.154.2025.06.09.23.53.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 23:53:07 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 9B9974209E8C; Tue, 10 Jun 2025 13:53:04 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux DRI Development <dri-devel@lists.freedesktop.org>,
	Linux Nouveau <nouveau@lists.freedesktop.org>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Dave Airlie <airlied@redhat.com>,
	Timur Tabi <ttabi@nvidia.com>,
	Ben Skeggs <bskeggs@nvidia.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>
Subject: [PATCH] Documentation: nouveau: Update GSP message queue kernel-doc reference
Date: Tue, 10 Jun 2025 13:52:57 +0700
Message-ID: <20250610065258.41467-1-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1465; i=bagasdotme@gmail.com; h=from:subject; bh=UG8A5/L+Irb0vjL1NjpfPa+O989gEUIFs600uZGgXt0=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDBnuVxRPvcnb/mPm1D12Lbu/hZYErzuxKWJOhFqNZp3vr 7TXOxXCO0pZGMS4GGTFFFkmJfI1nd5lJHKhfa0jzBxWJpAhDFycAjARM1aGfybTnrre0du1WiJh 25KFy1ddPu9Z0dI8h1vv9rqu+dn/5hkyMrR9u2q/JNV9bnyb6EYTzrkb+QrEVF9cNN3I4hlf/S+ EkREA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

Commit c472d828348caf ("drm/nouveau/gsp: move subdev/engine impls to
subdev/gsp/rm/r535/") moves GSP-RM message queue implementation in
drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c to versioned path in
drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c, but forgets to
update kernel-doc reference in nouveau docs, hence triggers htmldocs
warnings:

ERROR: Cannot find file ./drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
WARNING: No kernel-doc for file ./drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c

Update the reference.

Fixes: c472d828348c ("drm/nouveau/gsp: move subdev/engine impls to subdev/gsp/rm/r535/")
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/gpu/nouveau.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/gpu/nouveau.rst b/Documentation/gpu/nouveau.rst
index b8c801e0068cb0..878fb1ade31e4c 100644
--- a/Documentation/gpu/nouveau.rst
+++ b/Documentation/gpu/nouveau.rst
@@ -25,7 +25,7 @@ providing a consistent API to upper layers of the driver stack.
 GSP Support
 ------------------------
 
-.. kernel-doc:: drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+.. kernel-doc:: drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
    :doc: GSP message queue element
 
 .. kernel-doc:: drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h

base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
-- 
An old man doll... just what I always wanted! - Clara

