Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFC516AA7;
	Wed,  2 Apr 2025 20:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743624150; cv=none; b=ilM56JMsO0XW7ok/qp/Q8UYKU8a7oWk8LokBOheJk6n9jpaG4/x0yGOx6ckIsCrx52Hg6nQMtAQg7Sk5sCDca2cTa+k4FP4y+XmO+xz9JbCkoqM3gwHaOG8cuSVsSxopbzoUGiOOW5kv29qXkEbUDWUI+wmlxvNdQa7tTD699DM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743624150; c=relaxed/simple;
	bh=5N+7UaqS+gR+Mmd6OryYDnOtLh7eStE0myQCD5S5JYo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ilsTQoSHQ1agdf9LkN2Dl8+zyAbANvQ1m90rvodDFPOx36KY+7fHxmrUIBcOpdGn9NQtk13Ce9Y89HQGfNsOvkrFOBW1hkRGjVY7C3FnfGKb3Bgn8wjAnE189hgNS4VgOVZ3jJSHlEaDsaQNG22NJ8lD3tkq4Eofx6zCS7XxPZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=E9owBfwO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="E9owBfwO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D751C4CEDD;
	Wed,  2 Apr 2025 20:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1743624149;
	bh=5N+7UaqS+gR+Mmd6OryYDnOtLh7eStE0myQCD5S5JYo=;
	h=Date:From:To:Cc:Subject:From;
	b=E9owBfwObbdCvDXegXOjIrHBbSG9kb6DnlW3M+qeT+cxlWcyT4YLB0uQbBqKPpSLZ
	 YR+xXjJxa7BKJTNaJLeSISsrHayPYRj0Y1J92KYXNUQyMLjOlvc3S2EaiucoGxQkwi
	 hyHH0jwQqEU+j3GwdQTPrW+M+zbuW3oAFwu1zKW8=
Date: Wed, 2 Apr 2025 21:01:02 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [GIT PULL] Staging driver updates for 6.15-rc1
Message-ID: <Z-2XfqNIBsMRR1Jp@kroah.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-6.15-rc1

for you to fetch changes up to 3b23d31e569ca19b7bf1059760b879f61cd71ded:

  staging: rtl8723bs: fixed a unnecessary parentheses coding style issue (2025-03-20 07:12:23 -0700)

----------------------------------------------------------------
Staging driver updates for 6.15-rc1

Here is the big set of staging driver cleanups and updates for 6.15-rc1.
As expected, with the introduction of the gpib drivers, loads of
cleanups and fixes showed up, with the huge majority of changes being
for that chunk of drivers.  This is good and shows that the community
can fix up things in public when asked to.  Also included in here are:
  - small sm750fb cleanups
  - tiny rtl8723bs cleanups
  - more vchiq_arm cleanups and changes, hopefully this will get out of
    staging soon.

All of these have been in linux-next for almost 2 weeks now with no
reported issues.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

----------------------------------------------------------------
Ajith P V (1):
      staging: gpib: fix prefixing 0x with decimal output

Arnd Bergmann (2):
      staging: gpib: comment out pnp_device_id tables
      static: gpib: hp82341: add MODULE_DESCRIPTION

Dave Penkler (29):
      staging: gpib: Use min for calculating transfer length
      staging: gpib: Add missing interface entry point
      staging: gpib: Make static, reduce fwd declarations
      staging: gpib: Fix pr_err format warning
      pnp: isapnp: Export isapnp_read_byte again
      staging: gpib: Remove depends on BROKEN
      staging: gpib: Fix cb7210 pcmcia Oops
      staging: gpib: Remove dependencies on !X86_PAE
      staging: gpib: agilent pci console messaging cleanup
      staging: gpib: agilent usb console messaging cleanup
      staging: gpib: cec_gpib console messaging cleanup
      staging: gpib: common core console messaging cleanup
      staging: gpib: fluke console messaging cleanup
      staging: gpib: fmh console messaging cleanup
      staging: gpib: gpio bitbang console messaging cleanup
      staging: gpib: hp82335 console messaging cleanup
      staging: gpib: hp82341 console messaging cleanup
      staging: gpib: lpvo console messaging cleanup
      staging: gpib: nec7210 console messaging cleanup
      staging: gpib: ni_usb console messaging cleanup
      staging: gpib: pc2 console messaging cleanup
      staging: gpib: tms9914 console messaging cleanup
      staging;gpib: Use Kconfig PCMCIA compilation symbol
      staging:gpib: Remove GPIB_PCMCIA in Makefiles
      staging: gpib: cb7210 console messaging cleanup
      staging: gpib: ines console messaging cleanup
      staging: gpib: tnt4882 console messaging cleanup
      staging: gpib: Fix Oops after disconnect in ni_usb
      staging: gpib: Fix Oops after disconnect in agilent usb

David Zalman (1):
      staging: rtl8723bs: fixed a unnecessary parentheses coding style issue

Gaston Gonzalez (9):
      staging: gpib: cb7210: remove unused variable
      staging: gpib: eastwood: remove unused variable
      staging: gpib: ni_usb: remove unused variable
      staging: gpib: tnt4882: remove unused variable
      staging: gpib: ines: remove unused variable
      staging: gpib: fix kernel-doc section for write_loop() function
      staging: gpib: fix kernel-doc section for function usb_gpib_interface_clear()
      staging: gpib: fix kernel-doc section for usb_gpib_line_status() function
      staging: gpib: remove commented-out lines

Hans Verkuil (1):
      staging: bcm2835-camera: drop vb2_ops_wait_prepare/finish

Michael Anckaert (1):
      staging: sm750fb: fix checkpatch warning architecture specific defines should be avoided

Michael Rubin (22):
      staging: gpib: Correct CamelCase for BUS constants
      staging: gpib: Correct CamelCase for VALID enums
      staging: gpib: struct typing for gpib_board
      staging: gpib: agilent_82350b: struct gpib_board
      staging: gpib: agilent_82357a: struct gpib_board
      staging: gpib: cb7210: struct gpib_board
      staging: gpib: cec_gpib: struct gpib_board
      staging: gpib: common: struct gpib_board
      staging: gpib: eastwood: struct gpib_board
      staging: gpib: fmh_gpib: struct gpib_board
      staging: gpib: gpio: struct gpib_board
      staging: gpib: hp2335: struct gpib_board
      staging: gpib: hp_82341: struct gpib_board
      staging: gpib: ines: struct gpib_board
      staging: gpib: lpvo_usb_gpib: struct gpib_board
      staging: gpib: nec7210 struct gpib_board
      staging: gpib: ni_usb_gpib: struct gpib_board
      staging: gpib: pc2: struct gpib_board
      staging: gpib: tms9914: struct gpib_board
      staging: gpib: tnt4882: struct gpib_board
      staging: gpib: struct typing for gpib_gboard_t
      staging: gpib: Removing typedef for gpib_board

Rodrigo Gobbi (1):
      staging: gpib: change return type of t1_delay function to report errors

Stefan Wahren (5):
      staging: vchiq_arm: Register debugfs after cdev
      staging: vchiq_arm: Fix possible NPR of keep-alive thread
      staging: vchiq_arm: Stop kthreads if vchiq cdev register fails
      staging: vchiq_arm: Create keep-alive thread during probe
      staging: vchiq_arm: Improve initial VCHIQ connect

Thomas Weißschuh (1):
      staging: vchiq_arm: Don't use %pK through printk

Yu-Chun Lin (1):
      staging: gpib: Remove unnecessary .owner assignment

谢致邦 (XIE Zhibang) (2):
      staging: rtl8723bs: Remove some unused functions, macros, and structs
      staging: rtl8723bs: select CONFIG_CRYPTO_LIB_AES

 drivers/pnp/isapnp/core.c                          |    1 +
 drivers/staging/gpib/Kconfig                       |    5 -
 .../staging/gpib/agilent_82350b/agilent_82350b.c   |  260 ++-
 .../staging/gpib/agilent_82350b/agilent_82350b.h   |   50 -
 .../staging/gpib/agilent_82357a/agilent_82357a.c   |  527 +++---
 drivers/staging/gpib/cb7210/Makefile               |    1 -
 drivers/staging/gpib/cb7210/cb7210.c               |  287 ++--
 drivers/staging/gpib/cb7210/cb7210.h               |   45 -
 drivers/staging/gpib/cec/cec.h                     |   29 -
 drivers/staging/gpib/cec/cec_gpib.c                |   96 +-
 drivers/staging/gpib/common/gpib_os.c              |  328 ++--
 drivers/staging/gpib/common/iblib.c                |  167 +-
 drivers/staging/gpib/common/ibsys.h                |   14 +-
 drivers/staging/gpib/eastwood/fluke_gpib.c         |  204 +--
 drivers/staging/gpib/fmh_gpib/fmh_gpib.c           |  280 ++--
 drivers/staging/gpib/gpio/gpib_bitbang.c           |  144 +-
 drivers/staging/gpib/hp_82335/hp82335.c            |   83 +-
 drivers/staging/gpib/hp_82335/hp82335.h            |   30 -
 drivers/staging/gpib/hp_82341/hp_82341.c           |  161 +-
 drivers/staging/gpib/hp_82341/hp_82341.h           |   40 -
 drivers/staging/gpib/include/gpibP.h               |   10 +-
 drivers/staging/gpib/include/gpib_proto.h          |   58 +-
 drivers/staging/gpib/include/gpib_types.h          |   58 +-
 drivers/staging/gpib/include/nec7210.h             |   60 +-
 drivers/staging/gpib/include/tms9914.h             |   52 +-
 drivers/staging/gpib/ines/Makefile                 |    1 -
 drivers/staging/gpib/ines/ines.h                   |   54 +-
 drivers/staging/gpib/ines/ines_gpib.c              |  240 ++-
 drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c |  363 ++---
 drivers/staging/gpib/nec7210/nec7210.c             |  147 +-
 drivers/staging/gpib/ni_usb/ni_usb_gpib.c          |  611 +++----
 drivers/staging/gpib/pc2/pc2_gpib.c                |  632 ++++----
 drivers/staging/gpib/tms9914/tms9914.c             |  117 +-
 drivers/staging/gpib/tnt4882/Makefile              |    1 -
 drivers/staging/gpib/tnt4882/mite.c                |   17 -
 drivers/staging/gpib/tnt4882/tnt4882_gpib.c        | 1690 +++++++++-----------
 drivers/staging/gpib/uapi/gpib_user.h              |   29 +-
 drivers/staging/rtl8723bs/Kconfig                  |    1 +
 drivers/staging/rtl8723bs/core/rtw_ap.c            |   96 +-
 drivers/staging/rtl8723bs/hal/hal_com.c            |    3 +
 drivers/staging/rtl8723bs/include/osdep_intf.h     |   27 -
 drivers/staging/rtl8723bs/include/rtl8723b_hal.h   |    1 -
 drivers/staging/rtl8723bs/include/rtw_io.h         |   92 --
 drivers/staging/rtl8723bs/include/rtw_mp.h         |  341 ----
 drivers/staging/rtl8723bs/os_dep/os_intfs.c        |    2 -
 drivers/staging/sm750fb/ddk750_chip.c              |    2 +-
 .../vc04_services/bcm2835-camera/bcm2835-camera.c  |    2 -
 .../vc04_services/interface/vchiq_arm/vchiq_arm.c  |  129 +-
 .../vc04_services/interface/vchiq_arm/vchiq_core.c |   65 +-
 .../vc04_services/interface/vchiq_arm/vchiq_core.h |    2 +
 .../vc04_services/interface/vchiq_arm/vchiq_dev.c  |   14 +-
 51 files changed, 3235 insertions(+), 4434 deletions(-)
 delete mode 100644 drivers/staging/rtl8723bs/include/rtw_mp.h
