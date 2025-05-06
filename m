Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B9591474B8;
	Tue,  6 May 2025 11:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746529550; cv=none; b=oxQ3qTW9ZW/t5fQsTYJ6siltag77iTv3gFnGtLIOJVvuxX7ZJs46+xoRnBj6rBskTOerSutks9/1k3xLbU4w5496UYeTI9Xvy09APgohF3sK7wMTfqFZp0H4Zst4w69+jNsgIXviBnp3Yb5jhkb1ZKGmF50uY+YtP2pRh84yowY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746529550; c=relaxed/simple;
	bh=89cjKHvoRST42Pq7X5iFhQSf+hCiwmnbRkDTR6diccU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dkHwAjFQPy8Nahdsm9s8ASbpuUARarOzmBKZRPid4LrqHFkRyGeC17fgDoML2X85mWV5auaqbnmZe6lNFRFA5DtzelCoixAq4mRWbBOHeimRi/Ng+dktjmmgNq+66n/RcJ49wlXLnnVwPTDlH7rytU8XQAvq2sDzuuljMYrXN+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tyr4mtC+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tyr4mtC+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5195FC4CEE4;
	Tue,  6 May 2025 11:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746529549;
	bh=89cjKHvoRST42Pq7X5iFhQSf+hCiwmnbRkDTR6diccU=;
	h=From:To:Cc:Subject:Date:From;
	b=Tyr4mtC+vJjGAC3aIANbZKcOkMz+8mwzCmOTVOtmPWh54uWjnNDwgpCKAamV9ygT9
	 3yz1X8bn3EXCnZ1Xv3pUC8YKQx7bV7xKOQi6OYXT9StnYtt5YOU0yXuh6iNXQMSYLc
	 Yy9RnOvZShD8KMCde6uQQOCkEMtzMUGZgzbAIfE8rdCrWfUJ8NivH37Hq/i3LFsYx5
	 IHZFHAzBdHfbwejYDtvMDAcPIQ6IVKpGXuWaEEJ7BOylOnRoSAXybjsG7CbepoDeMn
	 m8WB/P8OajsS6RLv0P8KYrfNwFepMKXPHc0NIwN7hJ8mrKEdmJvdhJW+MMlKF/Fs7E
	 2VQYqV13mPWTA==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?utf-8?Q?Bj=C3=B6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Tamir Duberstein <tamird@gmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] Rust xarray for v6.16
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Tue, 06 May 2025 13:05:13 +0200
Message-ID: <87jz6uq9sm.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hi Miguel,

Please pull these changes to enable access to the xarray data structure
from rust.

The following changes since commit 9c32cda43eb78f78c73aee4aa344b777714e259b:

  Linux 6.15-rc3 (2025-04-20 13:43:47 -0700)

are available in the Git repository at:

  https://github.com/rust-for-linux/linux.git tags/rust-xarray-for-v6.16

for you to fetch changes up to fa616196fbea12462107774fb6a1908c95f71cf0:

  MAINTAINERS: add entry for Rust XArray API (2025-05-01 11:37:59 +0200)


Best regards,
Andreas Hindborg

----------------------------------------------------------------
Rust xarray API for v6.16

Introduce Rust support for the `xarray` data structure:

 - Add a rust abstraction for the `xarray` data structure. This abstraction
   allows rust code to leverage the `xarray` to store types that implement
   `ForeignOwnable`. This support is a dependency for memory backing feature of
   the rust null block driver, which is waiting to be merged.

 - Set up an entry in MAINTAINERS for the xarray rust support. Patches will go
   to the new rust xarray tree and then via the rust subsystem tree for now.

`kernel` crate:

 - Allow `ForeignOwnable` to carry information about the pointed-to type. This
   helps asserting alignment requirements for the pointer passed to the foreign
   language.

----------------------------------------------------------------
Tamir Duberstein (3):
      rust: types: add `ForeignOwnable::PointedTo`
      rust: xarray: Add an abstraction for XArray
      MAINTAINERS: add entry for Rust XArray API

 MAINTAINERS                     |  11 ++
 rust/bindings/bindings_helper.h |   6 +
 rust/helpers/helpers.c          |   1 +
 rust/helpers/xarray.c           |  28 ++++
 rust/kernel/alloc/kbox.rs       |  38 +++---
 rust/kernel/lib.rs              |   1 +
 rust/kernel/miscdevice.rs       |  10 +-
 rust/kernel/pci.rs              |   2 +-
 rust/kernel/platform.rs         |   2 +-
 rust/kernel/sync/arc.rs         |  21 +--
 rust/kernel/types.rs            |  46 ++++---
 rust/kernel/xarray.rs           | 275 ++++++++++++++++++++++++++++++++++++++++
 12 files changed, 392 insertions(+), 49 deletions(-)
 create mode 100644 rust/helpers/xarray.c
 create mode 100644 rust/kernel/xarray.rs

