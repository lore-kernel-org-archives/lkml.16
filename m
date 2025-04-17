Received: from mxout2.routing.net (mxout2.routing.net [134.0.28.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 855D1229B1A;
	Thu, 17 Apr 2025 09:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.0.28.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744882505; cv=none; b=UkMb3E0XKWtvTFMCGmP+NB6t/nLQr/VIHjDBACocW9slUFSZd9VaUrvYcbhpG9ein0kTKiaYfhSXky4SShxWJ3SVMDpI+nCCUM2EhZDkB4ww7jaj3vgGrycwJdoJtPanfxdhGh8jF+06JgELX3DxcpZo/RxXr8THOyF0m3a/Ox8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744882505; c=relaxed/simple;
	bh=LscmuqaZON/XGTxe02U2DdWPh5Oj32TKOPp8x1HkAOQ=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=mc+DjhCmX9/6SwGJCpvfsCK7lddOO/hjs3l0mpxTgB/i4dU2CJLMwmCVMFMVXhXF2U691KBiw4oDd55DL61yXpOQBkXadglK/i42monNQiFB9slBpGir/DC8FMOwe402pkVT2hkNXmoYuzGe8dpkszfW7tGCemna++AKgOEEfEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de; spf=pass smtp.mailfrom=fw-web.de; dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b=wFDyNzYg; arc=none smtp.client-ip=134.0.28.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fw-web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b="wFDyNzYg"
Received: from mxbox1.masterlogin.de (unknown [192.168.10.88])
	by mxout2.routing.net (Postfix) with ESMTP id 37E595FDE7;
	Thu, 17 Apr 2025 09:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1744882501;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kKEFfy22Ovcnvkpz67OvpKpbb8xNVHKeALBqrUjpiLg=;
	b=wFDyNzYg1F9BxMYJkyYCP+a3ZIXfZiRk5I12m2dwgUUHCeHitJo2vZnmEAwA0xtFcV0rC9
	l470vX/M1F1rLFuKb000aTbOlGYC71jXSo0nqF7TD6X6KNvdVkzMtKvARBQMb3LwpeL3pS
	tvq07rfpyOyCEWdpBObo77XsjYhg/BQ=
Received: from webmail.hosting.de (unknown [134.0.26.148])
	by mxbox1.masterlogin.de (Postfix) with ESMTPSA id 5DEBB40089;
	Thu, 17 Apr 2025 09:35:00 +0000 (UTC)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 17 Apr 2025 11:35:00 +0200
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
In-Reply-To: <caf3da77-f35d-4a39-9102-9592d722d900@kernel.org>
References: <20250416095402.90543-1-linux@fw-web.de>
 <20250416095402.90543-5-linux@fw-web.de>
 <20250417-competent-rattlesnake-of-intensity-98d6ff@kuoka>
 <d2da81ccb6b9b267288a3d2f5b1bb977@fw-web.de>
 <caf3da77-f35d-4a39-9102-9592d722d900@kernel.org>
Message-ID: <b59ccb4541f4eac24fd38a65de770c8c@fw-web.de>
X-Sender: linux@fw-web.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Mail-ID: 3fd65e47-3ca8-4c33-8858-deb75b092cd6

Am 2025-04-17 09:59, schrieb Krzysztof Kozlowski:
> On 17/04/2025 09:52, Frank Wunderlich (linux) wrote:
>>>> 
>>>> +      mediatek,syscon-type:
>>>> +        $ref: /schemas/types.yaml#/definitions/phandle-array
>>>> +        maxItems: 1
>>>> +        description:
>>>> +          A phandle to syscon used to access the register of type
>>>> switch,
>>>> +          the field should always be 3 cells long.
>>>> +        items:
>>>> +          items:
>>> 
>>> Missing -, because you have one phandle.
>> 
>> ok, then i need to drop MaxItems and indent 2 spaces more, but no
>> problem
> 
> I missed that maxItems - should not be placed above description, but
> immediately around items.

dt_binding_check complains about maxItems should not be set when having 
only 1 item ;)
so i dropped it in my current version completely.

>> 
>>>> +            - description:
>>>> +                The first cell represents a phandle to syscon
>>> 
>>> Don't repeat constraints in free form text. "Foo bar system 
>>> controller"
>>> or "Phandle to foo bar system controller"
>> 
>> i would write only "phandle to system controller". on mt7988 it is the
>> topmisc syscon, but maybe on
>> other SoC it is different name.
> 
> This must be specific to what sort of system controller you point. You
> are not interested in phandle to any system controller.

how about phy configuration controller/register?

>> 
>>>> +            - description:
>>>> +                The second cell represents the register offset
>>> 
>>> "Baz register offset"
>> 
>> same here, only "register offset".
> 
> Also not. You need specific register, not any register.
> 
> 
> Best regards,
> Krzysztof
