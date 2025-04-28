Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F9C20CCDF;
	Mon, 28 Apr 2025 07:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745827121; cv=none; b=s1EqDId4DvDvY7ZuIAaKMF4tFzZb4aLsq2tArR0tHlZsbi0WySoTxgrdvsbud2hEG7MA6gCtXifeZm3X/xYyBVq+QGu1BAzNYWrZw6UhyDGjcAp1fP92keNJzo/muM9PBkkqclBwSdmACc5lZxr8p6lPce4pcCslupdhc1Rl5Sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745827121; c=relaxed/simple;
	bh=BomsCrVHZ74O7rSQZaf6k4KudMwfvZEEulM9RFBEQg0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z9UrMfuqBXYXg8WXY1Wh/PudR2BfxlJBDeFsdDT/T+gi0OgIHuq7Yzw8/7QKcFDDA4GBIC4JMhTCUgR/oJeV4iA3ftPwMv/8aiMYDJwABcqgYfWGrxz/kRPT4X8LjW8jluvVF/aol1TbhSQLtjznBLYvG4qW5i67AJgCNruYLRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=whut.edu.cn; spf=pass smtp.mailfrom=whut.edu.cn; arc=none smtp.client-ip=45.254.49.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=whut.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=whut.edu.cn
Received: from [198.18.0.1] (gy-adaptive-ssl-proxy-1-entmail-virt204.gy.ntes [27.18.99.221])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1360754e8;
	Mon, 28 Apr 2025 15:58:30 +0800 (GMT+08:00)
Message-ID: <a3478dff-ae04-4d3a-ac51-2efc994cda19@whut.edu.cn>
Date: Mon, 28 Apr 2025 15:58:30 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] riscv: dts: spacemit: add usb3.0 support for K1
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250428-b4-k1-dwc3-v2-v1-0-7cb061abd619@whut.edu.cn>
 <20250428-b4-k1-dwc3-v2-v1-2-7cb061abd619@whut.edu.cn>
Content-Language: en-US
From: Ze Huang <huangze@whut.edu.cn>
In-Reply-To: <20250428-b4-k1-dwc3-v2-v1-2-7cb061abd619@whut.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZHU9NVh9MH0JDGR0YTE8ZQ1YeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJTFVKQ1VCQlVJSUpZV1kWGg8SFR0UWUFZT0tIVUpLSEpOTE9VSktLVUpCS0
	tZBg++
X-HM-Tid: 0a967b679ee503a1kunm1360754e8
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Oj46ATo6VjJCFTRLKTM*DA0p
	OBEwCjlVSlVKTE9OQ0lMSkpOTU9LVTMWGhIXVRMOGhUcAR47DBMOD1UeHw5VGBVFWVdZEgtZQVlJ
	TFVKQ1VCQlVJSUpZV1kIAVlBSkJKQzcG

Hi all,

I found some mistakes in the patch


I will correct them in next version.
Sorry for the confusion and thanks for your review!


On 4/28/25 3:38 PM, Ze Huang wrote:
> Add USB 3.0 support for the SpacemiT K1 SoC, including the
> following components:
...
> +
> +		usbphy0: phy@c0940000 {
> +			compatible = "spacemit,usb2-phy";

compatible = "spacemit,k1-usb2-phy ";

> +			reg = <0x0 0xc0940000 0x0 0x200>;
> +			clocks = <&syscon_apmu CLK_USB_AXI>;
> +			status = "disabled";
> +		};
> +
> +		usbphy1: phy@c09c0000 {
> +			compatible = "spacemit,usb2-phy";

compatible = "spacemit,k1-usb2-phy ";

> +			reg = <0x0 0xc09c0000 0x0 0x200>;
> +			clocks = <&syscon_apmu CLK_USB_P1>;
> +			status = "disabled";
> +		};
> +
> +		usbphy2: phy@0xc0a30000 {

usbphy2: phy@c0a30000 {

