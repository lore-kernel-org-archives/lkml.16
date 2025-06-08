Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 447658BEC
	for <linux-kernel@vger.kernel.org>; Sun,  8 Jun 2025 17:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749404566; cv=none; b=VqBnL93joK7+i3lqVj75oeRkmq/10czjyaDJq2GYo4CJt+ZB8dnndlYm8xXAxKij9mbJXH6I+XH0u+RHzRgO6a+hTrS9Zx7uFsxtXKlGkzUigJzIaX0FrampNx0Ti67yQ7W9frKYNNu0gPxYJJSv/qXa11/tQUzTlo8lhAP0IsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749404566; c=relaxed/simple;
	bh=xWhyC3WG8AsFwE2Gvf8cfSmK25lZwLYI0n25Uu1fifs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fRY+jwKvYEFHgFkrDHnU+jipkfvmmwDHbzSuKeEwyxbDyxbbuy/7pqanPc3jjTVEUSEfVqgSKhK3frT6yyvM4OszHCD/TLi4j576wTeYO0+UoPJFSvZ2m5yZXx9kZncWv8UWrdEk9fcJCqyd9Nj9U81qDGKGPVEvOqaDdIf3E+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=XKS8jhZT; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="XKS8jhZT"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=uQrr9+ziq2Ag/Su5s1v4GfCl6IT6CAMwFN43MphlDhw=; b=XKS8jhZTeNodgfuk
	9AoFzszaTnnJVTTfjPtaonJEcbvzTg94jS/pOD+rh01l70LQyAbweT2g5QJxOJCtpBJinWPZ6dB2n
	wvRINBfLS6Z2vkgxiHLNm2Z3q18TuQ4TnHtS7qVhRYliwA1fxL448hJpkw3GaOQJLkwH9BCpzRrF3
	An4/NVK2Fzmc/gAYrKdsUVLvh2iaTydmDcQDYBLwYBIX4H4oXxBPEHGqLlKc54QgqEHoSCf0STXar
	eFzOL0DIc6p+DOC6CsyXXlUVXSv4ei/6hcZ4KNQOcT21oGP5/IinKuPGSN4oQpg7vW97mPt7Dipat
	yvlnSnDOKKda2Tm5uw==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1uOK2W-008HRa-28;
	Sun, 08 Jun 2025 17:42:36 +0000
From: linux@treblig.org
To: akpm@linux-foundation.org,
	dmitry.osipenko@collabora.com
Cc: linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH] reboot: Remove unused unregister_platform_power_off
Date: Sun,  8 Jun 2025 18:42:35 +0100
Message-ID: <20250608174235.116424-1-linux@treblig.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

unregister_platform_power_off() was added as part of 2022's
commit fb61375ecfba ("kernel/reboot: Add register_platform_power_off()")
but has remained unused.

Remove it.

Note it's a pair with register_platform_power_off() so
seems symmetric; however, I think platforms are chosen
and then stay that way for the boot - so don't
get unregistered.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 include/linux/reboot.h |  1 -
 kernel/reboot.c        | 16 ----------------
 2 files changed, 17 deletions(-)

diff --git a/include/linux/reboot.h b/include/linux/reboot.h
index aa08c3bbbf59..82c0a373c58c 100644
--- a/include/linux/reboot.h
+++ b/include/linux/reboot.h
@@ -161,7 +161,6 @@ int devm_register_restart_handler(struct device *dev,
 				  void *cb_data);
 
 int register_platform_power_off(void (*power_off)(void));
-void unregister_platform_power_off(void (*power_off)(void));
 
 /*
  * Architecture independent implemenations of sys_reboot commands.
diff --git a/kernel/reboot.c b/kernel/reboot.c
index ec087827c85c..515716afc101 100644
--- a/kernel/reboot.c
+++ b/kernel/reboot.c
@@ -626,22 +626,6 @@ int register_platform_power_off(void (*power_off)(void))
 }
 EXPORT_SYMBOL_GPL(register_platform_power_off);
 
-/**
- *	unregister_platform_power_off - Unregister platform-level power-off callback
- *	@power_off: Power-off callback
- *
- *	Unregisters previously registered platform power-off callback.
- */
-void unregister_platform_power_off(void (*power_off)(void))
-{
-	if (platform_power_off_handler &&
-	    platform_power_off_handler->cb_data == power_off) {
-		unregister_sys_off_handler(platform_power_off_handler);
-		platform_power_off_handler = NULL;
-	}
-}
-EXPORT_SYMBOL_GPL(unregister_platform_power_off);
-
 static int legacy_pm_power_off(struct sys_off_data *data)
 {
 	if (pm_power_off)
-- 
2.49.0

