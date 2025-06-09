Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA5E17597;
	Mon,  9 Jun 2025 00:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749429808; cv=none; b=IhbgUWGvEaIIDFFgSeV7xQ1nIR6UM30DMFaxd9U1bQ3z9ey+50UjSQPEB2DChQy5qZQFzY6+n+xz16D++9wgmFRY/Kqm6CSmZBxZg69xNRHCX13ZjIFdhPGIgvjjwisKq8XgwzHHJIzFTT34yeG1qPsErQ99ydKsd+oHefSdzTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749429808; c=relaxed/simple;
	bh=0VhPIT4X4Bsr/vXEgo6KBOHU3XZtB3TmwwJ++rKE5UM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BOk7wIcXRjhW6G15Rc55neCl9uU7rhsfGw0HY/qwK08IZyFtF44jAgmFLDKhUTj1a1Dj3OSkYR40/AgUt1eAqNw6uA9Z3GYH622kBg8Tl5eVs7wLEiYI1WfbT7/3y4B++FMkAzcl5WsUiBgpCEGTw6+d69kWh7YrhFCsLzR6r4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=hc6z34FV; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="hc6z34FV"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=s9ZwIRupw7AZC9X39pOlp8JbCxF4TegF7yM50iL/ESM=; b=hc6z34FVzELU7tl4
	mMpSH9JmSUloxSPstSFCQkJtR+nX9FKTvcqsi2Jp8LnWJMZWHbB3xze+amHEY3diszsY22b9PWcsY
	7ESQj2coZzmMuVQUvk27adRzqDIZVVolj0vgYwClsAN8M437dMXoOOiuHosqTPUJDa3nzJASXjhxC
	PwSA2UbkCaQw7FRXXuaUgSQeKjLhTadgJ+E1U/BJRV369wg63fjK47kLMns3cdojRFcqxMNh24FFt
	lGsHLQIrGHEvsWREoxnTdoQ6xEkX9cG1jz0trTvDT37YlobP7ENDutDKkOGyHtVk6jZH80q+H7vY5
	6U+zi6uYDbNf4T3+BA==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1uOQbg-008JKd-0F;
	Mon, 09 Jun 2025 00:43:20 +0000
From: linux@treblig.org
To: heikki.krogerus@linux.intel.com,
	gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH] usb: typec: Remove unused ucsi_cci_str
Date: Mon,  9 Jun 2025 01:43:19 +0100
Message-ID: <20250609004319.209143-1-linux@treblig.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

ucsi_cci_str() last use was removed in 2019 by
commit 2ede55468ca8 ("usb: typec: ucsi: Remove the old API")

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/usb/typec/ucsi/trace.c | 17 -----------------
 drivers/usb/typec/ucsi/trace.h |  1 -
 2 files changed, 18 deletions(-)

diff --git a/drivers/usb/typec/ucsi/trace.c b/drivers/usb/typec/ucsi/trace.c
index 596a9542d401..13a38422743a 100644
--- a/drivers/usb/typec/ucsi/trace.c
+++ b/drivers/usb/typec/ucsi/trace.c
@@ -33,23 +33,6 @@ const char *ucsi_cmd_str(u64 raw_cmd)
 	return ucsi_cmd_strs[(cmd >= ARRAY_SIZE(ucsi_cmd_strs)) ? 0 : cmd];
 }
 
-const char *ucsi_cci_str(u32 cci)
-{
-	if (UCSI_CCI_CONNECTOR(cci)) {
-		if (cci & UCSI_CCI_ACK_COMPLETE)
-			return "Event pending (ACK completed)";
-		if (cci & UCSI_CCI_COMMAND_COMPLETE)
-			return "Event pending (command completed)";
-		return "Connector Change";
-	}
-	if (cci & UCSI_CCI_ACK_COMPLETE)
-		return "ACK completed";
-	if (cci & UCSI_CCI_COMMAND_COMPLETE)
-		return "Command completed";
-
-	return "";
-}
-
 static const char * const ucsi_recipient_strs[] = {
 	[UCSI_RECIPIENT_CON]		= "port",
 	[UCSI_RECIPIENT_SOP]		= "partner",
diff --git a/drivers/usb/typec/ucsi/trace.h b/drivers/usb/typec/ucsi/trace.h
index 41701dee7056..9554a0207276 100644
--- a/drivers/usb/typec/ucsi/trace.h
+++ b/drivers/usb/typec/ucsi/trace.h
@@ -10,7 +10,6 @@
 #include <linux/usb/typec_altmode.h>
 
 const char *ucsi_cmd_str(u64 raw_cmd);
-const char *ucsi_cci_str(u32 cci);
 const char *ucsi_recipient_str(u8 recipient);
 
 DECLARE_EVENT_CLASS(ucsi_log_command,
-- 
2.49.0

