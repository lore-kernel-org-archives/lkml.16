Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3423206F02;
	Tue,  4 Feb 2025 09:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738661615; cv=none; b=q/O4IbnkcgBgEHNu7yrZHfA7hLIJlCUC/2gyQSkA8WY1xdIJdQYKyVn8a+yaTejXHd1+gXJwRUpScBIiePthUsPRfIU0qjB9nyfc3c1N1CBYd54dcNlaaXohRKbphcqJKm6mJW0sbaCVGUyIEjAEs+6IRf/GO41xbQaIQqv6T7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738661615; c=relaxed/simple;
	bh=kL1ZVwGgPYCVz7/hsjgoJWKryi1olR2r5z3Lp/ZDCn8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XKfsYnRadOHQF0wMZi4ybWRwJIJJET7+wSnJ2H16ylJjkoU58z9Let2/dg6Nfx8Mqt+OM2bQDRxwso0nhw/4wkaFDF0HGLYA9rlF1MyovjUfQa071e9Ik/BWpLwisv0Oj7z8L3eLdYcGyoCGxRv69oKs9RvbD3hibscNb0asjk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JksJW8Db; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JksJW8Db"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-21628b3fe7dso97563785ad.3;
        Tue, 04 Feb 2025 01:33:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738661613; x=1739266413; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FDg5knq0PI6dEKzdt3HMdaKML0oINsP0xAnFJWZrPVE=;
        b=JksJW8DbdRaDiZYKdwerhNksE5w6rCCWvLvd1+kTJg9EBtVUvRfMp1tiJkiPkug9Bt
         JtcbE9RGOpG5Mp2BJaBO2Vxl/kYf/BRkW/s72R28LVCCwCnzrWA3AqnnrqfLRzIL4dqZ
         hHssTD1XCEVWxF6FKyTQHM5Uf2+wcBCl+Xy4njM+/ERBywcuaXrq9VbVOtLA4cjTu3V2
         owW6D1H0Mm/+wIdLuEFtIOv6Q6AdTu/zlPtYb1INb2XvvCaSCqgL7Tr20v1RafWrZxPi
         5EG/Hwl6wPaNX8SE4RT94aSRdnEAfeAQ/LQ3vSHjeKXyipYZwhnlyyYMJqmUveU15QvQ
         FSBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738661613; x=1739266413;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FDg5knq0PI6dEKzdt3HMdaKML0oINsP0xAnFJWZrPVE=;
        b=k6GY6oNrw/n/ozPpfdZrAIFS1h2uVbcOjWd32RzyBR6qFxQ7toHhuKuMC4de4/hD/F
         gaEWXrs8xaCAh3juay1wK/+Dqd+NV5UuXyIJozQlifbNsMdE5EdWqV1locLRT9kUSeDx
         IYlQ1rbhGZsgYIQZY7ip1n0XPWl6tSBBnMTXAC1EU8MnZeqoEWbMKGgejjjmJPLOhhsR
         MxY62eDvojivP/Q2e6F4Blf+y/gQ1v1VpUbRMowPuyNDK7j6DgdsgFY9Y8mF8RwMWT/B
         lGRYuXrdt1ZPm8h9IBvBIl7eelTqIu+9E2PgxBbRLYVQ8+oQfXViU78K6WnmCR/iS6Qr
         VKFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWe1dush53+bTo6MOSCsi1KbOqSFNUnVNHdM1wOoaQ2j7Cw5Q0M6Mb4UYGsFJoaU7IX/6vH5uFElBQkwU0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJXeC/05EHz6SzkCMVjecWusEFKYbJW16qXVxnI13Y5MNfmkio
	HYNQM3/r30hAFD9TRMUqctZjV3Crtvy2N20GjxZPdDQmOQRFUrFKUTXLRNPo
X-Gm-Gg: ASbGnctbGw0E59mfC5BN7rw0QQH/SoCy69zQHvcPHjatoAz/Mew/3tMotobuFNbU2SK
	lani3TAOLWT6lyxuJmVBR9kmZbtgmqDFcWHDN1+tcjilhSGwZeMzQF/uHabD35cQwPU3rIK/6yY
	CEkz4vG2E3P1uLd1QiJFpUsqcc0FKnhIqnu8TzzLvLYZpWTdSsNxP1zUhwnJwin4vGU62fwJW75
	9MGB8iIk1QPIisUM962mJ5IGGFvwNbbvAPXucXlL1DAmzkLVBlisqqAn3hzpZrz+hitwpkubdmU
	daEw47iFQaS+YmuWoNRpp3OzP2Pbea5uPtk=
X-Google-Smtp-Source: AGHT+IEXtBFJu+UAlleKMByNx9uhwr/nD3xwpzuxZ/yWWovff12Wtio174nHqb0eYKgo5PNsxTOHMg==
X-Received: by 2002:a17:903:228e:b0:216:59ed:1ab0 with SMTP id d9443c01a7336-21dd7d736d9mr346344235ad.27.1738661612933;
        Tue, 04 Feb 2025 01:33:32 -0800 (PST)
Received: from vaxr-BM6660-BM6360.. ([2001:288:7001:2703:dc5d:87af:eca4:905a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de31ef08esm90455545ad.13.2025.02.04.01.33.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 01:33:32 -0800 (PST)
From: I Hsin Cheng <richard120310@gmail.com>
To: corbet@lwn.net,
	skhan@linuxfoundation.org
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	I Hsin Cheng <richard120310@gmail.com>
Subject: [PATCH] mm: pgtable: Fix grammar error
Date: Tue,  4 Feb 2025 17:33:26 +0800
Message-ID: <20250204093326.206007-1-richard120310@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix "due high contention" to "due to high contention".

Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
---
 Documentation/mm/split_page_table_lock.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/mm/split_page_table_lock.rst b/Documentation/mm/split_page_table_lock.rst
index e4f6972eb..ced47a23e 100644
--- a/Documentation/mm/split_page_table_lock.rst
+++ b/Documentation/mm/split_page_table_lock.rst
@@ -4,7 +4,7 @@ Split page table lock
 
 Originally, mm->page_table_lock spinlock protected all page tables of the
 mm_struct. But this approach leads to poor page fault scalability of
-multi-threaded applications due high contention on the lock. To improve
+multi-threaded applications due to high contention on the lock. To improve
 scalability, split page table lock was introduced.
 
 With split page table lock we have separate per-table lock to serialize
-- 
2.43.0

