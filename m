Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE922857D5
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 08:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749543820; cv=none; b=ScIIhW/ZkTAdyraR0yl452jSzgHXzqyAAwkc77lZuqiiCnQQygsW+91JBjvK6md9/32FM1a+JaYLd5BqCedVpMhOxwr9hEc3caRt3Uf/mn4FOSdGCbvZmncCnPafo+HKUwK4zALRgk9KKIzysLhQg82nZPiVSQz3tkHRfOl+w4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749543820; c=relaxed/simple;
	bh=DwofcxYmUouggtE8VyvYKPiM9x3OgSKS3Z+dbnuIrD8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=tBK/+vtPak5+eSTaemrfIawTI9kfxVDeTTHCGYMS9W3IBwSg1BLmfos4xmg4xLF4ocl39G8yURHRoBaMjKemM0yaabv8cxpjCAKCFCbcAE2rCczvTNdmHzRyxbgxYb8xl+uKErx3XSu0HCLEmax3q9eFDFUQ8cUauqVcnWWA9sY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZqQmcE4f; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZqQmcE4f"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-450ddb35583so2827535e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 01:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749543814; x=1750148614; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8yVdDelh0G2g2TL5gxsNNSxDzJyW376EN3oDWRulMzs=;
        b=ZqQmcE4fdANUYrgTMLVPhrnENExcUtb5XUSi1cPFZNFBowj63MIcGDhDu+1qnJcDnY
         xGGQXNq7J08jj8ngFfck2KyHvXIR3JTlgqjxY82G8p0Qp/qIjd1wThRNx+/EMxTSTBC3
         x4GPEz0ZR9qmQvsRGrskJCD//MA5X7ARRtfyCrp/JMyKu/ZtU2IckdVs/wzbF3La6JIA
         e0ScNv0oi5lhj41R4KA4pPEylxjAjeK8+EckODpq2AjYUNaKjT/idOykqyg9UZMmrcPG
         wLR/P3eTXXglCfS0v9Q35oWasjpLDUvlcZunIcLQFuNsFrdlViITcb3yQm0qIlguJ2/D
         +DFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749543814; x=1750148614;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8yVdDelh0G2g2TL5gxsNNSxDzJyW376EN3oDWRulMzs=;
        b=Njcr92LrYQF+/OdaS0ksA++BqhTkEndmd+b6H1zy3DCfW6UR785otCtifNTMIO3dqC
         w8a+XfXk8kl6U8S1GhAU5XPlaAydV1mD13hKl/r4Y7PbBD2pZyXF4Y6ZBnU1jI/ue8Tn
         zQGDcQck6qrhVdF3aRYJaGDVtokMobVqmHwOLSstMvISa0h+QRpLTVplKf/kSo5IX5A+
         3JR1CyJgdw4yKzoL5+RYyWWS7cjSNKouh12tFMoFHQHB8i+8AtLcKqRqQCymxMXDBpm9
         qc2zMuoKWOoyTh5ZGD50F8MZ19iya1TS/UE+jeAKihpry7D7hJP62mUuhjFxb8dKNc1I
         603A==
X-Forwarded-Encrypted: i=1; AJvYcCWUlbo9PA+9iWz1exRJclNTZoUd37xkZHT/PnGlLq+alS8PKeeeKj8ef3B9z+zE3647YXpGaqKZxinUsPY=@vger.kernel.org
X-Gm-Message-State: AOJu0YygSYC95gioGr3G2/WwqCAuLM6I8j+SLCpqQLOAO3tvU5IBYKh3
	kNbmsrCNzFHDX30qKEWFQPCwcMJKoAoVEnRqm+ff0Yxmct3bSRSIEPrPXZ9RNyfKZMQ=
X-Gm-Gg: ASbGncuBlnBKPDx6lMBaWxNvCDa6LccxawhsTPDwDxKFAd8bQ164kzmpLbuE0uWMKPD
	xFu8akwtQe7/WZ6EI2oBs6yHLJhlndRaAn9FvOHqHVoX1qE80V+EsWXi2T9FvhROWLzPFyw8Uza
	ZkgDGooKLVg3Vf9RIaveydKYQfres/7IvTPwgRtGjTyEPc54idLM7KLd4S5utRGZXBlXSJMivNs
	scGUrQpoo4R0h2feoeFJPs6RR2JvEMQ/mQftgC4m+IYeBmTQ9XSVtEUMSa23rAE140ddmYIUj+s
	x6/e3FNmA4RFYP/CXBz/Ki0tJPStoJi9RMYGbTzwgpsE5LY0LOBm9lSHoCjJYcO7yXa9r88PZPa
	5IVlg9w==
X-Google-Smtp-Source: AGHT+IH4Tx9uamsGrItBDI2u67txsm8PcW5JtSr8VTliqVeJ2KnCmT5Yh+EXBdeAxp8xz5LOXkLOJw==
X-Received: by 2002:a05:600c:1c1c:b0:439:8294:2115 with SMTP id 5b1f17b1804b1-4531072ab88mr23950055e9.8.1749543814536;
        Tue, 10 Jun 2025 01:23:34 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4526e155ce7sm131726125e9.10.2025.06.10.01.23.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 01:23:32 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Yong Wu <yong.wu@mediatek.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Friday Yang <friday.yang@mediatek.com>
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
In-Reply-To: <20250521091626.4283-1-friday.yang@mediatek.com>
References: <20250521091626.4283-1-friday.yang@mediatek.com>
Subject: Re: [PATCH v1] memory: mtk-smi: Add ostd setting for mt8186
Message-Id: <174954381208.117761.10620346119186400968.b4-ty@linaro.org>
Date: Tue, 10 Jun 2025 10:23:32 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Wed, 21 May 2025 17:16:16 +0800, Friday Yang wrote:
> Add initial ostd setting for mt8186. All the settings come from DE.
> These settings help adjust Multimedia HW's bandwidth limits to achieve
> a balanced bandwidth requirement. Without this, the VENC HW works
> abnormal while stress testing.
> 
> 

Applied, thanks!

[1/1] memory: mtk-smi: Add ostd setting for mt8186
      https://git.kernel.org/krzk/linux-mem-ctrl/c/e18c3f5cbd0243c60777f7a3a02e4506f5196c31

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

