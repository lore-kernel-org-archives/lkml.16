Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C99DC26A0F8;
	Mon, 28 Apr 2025 12:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745844058; cv=pass; b=EAI8DaTtU4Ki0ojUqC359HBQgtXsad2FGA+Zc5BVSo6WU1ChZb5fa6X9w3/Qc/L319dq3N2U6GfSp8kl+kcU6vhAw20STHcdOz1XXEqVJwr11DfgKCHNeBeGbGEGpWYdBJMYlRs/Np18UjCu53ToUyqu15jgw6xmsSRsNO5k/K0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745844058; c=relaxed/simple;
	bh=I2ykutjcqMllcHiAyUDYqj9tFTElKLZWG+XXLUCDh1o=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OD8En353TRARv4bfoAKaJVgAd5XvISnffNY+g73jKyebuRyrqSWwxcqfu5OvCvkeHgQtfGleM5d8ZObeWS3RqLyArWApxjIg3cHPMaeD6Axg1Jkh4rMGG8+zV7sfmvfiSWSlUgb2nHI+338iMh7n2kb8MdsW5ssaE/rurTw7Au8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech; spf=pass smtp.mailfrom=pigmoral.tech; dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b=ByNxamx+; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b="ByNxamx+"
ARC-Seal: i=1; a=rsa-sha256; t=1745844025; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=b72DQ5n26fJtzQVXvruNxW6E2SVCIyBrz2X8MwKbNU/fkJMClkCBK5RbJzgdnM89Nw8dBAnYWaAXg+udyxipNuoqxEs1vVYfqTkZq8l8yErU6wSO7iOujuM1rh6yK/+1rB3p7eFUrskkIAlpAUpfcDKhgjNktfm3l7flFzhgIVI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745844025; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=nXleTA7okadGYMFVNlngNJxDP/GdcVzOQQaijYrWvNo=; 
	b=nS5qrotf5PDGIK/CXWGbFFPnONSwM5FBHL6nDJ3uYnUi+h4J7MrrnRJPE6LKRpcO7Rq1dYGBipPcup/nzVvR7c/Yf7OcUTgT3UFXV27ayHUs88oNy2cYY2gPXM3mgbmnYp7VmlVgYtF7Z99NfH0wyBEx92A3noAHgS6fUcsNde0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745844025;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
	bh=nXleTA7okadGYMFVNlngNJxDP/GdcVzOQQaijYrWvNo=;
	b=ByNxamx+1X0YI1lvAw3aRYsEQcMosXRbN/5u8Jux8v/0H7qY99nhrrT0+3uwY37O
	7iNiFJdPq5rd4m/nozj21DjzMhpJZ5tQdPtVn7S5XwJlHP5TK7sQbwQuJORrxbJ983o
	jwdBcTAkGtg29JQs6Dei4KNZ7RqhI1xNLBjYSOE4=
Received: by mx.zohomail.com with SMTPS id 1745844023568786.1590715271197;
	Mon, 28 Apr 2025 05:40:23 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Subject: [PATCH v3 0/3] riscv: sophgo: add mailbox support for CV18XX
 series SoC
Date: Mon, 28 Apr 2025 20:39:43 +0800
Message-Id: <20250428-cv18xx-mbox-v3-0-ed18dfd836d1@pigmoral.tech>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA93D2gC/42NsQ6CMBRFf8V0FtK+FgpOloKLmhKRwRgHxaodF
 AOGYAj/bmEzLm7v3Nx7XodqXRldo9mkQ5VuTG3KhwU6naDidnxctWPOlhFg8DAD4hQNCdrWuZ/
 K1vEhgDPRhFNWILt4Vvpi2tG2P1i+mfpVVu9R3pAhRdkuSu1qHQHQIE5wLEgo/WTBCImAer6UT
 CYw/6q5Is8GctONil2Vb1dKLV2p1mh40sCvGLzYCzHlnEch5SIQ9pRM4P/Ffd9/ACfv0HMcAQA
 A
X-Change-ID: 20250421-cv18xx-mbox-6282d1e1734c
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
 Inochi Amaoto <inochiama@gmail.com>, Yuntao Dai <d1581209858@live.com>, 
 Junhui Liu <junhui.liu@pigmoral.tech>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 sophgo@lists.linux.dev, linux-riscv@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745844011; l=2219;
 i=junhui.liu@pigmoral.tech; s=20250223; h=from:subject:message-id;
 bh=I2ykutjcqMllcHiAyUDYqj9tFTElKLZWG+XXLUCDh1o=;
 b=jJZ5IkLBg9NY7bPou7wzBf2FP56Akx1X5JSTpBbXUq7V+WdLTGNRIQpLLWB8Gbs1zSO4ApEu1
 HBuQTWXJj01CK26Yd9GOaAZTXujQWw+WNjccjAxJtEQ06b4sFfWr49S
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=ed25519;
 pk=ZRZkOjG47iI+To+oAo2R4KIpMwtz8r0TffJ5/nO2tcg=
X-ZohoMailClient: External

Sophgo CV18XX series SoC has a mailbox module used to pass messages to
asymmetric processors. It has a total of 8 channels, each channel has a
length of 64bit.

Tested on Milk-V Duo with CV1800B SoC, Milk-V Duo256M with SG2002 SoC
and Milk-V Duo S with SG2000 SoC by the mailbox-test client.

---
Changes in v3:
- Update cv18x to CV18XX in commit messages and descriptions.
- Remove the `interrupt-names` property in dt-bindings, dts and driver.
- Move the mailbox node in dts to satisfy the address order.
- Remove `OF` dependency in Kconfig and the driver.
- Add copyright in the driver.
- Reorder the processes in dt-bindings and change the `RECV_CPU` macro
  definition from 2 to 1 in the driver.
- Clean up and improve macro definitions and register access methods in
  the driver.
- Improve the return value handling in the interrupt handler functions.
- Implement the `cv1800_last_tx_done` function.
- Link to v2: https://lore.kernel.org/r/SYBP282MB223825D5903777B937A8A377C4A02@SYBP282MB2238.AUSP282.PROD.OUTLOOK.COM

Changes in v2:
- drop 'recvid' 'sender' in dt-bindings
- fix compatible to 'cv1800-mailbox', and change filenames too
- change #mbox-cell to 2, for <channel tagert_cpu>
- add struct cv1800_mbox_chan_priv and function cv1800_mbox_xlate to extract
  informations in mbox devicetree node of mailbox client
- Link to v1: https://lore.kernel.org/r/SYBP282MB2238DE0DA19C6EF411B2356CC4CE2@SYBP282MB2238.AUSP282.PROD.OUTLOOK.COM

---
Yuntao Dai (3):
      dt-bindings: mailbox: add Sophgo CV18XX series SoC
      riscv: dts: add mailbox for Sophgo CV18XX series SoC
      mailbox: sophgo: add mailbox driver for CV18XX series SoC

 .../bindings/mailbox/sophgo,cv1800b-mailbox.yaml   |  57 ++++++
 arch/riscv/boot/dts/sophgo/cv18xx.dtsi             |   7 +
 drivers/mailbox/Kconfig                            |  10 +
 drivers/mailbox/Makefile                           |   2 +
 drivers/mailbox/cv1800-mailbox.c                   | 218 +++++++++++++++++++++
 5 files changed, 294 insertions(+)
---
base-commit: b4432656b36e5cc1d50a1f2dc15357543add530e
change-id: 20250421-cv18xx-mbox-6282d1e1734c

Best regards,
-- 
Junhui Liu <junhui.liu@pigmoral.tech>

