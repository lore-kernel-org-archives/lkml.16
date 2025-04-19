Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CEE01ADC8D
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 11:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745062532; cv=none; b=nDdKRxvS/ofK01g6getrAdtjoJitGlUr3bQ6BAg7J9oAhCjqQZuWOzlvWo/PQbp35HyhCXV3i4+G6zHWaSBDqw13imFEK1LfIrfFgkjJzIOsAhWovgvcrtmqiY+TitbMB3R8+Ovq6VHLqWkoCip9lYKse+Y95K911WMpjH9KlGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745062532; c=relaxed/simple;
	bh=hSrFgG5GCJ1EOixVEk2PIVd25zGJ4lE+rWDW8ZzPJxs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o+/CFZcTsBoW/XA2LnlJqsa2BXzZXMnssnoZFMRvThdkp4rsA0XMLiws8wTjPWQE37c0wokBM9Q/vJVVi0EmgBvvfQh2TzxRXNeAlqJrJbQtVHtbLZ+G6FiIbMuj6KlC1hxQkBs4iw7NSsHWSc9PTcOIytvxbeRP4XA7x/7vfZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZKJfcrWy; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZKJfcrWy"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7394945d37eso2150039b3a.3
        for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 04:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745062530; x=1745667330; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EqEfCzVm0s9gbAWdrawTqBLk3GajDKRamX+SOKwoyMA=;
        b=ZKJfcrWy3rkpMfLUIl476Hg5K3R4kgNxgF0tVUEinRjtU4A2ufm548BQCtul2ppPUR
         NfGBpDS32EFgmLKz9JFlPSNQ5IX8odxklTSr+vgrC0eHQqiNFIJpIfvkbZBDsoluH/Fz
         Cjen+ZO+47bmVuMjIz/yM4E+YvW21XR4FYved5gR7jZ/fD4HJqq39Ubq5zhLU7Nm1+AU
         II+qLPV78/hjU2DswHZCXiBW5XabDx6K+PMJ97KOxZm2WIAf2XEGv+m75b39cZnlwBcQ
         cbpB/MJKYaZ487FTQdNj8EDtHV6eh3ErnO3SAhRQJF493g5dYKkzLAMoFkGQy2fGdtWs
         wghg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745062530; x=1745667330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EqEfCzVm0s9gbAWdrawTqBLk3GajDKRamX+SOKwoyMA=;
        b=PfQ/mCwMudyGGIf8sSbM9FhCdZuT3frtnZWrQelVmvKjvhB6hcdRnCQ2bxJAMJzFra
         YY/lJnaah+4b0olSfGGQG1f+kZzDIOUMmKjYVNjgbtPtCq66FQTkD4sMQWJhQFziAmKH
         h9WNJBSGyPjPYDVvLLBvDXWcJ/i9E9KkjtSBhdQNDP8+DO8XAEHKGrIbe/11pU2OTA0t
         JCiTcPR9IJ5/hselKEB48iyAzE/KrXTIAhuTKF9lM3oiOo6zfEXYi+kpfg2xtl++dTfn
         CRCm4XNiiZ+LQZDMwZHyICfoLZLgaBt+jeHKdVytsU0uyOXWKnyv0/mgbu6cSqBsI4pN
         wesQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwm4RugsqUm3Wbaj4tzgHEHiXXBhtX6TCl+RZuirquXGUZoCwS+6KzE3Df4syEMJJ4YRoHMNv6g8UB6cU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzU09unfOa3bSQeBkXWm9nt/6JrGB3rdHYMs/ZolIdiuopUqHcE
	nMCCWkGMi/dQ6A2prKhz9x/C+bctPcPE/M93hJmVFU/Snz9hn2Zj9udp47mssg==
X-Gm-Gg: ASbGncv/+/8R9+OQDtluLZp/3IkEueB5wp+4X9bJiakOCdFVbdTUJHgHCaNHjgYBequ
	Gg4q/Sv6G6T5Tf8SoCeU06SiJ/H++KN+rcZF54CMI6oNlrboity87utsrNqWGPD6zyqfmtj4uKZ
	KNbJpf+IIUBuqqYeENfKXI5bnSbFBzJCXWRJofRFdmRhb/B2bz9/oo+JkdTqn+TIP15MZ0AY1lE
	OfDWZGcUabR3b5aDy6W/ousegaB28ihWFyTSrI9pIcOP7JDhsUJGzu2gKMQn6iDk5YyTb6vt9zB
	dYzDjzgCx1x7Y4nNwFHEQdSgp6+McgqDejcRvndBKdZccxUTT9V1eg==
X-Google-Smtp-Source: AGHT+IFKbXf8oiV98tgt3cEpHu3Ind6E5MOTHI2okQE5l7xhF/QuhKO27dk6PSwPkrsC8Rn2xyTTFw==
X-Received: by 2002:a05:6a20:d485:b0:1f0:e42e:fb1d with SMTP id adf61e73a8af0-203cbd4513fmr9527773637.36.1745062530611;
        Sat, 19 Apr 2025 04:35:30 -0700 (PDT)
Received: from thinkpad.. ([36.255.17.167])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b0db139eecdsm2705742a12.22.2025.04.19.04.35.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 04:35:30 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nitheesh Sekar <quic_nsekar@quicinc.com>,
	Varadarajan Narayanan <quic_varada@quicinc.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Praveenkumar I <quic_ipkumar@quicinc.com>,
	George Moussalem <george.moussalem@outlook.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	20250317100029.881286-1-quic_varada@quicinc.com,
	20250317100029.881286-2-quic_varada@quicinc.com,
	Sricharan Ramabadhran <quic_srichara@quicinc.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v7 3/6] dt-bindings: PCI: qcom: Add IPQ5018 SoC
Date: Sat, 19 Apr 2025 17:05:18 +0530
Message-ID: <174506248856.36993.6558804848056183191.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250326-ipq5018-pcie-v7-3-e1828fef06c9@outlook.com>
References: <20250326-ipq5018-pcie-v7-0-e1828fef06c9@outlook.com> <20250326-ipq5018-pcie-v7-3-e1828fef06c9@outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 26 Mar 2025 12:10:57 +0400, George Moussalem wrote:
> Add support for the PCIe controller on the Qualcomm
> IPQ5108 SoC to the bindings.
> 
> 

Applied, thanks!

[3/6] dt-bindings: PCI: qcom: Add IPQ5018 SoC
      commit: 5ae42cdeb1d23fc604fb6c8a23cff35a4a47b10e

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
