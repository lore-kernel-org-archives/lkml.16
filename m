Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F63B18871F
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 09:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738317169; cv=none; b=aWv1hgxdHPwX7hBkMQe2mZZC639M5u+gsDOdPdnkRh5B4Yyfs8EYdHdj8TZIDuV8AulHXeP5sCFbW3jSUDuSgw/RY1W8Bq8KC+801Q5QdvZSp3QhyfL5qz1mTfKIV3q/cLv4AIDAjv4VWWsLC1m/xeR86g/utiP5LGT4Ch2CqHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738317169; c=relaxed/simple;
	bh=bBWySW1/lROaMs3/C2As0r11HJEJ2oZDK9hKpWsk4H8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=iEs2Cz7hq7jXFLB9Qb8C/qWY+d9HU+Va+7xuqzjuUANNoSBwThtes5vkv4Pualo4fFfaCOx0wqrj1nzvyDApPibhFDa2jTEeDH2BBZWZvk9LLuK3tU1FNfI4O/Ht7JpHGOQ/dN/ZdI2KgZk45j14U13wJL3iZV71Bq2CpAUtl8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qjCTzZgo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qjCTzZgo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59FEAC4CED1;
	Fri, 31 Jan 2025 09:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738317169;
	bh=bBWySW1/lROaMs3/C2As0r11HJEJ2oZDK9hKpWsk4H8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=qjCTzZgomyBIL2KotNx2A7QXjlxQnyzQCqmYDV41BoAdhIo0IXbyBLqaK1f+Hjsdq
	 xGfaerIaaVKuqG5K2h7+Uku1vGHdM7EaN+yGD58o9C+75uxvz4JJcO5MQN+hSYeImw
	 b1NlTQL0emE8fjJVdjC4hLLPTYknwmrkewsicueYXyRWvAvtxdaFgESaGSyH6ltrh+
	 TTSAt1xAP4EFCdEcXNQCBa+1lrDmhpzdzrNgrnn/+F4ju7pwG9coApq1fh/Rg92t/y
	 IrgTRqGC7bn5BAVbAttlRhSyBb8fPb6r8KDYa69NC/GtX7lXU/bsbtQW4U7D4Vhwmp
	 l/xAZVRhhxmEA==
From: Vinod Koul <vkoul@kernel.org>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Heiko Stuebner <heiko@sntech.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Jianfeng Liu <liujianfeng1994@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250106100001.1344418-1-amadeus@jmu.edu.cn>
References: <20250106100001.1344418-1-amadeus@jmu.edu.cn>
Subject: Re: [PATCH v2 0/1] phy: rockchip: naneng-combphy: compatible reset
 with old DT
Message-Id: <173831716590.670164.5196739962949646746.b4-ty@kernel.org>
Date: Fri, 31 Jan 2025 15:22:45 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Mon, 06 Jan 2025 18:00:00 +0800, Chukun Pan wrote:
> Changes in v2:
>   Matches the '-ENOENT' error.
>   Use devm_reset_control_get_exclusive.
> 
> Chukun Pan (1):
>   phy: rockchip: naneng-combphy: compatible reset with old DT
> 
> [...]

Applied, thanks!

[1/1] phy: rockchip: naneng-combphy: compatible reset with old DT
      commit: bff68d44135ce6714107e2f72069a79476c8073d

Best regards,
-- 
~Vinod


