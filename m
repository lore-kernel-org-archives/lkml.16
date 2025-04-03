Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F7292505DB
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 14:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743689492; cv=none; b=jzQ3teM3nFW6kTBzq9+jSWZQXGyi/GcmB/hAih6rwmGVfza4j08FnU++5Rwi7tBJKEfJhH04qcLr01gLPk2zmC7dJYoGjueFOlr5mb+pWb9vQYjdgWkjRWAk1O1FWymsWJHT3CuuOh9Aj+DtVp8exo8BpYdWfWXRZR0bNzgzsLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743689492; c=relaxed/simple;
	bh=RGHJTQze7kvfvQj1ObUvTp1kIBQZdW9W32EHMDx/fp0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=c56Y9ATrSkT+MLPuv4x4GsTTdTicSo9k3jVe8ufpJQIAU4fxD/72Sa4VCstEdx3IRPN5BpWlgV6mERcfmDN/6dBbZ3YruUsIiWcLmRtiYllrproqDqAGQAfL6V7DeXdfvfW7tkap6g5s3u1cHQJpctkf7FJY2zToAyr2i0YvNbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=OxrO0AnX; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="OxrO0AnX"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3912ebb8e88so133788f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 07:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743689488; x=1744294288; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=K0VfW05t/iqaQhnmWEi7FoyTUAy7cc09x7Pm7VnpG3Y=;
        b=OxrO0AnXGHB8utNy37mtE2tTBVzBHZ1hifZQxPpLbJdnpxj7oZq03u8SJZpcMfALpC
         uqYyr4cKGJn0rvx44Cnh0UOuJBXNyzWiFFJ06UNY8xsxHGwKkVD0v3T4a/obHqb4KIXq
         kuwym76/uTCW+hf4q1CFmYPjlQErwXmVrj92lZIkaYWoNfFSkn9P58PhdEPnhS7R5W9K
         3mOPT/thnUWr9If11oDxJVg8g5BXzMmhI/9jp1ZsLJ7/oMPPeOV+9Kcawgm8RVCiPlIB
         bNWI7DHkyyIqB5oS4hi9Yv7qZo20gD6FfJKKihKuYITnXbp48CmiXG6OF82LIm8rNYi7
         kI7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743689488; x=1744294288;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K0VfW05t/iqaQhnmWEi7FoyTUAy7cc09x7Pm7VnpG3Y=;
        b=DWuz+g3CJ6C0YeFr0CXcDyZwK40bDzs4ckC788LF8qPGwwYZjLf1EbaY7KG2armo2T
         fijib2NrVEwKnq+ozmRmUYvScDbVDDPkODcL1ToUeAZaPNCaL89DniW+NiqQdMgSf1i1
         LL1JOBXzj6+VXkPYOt9iJh5mWGj0+wL6mE0ga/qgz/NziUPqR9GKemb4r9MFoyn5l3WW
         YZ/jsR1XMejWPfH1J+n5HRp2Z7jFIlVOaIIyDoLu5n9B7lOprjiQhSjx/HJB8cmzY8WM
         dynjhQpp8a9+SgCIi8xfAI9u0AFjiclq9qyMiDGTCE79T3l3u69/MjnNCSh4Zv4R5K8V
         SSWw==
X-Forwarded-Encrypted: i=1; AJvYcCUctzu0gOE+s6QDNJUU63lgMDIElv7RprB+Wug3L/s0HcTYV96UpC5TJme7Df2PnneqlUzUk8sE8+wzZWQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAVtHpike3gKMiwKvOzGLqKGrdOVZdC/xmjva3dt4oEjY2BRKO
	9k825pbDyH09ig8qb4niO89xH7NyICsSSp8SO44TrYPzZkk7Z0q0W1smynZjUWY=
X-Gm-Gg: ASbGnctcoZkbaYeH6rp5CKT7sisZKd1L5hI3UX/C7of4xv2R+072UD1xziEdPpDD4EA
	MV6RevrlPfcrG0nzvoaCFpbUyoWMGUJ0Ko6oPRlHNujLKSPLFKCzBG/9S7cmBhKavjzstz/OYMx
	5BKvYa3oylSo++fWnYTttyNaHfUIIEtAfZDwSvYgaJT6HJ+Ejd4uyFl5QKLWMXjWmXoH4wdHx/y
	AX765zWQ1HTNeCwh/yRCw7sdmaagNRt1kAxRYdsdycsLdXjqoAarWSjtQ6ZBmI6Smd/AJNNuw9I
	ZfHWtBtNIBDB68lxCjDMDaoAWhPJ2a6BmBR0vPw5KKAipl48h54HEDzch+kSar2JyJiipJGXLpk
	SQahE54G3hs32ZhxY+gXXprZGp1+COXVtOWw=
X-Google-Smtp-Source: AGHT+IHiffo8Q7QbwNeKM3hUk+/mFfPZfaoRh6iLXZTeYovOPnPhwX5QouFrxPFyA5XS+S3AtKDdew==
X-Received: by 2002:a05:6000:4582:b0:39c:1401:6ef5 with SMTP id ffacd0b85a97d-39c14016ff2mr4608687f8f.2.1743689488137;
        Thu, 03 Apr 2025 07:11:28 -0700 (PDT)
Received: from localhost (dynamic-2a00-1028-83b8-1e7a-3010-3bd6-8521-caf1.ipv6.o2.cz. [2a00:1028:83b8:1e7a:3010:3bd6:8521:caf1])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39c301b6778sm1853301f8f.46.2025.04.03.07.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 07:11:27 -0700 (PDT)
From: Petr Tesarik <ptesarik@suse.com>
To: Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Guo Weikang <guoweikang.kernel@gmail.com>
Cc: "Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Bibo Mao <maobibo@loongson.cn>,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Petr Tesarik <ptesarik@suse.com>
Subject: [PATCH] LoongArch: Remove a bogus reference to ZONE_DMA
Date: Thu,  3 Apr 2025 16:11:25 +0200
Message-ID: <20250403141125.271047-1-ptesarik@suse.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove dead code. LoongArch does not have a DMA memory zone. The
architecture does not even define MAX_DMA_PFN.

Signed-off-by: Petr Tesarik <ptesarik@suse.com>
---
 arch/loongarch/mm/init.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/loongarch/mm/init.c b/arch/loongarch/mm/init.c
index ca5aa5f46a9f..7fab370efa74 100644
--- a/arch/loongarch/mm/init.c
+++ b/arch/loongarch/mm/init.c
@@ -65,9 +65,6 @@ void __init paging_init(void)
 {
 	unsigned long max_zone_pfns[MAX_NR_ZONES];
 
-#ifdef CONFIG_ZONE_DMA
-	max_zone_pfns[ZONE_DMA] = MAX_DMA_PFN;
-#endif
 #ifdef CONFIG_ZONE_DMA32
 	max_zone_pfns[ZONE_DMA32] = MAX_DMA32_PFN;
 #endif
-- 
2.48.1

