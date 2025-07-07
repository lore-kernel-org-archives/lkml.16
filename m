Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8996E28852E
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 10:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751885433; cv=none; b=pbOGQLfAwpdUk/6AMxRcZ8j8aaHGAEcoauZj3rRyB3UZFBi6DGDZt+gCtYexnmZIn3BM2O8LAclwQpLRicZgyhoBF6YRR+Dg7nLpqhpSxqLzk4bqqBDYFcqoW2lNDRkn47mkBRxUGf7Tagdicecsgrsr4uQpuhy104c1pA1S9QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751885433; c=relaxed/simple;
	bh=qNErsklCCNUv2dSOgz3eL4jlB/8RA/GANClN4lYfUBo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=p/57a79V7msLkyusC9QNztOuDA6nElakVlAfFRiYenaWjQ/FHIZKGR8mjWi3jPEOiIDoDUxTQVJw8j7sbmj8VL8rEEK4WlVBO8It1TQXg0jNnzKzxTwIxNQzPgBIw5Y8Cbh6DyXAvKs+Fm3NNiQmu6Mmel8HuA3jLWCwvg5/Ld4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JB6+v/LW; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JB6+v/LW"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6099d89a19cso5322027a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Jul 2025 03:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751885430; x=1752490230; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4U2n2Xmf/VrCvsvS+nWVm8TQWu7/up6x5/MxPrcAISM=;
        b=JB6+v/LWlmlk91AVXhCMsDKsdAK06Kv0K59PSl3Mv/PcOmceo7wqZ+RL9x4krmHND6
         glFanVySdAwySYwSWd7TBbwInGgpRxvu28oiNaDsc862nLzcOgVt8+q15i0e9iKKWRxZ
         tItCfVQoL4oPnPTMuJjA5r1uPErnaY0L6TVOcfpizHL8J+2w11C/OfMbiGWHEhF9KWGt
         7W6fTrWiwIxgpVS+mMckf2WgGZvV3GOQkcP7n+wrWDFhXLs+WEv3/E8/MOzXP3OkfsL8
         SdFWUxeE2TCfVQzm2+CRHeKs2BoySaTkgHgP0HnOOblQlsFFbzMUXLJhyFEUt8+2B2tr
         g12w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751885430; x=1752490230;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4U2n2Xmf/VrCvsvS+nWVm8TQWu7/up6x5/MxPrcAISM=;
        b=t7SKtxOlbwOCAlDt/RCZ+2pEJEXIcPLELF5bcLBDfEjrKwxfihdsLsCrozMe96YbAU
         gF+xwI7wk4fHlFI5zsgvro/ei/gKdgx8ROmCVabX0KZz/IAvScC0A5492ek0azBj0SUx
         xDisTgE0koH4q3NYTsbW60fq4sQ7jdTh6uZHY84w4NIAvHfVH8TPZUyKfPRy5QoAt7GN
         sSUCtAdf0EQjrZ+0wHKBOIlBGzAiYCQTTFmZ+CjwqU6B+WD4JzjwgORxfGAC55QCyIJd
         YWoi0KTg5IJfD+qF88CfmofhVO/Q1grzg6JtlMAmd7OVgAhg9o7OiJWM854poy0bXgFX
         A8Mw==
X-Forwarded-Encrypted: i=1; AJvYcCUKf4KIbEu5j/rcEsmDh14BZyTpXv96hC9KVT3DMgfce8lhGzHMasn3riHmejWniKY/UXwP+xAv7CRu/rQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxO0RJkiG6RfN58tnUWmlU/BFilAGM3bUFl8ukpcjNbxPDijX0p
	AiCWCMz3iHoSYzxy5zVnmO6XnMnJMcbWh86WU+sQXO1mB+vhl0D3PIpzY/78A5AORTw=
X-Gm-Gg: ASbGnctNC3LkJ0ooBlgUk/RfkQZiCYbM7Z+hS3JFmV3SjJW/k85EXB3WkjHzx1oLrST
	FHc/s0TGeYAiIOLbi59BrsiNyA+zfoOseI/nbtRCRlL13yXWmLWZKEnXtm/XHXm3goA4zYzEwhY
	niNLZVmXTmnCEEmewMKqL83XNTNtKEFmg2urkNDcgR4a4dNnyWOTGU2x5PkTUdP6/B6SFNP/we/
	fNUaZj+vr5S26mIUO7xTgPHlLlqWRla4YwPqoLeiTlRMjNGbT8wiBqn8kU9W9vXS6Ht+UeEbR89
	Nb1q095YMPc8HGdmdpTSZcHDLOCSSo9o6AGyxJxzJfmWqW+GZ6JckhqGV4xZtjPSNO801VCYXjZ
	Xvfh9BElbdyVeP9yp8Jc2XFElfvjOCdg6b3VKigbA3cEAlQ==
X-Google-Smtp-Source: AGHT+IGExgirFuVuqNhA46rpNTwHtjU9MFrk7GA0mFCZSZJ/o6/0kUUc2TzmGgHsyN2ONS0oSwy3uw==
X-Received: by 2002:a17:907:c28:b0:ae3:7058:7b48 with SMTP id a640c23a62f3a-ae3fe61ddf5mr1232391866b.25.1751885429793;
        Mon, 07 Jul 2025 03:50:29 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f66d9263sm685589566b.32.2025.07.07.03.50.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 03:50:28 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH 0/3] usb: typec: tcpm/tcpci_maxim: irq wake and other
 updates
Date: Mon, 07 Jul 2025 11:50:26 +0100
Message-Id: <20250707-max77759-irq-wake-v1-0-d367f633e4bc@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAHKma2gC/x3MTQqAIBBA4avErBvQQqa6SrSQGmuI/hRKCO+et
 PwW770Q2AsH6IoXPN8S5NgzdFnAuNh9ZpQpGypVGUWKcLORiEyL4i987MqonZtsU5MejYPcnZ6
 dxP/ZDyl9KfnkyWMAAAA=
X-Change-ID: 20250707-max77759-irq-wake-1ffda8371c5f
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Badhri Jagan Sridharan <badhri@google.com>, 
 Amit Sunil Dhamne <amitsd@google.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

These patches fix a few small issues with the Maxim TCPCi driver.

Most importantly, the driver never calls disable_irq_wake(), and while
looking into that, I noticed a few other possible cleanups.

Please see the individual patches, they're self-explanatory, I believe.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
André Draszik (3):
      usb: typec: tcpm/tcpci_maxim: fix irq wake usage
      usb: typec: tcpm/tcpci_maxim: drop CONFIG_OF
      usb: typec: tcpm/tcpci_maxim: enable PROBE_PREFER_ASYNCHRONOUS

 drivers/usb/typec/tcpm/tcpci_maxim_core.c | 51 +++++++++++++++++++------------
 1 file changed, 32 insertions(+), 19 deletions(-)
---
base-commit: 50c8770a42faf8b1c7abe93e7c114337f580a97d
change-id: 20250707-max77759-irq-wake-1ffda8371c5f

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>

