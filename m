Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E9E1F4161;
	Mon,  5 May 2025 08:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746433595; cv=none; b=O32XZjH4BJkAHWJrhcZRunyLq3MDKhuhyVMjk6R1fHTuTKnQJus2Sx4imRqmxALjHpkX1qq0MEzOCuVYH0q2OM9YgUJfnpvxyVl1ohhVYsi/qO7lUAeiMUsrEo1I/1henTsRW/zhDrKePds5/hqpLFHEPqkiycKu4PVuJgdZ2d0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746433595; c=relaxed/simple;
	bh=t+91f6YH3O0LYf5QmfpngArqVLX/8+139xo5BfyO+eo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uXaqv66YgDCak7BXxM6JF+8zE5SybGvsn0Pn0gesrCglruV2nScJiiW3kazAcmFw5PT2NQoRWCNMMBYFkGQAbewe+3jYVRF9jXc0YdJRsZCH5yPevI2FopLzENv4KXV0PoILewkcsqG+1Xo1KwhlE7QcGSLIaRIkJimI/LiPwig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=ZTcaDYH9; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="ZTcaDYH9"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=/6DfAkqmatLxmLg8isSu9YmNjsXnPdrip922h5yy7h8=; b=ZTcaDYH9sTVvm45ziriha1k+rA
	wBsEWPTsPuSJimgaphgfhwWZqpmue5vWy54/gqZySe7j0wcvjWQ199ke48Yq7SRp1DuUDDKM2pQto
	3N1gHXPG8su6J4j0dGis0+fbiexqw0kG5RVljdgMwR6vuAHd0FiN9iADTgUAPitoZCPWbIkCmj2rL
	tA3yR6B0YgmtzDEJpO66yQ2t682R+xl8zhMTU17lYtS8mhr2zOjNxjOts2dyJ4+ocdbr1lreshSov
	qBUS5tMOZsp/HygryeStXw0XbrI6yBZiDjnoPefBDKlf26DUgNmyZdjqpigPjOVbrt4AmJPMXwKMf
	8Cd3NR7Q==;
Received: from i53875a1d.versanet.de ([83.135.90.29] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uBr9h-0001Ho-Gt; Mon, 05 May 2025 10:26:29 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH RESEND] arm64: dts: rockchip: Switch to undeprecated qcom,calibration-variant on RK3399
Date: Mon,  5 May 2025 10:26:18 +0200
Message-ID: <174643357079.1204535.2566293021923163121.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250501160208.96451-2-krzysztof.kozlowski@linaro.org>
References: <20250501160208.96451-2-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 01 May 2025 18:02:09 +0200, Krzysztof Kozlowski wrote:
> The property qcom,ath10k-calibration-variant was deprecated in favor of
> recently introduced generic qcom,calibration-variant, common to all
> Qualcomm Atheros WiFi bindings.
> 
> Change will affect out of tree users, like other projects, of this DTS.
> 
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: Switch to undeprecated qcom,calibration-variant on RK3399
      commit: ec169727bf7365f7475f335116e1bb5896dd3603

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
