Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A43D2F2A;
	Mon, 10 Feb 2025 05:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739163870; cv=none; b=OJaz+A6ACK4mOqdVJ5M7lOJQKgiK3gnw5Wl7J8qHcMtISTkp7aDUsy3Di+Xa3XjJn6qY17BdbopYCIigsVyIzvuOIjE8CMx77u3ZxE/AXkkwjloHRmBVet2soXnZhjyI5Nz6hg2mVKUw9kJG8s00NDVf/sErUNo9wVO4WejY3TU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739163870; c=relaxed/simple;
	bh=+wVMqDUoFJrXyl+eWeoZvjSJ48Rh2HzkP3a7Q5+dw/k=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=aETf976bzJdjPG1DxVYJ60OeUBVMX9X4628zbjuBT91SoE5VbaSa9ZMRNFALDz2CgZK1CJmuLV2NMet36ZE4hirtIhbXFurP+QkghMjp2T4h2omi7JqYV9gXbcKZ283mNYTKK19qQFtHn0WWkP59z9JpzEwNrYO4/Q6CUBz0HHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TjVCBqrs; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TjVCBqrs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739163868; x=1770699868;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=+wVMqDUoFJrXyl+eWeoZvjSJ48Rh2HzkP3a7Q5+dw/k=;
  b=TjVCBqrsnIo2a+z/7/UEr5Mwgz/Z1YxTDUaiA6iDUdFRbL/wprtzk+l1
   xCULEBVzzfbSeTcUgEUgS8eAZlygre9MjXj4u+wNdUMr2tlxC/ook9YVj
   JSNJMYd2R6yjzLbVDJhdlymYVMmVFt6fVdWf6x6XntgO5ROgVegQs1N0J
   hyRda1ALdH9R5wwetDYqRNcV0JoMDsWwiA6pwDWkS8bZqHpfNxDe1lz6A
   rEhnVYo6iTQR9OGce9liLL7hMEvaC0eSrBEHAnGZOJDM1OtywB82x10Fc
   /ZrGauOUHmefOs1TCGLqhfZrBYoKpsERzNbmYggWclX9l3tdzpplCeiPW
   A==;
X-CSE-ConnectionGUID: lftuL8JrSa6/aw5pyPLkpA==
X-CSE-MsgGUID: r5D1IVU3S9SeQPXgPJz8/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="50369424"
X-IronPort-AV: E=Sophos;i="6.13,273,1732608000"; 
   d="scan'208";a="50369424"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2025 21:04:27 -0800
X-CSE-ConnectionGUID: /SRVjfbjQam6BlWpgBgFDg==
X-CSE-MsgGUID: 46XZSpRTST6N6As1m1n6hA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,273,1732608000"; 
   d="scan'208";a="112312185"
Received: from inlubt0246.iind.intel.com ([10.191.24.87])
  by fmviesa008.fm.intel.com with ESMTP; 09 Feb 2025 21:04:23 -0800
From: subramanian.mohan@intel.com
To: linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	gregkh@linuxfoundation.org,
	andriy.shevchenko@linux.intel.com,
	giometti@enneenne.com,
	tglx@linutronix.de,
	corbet@lwn.net
Cc: eddie.dong@intel.com,
	christopher.s.hall@intel.com,
	pandith.n@intel.com,
	thejesh.reddy.t.r@intel.com,
	david.zage@intel.com,
	srinivasan.chinnadurai@intel.com,
	subramanian.mohan@intel.com
Subject: [PATCH v13 0/4] Add support for Intel PPS Generator
Date: Mon, 10 Feb 2025 10:34:17 +0530
Message-Id: <20250210050421.29256-1-subramanian.mohan@intel.com>
X-Mailer: git-send-email 2.35.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Subramanian Mohan <subramanian.mohan@intel.com>

The goal of the PPS (Pulse Per Second) hardware/software is to generate a
signal from the system on a wire so that some third-party hardware can
observe that signal and judge how close the system's time is to another
system or piece of hardware.

Existing methods (like parallel ports) require software to flip a bit at
just the right time to create a PPS signal. Many things can prevent
software from doing this precisely. This (Timed I/O) method is better
because software only "arms" the hardware in advance and then depends on
the hardware to "fire" and flip the signal at just the right time.

To generate a PPS signal with this new hardware, the kernel wakes up
twice a second, once for 1->0 edge and other for the 0->1 edge. It does
this shortly (~10ms) before the actual change in the signal needs to be
made. It computes the TSC value at which edge will happen, convert to a
value hardware understands and program this value to Timed I/O hardware.
The actual edge transition happens without any further action from the
kernel.

The result here is a signal coming out of the system that is roughly
1,000 times more accurate than the old methods. If the system is heavily
loaded, the difference in accuracy is larger in old methods.

Application Interface:
The API to use Timed I/O is very simple. It is enabled and disabled by
writing a '1' or '0' value to the sysfs enable attribute associated with
the Timed I/O PPS device. Each Timed I/O pin is represented by a PPS
device. When enabled, a pulse-per-second (PPS) synchronized with the
system clock is continuously produced on the Timed I/O pin, otherwise it
is pulled low.

The Timed I/O signal on the motherboard is enabled in the BIOS setup.
Intel Advanced Menu -> PCH IO Configuration -> Timed I/O <Enable>

References:
https://en.wikipedia.org/wiki/Pulse-per-second_signal
https://drive.google.com/file/d/1vkBRRDuELmY8I3FlfOZaEBp-DxLW6t_V/view
https://youtu.be/JLUTT-lrDqw

Patch 1 Replaced copy of pps-gen info struct with const pointer in
pps-gen framework..
Patch 2 adds the pps(pulse per second) generator tio driver to the pps
subsystem.
Patch 3 documentation and usage of the pps tio generator module.
Patch 4 includes documentation for sysfs interface.

These patches are based on the timers/core branch:
[1] https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/?h=timers/core
These changes are dependent on patches that are merged in [1].

Please help to review the changes.

Thanks in advance,
Subramanian Mohan

Changes from v2:
 - Split patch 1 to remove the functions in later stages.
 - Include required headers in pps_gen_tio.

Changes from v3:
 - Corrections in Documentation.
 - Introducing non-RFC version of the patch series.

Changes from v4:
 - Setting id in ice_ptp
 - Modified conversion logic in convert_base_to_cs.
 - Included the usage of the APIs in the commit message of 2nd patch.

Changes from v5:
 - Change nsecs variable to use_nsecs.
 - Change order of 1&2 patches and modify the commit message.
 - Add sysfs abi file entry in MAINTAINERS file.
 - Add check to find if any event is missed and disable hardware
   accordingly.

Changes from v6:
 - Split patch 1 into 1&2 patches.
 - Add check for overflow in convert_ns_to_cs().
 - Refine commit messages.

Changes from v7:
 - Split the if condition and return error if current time exceeds
   expire time.
 - Update kernel version and month in ABI file.

Changes from v8:
 - Add function to enable Timed I/O.
 - Changed the updating of tio->enabled to a centralized place in
   disable and enable functions.

Changes from v9:
 - use tio->enabled instead of reading ctrl register.
 - change error code in enable_store to -ENODEV.

Changes from v10:
 - Rebased to latest codebase.

Changes from v11:
 - Rebased to latest codebase.

Changes from v12:
 - As part of pps-gen framework, Replaced copy of pps-gen info struct
   with const pointer.
 - TIO driver adapted to pps-gen framework.
 - Fixed review comments by Andy.
 - Rebased to latest codebase.

Subramanian Mohan (4):
  drivers pps/generators: replace copy of pps-gen info struct with const
    pointer
  pps: generators: Add PPS Generator TIO Driver
  Documentation: driver-api: pps: Add Intel Timed I/O PPS generator
  ABI: pps: Add ABI documentation for Intel TIO

 Documentation/ABI/testing/sysfs-pps-gen-tio |   6 +
 Documentation/driver-api/pps.rst            |  27 +-
 MAINTAINERS                                 |   1 +
 drivers/pps/generators/Kconfig              |  16 ++
 drivers/pps/generators/Makefile             |   1 +
 drivers/pps/generators/pps_gen-dummy.c      |   2 +-
 drivers/pps/generators/pps_gen.c            |  13 +-
 drivers/pps/generators/pps_gen_tio.c        | 272 ++++++++++++++++++++
 drivers/pps/generators/sysfs.c              |   6 +-
 include/linux/pps_gen_kernel.h              |   4 +-
 10 files changed, 334 insertions(+), 14 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-pps-gen-tio
 create mode 100644 drivers/pps/generators/pps_gen_tio.c

-- 
2.35.3

