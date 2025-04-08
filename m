Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CB1325A645
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 22:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744151131; cv=none; b=Be8+nuowUU0FGNHrog3GpzUDFLIbzzCEajg4Do/SvGq+RJaJ5gZkA7AeWBudd0ZbBNm4a2qDywBpmmnPxb0jglTguFHSU4gmpD38agv2nryQGc/AFjH9a9oRjFmOLkJZ/Ucws094ynKxgXCV79iwZ2+q7oMUTxsoTT6bDgL9xg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744151131; c=relaxed/simple;
	bh=CTkuchpWwxVlAy9Q3huxyw74RcuiMEQlO21k2/y3xtM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dvENKn4zYcDz3L84qX5Pw80RS5BRqY6qAbLVJyC+Nab3XYSYbg6+/MA8npSKbEoRQww/KSou+HrpryyKj2jghf1C2ZeR7IdcZJbJOjjXI7WHZ+Q/9qvDXv9RaQ46AOLT7dmJqo/xQslLbJLY8OfGfFyh5utN0+zpYJgx/Xb+FvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=cjWyM7sx; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="cjWyM7sx"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2ff69365e1dso4858924a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 15:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744151129; x=1744755929; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BpuF8/8p8vziE36GXyTG1Lw6cnZL+l12I1BHpvDEYzA=;
        b=cjWyM7sxcIjJ3/wWMdv6xGD+dV53mj7cPNA205+CUlXfGz/iQi8WW3QPwMc0BUpbB0
         m7438JLjA/BIosjMKKlL622VpBFo/eczJBaXj6AgIZQTMQB33rrvhGCZladdTxVU4JsL
         QUGySdtrzeT4V0bEjXr+uI/F+LP/HP4QgEBOKUmXdjuI2PxmwzgeQauqnXyVh+U2vAKS
         bn5Lo3WMeXWFhKd7K4N8nxNxxPDNwU7aCOYVBA/TLNcQJq7Dt4Jg1dJXVPr0ZIjhJhq+
         7LhBqmaiQ9woDXGd928n4Cth4T4yUrkbjqbWry1ULKLlmn7V9XDj99qZEotGNwylDK8f
         r5Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744151129; x=1744755929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BpuF8/8p8vziE36GXyTG1Lw6cnZL+l12I1BHpvDEYzA=;
        b=X9ZZZfiH+eVk2wjxwOF5TYzpn7MdbJ/suRPMmNMJceUv6fAlQ0zGDW0G0BOvI+rJjY
         DabGyNjYoqWQfLp2CeS4C0fViBrdkrkEiGKYFT7P/esOKQvx0E1KdFOgfQcBVALEBP3t
         JXAocIUz7meFSRcCuYZk2SLug76pIAhOWxlPoup9NfN0gdrvCHBL8YR7NUWGLuqYKRp+
         zEnXh+MRNRZxknBMxwLaftDIIc5Nk3n/ICoNWKNXvgfJYIGJ4B9ZFc5ZBIhGjeByLz83
         9b3Jyjac2X3y+o1PQVov3ClXGXCv4ghIArrn5l4hzbIp9q8qFs9sEqA2o69ZjBAsYy8F
         0S7w==
X-Forwarded-Encrypted: i=1; AJvYcCUdVASCo5MDs6G6s2vKrPDEm5WqklohDhQsYF8lDOWUua9jwXHksuznDMEMYQe9GnUV3i/uFLqhPj/KJj8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDEGMlRdb2vXOEuFqhYRhMHmIA7aM/im2YQCLu+CU1A2CiCEPN
	Afyv1N3TrKHLoRNud6QNa1BCkEPf0CSFwVCq/DYaKi0Yn12wxDK1prvAGAQQ9GOdm3w2Odb5w+0
	=
X-Gm-Gg: ASbGnct7vXtGSOVdQ8T6RbLSCAQV0P6THL8aTuFaIb3fm/GUsPUQ+vZZ9n9h8ugA6/y
	zXpZ4EJZUhFM3eUsJWza17Qyw8ejhwObCuN3EbJwEDijGmLifKn7/E6hhGdxFVAJrU5I0v3U53t
	pxXmSeJmii6RQHv5BnvhRezFoRfpn5f+90oO17y4Xo2c+IRvuLrcgXgYYPbGpQ9GM5dezw4ZVoo
	XLNbAWGy0Kvgf/9RAGQ/9a0yUjoWOlABPwZ6+wZIve5trzWqQRsSDtnyT2L99xrZL/GdGZT8GUF
	vzAG/IB8FJSfdzTX6byMGYUhhpvH6TarRsw2AV/SHvSTBgUetnLoCzu6keqdUK1yjPwd0gLofAu
	dkq/ys1jrWA==
X-Google-Smtp-Source: AGHT+IHAwKj9OOar9R8OAylcpYrbMoIxJRIVpH7LfgstnadVPEuA6wrPm4E6cjggnU4E9R3aFZUfcg==
X-Received: by 2002:a17:90b:17d1:b0:2ee:a583:e616 with SMTP id 98e67ed59e1d1-306dd51c13cmr275559a91.9.1744151129312;
        Tue, 08 Apr 2025 15:25:29 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3058494a3ecsm11592364a91.18.2025.04.08.15.25.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 15:25:29 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 17/18] staging: gpib: tnt4882: struct gpib_interface
Date: Tue,  8 Apr 2025 22:25:03 +0000
Message-ID: <20250408222504.186992-18-matchstick@neverthere.org>
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
 drivers/staging/gpib/tnt4882/tnt4882_gpib.c | 24 ++++++++++-----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/gpib/tnt4882/tnt4882_gpib.c b/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
index 3b29f541fd49..596e2fa40dcd 100644
--- a/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
+++ b/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
@@ -1116,7 +1116,7 @@ static int tnt4882_pci_probe(struct pci_dev *dev, const struct pci_device_id *id
 	return 0;
 }
 
-static gpib_interface_t ni_pci_interface = {
+static struct gpib_interface ni_pci_interface = {
 	.name = "ni_pci",
 	.attach = ni_pci_attach,
 	.detach = ni_pci_detach,
@@ -1144,7 +1144,7 @@ static gpib_interface_t ni_pci_interface = {
 	.return_to_local = tnt4882_return_to_local,
 };
 
-static gpib_interface_t ni_pci_accel_interface = {
+static struct gpib_interface ni_pci_accel_interface = {
 	.name = "ni_pci_accel",
 	.attach = ni_pci_attach,
 	.detach = ni_pci_detach,
@@ -1172,7 +1172,7 @@ static gpib_interface_t ni_pci_accel_interface = {
 	.return_to_local = tnt4882_return_to_local,
 };
 
-static gpib_interface_t ni_isa_interface = {
+static struct gpib_interface ni_isa_interface = {
 	.name = "ni_isa",
 	.attach = ni_tnt_isa_attach,
 	.detach = ni_isa_detach,
@@ -1200,7 +1200,7 @@ static gpib_interface_t ni_isa_interface = {
 	.return_to_local = tnt4882_return_to_local,
 };
 
-static gpib_interface_t ni_nat4882_isa_interface = {
+static struct gpib_interface ni_nat4882_isa_interface = {
 	.name = "ni_nat4882_isa",
 	.attach = ni_nat4882_isa_attach,
 	.detach = ni_isa_detach,
@@ -1228,7 +1228,7 @@ static gpib_interface_t ni_nat4882_isa_interface = {
 	.return_to_local = tnt4882_return_to_local,
 };
 
-static gpib_interface_t ni_nec_isa_interface = {
+static struct gpib_interface ni_nec_isa_interface = {
 	.name = "ni_nec_isa",
 	.attach = ni_nec_isa_attach,
 	.detach = ni_isa_detach,
@@ -1256,7 +1256,7 @@ static gpib_interface_t ni_nec_isa_interface = {
 	.return_to_local = tnt4882_return_to_local,
 };
 
-static gpib_interface_t ni_isa_accel_interface = {
+static struct gpib_interface ni_isa_accel_interface = {
 	.name = "ni_isa_accel",
 	.attach = ni_tnt_isa_attach,
 	.detach = ni_isa_detach,
@@ -1284,7 +1284,7 @@ static gpib_interface_t ni_isa_accel_interface = {
 	.return_to_local = tnt4882_return_to_local,
 };
 
-static gpib_interface_t ni_nat4882_isa_accel_interface = {
+static struct gpib_interface ni_nat4882_isa_accel_interface = {
 	.name = "ni_nat4882_isa_accel",
 	.attach = ni_nat4882_isa_attach,
 	.detach = ni_isa_detach,
@@ -1312,7 +1312,7 @@ static gpib_interface_t ni_nat4882_isa_accel_interface = {
 	.return_to_local = tnt4882_return_to_local,
 };
 
-static gpib_interface_t ni_nec_isa_accel_interface = {
+static struct gpib_interface ni_nec_isa_accel_interface = {
 	.name = "ni_nec_isa_accel",
 	.attach = ni_nec_isa_attach,
 	.detach = ni_isa_detach,
@@ -1371,8 +1371,8 @@ MODULE_DEVICE_TABLE(pnp, tnt4882_pnp_table);
 #endif
 
 #ifdef CONFIG_GPIB_PCMCIA
-static gpib_interface_t ni_pcmcia_interface;
-static gpib_interface_t ni_pcmcia_accel_interface;
+static struct gpib_interface ni_pcmcia_interface;
+static struct gpib_interface ni_pcmcia_accel_interface;
 static int __init init_ni_gpib_cs(void);
 static void __exit exit_ni_gpib_cs(void);
 #endif
@@ -1769,7 +1769,7 @@ static void ni_pcmcia_detach(struct gpib_board *board)
 	tnt4882_free_private(board);
 }
 
-static gpib_interface_t ni_pcmcia_interface = {
+static struct gpib_interface ni_pcmcia_interface = {
 	.name = "ni_pcmcia",
 	.attach = ni_pcmcia_attach,
 	.detach = ni_pcmcia_detach,
@@ -1797,7 +1797,7 @@ static gpib_interface_t ni_pcmcia_interface = {
 	.return_to_local = tnt4882_return_to_local,
 };
 
-static gpib_interface_t ni_pcmcia_accel_interface = {
+static struct gpib_interface ni_pcmcia_accel_interface = {
 	.name = "ni_pcmcia_accel",
 	.attach = ni_pcmcia_attach,
 	.detach = ni_pcmcia_detach,
-- 
2.43.0

