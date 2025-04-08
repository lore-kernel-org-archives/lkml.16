Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E01913C8E8
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 22:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744151830; cv=none; b=pryERzNFBZDZ3KKBtt5NxHAtjZ6/nWDdgKwhKBQeqKfSMTmQ5Y+Qjo8lm2wKslFjs3nxsLrCrjAvrp/PPinslwyDWpy//PZg12UR7JmnY5DNnai0W+qkUtDPgwZ6h2I62Yz3sZjKRDIUnuCabFt1rsc0jieWkoNHAlxHQrK7tyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744151830; c=relaxed/simple;
	bh=mUmAeGXRbQ7VAok4KoJS5eLp8Gt4hMGUusX407z9K20=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=befVyg+O3tq3z1PubQXpG0N/YqeocFXv1M5S9+tN/RDFtpuvpwCVrE31nMgWecvL6t9U/LHIORojwwXwPSGrnP6zBhI8JDCsOE5mjZeRpoNjZo9YZLPsi0ihO2/un3TzYpj5H6FusAQM49wA1wKBopRTxPg0D4SPgSOrRl4qz2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=HX9riiqy; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="HX9riiqy"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7369ce5d323so4886631b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 15:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744151828; x=1744756628; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eBJz86+Ff7rBhAwfla9Zgu4g4QbDvxGnEKapVf5XDjc=;
        b=HX9riiqyBP2+nDs48vERHRobmZXZH4K/KxA6okbOvlVv+w1iwKN93JPnViYB/RUa6u
         GeiRawE5u3YNUjEdAaxSQLqTtAQYj4bhN7W/jB3UMtjnpmgwyxQb0qKs7KE8Et6j9GtU
         zaxaJ1dYSbbUgq5S+E/VGFCEe878AVDfb9CrVMhRyr/ACUEA51BlnPJ6gWqU6Z0zA9Y6
         sWilEVAzo5RFpBa7y4sippWOKYhe1YJKjYi0sryy8m7Fsz5zoxJaH6RQpBetlOCvLHKF
         JjMLjG8nPh5M8Tnch0sJP71IhIUy/oBhqjw38eI4AZ+10AB1UPncSJo4grUeXf8Rmng9
         J4Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744151828; x=1744756628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eBJz86+Ff7rBhAwfla9Zgu4g4QbDvxGnEKapVf5XDjc=;
        b=qJeqCN2389FPzo2AUrMohVtkwaQSCF5Nm/FJ45cQdWSTpzJH+MwzEtlZRRarTAtwP1
         cOYTwpB4hVrBTmHKdce3zs1QBtc6C5ZwW90exSYwwe3HLt7KOV2iQNAzWd/0VuZ5TvGx
         VRehR6HSg8g1gsLViOSQVXmDOzEi8uC+6w0Qmi13cwacgagWWT0bWT5aY3oCQk+kPwTW
         lrRloMJRa/1nZVaKv5Wb0NREcaOFs2amtn3YnoQTfXN0ByCZMVGyY7qRZOI3zIg5PD/q
         SGLHTpZZf/LoPq8MPPHqq78vDOaVkz3HGUP1MBirdzgeOwkH1wnU1lLAEqO/Y+t1qBA+
         yEoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvZmqZ1Osik0yaXaX4noXdP+CLz6ozamZyEygHPH/Ix7H1qtTA3xB1b7zUJBZFXahqnZm88BhjzT2MVSg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7hzwqG9BrGRgkkRKz/sVfIbiCZhfAptJ3fKGmCDX0JU5qDXiQ
	gyGp0xrRQF65ULLoUP3XpnUrR0d+xtQiaySt+1I7mR8eN/ftxkYnmUkM15UFecAGaFVaeFjT2sA
	=
X-Gm-Gg: ASbGncsQZnq5/9ZmK67PZv2lgvsr3MW5xxsvRNR+xG8unJjtQZFJfC/kS0FJUQaJDoX
	Y0CMm35dIGfM9yZGkWu2PdV8aWgarfxYHRO6LhMJKLndHl8e+yERIDAj1WBYZPJPbsmcr36qs+5
	pa4Zv8g0K52TfBPckenvTDomOSjTxhSskdBPE1fRc0APoeXvhom77V6EIKISTp9Sv4V4KnKKQlw
	IBCY+8rK5VdznWfXmVSRfa3Hl0aTcqfcso+m+ODxYap9gEK7pphFdMjkFp0amIwTaULeHJzIVJJ
	F2uIONM7meBp0k56LM9kqa50+JhmRn20uv7PRspL2dYY9eBameO0agK+A2B/+iOvkHxKO5v+HH+
	KEF3veLmWjw==
X-Google-Smtp-Source: AGHT+IEjSpIyp7em7ovcxLcNfFL+AzYoBn298I5r8R5h68flLK0yC72ZCxAQfyO2IyGuzaaEdjbSCA==
X-Received: by 2002:a05:6a00:194a:b0:736:6279:ca25 with SMTP id d2e1a72fcca58-73bae5528b7mr942741b3a.24.1744151827617;
        Tue, 08 Apr 2025 15:37:07 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739da0b4317sm11499762b3a.148.2025.04.08.15.37.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 15:37:07 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 04/18] staging: gpib: cb7210: struct gpib_board_config
Date: Tue,  8 Apr 2025 22:36:44 +0000
Message-ID: <20250408223659.187109-5-matchstick@neverthere.org>
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
 drivers/staging/gpib/cb7210/cb7210.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/gpib/cb7210/cb7210.c b/drivers/staging/gpib/cb7210/cb7210.c
index 20cea66d6557..a8549718b425 100644
--- a/drivers/staging/gpib/cb7210/cb7210.c
+++ b/drivers/staging/gpib/cb7210/cb7210.c
@@ -533,8 +533,8 @@ static irqreturn_t cb7210_interrupt(int irq, void *arg)
 	return cb7210_internal_interrupt(arg);
 }
 
-static int cb_pci_attach(struct gpib_board *board, const gpib_board_config_t *config);
-static int cb_isa_attach(struct gpib_board *board, const gpib_board_config_t *config);
+static int cb_pci_attach(struct gpib_board *board, const struct gpib_board_config *config);
+static int cb_isa_attach(struct gpib_board *board, const struct gpib_board_config *config);
 
 static void cb_pci_detach(struct gpib_board *board);
 static void cb_isa_detach(struct gpib_board *board);
@@ -926,7 +926,7 @@ static int cb7210_init(struct cb7210_priv *cb_priv, struct gpib_board *board)
 	return 0;
 }
 
-static int cb_pci_attach(struct gpib_board *board, const gpib_board_config_t *config)
+static int cb_pci_attach(struct gpib_board *board, const struct gpib_board_config *config)
 {
 	struct cb7210_priv *cb_priv;
 	struct nec7210_priv *nec_priv;
@@ -1031,7 +1031,7 @@ static void cb_pci_detach(struct gpib_board *board)
 	cb7210_generic_detach(board);
 }
 
-static int cb_isa_attach(struct gpib_board *board, const gpib_board_config_t *config)
+static int cb_isa_attach(struct gpib_board *board, const struct gpib_board_config *config)
 {
 	int isr_flags = 0;
 	struct cb7210_priv *cb_priv;
@@ -1133,7 +1133,7 @@ static struct pci_driver cb7210_pci_driver = {
 
 static int cb_gpib_config(struct pcmcia_device	*link);
 static void cb_gpib_release(struct pcmcia_device  *link);
-static int cb_pcmcia_attach(struct gpib_board *board, const gpib_board_config_t *config);
+static int cb_pcmcia_attach(struct gpib_board *board, const struct gpib_board_config *config);
 static void cb_pcmcia_detach(struct gpib_board *board);
 
 /*
@@ -1417,7 +1417,7 @@ static struct gpib_interface cb_pcmcia_accel_interface = {
 	.return_to_local = cb7210_return_to_local,
 };
 
-static int cb_pcmcia_attach(struct gpib_board *board, const gpib_board_config_t *config)
+static int cb_pcmcia_attach(struct gpib_board *board, const struct gpib_board_config *config)
 {
 	struct cb7210_priv *cb_priv;
 	struct nec7210_priv *nec_priv;
-- 
2.43.0

