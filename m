Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4EB28634A;
	Wed, 28 May 2025 22:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748470564; cv=none; b=HLAPOU6RwaEe7zsHDKQ6czWHU8RM3Qt9HfyzgNMEymSWr79ziiGM1YWDWUJoy+GL9Z4em8KIhe/HAQ3sjJVoaG5WUuFDyE0B/ANJwobqIlIftGBorpY3/bRY8RJsQSH8KJKeya4RmNLy4HTbOLyEOMOvt9IAj6eqbzy/0gfa+8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748470564; c=relaxed/simple;
	bh=yOrU7SGPQ3OrGhFEa4kTFyzjCvRlbqHUS+eLZvJ2fE8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TG/6RBxKDyFbBrnrmmG3UQVRwJzXKvdC0YeioJHiDZquHNjbbV7nyTib08k12YFR1ucukuLKGNGV87FR0Hi77jOvI6VAwXKpp+4moFsDaR82qSA54pqz9vBZlTDjOFh0osPUsVwqDA9EciAP2mgJOOL+kQnIwq6VTgZo7etJvYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=agST2RTl; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="agST2RTl"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3292aad800aso3946981fa.0;
        Wed, 28 May 2025 15:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748470561; x=1749075361; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sE2bIPrvcBK+tw3u4Z3n9q+Um+FsoesBae4mFssigCg=;
        b=agST2RTlfZ7Mj5aeBmC2sd/TLjQNngACJBoktCT6kdiSXgn+9iHrjLJ2SsIeCXyyf7
         OBaLcj+1LxZet2yAOoiZejPXDeBrV+8/to1jl1vLUVF0xftA1zHh4zn5uwUNorttALYs
         wiBapRq1x57kJFAvSPbGRJPc44dh9A+ufWbbzrClknDo1tiCkGpT+tnnF32xwMhn63Gp
         K3iWy888Y3dsEGyxJy7v1NMl9Q6nCJShL+ppRet5Mm5kwmBxxHdXOcAyc7mPqBTcq939
         fBoIq0ofZaQlo43g/k/M4jxfDNO13LprKIU9zbl5KOUpmD0mCLs2hQwNYOS2HxkI2ZUF
         HOFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748470561; x=1749075361;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sE2bIPrvcBK+tw3u4Z3n9q+Um+FsoesBae4mFssigCg=;
        b=D8mkLAXDJnErjX/VcMomcWW8PagHPV0QzjRlTR9DJldyK2VAx6ci6hrwHwbcoiHeD3
         d32ra6aDj+khZdv6myWXdvWAP4RLLDUWXa9afgQRjZ5z1qbEo+ken8eHNOZli5FT3BEZ
         CNkGi+EZvwksisaZdCZ6O2bm2XeCJHImjLwf1eGIEAfaFMFvsZzQOI11fz8gqsrt+vQ3
         XpICpUONrASUBHUpSF6uYYb0c18K/Z1GdABnHWrzXa679UrlrcLOwYhdK3wX3WLFGoBX
         ycZcIt7PpPMyHsy9asallO3asC70glTB/vyeSf+ome3dPpwCDpRwci0+wJSV2hmnwQQR
         ApHA==
X-Forwarded-Encrypted: i=1; AJvYcCWTAFCYsxoY55rmsUrNVWanBXQHu3MrnNjDQ7FiqZ+QGrfvh+qD1A3lEokVURwAM26sEeo8oeB4iadQgO3boCI=@vger.kernel.org, AJvYcCWX4Kvm607fPNm8hlaQdgMMV15dZWRwPtoQctPqqF6ufF0oHBPgow0jq9bnV+Td38dlloUFruLvyZwd6pM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7MbHUlalw8B/KIn46P+tIXjzssZptalDNYKTen9CwtOAo7Xci
	19JmQLfkpj3grX6IfQQK0tNaSnZkKj6m71UbgAi0ldEZUCIRPDazHj88
X-Gm-Gg: ASbGncs/iroK+BkAPFMwY9379kn8J0FHj0SDJqZKgh9n09EaZ6ol+BfLwJJrsHJ1xNl
	P+hGAXg9szDtKVekNZdY0gEBW7C54hi9Coyvg/HK4dI1MvElHy2+etMORssTtbopqlXxkCfblL+
	eovI1Bfh1RJUZ9DtNqHLXI3F6aOU7H9GVYE1ZhG9e/p9h8Nn2Q6v1VqzuZGbcrH0+Tmc+MxGtpg
	vYoXNC8+zrDrQw9ak0Ft+4x9zarJP6ROYjIWhUsn13uyU/H1iwYBa2NPFJdf6ATDoRQKbYuh1sZ
	UPsjmTrPGGWVt/9B0qT2pTKs6gi+wYZL7lJ0qJh2PSohvKOHMrm4SwQQjobgUGy3+YPaW0L1bdM
	/ANzqlLM2zaZTLZ0ZaJeF6ijXRhcQ
X-Google-Smtp-Source: AGHT+IFuoR6xo29lnwzewO6jtWGAATl3ZfrBI/QrwrebjbEHcd1CciMFpJdZcqrbHs9oVwEdqnG4bg==
X-Received: by 2002:a05:651c:19a2:b0:328:ff56:8da with SMTP id 38308e7fff4ca-32a82663ecdmr3777741fa.16.1748470560547;
        Wed, 28 May 2025 15:16:00 -0700 (PDT)
Received: from abj-NUC9VXQNX.. (dsl-hkibng22-54f8dc-251.dhcp.inet.fi. [84.248.220.251])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32a85b55de7sm156911fa.53.2025.05.28.15.15.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 15:15:59 -0700 (PDT)
From: Abdiel Janulgue <abdiel.janulgue@gmail.com>
To: jgg@ziepe.ca,
	acourbot@nvidia.com,
	dakr@kernel.org,
	lyude@redhat.com
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
	rust-for-linux@vger.kernel.org,
	iommu@lists.linux.dev (open list:DMA MAPPING HELPERS),
	Petr Tesarik <petr@tesarici.cz>,
	Andrew Morton <akpm@linux-foundation.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Sui Jingfeng <sui.jingfeng@linux.dev>,
	Randy Dunlap <rdunlap@infradead.org>,
	Michael Kelley <mhklinux@outlook.com>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>
Subject: [PATCH 0/2] rust: add initial scatterlist abstraction
Date: Thu, 29 May 2025 01:14:04 +0300
Message-ID: <20250528221525.1705117-1-abdiel.janulgue@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello all, this patch series is the next version of the initial
scatterlist rust abstraction initially sent as RFC[0]. I appreciate
all the feedback especially from Jason Gunthorpe[1] and Alexandre
Courbot[2] in shaping the design of the API.

This particular version implements the typestate pattern referred to
by Alexandre to fix the limitations of the scatterlist API. We now
have two iterators, one for building the list and the other when the
list is mapped via DMA for a device. This version introduces a cleaner
flow of the state transitions and enforces restrictions in calling
functions that are not allowed in a particular state of the sg_table
i.e, querying the dma_addresses on a table that is not yet mapped via
DMA or setting the pages on a sg_table that is already mapped via DMA.

Doesn't apply to rust-next yet but is based instead on top of
driver-core-next which provides the needed Device<Bound> functionality.

[0] https://lore.kernel.org/rust-for-linux/20250512095544.3334680-1-abdiel.janulgue@gmail.com/
[1] https://lore.kernel.org/rust-for-linux/20250512164247.GF138689@ziepe.ca/
[2] https://lore.kernel.org/rust-for-linux/D9VWA9ZQLY85.277DFA3YTH5R0@nvidia.com/

Abdiel Janulgue (2):
  rust: add initial scatterlist bindings
  samples: rust: add sample code for scatterlist bindings

 rust/bindings/bindings_helper.h |   1 +
 rust/helpers/helpers.c          |   1 +
 rust/helpers/scatterlist.c      |  25 +++
 rust/kernel/dma.rs              |  17 ++
 rust/kernel/lib.rs              |   1 +
 rust/kernel/scatterlist.rs      | 369 ++++++++++++++++++++++++++++++++
 samples/rust/rust_dma.rs        |  21 +-
 7 files changed, 434 insertions(+), 1 deletion(-)
 create mode 100644 rust/helpers/scatterlist.c
 create mode 100644 rust/kernel/scatterlist.rs


-- 
2.43.0

