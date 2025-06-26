Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5BB2E718D;
	Thu, 26 Jun 2025 15:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750951203; cv=none; b=jOLEwHEpiX1SqfrTk+IE+tl7/W1bw6Hl9PPrRdXVZbO0xmLxW9+4oYvXCCm/Tl+lV2tm0B9mOBgoyIytAKcrcLbtLV4UfKuCLlqDFpDDsFMwggWGV1VReS11Mi+Z9yDpM7fquPJI/nz4gtJSHaaCRBPM2TttykplWtN/SEmzfIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750951203; c=relaxed/simple;
	bh=CEnmvCK+tZOnG4ocoionyzTDYqD43xaZs+fiIJ4JpLI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=XPDkhP9mce3Q3bSX/5DfBsYicFZS54bVFz2wMCFIRfiA9Zf9FG/UmyG8AQN11Y6mVs+j3X7ReaeS7mSEbCZ/NkthkvZvQQQWVrVQb1FhTlhEqg3E75RxdEQ1beVpalw6xKXKZ3xX7dx0T/EcDB2K89udJdHCKaphaq/cU8lzsnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IupvtFvc; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IupvtFvc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750951202; x=1782487202;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=CEnmvCK+tZOnG4ocoionyzTDYqD43xaZs+fiIJ4JpLI=;
  b=IupvtFvchmxAUAPm8azIi77fmPhQTFkRhzd0pwAEqpnMRLee+NA4PXFi
   2cfB7nWAnMdnJ8GjluXemG/yi/F14NdLCvtsubep02r+Esuc723b/WEub
   DCwWXAQipDHVt/1Jg389vYzI0g9Rkqw41u+00+p0mogaqkNbRrHZQ0bQa
   lrtdfz8JZ/cH+NclWf/T/0yBacw/Hs5fBLsOPIhRsOB4V+OJqNBISJczg
   SnIN1vpXNWbaxgGPSXP2RX5HCyy2UNjMW4uYgZ/MFb0/QTIWtJjABFRtk
   msCmz/gYrPItAkn6OJzQOS/7dLggKnLaYAuRtUXpkcWXZU0aCwHsoWyYT
   Q==;
X-CSE-ConnectionGUID: 7s7bcPNvQsuKw2HbAiLV7Q==
X-CSE-MsgGUID: LgUbvVe2QLyt2uGaik0zog==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="70823142"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="70823142"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 08:19:58 -0700
X-CSE-ConnectionGUID: OVy7sUwhQa290ZmdyD/9hg==
X-CSE-MsgGUID: Sh4lnV8JT3CYf3a137UwhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="153044424"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.144])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 08:19:56 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: hansg@kernel.org, davthompson@nvidia.com, michaelsh@nvidia.com, 
 vadimp@nvidia.com, platform-driver-x86@vger.kernel.org, 
 Alok Tiwari <alok.a.tiwari@oracle.com>
Cc: linux-kernel@vger.kernel.org
In-Reply-To: <20250622072921.4111552-1-alok.a.tiwari@oracle.com>
References: <20250622072921.4111552-1-alok.a.tiwari@oracle.com>
Subject: Re: [PATCH 1/2] platform/mellanox: Fix spelling and comment
 clarity in Mellanox drivers
Message-Id: <175095118765.2233.246981792463543905.b4-ty@linux.intel.com>
Date: Thu, 26 Jun 2025 18:19:47 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Sun, 22 Jun 2025 00:29:11 -0700, Alok Tiwari wrote:

> This commit corrects several minor typographical errors in comments
> and error messages across multiple Mellanox platform driver.
> Fixed spelling of "thresholds", "region", "platform", "default",
> and removed redundant spaces in comment strings and error logs.
> 
> These changes are cosmetic and do not affect runtime behavior.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/2] platform/mellanox: Fix spelling and comment clarity in Mellanox drivers
      commit: c3ac7e30309b8221a8321c3882d289ba519b4104
[2/2] platform/mellanox: nvsw-sn2201: Fix bus number in adapter error message
      commit: d07143b507c51c04c091081627c5a130e9d3c517

--
 i.

