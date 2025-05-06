Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DC3928688E
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 16:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746550362; cv=none; b=hkbFsZiaT2t7I/R0KPdryzNJyociBtCNrA/0uYwM3Ays6X7Br581b0oOj166kSbWpmG+YZWi7FFwDUeFGyc4/7ZzPJTrzqepCSwPf/ykuf7u5j24gjlHN6dV09c4hlV0tZ0JWlZIapstZYjTZQFHFLff81gug2oCppCCAcKetws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746550362; c=relaxed/simple;
	bh=8MhThrImsBpRShZT//Ydj7ASXsdK6HD+Vk/w2VYdDEc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=INjbj/dOfDLcnUGvT+3wqojBPcZ3qzNU5OFTsfyCZdTIiSnLJVDvER2h5H6zuqKsv9rhT7lU461v8fNrcBnESsNstaqkKxCPWLfeUhiOFWi7W1wT3pGuSLCw15bgAXqKIWUqqkb/kqjmGv/k4gefoTYTqit/mIAvewz3fH1iv7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gA+lYcr1; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gA+lYcr1"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-441d1ed82dbso7569105e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 09:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746550359; x=1747155159; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Wd5cuv6rMjJ264Dib97eDoXt4tihklkYw+4xhGbYL0=;
        b=gA+lYcr1bhgRLwd6NhC7uIkqmKrXuW7tJJrwDpmkCN7eb+Eyje+3cBb2wJ7tn8Imho
         RHj1EWKHk58CmpcyG3U242aUpeRnvMq3a0BcJn8sE/I7rcWFrzmOXRv/E8AWn6TymV7K
         Lp1z5bSMZcZyzjNXJHpw4uPzdVioB3IJV5ypFMwdFE+AOT+jHSXoh5P4d+mbPPWSbvzW
         /abGx6ou4ZdbYu7KZUBCwQQYfFnpqOmt2xESbBxyp70bCmt5RnvBSmKJE68SyttRWXTJ
         tTKlHRfw6AY215IYm1fHscbYOKyGTya58we7HdS+fDZYefpVsLztqj1gECBk+fESZ77L
         BTDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746550359; x=1747155159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Wd5cuv6rMjJ264Dib97eDoXt4tihklkYw+4xhGbYL0=;
        b=j8kINMXNC58ntEnv9vEQ1+xKTcGjzfcrSC5AsvmyRecyT5aIvbT19T+D0IpdMuhlgx
         o1wJAzNb1qNsTfWgdF8EPEG5CrADQKOGG1DD8a/axSy939wPROljrXmy32eZiNp5n80a
         tTPN4Ilm/omGwMYTxEzXLKKLjY80WrA4FTIPT+aKP2oHCEUogv2GrBW/zvDZgPi7I6n1
         wH9BX28IiLpQR+aT1dQ/0DmZCN1Dc7jf5taDUm6iTORrZAZ5qLSKip4RpnNQEOWxbicd
         n4a9UhszqfkuGmoGAG78gT3gyeweeUcSCyit7O5Rm0oZ44kmQ9b+d38ykBym7bdJLVyR
         Q0sw==
X-Forwarded-Encrypted: i=1; AJvYcCWj001SnPI8xwX+8KejQgFPIioy4gyalG5qrvT1fjJJ7rs/8LacANupzA0PDdYSg6tEeVo0JnAyIu5Nip8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMbzgsN+7YFj8GTbAOAKfI545F8X6J6+8UUYGGjqd7FQ5gp8tg
	/lkydxNde5Na/MDfWUvRqv5Ktp8jt7lJ8QLxMdxp5UPICfEDltVD
X-Gm-Gg: ASbGnct0hTS0s7Wbi6jrqbRB4hZUhCYNV8XvpkEdWHhVhyZi3FvXMkd2lMqDDYPulKT
	S526b7jm0l+nDQJqvKLoiITIlDOjt4GiTa5J1/sXz4TLj91OBEcnm1zZxOzc3sPfDZ2axRICfit
	kqU8AeRkJETB8SM97TlflpVDWw63UprtVSnFxzKL4SYQ7Il99RCHfCse8b+mAiIfQZLAYT6aiqi
	ipcOTRVqef7ogU+OYpEt1aAkKDouCm/vJaNyoss6v2EKp6iktPul81BKCjrVt4aFh4Zws3w+CjK
	Epzrc+ERQCExDcLoWo7brQM5nbIhh0ih81jJ4pDsnltl1WBlqQ==
X-Google-Smtp-Source: AGHT+IFZZ7oDaC3EBdpttC+ggQBKOTrlmznngjGB16h5p4xdHIHrgG0HNmyREryYpIkm+AeeNjtq4Q==
X-Received: by 2002:a05:600c:3552:b0:43c:fc04:6d35 with SMTP id 5b1f17b1804b1-441d0fbd626mr38803155e9.4.1746550358838;
        Tue, 06 May 2025 09:52:38 -0700 (PDT)
Received: from localhost.localdomain ([46.248.82.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b89d1636sm175192025e9.13.2025.05.06.09.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 09:52:37 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: x86@kernel.org,
	linux-kernel@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH -tip 3/3] x86/asm/32: Modernize _memcpy()
Date: Tue,  6 May 2025 18:52:08 +0200
Message-ID: <20250506165227.158932-3-ubizjak@gmail.com>
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

Use inout "+" constraint modifier where appropriate, declare
temporary variables as unsigned long and rewrite parts of assembly
in plain C. The memcpy() function shrinks by 10 bytes, from:

00e778d0 <memcpy>:
  e778d0:	55                   	push   %ebp
  e778d1:	89 e5                	mov    %esp,%ebp
  e778d3:	83 ec 0c             	sub    $0xc,%esp
  e778d6:	89 5d f4             	mov    %ebx,-0xc(%ebp)
  e778d9:	89 c3                	mov    %eax,%ebx
  e778db:	89 c8                	mov    %ecx,%eax
  e778dd:	89 75 f8             	mov    %esi,-0x8(%ebp)
  e778e0:	c1 e9 02             	shr    $0x2,%ecx
  e778e3:	89 d6                	mov    %edx,%esi
  e778e5:	89 7d fc             	mov    %edi,-0x4(%ebp)
  e778e8:	89 df                	mov    %ebx,%edi
  e778ea:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  e778ec:	89 c1                	mov    %eax,%ecx
  e778ee:	83 e1 03             	and    $0x3,%ecx
  e778f1:	74 02                	je     e778f5 <memcpy+0x25>
  e778f3:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  e778f5:	8b 75 f8             	mov    -0x8(%ebp),%esi
  e778f8:	89 d8                	mov    %ebx,%eax
  e778fa:	8b 5d f4             	mov    -0xc(%ebp),%ebx
  e778fd:	8b 7d fc             	mov    -0x4(%ebp),%edi
  e77900:	89 ec                	mov    %ebp,%esp
  e77902:	5d                   	pop    %ebp
  e77903:	c3                   	ret

to:

00e778b0 <memcpy>:
  e778b0:	55                   	push   %ebp
  e778b1:	89 e5                	mov    %esp,%ebp
  e778b3:	83 ec 08             	sub    $0x8,%esp
  e778b6:	89 75 f8             	mov    %esi,-0x8(%ebp)
  e778b9:	89 d6                	mov    %edx,%esi
  e778bb:	89 ca                	mov    %ecx,%edx
  e778bd:	89 7d fc             	mov    %edi,-0x4(%ebp)
  e778c0:	c1 e9 02             	shr    $0x2,%ecx
  e778c3:	89 c7                	mov    %eax,%edi
  e778c5:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  e778c7:	83 e2 03             	and    $0x3,%edx
  e778ca:	74 04                	je     e778d0 <memcpy+0x20>
  e778cc:	89 d1                	mov    %edx,%ecx
  e778ce:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  e778d0:	8b 75 f8             	mov    -0x8(%ebp),%esi
  e778d3:	8b 7d fc             	mov    -0x4(%ebp),%edi
  e778d6:	89 ec                	mov    %ebp,%esp
  e778d8:	5d                   	pop    %ebp
  e778d9:	c3                   	ret

due to a better register allocation, avoiding the call-saved
%ebx register.

No functional changes intended.

Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
---
 arch/x86/include/asm/string_32.h | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/arch/x86/include/asm/string_32.h b/arch/x86/include/asm/string_32.h
index 00d497837571..6a4062414495 100644
--- a/arch/x86/include/asm/string_32.h
+++ b/arch/x86/include/asm/string_32.h
@@ -32,16 +32,18 @@ extern size_t strlen(const char *s);
 
 static __always_inline void *__memcpy(void *to, const void *from, size_t n)
 {
-	int d0, d1, d2;
-	asm volatile("rep movsl\n\t"
-		     "movl %4,%%ecx\n\t"
-		     "andl $3,%%ecx\n\t"
-		     "jz 1f\n\t"
-		     "rep movsb\n\t"
-		     "1:"
-		     : "=&c" (d0), "=&D" (d1), "=&S" (d2)
-		     : "0" (n / 4), "g" (n), "1" ((long)to), "2" ((long)from)
-		     : "memory");
+	unsigned long esi = (unsigned long)from;
+	unsigned long edi = (unsigned long)to;
+	unsigned long ecx = n >> 2;
+
+	asm volatile("rep movsl"
+		     : "+D" (edi), "+S" (esi), "+c" (ecx)
+		     : : "memory");
+	ecx = n & 3;
+	if (ecx)
+		asm volatile("rep movsb"
+			     : "+D" (edi), "+S" (esi), "+c" (ecx)
+			     : : "memory");
 	return to;
 }
 
-- 
2.49.0

