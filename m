Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D027221F28
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 20:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750363559; cv=none; b=i0UxERFFt838DIE6+AhLmyDb/2cvKGU+3MBKaTCcC+6VzsU69ue9olP62TsOweKNVDK1IWIiGN2Um3AxtSYR5xrkzCF0Hur7a1mClP6BIMfB48MOufh2nGWBt/RP3J7V0p1ZmqGCyoXgUUGCGZv2dxkR6rJ0mio7fpp1EvkdL4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750363559; c=relaxed/simple;
	bh=dwsBTxlM2QohXlP1ErlyMOXw37DysFBS3JLvamLR6Do=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kA2ENh9Q0iDYdGqQSPBcdpEfSwxRXj0pQPTNqTMyKWlG7tAgBs0by532J4867uSppdgbJ6lMp3C2h+zuFf1l5QLDpd5XRuvdK077wl7+GksarcDiQu2O0knvwnW3S9tSZZFu1d8FcYx/GvOoVwIAkaTQSUQW61qI6nCQDMLcJLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=U3ZaH+Oz; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="U3ZaH+Oz"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750363555;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F92lwo5VOd1tq612WPpWLZKza4VCHqS8IRTHLKoOjew=;
	b=U3ZaH+OzZC4XyFuiMwkaaxWeHokAzLwigVj+qnaoY7KwKzsbhxDlPd9M8QE9zWVgL4B7W6
	VDb90LbN9ao6Bcooq/qxZv7OXqed103e2WAOvU/aODvZ6Ud6hWDD2BRTRlwyxS5LnWfxtl
	ZCcQxoxHJdj0HISri8DPdBgTf3rrDv8=
From: Sean Anderson <sean.anderson@linux.dev>
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Michal Simek <michal.simek@amd.com>,
	Saravana Kannan <saravanak@google.com>,
	Leon Romanovsky <leon@kernel.org>,
	Dave Ertman <david.m.ertman@intel.com>,
	linux-kernel@vger.kernel.org,
	Ira Weiny <ira.weiny@intel.com>,
	linux-arm-kernel@lists.infradead.org,
	Sean Anderson <sean.anderson@linux.dev>,
	Danilo Krummrich <dakr@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>
Subject: [PATCH net 1/4] auxiliary: Allow empty id
Date: Thu, 19 Jun 2025 16:05:34 -0400
Message-Id: <20250619200537.260017-2-sean.anderson@linux.dev>
In-Reply-To: <20250619200537.260017-1-sean.anderson@linux.dev>
References: <20250619200537.260017-1-sean.anderson@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Support creating auxiliary devices with the id included as part of the
name. This allows for non-decimal ids, which may be more appropriate for
auxiliary devices created as children of memory-mapped devices. For
example, a name like "xilinx_emac.mac.802c0000" could be achieved by
setting .name to "mac.802c0000" and .id to AUXILIARY_DEVID_NONE.

Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
---

 drivers/base/auxiliary.c      | 6 +++++-
 include/linux/auxiliary_bus.h | 4 +++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/base/auxiliary.c b/drivers/base/auxiliary.c
index dba7c8e13a53..64a0d5e2eb83 100644
--- a/drivers/base/auxiliary.c
+++ b/drivers/base/auxiliary.c
@@ -331,7 +331,11 @@ int __auxiliary_device_add(struct auxiliary_device *auxdev, const char *modname)
 		return -EINVAL;
 	}
 
-	ret = dev_set_name(dev, "%s.%s.%d", modname, auxdev->name, auxdev->id);
+	if (auxdev->id == AUXILIARY_DEVID_NONE)
+		ret = dev_set_name(dev, "%s.%s", modname, auxdev->name);
+	else
+		ret = dev_set_name(dev, "%s.%s.%d", modname, auxdev->name,
+				   auxdev->id);
 	if (ret) {
 		dev_err(dev, "auxiliary device dev_set_name failed: %d\n", ret);
 		return ret;
diff --git a/include/linux/auxiliary_bus.h b/include/linux/auxiliary_bus.h
index 4086afd0cc6b..76904cf2c3dd 100644
--- a/include/linux/auxiliary_bus.h
+++ b/include/linux/auxiliary_bus.h
@@ -51,6 +51,8 @@
  * unregisters the auxiliary device.
  */
 
+#define AUXILIARY_DEVID_NONE	(-1)
+
 /**
  * struct auxiliary_device - auxiliary device object.
  * @dev: Device,
@@ -269,7 +271,7 @@ struct auxiliary_device *__devm_auxiliary_device_create(struct device *dev,
 
 #define devm_auxiliary_device_create(dev, devname, platform_data)     \
 	__devm_auxiliary_device_create(dev, KBUILD_MODNAME, devname,  \
-				       platform_data, 0)
+				       platform_data, AUXILIARY_DEVID_NONE)
 
 /**
  * module_auxiliary_driver() - Helper macro for registering an auxiliary driver
-- 
2.35.1.1320.gc452695387.dirty

