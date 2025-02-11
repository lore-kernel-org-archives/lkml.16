Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com [91.218.175.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96B8E194C6A
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 10:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739270770; cv=none; b=LyWoHyXQU702LcgQ5+XuZ5VB2DCeIhCp6poPap3gx0L36Dj37nlGUtyyVIYfe/TBuTwy+BfKPrLAIb6lyphKxRyUeksp9ER9WiQpfr/Zj6egnSd/92mYGznDNV0oPWOregRrz5MMXYklZQgOZrZTiTKDNo/x77TWNk0G9FS672g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739270770; c=relaxed/simple;
	bh=PKhgCI0Zy0bjDtG6fmMXd/y+VHyTFHTVxbURGIl+GJg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AYGboCdxiIQlO9l2/uglEzvz4H8tz+5wHJZpNuSUrmTibhdXWbRmfRkt5zmlVIxqzcoXCi8UByYuhfkR7yXEI+cAb72AHuwa1L/VJbam+WWQpZbjdaWOWuZNhQbcUI6/dlb/ALl7YKm0Kdo9tI0QobdpXCos99F7iPVojBL+SWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=frEap/S9; arc=none smtp.client-ip=91.218.175.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="frEap/S9"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1739270751;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=rjgh0NHIE24t3tM5YBjaxn3uiX5S8lp37xeGpZmhvUY=;
	b=frEap/S9qKMVVv7cClslXsAh7Itfk/OND9x/ftHtv5rlIB5zt0R1hXYMD5aDcqaaEPS0WR
	hIKw2E/9pAE7K/NzlAz/6s7DfpB8sZ9zc6hNbY4/7mPxb540Q4EpgZEJB8LSNb51EnjfBt
	9vij7ycKiRvSnwyFSMe4X/+JYfxolu8=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RESEND PATCH] ACPI: video: Use str_yes_no() helper in acpi_video_bus_add()
Date: Tue, 11 Feb 2025 11:45:32 +0100
Message-ID: <20250211104532.699124-1-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Remove hard-coded strings by using the str_yes_no() helper function.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/acpi/acpi_video.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/acpi/acpi_video.c b/drivers/acpi/acpi_video.c
index a972831dbd66..efdadc74e3f4 100644
--- a/drivers/acpi/acpi_video.c
+++ b/drivers/acpi/acpi_video.c
@@ -27,6 +27,7 @@
 #include <linux/acpi.h>
 #include <acpi/video.h>
 #include <linux/uaccess.h>
+#include <linux/string_choices.h>
 
 #define ACPI_VIDEO_BUS_NAME		"Video Bus"
 #define ACPI_VIDEO_DEVICE_NAME		"Video Device"
@@ -2039,9 +2040,9 @@ static int acpi_video_bus_add(struct acpi_device *device)
 
 	pr_info("%s [%s] (multi-head: %s  rom: %s  post: %s)\n",
 	       ACPI_VIDEO_DEVICE_NAME, acpi_device_bid(device),
-	       video->flags.multihead ? "yes" : "no",
-	       video->flags.rom ? "yes" : "no",
-	       video->flags.post ? "yes" : "no");
+	       str_yes_no(video->flags.multihead),
+	       str_yes_no(video->flags.rom),
+	       str_yes_no(video->flags.post));
 	mutex_lock(&video_list_lock);
 	list_add_tail(&video->entry, &video_bus_head);
 	mutex_unlock(&video_list_lock);
-- 
2.48.1

