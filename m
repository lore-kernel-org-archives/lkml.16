Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2960328ECF9
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 12:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749038931; cv=none; b=ibrciJr6zirIOfHUyu/mKdEOauYeMEgeb0sVPlxI2v11+p1HskVDqG0ZwQ0xtSeiSpqdKMMut4Q2jk6lcu7v5xq0pHkU82UT1mMjs/8LCGsw8g1VpsTbHqM0M7vubRW0UQCM4AmUiVKrb45AKOKm2Z/4oxh9GKWkvTvkoLmZmlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749038931; c=relaxed/simple;
	bh=JN0Vgk9KPnL+EATlO51MQ+wdhcln9wimpUD//DwZ7Pw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GzUWuQYlxi46ePcOFXqt4q6ah9bxUQA7ocARfzGODNgO58DajaE7wHVYBNO9j5Z1idL6MBKsfr+njNk+GGUl29lK14kH6FhDuedKgGbpCev0ybUeD04qRTyRlSanSwwXEj9/EyvzWXy0Skw8QDP4mLUfUc9MqD2oiTWkjFg4SRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XBHP5Tl6; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XBHP5Tl6"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-747fc77bb2aso1751526b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 05:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749038930; x=1749643730; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=63gUF31R/njodbawtioVjbMgNLq35VUnPeZiigQnoG4=;
        b=XBHP5Tl62ppMUCi92qAnrBB2yXKx/oKJPBhoW1Cab3BcRBPibXkh/4nVs/8YBgLOul
         u8JNgbvJlj1vJm6xyIGjCWXfAyOG2S2Splbit86SmQuikb97QYExH5dM/bwd1FXAsQIc
         zQamA5y1Rljz3Q+X2DGaeFXzB99VGenVMSSwXcmumGJHdurSNFAfDipkBvp/tewDFyb2
         nYvA1LUK3bpW2bjsu8JQVVU2mIYzIMSxr3ciPuzExbqQ5OqQnJlS3FiAgthIbK5TFslM
         3hEXx7k+OXWOM2pw99QrOfsd0HbNenC7f6hUvmI4A6Xheu6sR36s5Gw45sf6BSMkpb8V
         YtJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749038930; x=1749643730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=63gUF31R/njodbawtioVjbMgNLq35VUnPeZiigQnoG4=;
        b=QetrbPG9cDrNL4X39IG9i2IIsNdReoDETMBZtu5y0hvhQNQnR0f7+uQIJX5Dvcw3Un
         hqxSWM1rBQuxM9BZ7ufSzAW1LTi98s0sAvgIeo/6/8vxIo8eQGiBkyYHE8tFNbMiIe6Q
         m6hXCVZxyX+S47j9LjWcYrJOSkeWmBVrxbrUxm3NEooDPyW1pu1Ns5WzCOBx8AXhuhdY
         JZOHt7/A+yahVB9tOlZxgsulCY065DJwrw1SDwfLqx+lNCdaz10MSV7MOqtG2+xXBuVs
         FKFvn7uiBgJTw+rml3a3T2Il7apR7UJUnY7VoIy9hQjau8YqWdlX1rLhFnRHZNeoP2YS
         39aw==
X-Forwarded-Encrypted: i=1; AJvYcCUT3YolYnGfaV4P72aKcUuwVOVJ9CinUd+4nxhqGq3Z1i9GO2sKy8jhpNH4MWWG3GbDkijpajhyeMEd4Og=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdPT/3+duPOBOIyZ8dpyI0m6PeUl724Wlo05S5sOz6LMMFcaQu
	uUvxtzrk53X6gO8uEqwAB8BFfG7oZXOVjWf9x5ec4+hZRyD0Opgy/N70veFrovxVKhOBOjLaVtT
	hYcM=
X-Gm-Gg: ASbGnctit/tPJlVDI8mfqV5jXA3J0BMXU7LLrvekv/67CBCLplxmM0O0DEdwp2JKAgF
	GW0EB7e7VXuc9FrYqLueDi8ZAvFcxrIudjVyXwemZHA0QJjUph97uJJuRAGk6rtP5kdHgBO0Jcc
	inn6i3WwnXaQ9cr/MWJHGdupSfmiLtge1JBjCDRMKACAiIZEHtZmJa9Chm4rnLjugdYHUZSzjJs
	L8ZjF6x6p+deYf2epbOA/UCO1FJQZOYl6tuibeu/2UTfGsGd2LE4bIFJomnthSpt9mB3EaXYLc4
	6eaBmUV7lF9gmKzn3IpVaDJMtPjTf1HMDj3rsLyTP17mYVMeodl3eNBXLPiFN+8tkU3o+xRbQhs
	=
X-Google-Smtp-Source: AGHT+IEI24fmQiYs+KkyGzQenyiA9iVsVnj+bFctMQWy7u0aVJs7US/+jOggPfA1S66IRlVRaTETtA==
X-Received: by 2002:a05:6a21:1:b0:1f5:8dea:bb93 with SMTP id adf61e73a8af0-21d22a6d45dmr4274308637.7.1749038929697;
        Wed, 04 Jun 2025 05:08:49 -0700 (PDT)
Received: from thinkpad.. ([120.60.60.253])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747affafaebsm11034942b3a.87.2025.06.04.05.08.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 05:08:49 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: bhelgaas@google.com
Cc: linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 2/2] mailmap: Add a new entry for Manivannan Sadhasivam
Date: Wed,  4 Jun 2025 17:38:31 +0530
Message-ID: <20250604120833.32791-3-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250604120833.32791-1-manivannan.sadhasivam@linaro.org>
References: <20250604120833.32791-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Map my Linaro e-mail address is going to bounce soon. So remap it to my
kernel.org alias.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 .mailmap | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.mailmap b/.mailmap
index a885e2eefc69..1e87b388f41b 100644
--- a/.mailmap
+++ b/.mailmap
@@ -458,6 +458,7 @@ Maheshwar Ajja <quic_majja@quicinc.com> <majja@codeaurora.org>
 Malathi Gottam <quic_mgottam@quicinc.com> <mgottam@codeaurora.org>
 Manikanta Pubbisetty <quic_mpubbise@quicinc.com> <mpubbise@codeaurora.org>
 Manivannan Sadhasivam <mani@kernel.org> <manivannanece23@gmail.com>
+Manivannan Sadhasivam <mani@kernel.org> <manivannan.sadhasivam@linaro.org>
 Manoj Basapathi <quic_manojbm@quicinc.com> <manojbm@codeaurora.org>
 Marcin Nowakowski <marcin.nowakowski@mips.com> <marcin.nowakowski@imgtec.com>
 Marc Zyngier <maz@kernel.org> <marc.zyngier@arm.com>
-- 
2.43.0

