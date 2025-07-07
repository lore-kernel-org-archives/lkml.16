Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E6522627F9
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 06:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751871008; cv=none; b=LOcBqosbn5BctOqGarxGgnxiZ6xp6Td3MthmAduJsnsYugdeO7S0NSf3tVv54z6OaKrsUzjMTAaeOCMMDBgQP9ZnGNqRjTMxxn3CcA5M3q3ioCWTLtzdyfHxzChr4kmljvs8kR3DJyXebOpEn+mMmdvXjz6qEjTSWcAXZblS+1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751871008; c=relaxed/simple;
	bh=iuzlfF6PXexPT6SoFJbxBuA9UcLZfFM/8mhOjMDSD7I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=icFyK56NZ1jGTRvVlM5aDrQDxb3VpBzyo33glatzk0DJrO4fLCLdfky7vjMTguIbkTGtESThqMXsOXtmVKtnCp7Y7RweTh2GRSsmfygShWpewV+U3FcTtVw8UKMnqcVycudeliFHCJw8gFN/PmTTfD7sze11NmV15zAPh3begBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=aFEQue5B; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="aFEQue5B"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-23aeac7d77aso22024545ad.3
        for <linux-kernel@vger.kernel.org>; Sun, 06 Jul 2025 23:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1751871005; x=1752475805; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i8AsWeXMLhqUn3H7B9xWkZ8Mg80AN3Bq26h9flJP3Ag=;
        b=aFEQue5BtNmT2CiL4dlW3cmX6lspkgBfE1OQURF9bk+CoO2VtejTKsvqrCWlsJgIfr
         wEdovltkkm7WKv0yM45OeuN77MJSeLsqPm4gPOO3QJV7gKziMZ587DzxMpY6XgIgQ4qv
         5lrNqHzd8znsrcX345sn1BMemeAsvRbTE4ZiUnXJdJYWaFKOh/FWqJYY6NomV19xRbzU
         yYaJhJa9Ua158Bb3JbRSoC2OONESjgXqR9jvQ9VCSYXW201sz/KlpJJfoI7RXIKZWr2X
         Bhgf4cRC9sbJPGkoU6p2CvkZP5dWnTdq9AykYjwEoFo2sDP1iEWgmF8agquYDQ0dnJNA
         fdqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751871005; x=1752475805;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i8AsWeXMLhqUn3H7B9xWkZ8Mg80AN3Bq26h9flJP3Ag=;
        b=CLXHion6gK/kwlpj8Z5v1fAGQbAdc703JuDJv369eSN1ZZCKVKIi9xJE7DLoc0BfMU
         1iRnM7/ClAdugc2A8ADgbh+NP3JHGTmAaj4o3NL5eHaJ4hJmUJnZwZ04yvFUgq7yKQjL
         1lOFzes9xEBSdXnUADtwFObM3+XzzTfFI6nmPz+oY+w8Aze4EBRzJuqZf8urVPtrQuVa
         /ZFLDB+KjvOvvkhXfg/8qa8BRT8eJ0OxJGd2zPpvFV47HPjY0A8PRA9e3NdHcyzQYxrp
         KBGPO4Nh+DbjwnqSWPjVIoC2Vt7FJbGJYchaVuy3Mvt3kN8rL995T3qcdGmaQvxu2a6e
         bFog==
X-Forwarded-Encrypted: i=1; AJvYcCUE3lnXhA0z5EyCSAAVoB9tUtjGcB31shAv0HJ8avVjC/5h+hNb6JaiolAZKXyIwx+4zvWK4BFLSOnaetc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6EDmGSJwnN2Tdd+o3fL4NwwReMsvc5dCQKMNYimX2vZu24qRL
	X0r3oCO012kU7MsIgGk3bIwDas52DOxklKtuJ+sojcs2P90USVr/SmB55P9550dsa10=
X-Gm-Gg: ASbGnctnAwm+DdmPpbkopKlyQ+ebgYmZHSYo96db9gfrPovKRLp1uBAnLTsjJdlWdNx
	98Cn3ESSS3sDvjxF0HwA+3ePB9CbVI+wA2xE2FaFmiwrI2pM7QdQKWrgB0u+clBru1jqcIHNYgv
	JWSLY6ynChqK8U8ewEJH1qZBfUuagmV60W1+CNSCMWADP05RVkwUiuohcgmULKGRc5D+TODC7xy
	8ORHHUMmz2lESycDrgGLsg8aG5RrbA96V4Dig+pLKLWrYHW8De8/DbmdYMnxMqme0FR2hne1bcK
	V2kAkCp5h5eJIpSRwFN6p8WTpdX9iyYPkOkgHSrlE3I5T3EA1POouZ2ZgjptFrgInXyUG7XLbgP
	lQYNO9hfwuHn55PcFpH3bTj4=
X-Google-Smtp-Source: AGHT+IGLihlBavJmP5vmETh0vLgxwYfBYMI7r7oHFioBXcwdK0RdD8OiHt5kuZB6aRF9wDmBnGCq9A==
X-Received: by 2002:a17:902:f70f:b0:235:e309:7dec with SMTP id d9443c01a7336-23c9105d8dcmr85967755ad.26.1751871005195;
        Sun, 06 Jul 2025 23:50:05 -0700 (PDT)
Received: from localhost.localdomain ([203.208.189.9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c8431a1aasm77377635ad.15.2025.07.06.23.50.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 06 Jul 2025 23:50:04 -0700 (PDT)
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
Subject: [PATCH v3 0/5] vfio/type1: optimize vfio_pin_pages_remote() and vfio_unpin_pages_remote()
Date: Mon,  7 Jul 2025 14:49:45 +0800
Message-ID: <20250707064950.72048-1-lizhe.67@bytedance.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Li Zhe <lizhe.67@bytedance.com>

This patchset is an integration of the two previous patchsets[1][2].

When vfio_pin_pages_remote() is called with a range of addresses that
includes large folios, the function currently performs individual
statistics counting operations for each page. This can lead to significant
performance overheads, especially when dealing with large ranges of pages.

The function vfio_unpin_pages_remote() has a similar issue, where executing
put_pfn() for each pfn brings considerable consumption.

This patchset primarily optimizes the performance of the relevant functions
by batching the less efficient operations mentioned before.

The first two patch optimizes the performance of the function
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
VFIO MAP DMA in 0.027 s (600.7 GB/s)
VFIO UNMAP DMA in 0.045 s (357.0 GB/s)
------- AVERAGE (MAP_POPULATE) --------
VFIO MAP DMA in 0.261 s (61.4 GB/s)
VFIO UNMAP DMA in 0.288 s (55.6 GB/s)
------- AVERAGE (HUGETLBFS) --------
VFIO MAP DMA in 0.031 s (516.4 GB/s)
VFIO UNMAP DMA in 0.045 s (353.9 GB/s)

For large folio, we achieve an over 40% performance improvement for VFIO
MAP DMA and an over 66% performance improvement for VFIO DMA UNMAP. For
small folios, the performance test results show a slight improvement with
the performance before optimization.

[1]: https://lore.kernel.org/all/20250529064947.38433-1-lizhe.67@bytedance.com/
[2]: https://lore.kernel.org/all/20250620032344.13382-1-lizhe.67@bytedance.com/#t
[3]: https://github.com/awilliam/tests/blob/vfio-pci-mem-dma-map/vfio-pci-mem-dma-map.c
[4]: https://lore.kernel.org/all/20250610031013.98556-1-lizhe.67@bytedance.com/

Li Zhe (5):
  mm: introduce num_pages_contiguous()
  vfio/type1: optimize vfio_pin_pages_remote()
  vfio/type1: batch vfio_find_vpfn() in function
    vfio_unpin_pages_remote()
  vfio/type1: introduce a new member has_rsvd for struct vfio_dma
  vfio/type1: optimize vfio_unpin_pages_remote()

 drivers/vfio/vfio_iommu_type1.c | 111 ++++++++++++++++++++++++++------
 include/linux/mm.h              |  23 +++++++
 2 files changed, 113 insertions(+), 21 deletions(-)

---
Changelogs:

v2->v3:
- Add a "Suggested-by" and a "Reviewed-by" tag.
- Address the compilation errors introduced by patch #1.
- Resolved several variable type issues.
- Add clarification for function num_pages_contiguous().

v1->v2:
- Update the performance test results.
- The function num_pages_contiguous() is extracted and placed in a
  separate commit.
- The phrase 'for large folio' has been removed from the patchset title.

v2: https://lore.kernel.org/all/20250704062602.33500-1-lizhe.67@bytedance.com/
v1: https://lore.kernel.org/all/20250630072518.31846-1-lizhe.67@bytedance.com/

-- 
2.20.1

