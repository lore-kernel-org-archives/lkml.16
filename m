Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE122BD588;
	Fri, 11 Apr 2025 12:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744373428; cv=none; b=HEdh/aBG7ZfONE17xFyxjrzN2eO7nK4U2tVGxXHyVp/y1xnLW5LN+/wXxvl3mS2N6ahXpGU2lHYUDeuU3l0BTvd3ScV0VgscUF7rEQAFHMGKYjbQHkPozWxYOIslGudHLt+QA8rQ8FR4DYg5ZFd5bALwRlNl5bDFkhyD7RUzVp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744373428; c=relaxed/simple;
	bh=ma8HZgD9JZlh64w2TGnecb0nKKh08kqyZOYZMMtYpZc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ZluvN0g9Ih1WXi0/X2KhKGr1vAxcfs0BIEwpfckcT1LsIgKQjwRpzBqC1Jaxl0GguDNwDzjj/wcxnp4H6Ug3G7q7StPPcT0rmkfKy3zXLafEwuhLv2kKGnKlvf7TeMed7CCODOP2C9YUqalr34knVBNB45LHTslATREQNFcavbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ae+o/cyx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ae+o/cyx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44787C4CEE7;
	Fri, 11 Apr 2025 12:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744373428;
	bh=ma8HZgD9JZlh64w2TGnecb0nKKh08kqyZOYZMMtYpZc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ae+o/cyx/enaKuzdD4bQBh/9s+5M5131Dr+2RiZwwfY5LAiT3IEoCPvAOXERoleSi
	 sRq8Y2YFvVkDjW34zP9dk++8HSs4Rw+ZXUCXkvYr9/PMc2XX6gJNGDx4vW0Q0TBTlq
	 7YSIJK7i2sY7X3tv5aZUeHzJSRSxOnoGIaMBfoQZrCEaMcyYdEv0r+xpOqSvQg2yTg
	 tDJUYRJIFVbAySqmhQouOka/cTTn5x4ufHEdAw5xQ+B4L0rQ06qEcr/uMJS7nUc620
	 a4q1SZgvu/oVfyFaMygtVr2g6dR1MzQ8IWDtv6V7LB2eNRMEKB3lbrRfQ2Hi9f5enF
	 6l7yMKHi8ZQxw==
From: Vinod Koul <vkoul@kernel.org>
To: Heiko Stuebner <heiko.stuebner@cherry.de>, 
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel-janitors@vger.kernel.org
In-Reply-To: <e64265a4-9543-4728-a49f-ea910fccef7c@stanley.mountain>
References: <e64265a4-9543-4728-a49f-ea910fccef7c@stanley.mountain>
Subject: Re: [PATCH next] phy: rockchip-samsung-dcphy: Add missing
 assignment
Message-Id: <174437342490.673813.7534992392289400859.b4-ty@kernel.org>
Date: Fri, 11 Apr 2025 17:40:24 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Fri, 21 Mar 2025 17:36:14 +0300, Dan Carpenter wrote:
> The "ret = " was accidentally dropped so the error handling doesn't work.
> 
> 

Applied, thanks!

[1/1] phy: rockchip-samsung-dcphy: Add missing assignment
      commit: 9cf118aafd6682793c40dde31b5f24d271da3996

Best regards,
-- 
~Vinod


