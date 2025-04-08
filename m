Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F419257AFB
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 22:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744151838; cv=none; b=BZ01keKaLJpKvBW0vOTaQtU6QchXcnvt/U/IVM+UmfEbRKKipmIBDcgV4sj4fuC2QYlNSPGipa0ZaWvXaFSpjezuJjrCyxvFzGI+8BRXe2HGs1H9m1LM5UOKjfHEbQTcFj29JoOXWDViN/s+Y0Nkl1gtJqxhYkTJN0gqETkncqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744151838; c=relaxed/simple;
	bh=9iwshM7hWyj+34mNfcFVZWAX9kiRF0QdbJ5coR1x4Z0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LbtRarhNA1WrDqU9L9elbP01+qqoHhppP1jhrZLNvH+4P8wZ26kb0Pfn5AiAF0EvTzxfkFCk3IMyTET6QyYLHmaAQuTvuynLZxr0qkGiMqXiNQ3HrPCJ8wCp3ugCCGTfPnLTAPRFqn0GX69eAH5mRbPvHhHXkcxskbKCtJJzLA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=IypTDVvX; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="IypTDVvX"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-736bfa487c3so5214386b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 15:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744151837; x=1744756637; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jxc+vuThRPlr4vVmJwstL+y+K8nrAD8PwkhX56e3dqU=;
        b=IypTDVvXNP+RNk0cvr0zujoPiC+iLzx1YmyyslsCgEGOnsy4OSrpPH/IYDHYj8yLS+
         3hHdH/p23NiBv5XaSG/v0nSjbyPKY2a4Mlu5A9hF3OE7U4jPtdGrm3gwjnRc1xIC/Otp
         VdJnm5c5Gm4qBX7WHwIHCSm4a23cbbbF5MS9cdtQfEGnG8jmMtXRtWYUkYGQMp/oejN8
         urKb8Vu5/fWE6GQnbRftZv/vpd+OGSDwooXKyXMOAuoj3Op7KriBRULMa1LUPf5pBUkN
         GNcb+LOB1peN7InuGjuhptaE3ijf/9JWjzgZ8IymDgTLskG+SBIaabuKhm6Tq55KhQVp
         XwJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744151837; x=1744756637;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jxc+vuThRPlr4vVmJwstL+y+K8nrAD8PwkhX56e3dqU=;
        b=MXbnH+tqh5I23na+Y0OxJp9XCPFiT/eLYSMwIXwxlHmxv7l94USJw/H5zFYlLjF/DI
         d7Hoxgk8GIuSbMD7vcsYfdF+vb1hUO2xgnaMf+ay2MYOCgDv4rr+drTJ9xJzHSG/2ER/
         3oXUv7L0vKw3FGFsa/hEbVNsI7ntqMCxzF64q0VKs2VKK8V/gabg+TQ/1DWyC7VIjrZX
         VVO1snfo72JXakp8A3dWXcXI8WlR+A7lZ+uvcA15TOpfc/zhC0daJsMsrvaKMuDmz1cP
         0DrT/meF5nwdmx148mm0cYlQ4FYRmmAbywqcC0AqwcwC48FpMihz/ZVW6F/3D4woH2wP
         BSzQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6F4oEOIFWWRZCxWg9F0/Zv4nZ8Mqd2g2ozV+EA/X5bfD2R6mTyBUxHoh6KmwF2Qu64EpVqMgnA3yeuUE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAI696IFj8xhdzAz747vSuXhrk6DTJUEfQhGANnXhNZAXcUUuw
	/qxOFXxCQ9psgjucDwyuaoE5pxFwGCDqqwQiAqvjMoRgEhalhiT5FpbHUoh/lQ==
X-Gm-Gg: ASbGncv9MvyZ7gc0PzjRlxMsGlpnr97jZ4jZmLlX8F0ra5vvLb/cJaarhmI8BqHDYch
	3uMpDF70UUyxcnVIoLQt0LMamdseKoDvYRHTYXEE7O+PuVJtwwM0ZOFx6sUC7u/6fOEubrzmr7J
	BFiCAZqRzQO3EaV6SCAfrUyd+yFqpiwvR2dk8zil4UExRD8i5iF/K6PIhsSPCLQ9G6Ilde5yvFB
	+cX7TLxalOczTMHUxclp1YJ/LwQLwlvHerCF6wmtInFmJvAFdlZDyjSVbRFyVEpGo3D+2v6RE1d
	j1Df1upnmw4aJxZ7ramY6UbqnL+p6Ct6WEnH1XKV5ESoQme5u5G0Pt1HTNMBFWh0J//Ss2F3ivx
	u/HijH/Mnww==
X-Google-Smtp-Source: AGHT+IHPoxf9asXBsP5DpMwhkaYv3aLdgjJ1ArC1Vg1k1/0iauyZJVN+qs3CvfAuWNHRW1id8Z6R4g==
X-Received: by 2002:a05:6a00:238a:b0:730:9946:5973 with SMTP id d2e1a72fcca58-73bafbc6a32mr234006b3a.5.1744151836772;
        Tue, 08 Apr 2025 15:37:16 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739da0e3745sm11527953b3a.172.2025.04.08.15.37.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 15:37:16 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 12/18] staging: gpib: gpibP: struct gpib_board_config
Date: Tue,  8 Apr 2025 22:36:52 +0000
Message-ID: <20250408223659.187109-13-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250408223659.187109-1-matchstick@neverthere.org>
References: <20250408223659.187109-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using Linux code style for struct gpib_board_config

Adhering to Linux code style.

Reported by checkpatch.pl

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/include/gpibP.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/gpib/include/gpibP.h b/drivers/staging/gpib/include/gpibP.h
index 82627ca838e2..c9cd1dbd7e6f 100644
--- a/drivers/staging/gpib/include/gpibP.h
+++ b/drivers/staging/gpib/include/gpibP.h
@@ -20,9 +20,9 @@
 
 int gpib_register_driver(struct gpib_interface *interface, struct module *mod);
 void gpib_unregister_driver(struct gpib_interface *interface);
-struct pci_dev *gpib_pci_get_device(const gpib_board_config_t *config, unsigned int vendor_id,
+struct pci_dev *gpib_pci_get_device(const struct gpib_board_config *config, unsigned int vendor_id,
 				    unsigned int device_id, struct pci_dev *from);
-struct pci_dev *gpib_pci_get_subsys(const gpib_board_config_t *config, unsigned int vendor_id,
+struct pci_dev *gpib_pci_get_subsys(const struct gpib_board_config *config, unsigned int vendor_id,
 				    unsigned int device_id, unsigned int ss_vendor,
 				    unsigned int ss_device, struct pci_dev *from);
 unsigned int num_gpib_events(const gpib_event_queue_t *queue);
-- 
2.43.0

