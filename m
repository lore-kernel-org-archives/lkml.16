Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 955381E379B;
	Mon, 10 Feb 2025 11:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739185362; cv=none; b=qz1OaL4zC51Tx0E6oKmMaAJqaud8jFF4LdJDBVHOSNqpprerBYCXvwQT+E5SJpm90E0P8cEmEnt4n1YnNa0O61OgTPbFBoV3zQSrsfRuK9ohyyPswMV1q1+vnxYuhuGCI/EraridAl4flzlR3PA4pE23/rL/HNz3uaI8IXi5mDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739185362; c=relaxed/simple;
	bh=hqav1osnV57BsSWfpy44l5dQRNg/prN+l7ofLWugbs0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Wk+JM5HKM0ZIZM8naUMqkTERgk7Iv5MvTrGeIuKhpJ7AbSNZiFFvyAXZX468Z/yrADrsSB8FxVW0VfuD9bWKi8yoVcip3I8AZm1fju1pmb9j8Z/uOZFCVdI/iK+yaewx4A9pHfkHFBNV75fhLVQH+uX9VtrS/Wg5L1MxxoZlBas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=v+yItCGH; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="v+yItCGH"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=XKDMM/Pr9XluX6rCXkrT2esbqxQEIXip+ExZYq7Gt+U=; b=v+yItCGHtv3UAc6RaelpyeySwY
	w02qeZSnxi5h9HmPlD2t94tDXOLHY+UBNtGNZ7OkW01po7JK+Fddmvign19MmSIKdNkk2fE5cKqND
	Cc0wI4zhmaiTR+I7QloDkBS65AQhpnpZoe65L2GITEanaTTV1r8S34cKFPWJkroWiwVdkCj4I+GpI
	unGzFZg6hIV+wXc6rLyiRV+Gr56ry/z7L65dSp7r6BFmG3eqZMzPqgyBRv0nFqL97caeadP9X6vdK
	Y7z4Zpv1vjjusFx+jjaVxqFy1BvaYq07vz1AQ5lbcJ9MAwsYvgEXPMBxG36YO4XfQOYf+JuEdeGnf
	jabO4Ahw==;
Received: from i53875bc0.versanet.de ([83.135.91.192] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1thRYc-00016K-JC; Mon, 10 Feb 2025 12:02:30 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Kever Yang <kever.yang@rock-chips.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko.stuebner@cherry.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: vendor-prefixes: Update rockchip company name
Date: Mon, 10 Feb 2025 12:02:19 +0100
Message-ID: <173918533251.1059791.7850315164866493973.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20241205082258.857018-1-kever.yang@rock-chips.com>
References: <20241205082258.857018-1-kever.yang@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 05 Dec 2024 16:22:58 +0800, Kever Yang wrote:
> Rockchip company name has update to below name since 2021:
> Rockchip Electronics Co., Ltd.
> 
> 

Applied, thanks!

[1/1] dt-bindings: vendor-prefixes: Update rockchip company name
      commit: 73af358e1d4b14928a66300a09f887bfbad0c989

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
