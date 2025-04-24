Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 085FF1F37C3;
	Thu, 24 Apr 2025 07:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745480724; cv=none; b=U4oQmqPB/Hd2Pjlg4md2b0j2ItGs5Z/Q5kORX7y3LMzdcpgjG14fo6AfZZ1fax6IJrtnsnA71//bIwkG/LD1GUi6hmw92BqSA85Cl/QC2qZczamCpDIMMFyyKQuYlDHc5xq5e/VCTKXhCdKmxPZITk6R5JfCkeXEa6zKB3iuzII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745480724; c=relaxed/simple;
	bh=HP5YklGbPTQerNGzKB65ixMGHEvJDNUVcgx42al+xP8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B54fnbPQOL0gwNr5VfdqZcJLHEaGc321Ikxm/oTlymX/P7AJZxSZDdAju1li4Ab/0UrGvz0xu1B59mT08vMNZL4sp9kAszP6LeWOOh/RoNAiYxk4DSf9WIdJSA3F/Imo++qTV9l13EFmzrYUIQe3V+IMkxoCXRwqlLt/Y2YttzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MW8DQj97; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MW8DQj97"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 775ADC4CEE3;
	Thu, 24 Apr 2025 07:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745480723;
	bh=HP5YklGbPTQerNGzKB65ixMGHEvJDNUVcgx42al+xP8=;
	h=From:To:Cc:Subject:Date:From;
	b=MW8DQj97bMFaJq1LfidiABli1PnPc+xfP8AiznfEJMyES34oIrHYKHifdxSFBrrP5
	 KXmibQgB4MbsbEML2+fBIVP+WA8JVdpgjEB5bML3rN25e4OTfsZpNZNC5HeDI3Ur4c
	 ByB8hLMZgW8sTnuH/IP29Xq0jST8/806fENky1m1mcM/XX3Tbnsu7JVWNRylVEM8UM
	 TydIQzAMef+Y9q277sGEa4DIYxnlKTM3PbIraVZb+iIt2E9DumHnuwYJ7D3N1J86Y7
	 3sE+LkClhBk8OhsQQF7P5RpIhDufS4C527WehYx9yLceFUes1TEjOTpUlSa2sl9c/1
	 gcAtJCQTi6DbQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1u7rGt-000000001Ry-2Dl5;
	Thu, 24 Apr 2025 09:45:23 +0200
From: Johan Hovold <johan@kernel.org>
To: Johan Hovold <johan@kernel.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] USB: serial: ti_usb_3410_5052: drop bogus read urb check
Date: Thu, 24 Apr 2025 09:44:48 +0200
Message-ID: <20250424074448.5537-1-johan@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The read urb pointer is dereferenced before checking that it is non-NULL
during open(), but no check is needed as the existence of a bulk in
endpoint is verified during attach() since commit ef079936d3cd ("USB:
serial: ti_usb_3410_5052: fix NULL-deref at open").

Drop the bogus read urb sanity check.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/ti_usb_3410_5052.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/usb/serial/ti_usb_3410_5052.c b/drivers/usb/serial/ti_usb_3410_5052.c
index a0c244bc77c0..d671189ecee2 100644
--- a/drivers/usb/serial/ti_usb_3410_5052.c
+++ b/drivers/usb/serial/ti_usb_3410_5052.c
@@ -729,11 +729,6 @@ static int ti_open(struct tty_struct *tty, struct usb_serial_port *port)
 
 	/* start read urb */
 	urb = port->read_urb;
-	if (!urb) {
-		dev_err(&port->dev, "%s - no read urb\n", __func__);
-		status = -EINVAL;
-		goto unlink_int_urb;
-	}
 	tport->tp_read_urb_state = TI_READ_URB_RUNNING;
 	urb->context = tport;
 	status = usb_submit_urb(urb, GFP_KERNEL);
-- 
2.49.0

