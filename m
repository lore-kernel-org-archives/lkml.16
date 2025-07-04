Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 646502F0E5F
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 07:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751615700; cv=none; b=PHY2S0ieAg+8EvPu3Gc1DcjNH959d/UbYTuSclfqBaKIMaKheKaFc/Z6G1JcM307ksCgjc9NQ9u9cQaGmOv1h66PIkH9Z3PWKIXdnVj+ckbDs4wCgul7fbX4LIsheK0vp+aKkjDbrBvT9mfzjAadWS7bSwoX4vtbzd5A0h4DiKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751615700; c=relaxed/simple;
	bh=gjeDw4vIXjSrxqdxHy0Im4aZwqFHN+s2mpooAal1uHY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=M58w8QbMIOJfR0sifoFW0ly3DU4e42Kdad1U8Ke4lkiGGEHycHRCUbOd3S1/ARWvM+IKjvH9vNMt2kRc6kgZteDC1SKkcwRd82OMTMSVzGs6d9pzZGeZD7bUd6VrTlndV8V8rRk3S1Ic2WK4JnIg7rOcQZ22ImEK3AOj6TKomNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mdhw9O+Q; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mdhw9O+Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751615698; x=1783151698;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gjeDw4vIXjSrxqdxHy0Im4aZwqFHN+s2mpooAal1uHY=;
  b=Mdhw9O+QTvOT6kI/1KVlLmwcmaDn6MMxY7OfSQNFcxRqSL4IeF8SzMEH
   bMXldmwNRTIfVAlalWOfT5eYigQA3N+NJqKDBDXDDVBxRD2BFp98tljEm
   fPht/5hP556khtWyg/iyAuhzmigSG0siFhCkq2nf+m0YiBZyRyoVXYxLZ
   0hxYjMI2CsJBkVDFUZGQX+OKMe2D0F7hXQ3XsUV78CZK8Mwl9SRqDbOBe
   RewkwdD19X0wJ2tqZbInCDcBQbauSnk9h4+t70NYNWDDcWOOl2qWjznq4
   +g3yfhzIEe2S8lpEGzb5FwN1+lruBonbpofBORXKAEOrUzQ1QWENusyvt
   g==;
X-CSE-ConnectionGUID: 1VNquejeTvS5SzKREPMTPw==
X-CSE-MsgGUID: mQFuLUpGQmm0u6pGb6cvgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="64194240"
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="64194240"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:54:49 -0700
X-CSE-ConnectionGUID: /bzuSEQFSLmXBgTqlRBzJg==
X-CSE-MsgGUID: fs1mzZWtTNG62igOJzDl4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="158616625"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO svinhufvud.fi.intel.com) ([10.245.244.244])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:54:46 -0700
Received: from svinhufvud.lan (localhost [IPv6:::1])
	by svinhufvud.fi.intel.com (Postfix) with ESMTP id DD9DD44419;
	Fri,  4 Jul 2025 10:54:44 +0300 (EEST)
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 57/80] regulator: stm32-vrefbuf: Remove redundant pm_runtime_mark_last_busy() calls
Date: Fri,  4 Jul 2025 10:54:44 +0300
Message-Id: <20250704075444.3221445-1-sakari.ailus@linux.intel.com>
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

 drivers/regulator/stm32-vrefbuf.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/regulator/stm32-vrefbuf.c b/drivers/regulator/stm32-vrefbuf.c
index a85ea94f0673..9e391206f09d 100644
--- a/drivers/regulator/stm32-vrefbuf.c
+++ b/drivers/regulator/stm32-vrefbuf.c
@@ -67,7 +67,6 @@ static int stm32_vrefbuf_enable(struct regulator_dev *rdev)
 		writel_relaxed(val, priv->base + STM32_VREFBUF_CSR);
 	}
 
-	pm_runtime_mark_last_busy(priv->dev);
 	pm_runtime_put_autosuspend(priv->dev);
 
 	return ret;
@@ -87,7 +86,6 @@ static int stm32_vrefbuf_disable(struct regulator_dev *rdev)
 	val &= ~STM32_ENVR;
 	writel_relaxed(val, priv->base + STM32_VREFBUF_CSR);
 
-	pm_runtime_mark_last_busy(priv->dev);
 	pm_runtime_put_autosuspend(priv->dev);
 
 	return 0;
@@ -104,7 +102,6 @@ static int stm32_vrefbuf_is_enabled(struct regulator_dev *rdev)
 
 	ret = readl_relaxed(priv->base + STM32_VREFBUF_CSR) & STM32_ENVR;
 
-	pm_runtime_mark_last_busy(priv->dev);
 	pm_runtime_put_autosuspend(priv->dev);
 
 	return ret;
@@ -125,7 +122,6 @@ static int stm32_vrefbuf_set_voltage_sel(struct regulator_dev *rdev,
 	val = (val & ~STM32_VRS) | FIELD_PREP(STM32_VRS, sel);
 	writel_relaxed(val, priv->base + STM32_VREFBUF_CSR);
 
-	pm_runtime_mark_last_busy(priv->dev);
 	pm_runtime_put_autosuspend(priv->dev);
 
 	return 0;
@@ -144,7 +140,6 @@ static int stm32_vrefbuf_get_voltage_sel(struct regulator_dev *rdev)
 	val = readl_relaxed(priv->base + STM32_VREFBUF_CSR);
 	ret = FIELD_GET(STM32_VRS, val);
 
-	pm_runtime_mark_last_busy(priv->dev);
 	pm_runtime_put_autosuspend(priv->dev);
 
 	return ret;
@@ -218,7 +213,6 @@ static int stm32_vrefbuf_probe(struct platform_device *pdev)
 	}
 	platform_set_drvdata(pdev, rdev);
 
-	pm_runtime_mark_last_busy(&pdev->dev);
 	pm_runtime_put_autosuspend(&pdev->dev);
 
 	return 0;
-- 
2.39.5

