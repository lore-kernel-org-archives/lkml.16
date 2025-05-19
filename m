Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E846926A1B1
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 13:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747661633; cv=none; b=uHTJb84kf+rKxmkMCa3ioSouxNnExtDSDdE76bLLPyiNYeLvw/zGUvrK4apxF+73cRUEEkrN6WRWhY3KXthnYXrx4YsWwcqYEZf6j7vZ86OJyROGI1cOjNNWeZfwib/j6XYlrMyaK2zii0asdACIACbTECT1BDepQx08lRyNzYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747661633; c=relaxed/simple;
	bh=NZYT7Njq17fWYjY0NP0+YaRVjRNL5pkH6vBEdJFJE0I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GCJX1cFsSdUBnilPMlVQlg0WV17PNv58il7ug0fEAYbamf5DYr4e3Hq+BqfQz/PVK2IWROTOmgeqZdgOq2to2E168sXI1k1hXKmbKKw6RyCRGAnKJ15X8KbTDlKbxZPACllfnwCVSUck4ews7Gonvj5f1QmXtIHTkatsQM36g78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BvMMk+AX; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BvMMk+AX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747661632; x=1779197632;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=NZYT7Njq17fWYjY0NP0+YaRVjRNL5pkH6vBEdJFJE0I=;
  b=BvMMk+AXTO+MIW5Qw1k6yCsOIuD36AmcFwgnX3W7j4MqAVYF0SWjwXLS
   VCh+ngtG1R6vsa+VizuLcPSgSds7n/IxKYp0rThkQgNfAONtC49uqFlNa
   gqgqAtgTnvbHinYky8hePx+RhcIi0OFyPkqwLa5g4lmDgmoynfbMY0i4y
   md2QS/6a0RerREUvS3FpMd4oYqylRBrVRRQ+3O9PR1X6kqTERxoUxzubD
   gdJvCo3jJNTMxMlZsbE2Uwtmv6ueAYRECqCx7DXg4NM5RoAus7qCJt2ok
   5x9JyqAobwi/xN4SuqV1tEPomMatnk/MhMVp25lnxcNfF7oiF0E0SXxgs
   Q==;
X-CSE-ConnectionGUID: y3XRopkWSIyEzZ8nTpxvfA==
X-CSE-MsgGUID: H2YpsXW1RiKscnKoT+XJLQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="49699749"
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; 
   d="scan'208";a="49699749"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 06:33:51 -0700
X-CSE-ConnectionGUID: VWCidQf0QYCHPMwfd+W9fw==
X-CSE-MsgGUID: EnzbFS6pR+KtxAQgB7QBdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; 
   d="scan'208";a="140388293"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa009.fm.intel.com with ESMTP; 19 May 2025 06:33:48 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id DFFD1256; Mon, 19 May 2025 16:33:46 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Abhishek Tamboli <abhishektamboli9@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Subject: [PATCH v1 1/1] drm/panel: ili9341: Remove unused member from struct ili9341
Date: Mon, 19 May 2025 16:33:45 +0300
Message-ID: <20250519133345.257138-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

struct device *dev from struct ili9341 is not used anywhere, remove it.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpu/drm/panel/panel-ilitek-ili9341.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9341.c b/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
index ff39f5dd4097..2b5bd83933e3 100644
--- a/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
@@ -173,7 +173,6 @@ struct ili9341_config {
 };
 
 struct ili9341 {
-	struct device *dev;
 	const struct ili9341_config *conf;
 	struct drm_panel panel;
 	struct gpio_desc *reset_gpio;
-- 
2.47.2

