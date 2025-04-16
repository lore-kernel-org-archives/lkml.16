Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 223B2247298
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 20:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744836136; cv=none; b=fzhB0F3TwCKRxh6Ojlrr0JUgSdJjljwMC3SfXTmS+6OpYGKj45XrBPwGDal5TlvzI/UQrQMccDDeBPvlkhkgqS8QY2ypwRP7BhtVGBPRfanCawa0pHqvAADCL4AL0oK8yjzw5fA8lEILfEG5NwLP/31m0Ige+GL4Tcag/Cqx3Lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744836136; c=relaxed/simple;
	bh=RSie0nXMjQWozJafxINypzZFt8eO2DZf7eBuhaP0m3w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iIC59rYMfJlByjAdi0VXykgP3Y6DHa4pfEPmUVdTUhbnjomJCKG2yzd9QqDLts7xHVbw0xG76+imB7gY/nGF7BN811eqNVvY+b6HFiohh9AqChEEhPlN2TZpJr9vRrB0DXEeIO0LINsHdV/II0XTqduI5SffX3NsScU1eCMf0C0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=f4w8cv1i; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="f4w8cv1i"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-22c33677183so1177265ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 13:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744836134; x=1745440934; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4KbTAU01u2d1Fyhrvlbrvk8qe32/1uE4Mm7IabxHd+o=;
        b=f4w8cv1iNYgSH4G7MnPZvKjx6MUPMqPQNDeVzvyLmri2HLH3qzhjCtXym10g2UYXA5
         mgEl0DBBwMoMbeM03bGKtvhM35erMsowAvXsDGGPYcLClnTNgrtPyEr4EbHv8jUBq4Jg
         lRraE+vTA6X43QJdEuD1V5d2nsanIcxcYO9B6L/1vYwzCbGNFeIh+yIU4qFlPIB2bpZX
         msphQy/kkZ38a8HGlR0RSzmKwqOhHJbe06utgurO6qXoefwe7zH7YtUan0qqRnF2nqwT
         dVIpur3PSGlCiju26XyivoSmdmLcOzI1vf4njF9GyIkQNQqkt2ZD9p56aS94LeO2/VCE
         6mjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744836134; x=1745440934;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4KbTAU01u2d1Fyhrvlbrvk8qe32/1uE4Mm7IabxHd+o=;
        b=u2ZXOKssmN3o8HqR+qKiuUVnRl216cN2Bzji3VBuCoCqeZ6tMBpfBNgu1V3/LpYYWl
         +tVG62Ii4S+mVqUzmy7A4I/5ZMDfIYklOKBO2MviS3HTCiQwIMS99/IDuI1GLCW4Wrj/
         fAGXf9TNdYfS8J/o+Jx/kRFY3tw3qvvUSrE8/VFamMvdl6/XeV0UaF/8FteZOxFUdpKo
         toA04UMpOW43D9oqQzlloNS7C6QjQSQcezyBIITHqDpoYRWZNzU1nMEraXrPugFtS+pv
         ArLc67i+DFnv+LCCBGoUJVJw8nzNBMgL8dpw96Tk0JYxegSy9Jo7BX5Oqfp08skKJkpm
         t+jA==
X-Forwarded-Encrypted: i=1; AJvYcCV+acur+qDx2Scvc5zMuGvCeKuWHeIgaUolt0y2hgLIa7ijkuEohZRw/JMvCWAKUwqswQSNvGKufIvb2i0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4FxU2RK52Gy+ble7befWftqIHku3OTbyKCdhfcMJJ+EIn7LSr
	JRNW2tKn5kh5AJ96Wbv04uGHIB4/HASN3juTScMTuCGu27n7h2z8j+JCD2c9/g==
X-Gm-Gg: ASbGncthNdaL7+XsYph6CzKSy2DpFxwWfODk9AvpDTPg/dTge+NvD0jQs3bI29p8DoI
	/+UHxkzW4ARNwRh3yWk8D1D0LxNhsJRsVsXoUIejaSZioPDX3AAejzT2dN1wVFI85BqRGNUUtWo
	RXyIjSNUV0KoqZA7ZJismt/OFwuOxpJwYIj6i/IoW9DXFRZI90cR0Cxvp5PgnfHVzQjrh5chVyu
	4Ic0DXmv6JY13YTQH+tIFcvaCgNxs1uSFDUEgRtUAuMqVRHz8+f83emehlecJsGfycG/RVI+mTS
	n/AUQGBvsuA3Kx5NpOYkuaV8dvf0n3mABCELnrfB0JiVvg2CnKIQ5HaIROi0n+jS4wWMDGR+kaH
	LcTeNeA==
X-Google-Smtp-Source: AGHT+IHfRTGtXW8empc1D2cBf7UaxyTiL8sP58xBhsmEUtXUYv0rcmyWAyhT9pSwnf8mtCyytUgfRA==
X-Received: by 2002:a17:902:e541:b0:224:912:153 with SMTP id d9443c01a7336-22c358c4083mr50959125ad.5.1744836134534;
        Wed, 16 Apr 2025 13:42:14 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33fc4c49sm18858855ad.168.2025.04.16.13.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 13:42:14 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v2 06/18] staging: gpib: common: struct gpib_interface
Date: Wed, 16 Apr 2025 20:41:52 +0000
Message-ID: <20250416204204.8009-7-matchstick@neverthere.org>
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

