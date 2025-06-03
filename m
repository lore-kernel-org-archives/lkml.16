Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC7741E521B;
	Tue,  3 Jun 2025 20:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748984062; cv=none; b=NirDGut3Fpx+MsfrMdWu2+nhONmyXS1+qWak6RVdlrqUVm76yt17nDQ6SfRejvXu4impeo2MadBPCflRtd0egTyu3pcy/0nPtDGc9dcaszDWX1GlTbXYsGHOw1w84VPJONZMrn607ckTIyzYykPvGrGHSiTYxBlqRo/0O09UIio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748984062; c=relaxed/simple;
	bh=9kbZZEbm0MoxXMZN5k0tFuDZEH0LZKA3xd6b1AvKcco=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mQtbuONSnIySzA0knl6VjMs8TtaeSpbBd8aHoAjnhFlVCYq83LEYOz5PLg7Qjhv3ZyKt/dtMpPmlX4XoNWjhSe0jPgVxq6wwsOE43X/n4KXsfSSaqbCYTEGI8U4fiSh65VYsMRY/jaGWVtDJCoRTMjr9XgNs1HQRzMyViHu6H3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pjlAz7hT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pjlAz7hT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A65AC4CEED;
	Tue,  3 Jun 2025 20:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748984062;
	bh=9kbZZEbm0MoxXMZN5k0tFuDZEH0LZKA3xd6b1AvKcco=;
	h=From:To:Cc:Subject:Date:From;
	b=pjlAz7hTsraJ7dS5/1UKgJHLFZLrtuUEM1Pm7F7hQcs1AFHcrbqYTW7BSc/PtuwHw
	 HP3NcAxJKNO9PDZb/4aGLCwPO9Xawtu9sSR153qjhfh0+CgFzANlLIBvKCd0EqK+Kk
	 LfXm5c85waSzip6BO/HjMWuvnTgi+tWjJtamSG9q4G8oTRsrLWk/fslChkKxnQoLQs
	 jVnz4vJowxENuAySydkUfmH+UFsJ4YtB3vUpHxXjqE3oQwolcw5GIc8h6SNLZAOIUZ
	 BUWM1oMsyWA2WAMSmYm0tW3clTT9SpJE+jT2xHn3g89EOQu3QqZlHz2nM5xImUGtQp
	 gELyvUwoiQGBg==
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
Subject: [PATCH 0/3] Fix race condition in Devres
Date: Tue,  3 Jun 2025 22:48:49 +0200
Message-ID: <20250603205416.49281-1-dakr@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series fixes a race condition in Devres.

Please see patch 3 "rust: devres: fix race in Devres::drop()" for a detailed
description of the race and how it is fixed.

None of the upstream users of Devres is prone to this race, hence we do not
necessarily have to backport this -- yet, it must be fixed.

Thanks to Alice for catching and reporting this!

A branch containing those patches can be found in [1].

[1] https://git.kernel.org/pub/scm/linux/kernel/git/dakr/linux.git/log/?h=rust/devres-race

Danilo Krummrich (3):
  rust: completion: implement initial abstraction
  rust: revocable: indicate whether `data` has been revoked already
  rust: devres: fix race in Devres::drop()

 rust/bindings/bindings_helper.h |   1 +
 rust/helpers/completion.c       |   8 +++
 rust/helpers/helpers.c          |   1 +
 rust/kernel/devres.rs           |  33 ++++++++--
 rust/kernel/revocable.rs        |  18 ++++--
 rust/kernel/sync.rs             |   2 +
 rust/kernel/sync/completion.rs  | 111 ++++++++++++++++++++++++++++++++
 7 files changed, 163 insertions(+), 11 deletions(-)
 create mode 100644 rust/helpers/completion.c
 create mode 100644 rust/kernel/sync/completion.rs


base-commit: cd2e103d57e5615f9bb027d772f93b9efd567224
-- 
2.49.0

