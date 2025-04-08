Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 364A02F5E;
	Tue,  8 Apr 2025 05:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744088548; cv=none; b=qz0kbxnPNP/zk8A6HGUVM8nmDwdGjpfD9KULJZ7qUzzmmhnMmRZlpLI6T4jO1ekrU+KGVHv267aVRskVSKSu0dzq3WY3VIX3c2s0buZGms+1yjzU2c9fWBrSXdV8elbgPXrdW8054EDUus6HgoQrcZOKACea67IAwegXBUb7Azg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744088548; c=relaxed/simple;
	bh=KM4iNMvKGENubzBlP4oFLFuPGo1+bejKdkpXcDrBbw0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FvqobeDoc+SOR42Uk7Ql9cSUyALQgcuGW2TfeeOQwuAOBvsuWEI+sog0aj6QeHJK3Bw78wGZZ0pCWGHfUEdMsGeWEmRz9OWR4aQZqlPcaOOn61LryPKzgz48aQqk/NqL/auvv8z7jjG/iFqiMsc0L6t3VrsSl+yNjNE0FmqJ31U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JRqm5piq; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JRqm5piq"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6f0c30a1ca3so24402606d6.1;
        Mon, 07 Apr 2025 22:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744088546; x=1744693346; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R7RoF88PRiXIA+X9QRRmiBMpMzS+lQz5HYzbozNYwWM=;
        b=JRqm5piqbs/RYUd0EPfQ451KuJieoSpNILGgCDdHaFbkw0tFzak3FBPoEUnxxLC6O8
         OAcDCakyGQU1mDzKx1QCG2ZkdPYjefCKoNppVEkddLoZqBlydJty6DIwUjcZsnbUp738
         OLRhuwDg9NQcwL2+ZEiKLITNHRxt+6bZ3V9yIZeGdSHERkdq0VZTo62O3X3ySVZfZyAw
         5/vOamFDQDXU0cTkKWK0Y/OeLXFrEXuzqal6U8B2l8f1aF3UIpww71L/bOt0KZOi72SL
         wD1XvOeWvxf41S1BgRCU0BD8w904bcQF/Ogt/ZzeNEP9DfVqPJQsoBQrt1Q0El8fTZ6p
         0A1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744088546; x=1744693346;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R7RoF88PRiXIA+X9QRRmiBMpMzS+lQz5HYzbozNYwWM=;
        b=euG0eHZHD+eDF+zudKPlEl23HgD04Ks9qejHys7a+pICVB50Z9e01QxZDZkE2FPRKt
         8D93SKCbF6+M0ajpMIjY//r0FeKeNWHITE0hSq1YBBgP9KgOzfbU3+FoXCm0DVPF3Pmy
         SBcvVYlejRctRwYOLiC4eKM1Dzapl6HxO7exxyOhPe5eOeH+DI3Oa3isd049xs30NIPu
         lO6zk1KCqG5s7YHlO+198iuTVP9OHEm39kaE6lhAllSz1xLXP9rwCwGY7gvtM2vylyqY
         xpIJd5EQIB9kBGM+at60C39l8PIMkz58RiKJNXht4sA4kz/nxpWZmFbYCI4DGlBzMnp0
         HZAA==
X-Forwarded-Encrypted: i=1; AJvYcCVPtoHcblWlrqdOPt7fcyDSCfR5fClsVqaRsWAyIl4kUz1/3//1yqIF82BZRM/TYO0ywO8c+4HkfmSm@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2S0axKVjP4orRiYb3Wibk5krxYTbU7JtD4kr2tbAoNdmIX7Y5
	1GEe1RIHz0Gerb5pgF1CLfIlj0VoapQnvgXmHgcQ2Txy3j3cdZXy
X-Gm-Gg: ASbGnctRb84aSVx2dFt35b7Tqfcqo1OTBltguz7rIV/Sq6KZQyxGvvmrvv19+cp9FZH
	4SFIzfHeknVwTt7zeskmQKIlfuwBY0bsyTyBC76jDGiW3zUQa0RGYlNzKlctm2vqsPU5Gp/GKu2
	5FbUmHC0Sv2XLNw4bvqmmdP0BP4CgeK/Gp3HQ2x6043r0lwPZGpGxZIRWqzrbNdzMVAtkom17Pq
	PxeR8ppfx04IkksC58YbqOxKTUov5+EGsA3iG1MzlDTmbhs8P1QTbyuDinwSo80VRp6tysjcler
	i2dZsmpVBTlV6zmI61b3
X-Google-Smtp-Source: AGHT+IFAmQyuLEqKSqUa3zPYlnlVpM+D6CTCY9Gci7d7NscOgG+3f+LABsr60dVnS0EGKdGef2Rzqg==
X-Received: by 2002:a05:6214:c6d:b0:6e1:f40c:b558 with SMTP id 6a1803df08f44-6f01e7f5050mr180369806d6.44.1744088546031;
        Mon, 07 Apr 2025 22:02:26 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6ef0f047aa7sm68706526d6.55.2025.04.07.22.02.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 22:02:25 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v3 0/4] irqchip/sg2042-msi: Add the Sophgo SG2044 MSI interrupt controller
Date: Tue,  8 Apr 2025 13:01:41 +0800
Message-ID: <20250408050147.774987-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Like Sophgo SG2042, SG2044 also uses an external interrupt controller
to handle MSI/MSI-X. It supports more interrupt and has a different
msi message address mapping.

Changed from v2:
1. patch 1: separate from patch 2 of v2 for better reviewing
2. patch 2: separate from patch 2 of v2 for better reviewing
3. patch 3: apply Chen'tag

Changed from v1:
- https://lore.kernel.org/all/20250303111648.1337543-1-inochiama@gmail.com/
1. patch 1: apply Conor's tag
2. patch 1: improve the bindings comments.
3. patch 2: rebased on tips:irq/drivers patch
4. patch 2: remove unused macro "SG2042_MAX_MSI_VECTOR"
5. patch 2: rename generic structure name to match sg204x.
6. patch 2: rename info field name to avoid misunderstanding.

Inochi Amaoto (4):
  dt-bindings: interrupt-controller: Add Sophgo SG2044 MSI controller
  irqchip/sg2042-msi: rename generic function and structure
  irqchip/sg2042-msi: introduce configurable chipinfo for sg2042
  irqchip/sg2042-msi: Add the Sophgo SG2044 MSI interrupt controller

 .../sophgo,sg2042-msi.yaml                    |   4 +-
 drivers/irqchip/irq-sg2042-msi.c              | 149 ++++++++++++++----
 2 files changed, 119 insertions(+), 34 deletions(-)

--
2.49.0

