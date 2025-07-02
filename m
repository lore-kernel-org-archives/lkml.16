Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F3B13196D8
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 15:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751471526; cv=none; b=I+ZzOpIyFlKCsck6hcHjfjlzU4pTiOFdUc9Mm2NnPzQuQv+QZ8KFQkXTEWdZ1CpQkDRlHWiYFet/YGRHPFgo0tNtlfq6kRz5Xjt0b/gS8w/ru7udT+AKyqmJDhzHMzxLVkIiY/y9EYlKQj8polYVRO9x46Jg6FWaJ4kw9nolKjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751471526; c=relaxed/simple;
	bh=NS3AsNMLrENn/8Ti0YYvu7N8hOzTOmgsWmxaUEYudV8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Y+YmuQDfJuD2LtyVnR347KPYFoz1hdom7I/yWfKNLNMV8BxGK6flps3khnD7PCWw9Bzzq2+w978YmjQNdQiK3OG2RefIqZjHT7mIyBWHoTcVLt/+pPh9m4Lt2va/EwYxTYCJzOp8G2XbSM0ZCSRhlJ+do+01k9Cf8sVD2aStNAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=SaGyCUyM; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="SaGyCUyM"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2369da67bacso7275795ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 08:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1751471524; x=1752076324; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6aDzf7YBPMHw9MxikxyQTBYHEWprSFyhpDaUPtjmgAo=;
        b=SaGyCUyMIsg2HJmDVNBGyLRpY1Juq8AtaSNG7xK8qAlhnUWoOCSk9ZK8aTyifhvKcH
         c2AcfTC/C62s+RckcOz462lkaEftm41+UMYePsOmPIXLPWLtFNcEIr80PdlMbDVYli4W
         e2HVbHV4w12e2TdoqN9WWJbtme83wM+zBKoKj9gUtmWriLaNhvzM/3cEwIaOsAlSnZXi
         g2PyyrZpiMEkPlywPCY3/M8uPo1kttSdD5MHTjEVlvciDaCZZpQr6YBTrxnHqKrySfA2
         kL0KrHXjv+W6ebEgYD2kTTOq8ccbwuj5WthpnsADUpD6Rt0yJILNpMKtngOcUULYfkut
         mF5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751471524; x=1752076324;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6aDzf7YBPMHw9MxikxyQTBYHEWprSFyhpDaUPtjmgAo=;
        b=YZxtqRCfW16+RcQdmeNyY9xtufCSKkFWpDJKqmQcxAhleaOKCtY1IP80MdT/IWmeuh
         8Z79CMHCc+f4pfyGUl8PkIAoAXJkYP96WX4n8IbgzksdNih22AoysHTFsF4SzHt7ppK3
         qOmo8mNElzRNxKrTTAK1Dk8CftT6xDOJXPtoRbojLvj0Yko5b7ZvO7TJ0mrBHsKrt4D8
         ZB4pq9kLcBjSiAx36JHMY/yXz5ifLIqm3S3LMyQgkybItVC1mFIhrXX6MpNEWV7uWc1q
         ar/FjlaMpvgiXm/yHKxxkytl/PC3Gr2bXuWJGgWXrfiI/1VqBCpG41BbNQ2DithUyRlK
         oKuw==
X-Forwarded-Encrypted: i=1; AJvYcCV15nJR3mPTHrvdznj+v4KiNMIg8f43uk7A8UXA+0HowvwTVZKZ2eTcsdSEYa/uEhfKfw7LWWmWdw58grg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHok/t+jh2bPaObYpLeRYmwREfx3VpMEJ1RDBLHqbwlZOfASXR
	6fvBNUSASOoIINNphHoZQcVjDIZnzr+5ebURis6YGnRpRwnOCY5UxjpZYHqcZSWi8SNtCrzQ4+p
	Aw6rVDG5GQ9Yo
X-Gm-Gg: ASbGnctt4wkLiBMWOdqEfhOBzagxhzz2m8Wh763d8NKw315x5xYm8uUpofJAbZV5JRb
	eknKzfLy2C1cm8kpszRpTDHejS2MsGXW3u6q+gqKbwTgJclZHi6HZl+peSrPqTsaJNifKHoTmKH
	96rsdBrmkwAjw7xM1CiJ9TlgPOgqiOzUOFRCoMT+zvp7Uql2pKEZoMJ7Kp3VdtEU2c9Rx0DY6iZ
	s35NTEspy+5RAWJKFXlGaElPKR6SjBGG61t0lEnfqZjpXQZmayVEmx3jLfqzLOUKWvcgtjSfnBE
	Av6t1qBXisKuMOwPQBW9iq15f0/pOoLHU5tgeHZOx8LGpqQcL0TYQ1Fz1qU8M/NyjI8tjz3KW9H
	JVA0yHVqDzLBiPw==
X-Google-Smtp-Source: AGHT+IG02N5Y3edvLzg/WYRMS9y/CsAqRcEkmhKjkUGNF7Bn/WzxbIB3ur8dYLHniUlWdlu646e9Dw==
X-Received: by 2002:a17:902:ea0e:b0:22f:b902:fa87 with SMTP id d9443c01a7336-23c6e50f04emr18085015ad.10.1751471524291;
        Wed, 02 Jul 2025 08:52:04 -0700 (PDT)
Received: from JC4TPG1F9W.bytedance.net ([61.213.176.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb2f32a3sm130952795ad.87.2025.07.02.08.52.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 02 Jul 2025 08:52:03 -0700 (PDT)
From: Shuan He <heshuan@bytedance.com>
To: bhelgaas@google.com,
	cuiyunhui@bytedance.com
Cc: linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	heshuan@bytedance.com,
	sunilvl@ventanamicro.com
Subject: [PATCH] PCI: Fix pci devices double register WARN in the kernel starting process
Date: Wed,  2 Jul 2025 23:51:12 +0800
Message-Id: <20250702155112.40124-2-heshuan@bytedance.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250702155112.40124-1-heshuan@bytedance.com>
References: <20250702155112.40124-1-heshuan@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To avoid the double register of pcie device (otherwise a WARNING will
be triggered), two more steps are added in the pci_proc_init function.
1. The pci_rescan_remove_lock is held to prevent the concurrent issue
with pci_bus_add_devices.
2. The PCI_DEV_ADDED bit is added to dev->priv_flags after the device is
successfully registered to procfs.

WARN Trace:
[    0.518993] proc_dir_entry '000c:00/00.0' already registered
[    0.519187] WARNING: CPU: 2 PID: 179 at fs/proc/generic.c:375 proc_register+0xf6/0x180
[    0.519214] [<ffffffff804055a6>] proc_register+0xf6/0x180
[    0.519217] [<ffffffff80405a9e>] proc_create_data+0x3e/0x60
[    0.519220] [<ffffffff80616e44>] pci_proc_attach_device+0x74/0x130
[    0.509991] [<ffffffff805f1af2>] pci_bus_add_device+0x42/0x100
[    0.509997] [<ffffffff805f1c76>] pci_bus_add_devices+0xc6/0x110
[    0.519230] [<ffffffff8066763c>] acpi_pci_root_add+0x54c/0x810
[    0.519233] [<ffffffff8065d206>] acpi_bus_attach+0x196/0x2f0
[    0.519234] [<ffffffff8065d390>] acpi_scan_clear_dep_fn+0x30/0x70
[    0.519236] [<ffffffff800468fa>] process_one_work+0x19a/0x390
[    0.519239] [<ffffffff80047a6e>] worker_thread+0x2be/0x420
[    0.519241] [<ffffffff80050dc4>] kthread+0xc4/0xf0
[    0.519243] [<ffffffff80ad6ad2>] ret_from_fork+0xe/0x1c

Signed-off-by: Shuan He <heshuan@bytedance.com>
---
 drivers/pci/proc.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/proc.c b/drivers/pci/proc.c
index 9348a0fb8084..6506316c8a31 100644
--- a/drivers/pci/proc.c
+++ b/drivers/pci/proc.c
@@ -468,9 +468,14 @@ static int __init pci_proc_init(void)
 	proc_create_seq("devices", 0, proc_bus_pci_dir,
 		    &proc_bus_pci_devices_op);
 	proc_initialized = 1;
-	for_each_pci_dev(dev)
-		pci_proc_attach_device(dev);
-
+	pci_lock_rescan_remove();
+	for_each_pci_dev(dev) {
+		if (pci_dev_is_added(dev))
+			continue;
+		if (!pci_proc_attach_device(dev))
+			pci_dev_assign_added(dev, true);
+	}
+	pci_unlock_rescan_remove();
 	return 0;
 }
 device_initcall(pci_proc_init);
-- 
2.39.5 (Apple Git-154)

