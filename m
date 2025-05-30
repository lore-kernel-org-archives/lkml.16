Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DAC6188A0E;
	Fri, 30 May 2025 14:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748615094; cv=none; b=PiWUs3u6/pZQKZtBx1wgkzuHC0Vod7/Av3gg0Ts3wrlBELqsJ1jKL9wkxQNVrlB+lngN1smci7LQaLTDXgvKAA/CMNmBpFPA/SJl5ecl72yO54FPtPhnZdQnwFER5Pq38XFXLIl9A0LCu/G+BmEeVHV8Z5lD9kXECvwc8ZWmess=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748615094; c=relaxed/simple;
	bh=8jnBbYa0tqlrLWL/yDakkEQxhjT58GsDr8f8RJWS7UQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RYlYKlyS1CkPjEaiuNeMW9EWnYB6aSHBbhD4UN7dk/v0NYUMGYF9FBfa3Adt11mgn19jDCAfzwMfuTSA4BPXBFB0MIuUzRJyH99LSJqRXGa/O/bwRNvmKcv2c2YeXpGuStX05De6P1APnwkJf3kh/u4BI01lreD0HxYXTVb17i0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dEXC2uqn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dEXC2uqn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7213EC4CEE9;
	Fri, 30 May 2025 14:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748615093;
	bh=8jnBbYa0tqlrLWL/yDakkEQxhjT58GsDr8f8RJWS7UQ=;
	h=From:To:Cc:Subject:Date:From;
	b=dEXC2uqnG9H8vskoEw6SxRqeE88bDUk1Uw1suwEdQbLa4roIOXWPicjrATaXBdB4G
	 NWrAobeJiaPrBKhl1qvyJ3lbZchUoqLQU+7XeCXCcPcA920t7h3niqArGQhrtwBlSm
	 iNtF8/ejZyTQaLh4KSEeO6GP05BUCJzTFxU+IDICVscWsb4j3MMEE06GljY/EzSF/7
	 LBjQG6mtY45yOFJ7yQGsg6s/5DF6qc/DF9LE5EIPFXXZfTuSFBXbDcAOWxGY5ZzywQ
	 LQpdxJGTQhNvC5uHMWykNb0lF+/xUEgQBil+n2YQg/fMh3+d03xaaK+AAfWbdE110W
	 gdcAP2XAvuYPA==
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
	tmgross@umich.edu,
	chrisi.schrefl@gmail.com
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH 0/7] misc device: support device drivers
Date: Fri, 30 May 2025 16:24:13 +0200
Message-ID: <20250530142447.166524-1-dakr@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds support for device drivers to the misc device
abstraction.

For design details, please see:
  * patch 5 "rust: miscdevice: properly support device drivers"
  * patch 6 "rust: miscdevice: expose the parent device as &Device<Bound>"

This patch series depends on the pin-init series from Benno [1] as well as on
the misc device series from Christian [2], with UnsafePinned replaced with
Opaque, as suggested by Alice, since UnsafePinned may still take a while to
land.

A branch containing this series and its dependencies can be found in [3].

Thanks to Benno for his great help with pin-init!

[1] https://lore.kernel.org/rust-for-linux/20250529081027.297648-1-lossin@kernel.org/
[2] https://lore.kernel.org/lkml/20250517-b4-rust_miscdevice_registrationdata-v3-0-cdb33e228d37@gmail.com/
[3] https://git.kernel.org/pub/scm/linux/kernel/git/dakr/linux.git/log/?h=rust/misc

Danilo Krummrich (7):
  rust: types: support fallible PinInit types in Opaque::pin_init
  rust: revocable: support fallible PinInit types
  rust: devres: support fallible in-place init for data
  rust: faux: impl AsRef<Device<Bound>> for Registration
  rust: miscdevice: properly support device drivers
  rust: miscdevice: expose the parent device as &Device<Bound>
  rust: sample: misc: implement device driver sample

 rust/kernel/devres.rs            |  27 ++-
 rust/kernel/faux.rs              |   4 +-
 rust/kernel/miscdevice.rs        | 341 ++++++++++++++++++++++---------
 rust/kernel/revocable.rs         |   7 +-
 rust/kernel/types.rs             |   8 +-
 samples/rust/Kconfig             |   8 +
 samples/rust/rust_misc_device.rs |  73 +++++--
 7 files changed, 350 insertions(+), 118 deletions(-)


base-commit: d5e34ea41dda1500a4dc163d6e96395fe7adc681
-- 
2.49.0

