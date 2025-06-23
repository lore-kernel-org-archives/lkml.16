Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6859238144
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 08:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750668672; cv=none; b=Db9OKuVpBEvFtruRthKjLhiDrrwFjZSWmbVBtB0q8eTbGdWsQ1p2r4H0+p7yb/bfOkCrwd7lSXkr0NBwDdz9NN+1cWNyqA3Cw3c4eHYcm2ve6e9c5rknKIqR0o+YURB+42qmU/kxf3K9PYb8dOGPmxbHngmB0WP1jeQUBbR/N0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750668672; c=relaxed/simple;
	bh=7YK8h6/s6FeL2OpH/wceg6nUbtWI80YOQxmlwFUPtFQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZE0pC49PSnvnbNXYZWsuVyXNenEQbG/JDPQUPrXxQu2zl0nyiZM8QESP+ZlNnjplpSwxhOppKiu4EHR7mQEMFCPPm2uOteVs0EqHHx4H42t0fLGF5As049Q0cH9mHECXu2hIjjnKsn7kvzCZolOIBMMjG9k4QwiXE5YgInLU+T4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P7LSti+W; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P7LSti+W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCC08C4CEF1;
	Mon, 23 Jun 2025 08:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750668672;
	bh=7YK8h6/s6FeL2OpH/wceg6nUbtWI80YOQxmlwFUPtFQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=P7LSti+Wyvf3rWuAW4qA+iDZSDkKRFZ3dl6zRQ1SVP5fYK3mgu7netaIUUD6JtTpl
	 +OrqFtxIRFbXVQGRHx1B/XOPiyTuT1XynbZESeuC7NQ6XLbRyuJ/ZQxh9pqK8pHIdf
	 98R3acaf4RQhaBuBurJuTDc6KG0bLaaLg9WGWbYAOJDjVJuMcTAby/VndNCeJ/1+eg
	 q9YJcN4aYEGVRvf42XWK2D8cOqCgi9Qx4KJOCmOwxfWuqo2oa4+nvUffA7LRQPVypV
	 kzZEqSvm4o20cxBB5vcoTfdqmD2iohkaq2cIheYuolv6xQkS/N9XfD9PP9buuAuiGp
	 6F7Cf1vMSMJ2g==
From: Hans de Goede <hansg@kernel.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Alexander Usyskin <alexander.usyskin@intel.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 07/10] mei: vsc: Unset the event callback on remove and probe errors
Date: Mon, 23 Jun 2025 10:50:49 +0200
Message-ID: <20250623085052.12347-8-hansg@kernel.org>
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

Make mei_vsc_remove() properly unset the callback to avoid a dead callback
sticking around after probe errors or unbinding of the platform driver.

Fixes: 386a766c4169 ("mei: Add MEI hardware support for IVSC device")
Signed-off-by: Hans de Goede <hansg@kernel.org>
---
 drivers/misc/mei/platform-vsc.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/misc/mei/platform-vsc.c b/drivers/misc/mei/platform-vsc.c
index 1ac85f0251c5..b2b5a20ae3fa 100644
--- a/drivers/misc/mei/platform-vsc.c
+++ b/drivers/misc/mei/platform-vsc.c
@@ -380,6 +380,8 @@ static int mei_vsc_probe(struct platform_device *pdev)
 err_cancel:
 	mei_cancel_work(mei_dev);
 
+	vsc_tp_register_event_cb(tp, NULL, NULL);
+
 	mei_disable_interrupts(mei_dev);
 
 	return ret;
@@ -388,11 +390,14 @@ static int mei_vsc_probe(struct platform_device *pdev)
 static void mei_vsc_remove(struct platform_device *pdev)
 {
 	struct mei_device *mei_dev = platform_get_drvdata(pdev);
+	struct mei_vsc_hw *hw = mei_dev_to_vsc_hw(mei_dev);
 
 	pm_runtime_disable(mei_dev->dev);
 
 	mei_stop(mei_dev);
 
+	vsc_tp_register_event_cb(hw->tp, NULL, NULL);
+
 	mei_disable_interrupts(mei_dev);
 
 	mei_deregister(mei_dev);
-- 
2.49.0

