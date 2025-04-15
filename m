Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F37E274655
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 06:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744698054; cv=none; b=M4vQ8B+Aag0RDGRjTovvMjTuSRnG6lhiw4Spw1yj6dNF827UwQYouoIdRtnO+Qt626StgivtMiH7DWPTFZNSVoLY7xjScjD2rnf7ipkqTBlkd5N1nv45Z3J7UIs7baVZJg/27r9z52REcWHhpyd13OVA8oRUAWCo6+iYDkeglCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744698054; c=relaxed/simple;
	bh=Yr8/CO/5lrD/MrKdDsIWubVaHw/mUFm3djrhZkdFkhg=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=nc3b8Ud9800V4C1FSQlZW8E/GveQIW6IOR5HGi1S6MD5KnuXZHKogvEMcUdYBiDid0T7J4hNgFZ1y73Q1pzvPoRkT8C8O1MtdURc6Q7b5XI2zmK3h6aXAPyPqdyLk0j3e/ieaaKPV7aDp63jhKBFfXsatV8bBQrDSk+PoC3D2AQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nUylUHYO; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nUylUHYO"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5e83e38d15dso668989a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 23:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744698050; x=1745302850; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GkzlycTSWhUYmFh6lSEJKN483G6fww5F4wymxCLohK4=;
        b=nUylUHYOqRFXiju35blyGm79sBUV3UKbBApKtS26AVPiPyk6x1/qEWVFJ6jVjY/e+z
         zanrRKdES9zeBDrQ7Y448LE6sY6cRFM3lJUy8dovnWh7at/N2wwMd+bdvVehs/7ESqyy
         J7S/79f6dHFlWlpyXekaRBOLuJ2cET9QgUiMQp7zUUWP4VcDh6ihQ2Te4TtF64KrGNbW
         uhZVRdjDheuhqzN5zORMw4K/WevWdKAfO5lHtKZI+wQ0ZuRHa/9ZbLtraeTwlvIsbkkK
         Wu7ZWN6DPstSU6/WoLfWfPX9EOdvu/YFV1AWXAIvFWnEKHhx5PPfyNxQPHruj6aYWf4F
         HLLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744698050; x=1745302850;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GkzlycTSWhUYmFh6lSEJKN483G6fww5F4wymxCLohK4=;
        b=q4qQuuu9/ncJ0kp7909pObVz7yumXD6+jbd5ZnqeVXFKae4vGjJbOCKuLALkUBViBm
         BGPpmKSCMyvbIagqC/S13n+tRDtL9v/LdEq2aWQf1HDTA87ME3xpbKiHS7wzdBN52006
         ZxeQoHqmCMjFaiwTDEjWA5JrXc7OAYe6kIXBfB9W/3PCspr2usMwTSAwMpn9EeGwZTcE
         0ik3y95/BLiZBqYnDPjQf1/uxIp+rQAEPYrIHF+PWMIp4j1De3dEOYd14G03t3q6Cl4z
         abPzEqcpoP/fa/RwxDmcqi/GoG/OG8cqTOT5gAzfSp3LX/TCe5nBtOFk4HHwBHO7woTf
         5K+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXgSePTI8ez8kjYxLaJiFh46geqEVxc8sZCXlboWMKsGwPmE70FUgywqipmqmXGWoiwrkaSbCTBWRhp8ZE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzj+/iIux0PyMm/yuAYCoSGPGNDPZvP6hNEJa29rA888izUT8sO
	v2eIWLeOq4OUVw5E4fcaodn3eOBeST2LhSTiUGhWES9BlK+u80ZlxUv6M+khapwjg5oaFTYJcSn
	5
X-Gm-Gg: ASbGnctXRR0Zh7KMJdk34qUswgfAW3l7+rh/nTTaNOBjo7FgZFpquvWt3haih8lKTJo
	y8otS2RGjw4vgpO8fVphlJF9Rp3qPpRZlrmzEpzlgVz6y0UGKkXHv1FI1ufB/Sv52eyr5UMGYxT
	NTdv94dxUtp1Y9wwW5EFrFQm4FuSRIF+1nsJe3ASSKTLKmL6PDaEGvVynmF4wtWSPCH8wbODq7Z
	cnQRGfaklZMqqSf/KgNgpT+nYdHPCXudBIe4jVG3PzFlU18kfmMUNDQrLsL8m82tJBTqU4gpNBD
	oym5Oc/fU+eI10Pd9yxPDtkIOEGSMVRL3NnKTJwtWnVDgJzTrJ/JETjkUkjOwYStYgak/TIgOZT
	kwaPSsNYaMdi2190=
X-Google-Smtp-Source: AGHT+IH5uEHZHf0q3fBMfhb3D5pup7+Ee5MfqdlEewW7DJLDoGW+CYuJRaRH9YD4ei7FrdbwX1nRgQ==
X-Received: by 2002:a17:907:c8a8:b0:aca:bd09:3cf2 with SMTP id a640c23a62f3a-acad36a1dc6mr443491166b.13.1744698050067;
        Mon, 14 Apr 2025 23:20:50 -0700 (PDT)
Received: from [192.168.1.26] (46.150.74.144.lvv.nat.volia.net. [46.150.74.144])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1cb4129sm1053861866b.98.2025.04.14.23.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 23:20:49 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, linux-kernel@vger.kernel.org, 
 linux-tegra@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250404111703.235455-1-krzysztof.kozlowski@linaro.org>
References: <20250404111703.235455-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/2] memory: Simplify 'default' choice in Kconfig
Message-Id: <174469804877.15476.8104725489814649152.b4-ty@linaro.org>
Date: Tue, 15 Apr 2025 08:20:48 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Fri, 04 Apr 2025 13:17:02 +0200, Krzysztof Kozlowski wrote:
> 'default y if FOO' can be written shorter (and it already is in other
> places).
> 
> 

Applied, thanks!

[1/2] memory: Simplify 'default' choice in Kconfig
      https://git.kernel.org/krzk/linux-mem-ctrl/c/0c16b8fdfe0952ce6fb317c27dbd54e214e5ed6d
[2/2] memory: tegra: Do not enable by default during compile testing
      https://git.kernel.org/krzk/linux-mem-ctrl/c/9a4199ae8a041bf75b544c1f46a2ea95417b69de

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

