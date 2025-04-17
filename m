Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 544B3253F0F
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 15:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744903709; cv=none; b=WvGRPvuJyzA4yiJ0o2ZSWd3C6ZZwAvCrwTPEhIX03ZoObTkDmJv5BJcpil/BYiQEl37wfz3OzAEcwxLymnTFcFNtnVTKC7/hMwGZZb/r3hezdVj38kjFs8DSzFLqFSW3dlPlUto8FNfato1v2q12sHD9AiQc+H/80FB/CsyqPGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744903709; c=relaxed/simple;
	bh=58aNuDSV/1coH+KSzgCKJ9r0vxKQuvwoyInBKA+7KTk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=k6u4aIcIB2C9R9m2u8gxeqAySyZJO6TRM0RJ8p4qBSFQrz82bWSA1YZACbIJxxtFdylReKZrKFgloeXjHvv0uyEgo3RzbSJwBHIV66ZrNnUjyBHOcbyIa+yuuT0nYAcurlmKuqRqn0OBjXH8ZbUQH9v7kqGyXTA1eNw1oHE8iGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TdsG4F87; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TdsG4F87"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ac3b12e8518so172509166b.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 08:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744903705; x=1745508505; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1R3MRdqDkFaZ/+jwlONt3pLjf3+vGwtiCGmYLcAAREg=;
        b=TdsG4F87VrHkKNIyEX/8RfDTS2Tn9AXVt03GBqEy+mGdeK7B9R67HDJMMharJ9rED+
         lzGMW4KpkNWy0hmwQFXt4ALDGWnt90bCV9AGEB1vY0JjLV+aEGJzI2hUsiJ2fbofWz0W
         qTeQOPELax4sBYkU9NUNfO8P9mhDFlGH4/OTZtKHjL79+BB0qY4gepBtBrMvRdOtm4jU
         jySwAtif7ROPxVC/YakyfjG8gyxi/rfSm8T2+K+65NYymt9qpedT6eC22BaYnZ9DSsru
         ungewoz6XKqc3FkKszEd9ZtK4s2BFokKzGl+Rl//x3tl9f3QkurYEIEEiDkGOfZKNaYs
         N1JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744903705; x=1745508505;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1R3MRdqDkFaZ/+jwlONt3pLjf3+vGwtiCGmYLcAAREg=;
        b=A0p9vdPMJr7T8O2KBsYdCgTpRmuXG+m8IFvH3QKniKoiwt9npLoYQz7StQ9Y9vmdI/
         5yUnqWBAV9eXQbFZzdEnJ5cFVdZVgamzp0wnL0B/o/tDBkpBPPIYFVqJ2tJZLLCoM6eo
         GiWlSDSzXTQxm6qoJo9taCo3Z++linZzJY7zf8/1SAxUwMCdnj1ExG73TWG45fx2GjE6
         3uabF1jaRcQMEx0zpbGqEfbnJ/CLpH8Yv41/3706oN1fljAbCfF/SV57zhMyfnDht3Le
         6gAw/J8oyMHN2CZCsD0mWdVQTWo3l4HPltNmyK/yuQyQ4OUQLGQZnXYCCIX3virQoFWt
         XSiA==
X-Forwarded-Encrypted: i=1; AJvYcCU15xHoyd4parvDiL+fyKIDK0jr2OlCelPQ8QerH80x1XJ90VAW6ZQjx2MFdoUJdA+BUVvDM5Rzjv2LTIw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3TJlsNaJA1pyqyMjieRkULiD//M98lStV7RtpdLSm5USLVGQv
	O7/ML09L2vSom8bl9B1UFSUlzelSqyi+ZPBJNSha9nKIAhufJFAR
X-Gm-Gg: ASbGncvtW2NLMxZ/DGsYjzWh6JKCVM86K5ro4/zIbP+eVtFHH/xNdOwUT0vcBhpYKat
	uE5QeFM8feMX6V9rtWyQ4hAgzOs9YeZzDddFk6Bp5wYOCjQI33b4+EqdQ1+Avng6LBvwrOcGuoq
	DoaJxuNAnPZ6UkEO78h2fkzaXs+vgTgWWCuBMVfOeSED2C+cDblq4pDLXw34NI5iK13ajvDDu6x
	mFzHr/Zkrys6oZX/SyHturUZ7SUzDaHAD0nLEQpaoplGprtlP+WAz7lMD3P9pYPchyVAlJqHi4v
	C2YD//j87dIYK9ZIsz4XLj/liw72y6xIK6yKSdCZFwdJWD8bUAVSnggXMoPU3oA8
X-Google-Smtp-Source: AGHT+IGlMBrgycpi1/fb1mZCCK/6eKD0DYDLOq4bTQigeaSrlDJxeMxzczXh9uBZMb46tEVT9shE1w==
X-Received: by 2002:a17:907:6d1c:b0:acb:34b2:851 with SMTP id a640c23a62f3a-acb42c047acmr509493366b.44.1744903705286;
        Thu, 17 Apr 2025 08:28:25 -0700 (PDT)
Received: from msi-laptop.thefacebook.com ([2620:10d:c092:500::7:4ad])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ef475d7sm7154666b.135.2025.04.17.08.28.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 08:28:24 -0700 (PDT)
From: Mykyta Yatsenko <mykyta.yatsenko5@gmail.com>
To: akpm@linux-foundation.org,
	linux-mm@kvack.org,
	rostedt@goodmis.org,
	mhiramat@kernel.org,
	andrii@kernel.org,
	kernel-team@meta.com,
	linux-kernel@vger.kernel.org
Cc: Mykyta Yatsenko <yatsenko@meta.com>
Subject: [PATCH mm] maccess: fix strncpy_from_user_nofault empty string handling
Date: Thu, 17 Apr 2025 16:28:08 +0100
Message-ID: <20250417152808.722409-1-mykyta.yatsenko5@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mykyta Yatsenko <yatsenko@meta.com>

strncpy_from_user_nofault should return the length of the copied string
including the trailing NUL, but if the argument unsafe_addr points to
an empty string ({'\0'}), the return value is 0.

This happens as strncpy_from_user copies terminal symbol into dst
and returns 0 (as expected), but strncpy_from_user_nofault does not
modify ret as it is not equal to count and not greater than 0, so 0 is
returned, which contradicts the contract.

Signed-off-by: Mykyta Yatsenko <yatsenko@meta.com>
---
 kernel/trace/trace_events_filter.c | 10 ++++++++--
 mm/maccess.c                       |  2 +-
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/kernel/trace/trace_events_filter.c b/kernel/trace/trace_events_filter.c
index 0993dfc1c5c1..86b7e5a4e235 100644
--- a/kernel/trace/trace_events_filter.c
+++ b/kernel/trace/trace_events_filter.c
@@ -800,6 +800,7 @@ static __always_inline char *test_string(char *str)
 {
 	struct ustring_buffer *ubuf;
 	char *kstr;
+	int cnt;
 
 	if (!ustring_per_cpu)
 		return NULL;
@@ -808,7 +809,9 @@ static __always_inline char *test_string(char *str)
 	kstr = ubuf->buffer;
 
 	/* For safety, do not trust the string pointer */
-	if (!strncpy_from_kernel_nofault(kstr, str, USTRING_BUF_SIZE))
+	cnt = strncpy_from_kernel_nofault(kstr, str, USTRING_BUF_SIZE);
+	/* Return null if empty string or error */
+	if (cnt <= 1)
 		return NULL;
 	return kstr;
 }
@@ -818,6 +821,7 @@ static __always_inline char *test_ustring(char *str)
 	struct ustring_buffer *ubuf;
 	char __user *ustr;
 	char *kstr;
+	int cnt;
 
 	if (!ustring_per_cpu)
 		return NULL;
@@ -827,7 +831,9 @@ static __always_inline char *test_ustring(char *str)
 
 	/* user space address? */
 	ustr = (char __user *)str;
-	if (!strncpy_from_user_nofault(kstr, ustr, USTRING_BUF_SIZE))
+	cnt = strncpy_from_user_nofault(kstr, ustr, USTRING_BUF_SIZE);
+	/* Return null if empty string or error */
+	if (cnt <= 1)
 		return NULL;
 
 	return kstr;
diff --git a/mm/maccess.c b/mm/maccess.c
index 8f0906180a94..831b4dd7296c 100644
--- a/mm/maccess.c
+++ b/mm/maccess.c
@@ -196,7 +196,7 @@ long strncpy_from_user_nofault(char *dst, const void __user *unsafe_addr,
 	if (ret >= count) {
 		ret = count;
 		dst[ret - 1] = '\0';
-	} else if (ret > 0) {
+	} else if (ret >= 0) {
 		ret++;
 	}
 
-- 
2.49.0

