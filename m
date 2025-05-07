Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D624542A83;
	Wed,  7 May 2025 18:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=85.215.255.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746641470; cv=pass; b=WPQPw5GAzMqW2z7NTH0MvihkDtlm0V5K5j3L+eJSuOYRMA09Iyrdd+OVrNtxJb1nXXQKTqcvodZr/QcfBJy1z+eCGov/ZFu0MJUWK3gsCo0e0yTLvW/gmxDU1NzCII7kZP549qabZyXfUqyVuntPoTQkgNXsWJwDjJ1pzEPpbpA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746641470; c=relaxed/simple;
	bh=2fYc++GxrQbRKUHUVDPQ0cPMAxB2NQzkCqCJoy3Sx74=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XG7bFqUjeS1SdSiDHRTii9sLBkD9in2YwVTmSUSWbqulvX5vFq9hEA6pqdEJUZkS2gpLLTB/q9pXYSKxvkCC7AUoAjX82yHuSJmcog6n5+cPSp1fAsdgl7E86NOwP6KQoomnMmSwSohPClZlwT7hvARJk9CoyE3tg8ICjWG/uac=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fossekall.de; spf=pass smtp.mailfrom=fossekall.de; dkim=pass (2048-bit key) header.d=fossekall.de header.i=@fossekall.de header.b=ojboSf2Y; dkim=permerror (0-bit key) header.d=fossekall.de header.i=@fossekall.de header.b=pFk43Txh; arc=pass smtp.client-ip=85.215.255.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fossekall.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fossekall.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fossekall.de header.i=@fossekall.de header.b="ojboSf2Y";
	dkim=permerror (0-bit key) header.d=fossekall.de header.i=@fossekall.de header.b="pFk43Txh"
ARC-Seal: i=1; a=rsa-sha256; t=1746641458; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=jA3kpDt+x4BQhR3Yyf+rpaPdOF0IrjuD0tuTACzzdzBWdhq+4YZ86qSBQtOCpMxoWv
    KSMK8mN4VPzFpk1RZ6hd/Ho2COOMdV/VFg44d8XoBfQ6XM6scGBuwCJoeLjkOpUVrnka
    bTXRmnuUJ0C2C1IUdmao6NRmEfl33qh1Ubz/4k80i4Igib+XV9U2Orkv7Ti9mR19v8GD
    fhmg/8Yti/WJvyzBVgY6l8lCtj8lo1fp1NKkD0b/moyWzIJ2FGvEUX4ViLIBosu8psiS
    yXloWo1TAYpAJLmKVyGm/bjKMNJzry3H4kdJeJ2dI8tNByIYNewyv6vx3+DnWMgi7359
    VRsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1746641458;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=gZoi91yF78+gC6gLDup+tsCPW9jBL45JepbeQZDf8AA=;
    b=TcsCk1zjVh2ABRNf11gWSjK08dYZaiS3vlkoAqEtmuoHtAMARAHI3jVTTs9ld0THo4
    olUELGHgfCxF6Gjecm1equZKi+Zy4DZu3OVTul9lEvvVG4JQZvl35kLsFk8SKSViXINm
    jjKCJGx6RSzAyWDu2sUzxu6r+ZaWXfiNIu7LdcBh2r5HNE7i6Oen52xeI02/Lr9k1DL1
    hpaRos1GVrdvu2kR4d8RH3fSsqxk0zVIsALTXZyUjO+25KLz5iNhwb3q3xIESYloLtz+
    Uu+kFCim/jodA/kyO1dVXtC3UD0LK19ZGEQvsQQ5mhHg/3v8lL9pcT85KAHFJfp6YGcw
    p5FA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1746641458;
    s=strato-dkim-0002; d=fossekall.de;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=gZoi91yF78+gC6gLDup+tsCPW9jBL45JepbeQZDf8AA=;
    b=ojboSf2Y4LpnoYzXKlc2k+J2ePJmo5G0YEXX5gw0zA/Q44g6/h761lLOgwX1/HqBpy
    v+wxlKvodOArV8Yr/XINlpIMrhlqt+RgF5SNmjaAJ1FTGYSWLhQxb2EPhvlFFz7ELzt8
    l3VMntcizaety1Ikx56i82+04QG9c2IEcaGNGF8c35FzmBMqsdX00R/f/JLY62x4JDBE
    1/cTEO/P5b4yE06BSxs7iVUuWfILhw99Dxw0aUWrfTdqFd+G78sY1AWX3Bf50GjFgDku
    Pt465M2Z8g+4TeigAeaBBNAYv1law5g2JzZ+Yi07+xg2hskcJr2SiW946JFJv6kv0N46
    KEUw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1746641458;
    s=strato-dkim-0003; d=fossekall.de;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=gZoi91yF78+gC6gLDup+tsCPW9jBL45JepbeQZDf8AA=;
    b=pFk43Txh55pzhUfBPaC55GVze7SLFg87CRvyt6yTKddUqM6PRkTog05dovucUFzjjj
    AvaHFaUP2mfNWLP6bAAA==
X-RZG-AUTH: ":O2kGeEG7b/pS1EzgE2y7nF0STYsSLflpbjNKxx7cGrBdao6FTL4AJcMdm+lap4JEHkzok9eyEg=="
Received: from aerfugl
    by smtp.strato.de (RZmta 51.3.0 AUTH)
    with ESMTPSA id f28b35147IAuGKx
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Wed, 7 May 2025 20:10:56 +0200 (CEST)
Received: from koltrast.home ([192.168.1.27] helo=a98shuttle.de)
	by aerfugl with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <michael@fossekall.de>)
	id 1uCjEO-0002f6-0e;
	Wed, 07 May 2025 20:10:56 +0200
Date: Wed, 7 May 2025 20:10:54 +0200
From: Michael Klein <michael@fossekall.de>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: bananapi: add support for PHY LEDs
Message-ID: <aBuiLpqURnxQ1t07@a98shuttle.de>
References: <20250506195524.601268-1-michael@fossekall.de>
 <CAGb2v671wD7y6n6n20BrhH-pcTGD8RzPp25gCWUtnFmRhh=naw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGb2v671wD7y6n6n20BrhH-pcTGD8RzPp25gCWUtnFmRhh=naw@mail.gmail.com>

On Thu, May 08, 2025 at 12:45:28AM +0900, Chen-Yu Tsai wrote:
>On Wed, May 7, 2025 at 4:56 AM Michael Klein <michael@fossekall.de> wrote:
>>
>> The Bananapi M1 has three LEDs connected to the RTL8211E ethernet PHY.
>> Add the corresponding nodes to the device tree.
>
>I see from old emails that this was supposed to be updated? And if you
>didn't, then his patch should be marked as a "RESEND", so tooling doesn't
>get confused and ignore it.

Thank you for the reminder. Yes, the commit message was supposed to be 
updated. I'll follow up.

Michael

>I'll wait a couple days in case anyone else wants to take a look.
>
>ChenYu
>
>> Signed-off-by: Michael Klein <michael@fossekall.de>
>> ---
>>  .../boot/dts/allwinner/sun7i-a20-bananapi.dts | 27 +++++++++++++++++++
>>  1 file changed, 27 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/allwinner/sun7i-a20-bananapi.dts b/arch/arm/boot/dts/allwinner/sun7i-a20-bananapi.dts
>> index 46ecf9db2324..d8b362c9661a 100644
>> --- a/arch/arm/boot/dts/allwinner/sun7i-a20-bananapi.dts
>> +++ b/arch/arm/boot/dts/allwinner/sun7i-a20-bananapi.dts
>> @@ -48,6 +48,7 @@
>>
>>  #include <dt-bindings/gpio/gpio.h>
>>  #include <dt-bindings/interrupt-controller/irq.h>
>> +#include <dt-bindings/leds/common.h>
>>
>>  / {
>>         model = "LeMaker Banana Pi";
>> @@ -169,6 +170,32 @@ &ir0 {
>>  &gmac_mdio {
>>         phy1: ethernet-phy@1 {
>>                 reg = <1>;
>> +
>> +               leds {
>> +                       #address-cells = <1>;
>> +                       #size-cells = <0>;
>> +
>> +                       led@0 {
>> +                               reg = <0>;
>> +                               color = <LED_COLOR_ID_GREEN>;
>> +                               function = LED_FUNCTION_LAN;
>> +                               linux,default-trigger = "netdev";
>> +                       };
>> +
>> +                       led@1 {
>> +                               reg = <1>;
>> +                               color = <LED_COLOR_ID_AMBER>;
>> +                               function = LED_FUNCTION_LAN;
>> +                               linux,default-trigger = "netdev";
>> +                       };
>> +
>> +                       led@2 {
>> +                               reg = <2>;
>> +                               color = <LED_COLOR_ID_BLUE>;
>> +                               function = LED_FUNCTION_LAN;
>> +                               linux,default-trigger = "netdev";
>> +                       };
>> +               };
>>         };
>>  };
>>
>> --
>> 2.39.5
>>
>>
>

-- 
