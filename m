Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADDCE155CBD
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 07:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750663588; cv=none; b=PAVF9bCQ5yZu3lxkMltnBYTcZAgPWFM7MTb9xZiVTCtyCR62e0LJmHFj3VL3pkwHxnWft165uZklfD2MzaBpHuAvfCv4ZdnJI8b9+I765f6sv3esENVzrs8XFzbHUa5/CrDO65E9BFIIfVogcy3d5Dj+YUbRQ7byP69fyJGy8cU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750663588; c=relaxed/simple;
	bh=zD1ykV9kZECgcfxM+3m0cJjb31keH4zDxEnCdj41wFo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=tdZB5T78flewHfC7Gwhi9yAYD+OL7+E4Ldl451zoKBYbz98Bbqe4ytTuoysae5d368PPS1Lueq/vEVKtbk5BS+ksKBb2JFxpaVfr+m8brg4MyFSw3ASgp8kwYrsWUBp68vvNVEjPSXmTs8uL7BkpepA2tm2/AIg6YxkAbjs+uFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R+18yoJh; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R+18yoJh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750663586; x=1782199586;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=zD1ykV9kZECgcfxM+3m0cJjb31keH4zDxEnCdj41wFo=;
  b=R+18yoJhLcpeDqE6/uFYQMVGGO7GAembBJnDi0bl1qDmrZ9IRcWUckCf
   06tB86TPruyq7V3sXfHHzDlvWH4UywZ1MXKZ+jUfG5rRJTx+JZiTtU8VZ
   nzmEUboC81kIkbQJW4fS7K3vfnklktlj2FHrKeMMVqT26ZeZHVYOlCVUA
   xQV20qlWUXZXgy6qnyEL3yhlAPE+MxUvIMhOrFuQhvIFQtPzJp7fH4WJz
   kd3PEpPZAIBAjgLATDudCASmKfHmvcKhLKI3ZoGh5pLGPuUWh1Y7WfwNP
   mpnQY2qzYebvTF8Sd15g0YD9bnfJYqHGr51zgLKBPlXZ2b1RyuOL1CYNo
   g==;
X-CSE-ConnectionGUID: 6yM+UBUxTUO8cSLoI4BwNQ==
X-CSE-MsgGUID: A9yO2pxHTpOq+/mfIRc+Jw==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="64289170"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="64289170"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 00:26:26 -0700
X-CSE-ConnectionGUID: 4Za27yxCTE2kmJ8hkBwUsw==
X-CSE-MsgGUID: cIX5nXMDTqKAKXsbwAIp2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="151662633"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa006.fm.intel.com with ESMTP; 23 Jun 2025 00:26:23 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 2B60E38C; Mon, 23 Jun 2025 10:26:21 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-kernel@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	=?UTF-8?q?Daniel=20D=C3=ADaz?= <daniel.diaz@linaro.org>
Subject: [PATCH v1 1/1] x86/defconfigs: Explicitly unset CONFIG_64BIT in i386_defconfig
Date: Mon, 23 Jun 2025 10:25:36 +0300
Message-ID: <20250623072536.3425344-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Daniel Díaz <daniel.diaz@linaro.org>

A recent refresh of the defconfigs got rid of the following
(unset) config:

  # CONFIG_64BIT is not set

Innocuous as it seems, when the config file is saved again the
behavior is changed so that CONFIG_64BIT=y.

Currently,

  $ make i386_defconfig
  $ grep CONFIG_64BIT .config
  CONFIG_64BIT=y

whereas previously (and with this patch):

  $ make i386_defconfig
  $ grep CONFIG_64BIT .config
  # CONFIG_64BIT is not set

Fixes: 0e11f689ec03 ("x86/kconfig/32: Refresh defconfig")
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 arch/x86/configs/i386_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/configs/i386_defconfig b/arch/x86/configs/i386_defconfig
index bd182325ebb4..9fc5c2eb58af 100644
--- a/arch/x86/configs/i386_defconfig
+++ b/arch/x86/configs/i386_defconfig
@@ -28,6 +28,7 @@ CONFIG_BLK_DEV_INITRD=y
 CONFIG_KALLSYMS_ALL=y
 CONFIG_PROFILING=y
 CONFIG_KEXEC=y
+# CONFIG_64BIT is not set
 CONFIG_SMP=y
 CONFIG_HYPERVISOR_GUEST=y
 CONFIG_PARAVIRT=y
-- 
2.47.2

