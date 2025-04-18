Received: from smtp.smtpout.orange.fr (smtp-66.smtpout.orange.fr [80.12.242.66])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1325269CFA;
	Fri, 18 Apr 2025 06:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744958988; cv=none; b=Wrba6ZEJZ6Ev+HJwJvn0h2+WwnwU67aJSJfoA0FO7JQ9ZfXz9MsG/PI6LX7KfZfsttbg8zQRp8Suinm3wH5tiMWQ3VrBTJHtVHxuWQBNEpPnYZJikz0rx9ntkoM4b63NoFH6IozeizYuccQu0s1gPhbU507ixujry0VzXvHmSSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744958988; c=relaxed/simple;
	bh=hInIkt61XHg1R+n8dOF5iCEGHj/EdNamGsRQfLOXhDo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KgBveI/vTClEAePlFRqJt5Y33XP4+O4RPDbs25qcmH+0edm008n49lvRfD71I435LDZGYy3AkunPKRO4R/mvkKcWxWEH726jhNn3d+FzbrfE8M9EPrNuV3lHfCJlslqJvoga7q0A+9fwbUbH/I/2CouPxqIPXdOSvgz8CpIM9/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=kVCqLO7J; arc=none smtp.client-ip=80.12.242.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="kVCqLO7J"
Received: from localhost.localdomain ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id 5fWXuGf243t2y5fWauMqHj; Fri, 18 Apr 2025 08:48:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1744958915;
	bh=mUzUYESnOtbixZ8+Khj60v3lZVxQS/Ceo6x8BU3JvB8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=kVCqLO7Jh5F/y2eNTmtidrrI/CkZmZp13K/rFMd0m0VyIOL68hYqyRZoWRyhwdMOt
	 WA0xOB5GVBqyGo7Uz+FyN8yHaN7b5svSZ/VbVdiRr6VN1uUFtKwoW8aNiN8txg63Ra
	 Ufd2qDd/Vy8FzMm6MbRlTvxJ0nJmZpDCgikcpYIRG75cS3boa1uD4l7Hy+RBI5QR3N
	 jXLfSbtDW4jIWu7j2E3mipGgu95d0rJDPpkTsoD3Yi14Nwux/YIXlUDm1bUTGhi8YO
	 PndvrzZPbC9A977Crh37M3298rOKHVuQvPHqNT+YepWT6ZelmFKZhr9KRs6xQQN83Y
	 G5Q7XulKH4lEA==
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Fri, 18 Apr 2025 08:48:35 +0200
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Sam Ravnborg <sam@ravnborg.org>,
	Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/bridge: lt9611uxc: Fix an error handling path in lt9611uxc_probe()
Date: Fri, 18 Apr 2025 08:48:16 +0200
Message-ID: <f167608e392c6b4d7d7f6e45e3c21878feb60cbd.1744958833.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If lt9611uxc_audio_init() fails, some resources still need to be released
before returning the error code.

Use the existing error handling path.

Fixes: 0cbbd5b1a012 ("drm: bridge: add support for lontium LT9611UXC bridge")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Compile tested only.

Changes in v2:
  - Add R-b tag
  - Sync with latest -next

v1: https://lore.kernel.org/all/e09122722190d052cee792a9246c274510f3b928.1710618660.git.christophe.jaillet@wanadoo.fr/
(this is ~1 year old, but was never applied)
---
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
index f4c3ff1fdc69..f6e714feeea5 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
@@ -880,7 +880,11 @@ static int lt9611uxc_probe(struct i2c_client *client)
 		}
 	}
 
-	return lt9611uxc_audio_init(dev, lt9611uxc);
+	ret = lt9611uxc_audio_init(dev, lt9611uxc);
+	if (ret)
+		goto err_remove_bridge;
+
+	return 0;
 
 err_remove_bridge:
 	free_irq(client->irq, lt9611uxc);
-- 
2.49.0

