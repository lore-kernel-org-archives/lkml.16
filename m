Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA774241103;
	Sat,  8 Feb 2025 17:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739037505; cv=none; b=T0SQqIezIIi3Mx5qqQaXyTFX10J94bR4TpriDKvWrHc2OBi1bzYasQ/3sKFPGzMYrH5UkC/QSbDNPbK3oYEDx3/wCpW9o2OfGnyKyib5pFDj6Xlnl8NG7YRWKXBO8ZwH4MAjT+Z7xnHyXyqNth+rp3LQX+hD0kPiISFuXQqd6sY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739037505; c=relaxed/simple;
	bh=TPzXwCcsRWoAR35lR+EvU8dVDtgUEusKL7MNx/RyrS4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QPJHWMO6Xo8ceKBIuj3HyqBWjc3gLrKPRnwBlhTEkEIM+h0p9Mt3SRjKAzV001trsGWVhvfWPfeLO0l9BOBf1WFcrLd7TXFO+EoyWJpdZO6Ae3AOJY/cgIedNe5zf8XO12E6G/dJo7hwtLXua/84U7iiKcuTS+HaML7V1ffiqVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SWp1M+Hq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SWp1M+Hq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81463C4CED6;
	Sat,  8 Feb 2025 17:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739037505;
	bh=TPzXwCcsRWoAR35lR+EvU8dVDtgUEusKL7MNx/RyrS4=;
	h=From:To:Cc:Subject:Date:From;
	b=SWp1M+Hq/6OmVxrqdVY8UhgrZ8lqpwxw+I445eIiz6L1I0BAwmZ4zq8S8XLnfl4Ne
	 UIFIMGnosEO7nDwGXwtLIhUayUDwgHAOcdY97yj2QpYMJUs6eghesn+jxnrIAyJl09
	 3ujf+4jZuUj01GjELjD/3YzNM/8+qEkNLI2PAwA/QkVk6Y3KQhTPDtQnTe9AoaOOPX
	 wwyh0HGMFFnrNqGBhdshN+4B3oCZkqyqI2JCDdvcF3+8vWLzzSlEjChUMwlD64iIRk
	 cDYiyUsbXVnBHf+6D3vOOjJNX5CvK8HVm2Mqdqd3uwjsPLVT7ebO7gdrVZ/IGAo2yE
	 trprMNMI5gUWQ==
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
Subject: [GIT PULL] Rust fixes for 6.14
Date: Sat,  8 Feb 2025 18:58:17 +0100
Message-ID: <20250208175817.45181-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Linus,

Please pull these fixes for Rust.

They have been in linux-next for a single round only. I will be sending
a few others in a week.

No conflicts expected.

Thanks!

Cheers,
Miguel

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  https://github.com/Rust-for-Linux/linux.git tags/rust-fixes-6.14

for you to fetch changes up to 6273a058383e05465083b535ed9469f2c8a48321:

  x86: rust: set rustc-abi=x86-softfloat on rustc>=1.86.0 (2025-02-07 00:09:33 +0100)

----------------------------------------------------------------
Rust fixes for v6.14

Toolchain and infrastructure:

 - Do not export KASAN ODR symbols to avoid gendwarfksyms warnings.

 - Fix future Rust 1.86.0 (to be released 2025-04-03) x86_64 builds.

 - Clean future Rust 1.86.0 (to be released 2025-04-03) warning.

 - Fix future GCC 15 (to be released in a few months) builds.

 - Fix `rusttest` target in macOS.

----------------------------------------------------------------
Alice Ryhl (1):
      x86: rust: set rustc-abi=x86-softfloat on rustc>=1.86.0

Justin M. Forbes (1):
      rust: kbuild: add -fzero-init-padding-bits to bindgen_skip_cflags

Matthew Maurer (1):
      rust: kbuild: do not export generated KASAN ODR symbols

Miguel Ojeda (1):
      rust: init: use explicit ABI to clean warning in future compilers

Tamir Duberstein (1):
      rust: kbuild: use host dylib naming in rusttestlib-kernel

 rust/Makefile                   |  5 +++--
 rust/kernel/init.rs             |  2 +-
 scripts/generate_rust_target.rs | 18 ++++++++++++++++++
 3 files changed, 22 insertions(+), 3 deletions(-)
