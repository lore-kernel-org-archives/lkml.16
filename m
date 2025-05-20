Received: from smtpbg151.qq.com (smtpbg151.qq.com [18.169.211.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03068255F4D;
	Tue, 20 May 2025 02:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.169.211.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747707231; cv=none; b=Op9SmHv6GxQIf6OsDdo4JZ4yyejGb1VU66nyhvaQ/d5KuQwrjGNAdCet7861KjG9Z6guu7xlvpd4DZZpb2d/EIDlKwtKqfIPKa+uDPTp/QWU567Mw9bhc/Oaa9qU+Z7QKagJdJ0jDWjNkRho+Q+ipD6LhU1qhM+uUpMUAFPEc8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747707231; c=relaxed/simple;
	bh=7dAdX67QwR23AqTZ7cIRvdvQIfTbEjDaR4cJnFmCerw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nfLLYHmI3AB8EtN/c5R1jYLY4LzofQ2c1lvY8jtUC4cwmS3tgpP4K669YFDg7jKY8GAtAOTUZe7b+A/hoIjKePho+NP+ImM7AjsLttcoFzuWtzFncqlnh/HkSipp/4v0QqOJtNsgxS3Fdj0CDHwXZqzJH6Ea49Kz/YwRA7FBOMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chainsx.cn; spf=pass smtp.mailfrom=chainsx.cn; arc=none smtp.client-ip=18.169.211.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chainsx.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chainsx.cn
X-QQ-mid: esmtpsz18t1747707182t69fba9fc
X-QQ-Originating-IP: Tj2H4w98AHYOiKRZQDY42vO/hTjCivU3dF71q/M76rE=
Received: from localhost.localdomain ( [182.242.225.107])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 20 May 2025 10:13:00 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 2848661057266188030
EX-QQ-RecipientCnt: 16
From: Hsun Lai <i@chainsx.cn>
To: i@chainsx.cn
Cc: andrew@lunn.ch,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	inindev@gmail.com,
	jonas@kwiboo.se,
	krzk+dt@kernel.org,
	krzysztof.kozlowski@linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	nicolas.frattaroli@collabora.com,
	quentin.schulz@cherry.de,
	robh@kernel.org,
	sfr@canb.auug.org.au
Subject: Re: [v3,1/3] dt-bindings: vendor-prefixes: Add SakuraPi prefix
Date: Tue, 20 May 2025 10:12:59 +0800
Message-Id: <20250520021259.2387130-1-i@chainsx.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250519075432.2239713-2-i@chainsx.cn>
References: <20250519075432.2239713-2-i@chainsx.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:chainsx.cn:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: MOfwHzgDpc8I5fY+DmIic6ycCX1NWBonn7/S+c798mJ77z4W6sTCjeLt
	VhIMG/g+zv8DRXaml8swU1MNsQIRRqFy5X71qzgdwdEZqRSwgW5ZZkdae179YQrFIo7rVaR
	1xbFF17Pf0mWSKYfUuToc8eC2DgBhKgifNJIFC5KwcCj8WgascWHNtROzRFbM+8xVLbeGD9
	v8FUev9k3LpwiapoOqRG3uxbRp7hHlbZFYpEF6z/MVDfvxeip2TelVCfCktzk3uM2kDYl9Z
	OwTe9N0+k2YtxQv+e29xhN7PqLsMv7pFxBwILZ9SISx0a/aa6J7VlpFt8ZrWVWe4bVa/xt2
	1HZzfLUg7Xde6qyAlFL7lr8uDbNGCULDVhEqqeNAjzUoXpswzPgdqvFu3ovsSZZLxdoATIK
	M8WxrucpOsj92q/EBbhYjaugQKAdE+wntsZJriRj6r+nuTBBpe2zlMRgGZnIY1hd9slWDKk
	lqObW0G13hqjoAmZJJDCJwUAtSCue1UF/dwrnILBEb2YvLH3o2xi5bSxFkYbBb6WQhZbVIp
	ZDTH9XuTEKNVTV2AIUzFoXcI6Il0xpc7YXXZOezqb2rPt5gbeH1dZ41KJP0JciOjnQFuCt+
	Ncv3ztmAenLPo64ihZrbm8nOxUuEmI+lRKK4VUGDh3X/H9uvjldNB6hEwVJmW5XCUK4UTFz
	GWZMfQ7X9Zqb/7u5nnNPBtxMk+yRbJdthQRzBdWQnDqSt52wmCxbRHX3lU4CtSw5F4eamN9
	IQwRzsbPMjXYpGXDnfXdubHbjKfW1/sj8LLAUpIGIe3jFmI7aYBlZYFAogN6NHi41D72/Ap
	6Af+HE//5eU/3bLgR0o8t4Ozs/tMVVt/6ZTn96KZNMCLKt/Fa3x3wM3NjrdoXB48PeNb8JX
	dj/NcrLKmHDrCaeHtBxQ9667r3n+xbebVoRzseJlylErvwQQWXtRq23bY3uAPz1fW5LK7n6
	2PjlW17KCr9pnop8fChG5D72cmIDbbtbo76oZBEeOb2zgdl2ztZRvhqVc
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
X-QQ-RECHKSPAM: 0

On 5/19/25 10:20 AM, Quentin Schulz wrote:
> Would you know what the actual differences are? For the Station M2 they 
> say "Based on ROC-RK3566-PC" which may indicate there are some 
> additional things or changes? Same for the Station P2: "Based on 
> ROC-RK3568-PC".

Station M3 is a product from Firefly. This product usually comes with an
outer case, and the internal board used is the ROC-RK3588S-PC development
board, which is why this situation occurs. The same applies to the
Station M2 (ROC-RK3566-PC) and Station P2 (ROC-RK3568-PC).

Thank you for your review!
Hsun
