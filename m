Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FCCB2BF3EE;
	Thu, 22 May 2025 20:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747944606; cv=none; b=C7iqDbEr5Pdfk9SggfyN3oATuUGrJCRyJNbbuir/KeDcytMRkmDGK73YKYgm+vaSX/Qk/8YcvXmce3s/5GR8KmurQ5NuOilSeNCDJjTd4a8ySFp2G+8pd5Bt/MY5nZnjYOj7dq1ArdZYhn9939k1TAXVGChBx2bBNbYvdG8kTA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747944606; c=relaxed/simple;
	bh=TYOe1X4HiP2jLMtGTXfIjoVvkX+GkG3w3WtLiBjaWGA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rgcbAC7Us9K3jPW51ERG+JQxH2qP6h24DOXiYxmuxtBWbA4EIpaelsrvFdv6ISVCud7rZdr/dfT1wx3MmTcByuaAksH/ZL6BYmDlJP/Ta5Fjcr0F/sm2cFRVtq4vBxiEWL38dIXyTSyj7RrxmDt80IYhI1j1bzpZZHwSK5c2hPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KWhX68xI; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KWhX68xI"
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3feaedb39e9so2922383b6e.1;
        Thu, 22 May 2025 13:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747944604; x=1748549404; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OclIesw1izJi5DFMfy3FYc7UMLpb39l7085Lh8T/vJs=;
        b=KWhX68xIdPC9vznnRyhcLrNSsRo7FupojXZ7RvgiksuIXicA5lG+JfDS/vaK/XaEbu
         N40tquVEecdl86nOiUJ9Rj8ugqne4lP/ynsHZD+oTTuc9l0h1VPhDxsH5kpEA5t8sPtp
         s7HOkLS4gRH9/huyJ9piy/fd2OP1qGpoZt+VLyfrjJx4/vyGBHSQjJOJReufo4g85Lra
         IK4KuaocwmWPCeqg5cs1iZEVAAdermA7BIad5uYw/rMKYWTC+a1bV1ZscK+2nwt9STPW
         p3oVPswnxviS6oqtNXRLBvoIYmooCvqi2X+5X6Z6bw49WLquMqJcHrIoiTtbbMWyMrlh
         dCBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747944604; x=1748549404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OclIesw1izJi5DFMfy3FYc7UMLpb39l7085Lh8T/vJs=;
        b=NNZDcKlHHsCoC/z/HGtg9kcgkDWrJrn1KoU3UMLHp2JstFR1hwio4GQeGIdrPZ0HIP
         iSj6zNP0WN7BSElae6a8lTh4Y97dX8uRMbyOeg0Je7oi+jg6nyg8Djt+S65F7jGzUmem
         SlMFqzgQhKyiyvSbRmbXhim0xKUcB0Rl2hwWiWJxAa84mGjz3Qws1uVFIxnLoa8BL2CC
         7iQ9bKG+Y0e1bHdgDppGHK55zRabkay3F9Tr3uFvjaR3mJ0Hztt6QKRef8PBTGEe1q5u
         FuYfaOARLLhFiiGtLi1/iRAV3WtHS3b986YWIuthas4GB8fNHFNEPDXPORhcV1q7F2gi
         PIng==
X-Forwarded-Encrypted: i=1; AJvYcCVzVacj4JewFYZB6Aa3tSQLykCE/BHceRIQr2pHdYpwrHXHpPcwu56KYbenv2cD5C0QcbrfoFC/OX1XA9cGilFc91c/@vger.kernel.org
X-Gm-Message-State: AOJu0Yza/8e7qLqaYKJzHQqNDq2R+bGuNti4ZtHfddzjDAvsaHYA2l2W
	mTBaxnAcwXK6dfh+1GI+V+iy6VqRaMiQxP5H4A5axZu+/hO24QsQneiHigosUw==
X-Gm-Gg: ASbGnctgxXFlQYaaZ6YEJl98E7mL60m+dSbmxMy59CKITAtul1VXDkz/ZG4e22dnutF
	s4tT0sGrt1+90yEJ0n2Z6z1nAow3rA6WKa8BxwgBCNr51LFf4rRQrS3Q8L2aivY19EkyY3nfFpK
	BNVYufnAOTQAGO8r2nDBIZEY83bnDFL5FJXQ+rRcz2Q5q2uKSEcJP9kRBeZqPPP7zSAsL4yLhK7
	/RdYAq33nHKf3sY0EtBdt6L4l0qm/eoj6bl5FKUScR2APf06QOc/2VM0NUkH1GdUGjn5nGC6yNB
	JfSD4Q/7O+HPBr+ZuFtLP1SIxAaXdZmI5eqWRp6UD2j9h05pvrWowq7lCS+KH6/LkraBh2YuI46
	DINOm517fO4Hms98rXA==
X-Google-Smtp-Source: AGHT+IHaY5C+RTiQ0OBFcQiLWXqgt1xCogRmKuxqTIXAywhfWrIAqdzAfiT8iSU5gehNbzChzapsTw==
X-Received: by 2002:a05:6808:6c91:b0:402:a5c:906 with SMTP id 5614622812f47-404da80abf3mr18664225b6e.34.1747944603700;
        Thu, 22 May 2025 13:10:03 -0700 (PDT)
Received: from localhost.localdomain.adc.delllabs.net ([143.166.81.254])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-404d98b2762sm2651046b6e.32.2025.05.22.13.10.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 13:10:03 -0700 (PDT)
From: Stuart Hayes <stuart.w.hayes@gmail.com>
To: linux-kernel@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org
Cc: Stuart Hayes <stuart.w.hayes@gmail.com>
Subject: [PATCH v2 2/3] platform/x86: dell_rbu: Fix list usage
Date: Thu, 22 May 2025 15:09:36 -0500
Message-ID: <20250522200937.9578-3-stuart.w.hayes@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250522200937.9578-1-stuart.w.hayes@gmail.com>
References: <20250522200937.9578-1-stuart.w.hayes@gmail.com>
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
index 7b019fb72e86..c03d4d55fcc1 100644
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

