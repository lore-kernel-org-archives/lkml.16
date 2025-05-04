Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A769B1B0F30;
	Sun,  4 May 2025 10:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746355591; cv=none; b=JRlNvXsGa50nyLlIeCTSUv2yif76px1rXI/WIiUYUMayra6EqzXOKknWZuVxNsoYJnCkQ2ypS0E5jfKtHPchIoXY2iQ1Z/QHp2k5zgDOlkXkVhJ7x/qbmuI5E+1xCcy6YVVtMBTfr0Zq0KQUlpE6OQEOYQ7nRWzeTPAo3vvpzpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746355591; c=relaxed/simple;
	bh=byR4KjoiUZhFnEtGNh3vbnUqYEIKEWTbub7tpiSooj4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nUWJZAufMsk8D0lPe/E3hy9YDwjKpknT/CcmtEQ4u8pSciyVmDtrANrovrvh2bIlmW9OJBRikVjvQYiqYvZdKtpinxNH0s+RXp59ZczVnENq9J9LmLJO3+oPmhPV8Rjl1GPcYCarQTBWQJuztH3WuijmXkIvVvCla3G5SbOWb3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LiDx2R+I; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LiDx2R+I"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6ecfc2cb1aaso42419656d6.3;
        Sun, 04 May 2025 03:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746355588; x=1746960388; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jv7/7EvCAlYgtUnyEHnXc7BmIGdTgL1yOUIUImvH/ec=;
        b=LiDx2R+I834MgC3bBcG3qZMeuKlCUHi1UT3VNmpAxEOATGnKtSVvYuCnKTN8eUDKNT
         qRbDJv0JAa2GEnBQoZVn4BejeudoFDJ2/KiY+GEcYLiFhuhpyXs7wB4eWZCjE0hT+LSP
         CAy/NTOuEQ4odjSBp3CfEKy8V+lSPRmpIn4LiyhFJcgU/WmvTwHd/N2Y5G/YEGl5qV1a
         1tQiER0E0JOkSSXZnO6oavhEBTW9KzM35Q86Dsbo6333vKscqFTIZAgvMfWz6N/PQBL8
         bTR10umwoB96fDKMXhf2snSu5UZMxaweHdptabKOXqoujT3znVMEjb2X73NP61/FEu8R
         OT8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746355588; x=1746960388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jv7/7EvCAlYgtUnyEHnXc7BmIGdTgL1yOUIUImvH/ec=;
        b=bC42qgHo2649MnSov4Fs4Gw8a9+k9Ur3EDAs92tvs6dFcfiLfLbZVhu30qG2qIc5u5
         Np7cgzD94dwNeQTLdWvgMqgNIxq4k/EplmW61PRNazEdDkBKmNd8cbRqNR06ej2bKXon
         AbW/fnyKx7cK/UYoRLDnleCF4FRwh8VoGAqZoqTMidB2UBuM2pna/VuJshOaRfRQVTcw
         emGbb4rEaCIqafr/Ct5vuGejAmDFo9UE80eNBEGkvL6Srvxj3lDe0iZP9yB0MbcVeLZl
         0SySdTlufbVdBi7yYeaR7yoyDNrm0HB3fREQNzGfC/lq14Ced7Ov1X3sODxzJubDSlax
         7rvA==
X-Forwarded-Encrypted: i=1; AJvYcCWiwmGuCqcbnG0SdtjygUfch0OM1S5LIwbdOztAxcV0Wue4KpLDm8Er21b5vyyaLXL40B+4gNfVQa2D@vger.kernel.org, AJvYcCXiQj5PMf3e3/yBGhlMO7D5QMO8LEUYIpz0qTdZVKaynZFy04iszBIbiFFWyTrYuQiB+k2NXsxWM8rDLPoI@vger.kernel.org
X-Gm-Message-State: AOJu0YzJRkf9MrBZcFSaSjPHj/pPVDPjIvJla0FzFGWmpmCC7QE6uOl8
	rVt9yfHh5xGvtJeFXtr4z6pD6mGtXalVz4fwMdmIOwD0GIU3TMMW
X-Gm-Gg: ASbGncsYPQl0ysUOabffIy4cWaxQi93CfiKUM0qdKdiPx7CmpBsrOmu0n5/iYuRjgi0
	GnxKo5Q63QZQ6pNU0MvwjgFVwjl8lNKys+saxpAtZfWiajwC+gX0CCb2hSpzKAlzwqn4NsGC1h2
	/GHWbnA2i/9XZDa7ZDhKgGCfC0xlhhjNGneIVXKeo8DmnYU2I3n2VGxHcT/NsapFvjoIvwcqjZD
	m9SifMnlnARJV5CZYtbHjxkyMJr23w2EdfCeyC4QwWhz2CJ8zgpX/jISvZWbCAcLx3x3e50r/dd
	Bnrs6gkmPKTrRQks
X-Google-Smtp-Source: AGHT+IFYpImqiuOB3O8DVQFeUND8eQIrOsqgcV+l8Cmmmw+ZJEhkZoQpsjSK0P+vo8PHzjh3eP0gPw==
X-Received: by 2002:ad4:5e87:0:b0:6e8:ede1:237 with SMTP id 6a1803df08f44-6f528d569e7mr54061806d6.43.1746355588539;
        Sun, 04 May 2025 03:46:28 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6f50f44f415sm41792616d6.86.2025.05.04.03.46.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 03:46:28 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 3/3] riscv: dts: sophgo: switch precise compatible for existed clock device for CV18XX
Date: Sun,  4 May 2025 18:45:52 +0800
Message-ID: <20250504104553.1447819-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250504104553.1447819-1-inochiama@gmail.com>
References: <20250504104553.1447819-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

replace newly added precise compatible with old one for existed
clock device of CV18XX series SoCs.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/boot/dts/sophgo/cv1800b.dtsi | 2 +-
 arch/riscv/boot/dts/sophgo/cv1812h.dtsi | 2 +-
 arch/riscv/boot/dts/sophgo/sg2002.dtsi  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
index 88707cc13fb4..90de978f69c1 100644
--- a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
@@ -29,7 +29,7 @@ pinctrl: pinctrl@3001000 {
 		};
 
 		clk: clock-controller@3002000 {
-			compatible = "sophgo,cv1800-clk";
+			compatible = "sophgo,cv1800b-clk";
 			reg = <0x03002000 0x1000>;
 			clocks = <&osc>;
 			#clock-cells = <1>;
diff --git a/arch/riscv/boot/dts/sophgo/cv1812h.dtsi b/arch/riscv/boot/dts/sophgo/cv1812h.dtsi
index 0974955e4e05..9a2a314d3347 100644
--- a/arch/riscv/boot/dts/sophgo/cv1812h.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv1812h.dtsi
@@ -31,7 +31,7 @@ pinctrl: pinctrl@3001000 {
 		};
 
 		clk: clock-controller@3002000 {
-			compatible = "sophgo,cv1810-clk";
+			compatible = "sophgo,cv1812h-clk";
 			reg = <0x03002000 0x1000>;
 			clocks = <&osc>;
 			#clock-cells = <1>;
diff --git a/arch/riscv/boot/dts/sophgo/sg2002.dtsi b/arch/riscv/boot/dts/sophgo/sg2002.dtsi
index 6f09c9199102..98001cce238e 100644
--- a/arch/riscv/boot/dts/sophgo/sg2002.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2002.dtsi
@@ -31,7 +31,7 @@ pinctrl: pinctrl@3001000 {
 		};
 
 		clk: clock-controller@3002000 {
-			compatible = "sophgo,sg2000-clk";
+			compatible = "sophgo,sg2002-clk", "sophgo,sg2000-clk";
 			reg = <0x03002000 0x1000>;
 			clocks = <&osc>;
 			#clock-cells = <1>;
-- 
2.49.0

