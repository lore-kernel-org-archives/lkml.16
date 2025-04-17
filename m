Received: from mxout4.routing.net (mxout4.routing.net [134.0.28.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8E352206BD;
	Thu, 17 Apr 2025 07:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.0.28.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744876378; cv=none; b=PtAx5aBIKaQajAFmfcXY380DZfxDep9532lEl2smUYNCMeRoO0vHsPitJKZwMWAmHnskqWNIUNOF1UV+hwnUqpqS/MkTRwRcI3uq1NgLVOIrVNTve0iPfmS3COu1sNEtogkKy1NsQbLBClJ/nMZ0MCLpo6sxGh8aVvvm96ujANE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744876378; c=relaxed/simple;
	bh=Se+Pb5gvAeaBxEvyD3+E41BEMYCQFUvRfuCjMCS7ljI=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=aRjRJBqDcPtOON21TeYax5192/p6VJTy5GZCoFbqptSORzfhcMvpb6pwQXIfXG2TShXLvE7qgrP+gs5e3uAFg1y/c6N40YFq9+nlghdMMNcswASITlOC39Ron4V3chpW4PXY6R+Shwx5xeOg3Iof9gTqN4YEr5Fv6YVBnYsCRMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de; spf=pass smtp.mailfrom=fw-web.de; dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b=xN4EnJrd; arc=none smtp.client-ip=134.0.28.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fw-web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b="xN4EnJrd"
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
	by mxout4.routing.net (Postfix) with ESMTP id A4E8A1008FA;
	Thu, 17 Apr 2025 07:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1744876372;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q82aXZ96SkZQkHH0ZlbXPXUKG4cthRJar29R9w4dfJE=;
	b=xN4EnJrdVeEEGXY1Uw/cWRtXIx7OgNpTRak8FB9wUaT8xQr96zt6iiIs4H9BNit/k7AFpA
	b/qa0UTAJVIKjhaGbOTXYxIEWwUqXAj2F399mutRq8k0GBh+apnsVIRCShTmXp9AtFQk/0
	oZ53q8OoA7fc3ycuuJLtOCKM6Kzq6aE=
Received: from webmail.hosting.de (unknown [134.0.26.148])
	by mxbox3.masterlogin.de (Postfix) with ESMTPSA id C3E213605AA;
	Thu, 17 Apr 2025 07:52:51 +0000 (UTC)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 17 Apr 2025 09:52:51 +0200
From: "Frank Wunderlich (linux)" <linux@fw-web.de>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, Chunfeng Yun
 <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, Kishon Vijay
 Abraham I <kishon@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Frank
 Wunderlich <frank-w@public-files.de>, =?UTF-8?Q?Rafa=C5=82_Mi=C5=82eck?=
 =?UTF-8?Q?i?= <rafal@milecki.pl>, Daniel Golle <daniel@makrotopia.org>, Sean
 Wang <sean.wang@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH v3 4/8] dt-bindings: phy: mtk-xs-phy: support type switch
 by pericfg
In-Reply-To: <20250417-competent-rattlesnake-of-intensity-98d6ff@kuoka>
References: <20250416095402.90543-1-linux@fw-web.de>
 <20250416095402.90543-5-linux@fw-web.de>
 <20250417-competent-rattlesnake-of-intensity-98d6ff@kuoka>
Message-ID: <d2da81ccb6b9b267288a3d2f5b1bb977@fw-web.de>
X-Sender: linux@fw-web.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Mail-ID: ffcf56f2-7a7a-4451-b290-b3cd6b547b72

Hi Krzysztof,

thanks for review.

basicly i used the same binding like for tphy.

Am 2025-04-17 08:56, schrieb Krzysztof Kozlowski:
> On Wed, Apr 16, 2025 at 11:53:56AM GMT, Frank Wunderlich wrote:
>> From: Frank Wunderlich <frank-w@public-files.de>
>> 
>> Add support for type switch by pericfg register between USB3/PCIe.
>> 
>> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
>> ---
>>  .../devicetree/bindings/phy/mediatek,xsphy.yaml  | 16 
>> ++++++++++++++++
>>  1 file changed, 16 insertions(+)
>> 
>> diff --git a/Documentation/devicetree/bindings/phy/mediatek,xsphy.yaml 
>> b/Documentation/devicetree/bindings/phy/mediatek,xsphy.yaml
>> index 3b5253659e6f..5033d77c1239 100644
>> --- a/Documentation/devicetree/bindings/phy/mediatek,xsphy.yaml
>> +++ b/Documentation/devicetree/bindings/phy/mediatek,xsphy.yaml
>> @@ -151,6 +151,22 @@ patternProperties:
>>          minimum: 1
>>          maximum: 31
>> 
>> +      mediatek,syscon-type:
>> +        $ref: /schemas/types.yaml#/definitions/phandle-array
>> +        maxItems: 1
>> +        description:
>> +          A phandle to syscon used to access the register of type 
>> switch,
>> +          the field should always be 3 cells long.
>> +        items:
>> +          items:
> 
> Missing -, because you have one phandle.

ok, then i need to drop MaxItems and indent 2 spaces more, but no 
problem

>> +            - description:
>> +                The first cell represents a phandle to syscon
> 
> Don't repeat constraints in free form text. "Foo bar system controller"
> or "Phandle to foo bar system controller"

i would write only "phandle to system controller". on mt7988 it is the 
topmisc syscon, but maybe on
other SoC it is different name.

>> +            - description:
>> +                The second cell represents the register offset
> 
> "Baz register offset"

same here, only "register offset".

>> +            - description:
>> +                The third cell represents the index of config segment
> 
> "Index of config segment", but what is index of config?

unfortunately we have no detailed documentation here, but based on 
driver (i guess daniel ported it
from SDK) this value is multiplied with BITS_PER_BYTE so it can handle 
up to 4 config-segments in
the 32bit register (maybe configuring 4 phys). But on mt7988 we use only 
the first config-segment
(last cell=0 in dts-patch).

at the end it will look like this:

       mediatek,syscon-type:
         $ref: /schemas/types.yaml#/definitions/phandle-array
         description:
           A phandle to syscon used to access the register of type 
switch,
           the field should always be 3 cells long.
         items:
           - items:
               - description:
                   Phandle to system controller
               - description:
                   Register offset
               - description:
                   Index of config segment
                 enum: [0, 1, 2, 3]

would this be ok?

> Best regards,
> Krzysztof

regards Frank
