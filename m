Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A38471494C2
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 07:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750060388; cv=none; b=eiEFiyf/vvEdEZXcYcWiCZ90RLQCOmZ5lsTs2HGTdnQXswm5Yb/ohDReYWSlD45H7QIXbLIYpBF9oP85ZKrpLxylit7fhJC2zRMXDPgDYQ/inykp+PHcKAkbOXC9Q3NvG6J8yDiVsErqNHSr8niyIVrCS04JVeO2v81q2R6YFMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750060388; c=relaxed/simple;
	bh=nU3MVzPAz2W/MmUBLQRYb+KaRA8m268+ptAzhabPrCQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P+dak7Vxc448x/legAiUsll0qEhpLTNn6V6MEi425GTzEgkY+mLPBzNHHbF/+4e8JZrCxjm3Ol5eM4tEPHhgYKM/WF8l9R4o6VWTrbJKIRZ4tSybrXfLgroeRkf7QAI1lVIZkjjZt7I6mMvKweJvav6lva3pWquGz9/C5c2YmeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=OtqKMLOl; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="OtqKMLOl"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3137c2021a0so3164055a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 00:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1750060386; x=1750665186; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BBQ+2bMvAOaABHXtNuxuVBu+Oc5HFaxNYNRCaBfbVBo=;
        b=OtqKMLOlxP9ehGokSF/Q+AKz/N6L09aPqvowzph98QqYPSlDsjHODnG7cVUAVqlF4S
         QeTmZoGu6qGg1Xlzf5BdFrMvIZxr5xO6sytiVuv16LMdWdaP+nkuxw8haVWHoveeByoU
         sCPl7LGwqiAkyTkQmTT/WJjBDSI/dA6neN64K0mwtp/7q+uX1jkUC3sNWofk7Mg9b1wa
         RqiccA3vaZHfhChG6mxYF3A439YYNwYhNhOAgL+zb0WqUCbwriXZ7kQuTxfxGsg/HIBX
         B/QfqavD04L/nNZ8TUkLp8OF+xhSJvy5sJE1AYz78ZlqV71KlRo4pndymqlnR2Dj0JmK
         wxpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750060386; x=1750665186;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BBQ+2bMvAOaABHXtNuxuVBu+Oc5HFaxNYNRCaBfbVBo=;
        b=iEillYwWvfRwU3T66ilVi8AKLEzSLgMKSXyfqzNU39xenQvDE8JCALBxiMDqkNVJh5
         /6iQHvoP33BLVVApmeckC+SDeVM2vR3KzNZrVKWt7x13jVgVjhN/BW0i1Fb3I3gHEQqS
         6MynyhNS8/3PRvD9eDVBPLWsVEQA8utCB4tui0a/LoZHD1aXpsFl4Mm/UaAKC5lXpA0o
         pu2bvLd5l0G5TlDiMOcx6Wer0y816IFi/EqW9znSdGJhz1rq1eu8+QdRdyo7pyOoZHS0
         h/pJcswntbBd+36PiZ2MuOUA2YTZmx4osNqlGlx2gyvgHUtCE9HSzrXbvCa9kFpqi2Yi
         hYuA==
X-Forwarded-Encrypted: i=1; AJvYcCUFVOxzVEgR97BUKb0MzhnF2rBCafJgNIcC4WUHAqMTBt5v3980/gvcdQPYY+zhvI5Ys31j8BwTU9xYomQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqQHb/0MQG+YVnN5RsSwR6ZDPKfAkkdU/VftZWdZeXPTHCpV1K
	jQKIg5HYpw+OTCFyDP/LMbngP2lWzaZICFalsNdoGlwWxbUj0wOzrKULDNcGxkcjfvA=
X-Gm-Gg: ASbGncudK7FW+OtTk3TiWy66vhEMP3Deq5KyJXXRsnt2ENfA5g4Cc/EIGYHeBkQTW52
	WNg04sQx7PTfCP5x63JVhABwvxjj/h21HHODE01fWeUCUyNyIe3VMVuK8VkvazvHf39uu2+ZZTZ
	dqLhtWoBey2u5i2Xvs1fRNwKLPR50qVzP+P8xErdOZiEPln9h6B8uTzmDCMryiznq1lAqZY+/wW
	RUeWsKQpqJADl5ux6T6ah0TPKa9cBcZ6U10sb6v/gkJFqgm7VsJibXeIZv7a28koFFS84w7nvMr
	LB5cm9FDhYlK3znmgL3YKC+OSMGNbsQitWZGVLE0xdqYHUKMYwu8jr3SQ+I4FadF/GNVw52JqIg
	JTRXssGstdm1p4A==
X-Google-Smtp-Source: AGHT+IE2b2wVBEzCLW4p0LTN9AxQbWpaHf9MTFJ34uDqSAIumyaW8XvtdoyxYcfKP/ch+23nwmdzgA==
X-Received: by 2002:a17:90b:1dc4:b0:311:fde5:e225 with SMTP id 98e67ed59e1d1-313f1c01641mr15461579a91.14.1750060385867;
        Mon, 16 Jun 2025 00:53:05 -0700 (PDT)
Received: from localhost.localdomain ([203.208.189.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365d88be76sm55179045ad.32.2025.06.16.00.53.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 16 Jun 2025 00:53:05 -0700 (PDT)
From: lizhe.67@bytedance.com
To: alex.williamson@redhat.com
Cc: kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	david@redhat.com,
	peterx@redhat.com,
	lizhe.67@bytedance.com
Subject: [PATCH v3 0/2] vfio/type1: optimize vfio_unpin_pages_remote() for large folio
Date: Mon, 16 Jun 2025 15:52:49 +0800
Message-ID: <20250616075251.89067-1-lizhe.67@bytedance.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Li Zhe <lizhe.67@bytedance.com>

This patchset is based on patch 'vfio/type1: optimize
vfio_pin_pages_remote() for large folios'[1].

When vfio_unpin_pages_remote() is called with a range of addresses
that includes large folios, the function currently performs individual
put_pfn() operations for each page. This can lead to significant
performance overheads, especially when dealing with large ranges of
pages. We can optimize this process by batching the put_pfn()
operations.

The first patch batches the vfio_find_vpfn() calls in function
vfio_unpin_pages_remote(). However, performance testing indicates that
this patch does not seem to have a significant impact. The primary
reason is that the vpfn rb tree is generally empty. Nevertheless, we
believe it can still offer performance benefits in certain scenarios
and also lays the groundwork for the second patch. The second patch,
using the method described earlier, optimizes the performance of
vfio_unpin_pages_remote() for large folio scenarios.

The performance test results, based on v6.15, for completing the 16G VFIO
IOMMU DMA unmapping, obtained through unit test[2] with slight
modifications[3], are as follows.

Base(v6.15):
./vfio-pci-mem-dma-map 0000:03:00.0 16
------- AVERAGE (MADV_HUGEPAGE) --------
VFIO MAP DMA in 0.047 s (338.6 GB/s)
VFIO UNMAP DMA in 0.138 s (116.2 GB/s)
------- AVERAGE (MAP_POPULATE) --------
VFIO MAP DMA in 0.280 s (57.2 GB/s)
VFIO UNMAP DMA in 0.312 s (51.3 GB/s)
------- AVERAGE (HUGETLBFS) --------
VFIO MAP DMA in 0.052 s (308.3 GB/s)
VFIO UNMAP DMA in 0.139 s (115.1 GB/s)

Map[1] + first patch:
------- AVERAGE (MADV_HUGEPAGE) --------
VFIO MAP DMA in 0.027 s (596.1 GB/s)
VFIO UNMAP DMA in 0.138 s (115.8 GB/s)
------- AVERAGE (MAP_POPULATE) --------
VFIO MAP DMA in 0.292 s (54.8 GB/s)
VFIO UNMAP DMA in 0.310 s (51.6 GB/s)
------- AVERAGE (HUGETLBFS) --------
VFIO MAP DMA in 0.032 s (506.5 GB/s)
VFIO UNMAP DMA in 0.140 s (114.1 GB/s)

Map[1] + first + sencond patch:
------- AVERAGE (MADV_HUGEPAGE) --------
VFIO MAP DMA in 0.027 s (598.2 GB/s)
VFIO UNMAP DMA in 0.049 s (328.7 GB/s)
------- AVERAGE (MAP_POPULATE) --------
VFIO MAP DMA in 0.289 s (55.3 GB/s)
VFIO UNMAP DMA in 0.303 s (52.9 GB/s)
------- AVERAGE (HUGETLBFS) --------
VFIO MAP DMA in 0.032 s (506.8 GB/s)
VFIO UNMAP DMA in 0.049 s (326.7 GB/s)

The first patch appears to have negligible impact on the performance
of VFIO UNMAP DMA.

With the second patch, we achieve an approximate 64% performance
improvement in the VFIO UNMAP DMA item for large folios. For small
folios, the performance test results appear to show no significant
changes.

[1]: https://lore.kernel.org/all/20250529064947.38433-1-lizhe.67@bytedance.com/
[2]: https://github.com/awilliam/tests/blob/vfio-pci-mem-dma-map/vfio-pci-mem-dma-map.c
[3]: https://lore.kernel.org/all/20250610031013.98556-1-lizhe.67@bytedance.com/

Changelogs:

v2->v3:
- Split the original patch into two separate patches.
- Add several comments specific to large folio scenarios.
- Rename two variables.
- The update to iova has been removed within the loop in
  vfio_unpin_pages_remote().
- Update the performance test results.

v1->v2:
- Refactor the implementation of the optimized code

v2: https://lore.kernel.org/all/20250610045753.6405-1-lizhe.67@bytedance.com/
v1: https://lore.kernel.org/all/20250605124923.21896-1-lizhe.67@bytedance.com/

Li Zhe (2):
  vfio/type1: batch vfio_find_vpfn() in function
    vfio_unpin_pages_remote()
  vfio/type1: optimize vfio_unpin_pages_remote() for large folio

 drivers/vfio/vfio_iommu_type1.c | 57 ++++++++++++++++++++++++++-------
 1 file changed, 45 insertions(+), 12 deletions(-)

-- 
2.20.1

