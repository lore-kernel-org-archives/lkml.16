Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B8DF22B8D1;
	Wed, 21 May 2025 16:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747844222; cv=none; b=e5d1bhItVNj1zG3+M2YGqvwhgs8SrbSxJndAKKZKpVBpCGI/eq2FdLopZsz17Tj/kVrYOQgMLUjwL+z1znAvGKz0BRo9S5xoieR56W+VvqauTCexYIHtHKxzWoLH4Xoh93llbu/h7OIm+1X1cd87ZEF+j9omIGnspGYCZpEJcRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747844222; c=relaxed/simple;
	bh=HyYC10+cmHPIFfp5MI8GIy37zCA+7WyuYe9ipa3HJ2g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J3WaJAZ5XIIqILJ8JyBTkYWDft6DQFblYY/zdrxkjHt8jAbrxpxr1C11VVR4fBvfWBZW+1+hohQEY5s3qUtUm1bS7EPIMSAtR2Ij8Jj+3mfihmJq4zaHa9e233rPJLLXlo25+uBDmPA/oYwmrGC1ZG0Cx3uxuf6vUSbnUGtMIhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YLtnImql; arc=none smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YLtnImql"
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-2cc89c59cc0so3337827fac.0;
        Wed, 21 May 2025 09:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747844219; x=1748449019; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qlyuxe0iXuDb4/CkEr8PEzYZZ4gXaPBKw8rPPD/nZJM=;
        b=YLtnImqlRgnAP24XIMx211Bu07xCd+pldNHo6lHvXUcVQxPTEaOYc8+VBf7A83rNN5
         VF04ZHbW3D6GQBpnKnw4e+O69bLIsaslA9v0imtbd52b3uTz+NoOsOLEVbmJ0dBao2cN
         B8FWBf1tCkF6jike6m4t+tWQXxjb2eG284HZkZ7sZ1YTwMtiepkIIAgDvkB3DQEudaaW
         SvA17AeSnKU8P6OnasHgCVrguhTt3kMqXGwEqg88HhXDJtbCNp1M/IE8AKM77wMukMW4
         FUpX6yDwlIor9jCYTDd+ITFATSm9Ak1rRtNppOYmqNuzzKlA9SEGpa7cfagIM9+3VrK0
         uHGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747844219; x=1748449019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qlyuxe0iXuDb4/CkEr8PEzYZZ4gXaPBKw8rPPD/nZJM=;
        b=sVuXmPtHRXz2haInrLgnOBksmEfbwOEm+kiCtkpGqYk14Nx/iuRF1Odo43MmZlvziu
         TDPkR1eNDlbKIS7+V3BOm08D2NzcST1eyUGAbrbXKr4AaZfMS3KPMpylOuD9aYjkXpAD
         DI07vDwoeYNwM7JDHMUfzYqTvwECvYuhoko7hmo1aO2qH+YGROUz2v+oCy/D/xtZNuHl
         BbO/FglPcX3L7j2zkzU9+/Pm5A8jDrg6WWLgPFbC94f7YnDg/d05C1pBGQrKuI2zFp9X
         DwFnb8glmuqji87fErBEFNDgPjhLrMkhjDGVYwjI0DCNevlTqhSPsOqt0DXgOq0pbgFw
         HQJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZRCQFiFWQsZpFba026V7Cw6Uat1TZP92ZxzbggErhg/hT1d6qxBeYvGdvu/jHMEUO7rLQMN1B1yIWLVT47dp3TJAp@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0i6DjoHUwNk50CDZN2YIGQZdnTj0csR56eyS5CyUOcUHAqOGU
	NPxP2Jts38Q5VOt17bYL5SDIiWt6s5Y6vfW4KnfrXLRpTSIFAqD4HqwR5/bBLg==
X-Gm-Gg: ASbGnct4ybl1569QnMpLmiQvekXFqideh+CD0P3d8f7+irrrt0sXvkmohdQNg8SH3eq
	G8Hx+4pM1XRqJ7PyENhkb8KaneTp5np1PiWqRgoS0pdYB/izczqSJEZZP4BjkxTA4k4IDexWOC3
	XYz1v6HxLR0lHaZAIOd1d9Ya4PbSnfi7lejY+CgtJttv1t7NV1w1xclwqN9O7q9b/UGuDg1E8ur
	oe9kg26BVqvTBEdN7l4hk/ju5FbaHfosIK7mGsQu4cvPl4HsA+ZTBsoVs+aR7Y6788h4/JQXZ4F
	Ps/rV9LhRXB4rfFlmgGCk+e4jx9lhqGxj7U+qyJFW0cWBywNsAs0j/gXzUdhpGdv39hecqKe1zz
	gsYroulJwRF3qzd34Rg==
X-Google-Smtp-Source: AGHT+IF41+uPMvlSyCLwpoeKoM++gP8xcY7T/VBGGT6PNWJ2zF+BgjWyKoOIRt9bT6mOCr7KUCa84g==
X-Received: by 2002:a05:6870:51c6:b0:2d4:f2da:9bb8 with SMTP id 586e51a60fabf-2e3c274218fmr13657272fac.1.1747844219248;
        Wed, 21 May 2025 09:16:59 -0700 (PDT)
Received: from localhost.localdomain.adc.delllabs.net ([143.166.81.254])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-404d9809bccsm2180129b6e.29.2025.05.21.09.16.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 09:16:58 -0700 (PDT)
From: Stuart Hayes <stuart.w.hayes@gmail.com>
To: linux-kernel@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org
Cc: Stuart Hayes <stuart.w.hayes@gmail.com>
Subject: [PATCH 1/2] platform/x86: dell_rbu: Fix list usage
Date: Wed, 21 May 2025 11:16:38 -0500
Message-ID: <20250521161639.47357-2-stuart.w.hayes@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250521161639.47357-1-stuart.w.hayes@gmail.com>
References: <20250521161639.47357-1-stuart.w.hayes@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Stop using an entire struct packet_data just for the embedded list_head,
and fix usage of that list_head.

Signed-off-by: Stuart Hayes <stuart.w.hayes@gmail.com>
---
 drivers/platform/x86/dell/dell_rbu.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/dell/dell_rbu.c b/drivers/platform/x86/dell/dell_rbu.c
index e30ca325938c..6a602a80160a 100644
--- a/drivers/platform/x86/dell/dell_rbu.c
+++ b/drivers/platform/x86/dell/dell_rbu.c
@@ -77,14 +77,14 @@ struct packet_data {
 	int ordernum;
 };
 
-static struct packet_data packet_data_head;
+struct list_head packet_data_list;
 
 static struct platform_device *rbu_device;
 static int context;
 
 static void init_packet_head(void)
 {
-	INIT_LIST_HEAD(&packet_data_head.list);
+	INIT_LIST_HEAD(&packet_data_list);
 	rbu_data.packet_read_count = 0;
 	rbu_data.num_packets = 0;
 	rbu_data.packetsize = 0;
@@ -183,7 +183,7 @@ static int create_packet(void *data, size_t length)
 
 	/* initialize the newly created packet headers */
 	INIT_LIST_HEAD(&newpacket->list);
-	list_add_tail(&newpacket->list, &packet_data_head.list);
+	list_add_tail(&newpacket->list, &packet_data_list);
 
 	memcpy(newpacket->data, data, length);
 
@@ -292,7 +292,7 @@ static int packet_read_list(char *data, size_t * pread_length)
 	remaining_bytes = *pread_length;
 	bytes_read = rbu_data.packet_read_count;
 
-	list_for_each_entry(newpacket, (&packet_data_head.list)->next, list) {
+	list_for_each_entry(newpacket, &packet_data_list, list) {
 		bytes_copied = do_packet_read(pdest, newpacket,
 			remaining_bytes, bytes_read, &temp_count);
 		remaining_bytes -= bytes_copied;
@@ -315,7 +315,7 @@ static void packet_empty_list(void)
 {
 	struct packet_data *newpacket, *tmp;
 
-	list_for_each_entry_safe(newpacket, tmp, (&packet_data_head.list)->next, list) {
+	list_for_each_entry_safe(newpacket, tmp, &packet_data_list, list) {
 		list_del(&newpacket->list);
 
 		/*
-- 
2.47.1

