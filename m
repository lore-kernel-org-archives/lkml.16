Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8303E18A6C1;
	Sun, 13 Apr 2025 22:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744584608; cv=none; b=aUXAa378ccGrVpFjXyB8SkUfEGJFya+UolhCLQ03jWNs0pqyv7qRfYHTwDTF87t9yWTKd9ryjupfm2cZ1XW+udCEyFbGK7TTVc+Dd9jFoWuvCmpqj4JMKTP3nO/DPjCQxXBme9U2CjREVP/WRc029NzYOCyQ+KusIQut02HJNyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744584608; c=relaxed/simple;
	bh=gMl3Q9o6fNay6IUF13m/fG8D+5r352toq+BOgndtC6I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RdiN/V1pUKZGG9JQ6/620+bbstiD6m0LqVqnEnm9jdJTzOharWjE2iUI3oMVSuEfBrbjGY6ZCCETkMcip55dGk41bClbGbgDAAMps00aAxAqrvnd0743X5GXC7mepNymEDYjJOTvIJbliWLQ4xLNEyOYQjtyP/4bIUHGqjZOFGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e9W4mNMy; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e9W4mNMy"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7c55b53a459so422424285a.3;
        Sun, 13 Apr 2025 15:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744584605; x=1745189405; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Fhh7OQWwMybpKR5qgDcy+ifapxHjJXlMgsmeTJlaQZ4=;
        b=e9W4mNMy9UyqnsnBd2taHaxTwPbRzErbEqCFZad844HefNXyERzJNp/lbuWxqXtfoH
         uEtV0bb/GbcQ9ctGv0k1ABkG4TF1PcebpyGPCc9n0gxCWEe2P2r/8f353PjiXuTzpdT6
         DTKEF1IR9QKyBlO1rDEI392dPjfGDtwJwy279AQsUWu0IeJGq2Qds093iZ684pWB95rH
         UFX46ADRwcs9UEPIfMDyDqp/y+eUep94ZtoEFJNLxhtM0Pcp43ho9QAlG9iHXooc9n/n
         rAqx58dBxOikffsNjnt5DzkK78fDooWfKVWs/q/FmIpgY1YEKA002re42SDu3f5xOUY5
         ddcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744584605; x=1745189405;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fhh7OQWwMybpKR5qgDcy+ifapxHjJXlMgsmeTJlaQZ4=;
        b=AsaUtfVEHU5RcOGstWXk9wxQvFCHxa1mUdq/JVaUkz/1X+CUtOtQCBRoYVOaZCjzSu
         59NfiOdNv2lga898jnEc7ictsKdKquJiAfA8XOMAjVqhdWeFPQk2OV2yTEZFZlVwCvzC
         Iy4bmDix0WWw7tYHyMBw0n6Ia6Bbj76XidGjGH82clE30cLkIegbE+PB96BtvaZ4aBf/
         U/JgI+TApZoZ6vnz5NL3hDDQ53kRw35RvE4qzOUDF2hI2DaYDXOq64rWycJRwaupIhOy
         dFKJFL85kcVo+pCL32v2pf1Y3FX0V5QWZglFhGllUPE2Z9VZFjaQ9ArXHeXWdIt9RWDO
         qv9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVDgJDscinIOilQUC/b6hBN89Z7qKedH6oYBh8WcadkifQA4EK9gxYRwbLzDKn1MaMTwfCM/PmCB647@vger.kernel.org
X-Gm-Message-State: AOJu0YwYBuI+nXNMBJ+9sSIdKUaKNNO6G0Knb8pZ+YGEggYDnkRyrryk
	MHS+CmaOfG77rIU0Sm7vAeufk6ODRr9jKLipr6PqpBfLcJDTlQzH
X-Gm-Gg: ASbGnctMeDCiR3OdbwKYz5lnBj3O7X7lvIAH80GzSy2NRg7s8ZvvAfcXJQkHq9wyJkl
	hTFC6f4qwvEVQONNYEljpUk6iD9AYaNHHVX0AgTVpOFFL89OdpDBPhpgCi1HiXjp2uv75+yIWTP
	vxleqGUoEJoPlf/fmT4Z+NCOqPxFUYBQ+/vmxvXG4D+CZBJV0V5Wos26FESac6qsQvDQqT+tpYx
	IP7nX4R0uEwYd8hv2Tc6qk3N8V+uUWdiIMWsDuRlbGtSdLreVLMv2GKHiGtuobQpzB3MpDYzxhO
	wTRJ0xUo/FwrNz8T
X-Google-Smtp-Source: AGHT+IFohEfgbuD5ksysZW/OXlVS+hYAGf/MLysVgDZw9TxhfZVn8l+weXa/RBcrp4hZUoTNUyrnWg==
X-Received: by 2002:a05:620a:4148:b0:7c5:5801:ea9a with SMTP id af79cd13be357-7c7af0c0f05mr1319345785a.11.1744584605058;
        Sun, 13 Apr 2025 15:50:05 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c7a895181csm616987285a.32.2025.04.13.15.50.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 15:50:04 -0700 (PDT)
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
Subject: [PATCH v4 0/4] irqchip/sg2042-msi: Add the Sophgo SG2044 MSI interrupt controller
Date: Mon, 14 Apr 2025 06:49:11 +0800
Message-ID: <20250413224922.69719-1-inochiama@gmail.com>
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

Changed from v3:
- https://lore.kernel.org/all/20250408050147.774987-1-inochiama@gmail.com/
1. reapply Chen'tag for the whole series
2. patch 3: move msi_map from patch 4 into this one

Changed from v2:
- https://lore.kernel.org/all/20250307010649.422359-1-inochiama@gmail.com/
1. patch 2: separate from patch 2 of v2 for better reviewing
2. patch 3: separate from patch 2 of v2 for better reviewing
3. patch 4: apply Chen'tag

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

