Received: from smtp.smtpout.orange.fr (smtp-77.smtpout.orange.fr [80.12.242.77])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA01E282F1;
	Sun, 25 May 2025 12:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748177277; cv=none; b=TssgCutxukK797K8SjL93V0beAACRfKsYWe2a8BFUGqPWz9SeYsp8HLya9bwK2Ppke3/J4xRNM7XoyVoF8lP0sk2AsXLiY1Dw503R2YKW8XqwseP/0Yib9iMExJ0R7K+uPYfrxaQ4HN/0kt6IDBB2BXVWeTli+TzeALiaK7R0io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748177277; c=relaxed/simple;
	bh=1vQot9/YzyhwfQ5rlIMydUg7976pe3VNp8Zhz04gnOw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RPnwncjCtl42XdJyWReEYJ9leUUXt6gbuDhUeoqGODV+C3YUo8PJoMI3Fs+BctTkJjY7Q9i1lZRp+IPY0L8BO4q5NytxEpQMSPx7Cs2HJPUOXYGg5e2/CLbmumhiPLVCKzp8rLmGW63OpzjcVDTL8lDLxbS2j6XLX2HAAc8hQdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=drX6Cs4C; arc=none smtp.client-ip=80.12.242.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="drX6Cs4C"
Received: from localhost.localdomain
 ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPA
	id JAlVuw6JcVLIhJAlVudBOf; Sun, 25 May 2025 14:47:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1748177267;
	bh=t4ZAoOZ0xwqjfOADCYoIsABzXUONI4tlDgJj0yx1w3M=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=drX6Cs4C2NPnMavevuPimqZReakB9GyqqQInLlcBtzqc++Z+Qe4L/69xpxoPICzVc
	 Fjbsn5UuN/9AOGIwzI1n4oKM6THLAZxxSgh5vwWlmyswHNeydiqFcelo7/DuTR22hA
	 Tnk8wvWOQ9AUZE/6koGplCPOrMPkQE2QEmfMv9t8PnxDnFBzCQ6JK9tBGCDZfbYz7o
	 cw8FN3XB4udwqEJnI60mvF6DL8/xJoypeXSXSD5KOpb+lA1RfMIr9+DTF0mQkMGTmp
	 RJ3vH6QjkdLl1se7qB7KGYnlkog1H/GVjNLVrGKy9/9Rzde8yJDTfOUlxehrqrkCN6
	 phyd0OS8pdN2Q==
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 25 May 2025 14:47:47 +0200
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Peter Kaestle <peter@piie.net>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH] thermal/drivers/acerhdf: Constify struct thermal_zone_device_ops
Date: Sun, 25 May 2025 14:47:35 +0200
Message-ID: <e502fadf2c6b24fc4ec3a7880533f7ca68429720.1748177235.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'struct thermal_zone_device_ops' could be left unmodified in this driver.

Constifying this structure moves some data to a read-only section, so
increases overall security, especially when the structure holds some
function pointers.

While at it, also constify a struct thermal_zone_params.

On a x86_64, with allmodconfig:
Before:
======
   text	   data	    bss	    dec	    hex	filename
  26422	  12584	    512	  39518	   9a5e	drivers/platform/x86/acerhdf.o

After:
=====
   text	   data	    bss	    dec	    hex	filename
  26646	  12360	    512	  39518	   9a5e	drivers/platform/x86/acerhdf.o

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only
---
 drivers/platform/x86/acerhdf.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/acerhdf.c b/drivers/platform/x86/acerhdf.c
index 4c3bb68e8fe4..5ce5ad3efe69 100644
--- a/drivers/platform/x86/acerhdf.c
+++ b/drivers/platform/x86/acerhdf.c
@@ -271,7 +271,7 @@ static const struct bios_settings bios_tbl[] __initconst = {
  * this struct is used to instruct thermal layer to use bang_bang instead of
  * default governor for acerhdf
  */
-static struct thermal_zone_params acerhdf_zone_params = {
+static const struct thermal_zone_params acerhdf_zone_params = {
 	.governor_name = "bang_bang",
 };
 
@@ -426,7 +426,7 @@ static int acerhdf_get_crit_temp(struct thermal_zone_device *thermal,
 }
 
 /* bind callback functions to thermalzone */
-static struct thermal_zone_device_ops acerhdf_dev_ops = {
+static const struct thermal_zone_device_ops acerhdf_dev_ops = {
 	.should_bind = acerhdf_should_bind,
 	.get_temp = acerhdf_get_ec_temp,
 	.change_mode = acerhdf_change_mode,
-- 
2.49.0

