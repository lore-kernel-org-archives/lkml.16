Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44CF924C073
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 20:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744836143; cv=none; b=SRYmUeSw8UAK0ddbpTXn6V7Kq28Rhrp7JXN5ll4ogA8Be3qnVs2vyw7AsChNymnnX4UccetJdVgrTvnMaVKLthUSyetTEBa8hG8MMCpNZqqhOIAc4xAJ8elrpb4f79/aUBwzLkiiRIsoR/kTbAh7+ihryhM5V+hRXF/8CKL6/H4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744836143; c=relaxed/simple;
	bh=vpnZ+9dRThyOfcFKpNcoiQtRcM2q8nmnRlwHdTw3Zrw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LoD+C9npNgglCDZxOPqlv+LxuW4AQb3hsobtP2nvyWIQtc7eBD73bE29VTrlErkgTj2h3x8vWUA/ADE2+1RxBkovvQtdzKqTsryHkoTC9NhXuwGVDqNoHZJHy7lDMn4C6ExjyIj3Xv3fB5hCOGOgDKWfQ/BF4kM4E63SWYCSRAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=DSHAMLPn; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="DSHAMLPn"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-736b34a71a1so40579b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 13:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744836141; x=1745440941; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H+0BcBKraYAKcBr0ytrcRqedIgRXL4U/FszO6yDuzCw=;
        b=DSHAMLPnYIy1CKYPJMkP66bOZtNh7Wu771brezbLGhe7HTvp2NQf5s6fLXDio3l8G3
         yxTW9l/fYOBHqHpVAwUVwri6wduER+8N0EvhrLCYdgmcQffAveTJ/O0vb2RfpqNv2yjt
         rAGq44ORWVeSyA8HN3jQiCMDh5KRPTn3arCn622fjL++BJZTCl/SRqb/SEj+sr9ndhd7
         lnGqrmzvExVNpotF33OAe2YtOTXdvFU08UBTFXJB8RwDh3NEG+00T9CLzF52awJaY3/D
         vrJA6DxVsC/vVGtsX4xuqhk1M1WAca9twAirv3XUGmC5dDEUhjxUklN1OkgfL2ec25QJ
         acYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744836141; x=1745440941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H+0BcBKraYAKcBr0ytrcRqedIgRXL4U/FszO6yDuzCw=;
        b=Czd19g9PJxsoSruneYbHfUbniApo+CUFRAtANATNEDit+LiNlZlDTDIdwc51EjPQ+z
         GBwY+/B9BnctEiOJL9PfR0dkrztgynrf5kI7vnxOvbu6WWehYe/kVX9y6UDreIwqRrfx
         E53CbYuuRxTvyHv/IKuYHQ68Eu75Rg1pFiOB1s0HWd+mKber4zbibrD4ypSxr4bQyjuY
         WSIVQ1WyKyZ1pouSxr8kpDdx85s1dbiIfE6durcisIO7gnrKwWjKAL3PfKAVTyUbFnYF
         EY2ly9U2Ao5TXN6pPZQS8vMAzU19dHcD0b3xV4U3DujzzW4EPWV17INA+sdd2KOEV+1Q
         +thg==
X-Forwarded-Encrypted: i=1; AJvYcCW0I6mFC962nlNVDzGjm6sFSdDuxRv01NfEoPkDk1CqptarmgJPGM8AXdlcYxKYVNBDZ8id+stK0gwj8yA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyiPpb8MWjFOEm5CEizQsrfP7yippfdvXTd6xcowKkgWrqo7f5e
	Ziso+ek3V4XMNSjXK4F2SoqdFETtrOXjmtWKK8oMxyOLYmoRasAX3ntfgP4v/FCYb4vxGxeE6PY
	=
X-Gm-Gg: ASbGncu4W1u9V0zVk/x1gsOqA596xZHhuZkAFxOIH6NCIFoHmm7y6fcAAFOnw/G7j9X
	4rnQ5C9rJ0k8kGbNQErUo6mGi0bmmj6MJ45BBmeNUg+e/VTH7DukBJmOAIUpk75BfGlPWlrym6M
	aSHoIrAdCfD04A6JTWB46p2HlusTq/iQbkKJRXZPb/I6FX+rgf8EAIRhPGpTn/SZwirwENclSF+
	4ymR7pyuKR23kd9XfRo0wt0YPdeG5OszV5JFhvLyPDdzrPmYDcY/BfwwzTX9Tky90HINebcxt0G
	A9HSGvFx8fqC5qAV26y+0kDr6a4VlCiW9NmNg4bWcYwW94ZzpsqQC9cLeYBkQA6POHmKk3p9e2B
	IZbF6BQ==
X-Google-Smtp-Source: AGHT+IGVHaELi/ymBqdRjMjhCHOzlwZfRpH38TtbAdlJ/JymhlbtOLQHLDNlAtUP22sRedK9eA2XLw==
X-Received: by 2002:a05:6a21:9209:b0:1f5:5b2a:f629 with SMTP id adf61e73a8af0-203b3fd5e27mr5244835637.30.1744836141677;
        Wed, 16 Apr 2025 13:42:21 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd21c3870sm10767839b3a.48.2025.04.16.13.42.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 13:42:21 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v2 12/18] staging: gpib: gpibP: struct gpib_interface
Date: Wed, 16 Apr 2025 20:41:58 +0000
Message-ID: <20250416204204.8009-13-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250416204204.8009-1-matchstick@neverthere.org>
References: <20250416204204.8009-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using Linux code style for struct gpib_interface.

Adhering to Linux code style.

Reported by checkpatch.pl

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/include/gpibP.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/gpib/include/gpibP.h b/drivers/staging/gpib/include/gpibP.h
index 3e21bb1a4297..bb3c4fd5ea03 100644
--- a/drivers/staging/gpib/include/gpibP.h
+++ b/drivers/staging/gpib/include/gpibP.h
@@ -18,9 +18,9 @@
 #include <linux/interrupt.h>
 #include <linux/io.h>
 
-int gpib_register_driver(gpib_interface_t *interface, struct module *mod);
-void gpib_unregister_driver(gpib_interface_t *interface);
-struct pci_dev *gpib_pci_get_device(const struct gpib_board_config *config, unsigned int vendor_id,
+int gpib_register_driver(struct gpib_interface *interface, struct module *mod);
+void gpib_unregister_driver(struct gpib_interface *interface);
+struct pci_dev *gpib_pci_get_device(const gpib_board_config_t *config, unsigned int vendor_id,
 				    unsigned int device_id, struct pci_dev *from);
 struct pci_dev *gpib_pci_get_subsys(const struct gpib_board_config *config, unsigned int vendor_id,
 				    unsigned int device_id, unsigned int ss_vendor,
-- 
2.43.0

