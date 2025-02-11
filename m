Received: from iris.vrvis.at (iris.vrvis.at [92.60.8.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F193F22FF2D
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 13:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.60.8.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739280793; cv=none; b=ODvbKkYU5hdwnUQBz+hOiYnuEuLlUhRCseBVtXTcJDWTHLiuAhniF78t3mTzjggJmooK2lJfiS9NYVEH7+KC7ZNpOit35B3aivHSzQ9OQ0IdbS738HVNuIyVxlSYmice58S13GTukeveTDPtE31SynB5v2UobanR1vGjGn1ty0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739280793; c=relaxed/simple;
	bh=gST1Ccf7hEP/K9Q/P9FVXVdjaLwp6jgtqUZOlyP49Os=;
	h=Message-ID:Date:MIME-Version:Cc:To:References:From:In-Reply-To:
	 Content-Type:Subject; b=m0JXFG0BVyWBQ6HTArK+ifpsgvwQAvCoNl2SKe9i+5teWWjERZw++n8UlsTHTy9Dex/v+f5NcH1Q93PK3CXyRBX99/QFsIKUlrhoztc67kaj4kJw/yobaoGt4I0yP92le8LWmNlmE4P6yh/3RqYEqSX3DoHLaptqCLZPmFpqqtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vrvis.at; spf=pass smtp.mailfrom=vrvis.at; arc=none smtp.client-ip=92.60.8.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vrvis.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vrvis.at
Received: from whiskey.org.vrvis.lan ([10.42.2.171])
	by iris.vrvis.at with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(ESMPT Server)
	(envelope-from <valentin@vrvis.at>)
	id 1thpvc-0004QS-0h;
	Tue, 11 Feb 2025 14:03:57 +0100
Message-ID: <f64ee4ee-7e56-4423-813e-b87e023e893d@vrvis.at>
Date: Tue, 11 Feb 2025 14:03:51 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: Heiko Stuebner <heiko@sntech.de>, Philipp Zabel <p.zabel@pengutronix.de>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Jianfeng Liu <liujianfeng1994@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jonas Karlman <jonas@kwiboo.se>
To: Vinod Koul <vkoul@kernel.org>, Chukun Pan <amadeus@jmu.edu.cn>
References: <20250106100001.1344418-1-amadeus@jmu.edu.cn>
 <173831716590.670164.5196739962949646746.b4-ty@kernel.org>
Content-Language: en-US, de-AT-frami
From: Valentin Kleibel <valentin@vrvis.at>
In-Reply-To: <173831716590.670164.5196739962949646746.b4-ty@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spam-Report: 
	* -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
	* -4.5 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Subject: Re: [PATCH v2 0/1] phy: rockchip: naneng-combphy: compatible reset
 with old DT
X-SA-Exim-Version: 4.2.1 (built Wed, 06 Jul 2022 17:57:39 +0000)

Hi,

>> Chukun Pan (1):
>>    phy: rockchip: naneng-combphy: compatible reset with old DT
>>
>> [...]
> 
> Applied, thanks!
> 
> [1/1] phy: rockchip: naneng-combphy: compatible reset with old DT
>        commit: bff68d44135ce6714107e2f72069a79476c8073d

Thanks for your work!
We found your patch after NVMes stopped working on a rock 3A with newer 
kernels and successfully applied it to kernel 6.1.128 (currently in debian).

As the commit breaking NVMe functionality on rk3568 platforms 
(fd3ac6e80497 "phy: rockchip: naneng-combphy: fix phy reset") was 
already backported to 6.1.y, 6.6.y, 6.12.y it would be great to have 
this fix in these releases as well.

Best regards,
Valentin
