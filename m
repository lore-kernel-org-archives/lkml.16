Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 415A623CEFF
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 15:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747064485; cv=none; b=AWKB9RUsUkTAP3mUv1RhAiI6USqtANP1HFTU0owttJLhkVqksOPgTxuwo3y5oKA/lWU15huCjdKzHJieFXIFbOpB2rXNmPGcilyzblxLIl3dub2sq8RUuo/OUfL1n9bAzIbQ7nADo5Vw7PyJZ3/Ly0IJk7k90USYO7sZJy91tKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747064485; c=relaxed/simple;
	bh=t4ObW6VRwmP3xQ9ZzCEL6qfciNiAzWKyqtNuoGlCcyE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PsL6ihqX1DvGutaPzhTCb1EVze7PqSZcd+ongVTJOJA6dBQ3ennhFzQJvuNy1XwRgq9TJhftyZDEoK2SgAGlAuqHaL2w7SV/wl5Ireu1ch0ALdKEKhZCtVaMKPKaV0BhFUf2aDPybSSmbp6s5JcYjIBvOy0nHNo/DkVSgvwDT5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 729F21F60;
	Mon, 12 May 2025 08:41:12 -0700 (PDT)
Received: from e132581.cambridge.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 136433F63F;
	Mon, 12 May 2025 08:41:21 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Mao Jinlong <quic_jinlmao@quicinc.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Leo Yan <leo.yan@arm.com>
Subject: [PATCH v1 3/5] coresight: Explicitly use the parent device handler
Date: Mon, 12 May 2025 16:41:06 +0100
Message-Id: <20250512154108.23920-4-leo.yan@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250512154108.23920-1-leo.yan@arm.com>
References: <20250512154108.23920-1-leo.yan@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A CoreSight device is present on the CoreSight bus, and its device node
in the DT binding is assigned as the parent device.  Comments are added
to document this relationship.

The code is refined to explicitly use the parent device handle, making
it more readable and clearly indicating which device handle is being
used.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 3eacdcf638df..4f51ce152ac7 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -1313,9 +1313,13 @@ struct coresight_device *coresight_register(struct coresight_desc *desc)
 	csdev->access = desc->access;
 	csdev->orphan = true;
 
+	/*
+	 * 'csdev->dev' is a device present on the CoreSight bus. The device
+	 * node in the device tree is assigned as the parent device.
+	 */
+	csdev->dev.parent = desc->dev;
 	csdev->dev.type = &coresight_dev_type[desc->type];
 	csdev->dev.groups = desc->groups;
-	csdev->dev.parent = desc->dev;
 	csdev->dev.release = coresight_device_release;
 	csdev->dev.bus = &coresight_bustype;
 
@@ -1334,7 +1338,7 @@ struct coresight_device *coresight_register(struct coresight_desc *desc)
 	 * Hold the reference to our parent device. This will be
 	 * dropped only in coresight_device_release().
 	 */
-	csdev->dev.fwnode = fwnode_handle_get(dev_fwnode(desc->dev));
+	csdev->dev.fwnode = fwnode_handle_get(dev_fwnode(csdev->dev.parent));
 	dev_set_name(&csdev->dev, "%s", desc->name);
 
 	/*
@@ -1393,7 +1397,7 @@ struct coresight_device *coresight_register(struct coresight_desc *desc)
 
 err_out:
 	/* Cleanup the connection information */
-	coresight_release_platform_data(NULL, desc->dev, desc->pdata);
+	coresight_release_platform_data(NULL, csdev->dev.parent, desc->pdata);
 	return ERR_PTR(ret);
 }
 EXPORT_SYMBOL_GPL(coresight_register);
-- 
2.34.1

