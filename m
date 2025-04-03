Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CCDC1CD1E1
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 07:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743665472; cv=none; b=V20H1wEI/rfGCoj8feNRPOmM1wkEsAbd1IMjETVgGlBY6Qf276PNDhM7y7jAPlAvRnofACEhNqgblQHPX+r8HJ4AKKQgOIugNpjct2p9xf5DhmbmNPdIHaxt0wLROH8zVm690LfyPr4VApAP03iRW/HkLQs1Q6wrtVf2JG8IyQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743665472; c=relaxed/simple;
	bh=td/LhCOZ9ulmZmDtWISQ96J9ji0fOpScmC6+mG4au6g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sQAt19jNGBBzb3OmM4n9FLyiFuV4biC2DSMY4YNJLJhiL0Lddv098WVeUOmAIrZRoM0tiiW3Os7bP9u9241goJYZLAIXtTkKFj3PlRA7ktIwC4iD34zYYCV9v12nVwPZpQQn9dDxmbIJTIyMHIzaimvs/NAHfpE+UqJ32IA9EWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WYjtMKmw; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WYjtMKmw"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ac41514a734so95731266b.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 00:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743665469; x=1744270269; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PHlxdhRiBi7NK6pHhTXU5bmFdyj0xmt5hAnqAk+pgNo=;
        b=WYjtMKmwAisEU6jLsk9KwY6xxSiVry89mPJjLGbmgbTFHpvogWvfNojWs8r9TS2Rst
         IyISeWXpxQl9MD2xqow42joKRuU6sXEf9eKpEUqEBo7ElD1NKSSeMpyUtZHftTK6IyGO
         5ptgoaVjso1ETLgtaPcoW+vxftEKhTD3vzlR99YH8FzDPOhWu2EaWyGoKqZIBc1UkX8l
         QceAFHn2de4mxWzbib7f1aMdSgOUFNM7jdjdweMccsDUuma/pyOmoJTBInhHxJwlv3V+
         pfWgCyKd0mYSiNF9nOARDvPsY+dxceGg8Gpc76OmDXM4/NG3L+aszQ8G9scdU4pGEVvJ
         Wsmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743665469; x=1744270269;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PHlxdhRiBi7NK6pHhTXU5bmFdyj0xmt5hAnqAk+pgNo=;
        b=BMjwQG3gm8AVGceTJsOnIc0O5NevnFQuq1aqR7myAbEvPzKUWFXvgAEmN2cIQ3dbki
         G7zR5AwDAqB4M+O79Pi4m2GJVI1+zskupNuXeXwii+2PBFZoBMo6nBh6DUYxMeX+RwHk
         bhOjmpYjoxk6RBTV81TJ3ktfpNi7PaQ8ckSwuMpyXPW5VzSpP89OMT3FItloHD4r4V6Q
         Oza55InECsiezUjnGD/7FYiTYxFrrj+jcmKGzPiIh52X0R/aFOTpiNei4HLk4n+d1x3s
         i/nVIvIUnmJybT+gJ3xDwImu6FidI1eLd1sdtPSq1+NXaxwJiS5n9xOG+I0Tyw60cO/m
         KXEg==
X-Forwarded-Encrypted: i=1; AJvYcCUKcUzV12tHCJniipYG2CSkvFMHmvuppGWuBZ1i13Hte3/y/1gOrLePGIU4b5dl+g9+elonSftF5sPHQ3w=@vger.kernel.org
X-Gm-Message-State: AOJu0YyuR5XhLmlFZtJzFkURvAE2NnUjV7d/7VpN9xsK0138gzWqgsg/
	kThEXQJcq7tRDLLfynOtm1Vrb+wc98guf4GX6N8UXAB7eWj74Fnc
X-Gm-Gg: ASbGncvjU7BC/RPrySuKJBhYbVsoJ1GtZAGtlfA3cINYvrV4pcyaVgMqyMp9oF7usNv
	HWRFGbzrHO1lTyXmlgZhP4O/YxSF44+f/HbGnJffVWcab2MvSVUxEdgGxnDvVyVTJpZTBoYNETL
	Wxand/ywk346//yel+uNDlEVRexgx9RYDyuzLvKBkYlDPz1//VVda7m3lo7dQm7tsZJOgz3TXn9
	A8KOIezz/sEIVpvbZLOtg/vJD/edJjvOMTwkSjl8Y4lgvOFVwgiASl4tQmcimAYnuxlfd0pHa3z
	+cyfyB0CBOXblYL+5rIwfORTGGiGb9r/MmgZ
X-Google-Smtp-Source: AGHT+IF3m3Pa+ri2YQrPq/uHT4ndj4EJn5uNAvYAKXbqMS5rYBKq8wKdN7ADPGUwBofxHPb81LZ3iA==
X-Received: by 2002:a17:907:6e88:b0:ac4:5f1:a129 with SMTP id a640c23a62f3a-ac7a16c1307mr452552466b.15.1743665468602;
        Thu, 03 Apr 2025 00:31:08 -0700 (PDT)
Received: from fedora.. ([193.77.86.199])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7c013ec0esm48804166b.98.2025.04.03.00.31.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 00:31:08 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: x86@kernel.org,
	linux-kernel@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH -tip] x86/idle: Change arguments of mwait_idle_with_hints() to u32
Date: Thu,  3 Apr 2025 09:30:49 +0200
Message-ID: <20250403073105.245987-1-ubizjak@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All functions in mwait_idle_with_hints() cast eax and ecx arguments
to u32. Propagate argument type to the enclosing function.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
---
 arch/x86/include/asm/mwait.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/mwait.h b/arch/x86/include/asm/mwait.h
index d956d1be4873..1e7b2337ff17 100644
--- a/arch/x86/include/asm/mwait.h
+++ b/arch/x86/include/asm/mwait.h
@@ -115,7 +115,7 @@ static __always_inline void __sti_mwait(u32 eax, u32 ecx)
  * New with Core Duo processors, MWAIT can take some hints based on CPU
  * capability.
  */
-static __always_inline void mwait_idle_with_hints(unsigned long eax, unsigned long ecx)
+static __always_inline void mwait_idle_with_hints(u32 eax, u32 ecx)
 {
 	if (static_cpu_has_bug(X86_BUG_MONITOR) || !current_set_polling_and_test()) {
 		const void *addr = &current_thread_info()->flags;
-- 
2.49.0

