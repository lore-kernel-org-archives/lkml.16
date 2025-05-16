Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A5F222585
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 09:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747386501; cv=none; b=uUQV3su4W2XjxNdAShz5+LLc5XLQiVuZC7GmtfCFKerNgCmihGD+GZsD4LStKcD3RFW/gwIJ8HUqc/O341mLR0l/gqIdl5591j22W3oQ8Cs9hSsgMcuHHbNnrrGDAjWwb41b/CgzcpWPIpVL5Ei5VowqopqTk8DGBegrxzFdTXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747386501; c=relaxed/simple;
	bh=smaGGleEejxjqfAldEWMMPvLoqda4k+KzyETRx4MUAY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UdBc31igVNCg/r1swVp6RKyfmR9VV72sVgLbZZt2ZL4OOa30Y9CGqvUmQ6W4VIv4OH9S6UTq4V31M689oyoqS5LVn71rVZ+ubXUbB6iMseMwrgbNYP8M0aD9EUMkW1ZamrWejpakcRJttuUprygWePBS91/HeVSX0ls9Pg6zQR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PZZgXL2P; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PZZgXL2P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747386498;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=AYzkMJfY9KpEMNakQSNDEXTnh5wG0ilXzHjXBYUiPEQ=;
	b=PZZgXL2Pe+lSfqfTHISK0rvx898aJiU0hMhxss4PHVI+JHZQZC11Uv2m7wronosTr1BCrD
	1nvPGpRMHz5rPGPTngXciKrIncOVMFRm8jT4HSA0z/zbZIwWUy/0CTWUycyS3Ckf3I4mlV
	XfLAF8+9VblS1AqchUb/uOZDuWckpZs=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-57-F9kLeZLSMMWzhO-dRBxiPA-1; Fri, 16 May 2025 05:08:16 -0400
X-MC-Unique: F9kLeZLSMMWzhO-dRBxiPA-1
X-Mimecast-MFC-AGG-ID: F9kLeZLSMMWzhO-dRBxiPA_1747386496
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a0b570a73eso1183594f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 02:08:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747386496; x=1747991296;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AYzkMJfY9KpEMNakQSNDEXTnh5wG0ilXzHjXBYUiPEQ=;
        b=aYKEEcAqxW/SXA6criGAn2x034KXWVrSaj0bBZcSx80mieFUGRYC0Fx4Fgk42OQ2AF
         wYmXnMy4xSLg5/pze00E5EKcFIBK8SpAyMxg7Qjn8QoQjHPKhs41PNviwyMxq07RN0vA
         NCagqrmV8PdkGUs2koQbzk3EJKroSaefbmqQuSvOgTnamRDi1p7mdT9zLIQD3TBQSHDZ
         ZAqcDYzdWlPkZCEeOkFVWJrCwaGZhCBpZ1LRDgSWfsrdBfeZEbL9ne544Rp3VeMCuLiV
         ZYMLLFIA1w1Hyfu8tvJTf9V4xH3ITrH0gAMIGH53E19fLtns+Arfj0EBl5t7ofWoLNJY
         Tgdg==
X-Forwarded-Encrypted: i=1; AJvYcCVr94fbtBhsKVhUet4hubQJvstRT/5/Ryh5wHxNV52/4NHQkrbena8WkuraONBirRa1Ywnn+QW/21LA+/0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/2Qlt6Hllx7KqAWL57cPmb7F+rpzG1yAhYSNxaluJr4Q6+UFH
	Hrp5G+RgqqLolRAkRWMJaeqWQLuq2lQ+QP7sRxI25FroOFjYrWynBfBWmcRVk7wW2opbZKUGMTe
	tB3JRJUuHzwTkMaUWHk4HtcT0/JYu2qRY5DalK/raAYi14IKnv2Ex+ewRi/COPv2U4g==
X-Gm-Gg: ASbGncv5Z1K2BqQfsy5QXW0XPjX2ZXgiJ+dpTdsEEnGLhfpkApfDSmBE75cUFBLJJY+
	Z6XNHcnAufEF4o6M94i9UPvYhhdh/4KCSJNB23kXoyhPCDwFdJr+PQU8hARDqDFd8Lh9gxJ2cGK
	PlLa0n6URD3plY/a545FPAvJXGmBCSj0TxZiiRObDSuRF5GsHIJxp8pYmRPrq955+rENoY6QQ86
	aXzUJn8COygQ36TD1ncvt/+SeCOpasYK3C+mGM3H0LzQjE5kvkD10gB2JeqKkF/+lU7fKW4yWPS
	/ko7bDx8/S7yftg2Lmw374HBcdGsLSwaqWsGGISV8lqa/RAu3JxCTjhvjw==
X-Received: by 2002:a05:6000:381:b0:3a2:416:5bee with SMTP id ffacd0b85a97d-3a35c84eb50mr2432482f8f.58.1747386495663;
        Fri, 16 May 2025 02:08:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHEb12haYUakG/IdY2quJ/QV1V8uY/qi3mojQAr4ZbQvCmery+tNhbOyH5M+cPqRCFYDl6TMw==
X-Received: by 2002:a05:6000:381:b0:3a2:416:5bee with SMTP id ffacd0b85a97d-3a35c84eb50mr2432453f8f.58.1747386495280;
        Fri, 16 May 2025 02:08:15 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([2a02:810d:7e01:ef00:b52:2ad9:f357:f709])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442fd583ff7sm25907005e9.26.2025.05.16.02.08.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 02:08:14 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	Arnd Bergmann <arnd@arndb.de>
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] x86/mm: Remove duplicated word in warning message
Date: Fri, 16 May 2025 11:08:10 +0200
Message-ID: <20250516090810.556623-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit bbeb69ce3013 ("x86/mm: Remove CONFIG_HIGHMEM64G support") introduces
a new warning message MSG_HIGHMEM_TRIMMED, which accidentally introduces a
duplicated 'for for' in the warning message.

Remove this duplicated word.

This was noticed while reviewing for references to obsolete kernel build
config options.

Fixes: bbeb69ce3013 ("x86/mm: Remove CONFIG_HIGHMEM64G support")
Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 arch/x86/mm/init_32.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/mm/init_32.c b/arch/x86/mm/init_32.c
index bf5f68b49405..607d6a2e66e2 100644
--- a/arch/x86/mm/init_32.c
+++ b/arch/x86/mm/init_32.c
@@ -566,7 +566,7 @@ static void __init lowmem_pfn_init(void)
 	"only %luMB highmem pages available, ignoring highmem size of %luMB!\n"
 
 #define MSG_HIGHMEM_TRIMMED \
-	"Warning: only 4GB will be used. Support for for CONFIG_HIGHMEM64G was removed!\n"
+	"Warning: only 4GB will be used. Support for CONFIG_HIGHMEM64G was removed!\n"
 /*
  * We have more RAM than fits into lowmem - we try to put it into
  * highmem, also taking the highmem=x boot parameter into account:
-- 
2.49.0

