Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09AA323F41D;
	Tue,  1 Jul 2025 12:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751371632; cv=none; b=WJ/v0Z0SI/WUQiK0BgEAAGk6U8fex4dT7ziitJY2nbc6vXnL/Dk2GXn7SwAKftKP5PaXh8SZ4WYw6010Saqx/EcgufhJbfEvVkUFVNkwFMZgyNIkXYUm/4nwtAJZJIsVV3rMlPGyxUph00ivxZIxMQkXy+CajeauIy74gWuWi6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751371632; c=relaxed/simple;
	bh=Geu8ummnogYTxNiBXGM/hmRr8QFOAK2JquaYcXupOng=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=nhyoxSxd1V3RcflFILE7a4ZaqJgQ7O3BSS7kYuqMlDovY80XcOahbBCDwKcaF8Ok/J+qHp8SsJAWW8zo2kAkfquRAKDv+YFDTz2BOiyU08dKG/DatWP8M0Yk/cNnnBZHlDcvVtAEAE73OdFvDnjx52U90QcCeMgGVImvQD72opc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s5C0fJNq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s5C0fJNq"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B826EC4CEEE;
	Tue,  1 Jul 2025 12:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751371631;
	bh=Geu8ummnogYTxNiBXGM/hmRr8QFOAK2JquaYcXupOng=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=s5C0fJNqf5bmqBuLxocCSef+Q6uuJ54mztN59ZwbbWfieEsphZRjyOvX2C4QdLlET
	 CbRqwSLxwU5abtG9mhPwDsYppiH9yrYP2Bl7WCm9qMeHjdbGHCTZfvafw7lfOTRznK
	 AYeCL93Z11c9MKfzLkgV/+zy8TQUiaGU62Y4Ao4/fO7G1EzIHw4mq1nL7HoMQ8RGbR
	 7ctrQ35aLQZ+LCmun1cW5At4R0WJQlXXMJm7x6FfNd6osJM+N1lJPS+fj5iAohq07z
	 uznS6d62y1LB86T9fcNLaQT5bPTpSvLbkCxJy7ifYdePlTQ878fyvpSS/7wFiLy7mT
	 nAqGI8xnru9ew==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8382C83038;
	Tue,  1 Jul 2025 12:07:11 +0000 (UTC)
From: Jack Cheng via B4 Relay <devnull+Cheng.JackHY.inventec.com@kernel.org>
Subject: [PATCH 0/2] Add support for q50sn12072 and q54sn120a1
Date: Tue, 01 Jul 2025 12:03:44 +0000
Message-Id: <20250701-add-support-for-q50sn12072-and-q54sn120a1-v1-0-c387baf928cb@inventec.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKDOY2gC/x3N0QrCMAyF4VcZuTbQBuesryJelCXT3LS1cSKMv
 bthlx/8nLOBSVcxuA0bdPmqaS2OeBpgfuXyFFR2AwUawxQiZma0tbXaP7jUju8xWIkUJsJc2Hk
 +mL1MM6UkF75GBt9rXRb9HV/3x77/AcdVEv97AAAA
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, Jack Cheng <Cheng.JackHY@inventec.com>, 
 Jack Cheng <cheng.jackhy@inventec.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751371491; l=1128;
 i=Cheng.JackHY@inventec.com; s=20250701; h=from:subject:message-id;
 bh=Geu8ummnogYTxNiBXGM/hmRr8QFOAK2JquaYcXupOng=;
 b=uryVKZGTrJl0If/sn1V3mR3ZOgEEAyr2PZdF64jHTusqTC1aP+Q3VmjWBflNBVsR1eytlVMjq
 dvOvawbcXykDak5tPpz0L11DV4K4EXlgKXcrGdDdBvRfnryRi6H87K2
X-Developer-Key: i=Cheng.JackHY@inventec.com; a=ed25519;
 pk=L+GNI15NJXj7JAu9YqFXp9hL3rwZWbBbjlEeDjPvm68=
X-Endpoint-Received: by B4 Relay for Cheng.JackHY@inventec.com/20250701
 with auth_id=449
X-Original-From: Jack Cheng <Cheng.JackHY@inventec.com>
Reply-To: Cheng.JackHY@inventec.com

The Q54SN12072 and Q54SN120A1 are high-efficiency, high-density DC-DC power
module from Delta Power Modules.

The Q54SN12072, quarter brick, single output 12V. This product provides up
to 1200 watts of output power at 38~60V. The Q54SN12072 offers peak
efficiency up to 98.3%@54Vin.

The Q54SN120A1, quarter brick, single output 12V. This product provides up
to 1300 watts of output power at 40~60V. The Q54SN120A1 offers peak
efficiency up to 98.1%@54Vin.

Add support for them to q54sj108a2 driver.

Signed-off-by: Jack Cheng <Cheng.JackHY@inventec.com>
---
Jack Cheng (2):
      dt-bindings: trivial: Add q50sn12072 and q54sj108a1 support
      hwmon: (pmbus/q54sj108a2) Add support for q50sn12072 and q54sn120a1

 .../devicetree/bindings/trivial-devices.yaml       |  4 ++
 drivers/hwmon/pmbus/q54sj108a2.c                   | 51 +++++++++++++++++++++-
 2 files changed, 53 insertions(+), 2 deletions(-)
---
base-commit: d0b3b7b22dfa1f4b515fd3a295b3fd958f9e81af
change-id: 20250701-add-support-for-q50sn12072-and-q54sn120a1-a9c299e6d81d

Best regards,
-- 
Jack Cheng <Cheng.JackHY@inventec.com>


