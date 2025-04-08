Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051B22550D0
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 22:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744151118; cv=none; b=grJHVbAhq80Nx/vsmk/A6SozbAdZYCnMvP9bL0GSf4oU4Ie5wIMKzojVZFbAwdb9/Z8N85vFI3w1RJG4s3ALhC6KuFL5sD3Tdevc+46kwAGmMhvmwh3PFXukwoGJER6u+OoJfhIE9uM55nHI6V1f/7afWZJOOmokvbKNuNskrno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744151118; c=relaxed/simple;
	bh=9JfNG0tTkd+044z4jFaJqkunmng+TdBPIb7IlEomLco=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jdzmJe8ECJ1xmO777MFaYiHTVXyBnCOJhM5xFFM4DiXEU8217u17UKQiU3Un9yw3YDltP858YFwhWzT9IuUQuUObHZS6L+uTOEDWTsEvKYkIuPc/ebZPl5QVH/4v7qqdV+yz/7ZfrE1w4u+/miEf6Lemk2M6MwuYDio85tiPf6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=mF7qoPvh; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="mF7qoPvh"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-73712952e1cso5644242b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 15:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744151116; x=1744755916; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8IorxkgKO3HdtKHUOTo23PvfS93pIvPvComCrtQir2w=;
        b=mF7qoPvhQnDH2Ur33xzZEZQNO3tYt5BR9k/SR7+0/s0HfrX5ju3TINHMqNEgJAOg/0
         4Qv6DG2PmMZggcV5BupXffSc5ehWSpielCoR3wEMNSl9ZbzNM96lt11zrQbZ3URyxZku
         nVsZcns8pIjopPb087ADqlavdNDY1otClXnCSYGrtPNEEu84L+okbq5hEdduy1zIMcXN
         VUAwZxz8NhaBuWPTFtxCUtWCsSk6TOZ9fE5FKiS6Drft2IXQkUEgwhvkbpeWEaDSnxXz
         cokX9YMyDnJ5j9P49UM8rAn7XJbQ9SxcGQOiKfFt4+u/tHNLgiloMtTcAL4OnRR8U/2k
         ztPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744151116; x=1744755916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8IorxkgKO3HdtKHUOTo23PvfS93pIvPvComCrtQir2w=;
        b=HsDmguTOCQFQnmtf8QvcIpY91e5+m/QsGBU/FwNwFhcxidVTUUM3EJye+VzZ0g85F5
         f7eNQ25QQlQs9f7y3p/IV2HcBsgM50uvzQbwqtUbf8XwCu12R3AZTvVVRkvIwb2NCTv5
         RXg1ObGYHuN8fssxkVUeFDVoyugopKTUampg/QKUW7f0KIV+CXsqGvfAWl25JPCHYree
         /u0CdZhebW+Kjir5m4ZAUb0bHt6wU4nkCeHQ7KmLH6aUrIFwoDRZp035ycOnLAmvZocq
         JmjAbqmI5XPcEG2oBOJYbx2MyA+gGxDq5a4uPVdiaRaYHH++lP+EiKbYlLAS4+tejGTt
         4nSA==
X-Forwarded-Encrypted: i=1; AJvYcCXH3qGbREoYkRBa5av9UahAvXfcwpAah506i6AIVW5PSbB33VJ5ExdSUxeBP1D10m/L8IBCRqVAorF0XVA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8Y7wOzV0XDdgowXFtAzY8kB/MfnNLyayodwAfNxDJMQvwTrxT
	7/xuZvEjURSQAHxO/Bh72OKqHFBvp/xNvvyh4vWOkEy88iJOektLDnpXH1IdQg==
X-Gm-Gg: ASbGncvBjEU0N7QRiFZY9yPOrvp+asjmTkHnTE3YNE9Tjgb/auw21sfaOuPEF0YgUBi
	ZRCN3Clfya48Qo2i+VQbWLiKP3FMHDWUiOnInH6w9kreixD+v/mq/e6AQRGD8i5xgbFfAjZ1X56
	uQOAcd+PX/lBzQEDnKRKc0GT67JNdJHodOVVi3PaTePBZw4bG8bd6AZE4pZTnh1X6eBa1ifh9b0
	4Thy1QcaOKuirZEYXmHZC/EbV6jhzBtYKWyCnB+bYdHEhZnOY4n262XxQsCdMWl8zltbsBVOucM
	Nv6GxfBhHRacAhskmh+qy52g0RR+40YBLyAisIutqbRqkCObLOSc0QqGrtP1ZqvjiILRn4BCk5v
	5Krwk8vwj5w==
X-Google-Smtp-Source: AGHT+IGnaxbU3fKPUw5RdhpztQ0HR7stoYxmD/se0+wQgNf+H1qiPEO5WKH1/T+a2ZSl51CROOyq0g==
X-Received: by 2002:a05:6a20:c992:b0:1fe:90c5:7ceb with SMTP id adf61e73a8af0-2015b00eff7mr182726637.40.1744151116304;
        Tue, 08 Apr 2025 15:25:16 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739da0b3f5asm11475713b3a.131.2025.04.08.15.25.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 15:25:16 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 06/18] staging: gpib: common: struct gpib_interface
Date: Tue,  8 Apr 2025 22:24:52 +0000
Message-ID: <20250408222504.186992-7-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250408222504.186992-1-matchstick@neverthere.org>
References: <20250408222504.186992-1-matchstick@neverthere.org>
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
 drivers/staging/gpib/common/gpib_os.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/gpib/common/gpib_os.c b/drivers/staging/gpib/common/gpib_os.c
index 711e99b1581a..940ea05ba478 100644
--- a/drivers/staging/gpib/common/gpib_os.c
+++ b/drivers/staging/gpib/common/gpib_os.c
@@ -2024,7 +2024,7 @@ void init_gpib_descriptor(gpib_descriptor_t *desc)
 	atomic_set(&desc->io_in_progress, 0);
 }
 
-int gpib_register_driver(gpib_interface_t *interface, struct module *provider_module)
+int gpib_register_driver(struct gpib_interface *interface, struct module *provider_module)
 {
 	struct gpib_interface_list_struct *entry;
 
@@ -2040,7 +2040,7 @@ int gpib_register_driver(gpib_interface_t *interface, struct module *provider_mo
 }
 EXPORT_SYMBOL(gpib_register_driver);
 
-void gpib_unregister_driver(gpib_interface_t *interface)
+void gpib_unregister_driver(struct gpib_interface *interface)
 {
 	int i;
 	struct list_head *list_ptr;
-- 
2.43.0

