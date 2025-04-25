Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 408D6217727;
	Fri, 25 Apr 2025 07:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745566663; cv=none; b=WRxyCv2wPE2l8DeKKrPsDnbePsKztIRO4SWcvsaYoJ/zTARWEY6h3vJsczZUi6dj/WaBV9hjf/wZRONTb031yZSmN2hz1J3M4CL0NU9TYGJPGDcsS28zDPUOJFIiglCol3cIyZMLpuiLNdTwUlcKaMsVtI6/cvMlT8cJMJA9dCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745566663; c=relaxed/simple;
	bh=t+c7p3hXTF+xTlc0Km+48d+pPuhuJBf8m+A71HAjDKw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=id5IK8ageLnAsoSnINVmwDuU5wukGAYE96GVOS4fJrJSrb0bA7+UBDjsoRXoYBbcJ4U1SAm7VwZ7JIbPJnLJG1Z7rff4AvtkbaxkewMlkdhO14DQGIvDlgjUU/K1506IYQDmAcSCIWw0kqZDNWEvRCHqIgRAzkaRn1eQEU2lQ60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W9q8wI5E; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W9q8wI5E"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-54e6788d07eso3271202e87.1;
        Fri, 25 Apr 2025 00:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745566660; x=1746171460; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mnIim+RQL+Hrsqs0xdul+xxqVCFsVQjL6+9pVyg8PoQ=;
        b=W9q8wI5E1KVpDB7nElC/rP2ciPFIs71BkYPSafHNItPGt/klm9H6czO5mrD4SkCglA
         gIzapSmgXklLmGtCFvIqeJKYGpXY24koNHnthvX1vA2X/RSnHUfnyqBvhSDqU0jQJNa6
         oz7O26gsYx3U4kh8RTWAN6DPigk4dXaqVzl7QkKrEXAxbmgTOheIa6qX7nhusXiZrv/B
         4vujw+PfCngFkbaloEJXspEjrmreSmwV95wWIBC6wOpahSaFpkS1kwphyXqEBrLUhAFS
         Fp/M1ArYwxFZ4H34RDL8Ia4Y8d0Rcar5oZl+Q8eDq5Y+lkYRr3vdb07OxRQwI4d4S617
         mT5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745566660; x=1746171460;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mnIim+RQL+Hrsqs0xdul+xxqVCFsVQjL6+9pVyg8PoQ=;
        b=bA9il0MX6U8mS6XiJ2coCTtZAGWzdGPI/Zyl1SmFrX8iYGu1hZNvMX0WvLN7JN/Rdh
         stndtQagEwyHcM6gi5zeem5b6yAQAvAV2DoOacI10i/+W00+QYQmTPD8NeSDHyMbubw9
         ldzQWoVyigpduYHnWoSw23TO4fezCeqbtkOz5gLj7HLZSJ1Tv1S5K9H3fiyhIExGwit8
         UY3kW4e5fGpYdCsn5uhHAib8fXMTT9BYZwXxGtzN+17D8o7s7SUrm5Qc4PsfscwmRGYn
         VKkifht7B4dKh6wbr88TNgsp4XGak7p0RWhnXyIhggXXYCEb6l9bcvBFEqq7HCdWraET
         d2yw==
X-Forwarded-Encrypted: i=1; AJvYcCXKmYzoXUy9cZ33yECwev8WXT1rqF+QFAdJKjkibCjQD4xDXwRe0jDWycqIPmWGMynJi2igmx0kXrv2tdU=@vger.kernel.org, AJvYcCXWWeG1qFBf3ppO7npxoMaZk2UaWaJYKsQLKnIJoDhAeo6t1jTTcFUmL6wCFMuSfvi2lcvWt5cutJDYVnbkLPI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBSnUXy7aIfDP7CiO3OzSPXJC3E1pLVFj47g4tNGaRSzaGA47U
	agTUQmq5apkjwnRPN6ozwsyEuqXoVlUEb6ySsjEPTdxauaT877wo
X-Gm-Gg: ASbGncsr4vkadH2kquloLeBeIWZakrCbifBsUBt1nXJ578KSkItlO2EwqEb1v/EkkfW
	H5i6tRPo7M12aiwj5M+/2DSHxVRbInmSv90Xim8sdEByPo8FlKWgJgRoP6LFaPvyKMoN8toXHjV
	KIt31fkc3qcPA/oq8ClqyonaAmHyWBymi277wYZTpi8Sc+hXLvimNa18g7/WAA0iNa0Zm5c+OjA
	PKATEjiAKUIsP0/uq+PjbzcZC46TV4dNkz/ozlcPij19TKSH+arvoic/VkXzess18lXcz6Ea4Fn
	QcKxHk1bO6n0YZEUW7rK7D5UWT8rruqgrXsSmvm7EkI8UUmeGwqVJitaQE/74oU8UtmHPVKonDX
	b7mt2mD84jB9OBIsegg==
X-Google-Smtp-Source: AGHT+IEZcJwlsd0sqDyVM7rduSdPLrkIpl5/mpahAAlSrYeCBg72J5O925aQVXmVaHNs9sZE2AniFg==
X-Received: by 2002:a05:6512:33cf:b0:545:2474:2c9b with SMTP id 2adb3069b0e04-54e8ced7fe0mr299265e87.22.1745566659971;
        Fri, 25 Apr 2025 00:37:39 -0700 (PDT)
Received: from abj-NUC9VXQNX.. (dsl-hkibng22-54f8dc-251.dhcp.inet.fi. [84.248.220.251])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cc9e9a5sm504391e87.132.2025.04.25.00.37.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 00:37:39 -0700 (PDT)
From: Abdiel Janulgue <abdiel.janulgue@gmail.com>
To: dakr@kernel.org,
	rust-for-linux@vger.kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Valentin Obst <kernel@valentinobst.de>,
	linux-kernel@vger.kernel.org (open list),
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	airlied@redhat.com,
	iommu@lists.linux.dev (open list:DMA MAPPING HELPERS),
	Abdiel Janulgue <abdiel.janulgue@gmail.com>
Subject: [PATCH v3 0/3] Additional improvements for dma coherent allocator
Date: Fri, 25 Apr 2025 10:35:39 +0300
Message-ID: <20250425073726.1027068-1-abdiel.janulgue@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes since v2:
- Rebase update, add fix from Alexandre Courbot, commit clarifications,
  minor sample driver improvements in error handling.
Link to v1: https://lore.kernel.org/lkml/20250410085916.546511-1-abdiel.janulgue@gmail.com/

Changes since v1:
- Pull in reviewed-by tags and include links.
- Improve error handling in rust dma sample driver.
- Clarifications in documentation.

Abdiel Janulgue (3):
  rust: dma: clarify wording and be consistent in `coherent`
    nomenclature
  rust: dma: convert the read/write macros to return Result
  rust: dma: add as_slice/write functions for CoherentAllocation

 rust/kernel/dma.rs       | 151 +++++++++++++++++++++++++++++++--------
 samples/rust/rust_dma.rs |  28 ++++----
 2 files changed, 137 insertions(+), 42 deletions(-)


base-commit: 9d7a0577c9db35c4cc52db90bc415ea248446472
-- 
2.43.0

