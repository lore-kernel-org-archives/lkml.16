Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B5B1AC88B;
	Thu, 26 Jun 2025 20:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750969977; cv=none; b=Vva0gSMlyBuqs4kA2EWYAqUmH1+zPg/d0rMbUMb1NYutgp4Lh40n/jVK6yeCt+9u9CbSj6tPJrzOZDvgSBRY99tcDfA9riggrZQnrHbV71GBx4++ElLtgPrp+a7IkSGEGzNvvXnhw/TFv0uZ1IuYfP9rsYrB7NYsrGR4piFqL1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750969977; c=relaxed/simple;
	bh=NxaoikWWKYzV5QejK8n9/JfhoZy983I+9kYK9QzYnMM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AL3wAbF6B6R3naTe88Ac+uFNqmQXqXAGP7vI8zEpWnAGswAFzUzb/qeA4MD4kTi8D209vnr6RvmVLmBYIhjL6Kf6RP2wt6GnKvBlbzBXHxkXXKQCNOM4oZnUwF4Z3PAQ5q7QnGPB+cbPorZtABuUioDo1kwytr2BcYPIXOcnq/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jNBYj7v6; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jNBYj7v6"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-553cf020383so1594536e87.2;
        Thu, 26 Jun 2025 13:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750969973; x=1751574773; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L5s++U0umyHNoKeAuC41JGj9b55juJR9+534lcM7ZpA=;
        b=jNBYj7v68nc9Rtu6MY8m5arB0MoyBNWBIa5kf7BBVb8lMe25vrOBqW5T9JlfhgsTgf
         4BazIejxWc5TuW4CI2CMI5ojUtkfxW02rp52BCwUp+uYf18bLF6ts5nb0KFyv4NUDbCc
         9fj2Bot1J4smqRfijMESppbcyqlPEKaM//OoK8FjEBsGg+8gXFhm0R5vxywlV+krfxRh
         bk9DcOuLSVa/b5TebBBEQdytHoCG5LVWM7w58goP0HBQ3nyCMI2SPv2QzP2l0eMeP7Q8
         k6vQhvvcwfKtJyTBn2Q9D96mCX25p6FkRZq0kcAPkGCTNWWl7TkSa5bN1iY4G0HN/bdp
         wSUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750969973; x=1751574773;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L5s++U0umyHNoKeAuC41JGj9b55juJR9+534lcM7ZpA=;
        b=MoB1iL5bsW8RmBMfts2Wl8BDubvk8ExcKhZl9CrmbpvEtTHoRCMFsg81TgymhdCQb8
         rYjXbzgx4TJp8NJehSLkF5HQRX5uG2OBzCw+1/E59iTa5hDRVgGH8kdsCs3ZO4r1g9fC
         MbSjoFrVes+uI4VBsTT6FFSfd2WoG4J9KxEHfOAMgyiZZrM9UqfoBhCXteWgsvnVSa5h
         SYmVbb5UK6uel4amZr0ehLcZ/gGkBLADfaS/Wep3NA6WyBPo1P46ieUAZcj7JfBj2oKj
         j9ODLgj71+iVFAfil4/meWES4FqKYqb12GJ3bXXgizVtL21NjUF6iA1DfmJvDFkEkRCR
         MWdQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDFXfCmP2SUIZZwbpf1E9xy1b95DK2g33sfeqITEynQMOxQnPlmNCr8xbTJekazgXd197hpJdteUMfYuw=@vger.kernel.org, AJvYcCVJjlpx6h/GpZTJiTcLiEiZlR03YJjXhi/ejYi0bx26XWfZtba17qOdy6pEkSqTz5EjS5hs/Anwhb8fZrahVBs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxa6g1rjKruC/IZRtdzxHi8Y+/61Lv89WvzgUZc7PaUOg8MPUFj
	urfHvJtNyn7vf4ZGv/RSNe0Z0F0GTAVBHseUxJVtrNC6bpTilvVduUw6
X-Gm-Gg: ASbGncuPksLwzzmpwz3Krn32jQMghYdwCp2rHWb7Z05/Zu/LhRTJe6PiLyVUfGRVSFe
	I7PYBVsKOXjANThxSACYlzuJ6pKWMMLprOe23GmpKY0H6xl9bQncuKQoRx86lpzpEOCL9UaJoGC
	LPjY1m9lbv1LsdoxE8eMfCTjAdqW6FEyMeqRdoPanx0Db2JLcB+13T/nssAtlFaydzcE2efVe17
	h7F51+y4OM2eG22BvSa2hIB+PH919TK5PkGdSdyfHzyhYJrunJozd5PsseYcq8MrsolAnSfI2hs
	/Aaf1CJ7Z5fpY8ZuJ8K6eT8353Pi3tkUdBB2tO4tdl4REF+/Ex3AVQxpONULCg1ZpkacMqmuQRY
	gAZled4j9eXHLxXFC+BINMcDmPK+Nkh9BWO1RmE0=
X-Google-Smtp-Source: AGHT+IGP7ZuwCDqeZjCBxqR5XKarIbFCcj5/SQroX+zbJQ0cmAChrym66sKvNxs2Vb5InXRZDBfTAw==
X-Received: by 2002:a05:6512:3b9a:b0:553:a77f:9c45 with SMTP id 2adb3069b0e04-5550ba16fe9mr316348e87.39.1750969973335;
        Thu, 26 Jun 2025 13:32:53 -0700 (PDT)
Received: from abj-NUC9VXQNX.. (dsl-hkibng22-54f8dc-251.dhcp.inet.fi. [84.248.220.251])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2401f7sm142363e87.30.2025.06.26.13.32.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 13:32:52 -0700 (PDT)
From: Abdiel Janulgue <abdiel.janulgue@gmail.com>
To: acourbot@nvidia.com,
	jgg@ziepe.ca,
	lyude@redhat.com,
	dakr@kernel.org
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
Subject: [PATCH v2 0/2] rust: add initial scatterlist abstraction
Date: Thu, 26 Jun 2025 23:30:06 +0300
Message-ID: <20250626203247.816273-1-abdiel.janulgue@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi

Took some time to re-work this after the initial feedback but here is
v2 of the scatterlist abstraction.

Basically what this version accomplishes is attempt to enforce proper
use of the scatterlist api for device drivers in Rust. This comes down
to a couple of things:

(1) Ensure ownership of the backing pages is moved to the sg table.

This is done via the SGTablePages trait. By allowing users to implement
this trait, we allow users flexibility in how the list of pages are
stored and organised. During construction, the sg table takes ownership
of an object implementing the SGTablePages trait to build and allocate
the sg table.

(2) Prevent invalid use of the API such as retrieving the DMA address of
entries of an sg table which is not yet mapped for DMA. Another invalid
use is setting the page entries of an sg table which is already mapped
for DMA.

Safe use is enforced using Rust's newtype pattern which allows us to
ensure that only specific variants of `SGTable` objects are allowed to
safely return an iterator. For example a `DeviceSGTable` (a sg table that
is mapped for DMA operation) is the only object allowed to safely iterate
and retrieve the DMA address for sg entries. A `DeviceSGTable` object
likewise is returned only by the safe variant of the dma_map function.
Also, the set_pages interface is now hidden from users of the API and is
only internally called when building the table.

Lastly, a glue layer provides unsafe interfaces to help in writing
Rust abstractions for other kernel subsystems is provided (currently
targeting Lyude's gem shmem work).

I'd like to acknowledge Alexandre Courbot for providing the feedback and
initial idea for the SGTablePages trait approach.

Changes since v2:
- Drop typestate pattern. Introduce SGTablePages trait to enforce ownership
  of the pages to SGTable.

Link to v1: https://lore.kernel.org/lkml/20250528221525.1705117-1-abdiel.janulgue@gmail.com/

Abdiel Janulgue (2):
  rust: add initial scatterlist bindings
  samples: rust: add sample code for scatterlist bindings

 rust/bindings/bindings_helper.h |   1 +
 rust/helpers/helpers.c          |   1 +
 rust/helpers/scatterlist.c      |  30 +++
 rust/kernel/dma.rs              |  18 ++
 rust/kernel/lib.rs              |   1 +
 rust/kernel/scatterlist.rs      | 390 ++++++++++++++++++++++++++++++++
 samples/rust/rust_dma.rs        |  29 ++-
 7 files changed, 469 insertions(+), 1 deletion(-)
 create mode 100644 rust/helpers/scatterlist.c
 create mode 100644 rust/kernel/scatterlist.rs


base-commit: 0303584766b7bdb6564c7e8f13e0b59b6ef44984
-- 
2.43.0

