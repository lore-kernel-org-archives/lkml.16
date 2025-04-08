Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A396D2586C8
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 22:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744151841; cv=none; b=nKvVdNESCSchkBaBbojmmR1NMqsP83gFjloCYJKLYP0zIPaId0Q47ap1SoJj6NQrKo4b4i9k58wtSYBLi8ghMVaiYUK7UBVk7AploRnfVygzwL5mdJTL0o8t8ZQPpDYFEtOKquBsyytCgs+JnT+nkTU5mPqh5XlkQ2lYlWwwTT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744151841; c=relaxed/simple;
	bh=RW9AE3t0A0nclxnXdLPGn5ZCeaheNjUQ/Msgs2FG9JA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e1s61KAK6zseszk4IwzqfgZ4aEXDEmk5lxj5Hws38k7a9RwHc9bKv4ZfPQD9hZHGWEvg3I5G0lyMazalpIOjcWu4HyP8RzJEJmsL254JaTl2gyzL+JNKvxPYHyvVYy1/Xgv73jFLf2iW6u7RcZXcbtrNn4kiRQIDpbVqa0Bn6W8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=LAQ3PbuA; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="LAQ3PbuA"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7376dd56f60so4483332b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 15:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744151838; x=1744756638; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=stUd2WZ8fQWzt1BDAw39EfCCVY0bEu1A4avlNZzjbAc=;
        b=LAQ3PbuAaE7L3KfNv1j8v/cargK/xbBzOs9IJnimJ7WBpB/Gz5SVSNBXAey0616Jtn
         d+0fQHDpY4IKjSXlB9QqR870zuV0yIbQ7PqVIbs3f+gKMEYWJNgATS0C8A97/bDk+MPV
         Q3Z7NWLyFIlce13MYjn7dlTf5OgM7c2/U1/lIF95gBNyNrasJFNV0iXvwHe2dzuDAOe3
         jdWBTrIkw24ujGtRBhoghWKECW0Ep4uEwZv+NukqtB3fuAwlP7JXC/D/hiajhw47nRG4
         ArV/6aE9466wpMqIJoRZ+QtrASwiisO88Pnn4YEZIQINfLicEEUwyG1zLv+LQ02B7K2Z
         Ammw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744151838; x=1744756638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=stUd2WZ8fQWzt1BDAw39EfCCVY0bEu1A4avlNZzjbAc=;
        b=oUWW0fpqgTdJr+E9CO3/BeMf90Aisna98KwmSlt38amoDeutqSPcBe6/5AKGJiMlwH
         0KOn8Li46AdWH5MFTpVkprgyJn2ToTKsVeG/qPYoIumRmYo4Tvg4gwpvz1oXQoaJwwmf
         Dz9ZIlSvBmeaagtv3XkQi3DyzuGT4KE+BAmsUiqY5WSBsoiojpUVGx+mGodgOJ7kOPug
         jB2yqgBePdNMh4lKM7usdEAfsQcetbJtw0On9yLIJ4tu684gBlCskRBZIs+hpqtEX7qE
         o5sEnaTzEsmt6EyyAOP9IjnDqn4daETU9ERYXKvBYd1lY2zwYs7i5wi0+qSXgp/Rm3ju
         LYtw==
X-Forwarded-Encrypted: i=1; AJvYcCUWiucM0J2fmHuPtgt963RnLmo+EinYG2rJNgeo1oMDyINYC+4QWiwjO8K8YeZ62uGr+omdn/t/3FwMw74=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZJ+CVqGsHe3IiPpQw8WQe58u19wBuoDdtXPJkp8htOOUSY27L
	7o2i5t+p3+M8w3WdJTTfjhBi0itdMfFhfUnWWdPTwDC96PH1JjcxZGF2bTs14Q==
X-Gm-Gg: ASbGnctal2DHi/mLN/5qY75Eal4xh9cAVjwA6L3LEei1oCBRm/ih94bpJbg+RdUky0w
	ynlt8fzD+a16CRHhGRRRsPBO0eCqlnqAk/BwPp4H9RzeXDA8ol9VUirfmfmmCKyfdR4vGOSdrUF
	lpz0HzIdOppG148yKBa+kqmZMwxUN4qfOAQvNTNH+DwdpIAYkA9RpadfknUtPq+xa2eQT/8lbKO
	AOggS9nCpMuUxVrrXiGmpXOpKxnpy2KFa/ALT2kGqyHHHNVhqohsCaoJF33OA/WY21NGS8cUo5i
	W9onP+QkGHaMppFH58qE+TKjY885+Wpp2QPbtlHe36tospnOQJ7RLc2JNLv2pvxmZ4jYoSH0UKb
	D3Xem9wWWevx8fgU9b/q0
X-Google-Smtp-Source: AGHT+IEIYVhP2MSndFPC+gXp2gzhNla26uI6gXcVMRyQXuC0vBzRQHC29Z3GNUYLJzjclt3EoRCFjw==
X-Received: by 2002:a05:6a21:78e:b0:1f5:8f65:a6e4 with SMTP id adf61e73a8af0-2015914ca0bmr1080103637.7.1744151837884;
        Tue, 08 Apr 2025 15:37:17 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739d97ee7a0sm11100513b3a.41.2025.04.08.15.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 15:37:17 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 13/18] staging: gpib: ines: struct gpib_board_config
Date: Tue,  8 Apr 2025 22:36:53 +0000
Message-ID: <20250408223659.187109-14-matchstick@neverthere.org>
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
 drivers/staging/gpib/ines/ines_gpib.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/gpib/ines/ines_gpib.c b/drivers/staging/gpib/ines/ines_gpib.c
index 7d53f6592845..3b7c8fc0f2e8 100644
--- a/drivers/staging/gpib/ines/ines_gpib.c
+++ b/drivers/staging/gpib/ines/ines_gpib.c
@@ -313,9 +313,9 @@ irqreturn_t ines_interrupt(struct gpib_board *board)
 	return IRQ_HANDLED;
 }
 
-static int ines_pci_attach(struct gpib_board *board, const gpib_board_config_t *config);
-static int ines_pci_accel_attach(struct gpib_board *board, const gpib_board_config_t *config);
-static int ines_isa_attach(struct gpib_board *board, const gpib_board_config_t *config);
+static int ines_pci_attach(struct gpib_board *board, const struct gpib_board_config *config);
+static int ines_pci_accel_attach(struct gpib_board *board, const struct gpib_board_config *config);
+static int ines_isa_attach(struct gpib_board *board, const struct gpib_board_config *config);
 
 static void ines_pci_detach(struct gpib_board *board);
 static void ines_isa_detach(struct gpib_board *board);
@@ -724,7 +724,7 @@ void ines_online(struct ines_priv *ines_priv, const struct gpib_board *board, in
 		nec7210_set_reg_bits(nec_priv, IMR1, HR_DOIE | HR_DIIE, 0);
 }
 
-static int ines_common_pci_attach(struct gpib_board *board, const gpib_board_config_t *config)
+static int ines_common_pci_attach(struct gpib_board *board, const struct gpib_board_config *config)
 {
 	struct ines_priv *ines_priv;
 	struct nec7210_priv *nec_priv;
@@ -852,7 +852,7 @@ static int ines_common_pci_attach(struct gpib_board *board, const gpib_board_con
 	return 0;
 }
 
-int ines_pci_attach(struct gpib_board *board, const gpib_board_config_t *config)
+int ines_pci_attach(struct gpib_board *board, const struct gpib_board_config *config)
 {
 	struct ines_priv *ines_priv;
 	int retval;
@@ -867,7 +867,7 @@ int ines_pci_attach(struct gpib_board *board, const gpib_board_config_t *config)
 	return 0;
 }
 
-int ines_pci_accel_attach(struct gpib_board *board, const gpib_board_config_t *config)
+int ines_pci_accel_attach(struct gpib_board *board, const struct gpib_board_config *config)
 {
 	struct ines_priv *ines_priv;
 	int retval;
@@ -884,7 +884,7 @@ int ines_pci_accel_attach(struct gpib_board *board, const gpib_board_config_t *c
 
 static const int ines_isa_iosize = 0x20;
 
-int ines_isa_attach(struct gpib_board *board, const gpib_board_config_t *config)
+int ines_isa_attach(struct gpib_board *board, const struct gpib_board_config *config)
 {
 	struct ines_priv *ines_priv;
 	struct nec7210_priv *nec_priv;
@@ -1000,8 +1000,9 @@ static const int ines_pcmcia_iosize = 0x20;
 
 static int ines_gpib_config(struct pcmcia_device  *link);
 static void ines_gpib_release(struct pcmcia_device  *link);
-static int ines_pcmcia_attach(struct gpib_board *board, const gpib_board_config_t *config);
-static int ines_pcmcia_accel_attach(struct gpib_board *board, const gpib_board_config_t *config);
+static int ines_pcmcia_attach(struct gpib_board *board, const struct gpib_board_config *config);
+static int ines_pcmcia_accel_attach(struct gpib_board *board,
+				    const struct gpib_board_config *config);
 static void ines_pcmcia_detach(struct gpib_board *board);
 static irqreturn_t ines_pcmcia_interrupt(int irq, void *arg);
 static int ines_common_pcmcia_attach(struct gpib_board *board);
@@ -1345,7 +1346,7 @@ int ines_common_pcmcia_attach(struct gpib_board *board)
 	return 0;
 }
 
-int ines_pcmcia_attach(struct gpib_board *board, const gpib_board_config_t *config)
+int ines_pcmcia_attach(struct gpib_board *board, const struct gpib_board_config *config)
 {
 	struct ines_priv *ines_priv;
 	int retval;
@@ -1360,7 +1361,7 @@ int ines_pcmcia_attach(struct gpib_board *board, const gpib_board_config_t *conf
 	return 0;
 }
 
-int ines_pcmcia_accel_attach(struct gpib_board *board, const gpib_board_config_t *config)
+int ines_pcmcia_accel_attach(struct gpib_board *board, const struct gpib_board_config *config)
 {
 	struct ines_priv *ines_priv;
 	int retval;
-- 
2.43.0

