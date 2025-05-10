Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 236351B4F0E
	for <linux-kernel@vger.kernel.org>; Sat, 10 May 2025 06:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746858402; cv=none; b=EoJKxKO5K92pqFaHuDSx6wQ2J4+maN+dBu4afM50Zs9Ymv54I607C7mkAA+7/toA4MLcbB3JZ2B7K8mna2fckAJCn+d7OHJ0LqtaCqj5MGeNkH4dm+gpSj/l0t3FfHG80GA+V75EMP4HLgs2gCRDAiqIAYHJZRvQCKfarc8Zq+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746858402; c=relaxed/simple;
	bh=gNEeRP8mAhgrRFkzqhVHnS8wxj5hiHI7YASepNoiViA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sjzbHx4+sD6OZxnHDfimlIFBeboHtfdVOWUKv1StjNi2Eb7G9s5mOhlIdmhMkmGVlNGrTfOstX4g4zlYnONw55UdDPVqhvnwkLIFwHW3KgyEeDbo1BufKSUPxALTRwq3a7CQJ/gNmoWBdGnrX0I2wUP3/mAWWC2qmAJUnECh6mY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fZ2geVB0; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fZ2geVB0"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-442d146a1aaso25919355e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 23:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746858399; x=1747463199; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TC7lxh+szJyHIF0miY38yzEj1EvzlHkiCZowZ1EXMgo=;
        b=fZ2geVB098lLkFXJ0iALI4oylox6jNsuSxEhWIhKs+PeZq+hXhXhO8yuaTC1f4xzTC
         JLFymLIsYw2XpyY/KbpWSqzjwaOUVKSi57fbdZYrJfuGcdiXNmI1VrSpV6bgJyhaD4Ow
         RZVX4LBN3tKowTc4tbviioq5kvEkHZTL2OAOFgrEXgOwHzyPid09AEBUAa+eipsBnFUc
         ubI+fYu2Rz+4rbXJtegbnZUoqneMaPU0n/imV7Un8CqZMtj5QrW9+SO3j/INxmg0WUZB
         YDAO1rEGDyvGClPP3zF9RO6MF5rHs8dY5JOyhgMNCg7Wr/B/7J3PxuSNqVLURnfRHwJl
         B76Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746858399; x=1747463199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TC7lxh+szJyHIF0miY38yzEj1EvzlHkiCZowZ1EXMgo=;
        b=ikyrSyUOHdIvxcE6ZXJNY7zAEqHy6tMYCQCp8DhH9d4Jq2JCQ0Nury88NKFJnZb8Kp
         aXdsOiJle5c7oc8LgVvtfSTlW83cs2OawjdtP1zVDOyLbfzIlQHQ8C4hs6jW1bp621F/
         NEBLnnNrDGpkjCXIiIZrbqp9/oSvP3Jc1Fnj4LwLJqkR2gBDPqJjAuk627t6pS3H9fXZ
         eCPTLdCYPrw5cryOnwzr0W5HiILdreuI2BTOWxnffNLyUTxMz3c5BIqx3tQqyftLBvof
         DL9JVLjjrFpGU+kRTOMHzt6EHG1/w029odPG1pASm9BeWSCHUnfkpleNdJ3KMeicne7d
         yrmg==
X-Forwarded-Encrypted: i=1; AJvYcCW4LKeA2/+l7TwOjHBhOm89W5Ck7NY/JtAUpxabW2OasK/4tcbnI1EjY/dgjNsBmtAlFfztvaDbxHFCV18=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsWepbwYmdav9ocYOAgA6L4Htrl6FLRPkZX+xnKx26uC5PSdJt
	Dbi2/PObaUdgjy94JlQBwxL8Q833HJ4LtRPJh3LcuDc4EuvAxFIAUa+3AlflHA==
X-Gm-Gg: ASbGncsxFTMnUcZATmsmgl9vMa5oG+dV4hZdqmzH/bRnRlUqAulprvtX9axLvUo7JVJ
	p2LYiYOKnQUw9oai2w6TYpVNnvSrNAz+CMxc72OCjVrPwDRG9ZmaNDKBeLnCNLMJ6FvkKzJIIak
	aaKailbEIxQcWKTYr0qerx0IY8gcnVdUf1kxrg4QnfDEy/LGC3/CwUJvIWiD2lG/ZxboVyXK7HS
	CocPvioJ2B0MmsyCq6filxLVchpedwIW5A3zQM04IYbkTZgV4NDhjQtTITjUOwR2EeTz9LfLL0S
	T8nACEBDJ1DMPn4/SKnkflL/ywfqLsA+E7rKZ7n24YUfEW9jKDUTDURTH8FSv/A0SGuntJNNGNT
	YeciV0EwLGacxpkgOQuBX0dVDGlIAQZgusB6F
X-Google-Smtp-Source: AGHT+IE+2HRAOqGjukyBpZGu9Jr1PqwNh0UZdkOulj66hKHxdz7J7jmR3KvyGEl2TsXr+I8lrINlaA==
X-Received: by 2002:a05:600c:c0c3:10b0:43c:f3e4:d6f7 with SMTP id 5b1f17b1804b1-442d6ddebbbmr39681085e9.31.1746858399483;
        Fri, 09 May 2025 23:26:39 -0700 (PDT)
Received: from thinkpad.. (cust-east-par-46-193-69-61.cust.wifirst.net. [46.193.69.61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d146af31sm86116175e9.17.2025.05.09.23.26.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 23:26:38 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Rob Herring (Arm)" <robh@kernel.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: PCI: Convert v3,v360epc-pci to DT schema
Date: Sat, 10 May 2025 11:56:35 +0530
Message-ID: <174685839013.11086.10599416175883507159.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250505220139.2202164-1-robh@kernel.org>
References: <20250505220139.2202164-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 05 May 2025 17:01:37 -0500, Rob Herring (Arm) wrote:
> Convert the v3,v360epc-pci binding to DT schema format.
> 
> Add "clocks" which was not documented and is required. Drop "syscon"
> which was documented, but is not used.
> 
> Drop the "v3,v360epc-pci" compatible by itself as this device is only
> used on the Arm Integrator/AP and not likely going to be used anywhere
> else at this point.
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: PCI: Convert v3,v360epc-pci to DT schema
      commit: 9a5f8c7a81cde01738d4fa25624669a3d6f859e3

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
