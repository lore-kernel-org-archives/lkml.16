Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D5E4275113
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 06:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744698055; cv=none; b=IXSphRcW/6g9y82BZ/rVSOLsGC3u3etoexbjAFeDqY+pD/T64FuEdUGy9/P4n7qtA63EoOZm+m/xZ+NIZxvV/Sy9TcTU9qFF4RC60Gr/hTSXVQtnfCDv/WMP7Rb4c6+uyUiPoF9HXGsY6AHHVafZEbAWO6i/IMzNP/mgaBPfM/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744698055; c=relaxed/simple;
	bh=15dopjAkrKSs5ScMZ+NYEAva1LfA/eDSoY1MTLaL05k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=hAoGwViRJfYercP3ijLbe07VxDFVKbdQwXHW0kZt4GopNhcGBUF3+IfbQ9jqqUdGJwoH96AXG43X20yOQaTwn630hCbVMCHI6el41CXjv8mjeYVdElSjeRAvV6HTN/CUIOmf4pAEnYA1PwV8ZhINMF4xSqSV4x5+gxU45rlkeYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ruAXXydm; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ruAXXydm"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ac3f58b9156so60832866b.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 23:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744698051; x=1745302851; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oTt43XJFM8d74lWj5+YE+mCHEBEmob8rG+QikYcC3hM=;
        b=ruAXXydm1sbUdzoNjfuMCVIW3f+dEsw8LlyrOvQa4cPID51dafQZydGvALUad5Age5
         ZGo41Y1PJlqF6WP2vfTg9i1TNYVbz+IYupBwBPBFvvZBRukIQ39C9PfV3Q2G0QIWt1NL
         fO+OCumBDINY8fqGmMFLSLnHrMPs4+zNUXHslswMYyFcOGJA1XQx6FXTpiUIpiAvAd0n
         y3kGE5o28YCdlUsUj9k8kcIb660gY8P6+O/yHEjq/laqpK3JF/6v7IQeOkOIuE+XShYn
         ejI/HsLzFH0j8TGHuL9miRtQ6kHWKaMh6kIZnSDkHvY96KYHEqSmoN7DjpuX46g5DqjG
         jp5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744698051; x=1745302851;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oTt43XJFM8d74lWj5+YE+mCHEBEmob8rG+QikYcC3hM=;
        b=a/fGsK48i1tzgK2uhjS1yK7+oFP4hRx5n+p2P/oBptn01sCSx0OV1p12NwoBWSFCs5
         CZRKG1claGQUmvamuuzwOvympbprswDqAegqxJ7Lgy3L+I0rgGX4ur3ayHha3L3EL4Al
         vpHCScw8mGSKKphwCoeSozbV48u+TRECdOSK6G1dCFf2qDTx3fIseglrcfdDER81XJbl
         JZcKd8Cd79trUp+4aeXxtjuPS8dydo5pLtTsAyEbGjRBSan8WvWXbN8Pv6lw+S4+ONVA
         9c6GwGYU/IWyYc/8Xtp5bVaWroFd7hxyZ3OeeHm0FGkqEaZJCkjEgN0YupPOAy4tQoS4
         RyfQ==
X-Forwarded-Encrypted: i=1; AJvYcCXh0YrwJWcizSZvRBNL+FL65H+HxzQS/sUejiJW/XoEJSH1Ug4HA22HTVs/0x+yFrMHr3UADQwuu7eDjAY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHb+T6dI4pb0hq5DQpClFD47bSkJKTZjQ1/23mamg6/sm11sYk
	OB7V5gWuJ0CbLMc0udtAiYLw5GZHO7ABlTqXSomIGzGNQMO2LpuL/2fsJG40h1o=
X-Gm-Gg: ASbGncsgDqbzQKDzYIUDDhFU7VhCGcZ2rudV3KUolyTwfPjZuCfwdQIXj96R5Vi8XmF
	Bc8M9e23MNh5BMu/ns4Kqg6EFdEwAsXDCwzf3yYEeLDidFWnhFgxUIQC5OisLr2E9ywUrWXca+3
	EwiMWjdmzjQ/BnlE30r4YN8LUnrMMFwvn4gPk0YGRXR9owHL9/Y0p+/oJ3JMiVNi8PsV/A9oJR+
	lLQU5VycRe46fmhwrKly8w5477ns758gWcFUrdT3pgcDm0WHrGGZoTwDoHRfrf5Ru1A11FBzFJ0
	VXmd8IlfWbiea07SC9NZponig5Md9wF6gRT7hpdF9dt0ELLpLsq2EteOAlKQ8X+xMtulCZsHTkC
	BRfchsEStF0RUZBw=
X-Google-Smtp-Source: AGHT+IEN0ddkfxeUgfcu3uOUBPG5D5WB3HL16m1L/qkNsUmiRD8iOuxqK/rPwSxrQiytFN9HNB8I7Q==
X-Received: by 2002:a17:907:bc87:b0:ac0:b71e:44e0 with SMTP id a640c23a62f3a-acad34d87admr480746866b.9.1744698051564;
        Mon, 14 Apr 2025 23:20:51 -0700 (PDT)
Received: from [192.168.1.26] (46.150.74.144.lvv.nat.volia.net. [46.150.74.144])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1cb4129sm1053861866b.98.2025.04.14.23.20.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 23:20:51 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: yong.wu@mediatek.com, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: krzk@kernel.org, robh@kernel.org, conor+dt@kernel.org, 
 matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com
In-Reply-To: <20250410143958.475846-1-angelogioacchino.delregno@collabora.com>
References: <20250410143958.475846-1-angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v1 0/2] MediaTek Dimensity 1200 - Add SMI support
Message-Id: <174469805024.15476.6855555365246052771.b4-ty@linaro.org>
Date: Tue, 15 Apr 2025 08:20:50 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Thu, 10 Apr 2025 16:39:56 +0200, AngeloGioacchino Del Regno wrote:
> In preparation for adding basic support for the OnePlus Nord 2 5G
> DN2103 smartphone, this series adds support for the Smart Multimedia
> Interface and Local Arbiters of the MediaTek Dimensity 1200 (MT6893) SoC.
> 
> AngeloGioacchino Del Regno (2):
>   dt-bindings: memory: mtk-smi: Add support for MT6893
>   memory: mtk-smi: Add support for Dimensity 1200 MT6893 SMI
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: memory: mtk-smi: Add support for MT6893
      https://git.kernel.org/krzk/linux-mem-ctrl/c/98a4109320f9b7007475a9d6706d3434cd8aafb4
[2/2] memory: mtk-smi: Add support for Dimensity 1200 MT6893 SMI
      https://git.kernel.org/krzk/linux-mem-ctrl/c/bd4f5f6c84d074d9347b55731891729f136d35c8

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

