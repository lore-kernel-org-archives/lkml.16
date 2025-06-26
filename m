Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85D4428FFEE
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 17:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750958450; cv=none; b=Lvgh+p74tf5vt1UbNFJIdFp8ImWf880pNCouunQ5tvJfkOqM/RMn68dcYPLrBmEmlmpTX9AKbaRo4RQavZLILmZ2IWmTpUnQIJoAtY67/5QMcALEJcbrUQp4lEshZxznf4IoxtU+jZzC39LCvEUfm6/cN5CjU+R9y7fDYVNhnBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750958450; c=relaxed/simple;
	bh=uzJcQ0UQhwdFeIS+BXAwA1wajHfdbWMciqAPdcOSn7M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oYRX3BOqVplOloDzWIpz1f/WKipXXB31sEiO7pCGFPtlzWhTKIVOhV2wTgsgQrwY+Rp+OsgxQoyY+//JorVCek9lDEERLyvE6Mv+WeL91r63BNHviOkmKSS8xQPek6o2mwYfMaJbFhfn6veCTr+jzcpwITCC8Z/0UFwOPmOI9j4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gQ0XJDqT; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gQ0XJDqT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750958450; x=1782494450;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uzJcQ0UQhwdFeIS+BXAwA1wajHfdbWMciqAPdcOSn7M=;
  b=gQ0XJDqTA+exX8RP/P7nZkT6lY1PPJxbJaP5GtsQEsIyq4bZ6eRqDE+F
   OtWFzc1LgHnfT68OnaUhEWNLB7Hkc8CNKa3BwjHON/Rf/MRb8CZagcDZK
   8YSqtpx7N6HhjQu8Lr8BJZgG0Ly0YamOMrnmwt8gz6lIWYE9Lm4azeLpQ
   wjRzMRWMOXN6rluXZqFS96o5QsbAoJ1pZpM1OXYquC0iqN/GEG3RJGmMB
   S6WopKLyntX4QP463GWJUyZ6zVpv72g4qjiFfugqh8zGeEblyqUghAUO1
   Vs7WiP0VSRdJxzCEXrxV7zsmhwnZFKOabJRLjxHqF7KzPLpJ79aA1DF47
   A==;
X-CSE-ConnectionGUID: Kr0c5GcOQmimvF00XnbJrw==
X-CSE-MsgGUID: twQdivtsQLyLB+GmDfmgvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="55890569"
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; 
   d="scan'208";a="55890569"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 10:20:45 -0700
X-CSE-ConnectionGUID: 0vRWKO1uRI6ZQlvDNCEYCw==
X-CSE-MsgGUID: AjkbOknfTTClFyPE2D11vQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; 
   d="scan'208";a="158068526"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa004.fm.intel.com with ESMTP; 26 Jun 2025 10:20:43 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 41A6F21E; Thu, 26 Jun 2025 20:20:42 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: linux-kernel@vger.kernel.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/2] firmware: sysfb: Unorphan sysfb files
Date: Thu, 26 Jun 2025 20:19:00 +0300
Message-ID: <20250626172039.329052-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250626172039.329052-1-andriy.shevchenko@linux.intel.com>
References: <20250626172039.329052-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The commit d391c5827107 ("drivers/firmware: move x86 Generic
System Framebuffers support") moved some code to the common
folders and effectively orphaned it without any reason. Put
it back under DRM MISC record.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8dc0f6609d1f..c2c7aa594160 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7973,10 +7973,12 @@ T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/
 F:	Documentation/devicetree/bindings/gpu/
 F:	Documentation/gpu/
+F:	drivers/firmware/sysfb*.c
 F:	drivers/gpu/drm/
 F:	drivers/gpu/vga/
 F:	rust/kernel/drm/
 F:	include/drm/drm
+F:	include/linux/sysfb.h
 F:	include/linux/vga*
 F:	include/uapi/drm/
 X:	drivers/gpu/drm/amd/
-- 
2.47.2

