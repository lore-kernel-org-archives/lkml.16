Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com [91.218.175.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA2A86359
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 16:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747412926; cv=none; b=jnTy1BmzB0L2d3aPmVhoyIpkBfjDtdEsH1WfFzTm0Ok3yfce5URbnTggexeLrLWBeSZaKRm6tMJVTJz7/2gkhNBYv50UlsVUhmj92ATw2sKE8hW2ykwFsSVYkww4y9not/csvproQuAkeNRVLig0Y5lsIdXIPKciFp7yTnmY9z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747412926; c=relaxed/simple;
	bh=l1hJxCiMyS2OCmQV33/MV2GcJcREQrWs73uL8V/uelA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=oac0R2dmQ5idVsjP4PfqtSkNonn4Mi4ac+Lab2cFi6IacDaTC9YGRFwfM04Rzd8Tm5V5A1fiyujr3dpSQUQeSjN9JojOXWQ0YtGwvrogwYzW9fwh25A2DPFSWh8FPWwblvfzDJQUw8J7x6/vd5vDwNospc0qwH55CncKI7qmpRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org; spf=pass smtp.mailfrom=cknow.org; dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b=yHS+a95q; arc=none smtp.client-ip=91.218.175.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b="yHS+a95q"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1747412921;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=si+6so3E4lQIUUBkcJ18BhMSwUXfb7BiWBnbg3/5fd0=;
	b=yHS+a95qmmToOInVPx43MXnz71HkBxazS2EVN3QCqAB0iN4/QnfGlNV+yPE5CUQ3Z5KfM3
	0vacidYJGsvGiH8WMJWpiXP7RIrU7sknI8OMomAHDWeh7ZBHAzxOxI32gD7Uq6cizqImFq
	J9qwOCJK3UOXvCZtLQqLTcWCxd2u/hpa0G9sRYsUWlSbvEikc7zIAq0d4QTURwb8HPQWTv
	kk8q6/BfvPjgk+PjIza3pDNGwyY+58i8zzypQRgxo25qkmkVWYJqW9pUh6KZwsBJ6QyrF5
	bqdlnuRnGvobNk8N9weVsZWTsvfTuJI8ydpAMCRhw71j0v7ydoorCwC85VWY8w==
Content-Type: multipart/signed;
 boundary=2a1f0776b31dfb19db50a4c0755eae34fad21a6c0baa4ca8dc5831fba976;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Fri, 16 May 2025 18:28:27 +0200
Message-Id: <D9XQ6FEVLTFF.6FEVFO840FYQ@cknow.org>
Cc: <linux-phy@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] phy: phy-rockchip-samsung-hdptx: Fix PHY PLL output
 50.25MHz error
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>, "Algea Cao"
 <algea.cao@rock-chips.com>, <vkoul@kernel.org>, <kishon@kernel.org>,
 <heiko@sntech.de>, <andy.yan@rock-chips.com>
References: <20250427095124.3354439-1-algea.cao@rock-chips.com>
 <D9XP2BH2CU02.1R9E1GSXQD9JB@cknow.org>
 <9e29ef0e-c373-4f48-8f37-7111987d2dd0@collabora.com>
In-Reply-To: <9e29ef0e-c373-4f48-8f37-7111987d2dd0@collabora.com>
X-Migadu-Flow: FLOW_OUT

--2a1f0776b31dfb19db50a4c0755eae34fad21a6c0baa4ca8dc5831fba976
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Cristian,=20

On Fri May 16, 2025 at 6:02 PM CEST, Cristian Ciocaltea wrote:
> On 5/16/25 6:36 PM, Diederik de Haas wrote:
>> On Sun Apr 27, 2025 at 11:51 AM CEST, Algea Cao wrote:
>>> When using HDMI PLL frequency division coefficient at 50.25MHz
>>> that is calculated by rk_hdptx_phy_clk_pll_calc(), it fails to
>>> get PHY LANE lock. Although the calculated values are within the
>>> allowable range of PHY PLL configuration.
>>>
>>> In order to fix the PHY LANE lock error and provide the expected
>>> 50.25MHz output, manually compute the required PHY PLL frequency
>>> division coefficient and add it to ropll_tmds_cfg configuration
>>> table.
>>>
>>> Signed-off-by: Algea Cao <algea.cao@rock-chips.com>
>>> Reviewed-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>>>
>>> ---
>>>  drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 2 ++
>>>  1 file changed, 2 insertions(+)
>>>
>>> diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/driver=
s/phy/rockchip/phy-rockchip-samsung-hdptx.c
>>> index fe7c05748356..77236f012a1f 100644
>>> --- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
>>> +++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
>>> @@ -476,6 +476,8 @@ static const struct ropll_config ropll_tmds_cfg[] =
=3D {
>>>  	  1, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
>>>  	{ 650000, 162, 162, 1, 1, 11, 1, 1, 1, 1, 1, 1, 1, 54, 0, 16, 4, 1,
>>>  	  1, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
>>> +	{ 502500, 84, 84, 1, 1, 7, 1, 1, 1, 1, 1, 1, 1, 11, 1, 4, 5,
>>> +	  4, 11, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
>>>  	{ 337500, 0x70, 0x70, 1, 1, 0xf, 1, 1, 1, 1, 1, 1, 1, 0x2, 0, 0x01, 5=
,
>>>  	  1, 1, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
>>>  	{ 400000, 100, 100, 1, 1, 11, 1, 1, 0, 1, 0, 1, 1, 0x9, 0, 0x05, 0,
>>=20
>> I found this patch in the 'fixes' branch in linux-phy:
>> https://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy.git/commit=
/?h=3Dfixes&id=3Df9475055b11c0c70979bd1667a76b2ebae638eb7
>>=20
>> In the 'next' branch in linux-phy, I found this commit:
>> 0edf9d2bb9b4 ("phy: rockchip: samsung-hdptx: Avoid Hz<->hHz unit convers=
ion overhead")
>> https://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy.git/commit=
/?h=3Dnext&id=3D0edf9d2bb9b4ba7566dfdc7605883e04575129d9
>>=20
>> Where the values in ropll_tmds_cfg are converted from hHz to Hz and the
>> data type changes from u32 to unsigned long long.
>> But AFAICT it does NOT convert this '502500' value, which IIUC means
>> most values are in Hz, while this one is in hHz.
>>=20
>> Am I missing something or should this new value also be converted?
>
> Yeah, the conversion is necessary. FWIW, this has been already fixed by
> Stephen Rothwell in linux-next, while Vinod will handle it before
> sending the PR:
>
> https://lore.kernel.org/all/aCXEOGUDcnaoGKWW@vaman/

Excellent. Thanks for the explanation :-)

Cheers,
  Diederik

--2a1f0776b31dfb19db50a4c0755eae34fad21a6c0baa4ca8dc5831fba976
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCaCdnsgAKCRDXblvOeH7b
bvW7AQDSfcraP5FPLqmJrWKe64CLK6ifVw5O8f7Yi2FT8tSXhgEAw6hnZJ9JTDyD
/GjaqlgnqB5uiJH+H0E1H+TWSuLztQU=
=hAWm
-----END PGP SIGNATURE-----

--2a1f0776b31dfb19db50a4c0755eae34fad21a6c0baa4ca8dc5831fba976--
