Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81DBE2206BE
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 18:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744741712; cv=none; b=cvkhV3yWbMqk8ivTrHmBhK/G2FiRvzHY96pnd93bw9c8/mp11erm6FsLjJe+B9c5h8Kl0P2HkIqlvIQ7yFsV3Ghg7AdAFN/DjP8YAYZTKQnaMYnlhPRsm7wz0uw3Z65UmN9yDJCnMvd2lgKpRLbVtMxImfQaMhbudn+v1fxcQsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744741712; c=relaxed/simple;
	bh=VYVRxEJYwQanV5hu/0wE4LxftLRrNmP9Ls8weWaXeFc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=G20GggBN7m618tl3mynaDFjC192a3Y3Q9+SzKTH+ZXpMCxhJveYEl3cUERxrVnL9Cmx8GD63L0KuqhZQ9Vzn44thnUDCX/KFWaH9emLyPpiOLQ+/L2K3trNfiYpqisepEqJxiKd75FeuMQ8IUvrkO8rZwEAgBuwCGDGhZYWfu3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=DagAUnSy; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="DagAUnSy"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-72c16e658f4so2394087a34.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 11:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1744741709; x=1745346509; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W8E2f6IqoC+LGUu9GjsxD/Ma9iEhqvPoS9PHmT2Quf0=;
        b=DagAUnSy0622wInsObfKsioH26qCtkX6dw/apkNUt3MDKYUjgAzzVv7ZOEEab+U7Ux
         La69hKI4ugvw7OEJvwRGBo1mcG3rhjM13wU39RFUk9egtrFV0Wtxd/rUSbd4JR4kk9Ps
         Cr2J+fw2iT5EF41gvbc6jOpUhjs54q0GWpilg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744741709; x=1745346509;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W8E2f6IqoC+LGUu9GjsxD/Ma9iEhqvPoS9PHmT2Quf0=;
        b=J1MckKoTBHiwNGS5ThMiMS/08O5frA5Fm8oGYkw93HOYzF6owyd7ghl3VMjDwjXAwn
         MFxfCJvVwHCYoed05AEOf7/U6Mwb5CvSG0NUFE13xHwkEU1kSmPv3WbSyEk61C/q9aX7
         alUAlqAKXoDmdDonwF2/fgPKkqaHLCVgCgrXS7uanRs6YlsY9qMRg9jlarwhDQzOq3rq
         Fs4LnRVr2UIYAhkZfLw6BFjZZLnrJW5FogcRDoKG7sanXjN5xoe8MiGXaRWFjlKV8bLD
         kJCkn8HVoB3XVycwIQ/uZgMwu7FZEfN8ky4Q0xfsjSx8rwPNpbvxgO/LbbmMdG/MTt3X
         zOjA==
X-Forwarded-Encrypted: i=1; AJvYcCW44X0R2Q6iBLlR5mW+eAn9ugSD9ksNo/csakEmJGPUvPYHuvyUl6Vp1JrzyeAgjNIwtqreQEMzePzTsvQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjqPxN8MRUZiTpsQPwQ7fxWi/IwZTRxm0JDrq744/c1GhWMfqL
	XOW8ytvuyt1XQueMBUWfm30icpHAxZjTpopoL+b7u2N2xVzggkRcW51jvjwgStAooY3My3tpDSk
	=
X-Gm-Gg: ASbGnctkNKeUGqt8rakhXkVmj/bohVy/I+jYl2FXToqXGDA6NpxPHnD75LdXHn22En1
	Ihs136c1OWgb+pnEltNORGbpQg7r9/jpi5KpiMuhMOdERH5imSnewqhM9eWe86UqQ7j87gP4jY2
	KvvlhGcwmeiDMbbclAC4JOTsMhtMhJwXK2a2E7rflcrzl3xsWFraE9zKoL0athPrNJJB8zvzdlF
	rU703rPBx9yTINGz7gg6dILrtXlSDQhu+rJEMaP3/f3cQlUTwR/8K+7PXiSz6CP0uWOs6120q3f
	Bw/4oblM4Ki30L87Aaz6/NJbIXUIf4cP/QVv1+ZzjlOyDUzv5f/ZMw+cfPU2UnZcbh9IJ4u6dsd
	j0FPMv4i0V46TrA+K1g==
X-Google-Smtp-Source: AGHT+IGj9+A7XEnOCRDoc1Nsz+q9pnXNAgyZsgfv09iVYMTWY/OZaZt8llUPjyM6TfNLbLe6ILVjLQ==
X-Received: by 2002:a05:6808:17a0:b0:3f8:d2f8:d735 with SMTP id 5614622812f47-400acb75e90mr361591b6e.33.1744741709423;
        Tue, 15 Apr 2025 11:28:29 -0700 (PDT)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-400763baf5esm2434177b6e.47.2025.04.15.11.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 11:28:29 -0700 (PDT)
From: justin.chen@broadcom.com
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: florian.fainelli@broadcom.com,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	jassisinghbrar@gmail.com,
	bcm-kernel-feedback-list@broadcom.com,
	Justin Chen <justin.chen@broadcom.com>
Subject: [PATCH v4 0/2] mailbox: Add support for bcm74110
Date: Tue, 15 Apr 2025 11:28:24 -0700
Message-Id: <20250415182826.3905917-1-justin.chen@broadcom.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Justin Chen <justin.chen@broadcom.com>

The bcm74110 mailbox driver is used to communicate with
a co-processor for various power management and firmware
related tasks.

Justin Chen (2):
  dt-bindings: mailbox: Add support for bcm74110
  mailbox: Add support for bcm74110

 .../bindings/mailbox/brcm,bcm74110-mbox.yaml  |  64 ++
 drivers/mailbox/Kconfig                       |  10 +
 drivers/mailbox/Makefile                      |   2 +
 drivers/mailbox/bcm74110-mailbox.c            | 655 ++++++++++++++++++
 4 files changed, 731 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/brcm,bcm74110-mbox.yaml
 create mode 100644 drivers/mailbox/bcm74110-mailbox.c

-- 
2.34.1

