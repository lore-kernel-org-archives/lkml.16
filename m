Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6283717E
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 16:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745081684; cv=none; b=A3o+Eu4wTMWIwotCj1AsEdSVK6oYtvHCXSXBk9EXaIYo9oMjVJhKWj0jww2KzHBh8fuK/E3v0XinTsjVXxMvt9ljzeAG171ohX5jflvwnAVV/vcOvp9n9DYUMHn7pcgLKcSfY3cYBBqMifNpWdG4CirfrAaaV/9ZL3y2Qt5RrSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745081684; c=relaxed/simple;
	bh=gpFzt9a0/L009rwgmaXycDOg9jsGrSoOkzkXV3bFgNA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fVqmonTx5ZpYXz4CgJ4BIRJi8WxKBIh6/IpqCaqDf/gwcpfgSlOzVmeG+FOtAP+BuFADx1R+5vtXEO0uUmhfw1eFx+9O9RkqNDHO+z82jJY5NWBQ2g7Q3U1WFUrLKk99jMMpcuBlIIX0jhw8+zhJNkGxLxi48LGcnGE7wHqbnyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HAdYTFpU; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HAdYTFpU"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b0db0b6a677so1826437a12.2
        for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 09:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745081683; x=1745686483; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m93ArCqGj/VL7itXbB4s74bjvMX+c/h5RtG0prz3w/8=;
        b=HAdYTFpUx06hV+zq/NWZ1RxR6KkQD5OhmRYCljXlCbrnZUm6FD92rDUJBXaKRVkznQ
         jA6ng3gC8x94ii5uyLckqo27rfaqB5gd4WPnySTydxyHklN2rsCnIoAL7CRd9JeTXVNB
         P5mMLSgqvfNc9J1HLx1rWq2xcvUXjT1OAxgBtOJ7/5PSr3Xim0j7jOfV1dTCS6aI3uky
         ipi0tT33TKxwO4yJpKe3MIYuqtdQA9q3Os0SHy/uLEI/PHOrsnKSJ2eHej2IzQLswu3H
         asYc1i6QbyRjLqeWS8t7qb+o1Hwz/iNFoev1ScXGMD6mJXWCxvc/jbKZa6xOFYJBvv4K
         SQ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745081683; x=1745686483;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m93ArCqGj/VL7itXbB4s74bjvMX+c/h5RtG0prz3w/8=;
        b=BNdrANABOKZ6G8Vg486B/+lsvXGcE6xp4E65X5Na0ApYc5kPBzXXjpaltIiE/86HgC
         ikcHJTiaM5Sgpo4R1R5Agdr6i4HGhbpdOq8Nl/zXisVlLdDTw+oG+dmJDRrFnbxE/qKm
         stoQrCQNMX4BROHHNFeahZ+VNaWZvLaP8HwoowPJLu6Hf74MrBSfz9FJt04NI7p75eeg
         Ik49bdMXY+gt8vHCbajGpg3Ggf0o0Y94L8G0EEbPvoJ5VuUAPXDsHQ3o7YRFbBcAR2Zn
         8Lt+1qwzV98Hiep2+zZxa9qJHCU+TF8TWLHbW9jZllEYHeziR3rtA0B9isoLNkUCrTMM
         F8Zw==
X-Forwarded-Encrypted: i=1; AJvYcCWQLpFNiadIgKT9NDoepiecoN5qs0t7rGzSLmmQ3IYcM605/Z1fPafje1GwzpU7SszEStUDI3dx6+Tl5kQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7Fvg0+w4sQensVtHr9yzeHEYE/Hvinfe/vkKRbCwvasTvsg7A
	sbN+uFlXzJfhyg9TqAGpXTrrQ0n/Y1iDfpu+rHn/E0lQOYgtXC32uZDILmh3iQ==
X-Gm-Gg: ASbGnctbtHsyzgXIHpFt5/wjAG31xuhuaitRYvcrYayYy7M6DCGYxS9PRDSCiUPk/ND
	9OMUZFFjJ4libPSVBGFqyoCc5P8yEfx5W4y2G1fKthmSvj4zJaq4ADW+9J73uifINkCiKKzwHQQ
	3oABu6blDeEqGOAxRsbfN8XbbC+DC+PAk4gmCx4PvPNuRoYKwt16EROmenpFAFb/4e4zh0RclWF
	nyKKpDjjDPEvrPjmV7AiuDNH0SXhxXPm7ha2kcFq6r/Gss7NwyLc+4OGPZuXLHIdR9mQJgikOys
	4W+7W1SXv+rba61d2Vra+LVuVXOGtVgaDxrtj0Gu6oDfYE6Bcrx1fQ==
X-Google-Smtp-Source: AGHT+IHCBR39x7sDCmGPm0DAtebsJb1E3Rb4vSoppQGMXGzbrScjvVjdiiA/UY71hEB2ck6zvFVsPg==
X-Received: by 2002:a05:6a20:12d4:b0:1f5:6f95:2544 with SMTP id adf61e73a8af0-203cbcd5e44mr8909123637.33.1745081682802;
        Sat, 19 Apr 2025 09:54:42 -0700 (PDT)
Received: from thinkpad.. ([36.255.17.167])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbfa59cd6sm3480086b3a.86.2025.04.19.09.54.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 09:54:42 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: lpieralisi@kernel.org,
	Hans Zhang <18255117159@163.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	kw@linux.com,
	robh@kernel.org,
	bhelgaas@google.com,
	s-vadapalli@ti.com,
	thomas.richard@bootlin.com,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	rockswang7@gmail.com
Subject: Re: [PATCH v2] PCI: cadence: Fix runtime atomic count underflow.
Date: Sat, 19 Apr 2025 22:24:32 +0530
Message-ID: <174508165327.58233.7858938812683501667.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250419133058.162048-1-18255117159@163.com>
References: <20250419133058.162048-1-18255117159@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 19 Apr 2025 21:30:58 +0800, Hans Zhang wrote:
> If the call to pci_host_probe() in cdns_pcie_host_setup()
> fails, PM runtime count is decremented in the error path using
> pm_runtime_put_sync().But the runtime count is not incremented by this
> driver, but only by the callers (cdns_plat_pcie_probe/j721e_pcie_probe).
> And the callers also decrement theruntime PM count in their error path.
> So this leads to the below warning from the PM core:
> 
> [...]

Applied, thanks!

[1/1] PCI: cadence: Fix runtime atomic count underflow.
      commit: f8015b6a0db95ce09aaacb236746f33b7a540a3e

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
