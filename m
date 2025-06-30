Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 638E81E8837
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 07:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751268381; cv=none; b=sGKKDQTLj3Jruzw9KdiywfhkrODEXv2HFzwHjEJQdCZqGD1c2L2JOAdjsmFWgsVEKsO+sX6pVX8G4ppAG9m3epf0ehf4So/edfr9UaTwpHDmC+YeQympRZTur7n9T0EeBZDqUXjWlVlCdB1Gjn2S4tVJdYjtdRcKtRNlsgnjrK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751268381; c=relaxed/simple;
	bh=I5aXpogNojpmKmR+yCXkyrMsR8ui+2Tod3Gs6ibm7u4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kyVLMchvT4+xkq5I24Elc3AT0z/bX2g9IF6pLwQAzRL0sOiIeMhNdY0mhRjwSbQ7yqyay+a/0DOGEP2yswjszuGPLauCSet2vH9xBJ/ncfvlluiQBE2dXJI5yWhDNeRUbhc8PCjNIi+qCVHo96ulVp2zbNLkhLysEwuxoDOFqkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=JonI0cEi; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="JonI0cEi"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2350fc2591dso36259115ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 00:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1751268379; x=1751873179; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vjIw3BQMQkuEtqIZpSqBzYxhDfFJxgtZiU6HzDMOlNc=;
        b=JonI0cEiL4FS4PzWFn99SaYHAhkkMUUvSJ2SPEOmsbE3HOM2m+9cKQAo0qDgSVtu1E
         MEJPXJoTG7YJWAy8h1cMRopka5UL0yZHzP1SLzod605ED/BayFcGXd5HytVZ46kGin3c
         sSTRRYCblEMJgakoptWlKw6LdsD03XCFBCztjEWF1IAcNd4DwujUAtE7fejbYkapHVCv
         YszkkaKjd3TL+45vCAP3MAF8wQi7uAeNXti/0dOHynIF79Dbu8JO1zOJrmZVU+zarrLp
         ES3prVkRGwWkgiuO56e1c8t93Svp5DnynqHJR7VA20Nh26zpkPlfW1ZEaSQbW5M8Pg7j
         +VAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751268379; x=1751873179;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vjIw3BQMQkuEtqIZpSqBzYxhDfFJxgtZiU6HzDMOlNc=;
        b=qXrryOuy3AJkNkj3ZWwL3THHaVch7O55KZLh4AuZ7vE8kFgv/aJNlaLh41Nl4cGuRD
         ePpK1ZCj2ua2bRyX4QM5yNHI071ZDYIOjlIKx1dSP4yV9KReMdsIhPwIfCgyelp8T8uC
         vk+CE2HqimLUrrGPRc4XUGIOuiw+/iS2tJ/CQhDMerYxrv7bsoWQYJLDmay8leynMEoo
         R1mxwqfQTnsH4bvmz2gkn6jfayX6PsC7cwtu+q6dOHISRu+Eq+LMGeNAdNUNlEDMVepV
         JPRKuR10BzEm0C/wT5lqwWpwnF4EQ9Ccm3L101dw1vxOPF6yZp2X6lMkwmrKSkZJpeDT
         3O1g==
X-Forwarded-Encrypted: i=1; AJvYcCU2nOz5JOyinuk7XPnmk2nRxYtCJ3wD7ZI14xM6XS7mxpDR0BavchbRcqRZZw7p2hjqPZVPY5CoBMqW5R8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyaUuOGDj40zYKjQevyt3y5KAyHtV6Hwn5Tk1ZG4IffuhB+F3HV
	AExsB0PSrIfHQiQu9q5/7TInhO0ZDDaSs+cZx8BWrGIfOZ+8TUAw4sYwEuV1ncvnAbO21Ll3p/n
	FN94a
X-Gm-Gg: ASbGncsW3aIcSmhtC7tDUeSfvlU+rnllyKCnisrgPe/FKpqpWphs80J+mk6qFxX7d3P
	t7KLzssWC1JieoxW+0fgNBsQL62lOcleNQj3a4g4tvRF5DvIqFUAR7R3eWUJXQbzl9rienjLb4D
	xHIwCvwnCyHi3SFw2THktBRdBtLXeyZBbfxhCQOSbHS+qK8ny3pKi7o/J2dYnRM4toz9jP+lnBD
	Zq1fEMu0GhLesUOce2IkeJ6qHqmXe8sgNTHTWvKhh/M7cmevi9n/v2monRF/WCA0NgFSwletG27
	n9cI+rxDXTen8E1/sXUEPoJJ1xgjNj3sMYbtFn0oonBoM5jrgOKzagWWJeeTvIsJAi9j8TV+86q
	RxTF91kHwDhUPHQ==
X-Google-Smtp-Source: AGHT+IGafeZ2azc3t18RXEN8peJr6PmRhM9ZfzpHzNFPkcgsDxEqmtV9RKi7UPzP5ti8qyp0RUJeug==
X-Received: by 2002:a17:902:f815:b0:235:f091:11e5 with SMTP id d9443c01a7336-23ac4ed5479mr113205755ad.10.1751268378623;
        Mon, 30 Jun 2025 00:26:18 -0700 (PDT)
Received: from localhost.localdomain ([203.208.189.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb2f17f5sm77237555ad.62.2025.06.30.00.26.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 30 Jun 2025 00:26:18 -0700 (PDT)
From: lizhe.67@bytedance.com
To: alex.williamson@redhat.com,
	jgg@ziepe.ca,
	david@redhat.com,
	peterx@redhat.com
Cc: kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lizhe.67@bytedance.com
Subject: [PATCH 0/4] vfio/type1: optimize vfio_pin_pages_remote() and vfio_unpin_pages_remote() for large folio
Date: Mon, 30 Jun 2025 15:25:14 +0800
Message-ID: <20250630072518.31846-1-lizhe.67@bytedance.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Li Zhe <lizhe.67@bytedance.com>

This patchset is an consolidation of the two previous patchsets[1][2].

When vfio_pin_pages_remote() is called with a range of addresses that
includes large folios, the function currently performs individual
statistics counting operations for each page. This can lead to significant
performance overheads, especially when dealing with large ranges of pages.

The function vfio_unpin_pages_remote() has a similar issue, where executing
put_pfn() for each pfn brings considerable consumption.

This patchset optimizes the performance of the relevant functions by
batching the less efficient operations mentioned before.

The first patch optimizes the performance of the function
vfio_pin_pages_remote(), while the remaining patches optimize the
performance of the function vfio_unpin_pages_remote().

The performance test results, based on v6.16-rc4, for completing the 16G
VFIO MAP/UNMAP DMA, obtained through unit test[3] with slight
modifications[4], are as follows.

Base(6.16-rc4):
./vfio-pci-mem-dma-map 0000:03:00.0 16
------- AVERAGE (MADV_HUGEPAGE) --------
VFIO MAP DMA in 0.047 s (340.2 GB/s)
VFIO UNMAP DMA in 0.135 s (118.6 GB/s)
------- AVERAGE (MAP_POPULATE) --------
VFIO MAP DMA in 0.280 s (57.2 GB/s)
VFIO UNMAP DMA in 0.312 s (51.3 GB/s)
------- AVERAGE (HUGETLBFS) --------
VFIO MAP DMA in 0.052 s (310.5 GB/s)
VFIO UNMAP DMA in 0.136 s (117.3 GB/s)

With this patchset:
------- AVERAGE (MADV_HUGEPAGE) --------
VFIO MAP DMA in 0.027 s (596.4 GB/s)
VFIO UNMAP DMA in 0.045 s (357.6 GB/s)
------- AVERAGE (MAP_POPULATE) --------
VFIO MAP DMA in 0.288 s (55.5 GB/s)
VFIO UNMAP DMA in 0.288 s (55.6 GB/s)
------- AVERAGE (HUGETLBFS) --------
VFIO MAP DMA in 0.031 s (508.3 GB/s)
VFIO UNMAP DMA in 0.045 s (352.9 GB/s)

For large folio, we achieve an over 40% performance improvement for VFIO
MAP DMA and an over 66% performance improvement for VFIO DMA UNMAP. For
small folios, the performance test results show little difference compared
with the performance before optimization.

[1]: https://lore.kernel.org/all/20250529064947.38433-1-lizhe.67@bytedance.com/
[2]: https://lore.kernel.org/all/20250620032344.13382-1-lizhe.67@bytedance.com/
[3]: https://github.com/awilliam/tests/blob/vfio-pci-mem-dma-map/vfio-pci-mem-dma-map.c
[4]: https://lore.kernel.org/all/20250610031013.98556-1-lizhe.67@bytedance.com/

Li Zhe (4):
  vfio/type1: optimize vfio_pin_pages_remote() for large folios
  vfio/type1: batch vfio_find_vpfn() in function
    vfio_unpin_pages_remote()
  vfio/type1: introduce a new member has_rsvd for struct vfio_dma
  vfio/type1: optimize vfio_unpin_pages_remote() for large folio

 drivers/vfio/vfio_iommu_type1.c | 121 ++++++++++++++++++++++++++------
 1 file changed, 100 insertions(+), 21 deletions(-)

-- 
2.20.1

