Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A4A2101FF
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 22:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748038787; cv=none; b=EphM7HPqbVSfN+XnbApV0HOMJtiJJQYAa2moXETbQYF5UAAb/XdV+otnx+PJUSyFLPKyJvOpzaFUdRWIgbmrRoo69MrkBmwk/flXloa89DAvXwea6K7s9brQtbSEE7w36sbRelbtfXySncDLCxO13D9DQaR5Rs03Ts+tNnMQ45M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748038787; c=relaxed/simple;
	bh=XBS/3t020iCieSpkJX/q3pCPDsTCYHGQJz9d/9KN+nc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=e5dijq2hnA25KHupjmunSqrW1j8RHdwKwYj02uDyLlmSMFisXwDJoJ1X+qS7qmgxqlOTCEuQirnRsvUAPUFu6/4pBE/ImjeuB/FKLYzggh2EPR3z4DNjxMP+Ct/CaXAfWpPzDxxzRavIx+p1715cUat8IMKzdQy+t6mMPgETZSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sima.ai; spf=pass smtp.mailfrom=sima.ai; dkim=pass (2048-bit key) header.d=sima.ai header.i=@sima.ai header.b=Rux6R/Nh; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sima.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sima.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sima.ai header.i=@sima.ai header.b="Rux6R/Nh"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-739ab4447c7so64244b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 15:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sima.ai; s=google; t=1748038785; x=1748643585; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/JnkXPK73+jyylcV6ryL6CGzS49ASbFWgmp+uGzB8Mk=;
        b=Rux6R/NhuD3s8fflH7WkRCaU6koRLv9WnFSiWDVuAXbe5G5arWsjYpQ+qsVZk7Umdu
         9mTi/OuoowhWki7TL5k04cHaQCt7rCQnCc+AULb8ZN8g00wrXqMoNE+Vj6hdJNN3XWZD
         oqkvoa7hzJt4fX4wt/3GcKINOuBEEr+iUHQOfFIK3YYsZZYEE3pAlXCqf4C+M1aoYxqH
         FfImslK1ywSXUKqhGMGd0ESYN6gyzpOzHtHf5cynPoYkfGFMTNbzHhUa/5fbaFOd2L5F
         M64nSwHfMUfXB15GGP/NQ6+6QIdOhYoYtpiraYyPe7tzuDhxrEPUvvVxGg6u1OEDeJdr
         CQ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748038785; x=1748643585;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/JnkXPK73+jyylcV6ryL6CGzS49ASbFWgmp+uGzB8Mk=;
        b=TPbvzUUkl3AxUTnZSqNUfT4+u++9bD9MXR/8Ll37Ni4zBG1yy+cyTzxAS9iK2HD/1o
         Ay0rJDN1obZ1e55/cMMZZajRPRBNym8b0b1nMc6Vk1E7Rg7RY8+/asRCuXx+N4XnYx+e
         zlgbeLeqVmy3EURLict1s49jIfajtvf11ySTkAcL3PQVgCCXf2eXeHSI92B5cwVArksj
         lmZZ8UN/9bCg58vO+vVXgOkx602IgRaA2UvaAwpQT7/tt/EBbePv05V/afDJ7d1OEEbZ
         ciZZipJ9/F7xw2AG+724orQ/KeQd06cX0IU3Ig7uz3BA3lWU9DZ9GKbPRLyj54Th0OrZ
         EfGQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8oO18EoxAWj0jlXDYGwbloKpSbSBON6wZc4t9wQqJC7vWun6dUc8uoGbOVwrnKj32zkzDjBmIrsqxzSk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTIHC+NzOV2LP+EgacXyn+Cy/2rCci0t5GyOv6/OFY4kJWSpdV
	vXa4g96uRME6zE1SYBXZC6hEBVVsDIXEL3bjajWrgfEfJsRZbSCbglOmuX+jW9avin0=
X-Gm-Gg: ASbGncv9Lgz7/+vUDqy5lntOy7zNUF4ZGbtaqS6DpPoCwPpNfTaU9GhmbEceFAsmq/3
	+aMeGYjQOYyxq4zm2WBoI4Ab1UknKf1gvp2xbDzMV2/ck8y2cQJ54GGd5Dp8OH8aI/Lc8D1MOFC
	ecTfWpZXXHjIHE1Bl04UTUm/YtPdxaYmuIabPIHp9djvKjHPwnCF9qGAyQzExSWagZtk2BVsHTg
	uRvOzVKH2En9S5PGcf7plpXoxotmNvflgLzDUio7PSdZ0hY9flztGJeL+0HWCQz+mQOGHF+gs1e
	RiCR4xwLxYHnOOD2F2zWzDIp40TsIDIn4bOTr4V2yd+dzG4Z5kQvW7O+6KlSHbM2gdCqow==
X-Google-Smtp-Source: AGHT+IH4iorXbLRI5th5BQNEszM355fKXRMdiHktjuRWLWFcJzliHo+SpZz99EM6pMvifOreU1FWMQ==
X-Received: by 2002:a05:6a00:8083:b0:730:915c:b77 with SMTP id d2e1a72fcca58-745fde77910mr655216b3a.1.1748038784743;
        Fri, 23 May 2025 15:19:44 -0700 (PDT)
Received: from nikunj-kela-u22.eng.sima.ai ([205.234.21.7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a96dfa2fsm13309759b3a.2.2025.05.23.15.19.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 15:19:44 -0700 (PDT)
From: Nikunj Kela <nikunj.kela@sima.ai>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com
Cc: rmk+kernel@armlinux.org.uk,
	0x1207@gmail.com,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Nikunj Kela <nikunj.kela@sima.ai>
Subject: [PATCH] net: stmmac: set multicast filter to zero if feature is unsupported
Date: Fri, 23 May 2025 15:19:38 -0700
Message-Id: <20250523221938.2980773-1-nikunj.kela@sima.ai>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hash based multicast filtering is an optional feature. Currently,
driver overrides the value of multicast_filter_bins based on the hash
table size. If the feature is not supported, hash table size reads 0
however the value of multicast_filter_bins remains set to default
HASH_TABLE_SIZE which is incorrect. Let's override it to 0 if the
feature is unsupported.

Signed-off-by: Nikunj Kela <nikunj.kela@sima.ai>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 085c09039af4..ccea9f811a05 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -7241,6 +7241,9 @@ static int stmmac_hw_init(struct stmmac_priv *priv)
 					(BIT(priv->dma_cap.hash_tb_sz) << 5);
 			priv->hw->mcast_bits_log2 =
 					ilog2(priv->hw->multicast_filter_bins);
+		} else {
+			priv->hw->multicast_filter_bins = 0;
+			priv->hw->mcast_bits_log2 = 0;
 		}
 
 		/* TXCOE doesn't work in thresh DMA mode */
-- 
2.34.1

