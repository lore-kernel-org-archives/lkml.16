Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C039720C030;
	Thu, 10 Apr 2025 08:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744275566; cv=none; b=Jn+CKHIBnomusOn4YMk5mw6rCqCKriWfBwgIy3zVziCj1nxI28167dWDw6TyuNeQegjeCOn962qy8pzsijCXO0EovsXg03k+SjLcu6i/wA/CAN94I4v8t+viwCwTtY0vZlXTYjc13nXD19pzkwP0SNm/Rh0+nDSlA5qvfdRTJBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744275566; c=relaxed/simple;
	bh=N627E5jZKLaf+a/aM6GqmldS3P+0rZzVxq+N8PIKrco=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nd2CRh+BVFWrf4rKwM23qcxsZa0w6beTI9jBZJNCbOpze9lELAJtDumnSzfVSvZI6fSydttMqZPFmQoMnonEFrRMR8mNqoGtY7TVWSTnGdnUAWxNH5NHH6gggdttymAEb9XNlbNUrLkM3MwLs8upg2pOV+0CUzRSF8MDKFNfuVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HJ+EpdgE; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HJ+EpdgE"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-549b159c84cso674531e87.3;
        Thu, 10 Apr 2025 01:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744275563; x=1744880363; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zkRCxQpoiKpq959QZVGdvZFLEItmCPQnXnB8Wl2Ra+U=;
        b=HJ+EpdgEb0b2inGvN+Oi4q1JtTqyPRlZXMjK/syWaaGUQHiYhHtKpITY+0KvSs1tEi
         A4nOmMAO8OuzckuLig/50tRWsijQjA2mW5CdwsORrkXXYevYwohZpWG1TDU2O9Ki4KmC
         adVpo3jEXOT+i4HZmyO51O7RE34B8uAzrA6OBUVmRTG+WHZNhFy8X4bBxm3s2falviCi
         hk8BwMM5R1iM3/mwSclRlffGZWeGxBmbzm7uhWJmLH1fHA4ABr2pcZo7TEAgM4BjLkJ2
         bb5QO3iFeGHRtwScWpyDRuA739j6zFKRtt3Wck/c5gw3UZvcdFYKuriScctJ6kS0OfHs
         0iLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744275563; x=1744880363;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zkRCxQpoiKpq959QZVGdvZFLEItmCPQnXnB8Wl2Ra+U=;
        b=o8fpJo0Nkexs58AeHXh7Uax2bnjjivY4TpF6ux5N/W7eaeHWPkQUqZjTGN9EY67l17
         w3g/9JTfsmCRPxMLfU3I64d9zkHhKvhGOr43/D783uZ+pVOTmRuWjixTGGl93PRCG40s
         eki7Lvh5jtTHe4gA5Rvte3jhuc8ZU2vtXfXqFJGGcNVe+UwvUjoh9qEjB+KIsQycvhht
         eh1JN2eKjhMz0KizMd4Iv+mHea+dsuSwK52FI8uedTNB6sGL8dIo0yehUkmIYtJVWCMW
         /KIv6fcmj9ikVfcMtjkqzovUaPXO3s4Rwe/ASkrvXBZn6DhOIeGDoOj+eZEUB77561Wu
         LYAg==
X-Forwarded-Encrypted: i=1; AJvYcCVvTP/lQ8NU9jQtNiv6RDNd6PagopGmNo6eI5Lg0v7bPttThVmZTbZdzD3H1z2OK6zsBYjpfF8XzK9o/CTpQmE=@vger.kernel.org, AJvYcCVz/M3UmOIrydQWv739w07dItCvawmc1xr4rLdaLntJpJ98+pYLSWA8OcF5rVA5vsJm4m9ldMAQ550oZlM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzaL+XiztTTmkYjeQhFcUK8tKz8DkIrGcAagit4+G5t1UTsWPMV
	c7yN75vv8m+CRIH8P+l9jcyPFUZkMpaldSzxyt3+nKTbfTO/sdHQ
X-Gm-Gg: ASbGncs/SGmpEpW+qvC+a1JH96FT/XSJ6FiG0TWnBpkUvE1Gfo90YRNWlxOEGOubKuy
	13rGiLODBnfqhHDjV1+S5m1HIIALC6wPVJQWjPB6un+pvU2Ds0hGD+LT9YB7J3fHX4l6V1JwBgc
	6m1yjl3yaBXXVpr2l4MhXA5syq57omXuL/0Jiy+z3K7pAtiCR+JrcIqtoNIQUOdVMJXfWIraJFW
	4Wj4Z5QcF33Rr18U7QVGOD+5jV2fJ3Y7vaSu/6HI8PUkX3CGlfWLQys7Stu1lH2LqseINyYwlnt
	XafzlK+wXfCk4ifZXafMwyS30BsYAa/0Qidwlh0YCzZcMfjoHQq1/I+uzhqWYAn0GzdxNf8kOfn
	qYBv42s3GGABFkbs8GZyhswU1DA23
X-Google-Smtp-Source: AGHT+IE6NExB+uwP7ot68Q9UpOoDvF2vSABUBzgEGo36Z21gac09d/mjar9ZjsqStikMIHCVsjTnZg==
X-Received: by 2002:a05:6512:33cb:b0:549:8d67:c48e with SMTP id 2adb3069b0e04-54cb0bbd08fmr487055e87.29.1744275562557;
        Thu, 10 Apr 2025 01:59:22 -0700 (PDT)
Received: from abj-NUC9VXQNX.. (dsl-hkibng22-54f8dc-251.dhcp.inet.fi. [84.248.220.251])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d50285csm80875e87.110.2025.04.10.01.59.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 01:59:21 -0700 (PDT)
From: Abdiel Janulgue <abdiel.janulgue@gmail.com>
To: a.hindborg@kernel.org,
	benno.lossin@proton.me,
	rust-for-linux@vger.kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Valentin Obst <kernel@valentinobst.de>,
	linux-kernel@vger.kernel.org (open list),
	Christoph Hellwig <hch@lst.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	airlied@redhat.com,
	iommu@lists.linux.dev (open list:DMA MAPPING HELPERS),
	Abdiel Janulgue <abdiel.janulgue@gmail.com>
Subject: [PATCH v2 0/3] Additional improvements for dma coherent allocator
Date: Thu, 10 Apr 2025 11:58:15 +0300
Message-ID: <20250410085916.546511-1-abdiel.janulgue@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes since v1:
- Pull in reviewed-by tags and include links.
- Improve error handling in rust dma sample driver.
- Clarifications in documentation.
Link to v1: https://lore.kernel.org/all/20250326201230.3193329-1-abdiel.janulgue@gmail.com/

Abdiel Janulgue (3):
  rust: dma: clarify wording and consistency in `coherent` nomenclature
  rust: dma: convert the read/write macros to return Result
  rust: dma: add as_slice/write functions for CoherentAllocation

 rust/kernel/dma.rs       | 151 +++++++++++++++++++++++++++++++--------
 samples/rust/rust_dma.rs |  25 +++----
 2 files changed, 133 insertions(+), 43 deletions(-)


base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
-- 
2.43.0

