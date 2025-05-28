Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D212E360
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 05:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748411009; cv=none; b=hdjg8jmeRWLBobG1SyvoMgX7ePH4wNbwPwLjxiiNfrwR2o3oZz8NxFkluxu+8DGQRqC4hBps4Kak8TWEpZUEFlwuwVB8EDhsS1C3QrgPmlCIO5207e5SsgqcCsH8b2BIQyrNH7X38xClkAe5aaUCSLjk4TH98b7rnyWii0KcPAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748411009; c=relaxed/simple;
	bh=UAW4IDmFuxT7Xs53ZJBV5vj6+YrT1J7KuiKlAlHg/1M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=a6WM7lPfc2PnnHpvrziMgg4NcbipNnnHknlyhXMVIDEIKoGV2eRDBBR34NLIxK1EonCx7aqLM4PMMHPLwE43qqtLhmmA4+HZzUsMIT/qEmWQ3jlW06ryu0LVcubE4rHkvBXufZLStgrNb7+GmgVaT/TCp9t9TqDA4fSkuANnUpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com; spf=pass smtp.mailfrom=brighamcampbell.com; dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b=fRXk1oyk; arc=none smtp.client-ip=209.85.166.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="fRXk1oyk"
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-864a071b44bso79601139f.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 22:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brighamcampbell.com; s=google; t=1748411007; x=1749015807; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MSMi/AKPsTMgRd8z+xkRR6U4DbzIU/rPyguhFHTtxoA=;
        b=fRXk1oykMEgWHm0satGojPSt9dFhImudNhhNegIWDII+5lkOy+9iLstUIIdbAtlQB2
         gGm8q6WCfNEniGfKuvEOq7PwbNN/jVUUtBvngM6x/jiTOSXk4aPZAv+Sxt0LMin7ca0O
         0Qf5O73Zo7lyj0wMf3KNGtrErjMuRsTA3ZDNDWkrHcxnVvNxXX3iPUUjytuldVGzD9R4
         YPelZ9OJr2VY2ekiXbTy4Gs5Lal7ebzfvB/jezHB+tuP5Z585JAv3gyDw3CIcs1SGcq1
         gQVS+MYgQbJ302zQYAWX8czTNsNKCI0Unq78HbeWI4pdDneL+/MnneB1vQxKGSOWvy0u
         JDww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748411007; x=1749015807;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MSMi/AKPsTMgRd8z+xkRR6U4DbzIU/rPyguhFHTtxoA=;
        b=VEqINUZNZb1WGLhyfijk3vqTf49+ynO0McirlZGK1NaeDSBhJphAG6ILDaFsYvRrzH
         XPUWcG9kt/WJdMgSiIziandb1uiHfF0eOD28p2OsU+r3bI9Z/7pvnmjZWN0i4Vk+sjTZ
         J0gbsp8Cy3sC7FoLCg+OR+rTwf6L0JA0uyYsj7I4NUJN9D4nxjtQ7ZCt7PifDy7VDxOu
         l9awJJCfP6zfNuAj8ttITzO122Vg2NybpL4VLMSIxVcAmx6uVuAc+lGnh7JBbO4tmzKC
         dgUCg8bo/2VkZyUBEOQ59EMVTp5Do3qBtKb6zFYsGW/Hwh4rg1A2xWs7+sLTAM071ZS0
         ji7g==
X-Forwarded-Encrypted: i=1; AJvYcCXsGY425q4HgxYRoosw0HK8W6625jBWLDGfWOaHDmKBhQD1bTi51Yeyi9I6bILXpg/aXPV+RPVg99YSXsc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4UFSIoqiKAh5cVf7RmVKw+pt6s50LDSW5ZjyDo9E3vElpLwRK
	gHCklTyuZ9kiT5dqcBcKCuLiI0yiOPkWCnQgB5eX5zQQTIxe7rnmU6wixfsCvLfkJ+w=
X-Gm-Gg: ASbGnctOJZC6CS1TgzNyybu6YtrxCDVr2nTLX89wY7h3XPDh/3ASUvHLBfB9VUiyhar
	ipKGTSpOcirGnMMgRTdP9SOUoYbF6o6Omr4s2UwxMaaERJZCvKStc1PVIdqHHxKsXgVJeLbnAzd
	GpzfXJfONUOs4vpRhkfGSFuQ5Nu+xgVS3E2sajC8DTnYatg744ASEF+m5/XJrgOprqhMFRjx3LQ
	B4M/8vAff9q30AL1d0z4bhxlOWU66dXh5HTg/NPDSR4Vw5upCCGv1MqTmJTgXh4ZKCKPP6KQCVZ
	vc3I0epxGS5pie9LVURXh4x1VaecxlY1jSe+LKNSWbl0EzKMyWUK5lQKTJlVboj2gOdbf9g2+9v
	I1+gKlt0=
X-Google-Smtp-Source: AGHT+IF+v7eeJiqgx2CgLK57L91nnP+NaoqNBY3MrpJ58a87hZdHLPE/Eq+lD7S1GC6+xWdZO4pGrQ==
X-Received: by 2002:a05:6e02:1686:b0:3dd:869e:d1f0 with SMTP id e9e14a558f8ab-3dd869ed599mr37235695ab.9.1748411006513;
        Tue, 27 May 2025 22:43:26 -0700 (PDT)
Received: from mystery-machine.brighamcampbell.com ([64.71.154.6])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3dd8bfb2ec5sm1220685ab.1.2025.05.27.22.43.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 22:43:25 -0700 (PDT)
From: Brigham Campbell <me@brighamcampbell.com>
To: skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Jonathan Corbet <corbet@lwn.net>,
	Athira Rajeev <atrajeev@linux.ibm.com>,
	linuxppc-dev@lists.ozlabs.org (open list:LINUX FOR POWERPC (32-BIT AND 64-BIT)),
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list)
Cc: Brigham Campbell <me@brighamcampbell.com>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v3] docs: powerpc: Add htm.rst to table of contents
Date: Tue, 27 May 2025 23:41:47 -0600
Message-ID: <20250528054146.2658537-2-me@brighamcampbell.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the following documentation build error, which was introduced when
Documentation/arch/powerpc/htm.rst was added to the repository without
any reference to the document.

Documentation/arch/powerpc/htm.rst: WARNING: document isn't included in any toctree [toc.not_included]

Fixes: ab1456c5aa7a ("powerpc/pseries/htmdump: Add documentation for H_HTM debugfs interface")
Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
---
Changes in v3:
 - Edit commit message to conform better to de facto kernel development style.
 - No changes to the diff.

 Documentation/arch/powerpc/index.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/arch/powerpc/index.rst b/Documentation/arch/powerpc/index.rst
index 0560cbae5fa1..53fc9f89f3e4 100644
--- a/Documentation/arch/powerpc/index.rst
+++ b/Documentation/arch/powerpc/index.rst
@@ -19,6 +19,7 @@ powerpc
     elf_hwcaps
     elfnote
     firmware-assisted-dump
+    htm
     hvcs
     imc
     isa-versions
-- 
2.49.0

