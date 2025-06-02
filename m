Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D37D244C63
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 05:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748841097; cv=none; b=M5v6eDRFFNsBmx84GKSbFW7BId95Tfj8SYBHQKAwcvAOTz/u70qQQLM3nC56YgShDqi5gN2WVscGx48EbV2NpxbfIzi7CVMUNfqrs8d3u2tCuckTUbjq586dxd36dM6AfuCmosdPQ9IJCQqBHrMoQzOq+7Do/kvfaVET37Tyv/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748841097; c=relaxed/simple;
	bh=oZuMIrB48TQVZ267SzyqqFKk1A27pKuXp9Tsyg4Y0LA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Uc7okPnqqDDHhSpqzClhda5k729Nyh262Ut2WI3sJlxSXgx30VnQg81wfRzyagXcAmeJ2ualrykaRttN3zO/Z74rgSkXmivUwnTJ9VsWzQro6KPqJUSmQ9jy7AoqZ3wOW4m0T0KnTQevZQoP4zLoVAOWzmkrl2XVa+4vYHdDw3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com; spf=pass smtp.mailfrom=inventec.com; dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b=ESo8aTvD; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inventec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b="ESo8aTvD"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-311c95ddfb5so2742862a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 01 Jun 2025 22:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=inventec.com; s=google; t=1748841094; x=1749445894; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tUG2mfGbVlQP6aOBxscXOizK60ki2GEc4gRzXvccP38=;
        b=ESo8aTvDOPTwuZy+ulOvoOopFLjXd/L73VlkR/cgGVw2CAUhN4+OkraTN6IUSK1hIZ
         SVho4AbUMAjI6UsAXgan47DRKiS8429xLF9apDP0pDCWi9pQyRPDB78Y2RfsMQ940q6+
         lIhqcIP16kxcur69agg63p3RjdBTglWihGjbXdzwYNCsItVd/dSUVv8pKVUCB/lGWTu1
         W45B/fkbSsAk8IYdNmKnYaMuNpaz3pW0KofqQE3JuOA5YucA4XbwYajwFSDh5YTGhJkm
         CSvxJdOpTNgZa4ebwwoA+B82jX89pgBPSnyHRfNIZTGvsdMc+aihc9TpFlq5xSUgEmA+
         ck1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748841094; x=1749445894;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tUG2mfGbVlQP6aOBxscXOizK60ki2GEc4gRzXvccP38=;
        b=LlHoDyRkKvRIsT3ZY9B9yEchXwd654j58ggT+PBGMt2oUOBaHe0gHjUH+PqoxyhbKb
         GwRU8KL+sws4OmUq3QGO76ttdj6ozBPA0cZ2EtS0NKD7zaTDdU73aG61/GMw6Oz2saUI
         Dmt9WdqR04qRhjip+/Jwf0dOvUShH2RCmpykkjsEeBC8oaNd6WWtmrrrnacEtLnVrY1F
         51okw1gM7fl7uZE21NvFckCVOWLWhszvsGPJsxke/cP/qzIeFpRd+dwbeoAifA7N/mPI
         htKfstjUPadXpuzS3g9nJwcd/g/OK4oqm6cnmfA/MpwQ+pwZ8ZmMf6OUK+LpMnuBeXGT
         GOog==
X-Forwarded-Encrypted: i=1; AJvYcCU5H3LUxZEGSJySSfTCCV/xzkjjuf6+FxDpqWSaQoNjRGUa2sqlJwZTgEJUs1ls6e0hp7KgaG7vnVLr4G0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzb+EsO9qcMbylFnG8Wa8PiLbR6GW5ny8k7XBzsA2D88srXGWdg
	/7tjLgQe3BxQtiUPbYCOO7agOjcm1X6cNvQGCWtLReVynhHSwMq1D17WsU/PMMO2CssrYj7cWxn
	RGu1M
X-Gm-Gg: ASbGncuQrtaOAXqBjpKWkjx7xH0h2euOlJOexPTP6MADoTP+hGhQDoPdcUDxui5TbvN
	NHaNdLpFBPlfkERDvk5q+Ih7CfARO7MxRjWFgmQFZg/EVGOP0HpUE0zBluZhJqNZjPNDYgpttoL
	iL+b+gFH64occc6EafzQIeDVxszH8RXyJQD7qWZXHRzW6d7EO9M5PjXLQUrIUjzjBm8ylMzerSm
	U/pxtQlZdx0O6NL2W2Dht2QGjOoVUiqO847u7je64P5Z5H6PpuL5f8bcQD4wggINEvkUKKKS8ui
	571nFCpE2lZB+jdRn0GGYFI1vrMMyMPbII3yB+H4nxsZuVL2oEhk/+cHlB/tTa4nfQPNqHx+pnK
	vLrmV+V8=
X-Google-Smtp-Source: AGHT+IH15jahMcfNNWPkxUhg7yjgT+AT6xissa4av5uh34InGjeBLrUD+mSsSG/ZR/48e5BFYwDQwg==
X-Received: by 2002:a17:90b:3a0e:b0:311:e8cc:425e with SMTP id 98e67ed59e1d1-312504914b4mr15268598a91.31.1748841094114;
        Sun, 01 Jun 2025 22:11:34 -0700 (PDT)
Received: from localhost.localdomain ([123.51.235.216])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506bc85fcsm62709085ad.38.2025.06.01.22.11.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jun 2025 22:11:33 -0700 (PDT)
From: Chiang Brian <chiang.brian@inventec.com>
To: jdelvare@suse.com,
	linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	grant.peltier.jg@renesas.com
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Chiang Brian <chiang.brian@inventec.com>
Subject: [PATCH v4 0/2] Add support for RAA229621
Date: Mon,  2 Jun 2025 13:04:13 +0800
Message-Id: <20250602050415.848112-1-chiang.brian@inventec.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The RAA229621 is a digital dual output multiphase
(X+Y <= 8) PWM controller designed to be compliant
with AMD SVI3 specifications, targeting
VDDCR_CPU and VDDCR_SOC rails.

Add support for it to the isl68137 driver.

---
v3 -> v4:
- Add Changelog
- Remove unnecessary "From" tag
- Add the compatible of raa229621 into dt-bindings
- Link to v3: https://lore.kernel.org/all/20250303083537.3312250-1-chiang.brian@inventec.corp-partner.google.com/

v2 -> v3: 
- Fix the corrupted patch by sending plain text email
- Link to v2: https://lore.kernel.org/all/CAJCfHmWJ9N1R8x6ikU02_RYq9ieq6yWY7CGdfvc4hRqHnX5szg@mail.gmail.com/

v1 -> v2: 
- Modify subject and description to meet requirements and remove the override of
  isl68137_probe, and add the of_match between raa229621 and  raa_dmpvr2_2rail
- Link to v1: https://lore.kernel.org/all/CAJCfHmXcrr_si4HLLCrXskuZ4aYmqAh0SFXNSkeL78d2qX2Qcg@mail.gmail.com/

---
Chiang Brian (2):
  dt-bindings: hwmon: (pmbus/isl68137) Add RAA229621 support
  hwmon: (pmbus/isl68137) Add support for RAA229621


 .../devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml         | 1 +
 drivers/hwmon/pmbus/isl68137.c                                 | 3 +++
 2 files changed, 4 insertions(+)

-- 
2.43.0

