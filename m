Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E7E0241118
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 18:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739040578; cv=none; b=dpmI+4aNDZfLkA5yAHu8HCjuwGxuGjs/WedL59q0Bun5uMUwlEMmbpm/rL0OYIF8QJQ/oEIfYmq3Tmo2JtsRxQzS73EltfSZwdcQnajls50w69Y8dE2uhCmXEY65NmEoTnzuQMgZAU/Nyv6mQTEuptF9oGB45ABzNyUTiI9QUbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739040578; c=relaxed/simple;
	bh=WWpqIh6DPoZdZ6VmTWhgxhVTH4DAK5KjsdvKiNaO6AM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=M0NyqpkfhCkIj290/YgVutYtHGDgLNHYi2lrRAvqMTabM32czfRdsEoshIL3NoDvCjrKYUO52z0lqY/4tXnmZnWWODLLFUHiTTmsMYain0ldr/k1PcceGA7NbPYRx4/V1Zx5SWNYmX3U2ZSn/Uy//DXq0AUMHonnci7K9OVv9yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MbGBuEg7; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MbGBuEg7"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-21f5268cf50so24524675ad.1
        for <linux-kernel@vger.kernel.org>; Sat, 08 Feb 2025 10:49:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739040576; x=1739645376; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zSLmSYdyN5pqVTnBSE3QaZaJyR/je4z0lfhrwlYoiX4=;
        b=MbGBuEg7Dh24XTI5Li6Y+BnhbB67Mo+FQ7Cpu/K0km9gqRCl3sYrcx33hg1OKOwtNG
         e1xqZcOsAMcbODMf09Uo4/dKMubopTufQh6N7pRYLsEy1Mzb1Dh/yGk6a/4Fs9kQsDiq
         EwG9Je64kLgr5WW+bELhQ/ZKpsloyNFf/OjUZoXEXCNUGn4uCsqjN0uS/zwnUhzPrf4o
         mfCdGiFnBEidX5euIw96kbL92h/ldQ0qpmiRV6HVXILJBAfOUYMwdP5Xzaaz1pfsa6D6
         4XUqClaTwQpuSMFBAYXP7zaIHJSEIDzyGLtPF0n531Y0X0IH6O4dLhWeeP8wr0EyJqM5
         OqHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739040576; x=1739645376;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zSLmSYdyN5pqVTnBSE3QaZaJyR/je4z0lfhrwlYoiX4=;
        b=robS/+9asTwoCIK0NrFJZHAFzad4KufW5bCRxKfT+lV/axLJxjab7xKY66unClMR7O
         UAfWGpygZToU3RNESK4GaYOYK48J7eTXMvpW1EIt5pq6XUnJhu6u1pkFqSUeAg5O27lW
         u8GxdRZtYhteWn11B8AZUjAxo3gObW3KOg/8cGCgjp4nD+GzDRwsTHv0UUXP+TePoMS1
         /Dy9biowPydhSQjLnq6+g3RLis6pO0I0Ws3OBQl57itFDZ7GYHXvDNIl1A7my2Z/c8aa
         y0V1r8U82kCkC0Z/BwrmQ1iEWp777BXBXBViFsqjRB6rib32TaXbKg/bdSMpwAEwMmiI
         TzlQ==
X-Forwarded-Encrypted: i=1; AJvYcCVehijxKV/x+iU1H7Wmu7E+M8dhkYImEy3LkpRBYODtmdscaQmZ6hCIn/isDyVK2U4ccst+qYD1RWX4FEI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwgiQ0LOBoyrxwgBxj55jBNWL7t04LXackjeU885RQpjjq7e9vI
	RE8tsuwp3XxYcVpvr6IsiWFfbw4D5bA7sWG778yya0fl8rc9U/GF
X-Gm-Gg: ASbGncsrOUVxuQ6n8sGGirk8diZp+IoirMOR7DXtdS+Akl+3wMQtwQNoWaKhdbMv9h7
	uRpV7LCzSSmKE2Ol5Nu6Nf09w5NSIDR2PtSCFnJ+I6pGOsYvFY/M1SzhV3aEsZbiw0EJoRFz0VB
	+poQBSUHG3UtfKaVV0ZqC3Qr/yj+imYvrCSsnUBFocEUib9dgz5C5Tt/lJtKh9cBmcYVatK9Ev9
	D1M+/3yavnqBp3V/zXO+eDeYBKQSDEsSmhpXuGvsI0srd4PTMz8D5mUuiYg873HoDvzTESr0ZIj
	QWtpYoDeei/XZhVG1PMQAmCFOMKBc0UVJ1cp8CvvHT58OA==
X-Google-Smtp-Source: AGHT+IF3MJ6mgOQzZlCTQJfC7ZUaS7zqr5awqAUBdiEburDReXv2fXFkB22MR4PEJCbxeR95Vt3ydQ==
X-Received: by 2002:a17:903:166c:b0:215:6cb2:7877 with SMTP id d9443c01a7336-21f4e1cbdaemr140068185ad.4.1739040575793;
        Sat, 08 Feb 2025 10:49:35 -0800 (PST)
Received: from vaxr-ASUSPRO-D840MB-M840MB.. ([2001:288:7001:2703:25f5:ea47:61af:a637])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ad51aee5ca8sm4272828a12.43.2025.02.08.10.49.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 10:49:34 -0800 (PST)
From: I Hsin Cheng <richard120310@gmail.com>
To: akpm@linux-foundation.org
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	I Hsin Cheng <richard120310@gmail.com>
Subject: [PATCH] mm: pgtable: Ensure pml spinlock gets unlock
Date: Sun,  9 Feb 2025 02:49:28 +0800
Message-ID: <20250208184928.219960-1-richard120310@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When !start_pte is true, the "pml" spinlock is still being holded and
the branch "out_pte" is taken. If "ptl" is equal to "pml", the lock
"pml" will still be locked when the function returns.

It'll be better to set a new branch "out_pte" and jump to it when
!start_pte is true at the first place, therefore no additional check for
"start_pte" or "ptl != pml" is needed, simply unlock "pml" and return.

Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
---
 mm/pt_reclaim.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/mm/pt_reclaim.c b/mm/pt_reclaim.c
index 7e9455a18aae..163e38f1728d 100644
--- a/mm/pt_reclaim.c
+++ b/mm/pt_reclaim.c
@@ -43,7 +43,7 @@ void try_to_free_pte(struct mm_struct *mm, pmd_t *pmd, unsigned long addr,
 	pml = pmd_lock(mm, pmd);
 	start_pte = pte_offset_map_rw_nolock(mm, pmd, addr, &pmdval, &ptl);
 	if (!start_pte)
-		goto out_ptl;
+		goto out_pte;
 	if (ptl != pml)
 		spin_lock_nested(ptl, SINGLE_DEPTH_NESTING);
 
@@ -68,4 +68,8 @@ void try_to_free_pte(struct mm_struct *mm, pmd_t *pmd, unsigned long addr,
 		pte_unmap_unlock(start_pte, ptl);
 	if (ptl != pml)
 		spin_unlock(pml);
+	return;
+
+out_pte:
+	spin_unlock(pml);
 }
-- 
2.43.0

