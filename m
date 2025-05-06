Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21F807261B
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 16:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746550360; cv=none; b=URBXCi8PFX5r29TRSr43iesOg7TWGyZiztG+7fqGsR+gqOoDne21rHMmzfZJq5ZhUOlld96sRDUhxbQvJyi0yjP2TQFLLdcB2Lz2mm8P38O5mNvMZDpOn9jEtsPAmhB1U0RWCz4wNp5mroZjtArkwC6XYklV4+F8gQAWiyCmyjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746550360; c=relaxed/simple;
	bh=ReWttmpdpXfcE7Da7Umqh+YPRY60YzmgxQvETNXEOfg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CjX8j9sFjH3QTYfUoAM+lj3im84dgPeoAhGlhzuUwP77Wfq7r8nM2FqSexJRMCaNxTZXpg6N5eKW1vxb0RY+lUErcQ+Dvlv9ezpA8tLc4vNYu3BzIg4G63JupQAbJccKRqYtzg3iFthqPuCpzRjtYeHMzji9C1ou2CPpMRBUWPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EjLeGVGC; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EjLeGVGC"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-39c0dfad22aso3854843f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 09:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746550357; x=1747155157; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1wlpVfKgV+u5QM/e/Iqvkj6aHp862bAjgPE/Jg1ETXY=;
        b=EjLeGVGCrm2ubDHNl5rcpwrBA7OTqseySHrEaahmAQe3yN6TgWA5hrERE372xVD0WR
         Yn+nb3Q4+7y2u2peMJVghvd38WTQ76p9pkhY6ZOUpJZgflE3TnpO/O4Iv98+HcYPctCI
         9leP3IZm5k7U+M7ToaQ5GRb3AAlYv0thJGzUBAPy0VqDRFbxzcSlAC9iLM9DNPwEpHcs
         8/E8uKyYQYHZfD1eUoP66DYU85p2g9/UdaQQQgAPGdWDk/4ZJGA1gKLUbXn63Kfcns7F
         igwmdIa0vEXCtjTV11wfJZafJ2ILPiaPYQOUan9fatD/rnsNV5eFSh8PDpd4BRJlUvfA
         b+7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746550357; x=1747155157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1wlpVfKgV+u5QM/e/Iqvkj6aHp862bAjgPE/Jg1ETXY=;
        b=hnxdGPu2PAoM9HfIpt6U9sHAB5K9rNmogyw6wShhjND1qtXTzT4elWf+zdVhangU2a
         WwQkmYZqV3I4t8Kzo7lJD+vcLuh4+h1eh2FhyPdNufMrk9BmKqm5P9HSAvn3svrosV/Q
         54LFAz4yc2pdSuZafGXuiR1DZJqXhdnIb0bsEW/GULVJMrlPHg+/wLsvC4x69wX4kqRs
         3Ki9KgYzU5zMwWvV/fCfbCZ0hTw3Wa5NDPIsbIDFQ/r7VQciwjWB0VSoWYn3Ch9IKhbK
         tz3lYZsqYwIU70MUx0ek8dhE/iaTF84JHeCS8STT1GC9ttDdg3wxizscXn6UriLBp+Bd
         R7HQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4OaoXFmwy1BFdoRIzJo4M52KQL8jwnTuKKXIdQ+76eYn5l3rbNclEVePO6+a1PFHXT2ssj06WqDC/rSo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxeDV3xbFRMUI3HdszcxQ92vF04La9GaUrUt/zklKblo1tWIUKs
	6bYeZjWVb2GAeGaTbOZ5nCxPiB/qJSQMdifFvR8LJk62KsVcPLJI
X-Gm-Gg: ASbGncsPDG06MIVmObelC94cy5m2bQWUsnb/9RiXKNJ+GbyA5f/63wqJG9xXuqCYgBq
	fXPK8e63ohweP3iuTcEVRnW0P4IrDWbsAgSkHrWbH+NEHDS1GwpONtWELN6LHOyaczqSai/Sg1j
	lrSSU3oZ84kLfGOwkTYdV0tuLFSjHHyM8qM11o4WHbex5Lk9YZA+Kt1z8Y1bW5Bpj9mTPpBGjD7
	2JZBBvqLUrB6f4iI3uHx2ViBDxSj/3QMQv5KkQ4kZPlQUsJf9YW0NRwEI4wOLgEgDfzXC9h3Hqr
	LVaifBKsNJ4ef0/KIVfnXkaaBLsJ0d3JcqtKMOGwhPZ/Sno2ww==
X-Google-Smtp-Source: AGHT+IHH4L41TxWabr3fJFybEAbr+busrES7vk0ML2vTuSRdqla1qbi+i+mk+EX7T9jUY8eTa+yhgg==
X-Received: by 2002:a5d:64ac:0:b0:3a0:880a:144f with SMTP id ffacd0b85a97d-3a0b4a0280cmr121120f8f.6.1746550357246;
        Tue, 06 May 2025 09:52:37 -0700 (PDT)
Received: from localhost.localdomain ([46.248.82.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b89d1636sm175192025e9.13.2025.05.06.09.52.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 09:52:36 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: x86@kernel.org,
	linux-kernel@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH -tip 2/3] x86/asm/32: Modernize __constant_memcpy()
Date: Tue,  6 May 2025 18:52:07 +0200
Message-ID: <20250506165227.158932-2-ubizjak@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250506165227.158932-1-ubizjak@gmail.com>
References: <20250506165227.158932-1-ubizjak@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use inout "+" constraint modifier where appropriate and declare
temporary variables as unsigned long.

No functional changes intended.

Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
---
 arch/x86/include/asm/string_32.h | 51 +++++++++++++-------------------
 1 file changed, 21 insertions(+), 30 deletions(-)

diff --git a/arch/x86/include/asm/string_32.h b/arch/x86/include/asm/string_32.h
index 9152d2c0f60e..00d497837571 100644
--- a/arch/x86/include/asm/string_32.h
+++ b/arch/x86/include/asm/string_32.h
@@ -52,7 +52,7 @@ static __always_inline void *__memcpy(void *to, const void *from, size_t n)
 static __always_inline void *__constant_memcpy(void *to, const void *from,
 					       size_t n)
 {
-	long esi, edi;
+	unsigned long esi, edi;
 	if (!n)
 		return to;
 
@@ -84,60 +84,51 @@ static __always_inline void *__constant_memcpy(void *to, const void *from,
 		return to;
 	}
 
-	esi = (long)from;
-	edi = (long)to;
+	esi = (unsigned long)from;
+	edi = (unsigned long)to;
 	if (n >= 5 * 4) {
 		/* large block: use rep prefix */
-		int ecx;
+		unsigned long ecx = n >> 2;
 		asm volatile("rep movsl"
-			     : "=&c" (ecx), "=&D" (edi), "=&S" (esi)
-			     : "0" (n / 4), "1" (edi), "2" (esi)
-			     : "memory"
-		);
+			     : "+D" (edi), "+S" (esi), "+c" (ecx)
+			     : : "memory");
 	} else {
 		/* small block: don't clobber ecx + smaller code */
 		if (n >= 4 * 4)
 			asm volatile("movsl"
-				     : "=&D"(edi), "=&S"(esi)
-				     : "0"(edi), "1"(esi)
-				     : "memory");
+				     : "+D" (edi), "+S" (esi)
+				     : : "memory");
 		if (n >= 3 * 4)
 			asm volatile("movsl"
-				     : "=&D"(edi), "=&S"(esi)
-				     : "0"(edi), "1"(esi)
-				     : "memory");
+				     : "+D" (edi), "+S" (esi)
+				     : : "memory");
 		if (n >= 2 * 4)
 			asm volatile("movsl"
-				     : "=&D"(edi), "=&S"(esi)
-				     : "0"(edi), "1"(esi)
-				     : "memory");
+				     : "+D" (edi), "+S" (esi)
+				     : : "memory");
 		if (n >= 1 * 4)
 			asm volatile("movsl"
-				     : "=&D"(edi), "=&S"(esi)
-				     : "0"(edi), "1"(esi)
-				     : "memory");
+				     : "+D" (edi), "+S" (esi)
+				     : : "memory");
 	}
-	switch (n % 4) {
+	switch (n & 3) {
 		/* tail */
 	case 0:
 		return to;
 	case 1:
 		asm volatile("movsb"
-			     : "=&D"(edi), "=&S"(esi)
-			     : "0"(edi), "1"(esi)
-			     : "memory");
+			     : "+D" (edi), "+S" (esi)
+			     : : "memory");
 		return to;
 	case 2:
 		asm volatile("movsw"
-			     : "=&D"(edi), "=&S"(esi)
-			     : "0"(edi), "1"(esi)
-			     : "memory");
+			     : "+D" (edi), "+S" (esi)
+			     : : "memory");
 		return to;
 	default:
 		asm volatile("movsw\n\tmovsb"
-			     : "=&D"(edi), "=&S"(esi)
-			     : "0"(edi), "1"(esi)
-			     : "memory");
+			     : "+D" (edi), "+S" (esi)
+			     : : "memory");
 		return to;
 	}
 }
-- 
2.49.0

