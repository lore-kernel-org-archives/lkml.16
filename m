Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 468E13595C;
	Sat,  5 Jul 2025 07:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751698837; cv=none; b=uCXcZt8JQINa7FJF0dSpIXt4loALiSLQemT24GUAkSRGuMxa5/Qd8GW2RI4Rkf4EZBIWAY8XXRTIMX8iPEqW/Hr8aBd+rZAvn3ZFtJFzPSlBwrhArpVel0R0jzF6BecnHEYWeonxD3UOScUTzRQRZc14BL7O4JeQUWC8k7aBBB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751698837; c=relaxed/simple;
	bh=UbB+teRlheEX2h1GboUmQdLUHrxkTF24Qmo6xyVBcAA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uIM3qLRDKYbaAGlNqpwNM8NSYjgX6MUMIbNpc2opEQxpZPasf008ZpEvXgD9m9xj0jHayd77sAj7QJE3ueAwYonZ8DfwaIlKxH1w2OVAfTY7ZpZl3t2hZ2uShjohM1n+XH6STB/Bx9Iqnw8ihKV+a2RqTZKgSX612cmCDLGzfNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cpLoFbeH; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cpLoFbeH"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-74b50c71b0aso831657b3a.0;
        Sat, 05 Jul 2025 00:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751698835; x=1752303635; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nssAUAlhMduaAjfLKEY31UHSStHFXQFJc1UCeUJTUOU=;
        b=cpLoFbeHB8ZGLqe4oFfYeeE/wuJHjdnucxAUsgEmfEe4DW35eXnTz3pIQ1YwMQOlJv
         15b5h3Akgj0lve9jO8HYfDKrhGJgBq1PfQcE3LqxXRvYhhPngNQTT6URbT0CnI8wlO8e
         EQdga74zR8TEsPxKPC3lCJBwvI36OoS7EbJn0zkwHeQQVYx/EGxAAT0ujQ2cLpUpUuU2
         J21SKrUBoJbeb3S9Aki5F9bZ7lXoHblqEr7zlkt4cLfWOCRaCQMXs/ym2mdeGNF2poDe
         Mk/lwv7VNX5T5H66YjrHUVcfRh5bPJZvFpK/UJHIhH5omA/FQ+DJZ+UNbMh187Y6yMs9
         xnTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751698835; x=1752303635;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nssAUAlhMduaAjfLKEY31UHSStHFXQFJc1UCeUJTUOU=;
        b=QWFyytqjJpJQ+2n2+4qvJCqyUnK9JbMrPzexonoRDPoYV0YohJJyznR3YZtEU5eAW1
         spDpGhXe1yoRCD/O1sueeRgHGoCC8Zwv00xztRX2UbXV+xrdfoB2GhyYI/0fjMAOekOt
         rtUp4hBlQKa5nfyjF9iBdJo+OHCJY3K3YaUb+B4TL/p2jaBiDvs9Po+bh06cLpjYRqrl
         sNGHqQIM4x3+c3IZ1bKNwR8ZL7CQaoQ9IkXPb7IPa0WlQthiTqFiqhpFfS+YLn+nOV72
         MKDsQ8mVqxMpQrXxe7D1u5aQEZbss2Q5GUTT3Q21HTLtdjzPNkwWCv54WCbUz05rKNZ2
         d4NA==
X-Forwarded-Encrypted: i=1; AJvYcCUNGEoR5RMVTFQgzr7l1o6bA7vZ6827rEx61EDnPFh6kr8NtEyVgSpE6qSBDJ/IlpEcAbqneI9e9LrdlLY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzuaL7nGbSaHLVRyGU+QZ89wlQfcButTxQsEEtksjExZKt5dB5o
	q/E4+MGFlIDqZUywYpb64fVgct4usBQiXo10DYc1qPZcvyCyTzQdgpjJzNH/RuiBNnHoHQ==
X-Gm-Gg: ASbGncsPlNO5eCxIT+bQeswS1N+6slcKg910EwQLSgYmSjpZUdgvYudIVdQr/a6iFsP
	PZpQLpz7LPFMC1ID7zkUaiHT0c3LSzosBpGCZDMt1Z/7ap2Pmmj0JdRzlpIqT/Hm/+0sO+szOQZ
	4EtTh1dIcWt+DMbz7ci2TWEeZcIsAseqxwQBqGzvwr12Bi+b7Vut+/hHEGJW3eCnFPl6RW8iaVr
	2qYEIMC+3r2HTUV8VXv3MjB91EVbmHw3mdaf3hTmJEp9p7pNJ77dG/ulO1dvBIzvjfbVjHBlCCJ
	oYLvuIrj/ImMY5WC6Ej7+SBijGIUbxWSl5TH17nbZmmF58TvoZ0qu674NHw5k0eerGxQGu+z
X-Google-Smtp-Source: AGHT+IGvNv873ht3zYXKYDK4jQOR12YQwVSFK97C52NvA93Agip6zuoIuhrdkBpAwe1Y1Kc/3dsQpA==
X-Received: by 2002:a05:6a00:928c:b0:742:a77b:8c4 with SMTP id d2e1a72fcca58-74ce8824f1bmr7863083b3a.3.1751698834683;
        Sat, 05 Jul 2025 00:00:34 -0700 (PDT)
Received: from localhost.localdomain ([119.8.44.69])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce43d5186sm3638341b3a.169.2025.07.05.00.00.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 00:00:34 -0700 (PDT)
From: Han Gao <rabenda.cn@gmail.com>
To: devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Han Gao <rabenda.cn@gmail.com>,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/3] riscv: dts: sophgo: add more sg2042 isa extension support
Date: Sat,  5 Jul 2025 15:00:11 +0800
Message-ID: <cover.1751698574.git.rabenda.cn@gmail.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add xtheadvector & ziccrse & zfh for sg2042

Thanks,
Han

---

Changes in v3:
  remove zfh in riscv,isa

Changes in v2:
  add zfh for sg2042

v2: https://lore.kernel.org/linux-riscv/cover.1747235487.git.rabenda.cn@gmail.com/
v1: https://lore.kernel.org/linux-riscv/cover.1746828006.git.rabenda.cn@gmail.com/

Han Gao (3):
  riscv: dts: sophgo: Add xtheadvector to the sg2042 devicetree
  riscv: dts: sophgo: add ziccrse for sg2042
  riscv: dts: sophgo: add zfh for sg2042

 arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi | 384 +++++++++++++-------
 1 file changed, 256 insertions(+), 128 deletions(-)

-- 
2.47.2

