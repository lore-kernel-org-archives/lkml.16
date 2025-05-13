Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF5A52522B4;
	Tue, 13 May 2025 10:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747130408; cv=none; b=b8UQLvMk9QWL/Gvo7NBvMU+bW6gG8yG4gOOfJ/SNDo7H69yNwtj9SMBavQ2SrbA/F/nNjRwB7youXg5m4HHEVqRszWXXHnQ7egpGlfiHUBuBcGhUX6zYcaVSUfHm8fwR1rLw3PdI0vbTaFHwhq5N+8pM90XuUD+bpf4Rd1C8cS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747130408; c=relaxed/simple;
	bh=/fzsepHpqLW4buNd1bdj2oiNVq6iv96nDcrAG+1zr+g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uBjJHxO5yFtoiDf/cPFhOEk23jlA33RXnflUajjwDn7dSb9jdvmzcQGHvRs84vrUPCG9LgRRhcC8Q3e+uegnNSlGBsKBmJ89XDjvrCbqPRVcIDMMyBmSqm7cJzQ3JQcxLmhR0+xs/+H3XnNBvjwj5fR6s3dVX3doEomqBUgt8Hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KQO/JwTU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KQO/JwTU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED998C4CEE4;
	Tue, 13 May 2025 10:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747130408;
	bh=/fzsepHpqLW4buNd1bdj2oiNVq6iv96nDcrAG+1zr+g=;
	h=Date:From:To:Cc:Subject:From;
	b=KQO/JwTU9I9VqnzO8kGRF2uvLUVvfq/A2W85FcpaFwm8GgmndVSghKHfXamVXvL5u
	 kIkimaMkW2aPk3ug5gZSsDUiV3GP+mYe1qKB1y4LQSVQmekoAZJH0wqXjllQWl20+m
	 tlOGczev1x2ty37dxJkydGzwb9fHay5rJQ+5WwGL+ACcxX6l6Zj1UO40yqkimOCbKb
	 20Ldr3ua7X6J8KIiahYmTM9ukm5TZ4txpkAOXKv/T7sCoWIumILEkox2yra4Woz0h/
	 M1xLPPUHobQtUvS4HgUkgWp9y4TUJBgwXxWRoWXPQW34KAIQ+mP015V96dWUyWIW9o
	 Q3OccsbyimqdQ==
Date: Tue, 13 May 2025 12:00:03 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] Rust ALLOC for v6.16
Message-ID: <aCMYI-phNWE1PZGz@pollux>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Miguel,

Please pull the following ALLOC changes.

Most of them are new methods for Vec, required by binder and nova-core.

All commits have been in linux-next for at least a few days -- no conflicts
expected.

- Danilo

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  https://github.com/Rust-for-Linux/linux.git tags/alloc-next-v6.16-2025-05-13

for you to fetch changes up to 771c5a7d9843643b035938624050e7769133b9cc:

  rust: alloc: add Vec::insert_within_capacity (2025-05-07 18:40:45 +0200)

----------------------------------------------------------------
Alloc changes for v6.16

Box:
  - support for type coercion, e.g. `Box<T>` to `Box<dyn U>` if T
    implements U

Vec:
  - implement new methods (prerequisites for nova-core and binder)
    - Vec::truncate()
    - Vec::resize()
    - Vec::clear()
    - Vec::pop()
    - Vec::push_within_capacity()
      - new error type: PushError
    - Vec::drain_all()
    - Vec::retain()
    - Vec::remove()
      - new error type: RemoveError
    - Vec::insert_within_capacity
      - new error type: InsertError
  - simplify Vec::push() using Vec::spare_capacity_mut()
  - split Vec::set_len() into Vec::inc_len() and Vec::dec_len()
    - add type invariant Vec::len() <= Vec::capacity
    - simplify Vec::truncate() using Vec::dec_len()

----------------------------------------------------------------
Alexandre Courbot (1):
      rust: alloc: allow coercion from `Box<T>` to `Box<dyn U>` if T implements U

Alice Ryhl (7):
      rust: alloc: add Vec::clear
      rust: alloc: add Vec::pop
      rust: alloc: add Vec::push_within_capacity
      rust: alloc: add Vec::drain_all
      rust: alloc: add Vec::retain
      rust: alloc: add Vec::remove
      rust: alloc: add Vec::insert_within_capacity

Andrew Ballance (2):
      rust: alloc: add Vec::truncate method
      rust: alloc: add Vec::resize method

Danilo Krummrich (1):
      rust: alloc: add missing invariant in Vec::set_len()

Tamir Duberstein (5):
      rust: alloc: use `spare_capacity_mut` to reduce unsafe
      rust: alloc: add Vec::len() <= Vec::capacity invariant
      rust: alloc: add `Vec::dec_len`
      rust: alloc: refactor `Vec::truncate` using `dec_len`
      rust: alloc: replace `Vec::set_len` with `inc_len`

 rust/kernel/alloc/kbox.rs        |  40 ++++++++++-
 rust/kernel/alloc/kvec.rs        | 430 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--------
 rust/kernel/alloc/kvec/errors.rs |  61 +++++++++++++++++
 rust/kernel/str.rs               |   2 +-
 rust/kernel/uaccess.rs           |   2 +-
 5 files changed, 506 insertions(+), 29 deletions(-)
 create mode 100644 rust/kernel/alloc/kvec/errors.rs
