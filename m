Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A7F1DE88A
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 17:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745775068; cv=none; b=kWXJmNKUFlakbAuZrt4z/Cdoqvy4IqvEvwRif0xeXcTQOZzUCn0NsI4xnb7ShLhfvbESakCYjPOdZ/EvCRAm2MWqMb6xZeAn9/7QaCJ1yZEFSjf+Ky0M8T9mGKKX9dTARUm0wwUGWGSC44FJWhndKp2GwEKp0DO8PUAOnRXWNFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745775068; c=relaxed/simple;
	bh=MV8BXgH2DrsVfLUkF+qFTQ43T/1n0584JK4ESCera+I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=csOlv2ppqiRdvBdNoAdfeIbVAp/fGjQ/N4dvZcoBoTub9IEpnZQYE6nHUjEPwEbN8pPfoJAQ7rfsd3An2cE7c0gXnAvl/Ffk4NkQFu2SfM/Qaf0E/YtcLJQw2ef+UDDm3APjmqGer/zzHqNsxvXRIuSB1EQH3ELO83aQQP2sPLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MC/M4XRb; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MC/M4XRb"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-739be717eddso3215691b3a.2
        for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 10:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745775066; x=1746379866; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SoBsemGgaytW/8rZ1RitMi6CJ1WOvsFRPpJ+sFYMGyg=;
        b=MC/M4XRbuGfRcx+oRPjmBuCHZGuqLOOokLGuaMShl1DkEGRWjxrqlAfljhnkpNtbdV
         V1+qglpTJv1+FWv0iJGomYKYb+5ybf9z4Sf7mJaYoo431Hq6mA1GDM4PL80eKRECu56A
         JIF81j8mmgOHoni7FKnRKAt7x5UelqSoL50GpzP/cPSJbwuH9m+KcW+NyCwgW51zYiH3
         yU340Ox4e6H8aAsf9/TV3rMRMab/nKcfE/aqn3gioNM8lC1EbhJKKVgiSCIjIvkzBCuW
         FpXlqfLGDhnkXfXSpXeGvoMPh/mEcDSyh5HEpk10v4MjY7N1SxUDBdOS6jc6gQgcYAPc
         x04g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745775066; x=1746379866;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SoBsemGgaytW/8rZ1RitMi6CJ1WOvsFRPpJ+sFYMGyg=;
        b=VfhyN19HTlfa/BadBWhpNMbCF88E/qpZt6wY+n0vpFSsFHSVp31v6MqnCgy+gWvfFv
         eEhiOOlhP8vPmS0NDCG4Ankzv8aPqIeCokq13XQ/k/H0JW7sTscXbAU66MkY1PiseRZV
         +Kf+vlRDw1s12RrZvZVPAluX2gMFNf1w2mZmZ5xxs4HatigzoSK0c2CrSpGQzCc/dc3o
         k9X5SEE9twxJBhccfKTLSugYlgZj82IF9v7Tnsdf4EsxLJEXUUsr8U46zf5LdIHSmY/R
         YMjj0XGll/ve2QVKROzvr/LxAr0JYR1z5CugJIaNA09D30J5LJMR3tPxcXGUfgVMajX+
         FHlg==
X-Forwarded-Encrypted: i=1; AJvYcCWaZoUCfifQMww7+KVs7ma55hCTxY88EyFHBj2B9qmwF7FkCol0pPQ/HJeiRSTBxfyJIWo6f0gqOp5M3TM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMDANqpfz92hl5ZbRBrNqHNvBoCx5Ec8I1qAbJdZgMpS2jOgQY
	Gdx51eGApAWLghKEt3G87lWwJ3QvbwG/EqWgdcuzZ8AMF6pPq0y/ym2CrZjnIA==
X-Gm-Gg: ASbGncsFgV05GQYiP1H7fWLCF7Pz+RE1HdGmmRScDOQDxOP1k9jv+DOKQ2/3E6Yf85n
	Da25sR5cJYavmRyBeNULZ9O7MROhjXkuFClPoj7EN8VTcZtdnQild0i+YOKLKc587pACJeo1RJW
	zQ0UGFcVzSRaLbB2CFG5jKd4ILsivaKTHZeHXsZePaHulyyPhWGxBd8fQ4TzqDcLhPwGF/9G4OX
	ySrM6fXEgStJ1lZJJTWqxtjMgLAgCGiWFrteCtJMCigHIdASxBUXYzmTDrTexZVcm0AQp8jfT78
	vMJJBGkGsEqJwc/EyNxS5ofSjFRRiQ7QYR5UnOr/kXMJIVvnOEq3
X-Google-Smtp-Source: AGHT+IFvoBhvOQtuWsxWf90w/u7lLk5I5p38IZQNxar5PLccdleT2TxPb53uycEjiK2wT5Hb+izfJQ==
X-Received: by 2002:a05:6a21:6704:b0:1f5:7ea8:a791 with SMTP id adf61e73a8af0-2045b6f78dfmr13244374637.10.1745775065819;
        Sun, 27 Apr 2025 10:31:05 -0700 (PDT)
Received: from thinkpad.. ([120.60.52.11])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25967766sm6414771b3a.82.2025.04.27.10.31.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 10:31:05 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: jingoohan1@gmail.com,
	lpieralisi@kernel.org,
	kw@linux.com,
	robh@kernel.org,
	bhelgaas@google.com,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wenbin Yao <quic_wenbyao@quicinc.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	krishna.chundru@oss.qualcomm.com,
	quic_vbadigan@quicinc.com,
	quic_mrana@quicinc.com,
	quic_cang@quicinc.com,
	quic_qianyu@quicinc.com
Subject: Re: [PATCH v2] PCI: dwc: Set PORT_LOGIC_LINK_WIDTH to one lane
Date: Sun, 27 Apr 2025 23:00:55 +0530
Message-ID: <174577504939.89301.2622778096391890243.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250422103623.462277-1-quic_wenbyao@quicinc.com>
References: <20250422103623.462277-1-quic_wenbyao@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 22 Apr 2025 18:36:23 +0800, Wenbin Yao wrote:
> As per DWC PCIe registers description 4.30a, section 1.13.43, NUM_OF_LANES
> named as PORT_LOGIC_LINK_WIDTH in PCIe DWC driver, is referred to as the
> "Predetermined Number of Lanes" in section 4.2.6.2.1 of the PCI Express
> Base 3.0 Specification, revision 1.0. This section explains the conditions
> need be satisfied for entering Polling.Configuration:
> 
> "Next state is Polling.Configuration after at least 1024 TS1 Ordered Sets
> were transmitted, and all Lanes that detected a Receiver during Detect
> receive eight consecutive training sequences.
> 
> [...]

Applied, thanks!

[1/1] PCI: dwc: Set PORT_LOGIC_LINK_WIDTH to one lane
      commit: 1f7b788a088ee202ecb2eada6bc34d38d63fea19

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
