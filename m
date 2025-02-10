Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6FC11CEE8D;
	Mon, 10 Feb 2025 10:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739183996; cv=none; b=UegMB3fTuH6BJ5fHvpNyTnU+oYG/YeIMaN6CqyJBtacQgDR8WfiXEWQ3VwXlWEWTtzhIu02JBQ5Ydrs6zeo9AAv3yN9jo7XEZlJ3Lcc4GElwubdurssYzXBL72eji0vQJ4IyDQbCTDuNc4Le+91Znxvhl50hKZG5ZFPMj9o7jGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739183996; c=relaxed/simple;
	bh=BfwzOA8qDiit0Pbmo1T1bUJAJkpmcTsxeoLV+yzwdtc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C9aq0FUbrDek0wpYOVMjqCxrjqznH6Rnni5h5dKwR28mWxUGkuZcvLpUcfFJqb4s5/NMYAKCMxifiWFDagZvc4rdaylyhyfxRaPqpboo2hRHUVwybQSUZYdU82kVQsJkHye+h5qaFX9BRXd90nSJzBtKUkVJPDButYhxCl3O5dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=PhDv8cYp; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="PhDv8cYp"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=EYscmB7YBh9xCH5NiBwRVfVEdXQ0xWkSsd2V5FdpalU=; b=PhDv8cYpqq3APzcwLUHJCid1uD
	v/7ixIhWf/z879eB+ZeOw5OH+aLnc/B/HZe7UJ06KyBxwCYYfrKoj8SpLRj/dLP1213szDWGpPUGV
	mJTwo7m4ClH4mKe5zfJkb7HVAxE8o6/rhFBjs9kDPaHH4MN+/9N9gHf0GwBwQQ8G5Cg1kBfR1suJL
	2DoU/bIIu8hVXSVmnZykFOVlstxQNFj/MQIbg9AiVzPhjMl8v7pWyaGiC7ySo0pwTxp9eCIVfwST0
	mjZi/a249sF3o7JfOZkXaG9GujpnKyQmsMYlxtKElNoGU39/7APLKO6C39do/HgwRg07JJUuI96yY
	Ymd2vT2Q==;
Received: from i53875bc0.versanet.de ([83.135.91.192] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1thRCc-0000xs-SX; Mon, 10 Feb 2025 11:39:46 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Elaine Zhang <zhangqing@rock-chips.com>,
	"Rob Herring (Arm)" <robh@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: rockchip: pmu: Ensure all properties are defined
Date: Mon, 10 Feb 2025 11:39:35 +0100
Message-ID: <173918381710.1055685.9023375516767645114.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250203213056.13827-1-robh@kernel.org>
References: <20250203213056.13827-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 03 Feb 2025 15:30:56 -0600, Rob Herring (Arm) wrote:
> Device specific schemas should not allow undefined properties which is
> what 'additionalProperties: true' allows. Add the missing child nodes
> and fix this constraint.
> 
> 

Applied, thanks!

[1/1] dt-bindings: rockchip: pmu: Ensure all properties are defined
      commit: b921f66ccf5e8cf1b8a5052b35ceda454f19f5dd

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
