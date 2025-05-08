Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D3A223DE4;
	Thu,  8 May 2025 23:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746745377; cv=none; b=hecHsjrZOxehJKydO5zaGh6cE+Yw5240qdU5bBClgj442uTgX5FI0X4d83NX6EqtKPhguzoBQiEXZsx5/tvPsYNxkcmmEyXkRGJarQWIfPelNgZsQRvQZKayC7kT9XFnJGEH8XIoWQ0YwO+/6FrMmpHUf81Ln1tHDzeI+WVjZ/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746745377; c=relaxed/simple;
	bh=tZkfwLEtPpdovnvdknwZ3/XpGIn3G/n0uovX92+v6Kk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RJisvVJlB8pE+WqlmAOkp0GG8lwg0fJWoskYLMKrdIJvKhkhBaUQIBdWBQr8PHXxaN1AQOKEn7ZQQJJjOQ9osJI3j39b4CLzszRzeDUX0gAZefbkt1puRy0UFKvTzPBDfje8qyUGJEs4VF7eNhwUozmTPY+B5i3lCJi1Wq5NsZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d444oJmi; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d444oJmi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746745377; x=1778281377;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tZkfwLEtPpdovnvdknwZ3/XpGIn3G/n0uovX92+v6Kk=;
  b=d444oJmiFK7fHzn4G0WEzVsNBuaCI/lurkW4lWapLGSbZkIR+qkMohbg
   g/6/WLjP4MH6GhpwXkqojfgC+4IPGTbbxnkVkTbWgp63miao1x9taco3u
   702Km9GEuKwNIGxWAdtiuWJDBJXfTrrdTm9Kf4MN8EF3nxB+XpgN2hdPY
   zWa+2He8N+raZkGp2iR2FV5/iK/xpQaMKL3p9Lm+AhqQCdI/9dCB+FxjC
   b+mNk1IkkKg6mUIZoUodIRAEL2wsGl0wq2DZ7IgrLeZPj4MlRfCq08LA6
   WTn+AsLkbcXGnx27pU9MszkXumoZRdJFt1x+qmx4trMqUPTR9fSe+lQi1
   w==;
X-CSE-ConnectionGUID: y8KeJlUARaK2PxzA1x7/Mg==
X-CSE-MsgGUID: b9iRxyePQbeST4h0U7lwFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="59552597"
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; 
   d="scan'208";a="59552597"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 16:02:54 -0700
X-CSE-ConnectionGUID: 5NUD2MP4S6K+vDD2XjLzIg==
X-CSE-MsgGUID: Ha13LD7cQFSGEknNmREt/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; 
   d="scan'208";a="136931255"
Received: from spandruv-desk.jf.intel.com ([10.54.75.16])
  by fmviesa010.fm.intel.com with ESMTP; 08 May 2025 16:02:53 -0700
From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
To: hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH v3 2/5] Documentation: admin-guide: pm: Add documentation for agent_types
Date: Thu,  8 May 2025 16:02:39 -0700
Message-ID: <20250508230250.1186619-3-srinivas.pandruvada@linux.intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250508230250.1186619-1-srinivas.pandruvada@linux.intel.com>
References: <20250508230250.1186619-1-srinivas.pandruvada@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add documentation to describe agent_types attribute.

Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
v3:
No change
v2:
No change

 .../admin-guide/pm/intel_uncore_frequency_scaling.rst        | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/admin-guide/pm/intel_uncore_frequency_scaling.rst b/Documentation/admin-guide/pm/intel_uncore_frequency_scaling.rst
index 5151ec312dc0..84608dad84bd 100644
--- a/Documentation/admin-guide/pm/intel_uncore_frequency_scaling.rst
+++ b/Documentation/admin-guide/pm/intel_uncore_frequency_scaling.rst
@@ -97,6 +97,11 @@ Attributes in each directory:
 ``package_id``
 	This attribute is used to get the package id of this instance.
 
+``agent_types``
+	This attribute displays all the hardware agents present within the
+	domain. Each agent has the capability to control one or more hardware
+	subsystems, which include: core, cache, memory, and I/O.
+
 The other attributes are same as presented at package_*_die_* level.
 
 In most of current use cases, the "max_freq_khz" and "min_freq_khz"
-- 
2.49.0

