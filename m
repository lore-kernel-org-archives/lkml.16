Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B53220C023
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 15:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744989353; cv=none; b=IEg90Ko+phLZ1hmFjQqukjToeMCxHpCsSO+UMvSLeDjql9LBL476lr2ISLLfmtiuDr6odDhdH9R5a/5rLpLolgmJkkOkytSVrbCTubeaGYByzBcrc4Cr7PhFFbPJpJjQhipU5oH3uOx3wwT7qlLdvtLaTBEmtn8eNBt5X0ELN7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744989353; c=relaxed/simple;
	bh=KMMnOkwQVuDdX52tnm6wptnXExZOwL/CGPn4GnxI0X0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Z/GqYsSQllNvoUPZ07Y5thGSWpMCumYoz5uwIjYoAAg6MDAUzn1brHfZMcayB5DOkE9My/1qhlz5XLV8qAftoFNvcU1UORJ3GMWVGoULG07rOz+3oEvkDAysaX3yaEbW5gu66xxo5xBeTbMTkN2DLOrAFixw6kQYkanHzsuoeWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T2YyVS0+; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T2YyVS0+"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-22622ddcc35so30572425ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 08:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744989351; x=1745594151; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y7d429vs3u0Qa+Gq2VNqRuv23PSOaLSv/cnB0hDELhM=;
        b=T2YyVS0+rISSs8hiJzqzKc3XUY4LY4kskFZomtfz1fq6LWC5xXyAZaalkSheBMz+al
         zlR/42nSZSs8S53Ce3eVFcMU1qP6c0KIIyc+nD/PSMcs1o/HN+oVPpYi6bvwdD9KrhAs
         Y1wnOR6eGrqgCZO67Z6lcKko3ndZPdm7fEPD/gekwk89nT/AQ96grKmE9NsrSVHflXOX
         K/7o+TWkK3WcJtcTGNqCBX3BlpjZMQIoap0s4EF5u7L6+XNzuObSqdKlw+LFw3Ed/Nkc
         06BEO282eSMBHcSUYkl91ivCAcRNvsgqDzHlBbtS80IfIxKXXIe3aFDrYdDEsqzQQ/Gl
         QH3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744989351; x=1745594151;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y7d429vs3u0Qa+Gq2VNqRuv23PSOaLSv/cnB0hDELhM=;
        b=bBZzRhTwyvZWvc5pXlYy/WOPRsry2j8yiEOZT0DXbojRFzyEWThICnc4PPbnqefrNg
         Z7p1AWgjCd/51NminKaRo16OVf7j1icuZeUYMnAzKJON4TKag3IM8x2qDCSSL2DzeRfg
         krh89j15pmm84fj4baD2H2DQz4ggdtikofzyPV8WHsDeD2KvwyTcxsLPfrK42IqCZA2m
         w4gnBU8W36hjpHs4RJv7CUVNWtvL5s0dG86iet6VVjwQjaMuxBJWcebrkPnyajIPc3uc
         89QHzKuu2vBAXPf6+kJLth/xjyIHE2klMrOYSmVJ45G71gB4KBMT5e4rhFaCDyCvcEHR
         Wc5w==
X-Forwarded-Encrypted: i=1; AJvYcCWk0W10vE783NA5+I5dghnD7IgMhzwEclIqpmd5+F18lYtQmgVOTcvwC8cCe1I/iX6BZHOOBPotQvl6jG0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4a/RqsNZDPwxiZTeXdrpKD+yuVGb8CpczTuSUKrg0dWaTdhq7
	fd2CWR1UNRi+jg+KEg0vodQS4TYHUv5Nw7IC8AWw1oHZ/rmN3vT4
X-Gm-Gg: ASbGncuL1jKgpRqx8OUKxI1OGk6MlQ/1N5g+rIUMPT1i8sDJ1tjHesAJQwGCmQoXsv1
	ZZTqXPEcy4WhYj0b5n0BInoSDzz6yr/hPYrOpdAfjfo9cTZ7T/QzgAjtlWhFZ/mWFIo3Oyh45Oa
	u7o4lbnEMPV8SocvYL9wYZkS0qang283fMnqeJ0j65lbXs86GbYD95RVf1GldrnFj3EZmlVRSOx
	hbeSbHzDjRI1FsC+l18Mo8WWl7AcQ/Y9Mk/CPb1+Ts3XjDRAwD5EvsFYsTCvgQvFmFrnZJMukf4
	gTAVu+v7jWN833eBu9hOu8pBOR2b5VWH25mwQABf15uqDm+Pvw==
X-Google-Smtp-Source: AGHT+IGEscJcgtAIszZfwRLpspqoP3lhJKDr0lTbKFdf5IfgHXsSLhT8pfuCbUq5Yiu/dAxQNQxevA==
X-Received: by 2002:a17:902:ea07:b0:224:7a4:b2a with SMTP id d9443c01a7336-22c5357a664mr41632685ad.11.1744989350792;
        Fri, 18 Apr 2025 08:15:50 -0700 (PDT)
Received: from localhost.localdomain ([43.129.202.66])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50eb48f7sm17920105ad.138.2025.04.18.08.15.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 18 Apr 2025 08:15:50 -0700 (PDT)
From: Lance Yang <ioworker0@gmail.com>
X-Google-Original-From: Lance Yang <lance.yang@linux.dev>
To: akpm@linux-foundation.org
Cc: mingzhe.yang@ly.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Lance Yang <ioworker0@gmail.com>,
	David Hildenbrand <david@redhat.com>,
	Lance Yang <lance.yang@linux.dev>
Subject: [PATCH v2 1/1] mm/rmap: add CONFIG_MM_ID guard for folio_test_large_maybe_mapped_shared()
Date: Fri, 18 Apr 2025 23:15:00 +0800
Message-ID: <20250418151500.14967-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lance Yang <ioworker0@gmail.com>

From: Lance Yang <lance.yang@linux.dev>

To prevent folio_test_large_maybe_mapped_shared() from being used without
CONFIG_MM_ID, we add a compile-time check rather than wrapping it in
'#ifdef', avoiding even more #ifdef in callers that already use
IS_ENABLED(CONFIG_MM_ID).

Also, we used plenty of IS_ENABLED() on purpose to keep the code free of
'#ifdef' mess.

Suggested-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Lance Yang <lance.yang@linux.dev>
Acked-by: David Hildenbrand <david@redhat.com>
---
v1 -> v2:
 * Update the changelog, suggested by Andrew and David
 * https://lore.kernel.org/linux-mm/20250417124908.58543-1-ioworker0@gmail.com

 include/linux/page-flags.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index d3909cb1e576..6bd9b9043976 100644
--- a/include/linux/page-flags.h
+++ b/include/linux/page-flags.h
@@ -1232,6 +1232,8 @@ static inline int folio_has_private(const struct folio *folio)
 
 static inline bool folio_test_large_maybe_mapped_shared(const struct folio *folio)
 {
+	/* This function should never be called without CONFIG_MM_ID enabled. */
+	BUILD_BUG_ON(!IS_ENABLED(CONFIG_MM_ID));
 	return test_bit(FOLIO_MM_IDS_SHARED_BITNUM, &folio->_mm_ids);
 }
 #undef PF_ANY
-- 
2.49.0

