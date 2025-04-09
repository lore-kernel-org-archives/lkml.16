Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 536C822E3F7;
	Wed,  9 Apr 2025 11:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744198945; cv=none; b=tdh2DTj8mgal1z+J0XHF+6gv3fo/XnTlQht9++sYdKfXx/K7OZ7KaaEyA1Z5gEGq3aOMaln3aPvelxRF6kTge2/tSAxeAZRiz78+a66W/FsGSpbY3Z9n27eIKUUizKWu2NLaR9/SZ6dqgRw/W8O/0tQvHrZ60i3KgGhQX1ENXl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744198945; c=relaxed/simple;
	bh=9zaPk/m310/l4Dbzp80UZSQ/cTGM3yR4rain7uqIOb4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lhWPaIH2pUjACF1AOhMvlzbNZGZYi2qGBJZO3Et2BhmhR/FYo/4kSnU4E/UHgxlDbjBClfah6thttCUsGlsP3/Yas88PZqKykirCVeS7K+oS1S+PWpasHwFvYwuqaI/YQBRY3q0isz7IrkiuUa3eH+bRDu0LqrHiDa5fVvIyjuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=whut.edu.cn; spf=pass smtp.mailfrom=whut.edu.cn; arc=none smtp.client-ip=101.71.155.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=whut.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=whut.edu.cn
Received: from [198.18.0.1] (gy-adaptive-ssl-proxy-2-entmail-virt205.gy.ntes [27.18.106.237])
	by smtp.qiye.163.com (Hmail) with ESMTP id 113bd567b;
	Wed, 9 Apr 2025 19:42:11 +0800 (GMT+08:00)
Message-ID: <28abc527-5e73-418f-a242-e4a2ebf0d94a@whut.edu.cn>
Date: Wed, 9 Apr 2025 19:42:10 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] phy: spacemit: add USB3 support for K1 PCIe/USB3
 combo PHY
To: Pan Junzhong <junzhong.pan@spacemit.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org
References: <20250407-b4-k1-usb3-v3-2-v1-0-bf0bcc41c9ba@whut.edu.cn>
 <20250407-b4-k1-usb3-v3-2-v1-5-bf0bcc41c9ba@whut.edu.cn>
 <e65434ad476fc113aa6f8acea48f4579bf5fa27a.b2769c19.b098.4e58.9cf1.1eb975cc2227@feishu.cn>
Content-Language: en-US
From: Ze Huang <huangze@whut.edu.cn>
In-Reply-To: <e65434ad476fc113aa6f8acea48f4579bf5fa27a.b2769c19.b098.4e58.9cf1.1eb975cc2227@feishu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZHUwdVkwfShhJSR8fSRhIH1YeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJTFVKQ1VKS01VSUhMWVdZFhoPEhUdFFlBWU9LSFVKS0hJTEJLVUpLS1VKQk
	tLWQY+
X-HM-Tid: 0a961a5b942c03a1kunm113bd567b
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MRg6KDo4LzJMHjwOMB1MTh46
	KgIKCj9VSlVKTE9PSkJDQkhDT09NVTMWGhIXVRMOGhUcAR47DBMOD1UeHw5VGBVFWVdZEgtZQVlJ
	TFVKQ1VKS01VSUhMWVdZCAFZQUhKSEw3Bg++

On 4/9/25 7:38 PM, Pan Junzhong wrote:
> Hi Ze,
>
>> +static int spacemit_combphy_init_usb(struct spacemit_combphy_priv *priv)
> The USB3 phy driver is updated in the vendor's tree.
> https://gitee.com/bianbu-linux/linux-6.6/commit/1c0b3b4b9c77d22ca886c8a4c44e62b5891f8abc
>
> You can submit v2 together with the change of lfps_thres (writes 0x58 register)
> without adding new properties for dt node.

OK, thanks!

> B.R.
>
>
> This message and any attachment are confidential and may be privileged or otherwise protected from disclosure. If you are not an intended recipient of this message, please delete it and any attachment from your system and notify the sender immediately by reply e-mail. Unintended recipients should not use, copy, disclose or take any action based on this message or any information contained in this message. Emails cannot be guaranteed to be secure or error free as they can be intercepted, amended, lost or destroyed, and you should take full responsibility for security checking.
>   
> 本邮件及其任何附件具有保密性质，并可能受其他保护或不允许被披露给第三方。如阁下误收到本邮件，敬请立即以回复电子邮件的方式通知发件人，并将本邮件及其任何附件从阁下系统中予以删除。如阁下并非本邮件写明之收件人，敬请切勿使用、复制、披露本邮件或其任何内容，亦请切勿依本邮件或其任何内容而采取任何行动。电子邮件无法保证是一种安全和不会出现任何差错的通信方式，可能会被拦截、修改、丢失或损坏，收件人需自行负责做好安全检查。

