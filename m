Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 925512701D7
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 13:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745588878; cv=none; b=i3lQxhTyEmCACPrrjXTqQPwo2rW7DUizetf3jrsV9rQq9kgTZ//y+oDwELO8yX92zZrPVS1DwQ0bdsWke6vvYl8Vlt0vrCoO8CZZJRm1coGzp+6tTKMFLGo3pJPP8BkYxlM8mDtVIwqjlnyObdn5Gqg1NHhxWsli7wvEXoC6RIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745588878; c=relaxed/simple;
	bh=/ywt+NrcLhg07jckumGrdFuBAmmAoNb6SfXQAnUnsNg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OxDcDQbtDeVcxME9dMevkQXrB0xvuIKPgKy32zkx+pChaRztVvNz63E2pnn8IwN9MgOuCocd0mWgUwl/CrV/StfIBsOsRWWfjg+Tqf7IijRDeMqvdTw/f8JPnrhIQYUEzK7IKqSuRbR32FW9IikbH7XIYuU8yoDfBiF9JPipKvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=2CyKRApy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="2CyKRApy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A280AC4CEE4;
	Fri, 25 Apr 2025 13:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1745588878;
	bh=/ywt+NrcLhg07jckumGrdFuBAmmAoNb6SfXQAnUnsNg=;
	h=Date:From:To:Cc:Subject:From;
	b=2CyKRApyQ91T+PMZQJIXceqzG7jFUPt9CJ4nuo10LQ4ShefU7j1y4XblQ1VFbCSWi
	 mWAcP9N77fOnG/t/r1NS3NZqy6CWNA01H9P+NGd+WhGzfZ/SVnwm5X05gt3jDSYSa2
	 VDfpBDNTSxm5UnVa+yF0aSj/wyhZxSaMUFb8QFtc=
Date: Fri, 25 Apr 2025 15:47:55 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org,
	Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [GIT PULL] Driver core fixes for 6.15-rc4
Message-ID: <aAuSi9YCYEN46yXf@kroah.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git tags/driver-core-6.15-rc4

for you to fetch changes up to b9792abb76ae1649080b8d48092c52e24c7bbdc2:

  drivers/base/memory: Avoid overhead from for_each_present_section_nr() (2025-04-15 18:19:49 +0200)

----------------------------------------------------------------
Driver core fixes for 6.15-rc4

Here are some small driver core fixes to resolve a number of reported
problems.  Included in here are:
  - driver core sync fix revert to resolve a much reported problem,
    hopefully this is finally resolved
  - MAINTAINERS file update, documenting that the driver-core tree is
    now under a "shared" maintainership model, thanks to Rafael and
    Danilo for offering to do this!
  - auxbus documentation and MAINTAINERS file update
  - MAINTAINERS file update for Rust PCI code
  - firmware rust binding fixup
  - software node link fix

All of these have been in linux-next for over a week with no reported
issues.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

----------------------------------------------------------------
Andy Shevchenko (1):
      device property: Add a note to the fwnode.h

Christian Schrefl (1):
      rust: firmware: Use `ffi::c_char` type in `FwFunc`

Danilo Krummrich (1):
      MAINTAINERS: pci: add entry for Rust PCI code

Dmitry Torokhov (3):
      Revert "drivers: core: synchronize really_probe() and dev_uevent()"
      driver core: introduce device_set_driver() helper
      driver core: fix potential NULL pointer dereference in dev_uevent()

Gavin Shan (1):
      drivers/base/memory: Avoid overhead from for_each_present_section_nr()

Greg Kroah-Hartman (1):
      MAINTAINERS: update the location of the driver-core git tree

Leon Romanovsky (2):
      drivers/base: Extend documentation with preferred way to use auxbus
      drivers/base: Add myself as auxiliary bus reviewer

Lizhi Xu (1):
      software node: Prevent link creation failure from causing kobj reference count imbalance

 MAINTAINERS              | 17 ++++++++++++++---
 drivers/base/auxiliary.c | 10 ++++++++++
 drivers/base/base.h      | 17 +++++++++++++++++
 drivers/base/bus.c       |  2 +-
 drivers/base/core.c      | 38 ++++++++++++++++++++++++++++++++------
 drivers/base/dd.c        |  7 +++----
 drivers/base/memory.c    | 41 +++++++++++++++++------------------------
 drivers/base/swnode.c    |  3 +--
 include/linux/fwnode.h   |  5 +++++
 rust/kernel/firmware.rs  |  8 ++++++--
 10 files changed, 106 insertions(+), 42 deletions(-)
