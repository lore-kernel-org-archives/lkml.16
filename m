Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04F9822126F
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 20:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750280185; cv=none; b=V5yOTdd21uDQWCby1iyJpldhEI3alnr7qzsKH2RHnhWxRPVrvZzxd3NAbxt3n8SBAeNlcxymhyXK/hwIBYHUJPfu+bxSYRxgwUZnyIaf3XX3S2+CrLfqsKf/MSLCyzRJ2PyMsuhQqADN/E/UzVa2gQRnN6z/5Um5zd1siZfFfcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750280185; c=relaxed/simple;
	bh=bwY/KADh/D20QoqkYzN1EG4+L69HesascceRklWh0gg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hbto5i3XYB57r+nkfhV5THBlFgF+yU0MDiaGa2CyWp4GlFl0HbG6TJxOXblgWxPsrVtvDgc37hC1mW0XWp7+TQKP6bJImz+FAXxVRfOjbU3ODevYXeqimcSJZ7IfihQGvcuxi87Kle49sasHfNFgOB1iQ1lap4kl3dj8K8us/zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UzOnaZ9u; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UzOnaZ9u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EB69C4CEF0;
	Wed, 18 Jun 2025 20:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750280184;
	bh=bwY/KADh/D20QoqkYzN1EG4+L69HesascceRklWh0gg=;
	h=Date:From:To:Cc:Subject:From;
	b=UzOnaZ9uNrgcT6JsX2BskC2a+EktzmUZqdifwE2OiSLRlYaKXNnI4xGmg9NqBBPe3
	 UtjA1pVQ7iBubFpuIWv/DIMGYoeS32sCNmpgyBOHoIgv9X0Uktvh8Ny51jNKvspgpG
	 FsGqjh6HA1sQUvqAfg1Lg8v1H4GjvSPsBNXwJ5bunNtgY67OyHA9MNx5v4bWQRGYZN
	 N0bUMXeY/gB5pCMiAClByoVU/wV3BI9fL4gfZPpN/SglxhJVUIxECz/gw9gaPcI85b
	 NXb2b9XtzxZFxSlihZfVptU/pBVpBv1XCLiSwm8x11sHXjAXLbqYIo9Ig5BRfYTIIi
	 mrA1exXXm8TKg==
Date: Wed, 18 Jun 2025 22:56:20 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Miguel Ojeda <ojeda@kernel.org>, linux-kernel@vger.kernel.org
Subject: [GIT PULL] Driver core fixes for 6.16-rc3
Message-ID: <aFMn9I0c7Pt9YDKu@pollux>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

Please pull these driver-core fixes.

The code changes have been in linux-next for a couple rounds.

There is a trivial conflict with your tree, also reported (and resolved) by
Stephen in [1].

- Danilo

[1] https://lore.kernel.org/lkml/20250616093830.49011634@canb.auug.org.au/

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git tags/driver-core-6.16-rc3

for you to fetch changes up to eab9dcb76b9fca47402c9e93afca243e745a0f02:

  Documentation: embargoed-hardware-issues.rst: Add myself for Power (2025-06-18 16:38:50 +0200)

----------------------------------------------------------------
Driver core fixes for 6.16-rc3

  - Fix a race condition in Devres::drop(). This depends on two other
    patches:
    - (Minimal) Rust abstractions for struct completion.
    - Let Revocable indicate whether its data is already being revoked.

  - Fix Devres to avoid exposing the internal Revocable.

  - Add .mailmap entry for Danilo Krummrich.

  - Add Madhavan Srinivasan to embargoed-hardware-issues.rst.

----------------------------------------------------------------
Danilo Krummrich (5):
      rust: completion: implement initial abstraction
      rust: revocable: indicate whether `data` has been revoked already
      rust: devres: fix race in Devres::drop()
      rust: devres: do not dereference to the internal Revocable
      mailmap: add entry for Danilo Krummrich

Madhavan Srinivasan (1):
      Documentation: embargoed-hardware-issues.rst: Add myself for Power

 .mailmap                                            |   1 +
 Documentation/process/embargoed-hardware-issues.rst |   1 +
 rust/bindings/bindings_helper.h                     |   1 +
 rust/helpers/completion.c                           |   8 ++++++++
 rust/helpers/helpers.c                              |   1 +
 rust/kernel/devres.rs                               |  60 ++++++++++++++++++++++++++++++++++++++----------------
 rust/kernel/revocable.rs                            |  18 ++++++++++++----
 rust/kernel/sync.rs                                 |   2 ++
 rust/kernel/sync/completion.rs                      | 112 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 9 files changed, 183 insertions(+), 21 deletions(-)
 create mode 100644 rust/helpers/completion.c
 create mode 100644 rust/kernel/sync/completion.rs
