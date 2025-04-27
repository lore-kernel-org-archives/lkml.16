Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F8F2125B9
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 15:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745767074; cv=none; b=akx3iCr0Rwa1mjs9ihxSbCO+nogjc1v26jVRabaDL+qXF9FHkdmNUUDfrgzZp/5ZubVJE4FFoCynOtjRBaRjoxw4hfs3BbYTw7e8/JbJ5LWXrY9oGA8O2Lz/FypLY29TT+52l/YVrxuIhgUwZ4DXQ2TV8oeeVE0+oHKyFuwsSzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745767074; c=relaxed/simple;
	bh=r0WkzLf/8cJ2lxWhyde4yxwtG526dOcPnRXqGl1lX3o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IyZcUcq0WTohp0lblba55Iws82Q+4Pziv8/qDqzBoW+l8iM2+QFCEyZNyUyA8XOeg8l+oieeP5bFmXIB6CYjBKPV4eQgTCsu2OUDxXO9mLA13WzsWlSZlO7O5AkUtcnF91ssO74LC1A63CI00nc9fPRfKKd9yVZLxpYQX/0Ff+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DCMYo52a; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DCMYo52a"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-af5139ad9a2so2623621a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 08:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745767072; x=1746371872; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n6wXrjzsVf3DH1Jrc73Ekpfc7PLUWri8Lq7HSEYSNfM=;
        b=DCMYo52aCSEwbPFxNsXdhbuESRqSfVms3lmwvTFqyBN5eGOnXiZwVAV0Hr9qTm3lBF
         Nl/zLlr1kRT+9nhivtsMbdV1DvuUoAuGky1/kMILG29HqilIq6ntUuSM4+OQpTaot3k3
         xo4S6Kr7Xsl1y3tXoCSyNagumV14Q7j/cy9G7eD01LTev+t5UVLaTcarHcS97n9GHGuB
         zj4ha4DxF+MzqCR5u7G0vXxmg4ocHuaTPC0t4QilHRDi92z3esvdrDCN8aBPRRfickoA
         A2Y/pDAyLDwm4uwFiMzDQvmVxF8HuYdq7zXO3ALD4gQinc9vbyzBE9wCZCYkjKkk5rTV
         22Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745767072; x=1746371872;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n6wXrjzsVf3DH1Jrc73Ekpfc7PLUWri8Lq7HSEYSNfM=;
        b=bK6ByKow5/tzE8m88Dvg5tuUqqnQ/XilEdVIUqvskCnHR6KJiaIchbv5YlHA1mNfpe
         ZTWgwgrJj2rl4Sglv3vfvQeUoRotszwzymH5VbhPSQrmlwahIcfyyjgxB6WxWLguRV/Y
         uGEhZP0Q42wqr6yAf0a7Zz/zyHqV6BR9eZ/CfSo/3M0IxC7C2o2iXMrtnsmQSvY9ws20
         4LF3j6VM/LxALh0z55rR3xAgKB03eRtgfsEo5JmsXKWIGJHvYEMNXuU6IoQoekb8t3vJ
         VIeppXbbFtGF/zpNQsUskBdTQIdi2Vm1rJcvuCCf6JDSaE6taXEm9+WPsolZF7+s5RmF
         VVZA==
X-Forwarded-Encrypted: i=1; AJvYcCWr1wI7SWkNniK+PWtgCWdo08i9y9CD7XE7YwP8ySF7S2z/BXrRSIOK/QcqXVVayEj23tojGyVuFZLOMSw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCRkvXZuk2mCU/RWrHb/b4lhckJlCjYd1jmNZK3Vw0WSruAl0U
	WVuNak6ft/eoMGLuWkHiuODCcxZ1V70rI6PeUhnIk4eaPkk1+ZtY+3PgowXgMQ==
X-Gm-Gg: ASbGncv1fSaCGMETsa8Zl6nHj9fjqqYn5nH1l1L/HclVwBA85I924tbHt/hCx3mveI5
	Foinj7J+xikahNjsjrG7XXBnsHhXrNfaE5lAiqKRQSnvh6UzhbRq5orERPqDuisOFPJqCcPophE
	zkXu2MrUhupZyVKK85Yh7yh5PTXnNgIvkP1gRE/kfr+3xmG+OX4E9MQUkwZHIpS3M5an5QLrYWE
	Gr97iJB4B0lClmmbMWoJboG1cW5Q+NQuapuMbc7cmYuy9TC0IcumGlMNftjcj+CIo17li+L9dVu
	rQ1n63Yv9MWPCfxTwKxbrAxafZkfrswTwBdzvM7gFvShRaG28/q1
X-Google-Smtp-Source: AGHT+IHsKSGV7qVUDINwXMp3Zeljydm0ITfFLTON/CQSAoFjpJ4D36vJUKUIXlOMdJUWWo9Rrih6uw==
X-Received: by 2002:a17:90b:2810:b0:2ff:502e:62d4 with SMTP id 98e67ed59e1d1-309f7e8ec70mr11258975a91.32.1745767072425;
        Sun, 27 Apr 2025 08:17:52 -0700 (PDT)
Received: from thinkpad.. ([120.60.52.11])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309ef124cffsm7834594a91.32.2025.04.27.08.17.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 08:17:51 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: lpieralisi@kernel.org,
	kw@linux.com,
	bhelgaas@google.com,
	heiko@sntech.de,
	Hans Zhang <18255117159@163.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	robh@kernel.org,
	jingoohan1@gmail.com,
	shawn.lin@rock-chips.com,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v4 0/3] PCI: dw-rockchip: Reorganize register and bitfield definitions
Date: Sun, 27 Apr 2025 20:47:39 +0530
Message-ID: <174576703760.21368.17997982524874077646.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250427125316.99627-1-18255117159@163.com>
References: <20250427125316.99627-1-18255117159@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 27 Apr 2025 20:53:13 +0800, Hans Zhang wrote:
> 1. PCI: dw-rockchip: Remove unused PCIE_CLIENT_GENERAL_DEBUG
> 2. PCI: dw-rockchip: Reorganize register and bitfield definitions
> 3. PCI: dw-rockchip: Unify link status checks with FIELD_GET
> 

Applied, thanks!

[1/3] PCI: dw-rockchip: Remove unused PCIE_CLIENT_GENERAL_DEBUG
      commit: c2f61b8479b2abcd9e20f8bd4c46e54bb7f5286f
[2/3] PCI: dw-rockchip: Reorganize register and bitfield definitions
      commit: ae8ed2b091ee8bd92da365d3332eebf159de8e0f
[3/3] PCI: dw-rockchip: Unify link status checks with FIELD_GET
      commit: 5e5a3bf48eed8d90bc5c5b710466f24663231f0a

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
