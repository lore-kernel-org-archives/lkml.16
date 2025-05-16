Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2518619CC3D;
	Fri, 16 May 2025 07:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747381917; cv=none; b=rly6VDSp663buhGne++jJbGbg7TUMfQJBAzYGzFMrQ0y8Qx4fUDOQtyzZa8/amA5kWodZgjaAl3nqgbjp/uv7kEapXyjrjDmtCiqsKULTuMfzEDGb3HDfQipJEgZwJyPVrypyYykl2ynQYSXeH1jPeuo9R/We/nhyHdShS9LTOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747381917; c=relaxed/simple;
	bh=qFCLYJSSLChaz0r+0Cxsyw3GZAZd+c3/FLvsmc1Cy0Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=iTQYATOfPbKtxBry8qzHdmDO5nTGP7xFfE5oGdxn1xepxrBXAlYbqOw3FXbTlcgewi5F/bqKjEqhq7Zp7cb5UJJx5JPY5u1Y4bkaxCGt368ix2mFF+UCYVjpmb3Uvd1txL2b5MJdzNzIB/hHkU8vuPofb9mhxjOBzzHKxIib8g8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KLoYccrF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KLoYccrF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83A57C4CEE4;
	Fri, 16 May 2025 07:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747381916;
	bh=qFCLYJSSLChaz0r+0Cxsyw3GZAZd+c3/FLvsmc1Cy0Q=;
	h=From:To:Cc:Subject:Date:From;
	b=KLoYccrFfmJaaC6CIq/XdunbUDSi7tBHxBBqtyXYHQAp0SM3vCxeo7Cd67f0owwsR
	 NnBHvOeI5ODMFjLQ8Twf9qGztl4CIFPhuyHhSx26Xc+Aq0JhBz2ssHXSXJCwA82LCp
	 wLnQC0K/ivG2+Tu9Ab4/rwXvX1jiNj5nYLZb3DQnM2klObfAtEQalhQYXx0x/k09Es
	 JjHstXq3Ui7AtyTVYeArVpOaiSignDa1AItLXI/o5KHhf9vidPR008a8EzMfPbnpoZ
	 pjqNxC8sKnbKkw3uOZT7RRf0bgTbUZcnF1fLpdDVjVlGVZ5hacUU2UmTYP94mkS0Wi
	 TMJw5SOR12ScA==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Breno Leitao <leitao@debian.org>, Miguel Ojeda <ojeda@kernel.org>,
	Joel Becker <jlbec@evilplan.org>, Christoph Hellwig <hch@lst.de>,
  Christian Brauner <brauner@kernel.org>,
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] configfs for v6.16
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Fri, 16 May 2025 09:51:40 +0200
Message-ID: <871psp56yb.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hi Linus,

This is my first pull request after picking up configfs [1], and my
first pull request to you. I hope I got everything right!

Summary
=======

This pull request contains configfs changes for v6.16:

 - Allow creation of rw files with custom permissions. This allows
   drivers to better protect secrets written through configfs.

 - Fix a bug where an error condition did not cause an early return
   while populating attributes.

 - Report ENOMEM rather than EFAULT when kvasprintf() fails in
   config_item_set_name().

 - Add a Rust API for configfs. This allows Rust drivers to use configfs
   through a memory safe interface.

Merge conflicts with other trees
================================

This contains a merge conflict with drm-nova:

diff --cc samples/rust/Makefile
index b3c9178d654a,6a466afd2a21..000000000000
--- a/samples/rust/Makefile
+++ b/samples/rust/Makefile
@@@ -8,7 -8,7 +8,8 @@@ obj-$(CONFIG_SAMPLE_RUST_DMA)			+= rust
  obj-$(CONFIG_SAMPLE_RUST_DRIVER_PCI)		+= rust_driver_pci.o
  obj-$(CONFIG_SAMPLE_RUST_DRIVER_PLATFORM)	+= rust_driver_platform.o
  obj-$(CONFIG_SAMPLE_RUST_DRIVER_FAUX)		+= rust_driver_faux.o
 +obj-$(CONFIG_SAMPLE_RUST_CONFIGFS)		+= rust_configfs.o
+ obj-$(CONFIG_SAMPLE_RUST_DRIVER_AUXILIARY)	+= rust_driver_auxiliary.o

---

With cpufreq-arm:

diff --cc rust/bindings/bindings_helper.h
index 1a532b83a9af,7c1d78f68076..000000000000
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@@ -10,7 -10,9 +10,10 @@@
  #include <linux/blk-mq.h>
  #include <linux/blk_types.h>
  #include <linux/blkdev.h>
+ #include <linux/clk.h>
 +#include <linux/configfs.h>
+ #include <linux/cpu.h>
+ #include <linux/cpufreq.h>
  #include <linux/cpumask.h>
  #include <linux/cred.h>
  #include <linux/device/faux.h>
diff --cc rust/kernel/lib.rs
index 354eb1605194,871fcdc09b35..000000000000
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@@ -42,8 -42,12 +42,14 @@@ pub mod alloc
  pub mod block;
  #[doc(hidden)]
  pub mod build_assert;
+ #[cfg(CONFIG_COMMON_CLK)]
+ pub mod clk;
 +#[cfg(CONFIG_CONFIGFS_FS)]
 +pub mod configfs;
+ pub mod cpu;
+ #[cfg(CONFIG_CPU_FREQ)]
+ pub mod cpufreq;
+ pub mod cpumask;
  pub mod cred;
  pub mod device;
  pub mod device_id;

Pull Request
============

The following changes since commit 8ffd015db85fea3e15a77027fda6c02ced4d2444:

  Linux 6.15-rc2 (2025-04-13 11:54:49 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/a.hindborg/linux.git tags/configfs-for-v6.16

for you to fetch changes up to c6b1908224593db76f77b904894cd51933559ae9:

  MAINTAINERS: add configfs Rust abstractions (2025-05-12 11:05:07 +0200)

Best regards,
Andreas Hindborg


----------------------------------------------------------------
configfs-for-v6.16

----------------------------------------------------------------
Andreas Hindborg (3):
      rust: configfs: introduce rust support for configfs
      rust: configfs: add a sample demonstrating configfs usage
      MAINTAINERS: add configfs Rust abstractions

Richard Weinberger (1):
      configfs: Add CONFIGFS_ATTR_PERM helper

Zijun Hu (3):
      configfs: Delete semicolon from macro type_print() definition
      configfs: Do not override creating attribute file failure in populate_attrs()
      configfs: Correct error value returned by API config_item_set_name()

 MAINTAINERS                     |    2 +
 fs/configfs/dir.c               |    4 +-
 fs/configfs/item.c              |    2 +-
 include/linux/configfs.h        |    8 +-
 rust/bindings/bindings_helper.h |    1 +
 rust/helpers/mutex.c            |    5 +
 rust/kernel/configfs.rs         | 1049 +++++++++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs              |    2 +
 samples/rust/Kconfig            |   11 +
 samples/rust/Makefile           |    1 +
 samples/rust/rust_configfs.rs   |  192 +++++++
 11 files changed, 1272 insertions(+), 5 deletions(-)
 create mode 100644 rust/kernel/configfs.rs
 create mode 100644 samples/rust/rust_configfs.rs

---

[1] https://lore.kernel.org/all/20250326-configfs-maintainer-v1-1-b175189fa27b@kernel.org

