Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFCFF2673A3;
	Tue, 10 Jun 2025 20:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749586368; cv=none; b=sxF6NOSWaocArB20mCNhDaaults6JC4j+D+2e1xuTANlmVSu3kpl2FH0NXpJzK4lbSQc/oKOuzFIcRjzWsehSCxtCl/m2BeYKN9bF155Rog1sSmNEQKdQc6wzDSBGSBVThi3sUiyutG3Mh8Oh8zR/yCCB0jDAYf/6QIuoIN3+1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749586368; c=relaxed/simple;
	bh=Zj0DJQ2LjvR8RfDcz/aUcqwlhsfxsaWb2eD9l2vAVbQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C9C/D2U8IqTdoERi418WlnmoQj++kfnL0tdUxoos6hYQJABPLyV77H3/UsH3hMpDmbtM41HXrVEUPqYT5hXBh2SOfVO55gyBpChWGbwi1PLXjpHcbssich4YLhW8f+gGDO6cYyRg0jRl1fy7Q2PVD+TuBLVuK74rg5/0yjwO6M4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Is6f75Ns; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Is6f75Ns"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-442f4a3a4d6so1189105e9.0;
        Tue, 10 Jun 2025 13:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749586365; x=1750191165; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O1WSJKtNh06L1CyP8FQkWQEN6wo4ZLtufwHyPn7x8ns=;
        b=Is6f75NsbUm3t4aPHhAeXJ0aLqiUbGtXG0wwNw/TatemmDUHRW77zP0w+lt5RWmiG5
         vwkjQtZMAKGOVlx1Q/alyzJDIURywD9ZlXGvvboqtJHPvD2ad49/t2fcrhMBb3iXcn9V
         Brx2VuFzZzr2zJ1GZL/1NQS5UoNuuDsR9JqEKu1su6sWFV4SqH8gSVa6rbUX30C5ZSIe
         neZfXOXQUXR2PiJmL0uR19Yj5yRSTwhT1cRcCu8y2nEXMBiVOlN45Y9m9FtpCP76goSv
         F+aLc8bAUmjeSoIUW0EzAFZLrSWctLh3zlXW9JYSmfLtDElahNZto+XZu6bYP5YwI9I9
         QAmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749586365; x=1750191165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O1WSJKtNh06L1CyP8FQkWQEN6wo4ZLtufwHyPn7x8ns=;
        b=dUhwCQKmZaDGMXj5RdclwHqoTbYdS/TTM9v51p4beD5XyniGIEFSPkULAs99Sn6TyK
         MEBeJl3MMJiDZQir7MS7TJ2mtW6DOSD8GrFVRuB705Qo4kyC7nD5LvXufvsLDDoGM/Eq
         i8RwOZ6XWq5Ol+Y/lUofX0ssucb9VZOGKEZFJOQ7s3EtBEPnxL470Qt4BxtMoLwxoXqm
         3u0N2bEamocG5wTO3CEc/+ihcz4hs2SXrmQq9JUf0bVexiOKBm2R4SlUvYVFgWEmcEML
         LZ5GypyI2OjgXAj/fql2OTvPAbFK1dG6W8L+5dduUWA/QX1mrOIStnY1SYFXhOOgUms9
         Vu2w==
X-Forwarded-Encrypted: i=1; AJvYcCUYCKIZ7a2rgohuHT2dr3hTBSmxv0fv6mH6BFAo8J+PYZ+oFpuCti0x8BxTFqXtcdvFiO4c/4G3M3QfEUQg@vger.kernel.org, AJvYcCXAQDNEi894DUy5N+CsBtDzkiNatRifl5FU1sW1a0LZaDg7QGvX7mV6UbKMKO8yls2UoJat3f3wLq7g@vger.kernel.org
X-Gm-Message-State: AOJu0YzEjDA40Ms6+M1Vh+IUWl6P1JxcK96TijJBOEV7jb+HUQwZlCqF
	GOEoo4jsuz1Lyf6IwglrcPRhM+W8uynh1XFtXalIAlzITMzEVzLZtqdy
X-Gm-Gg: ASbGncssTb7DXxR2od6NGbUfkqVNkPzfjLjCG3B5JFCcfgR5sZ9fuQT+FBoRyePKQny
	h44yAvQRnvSwYXl5qP551aLXHwAUwHwT7HMPMOxH3faFqqUXhHN2C4kFA7O/1wfSRV4UD7ZObsF
	BOwQwfzfszEbg/YXknqqnrOnfNKzlj7YfRaD0WBDSpgblrhQ24Ss1kq3M4OqMco6jjWHcS4ml2I
	FTRCYHtncsV922JV+ItdGDZXgWHGnOuvkfPCTAK/Dz3dxNpdRYMwD0ccc37XnWtznJxi+x4FrHg
	XNhD5ZWqEmgv5ZciWYYFhWY9162dXHEUaWUbmVN5WB1uQUtwQIV7/1eAPJGBeOI6xNHfAjuv5uA
	=
X-Google-Smtp-Source: AGHT+IHineQrgugs25LCya85uBq6rIjv937s6Fj4YMPKEhIETsihHbGjyPMBhZchKD/YHDl/HXkiFw==
X-Received: by 2002:a05:600c:314c:b0:439:4b23:9e8e with SMTP id 5b1f17b1804b1-453240b0e39mr7125885e9.3.1749586364752;
        Tue, 10 Jun 2025 13:12:44 -0700 (PDT)
Received: from giga-mm.. ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a532462d93sm13434970f8f.91.2025.06.10.13.12.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 13:12:44 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: sophgo@lists.linux.dev,
	soc@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Jisheng Zhang <jszhang@kernel.org>,
	Haylen Chu <heylenay@outlook.com>,
	Chao Wei <chao.wei@sophgo.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v7 4/6] arm64: dts: sophgo: Add Duo Module 01 Evaluation Board
Date: Tue, 10 Jun 2025 22:12:17 +0200
Message-ID: <20250610201241.730983-5-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250610201241.730983-1-alexander.sverdlin@gmail.com>
References: <20250610201241.730983-1-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Duo Module 01 Evaluation Board contains Sophgo Duo Module 01
SMD SoM, Ethernet+USB switch, microSD slot, etc...
Add only support for UART0 (console) and microSD slot.

Reviewed-by: Inochi Amaoto <inochiama@gmail.com>
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 arch/arm64/boot/dts/Makefile                  |  1 +
 arch/arm64/boot/dts/sophgo/Makefile           |  2 ++
 .../sophgo/sg2000-milkv-duo-module-01-evb.dts | 31 +++++++++++++++++++
 3 files changed, 34 insertions(+)
 create mode 100644 arch/arm64/boot/dts/sophgo/Makefile
 create mode 100644 arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01-evb.dts

diff --git a/arch/arm64/boot/dts/Makefile b/arch/arm64/boot/dts/Makefile
index 79b73a21ddc2..3a32b157ac8c 100644
--- a/arch/arm64/boot/dts/Makefile
+++ b/arch/arm64/boot/dts/Makefile
@@ -28,6 +28,7 @@ subdir-y += realtek
 subdir-y += renesas
 subdir-y += rockchip
 subdir-y += socionext
+subdir-y += sophgo
 subdir-y += sprd
 subdir-y += st
 subdir-y += synaptics
diff --git a/arch/arm64/boot/dts/sophgo/Makefile b/arch/arm64/boot/dts/sophgo/Makefile
new file mode 100644
index 000000000000..94f52cd7d994
--- /dev/null
+++ b/arch/arm64/boot/dts/sophgo/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+dtb-$(CONFIG_ARCH_SOPHGO) += sg2000-milkv-duo-module-01-evb.dtb
diff --git a/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01-evb.dts b/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01-evb.dts
new file mode 100644
index 000000000000..b1f8a5787861
--- /dev/null
+++ b/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01-evb.dts
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+
+/dts-v1/;
+
+#include "sg2000-milkv-duo-module-01.dtsi"
+
+/ {
+	model = "Milk-V Duo Module 01 Evaluation Board";
+	compatible = "milkv,duo-module-01-evb", "milkv,duo-module-01", "sophgo,sg2000";
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+};
+
+&uart0 {
+	pinctrl-0 = <&uart0_cfg>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&sdhci0 {
+	bus-width = <4>;
+	no-1-8-v;
+	no-mmc;
+	no-sdio;
+	disable-wp;
+	pinctrl-0 = <&sdhci0_cfg>;
+	pinctrl-names = "default";
+	status = "okay";
+};
-- 
2.49.0

