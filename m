Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E36F42F3C35
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 07:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751615705; cv=none; b=i6UdhscqBcCHqteluk3Ni6v+nCLmeJsdsPszXeH1UOWBmndQ0aVvdyKOfBNy81pqay/mBxn46Hz5quwWNk/ZC7QBxfhWTerE9SgzkIajltUrfDWhGMe+GNg4sRocinzlDkUiTDjeRk5RX3LBUVApfJJI/mE5AeoJop4Y1WL3E4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751615705; c=relaxed/simple;
	bh=qd8Jabk23N4/4W/Jfwg2Vhw/5dNNhoAgmpr14eTHRnE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lcaORVyDBSz82KwLVKFkh4fzdOGGU4VEPTCEOWI2yG44OY47sjkfnxmahzTjnpCy02PCJ0ABOSO1hKRw86zFC0NybH1VhQF+yu+BwEiOc9+JBTui/Z6jt8P0cx/pytiv5eZQ94RkU4rI0GSFnRcWtFbDN3JwRN8A1TVR2/YDJ/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YRl3gRbt; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YRl3gRbt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751615703; x=1783151703;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qd8Jabk23N4/4W/Jfwg2Vhw/5dNNhoAgmpr14eTHRnE=;
  b=YRl3gRbtqnuJB+FcWmQJIl6r1oVIgDAHWVjezacEBrD/oHKCxzNB6Mce
   To/iqKc7ERic57lhG5FfCdW2gDm+K/ngb16EsERPrt56fCpNPO0S5JE55
   moUaF5CPZnpM6E8jFvjDInKIEwANt/SyLjABlhBiL4HABD8IVByIgO+nr
   893ia9uFC7LpVy+iIeIE7QsYRgdyjTddOUAZFemnbdn+kK8/Oqx2fclGE
   DV8vX+JLxLbInsElUFNuQUzVyaoAvTeJJm0pLNdDNFT5RONADUcFU4asO
   8xyBEVsvttRteJEpUVE0COxKUuVGz7AG05999TiiaP9GVXMETlUx4GiKp
   A==;
X-CSE-ConnectionGUID: 2NiQuuofRNGKahMTFvMrcw==
X-CSE-MsgGUID: bfaToOOHSKePOmd5jgZflw==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="64194256"
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="64194256"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:54:59 -0700
X-CSE-ConnectionGUID: gWSRCDqQSH+IVoBxVZe6Mg==
X-CSE-MsgGUID: TAR//cGuSLCFRfLCsb3ZiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="158616663"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO svinhufvud.fi.intel.com) ([10.245.244.244])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:54:54 -0700
Received: from svinhufvud.lan (localhost [IPv6:::1])
	by svinhufvud.fi.intel.com (Postfix) with ESMTP id 0FF2A44394;
	Fri,  4 Jul 2025 10:54:50 +0300 (EEST)
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: greybus-dev@lists.linaro.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 63/80] greybus: Remove redundant pm_runtime_mark_last_busy() calls
Date: Fri,  4 Jul 2025 10:54:49 +0300
Message-Id: <20250704075449.3221896-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
References: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
pm_runtime_mark_last_busy().

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
The cover letter of the set can be found here
<URL:https://lore.kernel.org/linux-pm/20250704075225.3212486-1-sakari.ailus@linux.intel.com>.

In brief, this patch depends on PM runtime patches adding marking the last
busy timestamp in autosuspend related functions. The patches are here, on
rc2:

        git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git \
                pm-runtime-6.17-rc1

 drivers/greybus/bundle.c    | 1 -
 drivers/greybus/interface.c | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/greybus/bundle.c b/drivers/greybus/bundle.c
index a6e1cca06172..269a82c5c757 100644
--- a/drivers/greybus/bundle.c
+++ b/drivers/greybus/bundle.c
@@ -155,7 +155,6 @@ static int gb_bundle_resume(struct device *dev)
 
 static int gb_bundle_idle(struct device *dev)
 {
-	pm_runtime_mark_last_busy(dev);
 	pm_request_autosuspend(dev);
 
 	return 0;
diff --git a/drivers/greybus/interface.c b/drivers/greybus/interface.c
index a0f3e9422721..c49fe54c16ca 100644
--- a/drivers/greybus/interface.c
+++ b/drivers/greybus/interface.c
@@ -753,7 +753,6 @@ static int gb_interface_resume(struct device *dev)
 
 static int gb_interface_runtime_idle(struct device *dev)
 {
-	pm_runtime_mark_last_busy(dev);
 	pm_request_autosuspend(dev);
 
 	return 0;
-- 
2.39.5

