Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B78392063D3
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 00:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744849987; cv=none; b=tlXD0Z8yLV6EQAbB6X1n69em2pyfCJFs47BxCE8fC4f4ODPP3JkbP5l1HM7SE28oM8HGemfmn9/CdvsZQckz/aMYonsXQk4BqO1v5HBsglCNDa24I6meO4QFI4EIMDl0zUmNW74cyPO3CMc6uP4nvZ3+2zK8gK1Akm0Z2/ipnUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744849987; c=relaxed/simple;
	bh=7nOnj/t3IWRKRJuUCHCZoJzmMsnxpf6ffPgcSoWr688=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nSXgIapogPnMjyltiOltVp7doF37lpRLh0UY7gfhkQnDPTUDw/ZDYVJ53bvEseStM/UlSgIuEib7qXxJZzVbeORBAX3jdeQwKBO0Eu2BLm1kXskZsJCRxG5wqcI9lVsTcQAZoH1yomoGnu8EqGFuTIFIU1G8HYcNis98IGv9n3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=lJtOLWCM; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="lJtOLWCM"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2243803b776so3807765ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 17:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744849985; x=1745454785; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=akTpKyJqwtY/MzR6JYTv6U/YQl7Z23JU2ZL/gi1Jfw0=;
        b=lJtOLWCMdH5XIAtOsZPge5KVIGJ96A0N6JSFtTZ7nRl2VIjN1mtDaWuBTCkHjunVcF
         6V4/FQlrFZ2Ywgbie8QXzRntzaH2pVLSWwOvVLYm6jtcQvOzG+SE01pBHuQBhFHknpck
         1iKmfRKNsAiFwFWPQhR4SocHbFtsOXFHlcOj29gcZrFLRiHaQYZAyyT92hhXEbavq48b
         c4N71LVgO5wpoSUN9AsOnBZYqqFzd6sRxTug4w2W3nHnLj8zqxIS8hNbirnNfWbj+SAu
         z1aRSMWtgPvg78DigG5EUsTw3xUeAh1kcGjhncChLYCFkpba2vd1E9P34uuXRx2OdZHQ
         5wqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744849985; x=1745454785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=akTpKyJqwtY/MzR6JYTv6U/YQl7Z23JU2ZL/gi1Jfw0=;
        b=C/ALt7TV6SRQBb4F60OBjKbsPBewFYZbovfmCsifDC4fR1/VBodOIVi44Gf7MebcQG
         dil3uVxEyQpOZmsMrouIadNtRLx+RVsD4da8/hQgvGhkx+6Xd4L9ojEMvsuE/wYAERlB
         cYOMmXiu1awja/l3FKvNyG+FCrI5+OzeeFcDCcxZfiCigW9vsaJP6+Vt6tDDCRLbnJ9e
         eTmvlv6AsdSWzxVw44B5CN35BfXnciKi1afvE0Nt3IvvYlIouGRMAeL4r4mX3KjUyzTL
         4+KjhzzZ45s/NFLmn/mXt1qkctlZa5WedQ2jth+7qb4kaZZwVA9iDNZZuokZQkl7JbZR
         KqGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWdSvMGY33Yv1lX12+xuksP9VSxCWxdl7DFV1q8IfA66I/1XuEzMDVvxlAKkn5S0XektdGBAE+Yx2cxAgQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9vxMMlQtp0lmezNGCSArlu7bRcjxU37nXptNP+WfZnlg4oMQ8
	KaKgcJw0+t/BBsRtoeA3mkAp2zop8/BOJJke8hV9FINP0VN0NtZWVb5SimX4gQ==
X-Gm-Gg: ASbGncvPihSq8WourB+E3PKMbGpwjg9sadNhigEn3z0OEIO1jn1d2yfs8RJ5nchTlwM
	/Jr0XRjNCSZHIaNEP+b6WwikKA74PDjtVXC12Tb8xaITNeTtCbb/mvTsBdL1BGOVtGFK655Hjxr
	VfhXGjv49jWJ1zr5bx45ue5S7bl5Z8udLRw1I27Z5cxcQviWLvu0KNmNeZHyS0rFoFRKcVT1/dI
	U+TF6XhLrhBt8eEzvPrUmp2rL8fnReOQC5LVfwBND/jxtrPR8nAdQREFmPxHTMGZYhNX42hDjqO
	81n3v0yNXK0CmYs4TD7Vga7OdqZys0q/FDkdJJ2FZ4Fw9OIdVseDsVJ2iQI4ljTcQtiCNnYj0BK
	rruY3JQ==
X-Google-Smtp-Source: AGHT+IGYB5rRMTCrYcBvWx1oyo91M+PvsefiAz/0PmFW3/rXiYio3aV9UdJnictE+VBfEQe0SmaEQQ==
X-Received: by 2002:a17:903:2a8e:b0:21f:b483:2ad5 with SMTP id d9443c01a7336-22c358db5edmr51881165ad.20.1744849985214;
        Wed, 16 Apr 2025 17:33:05 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33fe7219sm20767075ad.245.2025.04.16.17.33.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 17:33:04 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	dan.carpenter@linaro.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v3 14/18] staging: gpib: lpvo_usb: struct gpib_interface
Date: Thu, 17 Apr 2025 00:32:42 +0000
Message-ID: <20250417003246.84445-15-matchstick@neverthere.org>
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
 drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c b/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
index 47f56fea28a6..494cfa21b938 100644
--- a/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
+++ b/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
@@ -1055,7 +1055,7 @@ static int usb_gpib_t1_delay(struct gpib_board *board, unsigned int nano_sec)
  *   ***  module dispatch table and init/exit functions	 ***
  */
 
-static gpib_interface_t usb_gpib_interface = {
+static struct gpib_interface usb_gpib_interface = {
 	.name = NAME,
 	.attach = usb_gpib_attach,
 	.detach = usb_gpib_detach,
-- 
2.43.0

