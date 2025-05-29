Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77DA6218AB3;
	Thu, 29 May 2025 20:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748550503; cv=none; b=gOWPun/IrwT+KEbCQRz6bpnyCeLG3B5fXaEZOZLaZ+aviZ2kw8x9WFA4z3kauzffqEYl9pDUuou24S89wO2rStovLwsntSp81e9Y55GzH4JzYgFoqEq6bB6wgwoXLPiGEO7QvvAkAQ6avauzVeVJiVgEBJMtUTz/jdB5MWfnMrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748550503; c=relaxed/simple;
	bh=2lFERKKwf0Bgilc2fCylezhiNI0OaN5OjXUiUrHMMfI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uz3vZptfHNedHq4C8naMaV9M1BA/rB7kaW2A1nDIP89804bFKzV2/cnJuIAfFXV2z2R/BH8IuiELwX8sGbWDexTh6bDStv/MBVVnTrQa84AW/MFUfhn3pJH+xq1kaEHsLUHrfRg07EXWr4x5t2rq/9K9gkLfX3jao+/2/StyR3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V/NNZO7F; arc=none smtp.client-ip=209.85.167.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V/NNZO7F"
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-4067ac8f6cdso64679b6e.2;
        Thu, 29 May 2025 13:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748550501; x=1749155301; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ze7pV/eckgg8GQ4RrwQCS5RopGlZ0EcL5AOHMc7b6xc=;
        b=V/NNZO7F/U7est0gmXidbKj3H3CmLz3ABKXbKPHcYpbgMOfS1DLx48OImP2pYg/C+B
         b4sQUE3F3UgJ8Aoi4Fs0c/+zd+WV5wDEEz5QuJKjleDW2UGBN7n63tjlMGp92MbSg8M6
         kal/hQBZBFjV5DUqmvUUEid503mQiVrvbmFkXKPKrUtNyhxnG2XZ2Z56eVHXsVeXsjQF
         YdsP41WYgiXx3GVSl/Qsfqg2G5+8Byl892xPJv7cOB8KSiXkSZlTRcW004FizG/1xdoN
         k55nh8iRHPqUNoR8uUQtSL3igp/C5Qndq6HRauApgV5IsmWB0t/8lfJK4cT1ZJPY4Xn4
         49ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748550501; x=1749155301;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ze7pV/eckgg8GQ4RrwQCS5RopGlZ0EcL5AOHMc7b6xc=;
        b=RqtKmHbMPXE2pIcrFgqg0x1Mgr3ad2Ao/3znT4Aw9l+U8UVYOl3TFSvfDTpB/Wcv5+
         J4nuw6UGpB0XGwyqU1JoP3bJBX39s/BkXFCCosjVwegk3/V4cPA8TiwS6anJstsTEPhe
         cLsLQVRKU1ZwFUP6y94TPrPMAlAVnGtx79IyMqND/EqTHERG/hh6BX4ix8dDijbubX5s
         8P2P7G1pWgLv7RO8i5aYRWdRu1nCGJAW8F/fSNnw/+StUUMMI8wn3KUmGWvYJqK84ISp
         pqgFW+41aY5ILuqijOdSYE9ode8qgYvxH9b/uTG9+IPG0s9JEdfdCekzW6JusXcReJX3
         Ca9A==
X-Forwarded-Encrypted: i=1; AJvYcCVT6IoFguzpsUkKLLKnjeHqrhwNQX+Mx1M0oypWRxYmm1VsB5BVtAyYSix/SmHqx91MZmgKRuxt/hbBimnOAhuwbxUc@vger.kernel.org
X-Gm-Message-State: AOJu0YwpfkOlVOCZr5Jyh1wTayj4fPmaLPzeQdGpWjl7Sroz/sEZEBXn
	wBCOijMBuzYundbovu8mDB6UGiDMx/JhWlfy1JrKekCvsHrxLAMMuY/GymWTiw==
X-Gm-Gg: ASbGnctGiZ5JYKmV+7hpAMepCeJJOZl9bzU4NYNL40wx5wRnpwLij3gc9QQk2ymwyUR
	0M1oCaLY4JbkfjKBkqi1eK3wXSWfyJebOwG8X4aJk0VlbBNoh8M8kSpwNqtOnce0YmV2Q27ue61
	ZhrlaNxxkJOpNBIO4aW9Kk+ZEiLP9CitRgHwzdxOENR8tdpaJxu3GLQNctX5eZAcfxUfMqeGEH/
	O6e1991DZ7uUx3jVC76pT+f4EQIWFQlZyjJMAxJ1+HfOIcEcgnKOZy+DPTatLWoJSEKlRlQQNjm
	tFddpLVW5OWNfQ3uWGobb1TZJElZY5EujBRBwM1FhGq4Ax6AHcvr6iTeQPkPwNH0dmHMAEjakOg
	94yOfCyHRFljP5CO+YQ==
X-Google-Smtp-Source: AGHT+IF5EyyKevgQlDAL5+43z/UP19l2PHURuLA+Ho6sbu8B1WX/LVQkZ+7QW8yOC0tKZRmqOWG/wA==
X-Received: by 2002:a05:6808:228e:b0:3f9:d5a2:8999 with SMTP id 5614622812f47-406796741f4mr608922b6e.3.1748550501239;
        Thu, 29 May 2025 13:28:21 -0700 (PDT)
Received: from localhost.localdomain.adc.delllabs.net ([143.166.81.254])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40678bf36e7sm129240b6e.1.2025.05.29.13.28.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 13:28:20 -0700 (PDT)
From: Stuart Hayes <stuart.w.hayes@gmail.com>
To: linux-kernel@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org
Cc: Stuart Hayes <stuart.w.hayes@gmail.com>
Subject: [PATCH v3 0/4] platform/x86: dell_rbu: Packet data fixes
Date: Thu, 29 May 2025 15:27:54 -0500
Message-ID: <20250529202758.8440-1-stuart.w.hayes@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make two fixes related to packet data and fix a sparse warning.

Signed-off-by: Stuart Hayes <stuart.w.hayes@gmail.com>

---

v3:
 -  Cosmetic changes to commit messages
 -  Bump module version

v2:
 -  Add "__must_hold" to create_packet to remove sparse warning.
 -  Make struct packet_data_list static.

Stuart Hayes (4):
  platform/x86: dell_rbu: Fix sparse warning
  platform/x86: dell_rbu: Fix list usage
  platform/x86: dell_rbu: Stop overwriting data buffer
  platform/x86: dell_rbu: Bump version

 drivers/platform/x86/dell/dell_rbu.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

-- 
2.47.1

