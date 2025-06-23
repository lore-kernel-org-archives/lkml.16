Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A6135FEE6
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 14:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750687851; cv=none; b=GoZ1rE4lX0pY+L6TSuYs8YojKFyVZC9Vm/kWgjj/0LSlYm0dOdjtDMXwkauENrF1PbMM+ie395W6SViCOF5tPdo68Ho1YDmITh0/IUU9gWH6BI9xpoI3Z0y1uKZrbxkKQAA6rX0IBOvkjimXbpblFJHAe4NDBbn7tFgoNZklsnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750687851; c=relaxed/simple;
	bh=nIC8FW1qrw909l8wvSt3cY7s7lffa33yp1Dh6OvbuR4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XwV4L9sMw8OUhH2wpgAQARyaWe2mPO7qX5K9+jttQyelNm+Zt/gcK4T0Xxh5qfuveDTVAtza0pfS9BSlcyWPVmOc/YyyQ2VsAQ4pBGaoRM0g0vUP+gIYtFUGT1TJ9DvXNtS733AWXI6xQr3ClUkmxdVVPhF8HyRpGLn/L6uIqQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be; spf=fail smtp.mailfrom=hammernet.be; dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b=vZWa1JKq; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=hammernet.be
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b="vZWa1JKq"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4535fbe0299so22215145e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 07:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hammernet-be.20230601.gappssmtp.com; s=20230601; t=1750687845; x=1751292645; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Lcv5YPu7e8CB/TGgk0GJfc6Wc4FUmKBKEj6aqoim6Y0=;
        b=vZWa1JKqa/wYw/utO/1wjqGcZ4ZohAM8LZ972zak2/DN75RrW2rhCoPO3n8Dhiu3Zy
         L/VyAkn+ccsLLBJdVmK/tMV+dUMNMkAOQjN641JCdGGvZiwbGzSF4ZrJuzRei4iyFwDJ
         YP7XJfj0uar0AXlapnX6b+Wwe08i9z5/yWX1zXtdrMWG1kiYQPu/b/i5NibGYccakKM/
         Y1WEBoEiBJHEzSJ06Z5uxJOKAyVlmkBu5xF+8lhZHHFgjgqFb4zh8apGpBCbtr8Orbxv
         RKrLOwUpyY5d5hS9Jp8StbfEJc5D8zX94LUUBE/kxYa8QlAo4ij/OQVd2481Z0dnDXJy
         LRNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750687845; x=1751292645;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lcv5YPu7e8CB/TGgk0GJfc6Wc4FUmKBKEj6aqoim6Y0=;
        b=RMW6uunaLY2biJYaGkxBJsXj+PSXM6hPS+peWuYX25OphP0j0GN+htYvTlk5UR3PhA
         bBDn0c+2RDqJfqHYotxqgQ9viOYkSGfTlnyjxb1dkKYfHbmkyGSmlUfzbb3Jx7lVDjip
         eR6OnNRcIqj+SmHNyZu2P8F3TH4wMwePwWSO9DsjN0YyCuVLblZFS/ZWGoirCXpdnkHh
         zZ20pqyyjRxo+gomb3p9otOhKYAgQNLvu4mFYjURJseOFlGaRKQMDdiRXE/zjwQ3iCUs
         qOHGY5vt/ay7a5rOk7ElBFWkZWM3jgaAapOyTEu58J1j4NqSBCvRd9zJQg3mrNuTjYYv
         FEjg==
X-Forwarded-Encrypted: i=1; AJvYcCWDkR1ltCmYIi/spjoJn7pBXbPVSJiva9JkuzaEkG0kzIWn7eSkVFlqG0/GjBmz3Zwkd6wTMD4huAbFPrA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFjCCkYwQyQ51I0oyol/8hdp1G1zxRFaJemCJ6nbUNNtmeTs+f
	UezyHvvF4ubf+f1kvTcBJQ04NPPyFL5YANUYcagSNNbVFxRZSwvygkKd8jif0e61LqU=
X-Gm-Gg: ASbGnctWOdUtVXEiLXj/Dtx0VyYPlrPcbMSS95ttSMKNe2f0Zp93uw/RsfUz/5R9XYT
	iwJy3Lo9fm5w5E3zdLQ2no6wr89fcte/J+qnDJOBJl4evKyKqb5+M1CMwZo70geRtYU0O7jbTBP
	aYY8VjgnF9eLtynS/XaH4RefQzHQi1VnVwfJRauqs8pguWo8mJ3KY2NnQvQc7lvWpKUwR5XG92N
	N1HAerKPhsOvSfw5UlgZwC7rH+GUY4E+rQN1nB0vb6uk8xwXMMnec/9BBGEAbBU+tp1mKOQmyTZ
	+QzYyLz1vZf7EHz6PTzjKChG4pUWovROS8LtPcd3PMChCvt8xlXWIcsGwwHDcXjjA3mOhnafc4l
	VzEDUKKVvuZO3/0ZEOunXHJR4
X-Google-Smtp-Source: AGHT+IHu8ThU4fWbJ971kUhXyTgqaaI7W/xvc9ZVSFaTQKtizCrSIiXqe5WNuEKSna35IWIMP6agnw==
X-Received: by 2002:a05:600c:871b:b0:43c:f6c6:578c with SMTP id 5b1f17b1804b1-453659d0a9bmr130173895e9.15.1750687845066;
        Mon, 23 Jun 2025 07:10:45 -0700 (PDT)
Received: from pop-os.telenet.be ([2a02:1807:2a00:3400:8310:8165:973c:45af])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d117c02fsm9695584f8f.50.2025.06.23.07.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 07:10:44 -0700 (PDT)
From: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
To: stern@rowland.harvard.edu,
	gregkh@linuxfoundation.org
Cc: christophe.jaillet@wanadoo.fr,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
Subject: [PATCH v2] usb: ehci: replace scnprintf() with sysfs_emit()
Date: Mon, 23 Jun 2025 16:09:50 +0200
Message-ID: <20250623140950.61568-1-hendrik.hamerlinck@hammernet.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Per Documentation/filesystems/sysfs.rst, show() methods should only
use sysfs_emit() or sysfs_emit_at() when formatting values to be
returned to userspace.

Convert the uses of scnprintf() in sysfs show() methods to
sysfs_emit() and sysfs_emit_at() for better safety and consistency.

Signed-off-by: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
---
Changes in v2:
 - Removed unnecessary curly braces as per style guidelines

 drivers/usb/host/ehci-sysfs.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/usb/host/ehci-sysfs.c b/drivers/usb/host/ehci-sysfs.c
index 8f75cb7b197c..5e6b545c30e6 100644
--- a/drivers/usb/host/ehci-sysfs.c
+++ b/drivers/usb/host/ehci-sysfs.c
@@ -12,21 +12,17 @@ static ssize_t companion_show(struct device *dev,
 			      char *buf)
 {
 	struct ehci_hcd		*ehci;
-	int			nports, index, n;
-	int			count = PAGE_SIZE;
-	char			*ptr = buf;
+	int			nports, index;
+	int			len = 0;
 
 	ehci = hcd_to_ehci(dev_get_drvdata(dev));
 	nports = HCS_N_PORTS(ehci->hcs_params);
 
 	for (index = 0; index < nports; ++index) {
-		if (test_bit(index, &ehci->companion_ports)) {
-			n = scnprintf(ptr, count, "%d\n", index + 1);
-			ptr += n;
-			count -= n;
-		}
+		if (test_bit(index, &ehci->companion_ports))
+			len += sysfs_emit_at(buf, len, "%d\n", index + 1);
 	}
-	return ptr - buf;
+	return len;
 }
 
 /*
@@ -70,11 +66,9 @@ static ssize_t uframe_periodic_max_show(struct device *dev,
 					char *buf)
 {
 	struct ehci_hcd		*ehci;
-	int			n;
 
 	ehci = hcd_to_ehci(dev_get_drvdata(dev));
-	n = scnprintf(buf, PAGE_SIZE, "%d\n", ehci->uframe_periodic_max);
-	return n;
+	return sysfs_emit(buf, "%d\n", ehci->uframe_periodic_max);
 }
 
 
-- 
2.43.0

