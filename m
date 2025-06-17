Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9606828C5D2;
	Tue, 17 Jun 2025 12:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750163978; cv=none; b=kuaauEQegE2YuYWXf7Acd6mG88BYn++VQElz/oXRJIQhEXz7/kvIY8Hq9ur6piFRc1DWCMuLP+/LO/2WvR2MeAteZG+Z6laJB/7IkiqrslBZkRpDbkZFaYwq7+gN63Z0N30VN+0s0Th2JVjIAzHjarp4eaAK0YZbdJt/iTMqvQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750163978; c=relaxed/simple;
	bh=mQVcwAj9KJX+DfsLdHR0JpvHr/BZjuZTw8oHM3W7400=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=PoAmKanTTs/gFFplbV9AzM6zqYY8POEoYlrluf5h+ib5Ni+ry+MP/0PZ5jwRF7lyLukgrmu/fthtolMgCcIuePIkorosI2PCcoIc/G00cJsWFNBQOIrNHfdVCGywP+UMfzeRDehwnHd7spZvz8vlZnTQctPDgIW3GEbv0y7AE6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mtFTTrbf; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mtFTTrbf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750163977; x=1781699977;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=mQVcwAj9KJX+DfsLdHR0JpvHr/BZjuZTw8oHM3W7400=;
  b=mtFTTrbfH86879Oy/7J/fRggjvzBzvLb3JSCwAmWwm/ILT/78ZN1tlDI
   N12ZHx3Kk6/fbdfvZo4CbbnLZAB3z39B3JpNOsrWjUZ8Q9MNHc86cmVJn
   K6RunYZ8c5gwwiA+KnH3lNWkw8n8OpyPjbznWVPk/EyLx2TvrVb+/NtnM
   DrvBPHMU2g2p4fLvDNg8ugC5JkKXvU3fiNi/l7Zf7XPX0E8e5/hdvsUwx
   E73RSSs5rUItXCeRE+VHqmxjdHZe0Xe76aFVusg0lcgc6589OYEUO7lGz
   kxTtSkvIxmvjQCSszlYdqDiNiRefpfcRTZtiITt8X7GrgAhlCnkcSjh/N
   A==;
X-CSE-ConnectionGUID: rJnVgViSRhC2Y6lCX9ga9A==
X-CSE-MsgGUID: plTmsah5SL6dO3qkiEl6tw==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="52253752"
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; 
   d="scan'208";a="52253752"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 05:39:36 -0700
X-CSE-ConnectionGUID: zu2EWTxSQ8WneoFKNjY+0w==
X-CSE-MsgGUID: jqkK+rf2S1maxoLEO2S/HA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; 
   d="scan'208";a="148608273"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.164])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 05:39:33 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: jesse.huang@portwell.com.tw, Hans de Goede <hansg@kernel.org>, 
 Ivan Hu <ivan.hu@canonical.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250616074819.63547-1-ivan.hu@canonical.com>
References: <20250616074819.63547-1-ivan.hu@canonical.com>
Subject: Re: [PATCH v2] platform/x86: portwell-ec: Move watchdog device
 under correct platform hierarchy
Message-Id: <175016396784.2117.17760069143731319818.b4-ty@linux.intel.com>
Date: Tue, 17 Jun 2025 15:39:27 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Mon, 16 Jun 2025 15:48:19 +0800, Ivan Hu wrote:

> Without explicitly setting a parent for the watchdog device, the device is
> registered with a NULL parent. This causes device_add() (called internally
> by devm_watchdog_register_device()) to register the device under
> /sys/devices/virtual, since no parent is provided. The result is:
> 
> DEVPATH=/devices/virtual/watchdog/watchdog0
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: portwell-ec: Move watchdog device under correct platform hierarchy
      commit: c8892c2a5b27d4026cda60409c393ba0d6c88df9

--
 i.

