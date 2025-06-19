Received: from ms-10.1blu.de (ms-10.1blu.de [178.254.4.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17E3027D791;
	Thu, 19 Jun 2025 13:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.254.4.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750339886; cv=none; b=L8vmQFJmS6V+QD0j49dtU5HVtF0aDlTz3fZo/9/gloXFPsGi01XN/jpwvkKhlEym+J9CcMld8MNfmUD1vSmeECx2wbeVvFyLGvuAfyBRmk8Mt1WeMA1YuuStfpiYy+YLHK9Tezxv/WiPj3nBkGyd1UmIhjdsdE09klx8zAOzFyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750339886; c=relaxed/simple;
	bh=xmUORx34vcfctweY/xF3n1y/gehWOew+uPKkY7apwZQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hxl5OOI/eISOxPKfzLu6QY8oOLE97un/03OWIy7ud9AIUuIoEfpvAneejqYK2CbeHbHbDhVGvI1s9g8IeucdJO+32d/saTPOVnUn9+IRHoE8R213TyXzNph/EJaGJvsO/COO9cOkbJt5y9t1aKFxK1OgjzZFqF59xO2SunyqCT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mariuszachmann.de; spf=pass smtp.mailfrom=mariuszachmann.de; dkim=pass (2048-bit key) header.d=mariuszachmann.de header.i=@mariuszachmann.de header.b=hNZIv8M1; arc=none smtp.client-ip=178.254.4.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mariuszachmann.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mariuszachmann.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mariuszachmann.de header.i=@mariuszachmann.de header.b="hNZIv8M1"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mariuszachmann.de; s=blu6948523; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=M4ciBTZbZt3WYpm3wULI3WBZIQzltvoouBjAUZOpVV8=; b=hNZIv8M1X5jr6AS73Ll5Qn9pEK
	yceAaJxMuTOnhArhZYCEdzXdVxL9sg7/19ypgEdeTJt+XqF0cAZrVg+eZE6BIqLxxVGUOT5g84hhI
	vfNvF3aBd2PsOMJgZ1JVx53dQCatArd92NazSMAkcwV/cKSBECdbn/AhMW857edsy7lEklYhVXA9S
	WKvOaOa2P1rRGjEHYT5ztWuPxfylB3Virye1wuqfpW4bpWbz9xRnqNwHEKQPD/BpOAOkuwNqEJYlV
	irARH0K8UJesl3uAHSp04GLXoWxrUu+qIXhlHZNlkJh8T1/JdliXIKnLU70Lry/8EmgknBXg88BoH
	56vj6C8w==;
Received: from [2.211.115.98] (helo=marius)
	by ms-10.1blu.de with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <mail@mariuszachmann.de>)
	id 1uSFMO-009unG-9G;
	Thu, 19 Jun 2025 15:31:20 +0200
From: Marius Zachmann <mail@mariuszachmann.de>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Marius Zachmann <mail@mariuszachmann.de>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jdelvare@suse.com,
	syzbot+3bbbade4e1a7ab45ca3b@syzkaller.appspotmail.com
Subject: [PATCH] hwmon: (corsair-cpro) Validate the size of the received input buffer
Date: Thu, 19 Jun 2025 15:27:47 +0200
Message-ID: <20250619132817.39764-5-mail@mariuszachmann.de>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Con-Id: 241080
X-Con-U: 0-mail

Add buffer_recv_size to store the size of the received bytes.
Validate buffer_recv_size in send_usb_cmd().

Reported-by: syzbot+3bbbade4e1a7ab45ca3b@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/linux-hwmon/61233ba1-e5ad-4d7a-ba31-3b5d0adcffcc@roeck-us.net
Fixes: 40c3a4454225 ("hwmon: add Corsair Commander Pro driver")
Signed-off-by: Marius Zachmann <mail@mariuszachmann.de>
---
 drivers/hwmon/corsair-cpro.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/hwmon/corsair-cpro.c b/drivers/hwmon/corsair-cpro.c
index e1a7f7aa7f80..b7b911f8359c 100644
--- a/drivers/hwmon/corsair-cpro.c
+++ b/drivers/hwmon/corsair-cpro.c
@@ -89,6 +89,7 @@ struct ccp_device {
 	struct mutex mutex; /* whenever buffer is used, lock before send_usb_cmd */
 	u8 *cmd_buffer;
 	u8 *buffer;
+	int buffer_recv_size; /* number of received bytes in buffer */
 	int target[6];
 	DECLARE_BITMAP(temp_cnct, NUM_TEMP_SENSORS);
 	DECLARE_BITMAP(fan_cnct, NUM_FANS);
@@ -146,6 +147,9 @@ static int send_usb_cmd(struct ccp_device *ccp, u8 command, u8 byte1, u8 byte2,
 	if (!t)
 		return -ETIMEDOUT;
 
+	if (ccp->buffer_recv_size != IN_BUFFER_SIZE)
+		return -EPROTO;
+
 	return ccp_get_errno(ccp);
 }
 
@@ -157,6 +161,7 @@ static int ccp_raw_event(struct hid_device *hdev, struct hid_report *report, u8
 	spin_lock(&ccp->wait_input_report_lock);
 	if (!completion_done(&ccp->wait_input_report)) {
 		memcpy(ccp->buffer, data, min(IN_BUFFER_SIZE, size));
+		ccp->buffer_recv_size = size;
 		complete_all(&ccp->wait_input_report);
 	}
 	spin_unlock(&ccp->wait_input_report_lock);
-- 
2.50.0

