Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F2DF21D5B0;
	Mon,  9 Jun 2025 18:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749494842; cv=none; b=drr1X/vz/wlkLaUDQLxH0kaW82GWQQgjQyQbDDoN+8HFYvlgpFfR2sYrgbaGyyH21xlwzbe8V7OKsIygAuHblb9iO+jNvdCTOfhp0ElS6KpJzGDC/2EXFMdYzxIWSrvq3j2wC0smmfD+Y42GGYC0Zb+Pbu9xSQia22Bgf3Z7zes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749494842; c=relaxed/simple;
	bh=pPoC/LS0uN6ywHh7EurpvMakWSVRudAGdL1ngeHOvfs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GQoIm+87IzXCrnDgNMk5KO0UteUXYX2mRXnz4IrpowKzqaNzAD9bb05zS+M9RLOJUMwf/FZcvLuXAjKMbx3AxeCKdu/QI7+g8BK4gBoka7IiE4qV242cKrjGqV/i4N6IJCZmjkXVfnSN+xWdtuqphfYcsVyqnL1oreJ7+H5NsSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZNsYwqJz; arc=none smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZNsYwqJz"
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-2ea08399ec8so1993452fac.1;
        Mon, 09 Jun 2025 11:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749494840; x=1750099640; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ld2tbrtbZ/fRYlkxF78AVoT3iV81szTL1HbnVLl1RG0=;
        b=ZNsYwqJz+XBM3U4ufbbi/LyxUKmptBXDYnneZceVZyR7B4yGjnbXGO62LqomOZhWOF
         g0r2te8XaHB1s1aqbmtFsBiznW66DUpQZj9s3JGx4FwqKwUT0QCIojkJvkCP9nmL+vRM
         81a9KWqIcFfezf/2W16JhE/XHukR42HN/QsXXMCdmqnKZjFZPuKoMzHGfwilxHY6n0N+
         +HHNT4hcChncG3gpA7dvpgjR3ZrXY6ey0Z/Ab/W6V4LvHqg7xhwBXh5NpHpbQ1a2C4yZ
         BlvfDOAZ47rewDLamIiSFki4Pny7fv0gOCadaLIkxIi7yKU+Boyh4ZUrnUa/l/TPmnBA
         RYnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749494840; x=1750099640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ld2tbrtbZ/fRYlkxF78AVoT3iV81szTL1HbnVLl1RG0=;
        b=J+EjtnCL6zyPzNrUCKYY/Aaueb7H5RYWsO7yvAX/xUDZkWcJMutPZ8f8Kp5XiOXlzZ
         QR9PIhdxKWOA3BdonwXbTNA31hE9hxIyHGqGqPf4JZAFvXS1TPgbI68KeO9vJA61YNAI
         mI0XNfS0d6BHb4uwB2jENY/koySSFKzRbAoGetnr5XaXihlqlY6YIeXXJ3COy3fn1Lr3
         a450BsnTCZAGcv8DxwnAM32OpcUDWcFxPrUF5NEbkGwmhWFxmgosD1Sx5ffA92YveeQ5
         XcrmaDBD8OnIJAqshQNalR2syuvMbOe2h/G1kZPPSTFENSJ48C6782cFlF0hlSMTDpxY
         30bw==
X-Forwarded-Encrypted: i=1; AJvYcCVrJl05AshZgAmjLHVYkZJaKnu7KauivPgFkNWotx6/RaYOvocyG2UTkUibW1/pyh/23/JoW79B/2pM1IHEm1uDVfQ5@vger.kernel.org
X-Gm-Message-State: AOJu0YzVCesF5ThIxKbfMrCCG8K+JjVfKIONBjxa7ofeDL4pIwnsJcdK
	wQoo6hvldAVKvYXrE7IVk9YD6KtdbcQ2iK20fn+QDHgQJSIus/EGwCNlRFzFyw==
X-Gm-Gg: ASbGncuKE9ko7KftW71kFx8Rv36y54pNxctLlhFOlbplcttQ9p6twBwBrVarq9b9o7n
	zJBle5z1hgRYEVMywwwFFNG99l1ZqjmVb6lp9LeiAMhc4YaLIM2rEzsu91fSVdBF2ZQBVNjuIm3
	3KhdzEaLae3ncyXmOcfj5iRpFflEuZfNUx7lc11lyDHLWQtdMCHzwKgQ3BAZuzZWzDGF3scQvq5
	luvkzSVJhm2M/7dctSBuKNfDk9zSZ3JLiAiOgVZf3lyReRDfjpazecHtuFPy4sTVmqmJXE5nEcG
	1iMIqzH0MaZ/iMA439CH19LQIAYNGTLczZfa4V4q3ACoqCUrAeMicWGU8bbAmfSJIt1li8ccbYa
	qSSbvRjwgmuITO91hog==
X-Google-Smtp-Source: AGHT+IEhoG6dThL+SskJLpDoTokE/gVtENSR8qsicmFijN2sFd/IU/wmWmHylydRq9SfI/xCR8727A==
X-Received: by 2002:a05:6870:1056:b0:2ea:6ea1:9625 with SMTP id 586e51a60fabf-2ea6ea1988cmr1139023fac.31.1749494839991;
        Mon, 09 Jun 2025 11:47:19 -0700 (PDT)
Received: from localhost.localdomain.adc.delllabs.net ([143.166.81.254])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2ea072e4b5asm2035950fac.30.2025.06.09.11.47.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 11:47:19 -0700 (PDT)
From: Stuart Hayes <stuart.w.hayes@gmail.com>
To: linux-kernel@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org
Cc: Stuart Hayes <stuart.w.hayes@gmail.com>
Subject: [PATCH v4 3/5] platform/x86: dell_rbu: Remove unused struct
Date: Mon,  9 Jun 2025 13:46:57 -0500
Message-ID: <20250609184659.7210-4-stuart.w.hayes@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250609184659.7210-1-stuart.w.hayes@gmail.com>
References: <20250609184659.7210-1-stuart.w.hayes@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Stop using an entire struct packet_data just for its embedded list_head.

Signed-off-by: Stuart Hayes <stuart.w.hayes@gmail.com>
---
 drivers/platform/x86/dell/dell_rbu.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/dell/dell_rbu.c b/drivers/platform/x86/dell/dell_rbu.c
index 722979b19e0e..c03d4d55fcc1 100644
--- a/drivers/platform/x86/dell/dell_rbu.c
+++ b/drivers/platform/x86/dell/dell_rbu.c
@@ -77,14 +77,14 @@ struct packet_data {
 	int ordernum;
 };
 
-static struct packet_data packet_data_head;
+static struct list_head packet_data_list;
 
 static struct platform_device *rbu_device;
 static int context;
 
 static void init_packet_head(void)
 {
-	INIT_LIST_HEAD(&packet_data_head.list);
+	INIT_LIST_HEAD(&packet_data_list);
 	rbu_data.packet_read_count = 0;
 	rbu_data.num_packets = 0;
 	rbu_data.packetsize = 0;
@@ -183,7 +183,7 @@ static int create_packet(void *data, size_t length) __must_hold(&rbu_data.lock)
 
 	/* initialize the newly created packet headers */
 	INIT_LIST_HEAD(&newpacket->list);
-	list_add_tail(&newpacket->list, &packet_data_head.list);
+	list_add_tail(&newpacket->list, &packet_data_list);
 
 	memcpy(newpacket->data, data, length);
 
@@ -292,7 +292,7 @@ static int packet_read_list(char *data, size_t * pread_length)
 	remaining_bytes = *pread_length;
 	bytes_read = rbu_data.packet_read_count;
 
-	list_for_each_entry(newpacket, &packet_data_head.list, list) {
+	list_for_each_entry(newpacket, &packet_data_list, list) {
 		bytes_copied = do_packet_read(pdest, newpacket,
 			remaining_bytes, bytes_read, &temp_count);
 		remaining_bytes -= bytes_copied;
@@ -315,7 +315,7 @@ static void packet_empty_list(void)
 {
 	struct packet_data *newpacket, *tmp;
 
-	list_for_each_entry_safe(newpacket, tmp, &packet_data_head.list, list) {
+	list_for_each_entry_safe(newpacket, tmp, &packet_data_list, list) {
 		list_del(&newpacket->list);
 
 		/*
-- 
2.47.1

