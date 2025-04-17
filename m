Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E8BE1F582C
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 00:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744849985; cv=none; b=Yjyog8YSUduNStH3ynl+zPXNiRN36mzj3UoD46N9iWRpLwDNYRP/YiNyX+QvdN4eDh8IUMrdTblU/HZklQF8qN8B523/DKS+EfldFaVOjvUEY4Yqp+zRIZ+uCjBA2fOZvBQiHTM9R6C0pDqRE7qW1Y3UXQvhmxa9jY0A4R6kODQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744849985; c=relaxed/simple;
	bh=WAFOP7FyG+vCwxVgewc75RXOWLLjybT3cMXA9lWbBzc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bwcY5prgHOF151h0lHaqNU40Cz6bsz1rxoiiPYj9QQG0LW4Pvpvn0kkCRUgeoRMNbuH/z1Gxd2Ajn3ezqsCQ7TGwvu9XJc53kbvYRja6ZozDs55t2yFg/3X7dJB/w9psv8v3MGq7Vfhjvq755/YQChppfl4acSOjYpwWzYflRSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=OHq65ZH0; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="OHq65ZH0"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7399838db7fso240639b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 17:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744849983; x=1745454783; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kcINWBx+JwvnujHkG7lIpftC3Iv5jwrdue9kd5WGFkA=;
        b=OHq65ZH0QTHdlaEKF5i8oVxmE9d7ehGKwDoM8B1g3tAO4CUNLrZs0fR98rtICeAswq
         gAN2GYj/h7sJOO9ga3cXbZKzL3tdfJ3iqHYSLJPBvWENVXKJerNA+47LuwLL095nlL6e
         bipb7oKtTlgybSnBCtPUxLtJvwtjRDU84hpv+tZXduaOQTR9Jzys+H0TDVQYpc/xjW9f
         5XvBZgm+v3HGxvovMnpikWP0CLkyuvk3r1UMIyzztBxpPbOV38cP5yqkwI+QqxCezQ+x
         vhLQnJhbeiRvGxkIzPJDYnkHfDvaQXElM6gYcu+lEMrQTMqFWgSKNjRQtigK2EZ2zKHz
         Vrsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744849983; x=1745454783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kcINWBx+JwvnujHkG7lIpftC3Iv5jwrdue9kd5WGFkA=;
        b=laSwkxqw1trIbSd09NqUblNCgBZ2EmKmHG5shaoIHRqWeThLPeXaeXogJeJWpoTphR
         cvH+hzs44O0HGPGrJP2BXttRACZJSW4TWEocaIkX0w2XKty/C0V5u9VDveyCurPIdmfM
         HTaPzaCVu3CZCWQXNWHHfkjWv6tnqDghO27+3QBcl1UhL3Cl9PD/BeUeuOfirDDnpUMY
         7Kws6QJ3E8gV60Vwf6h6H3g4cTOY/EdOuzbCIslCJuSwv6wdcEXVIHL/N1e2JqqP41Hx
         rtsKcrhI1u3HtLYE0rK3um6LG8fHriWViN1Y5es3HFwtE7wS3X1IuzIxSeTKC6hCYRhh
         zRNw==
X-Forwarded-Encrypted: i=1; AJvYcCU/gwyIyHoGmmoMGlhMp4f0V30dIX8CWlfxS9joOS7OYgYKYwNtSWU3+HripLDKfLd5UjPEUeR1865ixPg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLcb6V1zndXYoLTK4FwW3roG4ytdkrAD18SmRzP5ib+mfPTf7Y
	Q2E3eX+glPYW4EFoPAqF00p1niJ7hTh1B1UKpYdsZMHOiPh6YbwQgu7tQs3wYw==
X-Gm-Gg: ASbGncsAzDeaFDRWFk9tFo8k/3H7G3Ibx/ytVQGhFiCf2VsT/syDFKdkbUBRrXOuxfy
	IfSg7lth7Ty5Skt80S70vIb/f9a3iJLGApHig6n5vKLMikP84yRhf8wTp14NaW3WrNnBna2iav9
	TFm0Gz5mkloIAzzdYt9SidK9qXCQTSUE0/nAicKMrnnW82hWKWV/cXZrIm8ppbpVu4IOp8IoUgc
	IbvpMfHkZfM0InZpRAsnNyUeKOKMoMEu6lUv7HHZW49HrWe2HuaSk3DMfMTifGdtYH9jwuW3/by
	jzOQmCH86GACDb50nx7hBd76iUbsxvXLb+QKAUCH6e1+fgMexcvXy47Q41oJAM3E/9pTNgORexT
	FWi1DQQ==
X-Google-Smtp-Source: AGHT+IETqPQKTuoHKPU4diTn2V4OLI8GtL8u97Jm+3G8+M29+dG0rIaU6tVcrb5wpmPS8S0aopOucg==
X-Received: by 2002:a05:6a00:2e9d:b0:736:3ea8:4813 with SMTP id d2e1a72fcca58-73cf28f5917mr1082328b3a.2.1744849982712;
        Wed, 16 Apr 2025 17:33:02 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd230dd71sm11050075b3a.128.2025.04.16.17.33.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 17:33:02 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	dan.carpenter@linaro.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v3 12/18] staging: gpib: gpibP: struct gpib_interface
Date: Thu, 17 Apr 2025 00:32:40 +0000
Message-ID: <20250417003246.84445-13-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250417003246.84445-1-matchstick@neverthere.org>
References: <20250417003246.84445-1-matchstick@neverthere.org>
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
 drivers/staging/gpib/include/gpibP.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/gpib/include/gpibP.h b/drivers/staging/gpib/include/gpibP.h
index 3e21bb1a4297..6461b330a3c3 100644
--- a/drivers/staging/gpib/include/gpibP.h
+++ b/drivers/staging/gpib/include/gpibP.h
@@ -18,8 +18,8 @@
 #include <linux/interrupt.h>
 #include <linux/io.h>
 
-int gpib_register_driver(gpib_interface_t *interface, struct module *mod);
-void gpib_unregister_driver(gpib_interface_t *interface);
+int gpib_register_driver(struct gpib_interface *interface, struct module *mod);
+void gpib_unregister_driver(struct gpib_interface *interface);
 struct pci_dev *gpib_pci_get_device(const struct gpib_board_config *config, unsigned int vendor_id,
 				    unsigned int device_id, struct pci_dev *from);
 struct pci_dev *gpib_pci_get_subsys(const struct gpib_board_config *config, unsigned int vendor_id,
-- 
2.43.0

