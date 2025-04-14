Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 534AE2D3A6A;
	Mon, 14 Apr 2025 13:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744636781; cv=none; b=ptyZG1niZ2q2QvDb6TOW2EiPWnR4ubj+uKLrC4Tt7vunESLbA5RrkFkQ7mW9lPxws8VHHoNPh27PplcuSezUkhAUoPyHzzG9tOJ8bfbnFJex0Okn87T/D8jWmUaozdF7Fle86CtzciYu/Q2YhFWxoP50DvV1Ac1c2AsFUUs8Gmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744636781; c=relaxed/simple;
	bh=EEXwuf59DHtynm8vxjNdzN53Ey4jfuogKcj5C2UyHNQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FdATTjSwUXLaqJ6GFnGfAz9hNv5Vc1NnDmMAreV1dnh2Sc50206jqag5sfqyH+FkYd53FYUnT1XjISWOLbbp2KlYeMWoJ9Dl2bKzmt3cD5ysIpuvEXkypt+kRIzPl64tNZhsxjI8r04DecUtiSDIVUncjCckyZo4T+OlfytJF0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EiA+4pOt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EiA+4pOt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08773C4CEE9;
	Mon, 14 Apr 2025 13:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744636780;
	bh=EEXwuf59DHtynm8vxjNdzN53Ey4jfuogKcj5C2UyHNQ=;
	h=From:To:Cc:Subject:Date:From;
	b=EiA+4pOtHsLA6ILBkedyYzPrxQIr+p8JMN+vM4kDAHlfiCOgAGKejRwlnk4oO4aR3
	 XqKknws15CzpfXqoBefqbs/LIftibZsle4KNr6jCcfb5MTssC1Uqit11kTWorisd6p
	 g28EY72jPZwnxt/hK09i7V/gdVIFytRVPhcDUMIlsyQF0ScvM/QUPmUXaR0WEzeVnI
	 ukSK6lVnUO71yIbd/abuKq+oNTyxNJJT93zOHnAwNm895EvWlTNLDt+GoFhZQicax7
	 CZ88reTD3Vjh1IxVu3/3yBTO+k4Yip1UhEreBOcmO4/bZYCIdu7pSSt//rcMDX93pH
	 0Bu1d4dGuD71w==
From: Danilo Krummrich <dakr@kernel.org>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	david.m.ertman@intel.com,
	ira.weiny@intel.com,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	airlied@gmail.com,
	acourbot@nvidia.com,
	jhubbard@nvidia.com
Cc: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v4 0/5] Auxiliary bus Rust abstractions
Date: Mon, 14 Apr 2025 15:18:03 +0200
Message-ID: <20250414131934.28418-1-dakr@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds Rust abstractions for the auxiliary bus.

It implements the required abstractions to write auxiliary drivers and create
auxiliary device registrations. A driver sample illustrates how the
corresponding abstractions work.

The auxiliary abstractions are required for the Nova driver project, in order to
connect nova-core with the nova-drm driver.

A branch containing the patches can be found in [1].

[1] https://web.git.kernel.org/pub/scm/linux/kernel/git/dakr/linux.git/log/?h=rust/auxiliary

Changes in v4:
  - drop TryFrom<&Device> for &auxiliary::Device for now; we likely don't need
    it anytime soon
  - sample: rename PciDriver to ParentDriver; add connect() to ParentDriver
  - rebase onto https://lore.kernel.org/rust-for-linux/20250413173758.12068-1-dakr@kernel.org/

Changes in v3:
  - export auxiliary_bus_type
  - implement impl TryFrom<&Device> for &auxiliary::Device
  - implement Send + Sync for Registration and Device

Changes in v2:
  - implement bus device soundness improvements from [2]

Danilo Krummrich (5):
  rust: types: add `Opaque::zeroed`
  rust: device: implement Device::parent()
  rust: auxiliary: add auxiliary device / driver abstractions
  rust: auxiliary: add auxiliary registration
  samples: rust: add Rust auxiliary driver sample

 MAINTAINERS                           |   3 +
 rust/bindings/bindings_helper.h       |   1 +
 rust/helpers/auxiliary.c              |  23 ++
 rust/helpers/helpers.c                |   1 +
 rust/kernel/auxiliary.rs              | 360 ++++++++++++++++++++++++++
 rust/kernel/device.rs                 |  18 ++
 rust/kernel/lib.rs                    |   2 +
 rust/kernel/types.rs                  |   8 +
 samples/rust/Kconfig                  |  12 +
 samples/rust/Makefile                 |   1 +
 samples/rust/rust_driver_auxiliary.rs | 122 +++++++++
 11 files changed, 551 insertions(+)
 create mode 100644 rust/helpers/auxiliary.c
 create mode 100644 rust/kernel/auxiliary.rs
 create mode 100644 samples/rust/rust_driver_auxiliary.rs

-- 
2.49.0

