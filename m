Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C68802522B4
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 11:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745755060; cv=none; b=h3V1QdSVRMyzWTDlz0LFh7jHLpa8NBLMr/hveQ9L8C1YzA0KlIboeszkeywIaeCRSfqysGVIOwY7pjnjahHKsVbY48ffbbiYJi8uCxapKYc44XZVgK+bnlaOlqQ92Qc2fsm5wI3Oi3csv2mQ/8tS2nKoku/5oQeWYj+f/lR4/2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745755060; c=relaxed/simple;
	bh=PBjPcyuMpEZLQB0/vy9bfQ0v8f/kjSCCYbtmIsssx3U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P/+n6TbDyjckNm6Yq6Ro8wTpjps0ENfJ6lj5Zw7PLl5hCIWvhJB8kaJszLqkeiORIYRqWAhaqE5B6/rVLVdcTP4caVt/3I9ILhiBz8R45/rzepR6NmSSCtm3oKwtsnSmaScApgkFSchMJ0VDRQzlaOE+/4cl9/oxK9MSs+cgHJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jd4oxdYl; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jd4oxdYl"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-224100e9a5cso45041145ad.2
        for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 04:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745755058; x=1746359858; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8RUGcbbLGFA1723YUU8ZP07EgO2qAswkxsFY9VKy3CQ=;
        b=jd4oxdYl7a3NsbJR/n601htvltqlVFMHsf1khc22SANgvMJh8j2exWQ8ae0qOAFFIl
         1U9BRsmRjkyVdi6upAgIROnSo6uQ42/Ji5OW4F23kRmwl2iCzGfqgXAF1Jlm9RjgKsbk
         y0HxAI/cR7AeNNL14bSyDbnxEZrsyHW2/BLGXPxACsDmRb9RBX4/xWJWgG1zWMSoREQf
         t25BBI8L4RuEi3mBX8TzrdPLSqo2AZOi/jHNtZGXdVnmrwEjUfo3s9CkTpQoor1bdx1p
         oP1BaA5VOGId6zPlwFhfE/xBpZWVZM8o5f5mvNsAWoO4uc93jD9i+CbwjAS7zKoq9BZV
         b0QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745755058; x=1746359858;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8RUGcbbLGFA1723YUU8ZP07EgO2qAswkxsFY9VKy3CQ=;
        b=e9zqMOk8d1yRlrhj+ADHMgtU42PzlscA7VKNd2aMDbQZ4eqrOm5FbjET3JyFJkVoed
         aqmTtqoHyl+obIzaDaamDV3yG+gR62vWSJ/oSu8fILGDDvGNI51VXx2wlpt4i6igaRzX
         7d1PBsgZqQwNeuc0C+jwpYiQhebTKLKXduV+djutoAFI7qAMPlB0yValKCmQ86ilsqN1
         01oJtfBB7lqW8jRv52p9mr3FkoYs0Wp2HgsDPjfGV17GGUz9+tH9B6QcGis2XcOCrJtk
         3SCpzTZHgEZBkZAIN1PhJsymyB+N4BpWJKR/aWTsmhkn9jDjnt08Hp5ke0g4geqbI4pE
         cW2A==
X-Forwarded-Encrypted: i=1; AJvYcCXL6D3blRLFhGc/GbWt2hyn+eJHMTpG9ZAGHgnfsr5zbJ3h6n9UIx9bAdph2cYW/tvQPndogZjPyT7B4L4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxvk8nLwul/UusWWQRwsInvVb6sO+BiLhr9p7GtIa+p0E3tVhKM
	tPDU6i1wummzSFuqlAe4VMCjdZ92PzGuoeG4eqqhB4759MoMV1rBlgSUsOJofg==
X-Gm-Gg: ASbGncuUCMgNp3MnSFPV15m2AgepV5fcwRr/ZRz2HRPYwud5+s8mMD7EHremggV9Ijz
	0Wvkv0oayOSzLu14AXTJ4jk0RsjdLmARvmynR7W93MQh7Y4QBaNqy8D9/kmGWNf17r9neJPOiFi
	LLDAlKAyQUgMOf2Ymm7jz9ilGlix0pyk+AafX011NYJmMFncP5O10sDAEp+WEVzHZkgevwhqVtE
	4vPD+nOW1M77Na8vj3iYj92cTM102otseMPVuM8YM7tRYxFNl8OsbnOZvr5NheFoGPK7YS8EzzI
	GYcPKdgoZdc/mZrwRaR17+KEWRhG6McmjtN7z8Z4YIBrzrwU5ukpvNo=
X-Google-Smtp-Source: AGHT+IF5v/6Ko/fvCwFf4ZE0KXGbwqh1gFSaF2rE1KE1z2Bwiq95JPxzfmr1/BPwNIqto7+dgvX58A==
X-Received: by 2002:a17:902:da8e:b0:225:b718:4dff with SMTP id d9443c01a7336-22dbf7487ffmr128283355ad.53.1745755057990;
        Sun, 27 Apr 2025 04:57:37 -0700 (PDT)
Received: from thinkpad.. ([120.60.143.241])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5103259sm62956035ad.185.2025.04.27.04.57.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 04:57:37 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: frank.li@nxp.com,
	l.stach@pengutronix.de,
	lpieralisi@kernel.org,
	kw@linux.com,
	robh@kernel.org,
	bhelgaas@google.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	Richard Zhu <hongxing.zhu@nxp.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v6 0/7] Add some enhancements for i.MX95 PCIe
Date: Sun, 27 Apr 2025 17:27:28 +0530
Message-ID: <174575498081.15979.12453799870165824890.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250416081314.3929794-1-hongxing.zhu@nxp.com>
References: <20250416081314.3929794-1-hongxing.zhu@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 16 Apr 2025 16:13:07 +0800, Richard Zhu wrote:
> Add some enhancements for i.MX95 PCIe.
> - Refine the link procedure to speed up link training.
> - Add two ERRATA SW workarounds.
> - To align PHY's power on sequency, add COLD reset.
> - Add PLL clock lock check.
> - Save/retore the LUT table in supend/resume callbacks.
> - 3/7 relies on "arm64: dts: imx95: Correct the range of PCIe app-reg region"
>   https://lore.kernel.org/imx/20250314060104.390065-1-hongxing.zhu@nxp.com/
> 
> [...]

Applied, thanks!

[1/7] PCI: imx6: Start link directly when workaround is not required
      commit: 9c03e30e3ade32136fed5a4ab7872dcb205687d3
[2/7] PCI: imx6: Skip one dw_pcie_wait_for_link() in workaround link training
      commit: 4a4be0c088e3029a482ef8ac98bb2acb94af960e
[3/7] PCI: imx6: Toggle the cold reset for i.MX95 PCIe
      commit: 47f54a902dcd3b756e8e761f2c4c742af57dfff0
[4/7] PCI: imx6: Workaround i.MX95 PCIe may not exit L23 ready
      commit: ce0c43e855c7f652b6351110aaaabf9b521debd7
[5/7] PCI: imx6: Let i.MX95 PCIe compliance with 8GT/s Receiver Impedance ECN
      commit: 744a1c20ce933dcaca0f161fe7da115902a2f343
[6/7] PCI: imx6: Add PLL clock lock check for i.MX95 PCIe
      commit: 047e8b6b3bc3e6b25bfa12896a39d9fb82b591be
[7/7] PCI: imx6: Save and restore the LUT setting for i.MX95 PCIe
      commit: e4d66131caaf18d7c3c69914513f4be0519ddaaf

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
