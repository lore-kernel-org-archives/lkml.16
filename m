Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48AAE257426
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 22:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744151120; cv=none; b=Z9FlDZeVIKCRchd1hFZ9MHYtpSG0MxLGNmKLS7CZwmgnmVSp0AL5/cgEK1NVl4QqQdndEFNvWwnJF7XpG0NyeRtEs5ObsocbQwZenBwOHGnxmW9H/daULqdhvJdNeDLOuMlmJPoVvB1z9ZpXU2RAXoSA8y++FyCcsMjiaa8i3Fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744151120; c=relaxed/simple;
	bh=3NFxLnV/Nr46EF/TSVSMp/zsoWxRG8qXMctW8XQ54xA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=onz+0f6aSrvkyH2BrX41yfvXGN92n+lrEjZVQRqNBICqjAnNa6slGIK9piyuGG34mypHeYMdvRyMGz972m8w3RVpwIaDkh1kfYUhWej1xWh6iiC1oSgQwFqo5i2YD/agVn5ii5iKkF3YWtOZPO3aHNTsgDAhr7y++QvZsamDFVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=Zaywn9qS; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="Zaywn9qS"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-306bf444ba2so2657754a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 15:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744151117; x=1744755917; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RYR6o/fptDL97JakFYXVuOyKREpmT1G7Kb7stf7FxQc=;
        b=Zaywn9qSrLnWmxSlrZzmGzUPR1y4ZKheRVU+0XlonVPWwf6zhY8KD9w2q70OuXKz+b
         rOxaoDCzxGXgBaq/87FZpI2ZphOwpprStVQ+fcABFF2Oi/4EEEdRod1LK3P6ILHDDzEo
         /AbyKVGgHAScHUwRygc/Sqv3lxSiP7k3PzspuWhxyq1CVD2NPWrJkhGEGXRrh3F+NTF+
         TaxzJUeGV5ZQqAfl5fcKcVW7GWbOEUhFKIR/HkY8lS/3GIM7mDxqhNxNaK/rxgOPJrNt
         BytK19EZJdrJPKqahMFXlMehUzjKLIIpNvmOPTcBLyBZmmZcrkUg+XfiBM0zxMnhy6Sf
         V7Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744151117; x=1744755917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RYR6o/fptDL97JakFYXVuOyKREpmT1G7Kb7stf7FxQc=;
        b=WBVwdSROdps/tvTE6xa7mcUIl2rUuDasXKLsPosn6F8VMjtj7seGFvG95cE/vDXc7H
         aR0vUUJA58gRwxZckQ7CY7WdHz0A4iwtfMUhSrc1s28F/OcNBQWXhC9CwUV0IYLOwY/o
         SrtRwG26dPaPLHqQZDcBtsqtUmbYcEooTAwTVWFFoj4+EuJks861aVgD2zhkbhRqqwtz
         UpPRJcP+NtC/sCRVL0/V88aXkrKPkpw18nsdPyBfhOPQxnFSIjn3IU7PN6pVnu2J+8lD
         lp3nA0q3jarwzsNgAdAPpdfIt/GYfBdHaz/oxFP4hUAqu7Skmclm2ilNubbdutaGUi2b
         mV1g==
X-Forwarded-Encrypted: i=1; AJvYcCVv+QPgjZBR8gCC4d1zQ230s0nqJKTTiJA4d1gOZSjFfyHDzF8EBHbjbrg5BD++we9s+ouOMk95zrAgCMM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyH6773oaFN0ACpd/DLVWTccS/cxLkhmvEf1esEGAWcuiQfSjeD
	gtz1zE8N7CzFg5w1FlnaUmwgNOoPx/E+Ut95y2dUZE067NGqSiSRtHVLGaup+w==
X-Gm-Gg: ASbGncvMZGat8MQKXvZHQuKtUbqslY6ba8B/lD9hdSqK6lE1O06AdG8SNxt6C5bOqgA
	pv7ClWiJLnvvG/dnH3xTmjy7mriUchHSAfF+ypodjrTbRkFtjxnUgrZ/RMDJoPR0ZaZkQud3C5E
	9TQGOpY28/s9pbzysh8ZNYTNEdEb4GGz7akib1ZmwZjTlsZ2oW+Cq+jebpD6OOqDhSNnXM/k2bq
	4AIvY5sYAGOOMQwJQO4vpG9YznB46ZtrqdGyf9FKEKUXge6vJ++cnOeg9qA0FXtHR/PRsL3HCoX
	z6JVU+kqQDjEjcRo2SEyZac1MOgd2sznLIhSnzm+TfdN7BfpvLtc5Hp2bnUyk2M41r6DLk8zj6t
	qdU1gdKCMxA==
X-Google-Smtp-Source: AGHT+IFWBmW88BT8r/eam6USK7inexLdwGM3Z31rYrUeQeHbRtEtsiN5hyH6X7Vw4VoTv+K3XMkRSQ==
X-Received: by 2002:a17:90b:2dca:b0:305:2d28:e435 with SMTP id 98e67ed59e1d1-306dbb8e7d2mr1251536a91.7.1744151117487;
        Tue, 08 Apr 2025 15:25:17 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-305827d70a4sm11626033a91.3.2025.04.08.15.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 15:25:17 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 07/18] staging: gpib: fluke: struct gpib_interface
Date: Tue,  8 Apr 2025 22:24:53 +0000
Message-ID: <20250408222504.186992-8-matchstick@neverthere.org>
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
 drivers/staging/gpib/eastwood/fluke_gpib.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/gpib/eastwood/fluke_gpib.c b/drivers/staging/gpib/eastwood/fluke_gpib.c
index d289c321c153..68f888a75edc 100644
--- a/drivers/staging/gpib/eastwood/fluke_gpib.c
+++ b/drivers/staging/gpib/eastwood/fluke_gpib.c
@@ -698,7 +698,7 @@ static int fluke_accel_read(struct gpib_board *board, uint8_t *buffer, size_t le
 	return retval;
 }
 
-static gpib_interface_t fluke_unaccel_interface = {
+static struct gpib_interface fluke_unaccel_interface = {
 	.name = "fluke_unaccel",
 	.attach = fluke_attach_holdoff_all,
 	.detach = fluke_detach,
@@ -733,7 +733,7 @@ static gpib_interface_t fluke_unaccel_interface = {
  * register just as the dma controller is also doing a read.
  */
 
-static gpib_interface_t fluke_hybrid_interface = {
+static struct gpib_interface fluke_hybrid_interface = {
 	.name = "fluke_hybrid",
 	.attach = fluke_attach_holdoff_all,
 	.detach = fluke_detach,
@@ -760,7 +760,7 @@ static gpib_interface_t fluke_hybrid_interface = {
 	.return_to_local = fluke_return_to_local,
 };
 
-static gpib_interface_t fluke_interface = {
+static struct gpib_interface fluke_interface = {
 	.name = "fluke",
 	.attach = fluke_attach_holdoff_end,
 	.detach = fluke_detach,
-- 
2.43.0

