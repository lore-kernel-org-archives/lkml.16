Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89550139CE3;
	Tue,  4 Feb 2025 08:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738658312; cv=none; b=lHwkuUFrIk2vuYczBPtZF+iYIHi3yF86F8+Md/JqnTFvq46b/u8p0RCEUQIQrttOaetJ9KSSf2dI7i0pkHK1NXI7BW9DWl8DjiLTOZFVHKrHqegTlyKIxsERwXvGJS7DkKO16QQGSnD+b15eGhDzA8HRUqLNwgiPcXiP8IjNyP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738658312; c=relaxed/simple;
	bh=Bs8rbK+mkdS/XaSvZ9jbWwELEvoKibCPcrjqSGSqHVI=;
	h=From:To:Cc:Date:Subject:Message-ID:MIME-Version:Content-Type; b=p/LfkpfbqhcOEc5QRCfkWcHf9ke4i+uhWHWqv9wbs2kiC4PwQYd2SP7SpJX8Hqo84PrwyJmuD1Ypejv7Q4Ef0aXkKihRKqfm1yH0TfrRen6CfyRCN3kSSgMjhKLcp8/JlbZL0C76qoHc6LRfQmWOM5VGkTwHKH3nvnYuduVNc6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gdsPnHXL; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gdsPnHXL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738658310; x=1770194310;
  h=from:to:cc:date:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Bs8rbK+mkdS/XaSvZ9jbWwELEvoKibCPcrjqSGSqHVI=;
  b=gdsPnHXLGyAoVPVUsFlHuk0haxZOQDnugN21QJvNsOn2YUfeJL/QF95S
   gQWWSVtsdpipQF9jX/sEY4YtjmwOsgBVx+m3YxjMjviVASsImtJ8jha/3
   kgum30Xlcm6atVCmdwHA77Q+FnmrkzFTa5dhyBR+4MfZHvPXBF5ToN9eK
   S/soWXHuW8RCLe88GdeirEsCZZ4JDnWT+nJSb7OlkElJgENfnMGXaow0N
   h+SqriUOw/DladX7ozuzpTkigFfJx1964hPYMCnQNuWJi9sDG7cMCA1Ld
   XpCkdOYLYHRmc8cCDYd6jh2I7igYKRsIwzMbwmOnBVAys9wzJ1cuPDiMX
   g==;
X-CSE-ConnectionGUID: iXMC5K7AT4y9tWLNv3gOGg==
X-CSE-MsgGUID: hEdfWGUrTH6qVC6ae/CQ+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="26774420"
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; 
   d="scan'208";a="26774420"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 00:38:29 -0800
X-CSE-ConnectionGUID: JV22+CyLSJ+sa+0KInZUPA==
X-CSE-MsgGUID: S1LTLGXBR+GEuGHiQg6X0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; 
   d="scan'208";a="110497680"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.75])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 00:38:28 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, PDx86 <platform-driver-x86@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy@kernel.org>
Date: Tue, 04 Feb 2025 10:36:33 +0200
Subject: [GIT PULL] platform-drivers-x86 for v6.14-2
Message-ID: <pdx86-pr-20250204103633-1857020998@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Linus,

Here is a platform-drivers-x86 fixes PR for v6.14.

Fixes:

 - ideapad-laptop: Pass a correct pointer to the driver data

 - intel/ifs: Provide a link to the IFS test images

 - intel/pmc: Use large enough type when decoding LTR value

Regards, i.


The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v6.14-2

for you to fetch changes up to a787ab73e2e43c0a3df10bc8d9b9b7a679129d49:

  platform/x86/intel/ifs: Update documentation with image download path (2025-02-04 10:00:45 +0200)

----------------------------------------------------------------
platform-drivers-x86 for v6.14-2

Fixes:

 - ideapad-laptop: Pass a correct pointer to the driver data

 - intel/ifs: Provide a link to the IFS test images

 - intel/pmc: Use large enough type when decoding LTR value

The following is an automated shortlog grouped by driver:

ideapad-laptop:
 -  pass a correct pointer to the driver data

intel/ifs:
 -  Update documentation with image download path

intel: pmc:
 -  fix ltr decode in pmc_core_ltr_show()

----------------------------------------------------------------
Dmitry Kandybka (1):
      platform/x86/intel: pmc: fix ltr decode in pmc_core_ltr_show()

Fedor Pchelkin (1):
      platform/x86: ideapad-laptop: pass a correct pointer to the driver data

Jithu Joseph (1):
      platform/x86/intel/ifs: Update documentation with image download path

 drivers/platform/x86/ideapad-laptop.c | 2 +-
 drivers/platform/x86/intel/ifs/ifs.h  | 9 ++++-----
 drivers/platform/x86/intel/pmc/core.c | 4 ++--
 3 files changed, 7 insertions(+), 8 deletions(-)
