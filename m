Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD3D828314E
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 13:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749646838; cv=none; b=vAqruyjoYmiAH+ls+dN7GEzq68WlNwUa2pqoL3upKpkYUurgs9hnwS/koOuz1QeImbEIc0QWLu9ZRvgFkUIDbSRFCu4HXJljLq5XTdfUMao76S821876ydxKDTF56uHPgflGr7SR1AOSasPqxEh+fb2xLeVtQWaLv16EUtDvvYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749646838; c=relaxed/simple;
	bh=Y/UVoA63Ub/h5tAaXT2Oci9EF/b7F5JY0JZpRJfHkVo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Bi9VJopgUfgNVOPxNf9FDO/gZIu3zGu0a6LkVuZ4TLoHfa7MyQvmXPmWyShx82T8OBKGTLHn/BoKZtZr2KHqjpYQueUR8DKdgb1fEKwdWg+r2rlsLsg+eh/W5W+ADp0GzC1IzaPHkeGS7y7mjtTgDuuN0NDE03kva3RvHV1e05Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=oXcs3sLQ; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="oXcs3sLQ"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2349f096605so79112705ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 06:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1749646835; x=1750251635; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QndPkvYOfHZnlmLnlurnlWYXTuNHVByXqbm2h3XNBdM=;
        b=oXcs3sLQgxY/5I62qvtj8fnj6WT/YTb5sqJ2liafAM+1KOYQjimlZEWo+ogrgrCiEg
         ImzEEhuZkPRJ9BHoT02UFoM1Ot8KeOvQpiRKhNKaJ6oNgEe6T3wEOAU+utVTd5YRV31W
         r2t1lA7UVzBhyiHyDpcqnSc/Cwodibeo/ATWceagaq0uMu8PA7mQtWEpEOdZa/ji1xeO
         i/XmSO3lylDCvwHu9bkkNFvCpxa3veTcfnb8S7SF5l6GEdkhAQmf0zrfsbt4JWTr+sMJ
         fz6v1GT4R2Ieb9/UZ5WjlUZEQjYNu78F2YjAPmJ7lCEkl38UymNQfkofdC9l+0l9dtBp
         xp5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749646835; x=1750251635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QndPkvYOfHZnlmLnlurnlWYXTuNHVByXqbm2h3XNBdM=;
        b=tR6g8g2BwJq961vmmGQ8udQ2QTZdzEmq80VzSjAq2cFKnYTNO35HcJVoR80xsIUz6B
         t1wiT8oGPlKkS0Q4AJB2Wh6TX0pcGSogs5JhqxOmGELIg55dBbSqXldCsTL7mubLdi+1
         NF8sA/QQ7HKxbehoqsmK3QUeYZWyFthDQhdnafW5PxKI1AgTGVv0gRqOY0c5EIgiSWFx
         XKvAyi8pqYwDqokS0mVikywuf18DW3taxnfJjP20/N48oRS1W+4IyYaz6vqR82o+Kcqe
         xTvsXUUt+oLDzosdX6r/nyghUGyLhaVbG1xRgcSp9mZhyLYWvRhkDORlA1H+uLsIznPQ
         jRTw==
X-Forwarded-Encrypted: i=1; AJvYcCVvnG5j+AoKk4Xtt+vTn4cVdRhE+SGc0M50RMFZZ2BP1iNRuM3x0FOZtDHLCtQ+JvwBqSV8v9ck7ClGcPA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzM3olj9WawNaDT7G0OqXPvJqvgbDK4NdbwUMbE1E8DD2gYQwmc
	I0XgvxAK20LmlKudzkVcb7ccjHFUnY5eT30ahALASOMeZpPdS5ZPCAF+fVMlNgk4+Sk=
X-Gm-Gg: ASbGncuHYQn+s4JuiMkkdrILTKsaptxRQWuHF2nPVsvQiPTmoD2LIBcwmFB1cl3ajyh
	vGz0ER1AbT4PgJpm1cU3kXWfFRlHxCHb5VXgFCLxilpeOvieuplDWdM6JFPDw0I9RMEyEVUg0uy
	jBVzSAZ3A1pqonrrm8yxvH+wEnvxZgAQA1cPH4k6AOrrp5hF4zC9zKTB8SKwsfb7iQHj4jZKE8P
	4UFGDPP3I/hKb3WeyvjYD0XwukMpSi+K22qWYjO67VhbaSDmJz2sa83ClmD11vGO8hEUa7fAzue
	EIeBaBHKvy9TDKr0l4GBelaaJi+cnNfLYdwvCBPF/whhEcCE+Fdx/Z7PWUPIeAZ2ARKj+hNVrhD
	aFjfBLcWuXu0IEhPndlA4k+Np0JzJVeeU
X-Google-Smtp-Source: AGHT+IE0KPlnWtgzReoKrdu9Pb1wUUDfgiReHhnIgJSTpMfI8WW3eLySP02w8+TUc5Yxq8BHiDxUbA==
X-Received: by 2002:a17:902:d547:b0:235:ea29:28e9 with SMTP id d9443c01a7336-23641b15570mr50780235ad.38.1749646835028;
        Wed, 11 Jun 2025 06:00:35 -0700 (PDT)
Received: from localhost.localdomain ([2409:8a00:31a4:6520:3d67:ceb1:7c60:9098])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236030925e3sm86984115ad.53.2025.06.11.06.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 06:00:34 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
To: vkoul@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dlan@gentoo.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	p.zabel@pengutronix.de,
	drew@pdp7.com,
	emil.renner.berthing@canonical.com,
	inochiama@gmail.com,
	geert+renesas@glider.be,
	tglx@linutronix.de,
	hal.feng@starfivetech.com,
	joel@jms.id.au,
	duje.mihanovic@skole.hr
Cc: guodong@riscstar.com,
	elder@riscstar.com,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: [PATCH 6/8] riscv: dts: spacemit: Enable PDMA0 controller on Banana Pi F3
Date: Wed, 11 Jun 2025 20:57:21 +0800
Message-ID: <20250611125723.181711-7-guodong@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250611125723.181711-1-guodong@riscstar.com>
References: <20250611125723.181711-1-guodong@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable the Peripheral DMA controller (PDMA0) on the SpacemiT K1-based
Banana Pi F3 board by setting its status to "okay". This board-specific
configuration activates the PDMA controller defined in the SoC's base
device tree.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 2363f0e65724..115222c065ab 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -45,3 +45,7 @@ &uart0 {
 	pinctrl-0 = <&uart0_2_cfg>;
 	status = "okay";
 };
+
+&pdma0 {
+	status = "okay";
+};
-- 
2.43.0

