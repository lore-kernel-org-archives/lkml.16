Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3963B25D21D;
	Fri,  9 May 2025 20:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746821732; cv=none; b=WX5k8XN+aT+LdmMKOM2nx+ecirCrE9WPJFFyh8xoDv+fM+2pmGF9ygn2Zl84/c/Yhaklr71ScDy/ori2f2QJN37bGYVBm2PBGbE9x7lM+KAwjh+EJdQe+cr5Aduf4V2yCKnDHGJfeqHfgQFdDx2zg2erniGFvgtlkW2RpskQeeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746821732; c=relaxed/simple;
	bh=85iJBJYwWMlkkuUjn9Ku0vhsZtydLp9gqIiHKhkprX8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=YhTSOCGPzpuieDa3GszDzPL8VdLJjynx0PS6nnsagtcpBHmR2huhO4SsdUWhzPX8GhiU/ynrTE/vzejgwOfwXNjjOa0uKrYiq0v8qvh6GkYvxtGhNmAbmaObPVlTpb/TkLEk5pGBZ6QHbEHCt4KsRaseIj3onikAJVNzHHS3wBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BAfjqjJd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BAfjqjJd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C51DC4CEE4;
	Fri,  9 May 2025 20:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746821731;
	bh=85iJBJYwWMlkkuUjn9Ku0vhsZtydLp9gqIiHKhkprX8=;
	h=From:To:Cc:Subject:Date:From;
	b=BAfjqjJdtd85DTyfue6Gz1RyKLMocoTfOhEaoFka4FdEU2ZVO8UrdiPMUau2TaYnB
	 7GexyGqktnlFbZDfJw4NdlCsuA+WrYXdDyuGdzt/8MUPbi8iTVeUUarygI87cKhqXn
	 OLY7yFFK6t+I4HXHtysC20ZPtSSR8SKiiz3bpPaJourEl9qLpmurBFQv5WZZZ5W6ix
	 WYy7mu0LlPNToxFQrewai/tfnK09SCZF7oPF6ulpUSTrdeuUnUdbvH8jf0d/XfIVYw
	 2fSR0o8R5cJHiTgDh0/WRHjv4dSpLE6waVAnUGIB7AN8ZDZPzcPOMIa4vjxVj/S+B8
	 DYp/sCWYLmjyQ==
From: Miguel Ojeda <ojeda@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] Rust fixes for 6.15 (2nd)
Date: Fri,  9 May 2025 22:14:57 +0200
Message-ID: <20250509201458.872943-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Linus,

Please pull these fixes for Rust (second round).

All commits have been in linux-next for two rounds.

No conflicts expected.

Thanks!

Cheers,
Miguel

The following changes since commit 92a09c47464d040866cf2b4cd052bc60555185fb:

  Linux 6.15-rc5 (2025-05-04 13:55:04 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/ojeda/linux.git tags/rust-fixes-6.15-2

for you to fetch changes up to 5595c31c370957aabe739ac3996aedba8267603f:

  x86/Kconfig: make CFI_AUTO_DEFAULT depend on !RUST or Rust >= 1.88 (2025-05-07 00:11:47 +0200)

----------------------------------------------------------------
Rust fixes for v6.15 (2nd)

Toolchain and infrastructure:

 - Make CFI_AUTO_DEFAULT depend on !RUST or Rust >= 1.88.0.

 - Clean Rust (and Clippy) lints for the upcoming Rust 1.87.0 and Rust
   1.88.0 releases.

 - Clean objtool warning for the upcoming Rust 1.87.0 release by adding
   one more noreturn function.

----------------------------------------------------------------
Miguel Ojeda (5):
      objtool/rust: add one more `noreturn` Rust function for Rust 1.87.0
      rust: allow Rust 1.87.0's `clippy::ptr_eq` lint
      rust: clean Rust 1.88.0's `unnecessary_transmutes` lint
      rust: clean Rust 1.88.0's warning about `clippy::disallowed_macros` configuration
      rust: clean Rust 1.88.0's `clippy::uninlined_format_args` lint

Paweł Anikiel (1):
      x86/Kconfig: make CFI_AUTO_DEFAULT depend on !RUST or Rust >= 1.88

 .clippy.toml                              |  2 +-
 arch/x86/Kconfig                          |  1 +
 drivers/gpu/nova-core/gpu.rs              |  2 +-
 init/Kconfig                              |  3 ++
 rust/bindings/lib.rs                      |  1 +
 rust/kernel/alloc/kvec.rs                 |  3 ++
 rust/kernel/list.rs                       |  3 ++
 rust/kernel/str.rs                        | 46 +++++++++++++++----------------
 rust/macros/kunit.rs                      | 13 +++------
 rust/macros/module.rs                     | 19 ++++---------
 rust/macros/paste.rs                      |  2 +-
 rust/pin-init/internal/src/pinned_drop.rs |  3 +-
 rust/uapi/lib.rs                          |  1 +
 tools/objtool/check.c                     |  1 +
 14 files changed, 49 insertions(+), 51 deletions(-)
