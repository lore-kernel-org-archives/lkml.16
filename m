Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24414259499
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 22:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744151844; cv=none; b=szGjLRaCWxuNGhrz2yCtvpvqcb5RC73sF1Hm0JLp/lPsKkuM67fYrwOxFFujOtQ+ZV4VO6VyOrp3qOFJwfq9SN2mwCyddwaM6hS0SRtyi8cjG0pA3YKdOq2HLb8qcUVf27c4pIfcnfNcKUWgb5dl45WrUsD0SgcYx5B2Ym2tavY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744151844; c=relaxed/simple;
	bh=WNuWDTs6pDN1wV8Z6wrXTCiZTEWWOXryJgb1fzU3VnU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GLC2jbuPLYnzcJZBcVCmQ2aH62v6B8biqDfmY/V4FMn3vhOZEFuKKNHj2LaFwz8o1eF5zxqH0UyhP3YZJEDrhcz+FHgZvWOtujTJiiHkIIzOd6u6dIYcfFS6Xxk1bVnTX29Q/oZVEwPN9g0Pne3AIe2sHR4jEB3iNB3G95glIQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=gT0Lvj8M; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="gT0Lvj8M"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-22a976f3131so34839205ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 15:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744151842; x=1744756642; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eXhVa1CITV/B2cRl+KjgT7xJ1CjyHiHMABslu29MRHk=;
        b=gT0Lvj8Mg7EHv2R8vxQZr0TqEf2SjCmVSdGjBVuwkCSmkFeU53tTmDdeAx9Gz7gxeD
         6l80/4UiY3y1qsJXQpbqJJYJUvw9vLrk8/XOaO07kSb6FuF1KPb2qI82kWI/43f3M6I5
         SshmpLguyJ6x6+i82FlcjRpuroKfDEd7DxHtfD+yY0LBwQpFo8SeSdVq1IiNe4N6Z7Sk
         wCPM77hFLcPktIiw38+xYV1W3WbeKCzcXgY2IGMd94Gz+ghlogl8bQMi4khY59/eQ/nX
         jONQlh7UzMBqlMvkjG40MagaZq9MPx9Cs/zs7iJ1AqiZVM9bORFKRr7aiG+iSU8OWp8w
         nyUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744151842; x=1744756642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eXhVa1CITV/B2cRl+KjgT7xJ1CjyHiHMABslu29MRHk=;
        b=wU2gtXGNeca4J5ffuI2dXi07DbR7g2naPf54EImhOdh+Z6FNk8ixO1QyVh1JHIhRhH
         cpu/4cVanOhhbx74qh0SBgSw1xkvazpTLzwvUOjnHZHq6yL+khoVHDFQ8N3RE/mJDino
         1DY3xOLT/FDj+xJiRq8rEIFxmFKDlEcNrKVtUs+bC4+zvjJ/jjMPTk1kR5jWwghuTQRv
         LADgvPDDsMCJoWADP8r3bapItBstQFl1tJXVO3c7PwuO94e2LMn+v6r9ZIZm+snDRaMA
         f0YFwd10WiBfG8NEStuCagojGq/YRyTJ+kjyOPRiivFW08/mlK2PuAN5lVvK/mp5/V+n
         blLg==
X-Forwarded-Encrypted: i=1; AJvYcCWEUq4Qm+XG89J83u6X1A08OpTN79MH7VM3HOcLB6DiPfsMoi4EEOFUfuGcWJhD6MwliDmlcXjFGTpQzME=@vger.kernel.org
X-Gm-Message-State: AOJu0YyflhbTLG3t0mZJiAyFaFXjpCIXuaBiimBQjloVkNf2YkBsBhy9
	JpEvQgJPi18bYxtDolRGPXwOJVYD1v+bIqOiBR+mP99ZmUSIe/ukFXlT2wdn2w==
X-Gm-Gg: ASbGncsKqR/3FoEyTv8njy3diN0gC1fMZgzgj1hFKh+8uiU3gX0BrwFtSRgSmGV6cIA
	tFnPZ8/rpVROuIqnVqLI6oTATRiJqndC5Ip32gIiFWsGqMMKuHh7iEHgZPQmiYr3XpeH2QGIudl
	g9tBinC8f6Eycn+C71iURiVN8+iqJfHeJ+qWyZ3EPSER/F+E+6lsZ0UBiy4W+a38zKR4oEOq73R
	fhRSGrUH1F+RU81xWYTqItCEQgnDLJ6Ku4BxejOzVtNdfIijOGGyALwc8CN5eOAZkYo+i2VPlqn
	GtAQExWgIAPnI9a/kPAXQTf65GenZcgbhtK7qjau7Z3KzyPXZi7OSY3D1D0uuZ4KjPH/SBIC+aK
	PBdFNtre5Ng==
X-Google-Smtp-Source: AGHT+IF87QspVFPBUI3zb4uLBU7ReB8xysVdKaGFAEW7LgmIq8HFVxrT5mQ3f2ij8cR94DO4zpRATw==
X-Received: by 2002:a17:902:d4c8:b0:215:b75f:a1cb with SMTP id d9443c01a7336-22ac298fabbmr9724015ad.9.1744151842428;
        Tue, 08 Apr 2025 15:37:22 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229787764e9sm106480495ad.243.2025.04.08.15.37.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 15:37:22 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 17/18] staging: gpib: tnt4882: struct gpib_board_config
Date: Tue,  8 Apr 2025 22:36:57 +0000
Message-ID: <20250408223659.187109-18-matchstick@neverthere.org>
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
 drivers/staging/gpib/tnt4882/tnt4882_gpib.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/gpib/tnt4882/tnt4882_gpib.c b/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
index 596e2fa40dcd..f123d427f835 100644
--- a/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
+++ b/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
@@ -898,7 +898,7 @@ static void tnt4882_init(struct tnt4882_priv *tnt_priv, const struct gpib_board
 	tnt_writeb(tnt_priv, tnt_priv->imr0_bits, IMR0);
 }
 
-static int ni_pci_attach(struct gpib_board *board, const gpib_board_config_t *config)
+static int ni_pci_attach(struct gpib_board *board, const struct gpib_board_config *config)
 {
 	struct tnt4882_priv *tnt_priv;
 	struct nec7210_priv *nec_priv;
@@ -1019,7 +1019,7 @@ static int ni_isapnp_find(struct pnp_dev **dev)
 	return 0;
 }
 
-static int ni_isa_attach_common(struct gpib_board *board, const gpib_board_config_t *config,
+static int ni_isa_attach_common(struct gpib_board *board, const struct gpib_board_config *config,
 				enum nec7210_chipset chipset)
 {
 	struct tnt4882_priv *tnt_priv;
@@ -1075,17 +1075,17 @@ static int ni_isa_attach_common(struct gpib_board *board, const gpib_board_confi
 	return 0;
 }
 
-static int ni_tnt_isa_attach(struct gpib_board *board, const gpib_board_config_t *config)
+static int ni_tnt_isa_attach(struct gpib_board *board, const struct gpib_board_config *config)
 {
 	return ni_isa_attach_common(board, config, TNT4882);
 }
 
-static int ni_nat4882_isa_attach(struct gpib_board *board, const gpib_board_config_t *config)
+static int ni_nat4882_isa_attach(struct gpib_board *board, const struct gpib_board_config *config)
 {
 	return ni_isa_attach_common(board, config, NAT4882);
 }
 
-static int ni_nec_isa_attach(struct gpib_board *board, const gpib_board_config_t *config)
+static int ni_nec_isa_attach(struct gpib_board *board, const struct gpib_board_config *config)
 {
 	return ni_isa_attach_common(board, config, NEC7210);
 }
@@ -1702,7 +1702,7 @@ static void __exit exit_ni_gpib_cs(void)
 
 static const int pcmcia_gpib_iosize = 32;
 
-static int ni_pcmcia_attach(struct gpib_board *board, const gpib_board_config_t *config)
+static int ni_pcmcia_attach(struct gpib_board *board, const struct gpib_board_config *config)
 {
 	struct local_info_t *info;
 	struct tnt4882_priv *tnt_priv;
-- 
2.43.0

