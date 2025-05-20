Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EFAB20487E;
	Tue, 20 May 2025 07:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747727151; cv=pass; b=u9yg4Re8V3M7hqPKydPmVDCaBut2W7Eqro7pv8geP4q+3jjDBhmmxyGkF8OLv3sZgVlXUJ4T8lu8o8afPgW01ApBMv8RqdI+wMpsaSJB5YHYvZmrTma2UPFXu96LT33ggfI8cqQ5q5jkd7grB83r7wIfxh3Ds6IFYX5s15M+7lw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747727151; c=relaxed/simple;
	bh=3U9B5pWkLOSWxS23r0T243a2yQfl666xD/tiXonAWTg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=EcBwHxIhiWddJnfrpGQLI9nuFIZyaju0LenNdatsPmG2rwN/jsIZ4Hmyg/kCpjELHmx6pKNIVQypNTlPJon50IDSUzc31tG5m2pVK2aZOONmIIFmo5Qdhd7niQ0e5ZUVddmXbuXegU1WmEFdWwxj3EuJgAL6z/zPqb4g+e1TYQ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech; spf=pass smtp.mailfrom=pigmoral.tech; dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b=dvScxM6I; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b="dvScxM6I"
ARC-Seal: i=1; a=rsa-sha256; t=1747727114; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=gmkRO5oonKJByi8/gJOZpGu6mqQKR3Hv79GFdbu8cPnpNRLUfjxAZGGmIQo+j+3C24UzMDnw3TobN+2qkG18TQ5KjmtRTGtkX7OSY/bSUx2jytOvBHoyOWOSJoOCKuJjlv5WNao9hQEP9MPr3PhT4BRggKt3KuGW/TdRxNDpjsQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1747727114; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=MnIccHBLt77o7gktE4VbMWuql1FFClYZl7Z9VMV2mU4=; 
	b=ncjOGjc+qBUf7vsf5NPE6Ao4DgKDglASu/yDV/n6Jnn+O3rzFgOdcD6oYGS83YgJd9r3FqGCaViShVm0tYJF3jdDTLmjqGsVhNV8SgwefsyFbjx+D/t8agbiUIznm+M5NvHEZrrdpCD0D6Ov+xUVA1diBETzfSeQF7eUq88hpLg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1747727114;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
	bh=MnIccHBLt77o7gktE4VbMWuql1FFClYZl7Z9VMV2mU4=;
	b=dvScxM6IKnD3qXabc2to1Nr5DXS+0ZdfaVAwg1MMbftr1Zw/zIcb6DmdUPJeqy7b
	Oi39OCW/N3VwYwhRYatS6oeI5f3cZKmVr877MC4GSWjYdz74NavkrhpsYRtiMW3RE58
	Jqr+e5hl5xhftycVcNLRY47A0zmH+NN2UuKcOnPA=
Received: by mx.zohomail.com with SMTPS id 1747727112585692.5925758460581;
	Tue, 20 May 2025 00:45:12 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Subject: [PATCH v4 0/2] riscv: sophgo: add mailbox support for CV18XX
 series SoC
Date: Tue, 20 May 2025 15:44:22 +0800
Message-Id: <20250520-cv18xx-mbox-v4-0-fd4f1c676d6e@pigmoral.tech>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANYyLGgC/5WPsW6DMBCGXyXyXCPf2WDTKWDo0kZETTNUVYYUO
 8FSEyITIaqId69BXaJO3e473f+d/hvprHe2I4+LG/G2d51rzwHEw4LUzf58tNSZwAQZxkwg0Lo
 HNQz09NkONEGFBixILmoSEhdvD26YbR+7wI3rrq3/nuU9TFuyec/XIbXKEbkqSlZkkOqkfBIAO
 fI40VroEpd3Z1G23UwUrV+rIqq2by9V9RzpakWmJz3+FWNcxCnjUso85TJTWRi1yNj/xHwW/zZ
 Xd817Thm1BpQ5GMUTA8uLO55av/+KrrZuyG4cxx9CHQHJXAEAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747727085; l=2931;
 i=junhui.liu@pigmoral.tech; s=20250507; h=from:subject:message-id;
 bh=3U9B5pWkLOSWxS23r0T243a2yQfl666xD/tiXonAWTg=;
 b=p+fMjE7vUYGtXuuhgCSDK3E08ivevXbAJnRFEaKb/qikCEA2h7BuVKCPH8tfNe87KqSq8Jqtb
 mgnvaVIcUy+D07gB0vV6liVSbsYglseodx161NLyNUZyRhneNPvv8oL
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=ed25519;
 pk=d3i4H2mg9LUn4SQemoLAjLRQy0nTcyknIv6zgKMwiBA=
X-ZohoMailClient: External

Sophgo CV18XX series SoC has a mailbox module used to pass messages to
asymmetric processors. It has a total of 8 channels, each channel has a
length of 64bit.

Since the dts of cv18xx series are undergoing rework [1], the mailbox
node is not added in dts. It will be added later with the user (the
remoteproc node) together.

Tested on Milk-V Duo with CV1800B SoC, Milk-V Duo256M with SG2002 SoC
and Milk-V Duo S with SG2000 SoC by the mailbox-test client [2].

link: https://lore.kernel.org/sophgo/174710989159.597941.17259091695735282020.b4-ty@gmail.com/T/#m159cc72c6e4f89bfe14932f38ae93991e8cfa712 [1]
link: https://gist.github.com/pigmoral/70d0d0164dff7f9b95f59df50ef309d8 [2]

---
Changes in v4:
- Move processor ID description to the mbox-cells property in
  dt-bindings.
- Drop the patch of adding mailbox node in dts for now.
- Add missing `__iomem` in the `MBOX_CONTEXT_BASE_INDEX` macro.
- Pass the address of the value read from the mailbox to
  `mbox_chan_received_data()` instead of the mailbox's address.
- Link to v3: https://lore.kernel.org/r/20250428-cv18xx-mbox-v3-0-ed18dfd836d1@pigmoral.tech

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
Yuntao Dai (2):
      dt-bindings: mailbox: add Sophgo CV18XX series SoC
      mailbox: sophgo: add mailbox driver for CV18XX series SoC

 .../bindings/mailbox/sophgo,cv1800b-mailbox.yaml   |  60 ++++++
 drivers/mailbox/Kconfig                            |  10 +
 drivers/mailbox/Makefile                           |   2 +
 drivers/mailbox/cv1800-mailbox.c                   | 220 +++++++++++++++++++++
 4 files changed, 292 insertions(+)
---
base-commit: a5806cd506af5a7c19bcd596e4708b5c464bfd21
change-id: 20250421-cv18xx-mbox-6282d1e1734c

Best regards,
-- 
Junhui Liu <junhui.liu@pigmoral.tech>

