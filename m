Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A70C1F3FE3;
	Fri,  4 Apr 2025 14:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743777697; cv=none; b=AJhA5fj19u4hx6qjlSW1TUe6zxebza2h2SzfSy5pyHXZt1F09XaSX1G4xNfKaaWJf9NJY/CCKz3WkkVAFmF0HN9ugtPd2qh4ORApn7bLUKJzABZdESkb7B4ZESWA/QEubcdmb1ZEyb6GD/51i/bFnvWTFnvkTt+wyideWXsZkJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743777697; c=relaxed/simple;
	bh=oNpdL4E8wz9lRTk365tAFzVtcpOww47L7PGyO3sgtWA=;
	h=From:To:Cc:Date:Subject:Message-ID:MIME-Version:Content-Type; b=Mfd2bVNHy0OeasdOyvHWfVxFfMoDu+J9sVLwpV2099jHDCBjVtVbGYKT0tZkTi33oUGJTUo55p1+oZy1YkthjaEnPcVUksE3ikfDEQ30RnihWHZGZguT28kW0YHBEMLdcFA3w1F5VqtC2S4KpFN8v416X3EBadGoO7sE5V405Dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CSKFzfX8; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CSKFzfX8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743777695; x=1775313695;
  h=from:to:cc:date:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=oNpdL4E8wz9lRTk365tAFzVtcpOww47L7PGyO3sgtWA=;
  b=CSKFzfX8g0rfDYpszQAbmrQrEnF7XfWVBh+mn0LfZyt6N0VGGlLAnQ8N
   HkV8hAD66FflKZG+TxC7s8kO5HuTI0XXCEgeYlEuTeOXccfbvblzMSmQx
   qCBEMheolvtZtYcPy+h67Gub4WaJP5mCnIfcDFHneg08SAkFE7Klf8LHd
   fTuBYFrYZr2OzXIGVBpDF9NjpS3xg8PL/Y4hL14k4VNrOxX7hxYGlVh58
   J7MmtftlIY/wzUonCCc6tz8RwxFJ4Rtdz90EdqOGVFMN+isxoLqaVQZyO
   Q8ijawe43ykUn9YpkaE/jRcynOihGlRBQkIE3TUuxJdWSdJ8qMg0ApeGC
   Q==;
X-CSE-ConnectionGUID: pyTmysvYQvmYS3LP5GWcOQ==
X-CSE-MsgGUID: IGkGD/7hTiSzNUGZle+q2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11394"; a="55853931"
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; 
   d="scan'208";a="55853931"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 07:41:33 -0700
X-CSE-ConnectionGUID: dyOYAypxRB2PH3UXXo+fpQ==
X-CSE-MsgGUID: 30DihJ+cQLOdw5ExOUADNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; 
   d="scan'208";a="127627661"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.54])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 07:41:31 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, PDx86 <platform-driver-x86@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy@kernel.org>
Date: Fri, 04 Apr 2025 17:39:20 +0300
Subject: [GIT PULL] platform-drivers-x86 for v6.15-2
Message-ID: <pdx86-pr-20250404173920-315358368@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Linus,

Here is a platform-drivers-x86 fixes PR for v6.15.

Fixes:

- thinkpad_acpi:

  - Fix NULL pointer dereferences while probing

  - Disable ACPI fan access for T495* and E560

- ISST: Correct command storage data length

Regards, i.


The following changes since commit 08733088b566b58283f0f12fb73f5db6a9a9de30:

  Merge tag 'rust-fixes-6.15-merge' of git://git.kernel.org/pub/scm/linux/kernel/git/ojeda/linux (2025-03-31 18:39:59 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v6.15-2

for you to fetch changes up to 566d3a52b8f618d22664171633d7106a630f46b9:

  MAINTAINERS: consistently use my dedicated email address (2025-04-01 14:21:02 +0300)

----------------------------------------------------------------
platform-drivers-x86 for v6.15-2

Fixes:

- thinkpad_acpi:

  - Fix NULL pointer dereferences while probing

  - Disable ACPI fan access for T495* and E560

- ISST: Correct command storage data length

The following is an automated shortlog grouped by driver:

ISST:
 -  Correct command storage data length

MAINTAINERS:
 -  consistently use my dedicated email address

thinkpad_acpi:
 -  disable ACPI fan access for T495* and E560
 -  Fix NULL pointer dereferences while probing

----------------------------------------------------------------
Eduard Christian Dumitrescu (1):
      platform/x86: thinkpad_acpi: disable ACPI fan access for T495* and E560

Kurt Borja (1):
      platform/x86: thinkpad_acpi: Fix NULL pointer dereferences while probing

Srinivas Pandruvada (1):
      platform/x86: ISST: Correct command storage data length

Thomas Weißschuh (1):
      MAINTAINERS: consistently use my dedicated email address

 MAINTAINERS                                        |  8 ++---
 drivers/platform/x86/gigabyte-wmi.c                |  4 +--
 .../x86/intel/speed_select_if/isst_if_common.c     |  2 +-
 drivers/platform/x86/thinkpad_acpi.c               | 35 +++++++++++++++++-----
 4 files changed, 34 insertions(+), 15 deletions(-)
