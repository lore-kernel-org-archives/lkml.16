Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B12268C66;
	Thu, 12 Jun 2025 14:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749739911; cv=none; b=gGxj1NYPL9idGtFwZJAbif7qJkU2uda4U+hAaxvXtYRonNy2rlcoKzv7m6zSf/iKSbrJgfm2+NfKKPpdB7O7s9p2q1urHYXFjKcfo5fX7nPXrJeLf8+eSFANln+UbxJIh6pmbqiH0gpGp4SA9B8dmC7kwUfLe4Mb67jkrCkAMKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749739911; c=relaxed/simple;
	bh=M+iZ92QvszXsMUKBpby7ZU3P13f31um/5NFkEJ3pVro=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i2eW2A8f1HRvPKn/dezvS7twtos39JKGCcr6FiFUhfl0DXn33kNOMkoLF3q+Zd6DhhRerANcCylXuvEFvw2pDvaORw04bOXHg/ObmSlW0qjg3YSLA0smT5Rn8cU10J1KbxkGLv6Kaf/cIKwRqjDiWb94enq/uYk0DFDy8GczjAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jLSKS37A; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jLSKS37A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B290C4CEEA;
	Thu, 12 Jun 2025 14:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749739911;
	bh=M+iZ92QvszXsMUKBpby7ZU3P13f31um/5NFkEJ3pVro=;
	h=From:To:Cc:Subject:Date:From;
	b=jLSKS37AbbtnWw2hQ2CL61IfUjBbsK1Lhrb6giNpJJd0MWICFb1yAjCH9h5Ris4Hh
	 GoZ/3Z48rg4IYQn7JUGitVw5DF+ZN4yZdARh4acLRfq5BZyjmi1KcE3YE+Bf6pu0Bu
	 ztv/jFeTHj+DBxSwIAVYbm1E7ES4AVUvNr6BHAgs1ijncu5ZT2qriNLTJr6FKSMzrg
	 7zbX1/mqVUg0RLUc6BBH62hL5so2hKVSwDpc6RN+MxpqR7K6qXvtdUjMogd8b8Nxsb
	 MWq+/23cgrV6DwrPZtJ3Q/KTSzeDKtdlgi5xLMrP65XRg/FWV7uxhCDh5uQk2iwxDD
	 MuKu69kAa2kvQ==
From: Danilo Krummrich <dakr@kernel.org>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH 0/4] Improvements for Devres
Date: Thu, 12 Jun 2025 16:51:37 +0200
Message-ID: <20250612145145.12143-1-dakr@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series provides some optimizations for Devres:

  1) Provide a more lightweight replacement for Devres::new_foreign_owned().

  2) Get rid of Devres' inner Arc and instead consume and provide an
     impl PinInit instead.

     Additionally, having the resulting explicit synchronization in
     Devres::drop() prevents potential subtle undesired side effects of the
     devres callback dropping the final Arc reference asynchronously within
     the devres callback.

  3) An optimization for when we never need to access the resource or release
     it manually.

Thanks to Alice for some great offline discussions on this topic.

This patch series depends on the devres fixes [1] the Opaque patch in [2] and
the pin-init patch in [3], which Benno will provide a signed tag for. A branch
containing the patches can be found in [4].

[1] https://lore.kernel.org/lkml/20250612121817.1621-1-dakr@kernel.org/
[2] https://lore.kernel.org/lkml/20250610-b4-rust_miscdevice_registrationdata-v6-1-b03f5dfce998@gmail.com/
[3] https://lore.kernel.org/rust-for-linux/20250529081027.297648-2-lossin@kernel.org/
[4] https://git.kernel.org/pub/scm/linux/kernel/git/dakr/linux.git/log/?h=rust/devres

Danilo Krummrich (4):
  rust: revocable: support fallible PinInit types
  rust: devres: replace Devres::new_foreign_owned()
  rust: devres: get rid of Devres' inner Arc
  rust: devres: implement register_foreign_release()

 drivers/gpu/nova-core/driver.rs |   7 +-
 drivers/gpu/nova-core/gpu.rs    |   6 +-
 rust/helpers/device.c           |   7 +
 rust/kernel/cpufreq.rs          |   8 +-
 rust/kernel/devres.rs           | 338 ++++++++++++++++++++++----------
 rust/kernel/drm/driver.rs       |  11 +-
 rust/kernel/pci.rs              |  20 +-
 rust/kernel/revocable.rs        |   7 +-
 samples/rust/rust_driver_pci.rs |  19 +-
 9 files changed, 280 insertions(+), 143 deletions(-)


base-commit: e15a5b4301ec42990448b5b023e3439315b821ce
-- 
2.49.0

