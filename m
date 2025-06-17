Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ADD2482FF
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 04:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750133932; cv=none; b=O4QfYMh7bGoJpD4Y7FEGFAFLZBF095K7xM6WBHzDlJxy2EaXAw/yAhdxh/kcalDIN/5vTkbH/935iN0RuSDKl32QigbPFdQCLiSITeT+h/5w/K3aQdN+TzU5/GqaEC5nkjTDaJdEa1af3vQU/sMCJXP3KgSMwnoJdFppcJRgQRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750133932; c=relaxed/simple;
	bh=uV3cHhXrkTvBqdB8VYyLYO8kapwhTK0/BJjfokGJUfw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tn5fKtX3beShn3O8zpkPI1pcJFekVlQXxQF3Kojsi2g4u6XZ1Bqh7DW7eFan8TmGXbcKosbzdxmdgg4efJqIfZutpuf4cTuTC0AjUr+w8BkVEvfR7LIFVsFtjBt5G/hIn5rGg04nAm+7QYS2mMVoyjbevBQbXi8Ssc/O5IxpP08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=dqKbIBxf; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="dqKbIBxf"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3121aed2435so6229614a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 21:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1750133929; x=1750738729; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DSlkXQNydyRdWXir99epy9/y/pcz1kH+JURzeIlDKkA=;
        b=dqKbIBxfKMzQZhBfJkHeUywNq4ozYqp838k/e0dFu5ePWUs0KGP18Bn6oSDP+ef4Ey
         kjzDxKebCQDxcPHqAfX5ky9Isy7sfgIFvZggDen06s1ukKyBVtz+42eTLdkvuZW7gmjk
         JycRyF2FgcHHTcriJBjqhjCq2hMXSbRFBJbTGaEnAD54aAtxvyoHKnR03epDz8VRvNHS
         KbYjtmssu0rWugkUXhzXs0RrQRFZDnioHpxc1PHywbmCgDBcftP7TJmJ0ismI2TgndZ4
         Ms5CrqTjoAqN6h9epJgESlBUXlB1ZP4sXSwvcPMsFSzvSNogGaWsMdkpfQsiuj7ByXdM
         DE0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750133929; x=1750738729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DSlkXQNydyRdWXir99epy9/y/pcz1kH+JURzeIlDKkA=;
        b=ZKt+sTQKcOfpPGk5lS6QR0XsbO0+COqLcYHuQ232UB4pV7Dlk8968F4e6HrMv8HBdY
         6MSnT6YlBzmodD1U3f/nGE7i+V89Cuz0UAUCNyQ0CBsuzp7F10AgsGzy/AMSVlXQth7Z
         GjYBOanjRHrZI4ix7C73EZKniKIb/4qBDGGHeZtOQ4Oe38cSHgoZ5JA835EHzUHpBSEf
         qq9F0tkhrbcf46ZbkwYZ0Gg8xcDLEo5Ls7uWANg1VnbXYQYG4bl7YoHK433xeyWryBDe
         eabJNijZu4cbpOHDoXJuqzd4MvjPnxSq2H7W4huU33/2gfjJv/EsHRyhURoo6Bsxfi6b
         wJVw==
X-Forwarded-Encrypted: i=1; AJvYcCWITHXgulE7E2Ej1qaTX3i5B1pGAPROZiGV7C0fK6vjtDmRoLMb7PVYbcUnMfQSG4Oymi2X//eUkqcZdNA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9xhlh677+5/M+0h4y3OPgzvsY79dToXwWmmQnr/6SLTgC5GEZ
	sX7attrfSBkmtGCXTLkdF+6VhMEurkuQ/NCPr6Itk4fkPyUFgYg2ZRz2+jUfVDkJ2ISgQmngEXe
	FRjKV
X-Gm-Gg: ASbGncsduz2av6b2fZXf2elbwsc9aBLtlqvKovUptN5Rz8D72IpMQqFYLsirvyPDAk+
	jzu9AVzdDm1srMFk+H2Tvd1+1ieuLuzo0JyRu8PeqAZmHtRqY1iGWL+PfC92Ft84rjTT71CmSiZ
	5eY1en2yCI8vrZTguc3qkTG+QoVUeHynXZMIWLX3NqZiDb4AOZBMbQhcIavwWq2Ct3VlHK5gUC3
	/EdRDEo2aBkeOZKQpX37FddZZ2YHiD4peOuldw/RkDmGWK/TtudzoYxKpS18hc1wQJLewfDDbNk
	jvIueRSIckpICjwF4zO0m2niTBymbtylUo4LXcBcpJv6ow8M/9nsfw7NYF6To7hPU7rnjLvp9Qx
	vnNkSVAzwDlP1xA==
X-Google-Smtp-Source: AGHT+IFFsYmbyBpsr4DfeSQEWnhRvRv7gZnPzQ50rJUqNYeidLKzQA3kEEhkN2HqBPK8GrrOI3dAow==
X-Received: by 2002:a17:90b:50c7:b0:312:1c83:58ec with SMTP id 98e67ed59e1d1-313f1c0bcb0mr22561839a91.12.1750133929457;
        Mon, 16 Jun 2025 21:18:49 -0700 (PDT)
Received: from localhost.localdomain ([203.208.189.10])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365d88c029sm69798345ad.26.2025.06.16.21.18.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 16 Jun 2025 21:18:49 -0700 (PDT)
From: lizhe.67@bytedance.com
To: alex.williamson@redhat.com,
	akpm@linux-foundation.org,
	david@redhat.com,
	peterx@redhat.com
Cc: kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	lizhe.67@bytedance.com
Subject: [PATCH v4 1/3] vfio/type1: batch vfio_find_vpfn() in function vfio_unpin_pages_remote()
Date: Tue, 17 Jun 2025 12:18:19 +0800
Message-ID: <20250617041821.85555-2-lizhe.67@bytedance.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250617041821.85555-1-lizhe.67@bytedance.com>
References: <20250617041821.85555-1-lizhe.67@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Li Zhe <lizhe.67@bytedance.com>

This patch is based on patch 'vfio/type1: optimize
vfio_pin_pages_remote() for large folios'[1].

The function vpfn_pages() can help us determine the number of vpfn
nodes on the vpfn rb tree within a specified range. This allows us
to avoid searching for each vpfn individually in the function
vfio_unpin_pages_remote(). This patch batches the vfio_find_vpfn()
calls in function vfio_unpin_pages_remote().

[1]: https://lore.kernel.org/all/20250529064947.38433-1-lizhe.67@bytedance.com/

Signed-off-by: Li Zhe <lizhe.67@bytedance.com>
---
 drivers/vfio/vfio_iommu_type1.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
index 28ee4b8d39ae..e952bf8bdfab 100644
--- a/drivers/vfio/vfio_iommu_type1.c
+++ b/drivers/vfio/vfio_iommu_type1.c
@@ -805,16 +805,12 @@ static long vfio_unpin_pages_remote(struct vfio_dma *dma, dma_addr_t iova,
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

