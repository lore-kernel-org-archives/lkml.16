Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B1D125569;
	Sat, 14 Jun 2025 09:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749893852; cv=none; b=hGRPrJQBo6STCK61FttQ/4AC45J3odHeVKkJQUyVUpJ8KdCGofJJWTB1DDUKYrV72S2hihyvMbqW6bTi0tv4K+IZ76Gf4DnB7IIi36/AxkT0ooR4NIUqxHOZRcxvTxDI1FFhuolfLBVjxbgAQLd+i6BgIyVIvaAwR4dnw63CKsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749893852; c=relaxed/simple;
	bh=IBzO0Ev69uF2qsozSaN+Lr09S7lmFhXFHMxSCnecsvI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=M4yXXe9xSO8EImp7ssbfCVI2RLheFm07wMS87Wpt2CpJGZKoG3mkiHKewcLWGOg+GMMrzVwbdTs3HUDp/uKeQhnW1VnH6UqqBqLDoyJcCeEwoFK86F/ZLdGDA08G6UF4j+5NgfCQOMV2lm9X6ZMI2r5hojMiOnXx4v42fVMOgwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fe8k9UlU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fe8k9UlU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B822C4CEEB;
	Sat, 14 Jun 2025 09:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749893851;
	bh=IBzO0Ev69uF2qsozSaN+Lr09S7lmFhXFHMxSCnecsvI=;
	h=From:To:Cc:Subject:Date:From;
	b=fe8k9UlU+qLX6ATbgwYZ5+EeyJZxMW8KUTIe1H4f/Lb3DcWcc9ZABe0PHvUIiu2l5
	 faN/mo28Xd4WhuOB19GI9vjdbpUoyYZCW73dpQA3o1R5SxRty+AuekUMxFa0H2yChA
	 3GVNtkOC2Cpdeoja76Cluy8NugmVrfNbymW9NNZmYonsmIb9IIUdJPebGySpGpNV1W
	 v7wHnB8+aAdcJNYP0YsybxbU1fna2qIVE1brON7VMbjEu1vD/802BEeOkgmhBF0h6d
	 2QHoOf8lh7mJ1053fRqwck9pLMM8zlABB3/O+lj0FDnVRiaUHTPYUfCGZZKsj29/OX
	 QR6uaP5JUvdxg==
From: Miguel Ojeda <ojeda@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] Rust fixes for 6.16
Date: Sat, 14 Jun 2025 11:36:53 +0200
Message-ID: <20250614093653.1431306-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Linus,

Please pull this fix for Rust.

It has been in linux-next for three rounds.

No conflicts expected.

I expect to send another fixes PR later in the cycle.

Thanks!

Cheers,
Miguel

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/ojeda/linux.git tags/rust-fixes-6.16

for you to fetch changes up to 5b2d595efbfc9c46823bdb9ef11e1f9fa46adf9d:

  rust: time: Fix compile error in impl_has_hr_timer macro (2025-06-10 20:11:36 +0200)

----------------------------------------------------------------
Rust fixes for v6.16

'kernel' crate:

  - 'hrtimer': fix future compile error when the 'impl_has_hr_timer!'
    macro starts to get called.

----------------------------------------------------------------
FUJITA Tomonori (1):
      rust: time: Fix compile error in impl_has_hr_timer macro

 rust/kernel/time/hrtimer.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
