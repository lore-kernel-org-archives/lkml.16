Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DE3622FF37
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 22:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738879795; cv=none; b=bD7C168vqEwDe0Hzh4FB24WdREi5H1wtMx9q3LvsBAhhsCqaGy3CMULXQ90WMH6NQX3NiPo4ekbBJ3x3Uq3WmFivQ8kaQIs4R3Jq0F0fRnBi98jcS1hqXlfbr9JShwi/7B1uiZ0xZPFlByqN+ZBf2GbIOYlz6LzVJzyjPDMrYqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738879795; c=relaxed/simple;
	bh=9F+k0wZtD3XTper5h4ap0UH/G+LeC9jHiWwbpGPjdZ0=;
	h=From:To:Cc:Subject:Date:Message-Id; b=q3UUZ2rIw48+fIU0/k/Zpu8oRPd+pO2DRDeM+P0xCroGfBYfVQmfjnztfHck/BiFAY3T82e9CwOzES76Ix72hd0RyZeIx7tWB1pW/KBbceE8kv94MMWqHteo5VCZ9Lz9JH4Ul3bMs1qElvXSppXNg4kHKKQNFQ6bBAn47SuI36U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Irz+q56R; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Irz+q56R"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-71e181fb288so975012a34.2
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 14:09:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1738879792; x=1739484592; darn=vger.kernel.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bKLOHtlnFeDc2mupUeHKGP84WLv0obwYAIFvImFlmgg=;
        b=Irz+q56RoF8aEbs9kLpy5UlcvZTNxHQS9AiMxCdMT6kbSH2xKLnjcxt0Vch/KN2FS8
         3QWcdd9UpKd+EH4IcRmw4cBm8J51Z3jOhXJprz6UF6MK/4aFMHIth8AA7gYETkkcjbPh
         JXC8jcahsWVvLUR1HsZN26XOEvq7wGgs4177g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738879792; x=1739484592;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bKLOHtlnFeDc2mupUeHKGP84WLv0obwYAIFvImFlmgg=;
        b=oGKdyXqAvQLlV+RjbG0jiYIrZp7EV/2ZTZYINVccqUVugPJCqWK+a6nOoxpOWgHgef
         MaOBx9ZYxQLumKx7BXRgnAfxs/FLNy7t0WX0q5l7MnbabkJKIaS31/gj1G2hMF5Y+kLH
         53Z5XWcJlKDypr8+8cT8pbSHCIdouOv9N1fpjqylMb5ojMJLnLsSD2WvjlVH/RiNG6CZ
         8f6kDZPtxZ5+6DXZa3JyeUbD+vHbf6MTf+U6OPXo0LPwRDr6GQrl6z6aWr5kG7R4mZZy
         WsT9RSy5xaHCzlQ+jmOX6SmaPbwdirZ69CRNCavW1aRgybK/hxVKRzDLRHbgRgFr2JeS
         54sA==
X-Forwarded-Encrypted: i=1; AJvYcCUmeTXPuAcs7dEawteMxuoUs0FHDx916skk32t+WQGr8iTZe9SzV2aWutUHQCNdNfDc0IxOHlHYV6EFHV8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwH1OLB+sFwH9iI53GZEGLTZXTidftmZgJZcSmHrxe+Ld53iRfA
	cK6WWiEw/fSKKMInacyKwbK+O508u434kXdcCN+Luk2S27B1dp9/Uong+QCmzQ==
X-Gm-Gg: ASbGncvsY/YATlvz4rEHBLZe02Qdm8vpAxUqiG0TUuUZjQ26py96LwuWyN0G/ri1gQX
	ypStGicdzU1AFsQZypTR4rUAy6U/5LiW0Xm68Sl/b/JvZzD4/r1XufVsUVxAbTYmsztwNyEeaxF
	XY8P9Af3jM8SBatRPKUddjj2jF+5AkWzrGPV5aNtdSNeiFDlsjPMRQn1q8xRSt8Xy/P578Ga7ri
	2EkXh76THGwTt2jRZvNK9mgWQHCkX5xJWgLPy0K4btUC7qdy8wCYeUBiDffdyrtxMKTWUmVIFw6
	f5p17X5/w3o26eOuUwLmZomfT+HUMSw4QZIooUsGEQ5MWI33ehk=
X-Google-Smtp-Source: AGHT+IEHe1IPoheKKxZVoNH3Y4DP7iwCSU+DV5NShn+FO80wEUB6babC+pZZtSNlZsFF7OFhthUckw==
X-Received: by 2002:a05:6830:6501:b0:71d:eb02:bad6 with SMTP id 46e09a7af769-726b87e7d24mr712227a34.13.1738879792140;
        Thu, 06 Feb 2025 14:09:52 -0800 (PST)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5fc544cf88esm454109eaf.15.2025.02.06.14.09.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 14:09:51 -0800 (PST)
From: Kamal Dasu <kamal.dasu@broadcom.com>
To: ulf.hansson@linaro.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	adrian.hunter@intel.com,
	linux-mmc@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	wsa+renesas@sang-engineering.com
Cc: f.fainelli@gmail.com,
	bcm-kernel-feedback-list@broadcom.com,
	Kamal Dasu <kamal.dasu@broadcom.com>
Subject: [PATCH RFC 0/3] mmc: sdhci-brcmstb: Add rpmb sharing support
Date: Thu,  6 Feb 2025 17:09:37 -0500
Message-Id: <20250206220940.10553-1-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

This patch set adds support for Broadcom TZOS to read and write to RPMB
partition using synchronized access to the controller hardware.
To achieve this Linux OS and the secure TZOS make use of:
- shared hardware semaphore register
- a set of SDIO shared work registers and
- IPI interrupt registers
The sdio shared work registers indicates next in queue to access the controller
and current agent in the queue. The currently running OS that needs access to
the controller puts itself in its slot of work register and if its next in line
it can try to grab the hardware semaphore and complete its mmc requests.
Next agent queue state is changed under the hardware semaphore lock before it
release it by looking at work slot register. send and receive IPI interrupts
between linux and secure world are used to indicatecompletion of transaction to
the waiting OS. TZOS has its own RPMB driver which accesses partition when it
wants to read/write RPMB frames. Current implementation assumes Linux and TZOS
as the two work agents. 

Change required adding two core mmc_host_ops request_start() and request_done()
to let the host controller driver know when a mmc request starts and ends so
that the access can be synchronized. This has been tested with both the sdhci
and cqhci access. Currently these ops are implemented by the sdhci-brcmstb
controller dirver to acquire and release the hardware semaphore before and
after access. This change to the mmc/core driver does not have any impact to
existing controller drivers.

Posting this path to get comments on the initial implementation.

Todo :
- Provide  hardware smeaphore using the harware spinlock driver framework
- Use IPI send receive interrupt controller driver

Kamal Dasu (3):
  mmc: add request_start() and request_done() mmc ops
  dt-bindings: mmc: brcm,sdhci-brcmstb: Add sdio sharing support
  mmc: sdhci-brcmstb: Add rpmb sharing support in host driver

 .../bindings/mmc/brcm,sdhci-brcmstb.yaml      |  16 +-
 drivers/mmc/core/core.c                       |  14 +-
 drivers/mmc/host/sdhci-brcmstb.c              | 275 +++++++++++++++++-
 include/linux/mmc/host.h                      |   4 +
 4 files changed, 303 insertions(+), 6 deletions(-)

-- 
2.17.1

