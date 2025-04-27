Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D7E18B0F
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 17:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745774293; cv=none; b=WJ5Niazf4oa5Qwa5J8D+/BC0WwZ3Z2lnvfhYiA9Ee+TzHzxout+nfUE1EwQg04xr/LUXvzMvABkbYHDexbf2q5k0GTcTSwdO/TKMwsW5I2xWHNKZWnmVGQdNjEuABaFBMlXUS7Q2C9K3ruSOSTOoR8t2yxQKYIFLWp2ltDf79vQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745774293; c=relaxed/simple;
	bh=Gnuhvv4KUPpANGsE/eqvgSDbJAwmlBusMJ3GevX5lOI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Xpn9K4tvyXdyaO6iX9Ycpn5ydJUj4DegISwt8o+dZAX2xqTg7JugEtwfkzoRNOB6CT8hjtPUwKFUeKBKgFjydkmlMne2tDOexMl3fVT5xQjKh4IJv8wEL1jsMpZpDqMBl4aixVdFfnnLdXGvWohhjGbU+k4j0hafzJUz/nPgs/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JhZKKAic; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JhZKKAic"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-301c4850194so3220539a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 10:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745774291; x=1746379091; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KGfvwG0lJjJnssDIjMncK4zxO5Uxbjv3u3y95m4bzb0=;
        b=JhZKKAicpAMPht75H97BPVzxZmy8tDXrEgWi2SXAOF5J3/gK0GrC9fnM1+HR2kYQFX
         vvDogMoKWtOcHZrCg8G7AdoowGVqvuUwRJ9tT2cuaW7ECNVB7fUhmi4bAl/ql0kqk2ud
         dLuQDpBN7Ncow0/05j6Qu98EC1my3CJWyAzlcEzzhn1IeJyS1+8ysR6/qnvHIgQrfrM8
         JbCed1VKP6x9jG8qDCOG+C4QaM3EsA13FLsVPLB1Pq+BnWcxLfQN5o83EeSDeCcuIzvD
         jzrUjrEQbdBw5UtBI5UvV4xY1ECJiVnFh+hg5PkYa6RCD55Q6fEWiEZzqDTKbw9dGude
         w7yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745774291; x=1746379091;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KGfvwG0lJjJnssDIjMncK4zxO5Uxbjv3u3y95m4bzb0=;
        b=jpamAmOL6b1DDWI+Zis06LanknEi9wHNc4esaJYMPjfrFkcTUEw+8ksghsY/oExBVH
         MZA8q/u2k3DE8hUdByKjsirqYUsDdR2atNMuGQAVEH4LxHIG88MGW/Hpq/wkDEg1e26o
         hxtIuUuiFF/gA0otlE+QeEg/EDpn7pLaD9Mwlh5qfZPW7fCx0Cpc3jwUwh/LUJDL6XSB
         6vwSMgZb3NSoC5jvp/+SU0ymToaW3rsdqtzfBT0CyrUpSQajI+XJBy2W/+Rl1/NTnQ6+
         nLOegeGUj1ApJwe+AfOwfP1T7OSmcgw8gKppvIUhwfEH0MMZd3EidL78no51a5bbUYt+
         3fww==
X-Forwarded-Encrypted: i=1; AJvYcCVT3NLCK6lK/HxoPSiqwbXB7FxWFbft2TcNKxjFBq+MzRWpEYpH7tvsXsvVKTzxHyqGfS3Q0fXiFw6lPPI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUYUt2bmmxP4WeprTEhBts4LOg2qWJOpSuvahDphfrbGsgZtN6
	dl3VnIbgrsOTqZ2x92pRy1QAcfAo+Ut4lVvMbqWeZSDynYYm6yy/hA+jKNpGdA==
X-Gm-Gg: ASbGncuZ4Q5v6f7orqHVU+KGrhVQnW87KOdFLGjR2bB9cxjBrJmf7DSYp4cGU8ba36w
	ijJHQpQuTJvm6iU1Te0C/RyJtAQwy3dvcZ9IAtLxYuHrp7osf0J4dJqk2mAZiuR6pTy1Hp6Lg7f
	VLUBLxqZKTmOpfnz3lv3JxJoFN/4T0k0yowOGL7/LorC3rJjwIQ/BBtTjaTqN3qGSSqCzQXRGCr
	fPyJZxKEojmo87tKLwbszUosjGxHTywTtNS8rVI6bymzKcmoflB71MC+40WAwuFdfxftTMWXVAi
	NiNkC/fm3AbCZw0Hy8dw4nY+yPdGrVc8prqhGClFdrr5CpH2G+mH
X-Google-Smtp-Source: AGHT+IGEJGjOrAHuRlC8FW7W5k8PqHO+m0uDpo2VUIDPeTQamnBsMG6rTDTesDmrV+/O1+7KTWI9/w==
X-Received: by 2002:a17:90b:1f84:b0:2ee:f677:aa14 with SMTP id 98e67ed59e1d1-30a013075b4mr8795318a91.13.1745774291083;
        Sun, 27 Apr 2025 10:18:11 -0700 (PDT)
Received: from thinkpad.. ([120.60.52.11])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db50e7741sm66038245ad.156.2025.04.27.10.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 10:18:10 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Jon Mason <jdmason@kudzu.us>,
	Dave Jiang <dave.jiang@intel.com>,
	Allen Hubbe <allenbh@gmail.com>,
	Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	Jerome Brunet <jbrunet@baylibre.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Marek Vasut <marek.vasut+renesas@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Yuya Hamamachi <yuya.hamamachi.sx@renesas.com>,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ntb@lists.linux.dev,
	linux-nvme@lists.infradead.org,
	Niklas Cassel <cassel@kernel.org>
Subject: Re: [PATCH v5 0/2] PCI: endpoint: space allocation fixups
Date: Sun, 27 Apr 2025 22:47:55 +0530
Message-ID: <174577426298.86106.8309026357756060948.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250424-pci-ep-size-alignment-v5-0-2d4ec2af23f5@baylibre.com>
References: <20250424-pci-ep-size-alignment-v5-0-2d4ec2af23f5@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 24 Apr 2025 10:34:03 +0200, Jerome Brunet wrote:
> This patchset fixes problems while trying to allocate space for PCI
> endpoint function.
> 
> The problems, and related fixups, have been found while trying to link two
> renesas rcar-gen4 r8a779f0-spider devices with the vNTB endpoint
> function. This platform has 2 configurable BAR0 and BAR2, with an alignment
> of 1MB, and fairly small fixed BAR4 of 256B.
> 
> [...]

Applied, thanks!

[1/2] PCI: endpoint: improve fixed_size bar handling when allocating space
      commit: df4b24b510c9ceac32aeb3ed5904fd93b06a51b8
[2/2] PCI: endpoint: pci-epf-vntb: simplify ctrl/spad space allocation
      commit: b47493ff0d43608257a24d65f5b26a4a6376ff9b

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
