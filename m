Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89379295510;
	Tue, 29 Apr 2025 23:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745970711; cv=none; b=d5Ws04XeEr2Ci9QLixF1+EseLmZaMrByvItq3/zwBGdIMElv3pBNqodgbS+bYZ54pFd1bqZoKp6NtiEwAM2JyIhJY8uzR7PZtadHLUv6kFu1EinDCFMiAHKVpvRnG5qxAWb/2KuExP613bYBbQ9Iu6NWZx+EuWJS8VG6x87RY7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745970711; c=relaxed/simple;
	bh=GbS9CZX1mMMI7dxOMexyya/aGiRYAN65MZ2IDwkM7sw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fm7id8MZOewireEEZOMIwLypkzdTtT6anCuLBfRbhcswOrh3rBn9ppcIAAGKGNBfc9q75WAR6Ds0QCHl06XUCyl2dVYuc7xg7SU+malizNNAkCD9ltuyCe7GKSge56BVGiNQLxFqX2j4tnOQZu9fI55nQ7JdjEp1tmG+JbrN5uU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NMfijahR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NMfijahR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03841C4CEEB;
	Tue, 29 Apr 2025 23:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745970711;
	bh=GbS9CZX1mMMI7dxOMexyya/aGiRYAN65MZ2IDwkM7sw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NMfijahR8y8kGptZcZ6bX/sAJLcu1PbsTksnso3n5Ed7nuznMGdDYyqNa2Tr10Hg/
	 sme92rQcAI/CitrHhKg1U72LVlvK/uZyfWFSEg5huSNFtl0Xpl6vvQvoDBbpZ6NFAu
	 fM19hH6SqdPe27YhnuQYQSjGHBMbq8sVK5pu8TwEADyjEb84EGifcD9K4beBIpEqwo
	 kNxhkiyde9WJi3P3GI4TVypdeWlIhet4kh21aNIJ+y8XBhre1FEDbXIEbgbDIKRAsL
	 1y6xUgznI3fIuyUmF2zGJKUHjpHT+gW4npsorSxsKS3HXuDTmCyYcF9JxOpHKdLYEl
	 5h/mxW6QQcXLg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	rafael@kernel.org,
	dakr@kernel.org
Subject: [PATCH AUTOSEL 6.12 14/37] driver core: introduce device_set_driver() helper
Date: Tue, 29 Apr 2025 19:50:59 -0400
Message-Id: <20250429235122.537321-14-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250429235122.537321-1-sashal@kernel.org>
References: <20250429235122.537321-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.25
Content-Transfer-Encoding: 8bit

From: Dmitry Torokhov <dmitry.torokhov@gmail.com>

[ Upstream commit 04d3e5461c1f5cf8eec964ab64948ebed826e95e ]

In preparation to closing a race when reading driver pointer in
dev_uevent() code, instead of setting device->driver pointer directly
introduce device_set_driver() helper.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Reviewed-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
Link: https://lore.kernel.org/r/20250311052417.1846985-2-dmitry.torokhov@gmail.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/base/base.h | 6 ++++++
 drivers/base/core.c | 2 +-
 drivers/base/dd.c   | 7 +++----
 3 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/base/base.h b/drivers/base/base.h
index 8cf04a557bdb0..b1f20ee5dc298 100644
--- a/drivers/base/base.h
+++ b/drivers/base/base.h
@@ -179,6 +179,12 @@ int driver_add_groups(const struct device_driver *drv, const struct attribute_gr
 void driver_remove_groups(const struct device_driver *drv, const struct attribute_group **groups);
 void device_driver_detach(struct device *dev);
 
+static inline void device_set_driver(struct device *dev, const struct device_driver *drv)
+{
+	// FIXME - this cast should not be needed "soon"
+	dev->driver = (struct device_driver *)drv;
+}
+
 int devres_release_all(struct device *dev);
 void device_block_probing(void);
 void device_unblock_probing(void);
diff --git a/drivers/base/core.c b/drivers/base/core.c
index ec0ef6a0de942..97f44f0f3b4b2 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -3700,7 +3700,7 @@ int device_add(struct device *dev)
 	device_pm_remove(dev);
 	dpm_sysfs_remove(dev);
  DPMError:
-	dev->driver = NULL;
+	device_set_driver(dev, NULL);
 	bus_remove_device(dev);
  BusError:
 	device_remove_attrs(dev);
diff --git a/drivers/base/dd.c b/drivers/base/dd.c
index f0e4b4aba885c..b526e0e0f52d7 100644
--- a/drivers/base/dd.c
+++ b/drivers/base/dd.c
@@ -550,7 +550,7 @@ static void device_unbind_cleanup(struct device *dev)
 	arch_teardown_dma_ops(dev);
 	kfree(dev->dma_range_map);
 	dev->dma_range_map = NULL;
-	dev->driver = NULL;
+	device_set_driver(dev, NULL);
 	dev_set_drvdata(dev, NULL);
 	if (dev->pm_domain && dev->pm_domain->dismiss)
 		dev->pm_domain->dismiss(dev);
@@ -629,8 +629,7 @@ static int really_probe(struct device *dev, const struct device_driver *drv)
 	}
 
 re_probe:
-	// FIXME - this cast should not be needed "soon"
-	dev->driver = (struct device_driver *)drv;
+	device_set_driver(dev, drv);
 
 	/* If using pinctrl, bind pins now before probing */
 	ret = pinctrl_bind_pins(dev);
@@ -1014,7 +1013,7 @@ static int __device_attach(struct device *dev, bool allow_async)
 		if (ret == 0)
 			ret = 1;
 		else {
-			dev->driver = NULL;
+			device_set_driver(dev, NULL);
 			ret = 0;
 		}
 	} else {
-- 
2.39.5

