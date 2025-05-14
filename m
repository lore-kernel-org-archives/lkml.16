Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18379F4ED;
	Wed, 14 May 2025 15:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747235788; cv=none; b=cC82K9tfD/Mr0BYKgcyJjFQMxiRJeIjbzPFydhmiBp8T2I+P77ceH5Ex8XxdIdSkosJt7U1y2Y3A9zovTZR0ba5bzQF65dzOdF6p3PuiCQtFv6RHh1zob5VuSxMZPCoaJmb3XNVtWWjxeljgETovKaqISSH9wVoucMu2aYJZ9n8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747235788; c=relaxed/simple;
	bh=Lm6WAvlTRDzuea0vIj1PVTw6IFK4Z8B0uPlTZZUwRIk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QaS/VP3jfHm5L2629ACVNViIMOKQ2outKzEff5Enm0BwSjxoBlXojOXF5N8KOWgKDuOYiIxnf0WH9QhN9v7uP9Hz4nxAigpXV0Wl4wlliuQ3p9a7WkzrnLzsk1+RttiS8hZPOKgexaxfN+8WRzS5QlVKiPHBNz0MsykNnkqRC/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UKIKSMN9; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UKIKSMN9"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-22e16234307so11612945ad.0;
        Wed, 14 May 2025 08:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747235786; x=1747840586; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EgsklLZ/mK5aUC96i1ZN36xx7E9PxV2eHr7rkJneVg4=;
        b=UKIKSMN9hI+bFCEzwgDM98fK9idcg76796uZfiWU/aMVGKJMJdLqFgDkMkhpTKV7kB
         MTd6A9HFzWeYTmvIzHV0++m5cD85PXyZcOSlR9+UY0gCVLi7rFVuo9rw3yrJQ9+6Ngbs
         nX+oTS/yeBTGRmSF8gmHhwLrKQz9guIVCraRRH/jQkCZTVlkog96QnUXKcL7zGdaDvSZ
         YrWf/zZPMEb2wEMHRu3IfRBOpB7BgyQCBBoIWp4nBIXau5oqICoQg2jFeAHAhmdoqE+M
         QpMfLVGL8s5P0NFyYbityURmh6+yoaZJXCX5ZCzPM/hLZI0EFAGuz6c8l37xYq7qppTp
         J5GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747235786; x=1747840586;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EgsklLZ/mK5aUC96i1ZN36xx7E9PxV2eHr7rkJneVg4=;
        b=wJrwEdBzjJSk/dRDoOupIHIqzZD/iz4+4EdKzTuncH3ftGVTxwXQZUIqhDLxtl4Rub
         WHPXK1H42KrdtXB5abWFIbL2GIbwsT0/eqlxktESWbbpaGsPTDpKo42c+EDVXujKwXnn
         izBj+e53KSKAP58NaGcVM1adBD1uHKJ+QraSvhjwWnCdKUPRaJdoaPoP3HFkTfH58wJx
         SALusPoJkDl8+5XTOQDp08a9JGzGdY9xNPs5MUcVdCOj9GtsF8D4yOxSsmU5w5GfPjEV
         v5bY4rZOD1DrX0QQ4twD/cChJyCHqsOSmjMOn6qlYjvQw2vM9qr6ZPjrRn3Gfofqlalh
         Elfg==
X-Forwarded-Encrypted: i=1; AJvYcCWoaUSh4XtXHWKSNsKkcJAtoexJslmUx8isvnH5tk1J/9Mn5bX10eSvG5Zp2enoKaEZOF+HbkxdzqAlhMA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzy7uFUqFv24mBS5LUiNvIqyu36WTNIz97N8dfVKWckKiEzNeIr
	yKJ6y0/g7qIm1Zh/Y9m1sm+pJC4aICvQa8FamOnnAtCrPpxg6EiPVKA2+7Cd4ykMRA==
X-Gm-Gg: ASbGncupTSh/BH/y/cpglu3oP6U9Y03IetxUwX5QmxNjFvcQTBp0n7vOVwlshUrMxFh
	6OUbgtF2Y7c7gE2Eu/Ev36uY4+9KNAUEgLACTTd/2OgmVjoDPgGywEEQm2dwYviMsSjtsgatEZA
	tZQEYWJ3Oq0c5kSQrHdsNCyrBfIkgh1BMckybFI9rJIh+/NMpkPVtcekS2P3CM4ArHN1PUF25o/
	YxQwBKzLEBBUWHia9RCpGP20SSoojneATIDQl45aQUsu2Ga0j98mzTrAzruCEgt+UOgGQ0csfVK
	fS2r1jRoB7c++hLCL4HqcIrR52NDLTZxc0YS6Pw6Bxnb7P7lO6QJ6KQ1Z8OfcA==
X-Google-Smtp-Source: AGHT+IGbVInxx66G7TdCmzBNdgbF6IdqT5fffqnER/G+POHGsBd0cJTXz0qVz+AMlIIPHrATjD1bLA==
X-Received: by 2002:a17:903:230e:b0:22e:5406:4f62 with SMTP id d9443c01a7336-2317cb62f61mr103264775ad.24.1747235785499;
        Wed, 14 May 2025 08:16:25 -0700 (PDT)
Received: from localhost.localdomain ([119.8.44.69])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc75468besm100576155ad.3.2025.05.14.08.16.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 08:16:25 -0700 (PDT)
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
Subject: [PATCH v2 0/3] riscv: dts: sophgo: add more sg2042 isa extension support
Date: Wed, 14 May 2025 23:15:49 +0800
Message-ID: <cover.1747235487.git.rabenda.cn@gmail.com>
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

Changes in v2:
  add zfh for sg2042

v1: https://lore.kernel.org/linux-riscv/cover.1746828006.git.rabenda.cn@gmail.com/

Han Gao (3):
  riscv: dts: sophgo: Add xtheadvector to the sg2042 devicetree
  riscv: dts: sophgo: add ziccrse for sg2042
  riscv: dts: sophgo: add zfh for sg2042

 arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi | 512 ++++++++++++--------
 1 file changed, 320 insertions(+), 192 deletions(-)

-- 
2.47.2

