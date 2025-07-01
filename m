Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE25F23185E
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 11:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751367979; cv=none; b=VY/e2bkFSKtYLDZkReFUaWyLBvZ0K+FUYU9KK6V0idJIeTZeG04l0o738qCa/EmF8yGG+1+BwFO3juW9TRO++UshDJNyvlaD9Z1D6qcb13FCH52DaqMfZPQKqsVmglauJg+t2djF+UfNNgsLlR5XfQPxdcSBEudcQ+8lVv905FU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751367979; c=relaxed/simple;
	bh=CWIRlpgPJRqEG5Un9ajpiNt3bGaNLmXXcKnSn4AJta4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VQma3xOrg/2LrDJTp7TIfX1orUtsgtpwdl3p+uUGmiJ7wqzUMG5Rwz6SH654c9akKBakcR/OjY5m8piHw0mQPMX8smJinxS+9yk30xpeVNaBCzV+qKPJwIoUkSDZjZdq9h58j6wz1XF1PZvAwdLzOHlzUBMxcsK9QbagKfabP0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=FtnDwuQw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="FtnDwuQw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B799CC4CEEE;
	Tue,  1 Jul 2025 11:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1751367979;
	bh=CWIRlpgPJRqEG5Un9ajpiNt3bGaNLmXXcKnSn4AJta4=;
	h=From:To:Cc:Subject:Date:From;
	b=FtnDwuQwkMxAT9f1eJ/rE/Zdvsg+3Jr/kyuJ41TpUXVwCDoVvaVig0w+DrNvMWrJt
	 3wVy99Gh7bdfBeNe3uZFBvynE0f1SjF1v86R67C9pBmHaV9gATcL4LG4m+Oj7OMm+p
	 QJlxa6B58hMUyfiot6109412KaKn7qpkXDjluNyQ=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	greybus-dev@lists.linaro.org
Subject: [PATCH v2] staging: greybus: gbphy: fix up const issue with the match callback
Date: Tue,  1 Jul 2025 13:06:16 +0200
Message-ID: <2025070115-reoccupy-showy-e2ad@gregkh>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1745; i=gregkh@linuxfoundation.org; h=from:subject:message-id; bh=CWIRlpgPJRqEG5Un9ajpiNt3bGaNLmXXcKnSn4AJta4=; b=owGbwMvMwCRo6H6F97bub03G02pJDBnJB9Vfrck+sH3dpot/T2hazL8Vr8CbVVG/V82noZSnR 97PYZNBRywLgyATg6yYIsuXbTxH91ccUvQytD0NM4eVCWQIAxenAEzEx5xhfu3pzcpBjwXatbak 5gmkC1wyZnq/g2GuzOvAmA23z02+5FMUPFdxt3HORw0TAA==
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit

gbphy_dev_match_id() should be taking a const pointer, as the pointer
passed to it from the container_of() call was const to start with (it
was accidentally cast away with the call.)  Fix this all up by correctly
marking the pointer types.

Cc: Johan Hovold <johan@kernel.org>
Cc: Alex Elder <elder@kernel.org>
Cc: greybus-dev@lists.linaro.org
Fixes: d69d80484598 ("driver core: have match() callback in struct bus_type take a const *")
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
v2: - add Fixes: line as pointed out by Johan
    - don't make gbphy_dev const, it's not needed, as pointed out by
      Johan

 drivers/staging/greybus/gbphy.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/greybus/gbphy.c b/drivers/staging/greybus/gbphy.c
index 6adcad286633..60cf09a302a7 100644
--- a/drivers/staging/greybus/gbphy.c
+++ b/drivers/staging/greybus/gbphy.c
@@ -102,8 +102,8 @@ static int gbphy_dev_uevent(const struct device *dev, struct kobj_uevent_env *en
 }
 
 static const struct gbphy_device_id *
-gbphy_dev_match_id(struct gbphy_device *gbphy_dev,
-		   struct gbphy_driver *gbphy_drv)
+gbphy_dev_match_id(const struct gbphy_device *gbphy_dev,
+		   const struct gbphy_driver *gbphy_drv)
 {
 	const struct gbphy_device_id *id = gbphy_drv->id_table;
 
@@ -119,7 +119,7 @@ gbphy_dev_match_id(struct gbphy_device *gbphy_dev,
 
 static int gbphy_dev_match(struct device *dev, const struct device_driver *drv)
 {
-	struct gbphy_driver *gbphy_drv = to_gbphy_driver(drv);
+	const struct gbphy_driver *gbphy_drv = to_gbphy_driver(drv);
 	struct gbphy_device *gbphy_dev = to_gbphy_dev(dev);
 	const struct gbphy_device_id *id;
 
-- 
2.50.0

