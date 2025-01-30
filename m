Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E21823E499
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 10:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.28.215.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738231941; cv=none; b=Cfgu4VFMox+WcfaMN2/GTyXYJlfttznIVGVBPRdfqM6BS11ZPbqh/4DD9TW2i3FTNKtxDOvCHpkt29Nkpyr4M2Fl4f40L647DjKmeTe4Odjw7RTpxwBB0YERHHBdg3FbqKSdcWx5tr9CN00M6bvCukr6wVyCs5/6V2C8EomCW2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738231941; c=relaxed/simple;
	bh=F7g9urDSo2gh1/7xk29iX4OpEjOCuBNvg0QolHW5r6k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DFrco6ohjNm1/n33XMSw+kxQpv7H80ONbQlhKT17S1UH0vloVV5WHeeb7pKS5vYSiObUySPR/4Ak00/glr9yArBfYQlYXld28425Ivt0gqgo2ZvQgnSgfI0qJv+ZiiTLaqnvrnaxMtseIvzlPWzjC5Dn8dvpb7ILicUmUE1aUSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=k9x63Ayu; arc=none smtp.client-ip=149.28.215.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="k9x63Ayu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1738231936;
 bh=Eu1Z9k4wJekCuZOVs1VhxTjEeWIJaUEXFXoJpGq7hdc=;
 b=k9x63Ayuvqxv/S6ts7K/sWrWvQLTbKkKgoY3zRNHwdIT5JSh+dbDFvbxVLFdGbitoJCEm8lux
 AsHz6nGyi2jj3oi2juu9PjGtbKhcHp/trl2ydHkvZJ33tVkdydMHqIWB9lhET7zkPSlutsgod5v
 XtMZTxmM7m8tj/rTx/Qno9FWv9tsRIVqJ2yOTDK7Iu/7MXQausysVcdqZkuz+dbPQwTS7JbecKr
 KZiKA4RKsrg56Hsu0bWRRL37jIbmJBOvKBJDSzvSl/cCW2NRtbzLTA+yv5hcN+KsIGizWzBQP6B
 eGX4WiRIeWAcUsNnKl7xgSYCFuGb2gjU+OBEShqOJyhw==
X-Forward-Email-ID: 679b5070280758b5b084a089
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 0.4.40
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <2dc894c4-8114-4f6a-9ac2-e32655564a64@kwiboo.se>
Date: Thu, 30 Jan 2025 11:11:54 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] phy: rockchip: naneng-combphy: compatible reset
 with old DT
To: Vinod Koul <vkoul@kernel.org>, Chukun Pan <amadeus@jmu.edu.cn>
Cc: Heiko Stuebner <heiko@sntech.de>, Philipp Zabel <p.zabel@pengutronix.de>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Jianfeng Liu <liujianfeng1994@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250106100001.1344418-1-amadeus@jmu.edu.cn>
 <20250106100001.1344418-2-amadeus@jmu.edu.cn> <Z5sUusWDCfFFeh0f@vaman>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <Z5sUusWDCfFFeh0f@vaman>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Vinod,

On 2025-01-30 06:57, Vinod Koul wrote:
> On 06-01-25, 18:00, Chukun Pan wrote:
>> The device tree of RK3568 did not specify reset-names before.
>> So add fallback to old behaviour to be compatible with old DT.
>>
>> Fixes: fbcbffbac994 ("phy: rockchip: naneng-combphy: fix phy reset")
>> Cc: Jianfeng Liu <liujianfeng1994@gmail.com>
>> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
>> ---
>>  drivers/phy/rockchip/phy-rockchip-naneng-combphy.c | 5 ++++-
>>  1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c b/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
>> index a1532ef8bbe9..8c3ce57f8915 100644
>> --- a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
>> +++ b/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
>> @@ -324,7 +324,10 @@ static int rockchip_combphy_parse_dt(struct device *dev, struct rockchip_combphy
>>  
>>  	priv->ext_refclk = device_property_present(dev, "rockchip,ext-refclk");
>>  
>> -	priv->phy_rst = devm_reset_control_get(dev, "phy");
>> +	priv->phy_rst = devm_reset_control_get_exclusive(dev, "phy");
>> +	/* fallback to old behaviour */
>> +	if (PTR_ERR(priv->phy_rst) == -ENOENT)
>> +		priv->phy_rst = devm_reset_control_array_get_exclusive(dev);
> 
> That is not *same* behaviour on fallback, why _exclusive() for the
> fallback?

Prior to the commit fd3ac6e80497 ("dt-bindings: phy: rockchip: rk3588
has two reset lines") the dt-binding did not require reset-names and it
still does not for the rockchip,rk3568-naneng-combphy compatible. The
binding documentation also mentioned "exclusive PHY reset line" for the
resets prop.

The commit fbcbffbac994 ("phy: rockchip: naneng-combphy: fix phy reset")
broke backward compatibility with the rockchip,rk3568-naneng-combphy
compatible by requiring existence of a "phy" in reset-names.

This patch restores the old behavior prior to fbcbffbac994 ("phy:
rockchip: naneng-combphy: fix phy reset") when
devm_reset_control_array_get_exclusive() was used to restore
compatibility with the rockchip,rk3568-naneng-combphy dt-binding.

Regards,
Jonas

> 
>>  	if (IS_ERR(priv->phy_rst))
>>  		return dev_err_probe(dev, PTR_ERR(priv->phy_rst), "failed to get phy reset\n");
>>  
>> -- 
>> 2.25.1
> 

