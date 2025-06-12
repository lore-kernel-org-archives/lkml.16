Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E71C2F4329;
	Thu, 12 Jun 2025 12:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749730703; cv=none; b=g1ELxlHKe8B7RC27VH74xIZoutXtkejEMZdaa6UttM6AwNkJ9bopKpEQDWo4bWvBYxqaQE7dy4XzWI/H0dKt8ieE8298uANOxHfyrGicaebEO3XgHEz4OtH87ikDmEwF463999EG4lsCAKj3yfFBnXpo4i757m1MeI0N86qmzF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749730703; c=relaxed/simple;
	bh=llD4QOF6mQTpUIHo493Pr5lhuGY7G7Ebp6CluFEqjLc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iWxRYPYE52VtHTQDEvaWivEVtJ/C3NbUlqZtccSyjrESYu4AXuPqWAak8pN9u5Ahje1Wx8FjhnD4jYSu4i9nyuyb9UjPFcmamhGyPbgt1FDNjZohqu5sxkBL2jb/PrYgkQqtUMwMKFeEpdSw6x9ojuv1mJfw/iqZUUFusqyCNbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aXxRooZ7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aXxRooZ7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DF18C4CEEA;
	Thu, 12 Jun 2025 12:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749730703;
	bh=llD4QOF6mQTpUIHo493Pr5lhuGY7G7Ebp6CluFEqjLc=;
	h=From:To:Cc:Subject:Date:From;
	b=aXxRooZ7YLJmkYh4xkLXIIqTlfASRxSp16X1qrFaVmQUVdtiJ2/MN/W2RqoFIkPMc
	 cBSxqZU84f5/QxAHSZBeft5Ph8hhEKH+PoyWT1sF7gF+vDb9Ls1byDGaz2sLiOOe0l
	 v7vLj9XTn6+xOxia9w9SFYomSRSSmoMZwam9d5YqEQKTOou9iiowxPKcMpbnOYAmN7
	 uYF26LPNZPsRWwGRfe9e9kTZ7UZTT0ERP3xi+8D8ZFDz1imkGKbGfUNEWLWssFxGxN
	 iRhJsPdnYrjw690jNpuWd/o2/aQ3txONIzGNj8WL1Nr0E8IhP7yWB9WHgaqxjaLPH8
	 CMECnydYbtC1Q==
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
Subject: [PATCH v2 0/3] Fix race condition in Devres
Date: Thu, 12 Jun 2025 14:17:12 +0200
Message-ID: <20250612121817.1621-1-dakr@kernel.org>
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

Changes in v2:
  - Completion
    - s/can queue themselves up/have been queued up/
    - move up Send / Sync impl
    - refer to complete_all() from wait_for_completion()
    - clarify "permanentely done" with "i.e. signals all current and future
      waiters"
  - Devres
    - pick more appropriate 'Fixes' tag
    - extend commit message with an illustration of the race

Danilo Krummrich (3):
  rust: completion: implement initial abstraction
  rust: revocable: indicate whether `data` has been revoked already
  rust: devres: fix race in Devres::drop()

 rust/bindings/bindings_helper.h |   1 +
 rust/helpers/completion.c       |   8 +++
 rust/helpers/helpers.c          |   1 +
 rust/kernel/devres.rs           |  33 ++++++++--
 rust/kernel/revocable.rs        |  18 +++--
 rust/kernel/sync.rs             |   2 +
 rust/kernel/sync/completion.rs  | 112 ++++++++++++++++++++++++++++++++
 7 files changed, 164 insertions(+), 11 deletions(-)
 create mode 100644 rust/helpers/completion.c
 create mode 100644 rust/kernel/sync/completion.rs


base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
-- 
2.49.0

