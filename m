Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61B06548EE
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 13:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750772372; cv=none; b=bdZ9R9NRKvfJGI4P090WmsbFc3ltckEaWKtkLxCAF1Fcdnkxbx+D+UJ2HkIMCiRZgWS7zUjUVl3AcQbWN2zBo6nOgGyebjpwfs3aonKI2mYK0YNDKbqVHlZcuImF4F92zusXk8AWX0GKY2SoBp/qqZu1DB9knItuugLjBi3W05g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750772372; c=relaxed/simple;
	bh=ncYNDjhndz7kqcJVLVQbBNAMrG9V+TdPRtP2T4abi2Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=H+t9a9VaLzjRV/i2zwAxt/T1lya2IDstpYf4YUMwQUu81xk4arVnSb2ieVvrRTDoevr9KrCXv2sM48hHM1Jv0BlTaH5STkzppOLq/CcHmLDmNebY783awY2PUq2UkkF4KFY3eaehP5THIkcFYovJ/g9LIeMSx2IJL4qSiVAZeDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=SFQGJvfu; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="SFQGJvfu"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a5828d26e4so806691f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 06:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750772369; x=1751377169; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fxjDIBXMuvdPXWJmF9qZYgeWhojZt27wnvO4wkpwI2w=;
        b=SFQGJvfux5u8aijYtMK/vQYkkwl0++x6BtcO8fj4bUL/i5L9z4xXy9czHlOocCS4qn
         38VjBmsFYV0/jkeDj5EF1BCHqRPV+YMfwAZkHF5qKeJ8to7YcQRsze/kdMAGG270gnh2
         uKF08tEzYYm/n6FwJ6ixDb1a8Fpz7BX/bTqBGqsFtCnwK0Xl4F6fBkCGOSQfPh19agmM
         xp7iuqkYH6aWYC1XZoK15SIfVA+2WPs8rmJzCrV6DnWCQ9izcmppP8W8fz8UfhpWfwCP
         gbrDVfmXXyLu4EJIBSUyLlNe5bHTtouYDsqr9Rjfby+EVVv8O96mKyVuNYf8zsqDliZc
         YqgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750772369; x=1751377169;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fxjDIBXMuvdPXWJmF9qZYgeWhojZt27wnvO4wkpwI2w=;
        b=opjYPN+8BFENWArw/W2Xi56r7vbz/klomG55dJ8YPLe0ORajVuis73Wj0PLkdSMDNq
         r4G+C5YVWUBmoRTutMQszmvYulaoF12+qjh351nahyxfTbc90Hww95YkVGGCg7eB2iYe
         uj3O7povjXGjAcXFdA0xl1W4ikC2hUvOFfJjOsNBB3QkUjLfr0+51ha4JlOB2EC2vGNn
         BwN6S4cgLtR2G2TAr9t1H6Y1VR7hewtFpVdmeGF/1r3mdADAAZlvOWUh3IE8AR6EhsPn
         4ZhrBb+QKonr9P+lrb7dOoeSqQLbFyHkhnGYK+hZzJem/JkOemOVjgxQl3vQuSGrCaZy
         nOiw==
X-Forwarded-Encrypted: i=1; AJvYcCUTaimqzHPIpT1KHd7b/ZrRLlaf12V/mvRWcfOKB6xEFm8A46aJV3/qSi5UxiwdlE8+CiapULOrO0HL0jQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwgYlcoSJ4e0tgibwuFmnjgh02uIithDUO092mquM2IogQHUdWr
	VY+gtPxc+bOMyH+NRy5BdAY1CGTjO5vdQVTV0j/9ATx21jyWM2xZ/mvsI17dLtQf3yU=
X-Gm-Gg: ASbGncuW/5z7HSPARCgLwocSFtyINPxtgZDlnZW4WpdisDZQld6oJLZ9J29GOP6m+j2
	8uCQh4Dqtz80L+EOiyRJ45HMdZVGXj00axn3ivnn8krPs43Bh9EKY3QdwxwYei2qKp9iM2tSFqJ
	3eVaO7tQ0PJanPve5iksn/BUZCQfFsTcq8PIhxRr8vCsQqOloRSaa4DjdQ6apOH2gF0mdbFa5U8
	GBS6xF851e8gAvYk1A/D6pVX/L6HlZa2rxEiEGlztngHPYUM8gUOslPm7fmfzQmvR9fpvXit7Eo
	9CrlCj7/gdjF5Iy+dOWAiynEq7frLHjmkz6wA+0BjNMFc2CroQAP4wWe7x+46hSZOkL9JTH8ahE
	uETEgMcy+IOmNdT9Ww4wWtHwzRmJmjrfhOmehRoLYyId7HNgrtbr9
X-Google-Smtp-Source: AGHT+IHQyrO4iqMSd7VpKmuXfo0VLyy363LPzuPbS8DTxE31tKkFh26zo1Cks2a5Rs5oGEGjiBKI2A==
X-Received: by 2002:a05:6000:2211:b0:3a5:7875:576 with SMTP id ffacd0b85a97d-3a6d12d737bmr4870971f8f.1.1750772368675;
        Tue, 24 Jun 2025 06:39:28 -0700 (PDT)
Received: from localhost (dynamic-2a00-1028-83b8-1e7a-3010-3bd6-8521-caf1.ipv6.o2.cz. [2a00:1028:83b8:1e7a:3010:3bd6:8521:caf1])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a6e805e828sm2040400f8f.32.2025.06.24.06.39.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 06:39:28 -0700 (PDT)
From: Petr Tesarik <ptesarik@suse.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Morton <akpm@linux-foundation.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	Leon Romanovsky <leon@kernel.org>,
	Keith Busch <kbusch@kernel.org>,
	Caleb Sander Mateos <csander@purestorage.com>,
	Sagi Grimberg <sagi@grimberg.me>,
	Jens Axboe <axboe@kernel.dk>,
	John Garry <john.g.garry@oracle.com>,
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list),
	linux-mm@kvack.org (open list:MEMORY MANAGEMENT),
	Petr Tesarik <ptesarik@suse.com>
Subject: [PATCH 0/8] update DMA API documentation
Date: Tue, 24 Jun 2025 15:39:15 +0200
Message-ID: <20250624133923.1140421-1-ptesarik@suse.com>
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

Petr Tesarik (8):
  docs: dma-api: use "DMA API" consistently throughout the document
  docs: dma-api: replace consistent with coherent
  docs: dma-api: remove remnants of PCI DMA API
  docs: dma-api: add a kernel-doc comment for dma_pool_zalloc()
  docs: dma-api: remove duplicate description of the DMA pool API
  docs: dma-api: clarify DMA addressing limitations
  docs: dma-api: update streaming DMA API physical address constraints
  docs: dma-api: clean up documentation of dma_map_sg()

 Documentation/core-api/dma-api-howto.rst |  36 ++---
 Documentation/core-api/dma-api.rst       | 173 +++++++----------------
 Documentation/core-api/mm-api.rst        |   4 +
 include/linux/dmapool.h                  |   8 ++
 mm/dmapool.c                             |   6 +-
 5 files changed, 85 insertions(+), 142 deletions(-)

-- 
2.49.0

