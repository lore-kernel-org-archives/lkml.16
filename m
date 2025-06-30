Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 261B921CC7B
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 07:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751268391; cv=none; b=EjXpsQmuaFfnScdL17OB5BLaHpoCzJQv6y78hbZ9XZrOrGY4QPptCu89ihNwzIlbgkTFJUZ1a2cFw91X03z6Psm28K+KJoDANnjvqdntVL3rduDDwhtNE/eFT1k+8v9THmzq9/oXwudxVd/fCq01NmEwHFw3QvnIujBdwKI1HZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751268391; c=relaxed/simple;
	bh=TLqFs73Rs07kvj6q6zHaiOwcjlhs5jMzOSpM5JzlbZc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BRCq3Oe+ZvI++ENkYFsPzhRUAZhuYEWHMOsk5jSW0+/Jk+mGJS/71rYNtCQAPMz1clnUJmaofI9+jC2Gj+d8iCksL6y2zYER7HWYczYHgoudUehPU1PlsXyMMYEepTuFJkRjtxQzHIF8vPccpoRjxYrzvq5rWI0eTuXpA40IeA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=b1CkWVOj; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="b1CkWVOj"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-235e1d710d8so45732885ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 00:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1751268389; x=1751873189; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gL8Na4RbOeb+mTd/Y2il+QsiGyvEE+fewWwpBjRUgYM=;
        b=b1CkWVOjwJstnDkRN7pIgbg08Ml4IVNzxRjj4IEWq+ylDq/v7pMzQK2bJniMPNmck5
         mq03sYLX43ZpRJOzY7GZBoYtoFZSx9ITZXAiwa/fVS/N1pVdMJZdzBdtJAc81BFAnyr0
         sde4llCtWC657DuFIQKmtrt3xCSCRbQpB+cz/87YHwcPgx459hIL06nb11DscmBHRrWW
         zygXmSFac/Wpl6Y1HfJwI4evAcftAc/0ealbo3RJIdCcV+17Z/TeeJ2o3b1JOKBVTa08
         xVTfT3iSF2R0T0rzsRX6orA3Oj6lXbAVhmXfr4cX7kFeYJ/hRmz0I5mmw1ez/CxBFUpt
         dn8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751268389; x=1751873189;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gL8Na4RbOeb+mTd/Y2il+QsiGyvEE+fewWwpBjRUgYM=;
        b=pb8HE43zSwG/rff1T8E+rSc2oGhltn1F//xcgCFMYP2RSPng8hQKrSeHiOdZQhPPa8
         nOTP+54HxNMID/2Wik2WBUZ+3OsBuB+D9EISaI4cUHtS4zoetDswQnSSEoFGX4FVGMlw
         Vk2vbx0log2XZYHrxVKQUq1TCz0fEkD/MVoY3s5bokfCMAIHT6RMZLbH+Pphx/nduOVF
         rVFzFe0D16GgiEt7ETcd/pZd5MLEbr40AQgDUfBV3aRet2w45RKAsOW9aBa/qPnX/Ngs
         yPnggqyPAIf7DOpNRfKGRsMwE7u8rWAjX5QjtyUZcm8gTDKt22FYPPaDdH4CGbdDe+wx
         EkoA==
X-Forwarded-Encrypted: i=1; AJvYcCXQq3CL9YBBw6VQLrIwltQL7wnu3/Q78ZkDrV03ilWWiFn4WVznl7lGXVLiklpuqaTGaB+XoxJPwNJhk6w=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNUZknnyIOfw2fIJU3Zyp9VefT0vyAhMtbwHYc993+TGyQE1Vt
	4xiUejdmjTUdkNCHY8jASL4A6kis8rDD8I1VYJ9oIF82QSA1pPzP02HuHv6zo8zgx5E=
X-Gm-Gg: ASbGnctWjZ1jo6OmaRDrNfQKoRRQWcHK9Xt8LbG6WV3kZN4TzkoSEga5yhBA3o3MFDv
	fzaG2g5mBoAlsPQZE3zr8OUnK3/WEqc36cu9okymZttzBtgvp79BFHZwu1G8F/1IhA9nPB6mPL/
	OXjyYstmI8FhRU1eZl9ift14Y4xSjy66w7fru9aZ7E7ezdJmfbXHG+Y74cbJp7hYbNJBNz+Wdq8
	yjfsnIFMdcHWIGUE6lptsAfsETVIBaqzzKc4lsx1S9NXgtt1bD7QgGLen4femRys6j2UiPDBXdz
	f6hN2JjVJrV1x80qZJyElrJC89Ran5cg0peTRu/ksMNbjBRlTdBG4YWE/ZwxMmqGY5IBY96N05P
	tu4IMm3aLgiQJEQ==
X-Google-Smtp-Source: AGHT+IFQElYkwq2G8k4uAgKb3u+FK4KZxl8VJVnmY3Eo87tiNYXeh7dgUSv1GRb4rJwPsH61XbRT/Q==
X-Received: by 2002:a17:903:41c8:b0:235:ed01:18cd with SMTP id d9443c01a7336-23ac4653ff7mr243268295ad.44.1751268389195;
        Mon, 30 Jun 2025 00:26:29 -0700 (PDT)
Received: from localhost.localdomain ([203.208.189.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb2f17f5sm77237555ad.62.2025.06.30.00.26.26
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 30 Jun 2025 00:26:28 -0700 (PDT)
From: lizhe.67@bytedance.com
To: alex.williamson@redhat.com,
	jgg@ziepe.ca,
	david@redhat.com,
	peterx@redhat.com
Cc: kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lizhe.67@bytedance.com
Subject: [PATCH 2/4] vfio/type1: batch vfio_find_vpfn() in function vfio_unpin_pages_remote()
Date: Mon, 30 Jun 2025 15:25:16 +0800
Message-ID: <20250630072518.31846-3-lizhe.67@bytedance.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250630072518.31846-1-lizhe.67@bytedance.com>
References: <20250630072518.31846-1-lizhe.67@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Li Zhe <lizhe.67@bytedance.com>

The function vpfn_pages() can help us determine the number of vpfn
nodes on the vpfn rb tree within a specified range. This allows us
to avoid searching for each vpfn individually in the function
vfio_unpin_pages_remote(). This patch batches the vfio_find_vpfn()
calls in function vfio_unpin_pages_remote().

Signed-off-by: Li Zhe <lizhe.67@bytedance.com>
---
 drivers/vfio/vfio_iommu_type1.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
index a2d7abd4f2c2..330fff4fe96d 100644
--- a/drivers/vfio/vfio_iommu_type1.c
+++ b/drivers/vfio/vfio_iommu_type1.c
@@ -804,16 +804,12 @@ static long vfio_unpin_pages_remote(struct vfio_dma *dma, dma_addr_t iova,
 				    unsigned long pfn, unsigned long npage,
 				    bool do_accounting)
 {
-	long unlocked = 0, locked = 0;
+	long unlocked = 0, locked = vpfn_pages(dma, iova, npage);
 	long i;
 
-	for (i = 0; i < npage; i++, iova += PAGE_SIZE) {
-		if (put_pfn(pfn++, dma->prot)) {
+	for (i = 0; i < npage; i++)
+		if (put_pfn(pfn++, dma->prot))
 			unlocked++;
-			if (vfio_find_vpfn(dma, iova))
-				locked++;
-		}
-	}
 
 	if (do_accounting)
 		vfio_lock_acct(dma, locked - unlocked, true);
-- 
2.20.1

