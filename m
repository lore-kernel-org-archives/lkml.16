Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FCB525485B
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 16:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744906343; cv=none; b=N9XWC0llqY8HhPyo7Dqlq7iGMICTzDxzI5ZG82J3+ndIl4CynPNmKf0f/cP/KBiJCMFYo99rSApF/Xk0Tq4A9RRUDGsreNojwaDPptzncdZzOCXF9BzqbZaj5GuW+L6XgSlzPBawEo4EvDCNJFzozk3DbURsCHwV5gDuyOQZztM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744906343; c=relaxed/simple;
	bh=3nyx5/o0+dZjRFjxJhpCvRRADTgRjnaxhy/Fz4EHK5M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XaK9ym/M964FbRthseTaINFjeQM331OI/s755LKZVvcbl7FkopawL6RtS3JRjSbUA+YYXDQ+MQieH/rqXBjBV8ORogxesokHhb2i1YOnVO4SnkrXqpc/vjNotHkecqZEON8cisi5GoEA+hkMplukR2sKVkrAhEZwirFDHhy5HbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K5eCHPkN; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K5eCHPkN"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-548409cd2a8so1319801e87.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 09:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744906340; x=1745511140; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q2DqD9BQAtvDREsRw2DN/6o2wQp/L1QLQLFU4UGNmDU=;
        b=K5eCHPkNCH/Rlj54SgkLBuVc9SjOKtD65KU7axjixmnq//+9SBOlf7NSe7l9AiA5iu
         bTGret5nXc6vtNDlfir5rJdTbrYvavYw80ZsUvn7n8C6WzNL3mDIY8hXAPxOkM56CYhH
         IvKhf9Fu6lUZBc1npuQXeN1MpROrmJIAPXJg224cK0vyxuo0Is/KZEaRKFBU5H6i6RiX
         fXUU0xUon6kcv5yhmh12q7s8gPwjpfFE/0vR9M69HQQ5XSAY5bPa4vNLkKKpbsvUrrHq
         ZWyVRZPkrggzE9rn7kKrUqLJMETvbSN8FdAImbnGBWHU5g3Hp7k2MPNSXwhmNV385gFd
         75YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744906340; x=1745511140;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q2DqD9BQAtvDREsRw2DN/6o2wQp/L1QLQLFU4UGNmDU=;
        b=iaU9dWuNHp0Vizi9XG6H8NlzLzsdkKAEQqTsVQrXCwbEOdBW9tSaP2ubBA7lg8pSOu
         iSIyNLtiOILbkZKUsjQKsFzoOwALfQquBb83YWNaYZmsLuK/ijb6+hYwejazzji1ZfM1
         e3zEXVkodPDkcX4MijpxCq2asEhNgUnz+KK9bHdFJ5ViFL27wwFykV9gY7ZEzYl+I4/0
         9oesP7yLxocPgIipzFlFXLLYvtcXgCj4SW+YtTFDF/eKqgbinLyVKRt3e7W+OfHq4xDL
         0SMgTiFGkEmZgm6eZo8thoJYCBZWsU4gQF+mn2w7mt8miLE8aSZFBY3onpWH76H53L2N
         KbOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXM4Peep2chgweIrlPMHCc8sSbSrmL/JN/aetgC8XHn/Gui/pJalOr+aVA9cHwuZpMrrXYEzJtNTZVhG20=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjF12X6tG4oioozsF3vZelApJMS7AqMUusuVo0xuVVKNLv+23D
	DITeSwV/jhWLp/WKdASf4vnIIi6RWz/KrzEkCgQPTGPbYYeQyiNx
X-Gm-Gg: ASbGncu2CzIham7It3gMay7WoJ320UIyQcljxdRAq/8EKjJ7sAcCxsC7rkv7JKUDNWt
	5YxXjcZ6I0ywUPUJTWgZts+wm047wJE8f+qqP38Cfp/QcnM1lsW+JtcUF53vsuJ7FCPZZI2yCXB
	4NJZDsxCZRWNsubojNDjqxZ7NfaV/cjJlYIa6AWPLUuP3cFBEysmBug7PfSMmoKLSILRYqxB5wj
	f7TfOgCZqPP8ypacMzWz3ooZyJXSv0mVl/FtV6KbsjUZTkUc5e+BLmx/AvwlnHhh4Rot0tlewhI
	Z6zXKuxhKETDjuNwCMb3SVDJMd2O90yomvlw
X-Google-Smtp-Source: AGHT+IFrLX6vE1RvZB2qO8Upzy1nOrDt6DKQMQLhorbBry2iEtc4ISaiMBxadO/UPacQLXXCe8bOvg==
X-Received: by 2002:a05:6512:a87:b0:545:ee3:f3be with SMTP id 2adb3069b0e04-54d64a7b390mr2599525e87.10.1744906339861;
        Thu, 17 Apr 2025 09:12:19 -0700 (PDT)
Received: from pc638.lan ([2001:9b1:d5a0:a500:2d8:61ff:fec9:d743])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6df60cf6sm2882e87.66.2025.04.17.09.12.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 09:12:19 -0700 (PDT)
From: "Uladzislau Rezki (Sony)" <urezki@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org,
	LKML <linux-kernel@vger.kernel.org>,
	Baoquan He <bhe@redhat.com>,
	Christoph Hellwig <hch@infradead.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Oleksiy Avramchenko <oleksiy.avramchenko@sony.com>
Subject: [PATCH 2/4] lib/test_vmalloc.c: Allow built-in execution
Date: Thu, 17 Apr 2025 18:12:14 +0200
Message-Id: <20250417161216.88318-2-urezki@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250417161216.88318-1-urezki@gmail.com>
References: <20250417161216.88318-1-urezki@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch removes the dependency on module loading ("m")
for the vmalloc test suite, enabling it to be built directly
into the kernel, so both ("=m") and ("=y") are supported.

Motivation:
- Faster debugging/testing of vmalloc code;
- It allows to configure the test via kernel-boot parameters.

Configuration example:
  test_vmalloc.nr_threads=64
  test_vmalloc.run_test_mask=7
  test_vmalloc.sequential_test_order=1

Signed-off-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
---
 lib/Kconfig.debug  | 3 +--
 lib/test_vmalloc.c | 5 +++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index f9051ab610d54..166b9d830a85a 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -2574,8 +2574,7 @@ config TEST_BITOPS
 config TEST_VMALLOC
 	tristate "Test module for stress/performance analysis of vmalloc allocator"
 	default n
-       depends on MMU
-	depends on m
+	depends on MMU
 	help
 	  This builds the "test_vmalloc" module that should be used for
 	  stress and performance analysis. So, any new change for vmalloc
diff --git a/lib/test_vmalloc.c b/lib/test_vmalloc.c
index 4ab23e5e772d0..6d65ef725d42c 100644
--- a/lib/test_vmalloc.c
+++ b/lib/test_vmalloc.c
@@ -591,10 +591,11 @@ static void do_concurrent_test(void)
 	kvfree(tdriver);
 }
 
-static int vmalloc_test_init(void)
+static int __init vmalloc_test_init(void)
 {
 	do_concurrent_test();
-	return -EAGAIN; /* Fail will directly unload the module */
+	/* Fail will directly unload the module */
+	return IS_BUILTIN(CONFIG_TEST_VMALLOC) ? 0:-EAGAIN;
 }
 
 module_init(vmalloc_test_init)
-- 
2.39.5

