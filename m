Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB91163
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 16:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747240351; cv=none; b=hU+xLG7SXcSqkgSiTzuo+flGxnu2NdjvNKpv7yU3pF/TvbkZWm1spxCwbViEUs/3Ukv7w3aNbRLTAWgoMaI0zYNOVx322MXM11Ycr4eFL+/rYyi5BKaUEgOLXfoTqDJT4zZu9Y4Z7JyXrWoBOKm2kSMMi8s9XmosF1Tx0TxLk8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747240351; c=relaxed/simple;
	bh=1N3x/GOevNWDg5nrpVSNIB9tY1j6A1Mn0q58cHpD7mc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I0/6jBe7F30erhuQGz/t0sBSVEaO03jdT+xNIXVydUMW1+WgnTM4i8nrM9DYJH6Ps5sQgX+P4wsmSPrYI9x/ZvaXRf3ADve/O06kWfuTsJjq8S3KaI/3ylBQN9jvhbQwPEUsuU7C+Actego1nSSLR/oA++OjeSOTovPNGju+xhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rqhde4ps; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rqhde4ps"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a20257c815so4061379f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 09:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747240348; x=1747845148; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fnmo2+MZcpJ2cvX+WFzBsbU3N8d4JXlGi4Htr9EmUTs=;
        b=rqhde4psltSUx2l8eaFvCu2ZVjXeYPey8dGdXcQdBicQpeJe0yu+45FcLdYAY7Pm9H
         3CVpRola86z0/ipJ/5U/udmaIV5/77PzJF0mayxBNyfRkdM+MpOq+oRwFAGcmhNXl0Ee
         Yu+5h1RwYmbA2qOH611lBXLYO9/4eF5hT6OqGR9fWNo3DF3hFHvXpecrUepqWFxy8XJg
         HAgR+HHR9K6exqel9eaSRtyYAXImzz1PHY+9r/pXf5RMF+zls4xj5tUbP+wxCF6mPokn
         FumGX/CWW0dttd/PxMr3J7hxKCN1w3eeSdRWLLfFFUROgs6CbUHcj8Hm059VsUlSwo/Z
         aK1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747240348; x=1747845148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fnmo2+MZcpJ2cvX+WFzBsbU3N8d4JXlGi4Htr9EmUTs=;
        b=oXJgViEze57jOZekjhtVr1n3rdcf4Ae8KDV8h9exI8O113r7UVVk1lgOu8aYBopXB1
         CgOu4j8T/3GIsJNhFRCsrdjj9iInpvzb7NdRAgQhF1Dh/vFox0I172Yvb5H2rdqSI/ja
         Kyj5h/zVnqgEl7RuZ/hDGWM4067VhaUqxwVSL2HAglj874fP355AMk1ov6z2/LopGkhA
         Pyykg0pzPAKfhLLDpjFQlFVPTWhKgQ3c/NerNzIhXY07c/9I7gu/9PpOEzEhoK+bM2YT
         SrpnrSzylTVsdPemLGeLLY4GueRrwh/odtWbdnTAVnP/BfEqxS2qQ6U7nu0akOsw3H/a
         Z8uA==
X-Forwarded-Encrypted: i=1; AJvYcCW5mbRypYRYKlCFZ2QOyL5FZLkesQIpZwdBJ4/lGYDrJCqmLRsjH5Puagk9HcngclH8VD7S/z2JgY6aHQs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxysRMTX11Myy6OYJS70gES5CSoA84PTjDkBmtaTFmhILhtlQo
	cRpetjMZ2nvicg3Tb3phqmG5HC088UcA072w2EeaZVKKW2gqj3i9CKXxMDkYmw==
X-Gm-Gg: ASbGnctSnEu9KnbOnLl7UcSM07gCo5WqnUTfmbJvF1c2tXYWb8pQ5rlwt/hk0GSqLhB
	QIAjr2wzMYn1jAvy25ixsw3nWIzMWbQXaebND83mRdkAnJGHYmhdUTQwSbriLfHcqKFdGFJ9GXU
	HmzyqeMjEgad1vdIt3NfT1lJbdzHSJkdNpPMV031tkZE2l++nL5tLzDg7pdpK/KWJCBD5aimxkI
	t/IMTFOGkRLvGRoz8j02bu84niJlW6TmEoZj9z+VLS3eEH6MKd1/Oi0sGfcUc+3QJtq/r799aOa
	PUGGM/zAtfs8psU8IpccJ/UOmxYNDnJkPvPPNCulD1QfVmhQBfcMjAJSnjtFpECYEua3x69kpty
	RlqA5l3IhG8BRd/Hw4HE4a7k4SmyaVT+RjTgPDyNxKtb6
X-Google-Smtp-Source: AGHT+IFn3vXnS6jxMSTKpvWwf0YAtvDrlGdswD18OpUum5KMQooxsvMQxaV39lTehJR9+Ij2bnRE1g==
X-Received: by 2002:a05:6000:4205:b0:3a0:a0d1:1131 with SMTP id ffacd0b85a97d-3a3496900a9mr3428305f8f.7.1747240348003;
        Wed, 14 May 2025 09:32:28 -0700 (PDT)
Received: from thinkpad.c.hoisthospitality.com (112.8.30.213.rev.vodafone.pt. [213.30.8.112])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442eb8c92d9sm37650875e9.2.2025.05.14.09.32.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 09:32:27 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>,
	Zhou Wang <wangzhou1@hisilicon.com>,
	Will Deacon <will@kernel.org>,
	Robert Richter <rric@kernel.org>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Marc Zyngier <maz@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: dingwei@marvell.com,
	cassel@kernel.org,
	Lukas Wunner <lukas@wunner.de>,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 0/5] PCI: Add support for resetting the slots in a platform specific way
Date: Wed, 14 May 2025 17:32:23 +0100
Message-ID: <174724032611.26337.10095399338390897616.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250508-pcie-reset-slot-v4-0-7050093e2b50@linaro.org>
References: <20250508-pcie-reset-slot-v4-0-7050093e2b50@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 08 May 2025 12:40:29 +0530, Manivannan Sadhasivam wrote:
> Currently, in the event of AER/DPC, PCI core will try to reset the slot and its
> subordinate devices by invoking bridge control reset and FLR. But in some
> cases like AER Fatal error, it might be necessary to reset the slots using the
> PCI host bridge drivers in a platform specific way (as indicated by the TODO in
> the pcie_do_recovery() function in drivers/pci/pcie/err.c). Otherwise, the PCI
> link won't be recovered successfully.
> 
> [...]

Applied, thanks!

[1/5] PCI/ERR: Remove misleading TODO regarding kernel panic
      commit: 0b56264b66b695aa76115ae68c1365dff80814e0
[2/5] PCI/ERR: Add support for resetting the slots in a platform specific way
      commit: e2889025d83fb38faac80d976f1789af3320ecb2
[3/5] PCI: host-common: Make the driver as a common library for host controller drivers
      commit: a811ffd43754dfcaccff497de1d8ee0bd30f8f2f
[4/5] PCI: host-common: Add link down handling for host bridges
      commit: f24509b96c33c1bdd9cc57bc4f8a58391e846c8c
[5/5] PCI: qcom: Add support for resetting the slot due to link down event
      commit: 40eba89968afc15302fa5aaef207fd9ccaf1ecb2

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
