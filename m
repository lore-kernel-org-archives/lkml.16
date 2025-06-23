Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71838231840
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 08:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750668661; cv=none; b=G1X3/OZZY/kjx6SLgQl0ARyi+0HXtDKHjZZBjxHIkuXrx3bSN+xiQVQLZqww4Mnuimyo1IPJJ7NeDsnvu5+p61jX8hikQ4yVULHUWWtGTt6QjSTHrZgmYYjDTHj24eLNKMgaeUtnK3H/tN13R9dmLompxrwP9Fjv/2ITHbRfpOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750668661; c=relaxed/simple;
	bh=03/CqbBBRYZh+o/TBOQRC+HPvVJ9MFfeXziT++jGwQQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OB3AK8OuFolttgIPB9yZHs9HQVmT7g6xaz3XC92GCH+E+52eJPSArT34xg96grJjYKtW1OaCCY0DjUy0/ljwHgH1BrWRVp6ySYKwdk0gHyXa/HvJBL5lZkbWDtbXPuMvZGCjvGHliWrVBmGuji+10CWnKcOTIU8babBDrvwjChM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ByFQ4r9U; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ByFQ4r9U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29434C4CEED;
	Mon, 23 Jun 2025 08:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750668661;
	bh=03/CqbBBRYZh+o/TBOQRC+HPvVJ9MFfeXziT++jGwQQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ByFQ4r9Uxl+OLVn9qZ4PrmxbnQxAcrYthjFn/0zvMhmLjXtFiZ+mVe+iu1lB8f93g
	 UkbFrnXkekcdr4QJQZmQG9PyXiJMbcgtHYcZhuQldBwLukm0RnJS8Rcz3OC/o9s+EH
	 kux4wucD4TU+CBg02GKeA6LlEllNI4eEC4qD/tpT59P+2JQTh03i7w8UME/ata6tiZ
	 5c5NcGuhmx0iRTxPd7YKA1mDL7uM0/mixfOpYHGPBj55epHYj/t2QnNj172OuIpo+w
	 57lxHwTGiI7TL9WBXMsQBz3uylyXMlTbWPZ0msf4YWggf7CwLOHx7Nzvu0FTrKBCix
	 ABhqi1IQYGF6w==
From: Hans de Goede <hansg@kernel.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Alexander Usyskin <alexander.usyskin@intel.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 02/10] mei: vsc: Don't re-init VSC from mei_vsc_hw_reset() on stop
Date: Mon, 23 Jun 2025 10:50:44 +0200
Message-ID: <20250623085052.12347-3-hansg@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250623085052.12347-1-hansg@kernel.org>
References: <20250623085052.12347-1-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mei_vsc_hw_reset() gets called from mei_start() and mei_stop() in
the latter case we do not need to re-init the VSC by calling vsc_tp_init().

mei_stop() only happens on shutdown and driver unbind. On shutdown we
don't need to load + boot the firmware and if the driver later is
bound to the device again then mei_start() will do another reset.

The intr_enable flag is true when called from mei_start() and false on
mei_stop(). Skip vsc_tp_init() when intr_enable is false.

This avoids unnecessarily uploading the firmware, which takes 11 seconds.
This change reduces the poweroff/reboot time by 11 seconds.

Fixes: 386a766c4169 ("mei: Add MEI hardware support for IVSC device")
Signed-off-by: Hans de Goede <hansg@kernel.org>
---
 drivers/misc/mei/platform-vsc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/misc/mei/platform-vsc.c b/drivers/misc/mei/platform-vsc.c
index 435760b1e86f..1ac85f0251c5 100644
--- a/drivers/misc/mei/platform-vsc.c
+++ b/drivers/misc/mei/platform-vsc.c
@@ -256,6 +256,9 @@ static int mei_vsc_hw_reset(struct mei_device *mei_dev, bool intr_enable)
 
 	vsc_tp_reset(hw->tp);
 
+	if (!intr_enable)
+		return 0;
+
 	return vsc_tp_init(hw->tp, mei_dev->dev);
 }
 
-- 
2.49.0

