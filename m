Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFCF22A1A4
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 16:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747411376; cv=none; b=LgNolh3076NfQYxzxJoBC1M9GSDbbEKhKKX9Z0LYo3HWljXFfZV510GW9fP8x6be1t8zlMOL1G51OZ2+pGIvcFh9wnPrd5tUOQxkWpofC1ZIgH0RNHQnG1V1pTn8NQggJHtdx4uCXjn2FhEc524wxgao+v1upA0Ac4Ov59crRNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747411376; c=relaxed/simple;
	bh=2sRpjTjXUI2i074c5+izzfCmO5OrPoSU+VPMCR9Tems=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E8DvFntXQiT5IGfUZ3V8ZW/9lsJnCCp0Xemcuuidogh4GbKN9/y2FEPsOxZQM8Oj5kcSMA7vG0YpyjkQZu3fGyin9SPANK0kJHV29axz0sIG1LxeldrozVqSi88i7dqivRVrexrM5P3tDNN7+1OUAcgFBMzhX5uem8uZET2elU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=JvFL2HNW; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="JvFL2HNW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1747411372;
	bh=2sRpjTjXUI2i074c5+izzfCmO5OrPoSU+VPMCR9Tems=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JvFL2HNWYLPg3wIq9VGjlr8j7PGoNnrPsL7NLMjEbTcnr+A9T5w2t1xfLVdStnWFe
	 xPcKE9VEX3T/qyg7PsLJpZcn5vf+SWJFp3y3d9BoqQaVHbgoA7Fbd2vt8zqz2JQD1a
	 SO+IvTLLUsxs6ljvQ2BGVDYt1OGHvJ0bo6ITkl/fkVs99atWXVT0uTmBMDL8zluUyB
	 8MGFvFVH2nXLI5J37vxShVzoAMNfeCa8HrCUV3Dsd5ymg+KZDU/CoJbM++bLUxjBKy
	 B9HALIY/CnPzin2CvKocUrKPwNwRAMEuszvAc+Zz4zR0iHHZ4meZPvZHo5lPASNUMG
	 WHiR8SeMKSNNw==
Received: from [192.168.1.90] (unknown [82.76.59.134])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4B63817E07C9;
	Fri, 16 May 2025 18:02:52 +0200 (CEST)
Message-ID: <9e29ef0e-c373-4f48-8f37-7111987d2dd0@collabora.com>
Date: Fri, 16 May 2025 19:02:51 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] phy: phy-rockchip-samsung-hdptx: Fix PHY PLL output
 50.25MHz error
To: Diederik de Haas <didi.debian@cknow.org>,
 Algea Cao <algea.cao@rock-chips.com>, vkoul@kernel.org, kishon@kernel.org,
 heiko@sntech.de, andy.yan@rock-chips.com
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250427095124.3354439-1-algea.cao@rock-chips.com>
 <D9XP2BH2CU02.1R9E1GSXQD9JB@cknow.org>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <D9XP2BH2CU02.1R9E1GSXQD9JB@cknow.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Diederik,

On 5/16/25 6:36 PM, Diederik de Haas wrote:
> Hi,
> 
> On Sun Apr 27, 2025 at 11:51 AM CEST, Algea Cao wrote:
>> When using HDMI PLL frequency division coefficient at 50.25MHz
>> that is calculated by rk_hdptx_phy_clk_pll_calc(), it fails to
>> get PHY LANE lock. Although the calculated values are within the
>> allowable range of PHY PLL configuration.
>>
>> In order to fix the PHY LANE lock error and provide the expected
>> 50.25MHz output, manually compute the required PHY PLL frequency
>> division coefficient and add it to ropll_tmds_cfg configuration
>> table.
>>
>> Signed-off-by: Algea Cao <algea.cao@rock-chips.com>
>> Reviewed-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>>
>> ---
>>  drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
>> index fe7c05748356..77236f012a1f 100644
>> --- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
>> +++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
>> @@ -476,6 +476,8 @@ static const struct ropll_config ropll_tmds_cfg[] = {
>>  	  1, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
>>  	{ 650000, 162, 162, 1, 1, 11, 1, 1, 1, 1, 1, 1, 1, 54, 0, 16, 4, 1,
>>  	  1, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
>> +	{ 502500, 84, 84, 1, 1, 7, 1, 1, 1, 1, 1, 1, 1, 11, 1, 4, 5,
>> +	  4, 11, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
>>  	{ 337500, 0x70, 0x70, 1, 1, 0xf, 1, 1, 1, 1, 1, 1, 1, 0x2, 0, 0x01, 5,
>>  	  1, 1, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
>>  	{ 400000, 100, 100, 1, 1, 11, 1, 1, 0, 1, 0, 1, 1, 0x9, 0, 0x05, 0,
> 
> I found this patch in the 'fixes' branch in linux-phy:
> https://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy.git/commit/?h=fixes&id=f9475055b11c0c70979bd1667a76b2ebae638eb7
> 
> In the 'next' branch in linux-phy, I found this commit:
> 0edf9d2bb9b4 ("phy: rockchip: samsung-hdptx: Avoid Hz<->hHz unit conversion overhead")
> https://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy.git/commit/?h=next&id=0edf9d2bb9b4ba7566dfdc7605883e04575129d9
> 
> Where the values in ropll_tmds_cfg are converted from hHz to Hz and the
> data type changes from u32 to unsigned long long.
> But AFAICT it does NOT convert this '502500' value, which IIUC means
> most values are in Hz, while this one is in hHz.
> 
> Am I missing something or should this new value also be converted?

Yeah, the conversion is necessary. FWIW, this has been already fixed by
Stephen Rothwell in linux-next, while Vinod will handle it before
sending the PR:

https://lore.kernel.org/all/aCXEOGUDcnaoGKWW@vaman/

Regards,
Cristian
