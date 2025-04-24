Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FCEB17A2EA
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 18:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745519755; cv=none; b=TWVz7hJQQ+irdS1X/wfhM8DQbFjUc5WNTSZO4W26aZyP+/ODxpHg3fFQtKDwa0Gm6Tc2+JwQRtousVj7G/Ei5UE5VCgLaSCgXaTOO8Bb3jVVG1LuG4MQHokGgHpa0UK/gdS9JHLVMV8jzDbFYRZ1thTu2DsZ55ohxxpVBUVt18c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745519755; c=relaxed/simple;
	bh=WzzRwbVxwU4Sg9QhOUPRQ+o57o2byuloGKZZsxSfWSA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kINvfiIpzvneSHotTZEl7/s4Cny5yhMH6C6qfPMhoSOYN8cOHib5Hw9yrxBU66Lb4+GzQBdPfop4jU/+ggBrCdWUQEhXBu6Z/4pZAiikzaIRW76B3/QDOh7N88Yx9OrG1MUpdLvzxmaUPuGBlH4QbekmNt/yG6qp7QB7R/uswFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VRY5UPwF; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VRY5UPwF"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b0b2d1f2845so986811a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 11:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745519753; x=1746124553; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NBc764gAPY6I6oAij8+pGrrMrHEcf79TkE2/AX5UIgA=;
        b=VRY5UPwF7MsJBVhIp7B9eNNOUcJBRPEVGrmlYpKr9l3XUst+iYCcybr087ossRMuBS
         zbCHDgJodEyCwLEaK8Yb+hTg1/NtLlhN7XW+SImsLOWDab/NbXIT4FfZOM0vfqr2tf10
         ovohb5o6ANGo7f6BjNrY9itVCbK3TyGaTryROza9qxCO/WyUc5oQlaOasAOJlGgnNBF+
         ucGbdQ1OdX+Nb+iW4JmFduIt1ueWSQ01dxsszzGEYHyFtGeYSUa60v3kAX6t1sOGI57r
         GUYSqZl9T8tah1wkg2I4Z1T5QaQuzrOJTA2aqn0tf2Cv7zAC3IqgWmRd9D4Xkh8/bT1P
         Ir5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745519753; x=1746124553;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NBc764gAPY6I6oAij8+pGrrMrHEcf79TkE2/AX5UIgA=;
        b=Ebq/RKC6pZQMRFdVAR20EtHPrpAViei6YF1UTvPMlUMQ96hNDnYBxNXOeTI+otV2MA
         OorZzCg9xXr2zI9EdyraFv+U3ERol6EjkCMTwskLQBEDEXUk6Q9O0kxppiT2WwnPzHuh
         DO4TCoU1cI5X+Ucef5E8D2TXloUN1BpW21t5ITkS7T+t/MNY0X86idI4F95W7b46pMUt
         plJTLcaPczjTcjOzwv5MhjgQD3SL19kXNivvGi+nfEgvdgMmPiWd0oi24H1d2xEvRZfT
         faEdUsgEABuYgeSqUH8ERBik+MYVSVqMmU+/BmogImLmk7yndxo9Pk+tT6LG1Jgh/aUp
         IvbA==
X-Gm-Message-State: AOJu0YxZH3l8MkL3B2068T2VdMQzZ07xCeqaLs/dgvnVH8ZezyP14uKu
	O2zF2E8Jk4If6bfFiJcinK9ikUpLcsfpPYMheadV+2Klcx5Nvm1d
X-Gm-Gg: ASbGncuqkiAOWW7H/bDzdXxd7Y19caX1muiJtvpND6NvXhZ9emusaW1P/Th3e8mxRG+
	G90IhDGkIkNnVvlaqU8XAbfsP2lHBnF8OFiBtSVYDU+EwG2//OhcRjegtns49akiNW4jqOeT8GR
	gsm83rcLm//1lMPYoR9HYpCIlTrCB82QkUaKOgyTaoBcPXENgfx0kzxi/O7lL0I95I4OFRYcUEw
	keIQhQTopY47JUsYfaqMqopV2PwEZjI5EvWLxqWITkszd7M2R7dz0ovPkO74ns94VLW8OhXHxsi
	iscMs7dKdb76FNPgFv1rylekVmBCFzs2lqclDnL2FtAttWFjLeG0
X-Google-Smtp-Source: AGHT+IGSak3MroUglM9OJGaj6RDbJwkqMh1opcovTUID/RG97drpXY17L9YbCNB99D0OP9MNtTfw2A==
X-Received: by 2002:a17:90b:270d:b0:2fe:afa7:eaf8 with SMTP id 98e67ed59e1d1-309ed27d219mr5532677a91.13.1745519753252;
        Thu, 24 Apr 2025 11:35:53 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309ef0b9df8sm1744660a91.35.2025.04.24.11.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 11:35:52 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Subject: [PATCH 0/5] irqchip: vt8500: Cleanups and fixes for the irq-vt8500
 driver
Date: Thu, 24 Apr 2025 22:35:41 +0400
Message-Id: <20250424-vt8500-intc-updates-v1-0-4ab7397155b3@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH2ECmgC/x3MQQqAIBBA0avErBswtaiuEi0Gm2o2FmoSRHdPW
 r7F/w9EDsIRxuqBwFmiHL6gqStwO/mNUZZi0Eq3ymqLOfWtUig+ObzOhRJHdKazZBoyHQ1QyjP
 wKvd/neb3/QD0R0jxZQAAAA==
X-Change-ID: 20250424-vt8500-intc-updates-c364a31a36a9
To: Thomas Gleixner <tglx@linutronix.de>, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745519768; l=1132;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=WzzRwbVxwU4Sg9QhOUPRQ+o57o2byuloGKZZsxSfWSA=;
 b=+hqUgicjwuEpZL3HXzOsh/RoNZKxU+jDbd1zr3Uh/hKjekwV+nwr+AJJSjsYNyvjgTelkhsSU
 sJtPdTkrq1OCsgR10uKQcOeWMBaYDqNYQNKAYlGIBe9JfsiCAHlx5QP
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=

Fix the logic of ack/mask functions to actually do what their semantics
implies instead of lumping both actions into one. Also rework the chained
interrupts handling using common kernel infrastructure, while getting rid
of a boot-time WARN_ON due to a misplaced call to enable_irq.

Apparently neither edge-triggered interrupts nor chained interrupts had
any users, so nobody complained in 15 years.

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
Alexey Charkov (5):
      irqchip: vt8500: Split up ack/mask functions
      irqchip: vt8500: Drop redundant copy of the device node pointer
      irqchip: vt8500: Don't require 8 interrupts from a chained controller
      irqchip: vt8500: Use a dedicated chained handler function
      irqchip: vt8500: Use fewer global variables and add error handling

 drivers/irqchip/irq-vt8500.c | 149 +++++++++++++++++++++++--------------------
 1 file changed, 80 insertions(+), 69 deletions(-)
---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250424-vt8500-intc-updates-c364a31a36a9

Best regards,
-- 
Alexey Charkov <alchark@gmail.com>

