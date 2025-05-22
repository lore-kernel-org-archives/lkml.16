Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15DF342AA1
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 03:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747885806; cv=none; b=PdRWMLaBU1nBMJ5mDaY3D2xn7Fb/O3uscXKIco4lUqu0OI2U9pDK0Hp6JBvqfApHUkQYDCExs3FObgMgc+2MQMNEbVHDhHscDeAE/ZGw1FLWW9hK9cV2gqPW8fI2VVNS3PtCcgnF/74KWfdoSBl7EeD2Y89iNgoAEUFlZ7y1Qh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747885806; c=relaxed/simple;
	bh=bB2ccB1tvfWV8ZCCgEv0uKtWwqQeKICeZGq4trpOHvE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uDIxUabC6kAMnW9lzd/ydj0BlnEIpUHEv2IUjsV950lvLMzXG6sWdXctDA3wjBmujfGuFXh4RrulXFh8BlzZv3uVyi2p6tookd9FLUdq/jruSJlzQHuZKKZtyy8Zbnr23+vdJfOXmdjVl7OUteE+Tb1JO8h2VPaObc1VbZHA7bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=f72T/MFG; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="f72T/MFG"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b26c5fd40a9so6790015a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 20:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1747885803; x=1748490603; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+R8i+ruO2bwbFHlWkEQLot8u+X7+7EHExn8n1fSnYT4=;
        b=f72T/MFGwLIQ0pvFKkV5x18HShsGqdhFzGn1cVdCRKCAutzu4aKWmED6UMAR2sPqxB
         WyU/+ZXhJNYsQm+YdvEpw/76cAgvvJ9ItSz4zXDKQCgsM5mfoLGF79fEORir9+Nm2Wsl
         kx8nigV/VIE4iimVGO4aroOId/p/9TbnnQYam8bWdQW2IgV1AXq9VejWfj5kmj6+pRSa
         fOJrzgGycA9B2g46M3bOr/WG3xh0Lw2fTmtJbNeqPIRvFKLN150WhR1dcJ1ID3WZRXVG
         ADV7J0C3ccZYZzVks6sGTM8G0vWSQMhmGVH7Q7sZb3F8KVRCMQOwFU3WeyOvQnb5+tEw
         J0tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747885803; x=1748490603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+R8i+ruO2bwbFHlWkEQLot8u+X7+7EHExn8n1fSnYT4=;
        b=QpkrQbKTBPzZYFK8giYb7CJ02TnYHbWmG7EoijG4lZ1Bv4JROdMzARmiqQDdDaNsqk
         koCXCvrUH4TzdMMsi2zvLaatUqzvlEhJV6f+8tsCv4KpGyIvAfucLveCQa5IR2PpusNx
         vh8LT4ysvJ9GUy0GRD6I/Up+HYX3U1T6KpBhbxYxy5lw8BhQy2koDgCWFmwGGoc+Iga+
         d1kkhJ+rqGxKIQc3t0r5C5Hl4+43PkoXlQZ+ZTfKxCwDD+qM2dmrSXk+pUmC2T8f6Jwr
         R2DG6/XpYn+l4rwoUDS+V+u1I0FC8I3ebIv7mMZAWT3t2Lvi97UBoZxiBiBWYU5DCE4+
         NTmg==
X-Forwarded-Encrypted: i=1; AJvYcCVSe5Pf+Wx7yhQSsQKGVTB65R/xTIU6EMFEgT/evO0fdQC8r2m+5JCm8sWKWeV8FP3UvF+kroq+YvfrRA4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWxXHQbp6nMLRbQs3AaSleLwWgvlqevoPvV4F8bEHlPkIQbdWv
	if+7xUuHZTctfvIlXpNU+0YJGaQ4Gct4dvKBG41LzXxdXrTERAhR5Hy3+dvBFAaRNag=
X-Gm-Gg: ASbGncvzbS+jRfHC+i3DAmvHIF8J8+P5lglweLG7xurXJ7mK3K+s9DbjM9C64bzgtXj
	VKj4YIqfQQLXifcAjvOXwfLa7cnLz3gLSyMCTzHg5/42GOn7E9TzyrswvO68hdrK5D/NCU/0af1
	E/1HWpJOhgcRuISHKeYNcKz0pxK9SQk2nSJjVniW+aj5J6+EU4+suznB91ByJo4BTAzmzjWqW95
	cjRchM98Vr4R3l8ZbH0/C47mXTyqyJeFoU82AmurJzvH6ZtvYsQrUu3QfBmYsyrAlXv2X+GLkAL
	l/MZ7kTcBPKw1fpWAd1DZwaBIQ7jxPgg/iHDiZHz3VfzVi91A+YdIn1g0F1xrebOUTs57emu+kA
	h6GN9MYGtw69i
X-Google-Smtp-Source: AGHT+IGdI6N6cSiPrnvudAajDc7RMApTF2gKv7Qu9c54Cfze8WrNP2JwZnEt2K8maE/GoujLw+psIg==
X-Received: by 2002:a17:902:d484:b0:231:e413:986c with SMTP id d9443c01a7336-231e4139adamr293625635ad.11.1747885803209;
        Wed, 21 May 2025 20:50:03 -0700 (PDT)
Received: from localhost.localdomain ([203.208.189.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4afe887sm100085895ad.88.2025.05.21.20.50.00
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 21 May 2025 20:50:02 -0700 (PDT)
From: lizhe.67@bytedance.com
To: alex.williamson@redhat.com
Cc: david@redhat.com,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lizhe.67@bytedance.com,
	muchun.song@linux.dev,
	peterx@redhat.com
Subject: Re: [PATCH v4] vfio/type1: optimize vfio_pin_pages_remote() for large folio
Date: Thu, 22 May 2025 11:49:56 +0800
Message-ID: <20250522034956.56617-1-lizhe.67@bytedance.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250521131711.4e0d3f2f.alex.williamson@redhat.com>
References: <20250521131711.4e0d3f2f.alex.williamson@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 21 May 2025 13:17:11 -0600, alex.williamson@redhat.com wrote:

>> From: Li Zhe <lizhe.67@bytedance.com>
>> 
>> When vfio_pin_pages_remote() is called with a range of addresses that
>> includes large folios, the function currently performs individual
>> statistics counting operations for each page. This can lead to significant
>> performance overheads, especially when dealing with large ranges of pages.
>> 
>> This patch optimize this process by batching the statistics counting
>> operations.
>> 
>> The performance test results for completing the 8G VFIO IOMMU DMA mapping,
>> obtained through trace-cmd, are as follows. In this case, the 8G virtual
>> address space has been mapped to physical memory using hugetlbfs with
>> pagesize=2M.
>> 
>> Before this patch:
>> funcgraph_entry:      # 33813.703 us |  vfio_pin_map_dma();
>> 
>> After this patch:
>> funcgraph_entry:      # 16071.378 us |  vfio_pin_map_dma();
>> 
>> Signed-off-by: Li Zhe <lizhe.67@bytedance.com>
>> Co-developed-by: Alex Williamson <alex.williamson@redhat.com>
>> Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
>> ---
>
>Given the discussion on v3, this is currently a Nak.  Follow-up in that
>thread if there are further ideas how to salvage this.  Thanks,

How about considering the solution David mentioned to check whether the
pages or PFNs are actually consecutive?

I have conducted a preliminary attempt, and the performance testing
revealed that the time consumption is approximately 18,000 microseconds.
Compared to the previous 33,000 microseconds, this also represents a
significant improvement.

The modification is quite straightforward. The code below reflects the
changes I have made based on this patch.

diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
index bd46ed9361fe..1cc1f76d4020 100644
--- a/drivers/vfio/vfio_iommu_type1.c
+++ b/drivers/vfio/vfio_iommu_type1.c
@@ -627,6 +627,19 @@ static long vaddr_get_pfns(struct mm_struct *mm, unsigned long vaddr,
        return ret;
 }
 
+static inline long continuous_page_num(struct vfio_batch *batch, long npage)
+{
+       long i;
+       unsigned long next_pfn = page_to_pfn(batch->pages[batch->offset]) + 1;
+
+       for (i = 1; i < npage; ++i) {
+               if (page_to_pfn(batch->pages[batch->offset + i]) != next_pfn)
+                       break;
+               next_pfn++;
+       }
+       return i;
+}
+
 /*
  * Attempt to pin pages.  We really don't want to track all the pfns and
  * the iommu can only map chunks of consecutive pfns anyway, so get the
@@ -708,8 +721,12 @@ static long vfio_pin_pages_remote(struct vfio_dma *dma, unsigned long vaddr,
                         */
                        nr_pages = min_t(long, batch->size, folio_nr_pages(folio) -
                                                folio_page_idx(folio, batch->pages[batch->offset]));
-                       if (nr_pages > 1 && vfio_find_vpfn_range(dma, iova, nr_pages))
-                               nr_pages = 1;
+                       if (nr_pages > 1) {
+                               if (vfio_find_vpfn_range(dma, iova, nr_pages))
+                                       nr_pages = 1;
+                               else
+                                       nr_pages = continuous_page_num(batch, nr_pages);
+                       }
 
                        /*
                         * Reserved pages aren't counted against the user,

Thanks,
Zhe
