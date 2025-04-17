Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F49E1D5142
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 00:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744849978; cv=none; b=vFi8ea5+SEIkIdqcKiAU1b8e4bsdxS2RNTkFG5QSDVZ49gV7sqrLV37A8q9H4jYWFnBlQJzWXRhFCDqCaoDYI2GaHsCashPa1kO0F88+bq8fXalOvu86zOaORR1N/6QQ9hRTZX1X2npNscxkcfs8v8ab1Pr2C0C5QUREySprPRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744849978; c=relaxed/simple;
	bh=RSie0nXMjQWozJafxINypzZFt8eO2DZf7eBuhaP0m3w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YVV+Oa4BnCvWMrGFnNa+fEu39JK1SCM7Xbe8VUCNaG8uokBRXUrVk2X2Rbw5ZCzJQPmJ7AxavnaQMZFk/fkPfWgR4GEVISCsXMiLrMa5x6i2cJJOCzyNrYdJBE0m/ztnjKY+GhxXi7fEut/qhtFBkU6ivtd4G46z1apJI0+sS1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=V2re7tv5; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="V2re7tv5"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-225df540edcso14762865ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 17:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744849976; x=1745454776; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4KbTAU01u2d1Fyhrvlbrvk8qe32/1uE4Mm7IabxHd+o=;
        b=V2re7tv5MW+Xpytwro54VFKHa2AGbXsLTnyDDFyhVxSoRDUT+Jva4tbNBp8pVITrbq
         M4Lq8daObpSLq1U38KVWAg7t4HtAlxlQd9Xdq7/OAfWLKevmlT6oWpHb08ejJAV4LFOx
         hOixttscSX3MYH6P36GHo5HEHWc5edcPhdll0rkm3FQ6A/Qbzl+uGoEsEa5lajGld5KF
         Jwn0jlNC6ux/PN/gI7TeJFx15TXznph4Os8B6dqp5JrTQG23kShDPGSuHHShzR9FWEJs
         5gHCcWSJfKkrdPC0RzbSarj3v3sNoVdIf/+SCDyosWEMfTZQsoZv8/lzPuIx/QWi0Onf
         DEHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744849976; x=1745454776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4KbTAU01u2d1Fyhrvlbrvk8qe32/1uE4Mm7IabxHd+o=;
        b=d/X0ZpTaTGhxFzTanHs+Hkbcxc+LXvmrVMFvx4oYYrpLzkAMShp/yod5LWBW8OBf8v
         Q1VbSTVNgcI24wgaLhzGjo3Nxo1hQLx2ONRp6eNzdtIoJI2+f/Fg1WSk9vzZ4k93eeUi
         iuXFmGYnLd6jNsVPd7UGUEp9hfvm6HNFhK4aDJ0u/Pgi6m84JzVxc5jprJDz24Ur43aY
         o6RXBwmc8UpHnzVRk3AWejYbz/sKRrf1BjwOzMN51egeqt+Dq9DEL010lcYyCIdAxnbL
         SYxmlkMA1k0OtF9+Fq8jpqQ7yZwqtSXKECUohm5LSKkJmUGydJT3jceQtsQ933DimzJJ
         S7dA==
X-Forwarded-Encrypted: i=1; AJvYcCUAhCMDUGaVZ8Ef4+FhcZTJVDPXeXzkDs2MHlYaMwVItYRBGwE46W/H918jOan+agMDvqXwD3QuHyWYH7M=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLPFSEYAcfUluhJNQmnUR6boKh6iHnnSXgPCSaHfJYsODNob03
	MsiNk8jMnPt7A8nMcaxwmDe4hSz3ovSt+D4xS46vLF1KeDYxiC+953g6dm5P0g==
X-Gm-Gg: ASbGnctVdx5kJk5AqqPy+wUWO8hHCMuwfALKwEPdpPvTc5q4/69ddJQ2J+tyMRk5rCF
	25MzFuPB84xesCDxJ+xXGFeVV/2NdkvMrhMnXD6gfwMK/ILv3bmbmkvYALHIL2wJ9XUMZHaybc1
	YBwA4vvIFpJOdxSKEOAtU0jeDtyWKFa+dOUiJEP/oYBy+23KKdfCf3Gqz4l8gCce6JX/66ZtSaJ
	+0Ydic64Alc4XggoZzMBqa7oHLTBPfQV7Xqa50nwSFJu23zB2ao6TXcRozM1xpoaL6A6vom8g+8
	b7tOee8LkAQjQZHdsRVViRVa1psMykB6dsFuH9iHVsUWb7xAcrV43wKRN9ptDD3GSvY0/reGlp4
	J9WQ5ow==
X-Google-Smtp-Source: AGHT+IEcWsjwkmEqreAgK2pRvl/J7AlkiLFzOj18jVxrfcqpZ/SNiQIRA61+XUt96JpZw8TvxC8aAQ==
X-Received: by 2002:a17:903:1aa4:b0:223:3eed:f680 with SMTP id d9443c01a7336-22c41a3f4d3mr12051875ad.18.1744849975707;
        Wed, 16 Apr 2025 17:32:55 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b0b220cb76fsm1564843a12.30.2025.04.16.17.32.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 17:32:55 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	dan.carpenter@linaro.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v3 06/18] staging: gpib: common: struct gpib_interface
Date: Thu, 17 Apr 2025 00:32:34 +0000
Message-ID: <20250417003246.84445-7-matchstick@neverthere.org>
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
 drivers/staging/gpib/common/gpib_os.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/gpib/common/gpib_os.c b/drivers/staging/gpib/common/gpib_os.c
index 029590f95fd3..87329d35ca47 100644
--- a/drivers/staging/gpib/common/gpib_os.c
+++ b/drivers/staging/gpib/common/gpib_os.c
@@ -2038,7 +2038,7 @@ void init_gpib_descriptor(struct gpib_descriptor *desc)
 	atomic_set(&desc->io_in_progress, 0);
 }
 
-int gpib_register_driver(gpib_interface_t *interface, struct module *provider_module)
+int gpib_register_driver(struct gpib_interface *interface, struct module *provider_module)
 {
 	struct gpib_interface_list *entry;
 
@@ -2054,7 +2054,7 @@ int gpib_register_driver(gpib_interface_t *interface, struct module *provider_mo
 }
 EXPORT_SYMBOL(gpib_register_driver);
 
-void gpib_unregister_driver(gpib_interface_t *interface)
+void gpib_unregister_driver(struct gpib_interface *interface)
 {
 	int i;
 	struct list_head *list_ptr;
-- 
2.43.0

