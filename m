Received: from mail-m1973199.qiye.163.com (mail-m1973199.qiye.163.com [220.197.31.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C12BC1E1DF0
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 05:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746596170; cv=none; b=iVwI1WX6pv0Qg72Ck3C57MFM/bkfuI4n6fM5GgZNf7MOa9p7lIQPuZcNGRao29URY+abzJV4zx9kVoj5oGbg5W1/FA70KKK50EBfioBGEYpVHGtb29JnKZniEo4Y5fd/8VtS3ljv37nduQz9uVts11zIB+ej16pGfarphyy0qJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746596170; c=relaxed/simple;
	bh=jGUveBK4eIz4xwOE48CEEAtIKxnxhbqMN5bUXji/JiA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YkfJTAqEclJwTjJ4b+skGIGNy5plSoWsaM6xDYkV66DFIi7ZNT2vNHpfz5d33nAmihbLvbV4AfgBLGu0mNJuu542M0ANmDcMjInP6tKI8Q6z81aep58GFzQq4V8IiVmKltEE2wDP+cIMhVQBlrtn1dF0KoXxSFXmaqb5L8GCxeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=jF/+EdMI; arc=none smtp.client-ip=220.197.31.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="jF/+EdMI"
Received: from [192.168.60.65] (unknown [103.29.142.67])
	by smtp.qiye.163.com (Hmail) with ESMTP id 142da0812;
	Wed, 7 May 2025 10:06:54 +0800 (GMT+08:00)
Message-ID: <fad2cf24-0a1b-4408-915c-d42b4c0fcc00@rock-chips.com>
Date: Wed, 7 May 2025 10:06:53 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] phy: rockchip: inno-usb2: Add usb2 phy support for
 rk3562
To: Vinod Koul <vkoul@kernel.org>
Cc: linux-rockchip@lists.infradead.org, Frank Wang
 <frank.wang@rock-chips.com>, William Wu <william.wu@rock-chips.com>,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 linux-arm-kernel@lists.infradead.org, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>
References: <20250415050005.52773-1-kever.yang@rock-chips.com>
 <20250415050005.52773-2-kever.yang@rock-chips.com>
Content-Language: en-US
From: Kever Yang <kever.yang@rock-chips.com>
In-Reply-To: <20250415050005.52773-2-kever.yang@rock-chips.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZH0JIVkpDHRgZH04aHRgZTFYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKS0hVSUJVSk9JVU1MWVdZFhoPEhUdFFlBWU9LSFVKS0lIQkhDVUpLS1
	VKQktLWQY+
X-HM-Tid: 0a96a87ef48203afkunm142da0812
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6ODo6Exw4CDJMKxU#TAJMPlEj
	QilPCzVVSlVKTE9NTkNITUpNSk1JVTMWGhIXVRAeDR4JVQIaFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlKS0hVSUJVSk9JVU1MWVdZCAFZQU9DTUM3Bg++
DKIM-Signature:a=rsa-sha256;
	b=jF/+EdMI4nmUbulrgrZBa0yPqhJRkmugniQD9E/pTaTLrIKpXVZwRqUBG8qLGgVrSAQpm8Lj3Co1y8kmZG0eNZnN7URd2XgOmkMoUYVqtF78QvEpUGoKGyQRCmVS9v+vSmvEO4fAmtEA8IlcvJnA3dSA2pic6tWjm4WEeE5fXQw=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=/sJBeE2+9OLQwGocHXB+4okZ1OhpZYRunOSzRhJR+Cc=;
	h=date:mime-version:subject:message-id:from;

Hi Vinod,

     Do you have any comments for this patch set?

     Please let me know if there is anything need to update.


Thanks,
- Kever
On 2025/4/15 13:00, Kever Yang wrote:
> From: Frank Wang <frank.wang@rock-chips.com>
>
> RK3652 has one USB2.0 PHY with two ports, the OTG port support OTG
> and BC1.2, the SoC provide USB GRF and APB to access the registers.
>
> This adds vbus detection function control and make the below tuning
> to enhance the usb2-phy SQ for RK3562 SoC.
>   - enable pre-emphasis during non-chirp phase
>   - set HS eye height to 425mv
>
> Signed-off-by: Frank Wang <frank.wang@rock-chips.com>
> Signed-off-by: William Wu <william.wu@rock-chips.com>
> Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> ---
>
> Changes in v2:
> - Update the commit msg and collect review tag;
>
>   drivers/phy/rockchip/phy-rockchip-inno-usb2.c | 49 +++++++++++++++++++
>   1 file changed, 49 insertions(+)
>
> diff --git a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
> index b5e6a864deeb..ada1f02601ef 100644
> --- a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
> +++ b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
> @@ -1892,6 +1892,54 @@ static const struct rockchip_usb2phy_cfg rk3399_phy_cfgs[] = {
>   	{ /* sentinel */ }
>   };
>   
> +static const struct rockchip_usb2phy_cfg rk3562_phy_cfgs[] = {
> +	{
> +		.reg = 0xff740000,
> +		.num_ports	= 2,
> +		.clkout_ctl	= { 0x0108, 4, 4, 1, 0 },
> +		.port_cfgs	= {
> +			[USB2PHY_PORT_OTG] = {
> +				.phy_sus	= { 0x0100, 8, 0, 0, 0x1d1 },
> +				.bvalid_det_en	= { 0x0110, 2, 2, 0, 1 },
> +				.bvalid_det_st	= { 0x0114, 2, 2, 0, 1 },
> +				.bvalid_det_clr = { 0x0118, 2, 2, 0, 1 },
> +				.idfall_det_en	= { 0x0110, 5, 5, 0, 1 },
> +				.idfall_det_st	= { 0x0114, 5, 5, 0, 1 },
> +				.idfall_det_clr = { 0x0118, 5, 5, 0, 1 },
> +				.idrise_det_en	= { 0x0110, 4, 4, 0, 1 },
> +				.idrise_det_st	= { 0x0114, 4, 4, 0, 1 },
> +				.idrise_det_clr = { 0x0118, 4, 4, 0, 1 },
> +				.ls_det_en	= { 0x0110, 0, 0, 0, 1 },
> +				.ls_det_st	= { 0x0114, 0, 0, 0, 1 },
> +				.ls_det_clr	= { 0x0118, 0, 0, 0, 1 },
> +				.utmi_avalid	= { 0x0120, 10, 10, 0, 1 },
> +				.utmi_bvalid	= { 0x0120, 9, 9, 0, 1 },
> +				.utmi_ls	= { 0x0120, 5, 4, 0, 1 },
> +			},
> +			[USB2PHY_PORT_HOST] = {
> +				.phy_sus	= { 0x0104, 8, 0, 0x1d2, 0x1d1 },
> +				.ls_det_en	= { 0x0110, 1, 1, 0, 1 },
> +				.ls_det_st	= { 0x0114, 1, 1, 0, 1 },
> +				.ls_det_clr	= { 0x0118, 1, 1, 0, 1 },
> +				.utmi_ls	= { 0x0120, 17, 16, 0, 1 },
> +				.utmi_hstdet	= { 0x0120, 19, 19, 0, 1 }
> +			}
> +		},
> +		.chg_det = {
> +			.cp_det		= { 0x0120, 24, 24, 0, 1 },
> +			.dcp_det	= { 0x0120, 23, 23, 0, 1 },
> +			.dp_det		= { 0x0120, 25, 25, 0, 1 },
> +			.idm_sink_en	= { 0x0108, 8, 8, 0, 1 },
> +			.idp_sink_en	= { 0x0108, 7, 7, 0, 1 },
> +			.idp_src_en	= { 0x0108, 9, 9, 0, 1 },
> +			.rdm_pdwn_en	= { 0x0108, 10, 10, 0, 1 },
> +			.vdm_src_en	= { 0x0108, 12, 12, 0, 1 },
> +			.vdp_src_en	= { 0x0108, 11, 11, 0, 1 },
> +		},
> +	},
> +	{ /* sentinel */ }
> +};
> +
>   static const struct rockchip_usb2phy_cfg rk3568_phy_cfgs[] = {
>   	{
>   		.reg = 0xfe8a0000,
> @@ -2210,6 +2258,7 @@ static const struct of_device_id rockchip_usb2phy_dt_match[] = {
>   	{ .compatible = "rockchip,rk3328-usb2phy", .data = &rk3328_phy_cfgs },
>   	{ .compatible = "rockchip,rk3366-usb2phy", .data = &rk3366_phy_cfgs },
>   	{ .compatible = "rockchip,rk3399-usb2phy", .data = &rk3399_phy_cfgs },
> +	{ .compatible = "rockchip,rk3562-usb2phy", .data = &rk3562_phy_cfgs },
>   	{ .compatible = "rockchip,rk3568-usb2phy", .data = &rk3568_phy_cfgs },
>   	{ .compatible = "rockchip,rk3576-usb2phy", .data = &rk3576_phy_cfgs },
>   	{ .compatible = "rockchip,rk3588-usb2phy", .data = &rk3588_phy_cfgs },
