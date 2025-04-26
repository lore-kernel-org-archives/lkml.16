Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0AE22BD04
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 16:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745685615; cv=none; b=oo9RnB3AYecPHr7Ilp+booufZvrDBXl58U4OGeeOy9gfk/HxOzB7of9y7p5/e3LAG7moi31EuWd474FiMzDM5WTe56054r2rIAqzNKIrWrnZmqtsM82lZiQKUnNppY1QEgNBWnN/mp0cVn9Vb+Xrl8EDVG97nCUpjui1n8dIeCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745685615; c=relaxed/simple;
	bh=wy+6QKzWQzOxQS5scLOiW/jejliu5GP0TiK4wLoJWyI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tZ5XjG4eKEReaUmw62T6oDs5J4JUZHdp45PSO3AVIQEC/2xSWykR9wvJb66Zb3Rihv1P9OAgwEHL7khksQ7+BNYQ2rwoTKaLvCyfJPlMyvo3XNDYXWLBtzbL1w7zNJDAf9Tx9IWNZpNVBFVScd5nrz3HKK7Rz0vDziN0vwzyht8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zsm8Xfwi; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zsm8Xfwi"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-736c3e7b390so3559031b3a.2
        for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 09:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745685613; x=1746290413; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=G1dxk80zPIpL1q4PhQ4ndWv9Mj5fqZbTdnW5ZkYRDcU=;
        b=zsm8Xfwiz3e3STpvFeJrFwLoqRastVmc1jelVfHaKCSP053YiTMcF/eQBdy5NhbJS3
         m2U/d5jm8MvdQvKWqQKbouxL7kimYtD7B4f6GIBztIa4bHpavjrKFU9+dR/FcpZmJVwV
         Mxv7i3IBS5Re95dj0ZQWxTim9daR6u7H+YkJ1jr4BehOSXzh2mZrCf1xwX1vYISt91aH
         9tXBZdbBh8lNOBbSxIiao6dri2rN/AO4MwYXDWPIeD9iFwIJdKjJ8vaefRpR5OJciXOt
         09GOGjVIHlgwkhk9M5nZNZLhb/CEFzyVoumCywLMFXGEaP+uSK+ZPv1bP7SaGrRSGL/x
         +5Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745685613; x=1746290413;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G1dxk80zPIpL1q4PhQ4ndWv9Mj5fqZbTdnW5ZkYRDcU=;
        b=bwTb+h5hal6rgsWLdLlpwGGQl6DkjgwzpGfxDkRhFdHu2+l4JQ3YwKvVnhX2EA3/IV
         /HTKmwRdZaSZisJEhePnuNcDSCKDF8SszVIcZlkFPLH1JxYGh8H3RSCaNY7D5KVffTBZ
         GSC+9hif0CL2P6tBhsFj67QF96nvzzXL/QjFRSKCbDZo2mZVzQfhcZzW7P6fLW+JqcIh
         Nl+ppebPJBrQO4RcurzbMifzpFiDOvtP9Uh3xO/QmRFW6+2lhhwF8Sp+dBSrnU+vnVon
         RwhqZaAOnZtsTFhtA5ilncqZQETJN9dRczGVayo8+tZHaiUEAmI9cgN1USHaUekXbO3p
         ynCA==
X-Forwarded-Encrypted: i=1; AJvYcCVPwLlSdd6k8zkJWeby0855WwSDPITPFsFs/Wfu/n95z2EU3MvNaKBFJ8EdQi1gyljVgrNqaQ+jfku+0zM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLPNXIddVp1rEr8XoIJlPFsD+wgd1Z0K8mOI+URq2Z+s5QwXA7
	2xO1IkTPVys2AkzVL0DgvjKKOyG9Lu1Jd6FTR8CCJtxjXlalyrvbMJknUQJK5g==
X-Gm-Gg: ASbGnct0j3Ku3AS5bCXONCvWg7/3fGKGxTtD5hm8ZX1ZYnvcTe3hVYU0kWzxKpw7zU8
	gWPgFoWCNu2ulpOv8ImdosHegNbP9NBCX2AVy7oSX4gxpz0ppL5aRJu+MmptPcFrySTam7wD9g/
	kSrecfSrN+QYZN+Qr9koBoxv5HP2CNto5mBm4AO3axDQk21VFprYz+51m7xaBupurwz1zg5DMfe
	vn9Rp1FVnYjyGj0DtrETDpJ7Jfs0OLD9rQ6nBb5+V1NW7reojtQ2TBr07Pic89KXixMbeWmP+m0
	l/kziReQImx09kVZoRmx83RdPFvK10FQWxd32mgocl0wt9NK5EqU
X-Google-Smtp-Source: AGHT+IEwFTn2KnzLPGidnDgvRdMd237ilzSbG/yZ5gr9RWrr3uHMD0GXUKLpE0ghRpRy4DDG51PaGQ==
X-Received: by 2002:a05:6a00:c85:b0:73e:30e0:8a2a with SMTP id d2e1a72fcca58-73fd896a123mr7017507b3a.17.1745685612904;
        Sat, 26 Apr 2025 09:40:12 -0700 (PDT)
Received: from thinkpad ([120.60.143.241])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25941bbbsm5216582b3a.65.2025.04.26.09.40.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Apr 2025 09:40:12 -0700 (PDT)
Date: Sat, 26 Apr 2025 22:10:07 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Hans Zhang <18255117159@163.com>
Cc: lpieralisi@kernel.org, kw@linux.com, bhelgaas@google.com, 
	heiko@sntech.de, robh@kernel.org, jingoohan1@gmail.com, shawn.lin@rock-chips.com, 
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v3 0/3] PCI: dw-rockchip: Reorganize register and
 bitfield definitions
Message-ID: <b6loj46o6txf3g7xrcjbewcz6kph7wh3lg732k4nfp72pfbnms@hsxzofycadgl>
References: <20250423153214.16405-1-18255117159@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250423153214.16405-1-18255117159@163.com>

On Wed, Apr 23, 2025 at 11:32:11PM +0800, Hans Zhang wrote:
> 1. PCI: dw-rockchip: Remove unused PCIE_CLIENT_GENERAL_DEBUG
> 2. PCI: dw-rockchip: Reorganize register and bitfield definitions
> 3. PCI: dw-rockchip: Unify link status checks with FIELD_GET
> 

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
> Changes for v3:
> - Delete the redundant Spaces in the comments of patch 2/3.
> 
> Changes for v2:
> - Add register annotations to enhance readability.
> - Use macro definitions instead of magic numbers.
> 
> https://patchwork.kernel.org/project/linux-pci/patch/20250416151926.140202-1-18255117159@163.com/
> 
> Bjorn Helgaas:
> These would be material for a separate patch:
> 
> - The #defines for register offsets and bits are kind of a mess,
>   e.g., PCIE_SMLH_LINKUP, PCIE_RDLH_LINKUP, PCIE_LINKUP,
>   PCIE_L0S_ENTRY, and PCIE_LTSSM_STATUS_MASK are in
>   PCIE_CLIENT_LTSSM_STATUS, but you couldn't tell that from the
>   names, and they're not even defined together.
> 
> - Same for PCIE_RDLH_LINK_UP_CHGED, PCIE_LINK_REQ_RST_NOT_INT,
>   PCIE_RDLH_LINK_UP_CHGED, which are in PCIE_CLIENT_INTR_STATUS_MISC.
> 
> - PCIE_LTSSM_ENABLE_ENHANCE is apparently in PCIE_CLIENT_HOT_RESET_CTRL?
>   Sure wouldn't guess that from the names or the order of #defines.
> 
> - PCIE_CLIENT_GENERAL_DEBUG isn't used at all.
> 
> - Submissions based on the following v5 patches:
> https://patchwork.kernel.org/project/linux-pci/patch/1744850111-236269-1-git-send-email-shawn.lin@rock-chips.com/
> https://patchwork.kernel.org/project/linux-pci/patch/1744850111-236269-2-git-send-email-shawn.lin@rock-chips.com/
> https://patchwork.kernel.org/project/linux-pci/patch/1744850111-236269-3-git-send-email-shawn.lin@rock-chips.com/
> https://patchwork.kernel.org/project/linux-pci/patch/1744940759-23823-1-git-send-email-shawn.lin@rock-chips.com/
> ---
> 
> Hans Zhang (3):
>   PCI: dw-rockchip: Remove unused PCIE_CLIENT_GENERAL_DEBUG
>   PCI: dw-rockchip: Reorganize register and bitfield definitions
>   PCI: dw-rockchip: Unify link status checks with FIELD_GET
> 
>  drivers/pci/controller/dwc/pcie-dw-rockchip.c | 87 +++++++++++--------
>  1 file changed, 50 insertions(+), 37 deletions(-)
> 
> 
> base-commit: 9d7a0577c9db35c4cc52db90bc415ea248446472
> prerequisite-patch-id: 5d9f110f238212cde763b841f1337d0045d93f5b
> prerequisite-patch-id: b63975b89227a41b9b6d701c9130ee342848c8b6
> prerequisite-patch-id: 46f02da0db4737b46cd06cd0d25ba69b8d789f90
> prerequisite-patch-id: d06e25de3658b73ad85d148728ed3948bfcec731
> -- 
> 2.25.1
> 

-- 
மணிவண்ணன் சதாசிவம்
