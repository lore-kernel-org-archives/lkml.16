Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1770F1A7249
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 00:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744849975; cv=none; b=sR/p8vHj/vosSO0X0NKQqZs2ObFRxLdcbmd9GyBPGhsHMxwvHv/BAdVUuT4oUqNjiquLxVlpr9XlReXr4m9+Dnl5X4URtcbewFiQ8xBcBiVM5nC5bv9aZvDmmhsbMpcLH+VPZf4OCtYayrAJyhtoRaWD88d7aR10+qICPDsdZz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744849975; c=relaxed/simple;
	bh=8okjKapEXL0pq/38EBFIL8OiF3bafOD9XDda7A5fthI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ho7clJ+5REVBpJfcGHBioUdh4/eqLhAryt0OlaeQ2Vi1H2tkptiI9IzgHZVLjdPTNtGEBGoRGmjn9Ny0Rw1AELRQGHLVUwdLTty5XC+GXG8oHBeoa5UE5RuSmJgjVszXhcwIzPWv4I4w5KmwXdf4EtknRM9NWbODUKH0+X03KRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=RCYS43Nq; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="RCYS43Nq"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-22c3407a87aso3486265ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 17:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744849973; x=1745454773; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aieSX3scPJoA/XHoJW1shS4zGjo6f5zSBOJN+BqU2pE=;
        b=RCYS43NqzumfZ1KxzN5OGbHMzW0nxnEbuIG+yX9QA0xJg010DqLWyO+3byiPId4QnR
         XTsn9iJ1PSB8GXmbddij4L4p3JUyCzAlSPkGvoXaHX42oZty4Ci8os7vLXa0HwdyHSj9
         u3L+JAxaMCda61aZL4tQZfiiNHt7SvMyjWN/7ZuI5SM8z5FRSe6T0LYlNie/S4aIqhZh
         Zh6lofdELK+agbBv4sQYpVhO/gP0smIfORSkTgTjA9KGsSgjPlDvOqwW5nfgVMIwxFMD
         lGFUuZRNSJ4yuhUYqmeBEBFy2UHEmpiQcBG1SghmIa+pMav/CExYlF8UYGxldCF1/190
         Vgvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744849973; x=1745454773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aieSX3scPJoA/XHoJW1shS4zGjo6f5zSBOJN+BqU2pE=;
        b=SHoM3muGlXorTOcjG2cEvgZfRwCI4VMDVmvbqNBzbi1HLewiM6qOvWxMuyUUDY3dZX
         Ph6kwV8uEKL+bSE87xp/K0VK34ZLHv7Ey20BYIh5lFdMPE60BJ4P487RRaUdHIVQfrOn
         1N+0kt1zxq2I/NBqU7F4/knwnwOyu/Jsz6DIKmQfchyclJEntbeQ0Yw0GyJUCLSTer8r
         ++38ZBw+jR1mcuGfk9JqJggrC6PSWQuSZGaijiHxEGFkbvMPc2NWgcaCXO1brc2yhd7C
         gWZk8huW+lcI/OTPeYAXNlOVkjrKbIJyx7203vSYKwz14smE36UXuTSMIz+oQ0oNvGja
         /bmw==
X-Forwarded-Encrypted: i=1; AJvYcCXBHuAQAB2BFPE0OBw8ezr9JBrTYGxaCfYh63tTmFs7NWS1BLnEkI5NbcqXj7U6sRGyemz7e03UPTnt9jQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8IMgsWSAAe+/FEEQFOL2x9cFNqe4AasD4sOUXoDb5OToPA1Vs
	fvCEWNKBM0pbhnQeUN4R06LHpp1EMmJpMkc61k2gSdYLY5g9MJ3vnC63fmF1EA==
X-Gm-Gg: ASbGnctiIRrQTQ6cmQxypEPN0NFmfb3cIAahc0dp4KbGlXn0YwMBpslUzJYmrHz/AkM
	5ro/4BYpPc9r581X+wTVVGhIqRDsnD3Ry3wm2XaCQTg6tB1U8TiDfnQcmXbxF1erz+lKhd2z3WW
	EHLaQsjMklHLG1lOurhuaCrIo4afJQhAxrUcGcJd3+iO+BdmEQpvDdiN+yM4vgHCayXPNG2Zqjo
	kzB6slE+8S35FN7WTRVGozGsrPz9Pz6VNjivsOdFuXu+d0zX8pp9D8qxPtrshsyoyv7eLM4tUfg
	MIEvqpLnweKHK+n6BzpQFben+w4Q7ZMaea/g5zQ/Np0CGhFUJYY6OUAXiCDfEDYxreD/CRl8/n6
	8UAhrxI5W4NcCPwAu
X-Google-Smtp-Source: AGHT+IHkqC8KVVYFFKRBRSh3k2qVgnhji73OjHXWe1evH3Cwzt+CMaEhigvo0U455wmM1IN8eaY0hQ==
X-Received: by 2002:a17:902:cf0f:b0:224:376:7a21 with SMTP id d9443c01a7336-22c359742c4mr62912015ad.42.1744849973376;
        Wed, 16 Apr 2025 17:32:53 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33fc43d5sm20865225ad.162.2025.04.16.17.32.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 17:32:53 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	dan.carpenter@linaro.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v3 04/18] staging: gpib: cb7210: struct gpib_interface
Date: Thu, 17 Apr 2025 00:32:32 +0000
Message-ID: <20250417003246.84445-5-matchstick@neverthere.org>
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
 drivers/staging/gpib/cb7210/cb7210.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/gpib/cb7210/cb7210.c b/drivers/staging/gpib/cb7210/cb7210.c
index 9e26fea43fb9..08a50d1428ab 100644
--- a/drivers/staging/gpib/cb7210/cb7210.c
+++ b/drivers/staging/gpib/cb7210/cb7210.c
@@ -686,7 +686,7 @@ static void cb7210_return_to_local(struct gpib_board *board)
 	write_byte(nec_priv, AUX_RTL, AUXMR);
 }
 
-static gpib_interface_t cb_pci_unaccel_interface = {
+static struct gpib_interface cb_pci_unaccel_interface = {
 	.name = "cbi_pci_unaccel",
 	.attach = cb_pci_attach,
 	.detach = cb_pci_detach,
@@ -714,7 +714,7 @@ static gpib_interface_t cb_pci_unaccel_interface = {
 	.return_to_local = cb7210_return_to_local,
 };
 
-static gpib_interface_t cb_pci_accel_interface = {
+static struct gpib_interface cb_pci_accel_interface = {
 	.name = "cbi_pci_accel",
 	.attach = cb_pci_attach,
 	.detach = cb_pci_detach,
@@ -742,7 +742,7 @@ static gpib_interface_t cb_pci_accel_interface = {
 	.return_to_local = cb7210_return_to_local,
 };
 
-static gpib_interface_t cb_pci_interface = {
+static struct gpib_interface cb_pci_interface = {
 	.name = "cbi_pci",
 	.attach = cb_pci_attach,
 	.detach = cb_pci_detach,
@@ -769,7 +769,7 @@ static gpib_interface_t cb_pci_interface = {
 	.return_to_local = cb7210_return_to_local,
 };
 
-static gpib_interface_t cb_isa_unaccel_interface = {
+static struct gpib_interface cb_isa_unaccel_interface = {
 	.name = "cbi_isa_unaccel",
 	.attach = cb_isa_attach,
 	.detach = cb_isa_detach,
@@ -797,7 +797,7 @@ static gpib_interface_t cb_isa_unaccel_interface = {
 	.return_to_local = cb7210_return_to_local,
 };
 
-static gpib_interface_t cb_isa_interface = {
+static struct gpib_interface cb_isa_interface = {
 	.name = "cbi_isa",
 	.attach = cb_isa_attach,
 	.detach = cb_isa_detach,
@@ -824,7 +824,7 @@ static gpib_interface_t cb_isa_interface = {
 	.return_to_local = cb7210_return_to_local,
 };
 
-static gpib_interface_t cb_isa_accel_interface = {
+static struct gpib_interface cb_isa_accel_interface = {
 	.name = "cbi_isa_accel",
 	.attach = cb_isa_attach,
 	.detach = cb_isa_detach,
@@ -1334,7 +1334,7 @@ static void cb_pcmcia_cleanup_module(void)
 	pcmcia_unregister_driver(&cb_gpib_cs_driver);
 }
 
-static gpib_interface_t cb_pcmcia_unaccel_interface = {
+static struct gpib_interface cb_pcmcia_unaccel_interface = {
 	.name = "cbi_pcmcia_unaccel",
 	.attach = cb_pcmcia_attach,
 	.detach = cb_pcmcia_detach,
@@ -1362,7 +1362,7 @@ static gpib_interface_t cb_pcmcia_unaccel_interface = {
 	.return_to_local = cb7210_return_to_local,
 };
 
-static gpib_interface_t cb_pcmcia_interface = {
+static struct gpib_interface cb_pcmcia_interface = {
 	.name = "cbi_pcmcia",
 	.attach = cb_pcmcia_attach,
 	.detach = cb_pcmcia_detach,
@@ -1390,7 +1390,7 @@ static gpib_interface_t cb_pcmcia_interface = {
 	.return_to_local = cb7210_return_to_local,
 };
 
-static gpib_interface_t cb_pcmcia_accel_interface = {
+static struct gpib_interface cb_pcmcia_accel_interface = {
 	.name = "cbi_pcmcia_accel",
 	.attach = cb_pcmcia_attach,
 	.detach = cb_pcmcia_detach,
-- 
2.43.0

