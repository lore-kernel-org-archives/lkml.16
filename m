Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF43124BBEF
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 11:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745752248; cv=none; b=R14gXsIuLezmJr0hFYeqF7AClSXin1GtzB9hV+cHopsga2ZaIlz0rdG7VbU4inlD3qdJRS44eMMpAmZlX2Zvo6TIHOEWfXa465VdPZm9JVo1BU7ZWlPxOmD14mRu4JNxirKG/+MSoF1+FxfCDl1LpUmliK94imLrhMa0PQZEwvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745752248; c=relaxed/simple;
	bh=ZyrwLP9XEIiDz1z8JytEuEmEd+Zga84Fim/mBFMVhKU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WA1NExewWDA76AaaSYWHbBNuREY2nAvojNQ0sFAX1Zcy9jrUm7qnypoTPm7JsBPrmQRGL3Ktmdp07cSXMpW3MUlA86mtvWax5V3MQ0cUw54kavwpokoeIaos9gR3IAlFPWtIZEXNPTH7sL/YhJdzLaoMbt++MJD1b8hm9Chp4X4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E2OhU7Qh; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E2OhU7Qh"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2254e0b4b79so58086625ad.2
        for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 04:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745752246; x=1746357046; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BCW3fClu8hd3i15UY5+BkYv0EoS+YjFdR94yHfWo7NI=;
        b=E2OhU7QhsyUfvTaE+st4BY0s6ipnPG0LBkS9v9iFBjEJn8qlBUD7R8dLO+CFprpIbJ
         unMHVtWS5e6JvwY4PVrsR2pMBN0nRC8w0jeurSXNp4SDmwE2uP8RudUg9Pgohx4eJlpb
         CBGCGtxquUw4XXpLhI/aWiJwa0IPdcl5vA+g+WpdRrFZvqZaNdIBfHMv+xQeuft1dmKy
         jxTpHABjh/wlM2kmzV5FOgjPH51ZEtAS/CfLzcP6tyLdZgcI3VzDH9Gfuv6ubKZa/9ba
         SwKrT4OyiAma7IHn4n0Iqbq3sXDnxszcH1HHJe+VTiJermghiOsWiHhdz2n6HlPgj7ev
         +9+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745752246; x=1746357046;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BCW3fClu8hd3i15UY5+BkYv0EoS+YjFdR94yHfWo7NI=;
        b=uGFySBTCh+2d/OvyXYKmL3dLRZ5Rk4K8m04himuEwMutq3GAnAE7IHs1vJRzcVAClY
         COMxS/Y4NBs9grq4nu8qAG0jx2p7PlnkAbAhaGPHjrB0J5DbPf6CAwoOeQcL5ksSAg0n
         JJ+CocD+wB/N1+Lj+SRetz1G64dmpsv9KkaqU8fIOX8M97RkFgDuSkpvx1QKGtyreOh2
         WNOstcQJxWF4ZVj9kgnwFXkhkLIcAa6Dh8Vh6V/WZEywS6D7N2UIX6NyjxJyZxNoTw4N
         I/ry4PoOt8RgGJWKd5kBgbUraeeg0Yf414ynQd45+YXJIdPe2tW0TWBWJ/FhIATjQwkn
         q3cA==
X-Forwarded-Encrypted: i=1; AJvYcCVsxh4fIVI8WLX6woL98L7GEjCS89OVW6c/lCaYlwH4TUtitzJCI6+/9we9SAVOUiUMkuogdl9qTsHZ4e0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyANTxTZWXrxGHYwuiU8jXxVozLoMGsAD6nVQo3BMGzmBHR0KYO
	WxG8dcfuXGp4vcBvV2CnQ+mPh6ltTcncEV5SH+pq2qWzcNb3bzpSHJy7OqZFqw==
X-Gm-Gg: ASbGncvVw7xcsRyBWGVm1BSGgmMvglREXkLog0oclBzXFKO9FycwIJilwobIShnJN14
	VgCAvDWmyxeypCxBEDQueJRkcUdE/7isGUD9+zSiNCfcseJkL7SWDQMPVWri0Z0NR+tiKNZHNaO
	GIBjFZfxSsBL0MWV463WCl4FrF8AmVc+Ia4kFLgKi1KjYAqSrHpv0G/BmOGPUQdFFBQ6TRyNOv+
	5lm4SDGrbTwcylxbnrXVXDVMl0sc34UebzpG87YbhAjE7MN2mMEo5Y23C6OzI2Ep473B3VHxMqk
	IePHoGkQQL0VnqU4sXwgr8Fl2o44LcFA5mHoJWHlBoD0kCXYwIQH
X-Google-Smtp-Source: AGHT+IESxIRh9ywcqSB83gIp43lT9P2vpMm3xBJxMCs41iZKziBWs0161UNH7ZZMchhUoZ94nY/2tw==
X-Received: by 2002:a17:903:1b23:b0:220:e5be:29c7 with SMTP id d9443c01a7336-22dbf63a2c2mr132522725ad.39.1745752245995;
        Sun, 27 Apr 2025 04:10:45 -0700 (PDT)
Received: from thinkpad ([120.60.143.241])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4d74c93sm62360595ad.11.2025.04.27.04.10.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 04:10:45 -0700 (PDT)
Date: Sun, 27 Apr 2025 16:40:36 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Hans Zhang <18255117159@163.com>
Cc: lpieralisi@kernel.org, kw@linux.com, bhelgaas@google.com, 
	heiko@sntech.de, robh@kernel.org, jingoohan1@gmail.com, shawn.lin@rock-chips.com, 
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v3 0/3] PCI: dw-rockchip: Reorganize register and
 bitfield definitions
Message-ID: <yhcnrmmmphqz2egrws5sxobysf6ntnd7xxl5vuzo34y5aunbj5@pe7i352kgdm7>
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

Because of *this* dependency, I couldn't apply this series. I'd suggest to
respin this series avoiding the above mentioned patch and just rebase on top of
controller/dw-rockchip branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git/log/?h=controller/dw-rockchip

- Mani

-- 
மணிவண்ணன் சதாசிவம்
