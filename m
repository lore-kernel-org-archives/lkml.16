Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA5E235066
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 08:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750668668; cv=none; b=Fh6TkhW53iTinX/Hb1S1DNn5kxdowzcIvgK1Xm0FQtsi2XY4Xzmt1oxbn6p2ohFsM+Y6iraNZms1xij/SR0R3zFqowIJ1mGSinAeCOine/4IMsbxbAO3u8taY7q8z6opXB5FTL+SVPrKQ2szRs98RWrEtFWim+cdrbR/Ua9WWG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750668668; c=relaxed/simple;
	bh=gAT/2NQIOzLs/La0bdAuHZyLTdYB+hepialGfTZDzKg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M0dscAf6xOmJ/RbGpcnLFikpa8SnZTldHqI/YO0hvkMO0SM88DWuwZDDz67Xns0A3v3KJtrqgCCvMORsdcFcdQeuZIbShjjaQ+eyxFF3+OtNTVOrbcX+qMQrEciFItuwIcEO47aD1VnPBmH/hR7QdtaWEgp6GSMjvpYQ80ag/Jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a/QRhA1U; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a/QRhA1U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83FADC4CEF1;
	Mon, 23 Jun 2025 08:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750668668;
	bh=gAT/2NQIOzLs/La0bdAuHZyLTdYB+hepialGfTZDzKg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=a/QRhA1UT5XR9bSM6n38IdYCFX3virkXjnsBDc5czBFQOWK23fwqt7humyjrdP5dn
	 uewrl9AYjOhORQLVNLBDmhogHEQJ1uLfCKMInqqYio3WTSZHM1Eb+RxW6zt2vtwhvo
	 HzjAB4IR+WQM2BMCeQ969oY9DDZuJjLuVsoV2/6ojbzvmHi3FibnHxyCPVsbeLBNwZ
	 Z6pOGKTdvXI4k4wEvqZZvB467OYEMxjEKGso2h9xPIgoqmuBlGYdvoYuOvAOqqDZqV
	 ODj1v1k8lTEOVoARsta1ERk6C4f73b3A1sREVEkPJTYhU+AEuyjq1pRZInA1BX/BMs
	 fU/g/3I83bb5g==
From: Hans de Goede <hansg@kernel.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Alexander Usyskin <alexander.usyskin@intel.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 05/10] mei: vsc: Destroy mutex after freeing the IRQ
Date: Mon, 23 Jun 2025 10:50:47 +0200
Message-ID: <20250623085052.12347-6-hansg@kernel.org>
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

The event_notify callback which runs from vsc_tp_thread_isr may call
vsc_tp_xfer() which locks the mutex. So the ISR depends on the mutex.

Move the mutex_destroy() call to after free_irq() to ensure that the ISR
is not running while the mutex is destroyed.

Fixes: 566f5ca97680 ("mei: Add transport driver for IVSC device")
Signed-off-by: Hans de Goede <hansg@kernel.org>
---
 drivers/misc/mei/vsc-tp.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/misc/mei/vsc-tp.c b/drivers/misc/mei/vsc-tp.c
index f5438a600430..0feebffabdb3 100644
--- a/drivers/misc/mei/vsc-tp.c
+++ b/drivers/misc/mei/vsc-tp.c
@@ -521,10 +521,10 @@ static int vsc_tp_probe(struct spi_device *spi)
 	return 0;
 
 err_destroy_lock:
-	mutex_destroy(&tp->mutex);
-
 	free_irq(spi->irq, tp);
 
+	mutex_destroy(&tp->mutex);
+
 	return ret;
 }
 
@@ -535,9 +535,9 @@ static void vsc_tp_remove(struct spi_device *spi)
 
 	platform_device_unregister(tp->pdev);
 
-	mutex_destroy(&tp->mutex);
-
 	free_irq(spi->irq, tp);
+
+	mutex_destroy(&tp->mutex);
 }
 
 static const struct acpi_device_id vsc_tp_acpi_ids[] = {
-- 
2.49.0

