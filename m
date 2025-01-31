Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 007551CAA89;
	Fri, 31 Jan 2025 13:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738330344; cv=none; b=lzQNgo+vlJ5ce4YmkBUQ3HcXstpgrE0mCL7W2jdhew/wcfY7zmdsDxEPcgJpnsUsbQf3iYFob/RurHZ5mNGTd7w7r/dHkBvcnxLyerYBOjukflz5VejAaHeiBStAYeo4ARXUjQtN7fIRXFskNI0/zNbQDHTccNMmPsYONExWMVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738330344; c=relaxed/simple;
	bh=dpjgozNgAnyaH1ZawBMKFcClFEo/b4hEgrlu1dL25ps=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Es7mIbGhx+XoI2m1wFIQ7YYi7ZUtjJER+h6bobG26rkAMqdsCXDl+C/6D1j5+Mxh/cPJox1gt502ccwqJeRe4X6l8Hd+VlOMf1sAI68Orw6IENoO1SW4MNhQUuUc41iQCMyFEH6kjrFgHiPOCeFdDXBzPRGgUHxTwI+b6Rbyfoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZzdGGDv0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZzdGGDv0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFE27C4CEE3;
	Fri, 31 Jan 2025 13:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738330343;
	bh=dpjgozNgAnyaH1ZawBMKFcClFEo/b4hEgrlu1dL25ps=;
	h=From:Subject:Date:To:Cc:From;
	b=ZzdGGDv0lU2Ko6x3tPUvLhmFmjSRjfbk03tRTqSb4acSssKlO9GFJacJzhJejzknI
	 KdWzBCV0ae/mTTyNF5NjZUvYXmnwwYyZRr1aZc1UJ7kuvdA/twREIQRJH4+4+no1zH
	 0EmptX4imXzVAq5fFMDTVPgdjoedcWKvqgsGHbtOr+CgohtRMC64Ne7aaD5bo3ADYZ
	 /K3K3+0iaUIhwTTSTc4LvDdT/FC/ahz9/bWY+e1qsczQ+i2//WG8x3rVigA8mh9VnX
	 hXBuxzBBDcKYjl7QWwLhSe9u3TQJuaxSWPZzLA7CO+RVqtcd7/VkVP2mSHCxQkbQW3
	 QSVjnTxvyRHbA==
From: Andreas Hindborg <a.hindborg@kernel.org>
Subject: [PATCH 0/4] rust: configfs abstractions
Date: Fri, 31 Jan 2025 14:30:07 +0100
Message-Id: <20250131-configfs-v1-0-87947611401c@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF/QnGcC/y3MQQqAIBCF4avErBPSCoauEi1Kx5qNlVYE4t2Ta
 vk9Hn+EQJ4pQFdE8HRx4NVlyLIAvYxuJsEmG1Sl2krWUujVWZ5tEBMiaoPKYDNCvm+eLN9vqh8
 +e9rPXDz+MaUHhrn9jm8AAAA=
X-Change-ID: 20250131-configfs-b888cd82d84a
To: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Joel Becker <jlbec@evilplan.org>, 
 Christoph Hellwig <hch@lst.de>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Andreas Hindborg <a.hindborg@kernel.org>, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1964; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=dpjgozNgAnyaH1ZawBMKFcClFEo/b4hEgrlu1dL25ps=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBnnNB/rYG7rwVzKWV89nePEeW1cxaLz9vapmwu8
 2kjhKYU8z6JAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCZ5zQfwAKCRDhuBo+eShj
 d8BVEACEOGyg/UnRFK2aLpvhA6viNraYDej9AE1P8pWP2D0LVdf4IgIDDuAq1WktZN+KgyAbDDo
 HZqkuVZ1tUWCHssdvyKKz6sKChB2428Vh2jR7HfHH1RoqMT2JpTlEpL9EEf4UAce/s6LRFrKRKc
 WaecD/NEbmaGrHfSrLlFtC9AN8vaH9w7V9cwwpfCMiB3+mOHsoT6gKjzsJKqe56DQG+keT2dYOm
 xtpNwtZ3veR9Ieil+r8xEDsfwsYWAxSQinJjOisbZUUNoVcnu6/QL1Iqrfp1mC6ss9fKxpqGMBm
 kr7JtB65lctqdY4vTuDhJimEZwgoU0ktSZxBjGmv6CXv40pMQC+lYPjZv4aWK5ji1XY3GyJ1496
 vYkjE9Yns09y/x7DtrcYW5Yg6198Ay9weyRVplfF+9N0fjC0x2pr9EMEnPshlRMOBXzrKiyBL6W
 MPTaWjjT/dxa0v+hiyYZ9Bc/RWPO6bk46+5zpNYn56/xYl1p7W0KOsBKyuvzusx+Oj4LjTIykO0
 zHkJ14xl918PbaMAW3ncQO68SnP81qAYYs5/m7PNxNaRdywfI8Y5RK1DjxqS4fPqZkjyaRUC2nd
 PKM/+BwDEn6cpH/ECogMtx2p+TqyLs8/txHGIX20ZhR9Ip0YiXrZBMS0KJ+Zd6vJdv0kiXpKdJn
 6WinJUeidzBzYfQ==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

This series adds a safe Rust API that allows Rust modules to interface
the `configfs` machinery.

The first patch in the series is a resend of a patch that previously
appeard on list, adapted to apply on top of `rust-6.14`.

The series contains an example for the samples folder to demonstrate
usage of the API. As such, there is no inline example in the
documentation.

The last patch adds a maintainer entry for the Rust configfs
abstractions, to make it absolutely clear that I will commit to maintain
these abstractions, if required. Feel free to drop this patch if this is
not required.

The series is a dependency of `rnull`, the Rust null block driver.
Please see [1] for initial `configfs` support in `rnull`.

[1] https://github.com/metaspace/linux/commit/6a52980852f6a8c234ad06d53e57eeb4c870f472

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
Andreas Hindborg (3):
      rust: sync: change `<Arc<T> as ForeignOwnable>::PointedTo` to `T`
      rust: configfs: introduce rust support for configfs
      MAINTAINERS: add entry for configfs Rust abstractions

Tamir Duberstein (1):
      rust: types: add `ForeignOwnable::PointedTo`

 MAINTAINERS                     |   7 +
 init/Kconfig                    |   3 +
 rust/bindings/bindings_helper.h |   1 +
 rust/kernel/alloc/kbox.rs       |  38 +-
 rust/kernel/configfs.rs         | 811 ++++++++++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs              |   3 +
 rust/kernel/miscdevice.rs       |   8 +-
 rust/kernel/sync/arc.rs         |  30 +-
 rust/kernel/types.rs            |  46 ++-
 samples/rust/Kconfig            |  11 +
 samples/rust/Makefile           |   1 +
 samples/rust/rust_configfs.rs   | 192 ++++++++++
 12 files changed, 1106 insertions(+), 45 deletions(-)
---
base-commit: ceff0757f5dafb5be5205988171809c877b1d3e3
change-id: 20250131-configfs-b888cd82d84a

Best regards,
-- 
Andreas Hindborg <a.hindborg@kernel.org>


