Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 610E12989A2
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 10:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751019021; cv=none; b=GOsmYjOby2MEOiykPwAh+356fz8BqqRbAdNZM1WUGfJJUiYEP2ye0lzx+9UqjJl3KqDEmYa1FSfR33AI9cCe7V3ZqD5FHwsMIG75y6srfYqw+hjJ4uhi28BMPBh2Pl1Bu4C2LGYQu8Fc24ecKBGvahKs+H1JDuwRPCSM1ChMT4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751019021; c=relaxed/simple;
	bh=0giSBgmaCphIbxYHr4WmnoLIDsn5RIpi8emWrzo8fZ0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bGein5cnGKFgqMPSX639NTua8KdYOBfaeiELfkyrqMsEio+F7ZunomaGc1O76UDcwFGJDD3eyrgGLaUU3P/jEncLH8o1zaonIJDIJMV+PA3RTp5Y1vOgx3KTCO3mANIhsHb17Y2IX8FLNTpxZ/3OQbwxcp2f3bTVGxjvexKM4ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=U9Owwn7t; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="U9Owwn7t"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a4eed70f24so299773f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 03:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751019018; x=1751623818; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p2kHSsv+wfo3DML4q3PqZ9JAPNtZ/a1cxK7CHbHK+a0=;
        b=U9Owwn7tVIWvS9K1cwt1R6vWZhuaAnV93SOQYHl07R6DNEp5JRcNez8L/JmwUUEItM
         8dCvUc4AxrwZsRbj7XEbsMLpRHzE96Zqh7PfpYlgBW6klCMfMmrU6ReOEyxhZRVqH79J
         P/30hvK3aEUuKzfmE+dmA+ekwiokOReJP/YMpcydY6etryTRIlpgzZwAOE1VTu0NtAK4
         dHc/HR71+IWYrCxpK1Bl2QLqXFkfKoZvxyhycLqKNY1bMKj54cHHYsf+XChI9Er3ki9j
         qsQFfXjdhp/PLk/wP9U3nXQMpRG9o1RdQrzP7DZvMXZ2rE+d66ULR44J2nHwU2TCRBYl
         HCUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751019018; x=1751623818;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p2kHSsv+wfo3DML4q3PqZ9JAPNtZ/a1cxK7CHbHK+a0=;
        b=Mv5vqZxBH8z/o8yjnirDdGhTaMJxxatqQMzRrEWpsQjy1IH/u9ynL4ln5nDDJG8ywh
         d1F9CEfkjd3gdYRVetSJk9PrhnzKWv6UT9iSMywAo+T/5A5MFOQ9kTqykQK96vGaCAo9
         r0AnJez/2NsVSjtuwDkbTjwMB1nGSiJN4w0gCktojMa8wxX9jOW2JkhpEIeLTUDwWJxI
         IQ2ZqzTejkoXNVzXF6H/54LqpmD3fzrNa6CICiC8tmycXeQBiHCvhRD6pw1hHdbl7vp0
         iIb9K6OEibujf4LJPloEAlmNRhtl8wfk8Qr9O+cxLVBxF17TX+mecradLZcTRz595uTI
         CNIA==
X-Forwarded-Encrypted: i=1; AJvYcCX1wswlaBdHsa3I3HJ9o3NAWMY4h2mjn8MOgsTjbMQ2cyfsfhxbWzBcHEtWKkQ6apti9YrDlWu+xhDeObc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/Vub3yty3TB7lKnP0QOxWzfzn9cSdxOtx5BDXciwNN3FhFJPs
	UMooewOTHVIrob4UxbU14kq1ga82Nuf/iAZCSt1qoXiKOV288uU/sXTJZClUL4YUi9Q=
X-Gm-Gg: ASbGncutKSDXjUtEAdyc765WRAF8Mm9U3bw5efQvV+5THqq5ZQhbSIQL2ZES4BrXzqA
	tpQlznYbPMbIMd9EF6dKVXdxRqgx22F0wU0SciENwC2z/elannHg7cfBjFPnWoMyjQL6EddlnO8
	QdstyVd18qqMqc3G9LZHifAC91MOcF5UENjK9iUs/c9ISbK65f+ee/AnQC9y+1UinFN+9lBc/g7
	lNPnz63jd63PnuZDpzd3OlLWManaw30CIVfHPaFdWd8fEXrAA8Na1qB7oA3ASVC/RGDW06d5cy/
	wsvtb0VqC43pyVf6rvFS0ztjcLLMdXy0zAEKXa/pvahlPTALeT5r2eGQWHpRhUmKf8Qs3k5abdE
	iiENPNR5MD2u9p58I2mrBd5HY+XaKnC+62eVBqP2Ph+w01jzPt/EpbkgiN6z7sas=
X-Google-Smtp-Source: AGHT+IFVCTjSV+KDkAU40t12c+V1148+Xj9ejWeKM8rjPyQmHH2LgkyELVwiB8ZSxhmDLQhtUn+Ojg==
X-Received: by 2002:adf:9ccb:0:b0:3a4:f7ae:7801 with SMTP id ffacd0b85a97d-3a8fe79bb3cmr805658f8f.8.1751019017581;
        Fri, 27 Jun 2025 03:10:17 -0700 (PDT)
Received: from localhost (dynamic-2a00-1028-83b8-1e7a-3010-3bd6-8521-caf1.ipv6.o2.cz. [2a00:1028:83b8:1e7a:3010:3bd6:8521:caf1])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a892e5f8absm2300301f8f.95.2025.06.27.03.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 03:10:17 -0700 (PDT)
From: Petr Tesarik <ptesarik@suse.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Keith Busch <kbusch@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list),
	linux-mm@kvack.org (open list:MEMORY MANAGEMENT),
	Petr Tesarik <ptesarik@suse.com>
Subject: [PATCH v2 0/8] update DMA API documentation
Date: Fri, 27 Jun 2025 12:10:07 +0200
Message-ID: <20250627101015.1600042-1-ptesarik@suse.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A few documentation updates:

* remove outdated and confusing parts
* reduce duplicates
* update streaming DMA API expectations

Changes from v1:

* move DMA Pools to dma-api.rst
* improve streaming DMA addressing constraints

Petr Tesarik (8):
  docs: dma-api: use "DMA API" consistently throughout the document
  docs: dma-api: replace consistent with coherent
  docs: dma-api: remove remnants of PCI DMA API
  docs: dma-api: add a kernel-doc comment for dma_pool_zalloc()
  docs: dma-api: remove duplicate description of the DMA pool API
  docs: dma-api: clarify DMA addressing limitations
  docs: dma-api: update streaming DMA physical address constraints
  docs: dma-api: clean up documentation of dma_map_sg()

 Documentation/core-api/dma-api-howto.rst |  36 ++---
 Documentation/core-api/dma-api.rst       | 191 ++++++++---------------
 Documentation/core-api/mm-api.rst        |   6 -
 include/linux/dmapool.h                  |   8 +
 mm/dmapool.c                             |   6 +-
 5 files changed, 97 insertions(+), 150 deletions(-)

-- 
2.49.0

