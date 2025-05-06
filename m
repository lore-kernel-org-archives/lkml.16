Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6EEF28002E
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 17:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746551008; cv=none; b=mBYhge+0oh8PgZWi613Srn3vGJrddBlH1GhYYGTaeTSRMBT7Uejy0YqWRuZpNwJIE/qednselukB5Yq1utN3VQrJMWtnLjemrqC9LPv6m8aT4LtK/eDimNtDF7cMmpQCXdifEjvaqYnUc0ZZZthBGcpD6wDRJNUZERGWUY7girk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746551008; c=relaxed/simple;
	bh=oAZmhMH/J7xZM0RB3kIseO4CGKpKwCQ/2uk3SmifGys=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=In/4MOZoPV0f36T0lFfTVGOB5+pucwhY2WtK0LtLL0/8ousqh3x3SBxTzXJqE4rl9xk3bGl01ft1DchIqOInJfyMCUBbkJI/F2TsrxOVHU9B5t7fAAs1KXu3+/7SWRio6JocYu/flYbqEhkSb6sm2EskVqBjwqulykaQhWdVfTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JozH4/0V; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JozH4/0V"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43cf628cb14so555235e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 10:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746551005; x=1747155805; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/CCnLyjkaGTMbxhwfFBlgGdaiHRaA0exvf0TsA4hrqk=;
        b=JozH4/0VZOws8RUiRW7wpuAv3tBk51T19yjZEKUz6sA8vKs3tP+GpG7PAsm+jeWpq7
         rsq6Owg881wSfyMQO8bzdJz9eIBEwyXPUUSlbB03iaPZjc15SlP7aAGojwfv+CToSOIM
         j8AUo9RSFILkVDhEkS7klZWsIKGVX89NddLUQdQ1+3UmTcWXQCsFWzAfB9LAPh/suzwC
         egeRkSvviXCekhSQ+i/HTXRouksJDqrBWqAJwgh243Rkoyxz3r3RINKWM4PZFZkJ70NH
         obQnlv1yqtdfD7hBx0VIf0YEcHyZKEya41mMg2QAKyYICJ6pqnpGk5v2HekDis04V6IY
         u4lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746551005; x=1747155805;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/CCnLyjkaGTMbxhwfFBlgGdaiHRaA0exvf0TsA4hrqk=;
        b=nJL0ieqe1JPJD0QIy+UaS4Z4hh5Lroww4mWWzxUv6qMcZ1LDXHQ4YmkDuEWon9JuB7
         XyfQgDXP9vmuv6MknIRz6vgMMG5F11klp8Dk/EO9zuwFY1JdB2EavrvmFmBOpXSISYQD
         C64Vlsj6NJhRgA/1d15s2t8AMp39zOrcp0wxzOq7oGq92/S2PMWo2j1KJDPiAN2X874f
         7cerc4fKsGQCvIfeF8XctOYBzgBCz/uznVNny0jWWA9OieMAobH3u5AU61I+wwSCnK0H
         6dtWPecKxzLorBv1ZMaxkz5KMoD2nTpDrQvjjWULAQzu3FIWp4lVD0Si8c+jm0RMWxkb
         3pGA==
X-Forwarded-Encrypted: i=1; AJvYcCXkzIwf/6xE0zPSVpD+phBEgvOKcRK1OVkzWqgJ/9uNrMVrwW8/KhePZN4R2nDNmAN1jT7EeikRIJ8adlM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbjyV/W1xXD+gtPRY1TbfPtUuUxdGzf0GvYgVSwiTTOrZjju0y
	ZtiqaUfq0AASYQ0KWXu2Oh9KI0Lc3JMXbfXNjSaCZcbTFeQ0Dbai
X-Gm-Gg: ASbGncsymf8nVrXoVQHk/rfrOSrEFrH5Du4UeQP0HYV27T4JuFPHkNUK/yaK2ZlvYuK
	KHuMHVDt9OThgd8nP+jREXF54wur0hRGuKx63Dfdqgh6c1C3ZRL7eJw0ykJiIROphdaf3Ml+iZO
	1rxtGpXcE0cw3ZXUXBObcir2GRg8bfW/d/22zsp05Yo3XaLc1HByhr8+NzXuLBy1LSXoVoa7oRG
	NivHO27f4lr/i+aR8kOwcgiq9sPiTHlAPqJsuRxoYmmn+zqPqzovnX+kcoFqfm/XXv6n6Mc++pl
	Y+ZIri8HYjV/JgIxKD0MlxmXWbKWcdfS7B0rRk6i5ZAQJQVI3g==
X-Google-Smtp-Source: AGHT+IGciSgh+as98UaUzEXZ9KKzoL39AppBd0P968eJiBnLcLLJnEAbq7PskIA1zJtpaTWxAgHPOw==
X-Received: by 2002:a05:600c:5291:b0:439:9737:675b with SMTP id 5b1f17b1804b1-441d3b3a794mr5836435e9.7.1746551004823;
        Tue, 06 May 2025 10:03:24 -0700 (PDT)
Received: from localhost.localdomain ([46.248.82.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a0ad54f105sm2738226f8f.85.2025.05.06.10.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 10:03:24 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: x86@kernel.org,
	linux-kernel@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH -tip] x86/asm: Use inout "+" constraint modifier in __iowrite32_copy()
Date: Tue,  6 May 2025 19:02:48 +0200
Message-ID: <20250506170313.197530-1-ubizjak@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use inout "+" constraint modifier where appropriate.

No functional changes intended.

Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
---
 arch/x86/include/asm/io.h | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/x86/include/asm/io.h b/arch/x86/include/asm/io.h
index ca309a3227c7..2ea25745e059 100644
--- a/arch/x86/include/asm/io.h
+++ b/arch/x86/include/asm/io.h
@@ -218,9 +218,8 @@ static inline void __iowrite32_copy(void __iomem *to, const void *from,
 				    size_t count)
 {
 	asm volatile("rep movsl"
-		     : "=&c"(count), "=&D"(to), "=&S"(from)
-		     : "0"(count), "1"(to), "2"(from)
-		     : "memory");
+		     : "+D"(to), "+S"(from), "+c"(count)
+		     : : "memory");
 }
 #define __iowrite32_copy __iowrite32_copy
 #endif
-- 
2.49.0

