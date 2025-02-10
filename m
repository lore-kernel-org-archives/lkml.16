Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE77F1DDC14;
	Mon, 10 Feb 2025 11:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739185360; cv=none; b=hZ2pgIwUA/e8fk1kUHeVJUaG9AloOa3xzCrmxNLVAHWj4bSeLd4chG6iZ0SDdddh3rVIRd7tZm1e6DeptcS8iMKbl5jvTvBJaOEqCIX9Ke9FN/uuoF5B9ZZG1wtYYGGc2iE8JTB2XPGDqrWnYkhhaP93LW8boSKggq5QqnJtzNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739185360; c=relaxed/simple;
	bh=FpSi2ATJbEDX8RqHOEft6rzjmMktVXtGigKUzZHWI/w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mKIUI2AZwhVsBEPIVMPijRdBwvnsBa/a3zlQLJ92ov1eFUy+bQ/5pnvEEZZXSBnAncm5C3J6sPUoQpd66h8alHhYnFbjhEGrS65BuPY9JcA78IPMKEGQa7DQHFhaFswtLCyUH/TaR8DbCK0BaCvudvDLCMFpRh+qlYnmJq1mN8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=Mw3VgIuE; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="Mw3VgIuE"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=NrDBOPbcZ+135BBVenarKoAQjyTOjCUsDzFGx/AdVUo=; b=Mw3VgIuELoF2iFJh7R0UwDQ8/v
	Zwa1Qs/zIjMlPjacRyseLQaAc5ToAuDS2We5wQwb8gkTXoFvpLbtj4QhqRgwd7OxMYMSKdYVfouea
	49wyiBtSXfK/8bBkFCuSA5ltn66s5JnMLTlIcu9TJxMlJRnm6Kphn2Qslc3sjWp/KEgV91BhgRQFj
	7QfuhZ/1XhZqCFhx1K6P7SGnkTxO/7as+CHBcZI+F2EAXn/O6FRTuFx4eLMU7TJu30B8/TzsS5ghv
	6wZlSDE3f17eR6p8PiTvhYmK/sY3nYFMy3NxGJJWCPqkFBddM23FhAyWP2QzUgld04hVJz6KZULo5
	I4cSKvig==;
Received: from i53875bc0.versanet.de ([83.135.91.192] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1thRYd-00016K-4U; Mon, 10 Feb 2025 12:02:31 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Val Packett <val@packett.cool>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: rk3188-common: add PCLK_CIF0/PCLK_CIF1
Date: Mon, 10 Feb 2025 12:02:20 +0100
Message-ID: <173918533250.1059791.14073641145045801256.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20241205182954.5346-1-val@packett.cool>
References: <20241205182954.5346-1-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 05 Dec 2024 15:29:35 -0300, Val Packett wrote:
> Add missing clock IDs for the CIF (Camera InterFace) blocks
> on the RK3188/RK3066.
> 
> 

Applied, thanks!

[1/2] dt-bindings: clock: rk3188-common: add PCLK_CIF0/PCLK_CIF1
      commit: 7c9804031626c51d4ddbc8c6e82bbd8496cf6e56
[2/2] clk: rockchip: use PCLK_CIF0/1 clock IDs on RK3066
      commit: 4a918309d53f800dd07b94c4a4b1fcdb6289eca5

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
