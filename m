Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19424282EE
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 16:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746550359; cv=none; b=KzekFjP2ZcBgrVnle55p2iW8p1/9dydePG70CIKZmR3tvBfByeBi1CJ6tBSy5MDb1tSmVjWNrwfjzOuwNpdEhaRo3hyL70lUPPsVv8J0aRtmy7zkt5I1Yl4NfK2RTt9JexCAhcJ6/E0M3D/H0MXiQot/W4H8EO+zQjumT6GwnmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746550359; c=relaxed/simple;
	bh=TLEf2Pzcvp0C8v/GEDQxgC7/p8qcL5R5Kdv15oXjTR0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fsaRkRtnC1mnetp2OXnJyxLOKgW/tc8E4LzrC7heU9JJ3BWqg2npP3IBWnRtplBojl+AnN+6/b0BANeR6hHZMvdEtvDHCdk8K7HHd6aIWy9pgs2cmu3Pxb7BHSJzArrtFNE6F1teYvxPLOeXpD7BrTQSyL2uesR0ytzfg2ZKpdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KApbM2jT; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KApbM2jT"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43ce70f9afbso52043955e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 09:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746550356; x=1747155156; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7n9zohVwGZ6g3FLCLUAons4AXAhGRHvbJSlu2S9PxXA=;
        b=KApbM2jTuTWOo7gjmUTkncy1049oIuzkxPmNXFUEcekY03LYjPih61ZkyctjoPWRjT
         lMWQ8cBWDJfsKu5ZR8m5IByGfZO3sc5TWvxUx7NVeVjmWNbPrD26AT/5uDFuRIFyGc/a
         JhwhxZCKXsEcD/1CHyZ+WhLnFJDFfnBSHXU1GViV+WyiMPCQp+B56mXjEoqJ0B14yFpf
         3ykKaO59pAeoEc9j2NB5AL7emqOl9DqxLiMpPt0gVbQszmNHU7IDuLQslLWpXimDAWmz
         eUVyPF4Fqvi6znOW2VlQ5ZEiTeiyOADypa0RG7Dht6qQScjb8CsJzSBdyaSIwl4VojDz
         YBqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746550356; x=1747155156;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7n9zohVwGZ6g3FLCLUAons4AXAhGRHvbJSlu2S9PxXA=;
        b=VqhHzpLy87Ge5Y5PHeSIoVE7NgtDMs0Y4Lr9TJ4rnQXbpXK53LFMVeinQyjfbJLfIU
         VmadqO9fPhWSOi/qNVjBpn4x5LCtJEZwTOvQf0xLQ1jNtanK2voUj2V0MHunEvuu+2LF
         6DBPj+TgWQjqvaFS+p2uDeVTDlt16v5QtTAYVBjD4BnFt0n1RqRmWjjuimndO/LOLZOC
         GQQmmP7hKycgKYwYyJ5qA6z0OjW5pdh1zBwIiYmLZxaZqDUQb9CPSWJgSw0qB1id8cgC
         dsdgQZbKxcI9yrD0wvTcO/jHXmIK9ZbAY2GAblTe4ebmoZLKLA6UBmy8pDlrF1zRbdhS
         eRwQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqfuYwOcVEypDMrQIqWPHDuuk9EbxHh9/fRSti4Z6x//b4NG/fUalZWAX1TYAf8/zCDO+2ezg9wD4rPZE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzoyxlht3S7Aqt6xZJ6xNJzesIuwdevxMbzc04HJ3OI7CO0UX8G
	jrOTj8HhAn8FNdpBmk0gy0HgnfTxWxCVllBig2J2CN+P6A05Z0gD/Vedcg==
X-Gm-Gg: ASbGncvuj9LYLZUVLtBvN1LGJPYamis+jjLogz7KbY1keBk6edBVEncxyvC3W8mAaLK
	CrB3PqKlgdhdSIdd9qHiIna6TIxfx19gyxZj2NHNYGIW84fjTfUfphhY0xQxc0j1oboTUruoOeY
	QN/pguWfrPKqKm80SJtIGAY6fU2cjGNL0GYBcTbxooL/Npme6qddYu+HVf4PlIiZBLPp+Z40iDZ
	vGV5byHVQqgHG2lkf87lAdKwB7As60OITPvSafYws91XrHWTRzXB6euScBL6cYsH1Eg5Tb8Jx2l
	BV0wkHJ/oIPg73c7QtgW3+9CIGX5tPbMwky8c10BwspWS1e02Q==
X-Google-Smtp-Source: AGHT+IF2WDnfBZt8ylTuRDVXx3D+CUYnnpJmUhoDxfrx7sjqsyfRWk+kkhRqZJWdlBFajGYafhqZxA==
X-Received: by 2002:a05:600c:a4d:b0:43b:ce3c:19d0 with SMTP id 5b1f17b1804b1-441c4933cf9mr105065525e9.29.1746550355906;
        Tue, 06 May 2025 09:52:35 -0700 (PDT)
Received: from localhost.localdomain ([46.248.82.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b89d1636sm175192025e9.13.2025.05.06.09.52.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 09:52:35 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: x86@kernel.org,
	linux-kernel@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH -tip 1/3] x86/asm/32: Modernize memset() functions
Date: Tue,  6 May 2025 18:52:06 +0200
Message-ID: <20250506165227.158932-1-ubizjak@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use inout "+" constraint modifier where appropriate and declare
temporary variable using __auto_type, similar to what x86_64 does.

No functional changes intended.

Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
---
 arch/x86/include/asm/string_32.h | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/x86/include/asm/string_32.h b/arch/x86/include/asm/string_32.h
index e9cce169bb4c..9152d2c0f60e 100644
--- a/arch/x86/include/asm/string_32.h
+++ b/arch/x86/include/asm/string_32.h
@@ -164,12 +164,12 @@ extern void *memchr(const void *cs, int c, size_t count);
 
 static inline void *__memset_generic(void *s, char c, size_t count)
 {
-	int d0, d1;
+	const __auto_type s0 = s;
 	asm volatile("rep stosb"
-		     : "=&c" (d0), "=&D" (d1)
-		     : "a" (c), "1" (s), "0" (count)
+		     : "+D" (s), "+c" (count)
+		     : "a" (c)
 		     : "memory");
-	return s;
+	return s0;
 }
 
 /* we might want to write optimized versions of these later */
@@ -197,23 +197,23 @@ extern void *memset(void *, int, size_t);
 #define __HAVE_ARCH_MEMSET16
 static inline void *memset16(uint16_t *s, uint16_t v, size_t n)
 {
-	int d0, d1;
+	const __auto_type s0 = s;
 	asm volatile("rep stosw"
-		     : "=&c" (d0), "=&D" (d1)
-		     : "a" (v), "1" (s), "0" (n)
+		     : "+D" (s), "+c" (n)
+		     : "a" (v)
 		     : "memory");
-	return s;
+	return s0;
 }
 
 #define __HAVE_ARCH_MEMSET32
 static inline void *memset32(uint32_t *s, uint32_t v, size_t n)
 {
-	int d0, d1;
+	const __auto_type s0 = s;
 	asm volatile("rep stosl"
-		     : "=&c" (d0), "=&D" (d1)
-		     : "a" (v), "1" (s), "0" (n)
+		     : "+D" (s), "+c" (n)
+		     : "a" (v)
 		     : "memory");
-	return s;
+	return s0;
 }
 
 /*
-- 
2.49.0

