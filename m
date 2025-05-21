Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D94C25A342
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 10:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747821894; cv=none; b=aplUBk/zRYNU/sVI7k8TNS9oMQ39HXQD5lCofEC5ginU4UcN8RfGZoqWeUMminJsS197uMaRLMxnP3CKQajoLSK9eFScK5qNDR5IJJhu+KHXLqPL7KO5D9zC+zrSrKzwYaGiSYzy3Mms4ufLlDY6rCy5GDTrChUcAl/5z3K7/mI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747821894; c=relaxed/simple;
	bh=g6CYVYXiOTMe5bUJ93aSGwjCppez3IhEMpBu48hcmSs=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K0k1+pEpaFIwx5x/wbloNjPHBBJ+KqsjklJk4F2u2BgAPjJ0F6RNKDqZPbs5bzL9u8KZ3d+YSr224p8WEWV8pWyq3GE8WE9IRRCXBgHj6rKPOeEDVSIr+8XGw5T0J7Y9mK3yDvjwyOfs7K+JmOt1OW4skWFCNdEMC/HXK+SBLic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=free.fr; spf=pass smtp.mailfrom=free.fr; arc=none smtp.client-ip=212.27.42.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Received: from localhost (unknown [82.64.135.138])
	by smtp2-g21.free.fr (Postfix) with ESMTP id 14B2F200401;
	Wed, 21 May 2025 12:04:35 +0200 (CEST)
Received: by localhost (Postfix, from userid 1502)
	id 8BCBDC4D7; Wed, 21 May 2025 10:04:35 +0000 (GMT)
Date: Wed, 21 May 2025 10:04:35 +0000
From: Etienne Buira <etienne.buira@free.fr>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Etienne Buira <etienne.buira@free.fr>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3] firmware/raspberrypi: raise timeout to 3s
Message-ID: <aC2lM6xXCVK_3oWI@Z926fQmE5jqhFMgp6>
Mail-Followup-To: Florian Fainelli <florian.fainelli@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Etienne Buira <etienne.buira@free.fr>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <e5659e34-511c-4137-9ffe-152bb0777146@gmx.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e5659e34-511c-4137-9ffe-152bb0777146@gmx.net>

Raspberry firmware driver expected said firmware to answer by 1 second.
However, some firmware versions are buggy and can take longer with
RPI_FIRMWARE_NOTIFY_DISPLAY_DONE.
[    2.861407] ------------[ cut here ]------------
[    2.865512] Firmware transaction 0x00030066 timeout

Raising the timeout to 3 seconds (ought to be enough®) doesn't trigger
timeouts anymore for me and proceeds to the next failure.

Some details about firmware debugging are available here:
Link: https://github.com/raspberrypi/firmware/issues/1970

Signed-off-by: Etienne Buira <etienne.buira@free.fr>

---
v2: coding style
v3: commit message

Stefan, feel free to edit to your liking if needed, or even take
ownership of such one-liner, that would not be stealing.

 drivers/firmware/raspberrypi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/raspberrypi.c b/drivers/firmware/raspberrypi.c
index 7ecde6921a0a..8c45a152e3ba 100644
--- a/drivers/firmware/raspberrypi.c
+++ b/drivers/firmware/raspberrypi.c
@@ -58,7 +58,7 @@ rpi_firmware_transaction(struct rpi_firmware *fw, u32 chan, u32 data)
 	reinit_completion(&fw->c);
 	ret = mbox_send_message(fw->chan, &message);
 	if (ret >= 0) {
-		if (wait_for_completion_timeout(&fw->c, HZ)) {
+		if (wait_for_completion_timeout(&fw->c, 3 * HZ)) {
 			ret = 0;
 		} else {
 			ret = -ETIMEDOUT;
-- 
2.48.1

