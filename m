Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19BD719CD1D;
	Wed, 30 Apr 2025 02:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745979002; cv=none; b=kfUyhkd3ziReFXXnU2IC1w9TOdkT/QBzMKS7iRNjJXkTD3+rliCacn8dJh94ZsoCNizd485Apgb6JF3UIY/3kMuJzDnvseU39TExf6Ktdh9ENud4O89poVzSLaZX7F4zjX9xb+i3BSrRRr42WQjGOlJB6QKsqFECY/MEQxFc+DA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745979002; c=relaxed/simple;
	bh=1tyOG1q+z5x1OL3sDWuo8oLI4971HZGZMdBSgC2mPDc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pqScAihWuxkLZQHGowvNF2FDj/Gnk4tcklJBLsH06jTs9HMIfX1p1VZrt9w9jf1pbuWaecFuDUiVUfJGT28Mj0zVJVssJFuTiYK1tmVBrAbaL3YVp5Ac3lalV5pZnIps90A/gk8ub75JRtr3sAxX/iUcIkOr8N1MoLkHWkEgzWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OyCpRvzH; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OyCpRvzH"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6ecf99dd567so98333356d6.0;
        Tue, 29 Apr 2025 19:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745979000; x=1746583800; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OESwfI0upP7wQb7BEkzIfrVPZL2ZfmY8EtLpKrTgHwQ=;
        b=OyCpRvzHFnorIqNQLRgqpNhe0BtC4z+xUJ4a5LQ/uDcJtt7MrhWAbMbUzRkovqZvp9
         YDDHD+dJH+Fny0AHtSkr7ycXTrs6bLFBsG1mvFAR8VptmIfY6i6rQf3qSexkmfaIsAAD
         D73eKWPfQ47ovG9d96wDvWbSuWelzos+Vld4m09OEllo+W+EyRy8QZFSeNRvdZF01GZY
         RWv1+ftDmNafU3eL0PjKDkTCax2JTY6bq+pH28dQL9kInXMJCgYvEbxfJRtWlKdQ4guX
         7iCJJIwYxV1rUVzSRvu7phDajVV7Nj/RSWVAEhK6+nSr7EVKE+wl58+IvhdRj1o3EDpv
         NQqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745979000; x=1746583800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OESwfI0upP7wQb7BEkzIfrVPZL2ZfmY8EtLpKrTgHwQ=;
        b=C7NvV5FMz9CUZrNuHv6vZar18iDknERGMTYX4cuw22dAGUXUFO4NZWPJsWy74oHX4w
         wFNpI5BNnBv5AOA8hkxUo+dXOAw811cDUu0WvrdS+py5Qguz7h/z/3f5DAWRNPYjx9p6
         sfITSwS2De/Elk41HUD7yM+VylI4sAcIEaZqICrBnk91V/+ojA4cCjblN/0QeuzyZRDo
         aWXvI/tCuRoQzOv4/gI/B+pgzW/fPaz87WS2V1iDi4JrOu0mknVSW8xBooqanHRVVumY
         9tX6fz52Nu7o3D1nTYNMPc61B9bJv4sEdGKNsjfcwdngBEV8xM59hGsLFoKw5GpyVdEs
         0XiQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQbxmpEosQnYQlbTkcAYyhUo7icC+F1Vl7INdXypDFuMqfab9qtlpohRTchjN5krWfyiMuGgppBY5x@vger.kernel.org, AJvYcCWYWha+jEPi/ArOOz51wKd5vnldIoDFED29rZXG2fFeJ2I7AclG08QD24nEOigeKDjonHBs1zmoKlzo3yyC@vger.kernel.org
X-Gm-Message-State: AOJu0YwWBF2wUqqjeSzGeRMD3wSlrCa+uxpByMZ64kHziaB+bsfxGMP8
	/RLtoE1n8ZwX0ddoG13xU2Yl135fDXx8nj+QVTz3R5iBORWzAwKf
X-Gm-Gg: ASbGnct+1lr+tXD9/ZK+IpOxULMbb5SaJ2ljfnmRm8LAzlZVUIjmYwuZTfZbpwN/nO7
	toMfqXSmexakIO5uwi6an9UBk2ib4KFFkRymi1wOLtyIiY0BRIpGoGOg9DVX/SOnlgNla3C8IO8
	QcLjGX15iMz5b21J/H5F8lkNfS0tHE2A8k5yJ9ugsKw+IAsB4MxVfEUFDPnxQSbpwxm82W6d3UN
	OwAGI+xM2rF0n+ATbuGcXj/k9U0m0Y+Z78b+Jf6VyiMxC4v3zOuRVpGlCAHOchH8dvgpZ/iLo4l
	wBdm0VCJ/KlYh2WLmuEjv4GT43E=
X-Google-Smtp-Source: AGHT+IEw+u1VOIT3kMd+/VKXR6Vg7KtGCCSMCagVWCz8MZpIQ61san10JzgRKCphUO6By5kz9Ks2qQ==
X-Received: by 2002:a05:6214:2486:b0:6ed:1da2:afb9 with SMTP id 6a1803df08f44-6f4fcebf45bmr28113456d6.19.1745979000035;
        Tue, 29 Apr 2025 19:10:00 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6f4fe70a277sm2901756d6.55.2025.04.29.19.09.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 19:09:59 -0700 (PDT)
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
Subject: [PATCH 3/3] riscv: dts: sophgo: switch precise compatible for existed clock device for CV18XX
Date: Wed, 30 Apr 2025 10:09:31 +0800
Message-ID: <20250430020932.307198-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250430020932.307198-1-inochiama@gmail.com>
References: <20250430020932.307198-1-inochiama@gmail.com>
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
index 6f09c9199102..b9e4b4687046 100644
--- a/arch/riscv/boot/dts/sophgo/sg2002.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2002.dtsi
@@ -31,7 +31,7 @@ pinctrl: pinctrl@3001000 {
 		};
 
 		clk: clock-controller@3002000 {
-			compatible = "sophgo,sg2000-clk";
+			compatible = "sophgo,sg2002-clk";
 			reg = <0x03002000 0x1000>;
 			clocks = <&osc>;
 			#clock-cells = <1>;
-- 
2.49.0

