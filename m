Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0478728E0F
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 15:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745855854; cv=none; b=WKzOu+4IWKOYaLTBtMtgo/6suepFiVKhhmilPTOlpSZ1fytXSgYTPoKjP6P64DiFl0+FxSPkerdrXXguTy2fqLRAZrbvJPXyyh/7AHkWlzQqDrvvYUPJoqyYzNTXNuv/Piw6p782bOQ/LsTVwFgsYjOy6NPPGarh+2Cc/cF1/fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745855854; c=relaxed/simple;
	bh=/+ElyNpYM8zyHS9izkAr7mmwS9VGIpfHbMxX+MIunwc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nzjEIdD+7Hg1qA8QYzd892VC4l/G/UovIQxwvRVj2pCpE0rUtcFZMPhDOncFJ342MAryoe9STs+jdrP67xB+AFMd5sq9gZME1F4GbO8yUCfG1ybp3gZEiiErG5JEUAdAKaCqcTSY57MKeF7hnVhdOjfZcvEkgczij+XwPqgRrNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b=HY3YA+Uk; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="HY3YA+Uk"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43edb40f357so32928345e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 08:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1745855850; x=1746460650; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h8k8GbusSWoHhblzsaJpqJaQkqdvemo/Ic1QZvAiFIU=;
        b=HY3YA+UkHlLcjUBi0+rFi+XchRCSPBixP4Lb8AJ8BKR54liJiPnGGI9TyJnhe2G1s8
         y0bDZsQUrCNH/NgkVaGWYLs7O1ztL8BPX69sruQpbCfEKo6EHWu7QPiqV8FOO6jlD3XO
         Mmo9ySh+KeeN4KmUWEBpa7wauCkCf7OzufZJs0dOF158QhIlvN3NsmY9IQhMMXgm3Vfn
         9qjzRMCHPQ3fHWCioU1sUguDgQwtwnfzy+Xb8wi3FTfnx+P+5qh5HBxCou43QmRT9T6h
         O1wg3sQjxrQbar6hSODTz3q0ckHVNjIq146zMUZ1ecEN2uCJABL4oequfgiP0GyP+o9O
         AFfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745855850; x=1746460650;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h8k8GbusSWoHhblzsaJpqJaQkqdvemo/Ic1QZvAiFIU=;
        b=PzVi7S8zMkSGnFo98hb7pKJe6ntJ9ehC7w8+MAYlXPiP5LBF7NiAMlSZqrQ5eVwHd7
         BalHe3k52MPOAEGIjbbZjBG2GdDeFV2UVyqc0yRBjFBYTd/L4R+SYc10ksV8G1e7/0zg
         40SuEbSO1blnN2PU0tDPY7fKQIakTLirxq3hdFB/XFH8vqsnskLK20XHqw/LmqkTA7kW
         CSyZCLW4mPKfbRxnyyZ6NQDPOZB6QDXSCZWCI5yP3IqEh3RcGqHG9CVs2xfApCJW1zTk
         LqULvuRoFyCOdIR5bsZChAYr+bvHT27R5gVeKT0hjC/P9XBPv2fQ1L8Pc1GnX5UssjWK
         o6WQ==
X-Forwarded-Encrypted: i=1; AJvYcCVa4OCax705OJ+Tv/Ci/x/ubHXTfnFI6aVanSh7GyQDfSAd9lsd6VaqVkZTj5WImAWmubNYmhrJh8lW37M=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUgrgW7gPzIbwi0Q18/EqInRab77lSKpwNqUAmqjvN8uf+O2Ay
	J43T9rR0n7+EedNWJAF2ekXZwxmpvo3ZC/rUDer/gWebySb8LUIDARZN0N323ghZ0uZqySSxIY5
	O
X-Gm-Gg: ASbGncvEfFeucyY+2gSmeg+hw7/Rmsp/ThlV6m/qCIiZfv0fnLpeBY/0Lsg/YXOt9/o
	9eRT4/xNf0jTJhqkR6q3K6NR6+K430WcwLOGjOLjM+wkr3G65V0AAtb2pxuXP8h+/HGJL2UDXfT
	YpFA+XZP9xd+VdgVO+altLfvyuJwf83iRFxxRGTaAgKriP7hJ89i3mK8SH3Rsb6QIuSAQmoZdkT
	UkbVf8dSa4Hv4xRUvUtTnA9GYktIO7MrGZqPVq8O1x7VwmFt2QwB/a8l08jmY1+0COHX74g9Lff
	JKCA+T79iM5oc4F4j4H65+B6AgC45VC854CzPo+B6S3v1qBm8u/q5yR/bUWOkuJZcmivVmJIb/s
	D/GF60fVmp1/NwFxGHNvCOU6Skc53IbxG72wUfQrf
X-Google-Smtp-Source: AGHT+IHgzKEUKO80zi/b004bjiVYBj1oQPb9A/FB2EBufBGzxcyqRgqJT39mMOKpdJ8YmxsiPshzyw==
X-Received: by 2002:a05:600c:3d05:b0:43b:c5a3:2e1a with SMTP id 5b1f17b1804b1-440a65c5643mr108737965e9.2.1745855850327;
        Mon, 28 Apr 2025 08:57:30 -0700 (PDT)
Received: from raven.intern.cm-ag (p200300dc6f46c100023064fffe740809.dip0.t-ipconnect.de. [2003:dc:6f46:c100:230:64ff:fe74:809])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a5a74314sm132398955e9.4.2025.04.28.08.57.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 08:57:30 -0700 (PDT)
From: Max Kellermann <max.kellermann@ionos.com>
To: brauner@kernel.org,
	dhowells@redhat.com,
	linux-kernel@vger.kernel.org
Cc: Max Kellermann <max.kellermann@ionos.com>
Subject: [PATCH] folio_queue: remove unused field `marks3`
Date: Mon, 28 Apr 2025 17:57:25 +0200
Message-ID: <20250428155725.3231451-1-max.kellermann@ionos.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The last user was removed by commit e2d46f2ec332 ("netfs: Change the
read result collector to only use one work item").

Signed-off-by: Max Kellermann <max.kellermann@ionos.com>
---
 Documentation/core-api/folio_queue.rst |  3 --
 include/linux/folio_queue.h            | 42 --------------------------
 2 files changed, 45 deletions(-)

diff --git a/Documentation/core-api/folio_queue.rst b/Documentation/core-api/folio_queue.rst
index 1fe7a9bc4b8d..83cfbc157e49 100644
--- a/Documentation/core-api/folio_queue.rst
+++ b/Documentation/core-api/folio_queue.rst
@@ -151,19 +151,16 @@ The marks can be set by::
 
 	void folioq_mark(struct folio_queue *folioq, unsigned int slot);
 	void folioq_mark2(struct folio_queue *folioq, unsigned int slot);
-	void folioq_mark3(struct folio_queue *folioq, unsigned int slot);
 
 Cleared by::
 
 	void folioq_unmark(struct folio_queue *folioq, unsigned int slot);
 	void folioq_unmark2(struct folio_queue *folioq, unsigned int slot);
-	void folioq_unmark3(struct folio_queue *folioq, unsigned int slot);
 
 And the marks can be queried by::
 
 	bool folioq_is_marked(const struct folio_queue *folioq, unsigned int slot);
 	bool folioq_is_marked2(const struct folio_queue *folioq, unsigned int slot);
-	bool folioq_is_marked3(const struct folio_queue *folioq, unsigned int slot);
 
 The marks can be used for any purpose and are not interpreted by this API.
 
diff --git a/include/linux/folio_queue.h b/include/linux/folio_queue.h
index 45ad2408a80c..adab609c972e 100644
--- a/include/linux/folio_queue.h
+++ b/include/linux/folio_queue.h
@@ -34,7 +34,6 @@ struct folio_queue {
 	struct folio_queue	*prev;		/* Previous queue segment of NULL */
 	unsigned long		marks;		/* 1-bit mark per folio */
 	unsigned long		marks2;		/* Second 1-bit mark per folio */
-	unsigned long		marks3;		/* Third 1-bit mark per folio */
 #if PAGEVEC_SIZE > BITS_PER_LONG
 #error marks is not big enough
 #endif
@@ -58,7 +57,6 @@ static inline void folioq_init(struct folio_queue *folioq, unsigned int rreq_id)
 	folioq->prev = NULL;
 	folioq->marks = 0;
 	folioq->marks2 = 0;
-	folioq->marks3 = 0;
 	folioq->rreq_id = rreq_id;
 	folioq->debug_id = 0;
 }
@@ -178,45 +176,6 @@ static inline void folioq_unmark2(struct folio_queue *folioq, unsigned int slot)
 	clear_bit(slot, &folioq->marks2);
 }
 
-/**
- * folioq_is_marked3: Check third folio mark in a folio queue segment
- * @folioq: The segment to query
- * @slot: The slot number of the folio to query
- *
- * Determine if the third mark is set for the folio in the specified slot in a
- * folio queue segment.
- */
-static inline bool folioq_is_marked3(const struct folio_queue *folioq, unsigned int slot)
-{
-	return test_bit(slot, &folioq->marks3);
-}
-
-/**
- * folioq_mark3: Set the third mark on a folio in a folio queue segment
- * @folioq: The segment to modify
- * @slot: The slot number of the folio to modify
- *
- * Set the third mark for the folio in the specified slot in a folio queue
- * segment.
- */
-static inline void folioq_mark3(struct folio_queue *folioq, unsigned int slot)
-{
-	set_bit(slot, &folioq->marks3);
-}
-
-/**
- * folioq_unmark3: Clear the third mark on a folio in a folio queue segment
- * @folioq: The segment to modify
- * @slot: The slot number of the folio to modify
- *
- * Clear the third mark for the folio in the specified slot in a folio queue
- * segment.
- */
-static inline void folioq_unmark3(struct folio_queue *folioq, unsigned int slot)
-{
-	clear_bit(slot, &folioq->marks3);
-}
-
 /**
  * folioq_append: Add a folio to a folio queue segment
  * @folioq: The segment to add to
@@ -318,7 +277,6 @@ static inline void folioq_clear(struct folio_queue *folioq, unsigned int slot)
 	folioq->vec.folios[slot] = NULL;
 	folioq_unmark(folioq, slot);
 	folioq_unmark2(folioq, slot);
-	folioq_unmark3(folioq, slot);
 }
 
 #endif /* _LINUX_FOLIO_QUEUE_H */
-- 
2.47.2

