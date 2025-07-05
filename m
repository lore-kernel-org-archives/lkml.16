Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9C44EED8
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 13:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751723981; cv=none; b=qg+qY4pRUdiWXd3a7ZSYE8BvJbPb3ilnd3VIUz8nRplhNbQkXvmQPxvi02/vxCS2K0kUE5AUMyW4nae6p9tEZMC2vAk8SClxn9RhfNK+qmEr2q8Cdsz2T1u3xh45jfCijeBkyxrPZv9rnIs/SeExW1HKNgZyP0Em4fS27h/8YKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751723981; c=relaxed/simple;
	bh=WTT2moJnrSiWrspMdz5rtl2hM3ZONm3G9g3fvB0VA08=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=h5NBJwFQJc5vjDwpBfkA/aSLaTAfxp7Knvp+hZV078/3hA34i8tNClfl12BpJg/KISCusReMHgJ/Oino7TIFJOnPAq6DS8Bm6/zY7PGpBHEmlVzXFl3SJRQEKebUH3UDpDlJo5I4YY0yilNkT+VTmAM90km12COeJt7xIqmflJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Edlr3LAU; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Edlr3LAU"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-453079c1e2eso1571985e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 05 Jul 2025 06:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751723978; x=1752328778; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CL2T53N7hQB4d6KaB7RoY5e4BOK52FoaK5MJcykcpAE=;
        b=Edlr3LAUuSQrNv1Q9bpF5jxC+bYHM0/BT68MZBbbdA+vUYaYbdfNnfkBotfHXrXb7K
         2HZP/0GOhDRvDm1wxbxTRLYIb1+/55AK9QLyfHZtjCTpSa31Sjti1k/v3yUCxZhQFJED
         6mql2Ci1uLfn+8fgkhHc0905quSxHceNHLAlui38XfxKXiQjNeVMEmL7TtAflR76tmzQ
         7nBwbwg8UpNTq2PCpH81+K2YzlaHRjeo4AjIKT5vI1E7E+JucDFbF/N9WkJoqo2yT/zf
         qlhbFO6K3EarJY+3MRK1t96tOM/Slkn2L3Qy8U3xqzfp7aorfQsmWndPmtZ5k8E2cmnr
         MELw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751723978; x=1752328778;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CL2T53N7hQB4d6KaB7RoY5e4BOK52FoaK5MJcykcpAE=;
        b=oVNVfwfYLZWg7m+21wBMOhHKXMMzfkKeiLVLbAMRHOu3f2m85FfhzZbU4iwFgbeh5+
         8cbNHbWeEB5IYXLKEmXomvoGXW/Hug85YxfA6P2ZMd/8ZttHS1oRhNM96BbU87NCD6vK
         JJ6xW/xejSKwE8rwrJGxjyt5i7YyWyp5TQVcx3LaLilSS+Bscn/E5fvRndLRwjaQjnCy
         uh7Qdng7EGt8bKAnox9HoKoAqAopVWMJWDL330ofDrUJaxCqX4IGiBQqopamG5Y4QW9J
         32ntgPMQGSUNS2RFCKkjGf1emrDws/5kkOKll4n4SGd/MNmdHl59KZ59NpzB3DBLWGz8
         YtLQ==
X-Gm-Message-State: AOJu0Yzh6mJEttvhk+Nrks19GogKDZrUcH01Hpbv0k3t9u2bu85tdNjT
	gJPFUAi0IfbE+FxUXoD6GE7EwapPI7hg1yRJEO4bZtf59rPfwJV75cnnhnnOmCiCEhY=
X-Gm-Gg: ASbGnctJtl/cq7P279HTmZ0zRcSP8ijf7AWa9HZ5hBC/8T1R6T8W3ucYPW3UP4QABRe
	E28ANcm/eEU+HJBX0XMAAxpHWxR1I9Rnen55jqTlBoSg22kjz73XyP7H0DOfULQof8Dx/2fR7RD
	thLXm1hBQ0gcP7XBZlAOgen6DShn3vVYnKa9ekcajJAsS7DhtIBMasdfDGXTvJNqedHxR+TILXv
	SyZTXmCYodmubKIYuI1NVoxfOF3lZ4V02cQMPNZwFVSOTTHzCNbEkE3OpuwjMFGBVExbC1vG79q
	zG4WalujkUiC/F7WWdkJJdVp5afpiRGCeayhg4M6oKjawK1zCvaB7FIB1qPaSxq2OpYGouZjfP9
	ar2jrdlds6CS/d3YCQdwOCnIWEae+IE7xKjTeSQ==
X-Google-Smtp-Source: AGHT+IHMT+E0wHTdv+YQi7h29CUEllexOuMS5Ew4K23tHy/GvGrQG5jpn21k8VifY9BnSK3SjWw7YQ==
X-Received: by 2002:a05:600c:524c:b0:43b:c844:a4ba with SMTP id 5b1f17b1804b1-454b35ff329mr20918055e9.3.1751723977719;
        Sat, 05 Jul 2025 06:59:37 -0700 (PDT)
Received: from pop-os.localdomain (175.77.11.37.dynamic.jazztel.es. [37.11.77.175])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454b1634b0fsm55384135e9.17.2025.07.05.06.59.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 06:59:37 -0700 (PDT)
From: =?UTF-8?q?Miguel=20Garc=C3=ADa?= <miguelgarciaroman8@gmail.com>
To: sudipm.mukherjee@gmail.com
Cc: linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	=?UTF-8?q?Miguel=20Garc=C3=ADa?= <miguelgarciaroman8@gmail.com>
Subject: [PATCH] parport: replace deprecated strcpy() with strscpy()
Date: Sat,  5 Jul 2025 15:59:35 +0200
Message-Id: <20250705135935.207198-1-miguelgarciaroman8@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

strcpy() is deprecated for NUL-terminated strings due to the risk of
buffer overflows. This replaces it with strscpy(), using the passed
'len' argument to limit the copy size safely.


Signed-off-by: Miguel García <miguelgarciaroman8@gmail.com>
---
 drivers/parport/probe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/parport/probe.c b/drivers/parport/probe.c
index 5d1b9aacb130..5f92f266bcb2 100644
--- a/drivers/parport/probe.c
+++ b/drivers/parport/probe.c
@@ -61,7 +61,7 @@ static void parse_data(struct parport *port, int device, char *str)
 		pr_warn("%s probe: memory squeeze\n", port->name);
 		return;
 	}
-	strcpy(txt, str);
+	strscpy(txt, str, strlen(str) + 1);
 	while (p) {
 		char *sep;
 		q = strchr(p, ';');
-- 
2.34.1

