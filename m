Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53CFC286430
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 06:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751871031; cv=none; b=Ef/Xq2FBTJirlXQd5C/SSHIIXQo6/Su0y5s55ABcNtrFlpDzpv4hwFTyXon86vuFklaSbmFOV+R1UgNCneSghPrSXqbUTymrdtU1cKXvsxTie1pkuh6vrif04WCmrRn3UnC3qTvozc1eWg7GActrhWrwXM4CjcHa0LE7r4EdFUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751871031; c=relaxed/simple;
	bh=/B2Cmebs2wx0RR0cS/Zre9jsbWIH/bpLwhd4AwWN4Zs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cjYEzXmEtuhsE6o/NZi1jaQ2SoANlEcpCztZOkZgyzx2oRd72MHgfMjqqEnGjq23nZkNwPu//tBGEIsgUJX2/i+eGAnl5OfRVnUlNxl27f3/KobhAkTRc56dAH/u7uNscqIy7v0+8dW2oLYoAx/Ktf5kPBx1off3lPFF71flU30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=ZyRrB7mX; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="ZyRrB7mX"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-236377f00easo34413035ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Jul 2025 23:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1751871029; x=1752475829; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=90En1W3zs0tALEbbRQaodK/vejigNx50ns8gS3LDvBw=;
        b=ZyRrB7mXt4+uVJYdLr7VzAMd8qE6RFZp1yalP7Zp5KCelemeFiUsUzcea0CHlZyA2z
         y/np/lMT6W8Xywhht8pfKxEz0n4EBT3pG6IKynHHjy/wRdEhOwAwU8o1awIRg6rIOjNA
         eOOFlKR8pqhaVO/ntznKeNXNDEB4+pcX6albrPxw0U9xYCdqDJ/5AuYkeSgAPKCaFtzm
         1u4KqnKgypID2+ER0d2PeR5T2R2zSzy8p0mXT18GQ+q0TcEW9og4Dqs96syz3swbJSE+
         PgHjrk2vzSmWNIzbiKKBheJ9ZBJe/j96kAd7uq0WJ+jjIw7qJFOTsRt9cMeVgpeKr91M
         Lchw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751871029; x=1752475829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=90En1W3zs0tALEbbRQaodK/vejigNx50ns8gS3LDvBw=;
        b=E2w916tH+X0KFbEI7CPquQ4UtXSZt9M99gACXVLtho20pPuraYq7H0FpNjZVJX+YRb
         uKdb4pC/rwOGc0Gd8mHXTd73+RGofxU8kTt2Zok4NegC++u2jy1R5EoWeTU2ZgMN5sTX
         0x9TjmV5/G935ngZwV7pK4wh4H4TQiD70YK8d3rgKYgbAEwdWGMd8B+Z8g9iR3azzOXS
         /R+8TwAZCm3De/3b43QevznKa10Gm3ft0D7WeJGPwjkgTs+WW8Qj85saOVCaE5rruCp4
         Jn5Auuy/TjJ5vnIuPnEdFCEm3XWDyvHvRLMq/Qm80wRyl65l7XlfzJxQGW8iA9+4K9X+
         Z7BQ==
X-Forwarded-Encrypted: i=1; AJvYcCXaXC9ZBg39FpZHyD4Hn0Hu1bORWv1gA97371xtMmDmB/ndgi6veUBFjKAC+O1arzjR2Yr6oeh6gWD1j0c=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdTQU4sANKheuUlLt5Dx9bFm5GszEfopvbstuOT+KBF0ahLawa
	VJbvBQ/4qnzekVRtiea/3aF5SYeDf1ZeM8fQYdztYM5M7CqKwWH+jb6Hpn5ff5BOg1EnD6doXQz
	gBizI
X-Gm-Gg: ASbGnct0GcI9qbCuOhbIVNDsMjuerud1qn1t8Krq662YmCkHHDkvbNzBZbS+MEGJYy7
	nzUbyhZsPAygtwsJ++Xum0BWku28cAwGSM2Xv33nOcSVRlLpDpqHnVEB8cqlM4EP/bXuVa8jJQf
	XdbAlh4veDe1vlc0uhukv2JYqX6pgSMkKg4G0irycYMs9QwPZEneGswCQzB91HwVSjx7dyKkWXm
	qO60pMPiIe9yrxlS7g4ujk8jSFhGt1YJc44SeSr1tj+WOJWxlO/jOGBe7z24B2XW/uKcp8oMphw
	Iix6O6vvlFNeDLODNY5OfXw6gTTVR036Z6NlEClJ0ssNC9y1pA1xZP7iWEsOckiUtnU0pmgY3KC
	T9mZfpa+XS0JJ
X-Google-Smtp-Source: AGHT+IGk089Voe8sYujhmiUPCIl62YdQ2hxYB5OqRb9ETbkQLoZK53+o1hrm29Rn78YQ81hdAXergg==
X-Received: by 2002:a17:903:1446:b0:235:e942:cb9c with SMTP id d9443c01a7336-23c85d9f014mr192498945ad.5.1751871029513;
        Sun, 06 Jul 2025 23:50:29 -0700 (PDT)
Received: from localhost.localdomain ([203.208.189.9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c8431a1aasm77377635ad.15.2025.07.06.23.50.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 06 Jul 2025 23:50:29 -0700 (PDT)
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
Subject: [PATCH v3 4/5] vfio/type1: introduce a new member has_rsvd for struct vfio_dma
Date: Mon,  7 Jul 2025 14:49:49 +0800
Message-ID: <20250707064950.72048-5-lizhe.67@bytedance.com>
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

Introduce a new member has_rsvd for struct vfio_dma. This member is
used to indicate whether there are any reserved or invalid pfns in
the region represented by this vfio_dma. If it is true, it indicates
that there is at least one pfn in this region that is either reserved
or invalid.

Reviewed-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Li Zhe <lizhe.67@bytedance.com>
---
 drivers/vfio/vfio_iommu_type1.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
index b770eb1c4e07..13c5667d431c 100644
--- a/drivers/vfio/vfio_iommu_type1.c
+++ b/drivers/vfio/vfio_iommu_type1.c
@@ -92,6 +92,7 @@ struct vfio_dma {
 	bool			iommu_mapped;
 	bool			lock_cap;	/* capable(CAP_IPC_LOCK) */
 	bool			vaddr_invalid;
+	bool			has_rsvd;	/* has 1 or more rsvd pfns */
 	struct task_struct	*task;
 	struct rb_root		pfn_list;	/* Ex-user pinned pfn list */
 	unsigned long		*bitmap;
@@ -774,6 +775,7 @@ static long vfio_pin_pages_remote(struct vfio_dma *dma, unsigned long vaddr,
 	}
 
 out:
+	dma->has_rsvd |= rsvd;
 	ret = vfio_lock_acct(dma, lock_acct, false);
 
 unpin_out:
-- 
2.20.1

