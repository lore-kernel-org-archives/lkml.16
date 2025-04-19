Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E7CE1C84CD
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 11:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745062765; cv=none; b=a5AydBac8uMl1hE/s5wNxeII7oJVY8/i5JjDre9xMTyCGBpOJL+tH++MFfkCpx2rf3h6xWc9146S6WonghJZS8JeIIP7SpTcnlC3qSmeMqqutAJa1xXppSPfKI8xnb0cZYDfm9Lf5WzOudn52IcDtZCouZi9ZTXC6iq6A2rqC/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745062765; c=relaxed/simple;
	bh=2A2UVdf1mOcrhJ3bRj8He0+tcBB9zyGlXLSlatqP2BU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aiDJGonPDABkVG4taeJbzF2kjeIfXFeDC0IGQt1fgCkr0EcEo4hdJBrzpBNvByL4dnT/QdRE7NWNvr/4L38iNNtRzITHV6iofQSCqQr066rJRTp7ZlA6M6HQPQTGIvTI4LOp52GEYG/eDkwgWL8VOrcj/bmHBsXoHIXTdTSaHuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tY6MTNu7; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tY6MTNu7"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2255003f4c6so31101895ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 04:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745062764; x=1745667564; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=naTUGcRXI+92SJRUmQQLlU7HwQfEquV8J8DD6ubm8Vw=;
        b=tY6MTNu7/6mzKzOBarm9fKvJYplmrU6vun/LaZwV6CjFV1gb2kOMidgZAMwoXisBia
         R7ab43bojby/NbCf42GB9hB6fXyykw57SRuRjodS9aex5OAiAS7NyrZrvaoWk2V4k7KB
         a+RMkrHtkGVgdajCbk++GF5Ab4v9GYqovBPUC+3oHVEIo9gBk7ECnZmEQRVMUqlDNOya
         yEJShJUiWM09M5N3Glmq/oeMobVayLEaPvHnNHRKewGKqYDNIST+2UYnZKM5iHRw7abE
         AWUo6YL2XqwpxglxJ1a2ryOrIq5Xmk8BtRctySVoLh535445hxtx4JMQI5ooDnhaJphf
         XOjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745062764; x=1745667564;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=naTUGcRXI+92SJRUmQQLlU7HwQfEquV8J8DD6ubm8Vw=;
        b=xL8pakALECsDFxm3W24841/S3K6mzTDA9uQmDFr0+9cX9g+raOdzViHP1v2H4X65rK
         8UHK9yh1QB48G0IYuSxm7+4U4nq3CruZi76WAwQbeLisVe0ophoUsZl7tTZ5yXgVTXdT
         1nSC1EH5IgW5sahp7dC/WdJBKaisJRllM3bpCxDTD9S0RFr1CBkSyQDVhloNKO768yrF
         C6+K2UoAkP50XqAzmtm/9WPtZu8FPnG2IZFgDf8nlrGnlMlIreAINlsKjwntYr5m9vHR
         tQM/y1ZmFG/VXnEi+Dxt6ErlNg3dy/KDOfxdqT60Wgm2Qxt34TgkBTlMgPBEUSK5a5Jq
         ujUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUuoj8rjnCxf40neggfibaCxq8lCfr7WCIDwcVGMrITF9t482kXWkucB1xkEGOMnEhdSEMkEuV8jiFczA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzR7Ir5W7YkHbmqI7HYMJO6vISF2sDTxQaeyFA7MjkuI/sOUmCn
	BGT3CveE31OrBRoj7OxeJFoEsR4PEYvFTYdez5ZNnjf2Jo3cQx8Cl/PeWXeqeb58BzsV6HUOZe8
	=
X-Gm-Gg: ASbGncvVE4ZE8YwL2Ojzxva1XjLeHSF+92mZNOsynBz0J2jecSjTwu6Vs02soJqE75J
	woNYMbBYLxzw7is7Ypk9cP6s7FNqmsTlBreazxhOlCV7BYXwq5grUwRuvvZeEkXZ3vSl9v0IuAl
	6P9c6ofNdrUjAfSVuIHRPVOxfZZAdWW1r4kVf2EmfAUhfEuqG/Mr8Cn5P9uVnzhSKtcCNXozMKM
	qA9N7N2ITitsWVfVlUSAFe9i6FDu+VQ/l7KS6wJA+engVrwj3fmTHX1Zs7Mcv1eeqe85vmJ11bZ
	0x9CCS1W0R9twiT0xxdWACLawAuN1N70vP1/7G5Zb9MmMW8cFziT7MJY1ssZ/IXZ
X-Google-Smtp-Source: AGHT+IHODxROKgoJD0x5IRy4FMJDEfuxg+Ej21GAqp+g5b67FWig1NSQdI9leulQiZTNSUnH9Te6Kg==
X-Received: by 2002:a17:903:19f0:b0:223:5945:ffd5 with SMTP id d9443c01a7336-22c5360be53mr95211775ad.32.1745062763804;
        Sat, 19 Apr 2025 04:39:23 -0700 (PDT)
Received: from thinkpad.. ([36.255.17.167])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbfaeb632sm3249763b3a.172.2025.04.19.04.39.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 04:39:23 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Marek Vasut <marek.vasut+renesas@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Serge Semin <fancer.lancer@gmail.com>,
	Jerome Brunet <jbrunet@baylibre.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yuya Hamamachi <yuya.hamamachi.sx@renesas.com>
Subject: Re: [PATCH] PCI: rcar-gen4: set ep BAR4 fixed size
Date: Sat, 19 Apr 2025 17:09:14 +0530
Message-ID: <174506274083.37422.16454115819729459708.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250328-rcar-gen4-bar4-v1-1-10bb6ce9ee7f@baylibre.com>
References: <20250328-rcar-gen4-bar4-v1-1-10bb6ce9ee7f@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 28 Mar 2025 15:30:44 +0100, Jerome Brunet wrote:
> On rcar-gen4, the ep BAR4 has a fixed size of 256B.
> Document this constraint in the epc features of the platform.
> 
> 

Applied, thanks!

[1/1] PCI: rcar-gen4: set ep BAR4 fixed size
      commit: ca0c5fd2282eff988738539f80b8eb4e1f81a342

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
