Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EED5B27B500
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 06:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751871013; cv=none; b=bHKNabmRSwEbMIvBUHq4SIlV7SBiUo8olgbSrd1hwyo0QMRjblO6cyxngfMZRK+s0fNXc4MPJEUMOOXBypm0qjqvP4+f9yU6HRfYcjHCMet5JQPsO0lmRElpR+oDAqeFN9dEh94MXiwz/Ky0OBZkUy77W8a1dBxFDvmknO/3N6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751871013; c=relaxed/simple;
	bh=yySkyAzKw9ZyNy7KrfMmwyacolQBHXtTfXNgEj0CYxg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gd+B5f9axih8V16EYcu/Wsh3J6WdbgDIJiX7dxHjNCZq66uIVW7IlxJfslQqOsqsc/+MBX5bZ7i5UDBgAwTRG738c4A8gKIU9ftMEWulrMp+Eoy2REwVkL6jT44yMMfHNM4lDhN2/h7e7BUW1WjiH8dkXpM/VioDyf7zzl58PLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=QeN9lzcF; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="QeN9lzcF"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2366e5e4dbaso27737125ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Jul 2025 23:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1751871011; x=1752475811; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e83zaooyctJVGMAyfqno/5MLE5GO1gHM6Xp57jXORKE=;
        b=QeN9lzcFeolJxlBX+zujzzwobxK2Gg6SiwflUy05DPo4ug3gvEMhonmN5vdSkicxeR
         pHEMI6SwATKY9gYMbgZgiXstVFINEMrB24meOeTUtl6P4RHKC8hLf9bVMOrmu5Gsyn7b
         j1K3z+yxVMsGNtDL8aRntfd6d8qM6NMFRgJ48U1uioPY4XFVlKYYbTLpETQaCA7SAeDU
         tw6KtNxVhHVzp8nIgUCLbDYHsDPpuDW7Qvk+rSvnHtnTO7Jtix5qcWcC8ikzAsA6E91D
         wJez2vn7Ise6yJlGUmbNuja6Kodpmd83lT+X2Akw4YGa0VWqdEDTYI8KL4J5DY8x60IQ
         b7hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751871011; x=1752475811;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e83zaooyctJVGMAyfqno/5MLE5GO1gHM6Xp57jXORKE=;
        b=o08yILyfCCA8asaoQV17BSXUUqe2rtWfEqaGHHhVPEcZn08cgRNOUjXbkFR/6iMiiO
         t7cgb54UBw5+r3rgogA+hEQwhOUtAnbT3XIgPU//9EsJzf3E2QW2mN+t1cbMw+tnRItZ
         egnh1W0e1CfAd/EoyHcCLuBlMrtSUVgEJ5yzlLPeaH2GdWsqACN1QwqlC7AMT8Q3R0tD
         lnZ/Sbgp7QnKMOruric0kBzDS3XIR5V1/58oed2EoH8il1JOLSaCEZWtZ261eJ1t8RrV
         HpbIhl1EjdzSVVSR8bcuEHTyI/VRkzm2a0F8v6Sz4O9JAH+ASLzbG/6tA0xw0MJy+k9s
         tuPw==
X-Forwarded-Encrypted: i=1; AJvYcCVBSOzENswBEkW9i9WH7WXTKmd3ZEG0aVPKngBm1Qkl7FRQsPlKjZTZsdRBVdB3ZLY/T/QuMROYOswWzGM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMnGPHKhWPJ+kbt3vdTPoMG97/vGZCs0VD5bHRE3cKkuSVbZON
	oKNN6DIWcXr1qTI4FbKPgIaqVIcJ2puDxaRn++SpEkkoasgtrk79ObWX0iI+p8sn42Q=
X-Gm-Gg: ASbGncsApjbZ9hDXtnG7mNbNdBfWKb250rSmLPwS/vln0r5W3JWXXLTqsD6emaIP1wL
	ggEBZVIaF//WP2Yy8b1iFRHROgtt4Wgy6LFpPR4+i8Ed/7/GThanevP2gqsUSlP+jeZirJlq7YT
	N4UsXvBMkpxKSlfeWBkHlJSkSkhWGQHCjZSdwQR40KGPSMcVhZm2NPD5hJTGap/xy2XdbDpqgAy
	ggMucXrfoYw4ROyELRbNXfeCmTA5EwN92jBa7Y0CE+xTzHSpR2qLmxXQ7E9NW/ANRhA2qjOamEQ
	loPWCzkY7EVd+ywPTdgj5XbdFW9i5ci3L6rSui/zDHCBUNx1YUpLPtohNxaOHJOQgnSOvv28cX1
	lZKTSTgehmpTi
X-Google-Smtp-Source: AGHT+IHZIatv+CFtPNahfbucN1jWL70KTS2wbiORevgf6e2vHgPOO4LbLUKtKdQFdYuPICyB+irnmw==
X-Received: by 2002:a17:903:1ce:b0:237:e753:1808 with SMTP id d9443c01a7336-23c84b9a123mr186936395ad.20.1751871011205;
        Sun, 06 Jul 2025 23:50:11 -0700 (PDT)
Received: from localhost.localdomain ([203.208.189.9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c8431a1aasm77377635ad.15.2025.07.06.23.50.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 06 Jul 2025 23:50:10 -0700 (PDT)
From: lizhe.67@bytedance.com
To: alex.williamson@redhat.com,
	akpm@linux-foundation.org,
	david@redhat.com,
	jgg@ziepe.ca,
	peterx@redhat.com
Cc: kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	lizhe.67@bytedance.com
Subject: [PATCH v3 1/5] mm: introduce num_pages_contiguous()
Date: Mon,  7 Jul 2025 14:49:46 +0800
Message-ID: <20250707064950.72048-2-lizhe.67@bytedance.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250707064950.72048-1-lizhe.67@bytedance.com>
References: <20250707064950.72048-1-lizhe.67@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Li Zhe <lizhe.67@bytedance.com>

Function num_pages_contiguous() determine the number of contiguous
pages starting from the first page in the given array of page pointers.
VFIO will utilize this interface to accelerate the VFIO DMA map process.

Suggested-by: David Hildenbrand <david@redhat.com>
Suggested-by: Jason Gunthorpe <jgg@ziepe.ca>
Signed-off-by: Li Zhe <lizhe.67@bytedance.com>
---
 include/linux/mm.h | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 0ef2ba0c667a..fae82df6d7d7 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -1761,6 +1761,29 @@ static inline unsigned long page_to_section(const struct page *page)
 }
 #endif
 
+/*
+ * num_pages_contiguous() - determine the number of contiguous pages
+ * starting from the first page.
+ *
+ * Pages are contiguous if they represent contiguous PFNs. Depending on
+ * the memory model, this can mean that the addresses of the "struct page"s
+ * are not contiguous.
+ *
+ * @pages: an array of page pointers
+ * @nr_pages: length of the array
+ */
+static inline unsigned long num_pages_contiguous(struct page **pages,
+						 size_t nr_pages)
+{
+	size_t i;
+
+	for (i = 1; i < nr_pages; i++)
+		if (pages[i] != nth_page(pages[0], i))
+			break;
+
+	return i;
+}
+
 /**
  * folio_pfn - Return the Page Frame Number of a folio.
  * @folio: The folio.
-- 
2.20.1

