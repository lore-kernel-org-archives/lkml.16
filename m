Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EBD223373B;
	Thu, 29 May 2025 20:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748550510; cv=none; b=tfzSuyzK5KMQqGZk22sCxCflBkl9DqXyBRBYgJVBH2BBJnSURctmRl9dU8IwZi8IhRavhIlKnBAq5pUo9cK1pZdvgzLIdyFBP5Jr6Ws6an7MfPuTbXBF9GzBFFUdUl/y3NtYVyZJ6rSZjYzphtCBwtcRW0UIDgzRQKJxaQLyG90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748550510; c=relaxed/simple;
	bh=4QigIJJtFhfGtuvuRpNapzNIjz1K8h6hBpd96b9I0jE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RPqsJqF27p2KrX5zxiTNnJoWDt87QN1Xb1wliK9yV0yMmi9m1z6R6uYnNbPUPWr+zE1rBuotfztUeCc0Un2GfH2ohR2ZXd6Ulz0iyJPBWrT0W96kPaRJrp3BYNwU9y+k/K9ELd21Or9m7KFrXDJHNSfbr+qcWAv/qTNKe9lvmLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LwpiUuzZ; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LwpiUuzZ"
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-4064ec636a4so722216b6e.0;
        Thu, 29 May 2025 13:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748550507; x=1749155307; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4lAWOmPKQaPD4W7Jj0y6egQe+m1Gk8ZudifLKaUMwoU=;
        b=LwpiUuzZSrstJ8rZxSrhr2U/VmJrN4r5v0oHfd9/yPqJ8qLX+6R4TNVAt5bE8V5xp3
         OO2VmUU1+sBuRjLco7zxrP1Aw8gk+/B0QfETMQYRGiMf6i7a1cThBGQxcB5339Xq1/oP
         2ooehilPEz05bB8ErTufUtS6tz9ZE11qqyNVeH3vDmSSWhLPfpeDlIP8ib2Nm5x3RyIt
         T0NOcvPx6zhLhNcJq0686ZR9sPzcpDyRcbsP3wHy4/1ad2akvrvAepQWY/hLTph2RFE8
         ch4tz7DWgcjeR9k/jQk2tHvGGQ3uQg8PtXhliEQhPKw2h9EhzVZ+kE7JfCeVMEp3ocnv
         WMNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748550507; x=1749155307;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4lAWOmPKQaPD4W7Jj0y6egQe+m1Gk8ZudifLKaUMwoU=;
        b=o+ygBUWLubpGMYfja0cq0CTTDJL76k6nUVeCHqebkmB3CRqBY8nHNHQuU/kvphW4+e
         cQOs0symzmbLCtgJYTJEGGdH1tWWRl8M4S4mTuFFoHIjlytudbcaGnxjeNLuaP58Sa9p
         NbsbGbQuwgz5S7CkUNLMPMQ+9/5qsIayc1DxHAPkozVZmxeuzNau9JVG02P3jkvBWYCN
         53IdbyVfQZtducIUojPKTFN3HGWjqI1SyPagiBuWrtw9ORqWMGDuCQiSefgF6nl/9CxE
         hWfY8DbrxO/t+dfni1/85qZorm7bfCOMq/tuU7t7GsHUMKmbkXWT+wR+O/olpk0I/xo7
         9vNg==
X-Forwarded-Encrypted: i=1; AJvYcCW4jw5j/UWWPKyPg7NGQ9IzJ+HmJ1Wtj3kOMLSArur59pdwTNBbPycDh/SIoNFntodRqAPC/YU5HjMRhHkUHsFc7+KJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1oPvvno2frqbsrh5AS9B2yMrkq1ZnK+JOndE6RoacYFCAq9RI
	a8VEgkWpde4eT4RdsasRxtrxAGWN7uMLwbz8wuUrhx0+UYfy3m07y7wh/kF2Ag==
X-Gm-Gg: ASbGncvXYd5sbduLHZ7ZxBxm5YFipm464Bwkz9ADSkV9Mq9Y6rKpx1hOkPlhcx4ES2L
	CMGVZoJJEqTlcqeYnHRnVCgXe1Jdt4tin7+D/7jBUO7/K1cQsCD6azY3kvhmMFCOuTLNthG0T8Q
	CS+MRrrYoX0qqRjOGRMCB0giUPr+ZlRyW4S2nf89T4exXITQNCsjJOblAR0tz9xGG18wUTRHrGw
	2Y9vyw36b+OOHxVaUB7APO2R6wwht2236VF/tmUwCF4K+s7YQBC8xtEUFAh1o075GrRklHlPBep
	7hTiFPSuJssrIsaRxnqr/vWh1yEWVzSPcCPTsDtQC/3VDUx7LVPPgfZ9s6KONPyIBQjKDRmydWE
	zyfX4lyGs6eWoqPmM9A==
X-Google-Smtp-Source: AGHT+IGNACWi5LxDJXy/aCeVmiLM0LbcdHq7MlgqsaOxetl338Z3qCUReM7pf3CJypyJN9eUwCcokA==
X-Received: by 2002:a05:6808:319a:b0:403:31a4:f3fe with SMTP id 5614622812f47-4067974f447mr657929b6e.32.1748550507380;
        Thu, 29 May 2025 13:28:27 -0700 (PDT)
Received: from localhost.localdomain.adc.delllabs.net ([143.166.81.254])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40678bf36e7sm129240b6e.1.2025.05.29.13.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 13:28:27 -0700 (PDT)
From: Stuart Hayes <stuart.w.hayes@gmail.com>
To: linux-kernel@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org
Cc: Stuart Hayes <stuart.w.hayes@gmail.com>
Subject: [PATCH v3 2/4] platform/x86: dell_rbu: Fix list usage
Date: Thu, 29 May 2025 15:27:56 -0500
Message-ID: <20250529202758.8440-3-stuart.w.hayes@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250529202758.8440-1-stuart.w.hayes@gmail.com>
References: <20250529202758.8440-1-stuart.w.hayes@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Stop using an entire struct packet_data just for the embedded list_head,
and fix usage of that list_head.

Fixes: d19f359fbdc6 ("platform/x86: dell_rbu: don't open code list_for_each_entry*()")
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

