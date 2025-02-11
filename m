Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB04A24C676
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 14:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739282670; cv=none; b=LelD+bLG7LL2HDq960KYg9ZLoCSS0fU/UfIEBOCjIciAm1kmZLjWYM632+ivhcht3RSVacUJmCsndYGC+uKXEUoQ6R1rNSgYFDo+X4I9CUWC3ZDHLreFsfB6Ign/iZEA1CK6ExDuJSAlwS6DYJ/BSJq+9vkDX6euXpszJzKecFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739282670; c=relaxed/simple;
	bh=vMOdpFf13leEHXzQqFAXuKlmIV8zaMhepi2X91ndeJQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NXQFkEnNNZzcu5w9HLlCDcu3Xe2Rp1/iPaFz4q9lTWMrJ93sINFZYTSz5r6uZjx+/X60Td6rFMg+MUAtuUsGOF8K7PQ+ULNtUgbwRal3SwE2GkL9GGDxjfaLAygM9YfnEp48GsFI+LR8rxqKQE4ssM956I6urvvh9Jxvup9EXJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=lGB9ZMJD; arc=none smtp.client-ip=91.218.175.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="lGB9ZMJD"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1739282665;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=o1BPkLTn6NvjCT7x9OM1G503BAs6KZAocao82IvriLs=;
	b=lGB9ZMJD7B7rsn3p10DIXhPBLKMvFCdb2lENHmwoh3Mij9cZRpH1VdPODoT6YEU74a55Ws
	09dCJQ7gMTZhccjv2Xj7BbuZ8Ud/uC7PlcO4MobLtGY8aQd54EYCCAfuGKDBeH9X1B3XCf
	7k6VgkIumuoq21dg5HMLm22zGS6Op2w=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Dominik Brodowski <linux@dominikbrodowski.net>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] pcmcia: Use str_off_on() and str_yes_no() helpers
Date: Tue, 11 Feb 2025 15:03:47 +0100
Message-ID: <20250211140350.713397-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Remove hard-coded strings by using the str_off_on() and str_yes_no()
helper functions.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/pcmcia/socket_sysfs.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/pcmcia/socket_sysfs.c b/drivers/pcmcia/socket_sysfs.c
index c7a906664c36..4eadd0485066 100644
--- a/drivers/pcmcia/socket_sysfs.c
+++ b/drivers/pcmcia/socket_sysfs.c
@@ -10,6 +10,7 @@
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/string.h>
+#include <linux/string_choices.h>
 #include <linux/major.h>
 #include <linux/errno.h>
 #include <linux/mm.h>
@@ -98,7 +99,7 @@ static ssize_t pccard_show_card_pm_state(struct device *dev,
 					 char *buf)
 {
 	struct pcmcia_socket *s = to_socket(dev);
-	return sysfs_emit(buf, "%s\n", s->state & SOCKET_SUSPEND ? "off" : "on");
+	return sysfs_emit(buf, "%s\n", str_off_on(s->state & SOCKET_SUSPEND));
 }
 
 static ssize_t pccard_store_card_pm_state(struct device *dev,
@@ -177,7 +178,7 @@ static ssize_t pccard_show_resource(struct device *dev,
 				    struct device_attribute *attr, char *buf)
 {
 	struct pcmcia_socket *s = to_socket(dev);
-	return sysfs_emit(buf, "%s\n", s->resource_setup_done ? "yes" : "no");
+	return sysfs_emit(buf, "%s\n", str_yes_no(s->resource_setup_done));
 }
 
 static ssize_t pccard_store_resource(struct device *dev,
-- 
2.48.1

