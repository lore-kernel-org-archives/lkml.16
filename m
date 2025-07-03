Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D37042F29;
	Thu,  3 Jul 2025 00:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751503247; cv=none; b=hzv9t6C39ppPctMMCRIEarFct/0kf7AUE2PODIIW6uwke5DzWiMXaDpW01/LLay6lbYY8SWGKQzVlZBEIONMbBH1upXuu7cNW4193YUDCj0heiUoIs1RIW8gHGfpoDDEizE5hjZ+XKPnCZO0spiTKE6EbIC1zWA9B+4aeQymYRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751503247; c=relaxed/simple;
	bh=lvfjboLM65D57OmlVcd5+/8TTINLieQbyt3q+HrFWX4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=a87mDlj7Y/RLZTi60HHL5smNrb/WYviqvhmZIWFpuTX7ofx/SGHly612W+KIz8XCJ7ma2VhK82uquwnfBapxarpBQ5E0gzg9TTnn60ilUEoVlJtFdD/K3jW8u5NRWqBCr3p3PYUWblmenC2rgT037+OxaGXTlGZ/8pQgFM3XiIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hmsS2N/Y; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hmsS2N/Y"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-747e41d5469so5598373b3a.3;
        Wed, 02 Jul 2025 17:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751503245; x=1752108045; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QGPW00Wqzr+TkyN3TBBplCnltrgypUhsxgUVEyLdzHk=;
        b=hmsS2N/Yzh5wT5lzgZX4veC8It5yJLPcNRJPAhAwWaJkuQxjp2+wG0syvHF+Xv5Nsx
         psoLrEEDbpTiheRDcnOgk0/Kl06lJxm41QBstN5NRFD/oHgk6l59Fn2SnMLcIQp1h1d0
         Z5SBundJ6ugAkF88+4eW+PtiivgBQKQz28EolTmyDJNC5aYJuLfZQdaK0zI/neTSQt1L
         ZaX6DL/n+aZd7iSn9uA9aV0h8DV3RHZJaJzvsPugRtrjjz0iehoQOTqNdiANkkxRDNFb
         ulDMLYDU5x298u+THbz3u9hWOjVDi5K9ozNdhTa+gtehvndkJA3/6G5vSh9rlpQJ7zDA
         Wd8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751503245; x=1752108045;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QGPW00Wqzr+TkyN3TBBplCnltrgypUhsxgUVEyLdzHk=;
        b=p14YVAsM8PqnOK/06RxNFdtYd1PhsOUUBGeq07cmnot5PHe4XUqvWM50jZxalW75FI
         FVDe1Ns25p2WrgK0/jpy4VzZWxD73Ndhz+I5ExwRmq/VlhAsJvA0a9yZw9f9OJJwzP4R
         kKfhd6kBqHqwjwY/zoBH+fvcgj7tPIBoXHPbixP3S+Li5KC8rjEc2F0N1ToLCvfx+J84
         7e+ZGXwNE3oUs9+qcyXlzYwVeYwUoVtZo8SCcL6GnIOC20Mx+WfHJGO34UFJEA2sy9Hn
         yMKdJMkC9D4Jot4zSo65MT5PEaoqeoEIxiSx42Tz8TcbYEDsRcRYOtPMUeR1CNNdkSjW
         lWCw==
X-Forwarded-Encrypted: i=1; AJvYcCXe3AXp8B8A+2SA+2ZemnLhwF1XqAym2a5h3AXEGtqpK4trNicDPhTiR1uFCyApZD7GNOJLZtnN3D5kH2A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0OUOYDLiAF4COLtL1VSGNgVP3tq9WEwdEMIqJty9JKo0eyQ44
	Zp6Iz4lt8T5JSOo28ocY0g+OG1/SuJR+PnFXqSuv47EngMDqyhYimpr4
X-Gm-Gg: ASbGnctbd5njBrUOacFlxu78Fw/qwXAPl7hW9M/GyRJWPzpiH36Yb8kpOnlkpgqz6H1
	CqVrIaGuWtJNpivlJluB9/zbta5qW63/rkl3CZ5/v/vvxSecEE2yUR9UmTOKSd5l2JaiaeVy0rG
	Rq8lOB558HvOS1Meq/QoAUSZzsSbCxsnWOlFCBjCDQxWxEThwWaaTRQcDqceTfKaQazm6RDGpc6
	nnDEB6xPlXc5o2oeRGCQdJygWKUKwshNyBr1NI4vcXSuH21+sSrcmSbLTbwtRSkxRmgfFOufPBW
	rWRn48CvwwzaBPTBMGmAtOOw0xHE6xerTt8tonL4TXXvgzFu7ckt2oZKJ65OyKHDbRPF4QbB
X-Google-Smtp-Source: AGHT+IFEgHWRSZOM1OGOkaV/VMwcCoCEpYqFzUShN8zioQuMCjdKGgVKSOQXH56aFJAs4t/pv3Uo0g==
X-Received: by 2002:a05:6a00:2349:b0:74a:e29c:287d with SMTP id d2e1a72fcca58-74b5149d55dmr5410675b3a.11.1751503245093;
        Wed, 02 Jul 2025 17:40:45 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-b34e31bea22sm13872345a12.38.2025.07.02.17.40.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 17:40:44 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Longbin Li <looong.bin@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>
Subject: [PATCH] riscv: dts: sophgo: sophgo-srd3-10: reserve uart0 device
Date: Thu,  3 Jul 2025 08:40:23 +0800
Message-ID: <20250703004024.85221-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As the uart0 is already occupied by the firmware, reserve it
to avoid this port is used by mistake.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts b/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts
index 96ccb6120114..1b506972d465 100644
--- a/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts
+++ b/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts
@@ -113,6 +113,11 @@ &sd {
 	status = "okay";
 };
 
+&uart0 {
+	/* for firmware */
+	status = "reserved";
+};
+
 &uart1 {
 	status = "okay";
 };
-- 
2.50.0

