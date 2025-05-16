Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EBAE1E871;
	Fri, 16 May 2025 12:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747398739; cv=none; b=FZe1C4r6yXpFPgUNHdW5QlkOqYp685gOi6CpmqxSImVrz8aHMDn/w9Qukw5HdrQ5jzlUT7vYTTbmRVVxorO38gcCzAczHcDnWv4al+DGnV1GFccwZKNO4kVwcZayzWiwVv8Ov3OBR/g63MzK4YNwXrbEPaoadJZlVU2OTV1yrRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747398739; c=relaxed/simple;
	bh=vz8e+4t88j8l0kTGU0H6UiRUgiWoi0o8ZwWhaWnHA5Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VRKH3fFYYwi7hqMl4DwKeS0lezV9CbS0hTy35Ds9iuoz+BXlKP+BhD9Dm3yLW6ko2QuPWP0gSMTZssC4mxGWmwA+QW4isbccrOK62GyvsgBQWz8aKHZHwqBgFGz/or81eZJo8GUGm2emkGZAjuOdR1lgUT99Q3I1x9TrnTT+b/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BUj0IFk2; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BUj0IFk2"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-601956fa3beso56591a12.0;
        Fri, 16 May 2025 05:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747398736; x=1748003536; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9VjB+mgTWPBjKCY5An5NLA0HaWKUbup+xoRGJGQX42M=;
        b=BUj0IFk2ymSkaGrBREtK8QusYKvt/teepvYFolLdVkgsnHYZasTKQiso/EkwNMpMmS
         aaLq/k90kro8Q4RJCu7tPWFgi6Zm0fXlBsji8b0QrWOQjjvsOFp9QS91ki2bPJwPWM0n
         EA+X2Ot1W+Ep1N5gOvVbdmubMe39YYmMqADQRnFYS8B2kKRh8XyUXgxIjmkonT/fF44B
         VCn+80QnNEJrLcRc+mE3kYzbXi+HwzBlalOG8V/PuDGrebZDo4xzbS81pLnc8emo+cUC
         3VVB3Z6ReocLk9smYV/6vVyBGvfqYlQ0vplDRkWi+7LAsdpKPa8CEdYNmsE8V+07laHz
         m9Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747398736; x=1748003536;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9VjB+mgTWPBjKCY5An5NLA0HaWKUbup+xoRGJGQX42M=;
        b=DUiLngR5vQvYMOZXJKLKmZLXiAaGyf5MhoFLDEXtS97aHcYeIIapqVvssWxjhcSp9e
         G9Xu9gaXGBeEmsyJS5PkV72wIlXIydRdkRy7Skl9gxQasQBLi8kKLw6lDuKZ7LpxidfE
         ZI+09yzyinC1bMFAA6ofW2HGLSiOzZ5desriwQids5knBQY49rKwl0A0B7i5yaWIUL/r
         Jt1D9gDUvKHSrrp10fHHePokt0S/Pj9kx8RXGmvnDbR6gs/YQHeAlrQfZd460DPXwvAk
         ZL0pRr7n9lukxN+oF3frlun4S3S/6z4hY2fjC45yjw4tRLmIVQPWVY0aX8HeWK1O/1QG
         hkEA==
X-Forwarded-Encrypted: i=1; AJvYcCXP1OF75ZYsNfdtYli5uBWh8yvv3KDetdDO0oYtEKBXytW7AJcS94oUStKyfa4SRuXq8/h2Pd8/r3xC6fQ=@vger.kernel.org, AJvYcCXZGTEHd7ZwmcL26hK+Lwj7OX2AZ82fQM84xu5QlMJjnBE0/R6aA08/GBPaQrAma0CBvP0JwbRvjhj1DTc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxj9Ijx/Ginw/+/R5Fxjh+owk65VoeWa/ndgqwaTUoker7jgxal
	abaVvXIisQrXNngBI+k7BU2211b5wN9CkQrgIqJx/KgkAIwQof5ClFCDeoXb8Q==
X-Gm-Gg: ASbGncu1xUBvGU0vMitPa/g3mqW9RbhL+5UIMj7jpGrG8lTGAd5B48jQtFBiy4tY0sB
	7ixpoBUOMve/WZIwEB/fjayUuE+RBWRqdIKBGFPVOcX/e6o6jv+t4VQC6zTFnjparpYjt+8U4PS
	2fFQFfJ9L+hPTrWWIPYvwlEPNoeI7T/irUGKW/1XYYsiFiM27mjuzO3ui/eZJwUxt7n6JQG9Jyv
	GoARfk5VEjhyS+kzXnOWAZSS6tpJJTzIXeKrwx2W1k/871g/yJHEoII+Z/yeZ3W/HYEq1h/gaTB
	HX4LB0OLGxncU8aE3JYbyDUx46StlD4Hwl8PJXCTeG5kYjl+295qogHkKLWT2qNqeIBeKUc1QJU
	GF4vPzeQ=
X-Google-Smtp-Source: AGHT+IGZNd7gvcuPjF8am/ru/x51t5U1lJDJNKBy7Lvh9bT8GVBMZoyoacJgZIR9HZAUTZWB81JrCQ==
X-Received: by 2002:a17:907:868e:b0:ad5:22c0:f5f1 with SMTP id a640c23a62f3a-ad52d5a97e7mr316285566b.50.1747398735260;
        Fri, 16 May 2025 05:32:15 -0700 (PDT)
Received: from [192.168.6.174] ([92.120.5.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d04f263sm152842266b.1.2025.05.16.05.32.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 May 2025 05:32:14 -0700 (PDT)
Message-ID: <0aa11ef6-4166-41d8-98bc-6c7687d10b11@gmail.com>
Date: Fri, 16 May 2025 15:50:02 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 2/3] ASoC: audio-graph-card2: support explicitly
 disabled links
Content-Language: en-GB
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
References: <20250515153128.147457-1-laurentiumihalcea111@gmail.com>
 <20250515153128.147457-3-laurentiumihalcea111@gmail.com>
 <874ixltjzw.wl-kuninori.morimoto.gx@renesas.com>
From: Mihalcea Laurentiu <laurentiumihalcea111@gmail.com>
In-Reply-To: <874ixltjzw.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 16.05.2025 04:36, Kuninori Morimoto wrote:
> Hi Laurentiu
>
> Thank you for the patch
>
>> An explicitly disabled link is a DAI link in which one of its device
>> endpoints (e.g: codec or CPU) has been disabled in the DTS via the
>> "status" property. Formally speaking:
>>
>> 	OF_LINK_IS_DISABLED(lnk) = OF_NODE_IS_DISABLED(dev0) ||
>> 	                           OF_NODE_IS_DISABLED(dev1);
>>
>> where dev0 and dev1 are the two devices (CPU/codec) that make up the
>> link.
>>
>> If at least one link was explicitly disabled that means DAPM routes
>> passed through the OF property "routing" can fail as some widgets might
>> not exist. Consider the following example:
>>
>> 	CODEC A has widgets A0, A1.
>> 	CODEC B has widgets B0, B1.
>>
>> 	my-card {
>> 		compatible = "audio-graph-card2":
>> 		label = "my-label";
>> 		links = <&cpu0_port>, <&cpu1_port>;
>> 		routing = "A0", "A1",
>> 		          "B0", "B1";
>> 	};
>>
>> 	CODEC A's DT node was disabled.
>> 	CODEC B's DT node is enabled.
>> 	CPU0's DT node is enabled.
>> 	CPU1's DT node is enabled.
>>
>> If CODEC A's DT node is disabled via the 'status = "disabled"' property
>> that means the A0 -> A1 route cannot be created. This doesn't affect the
>> B0 -> B1 route though as CODEC B was never disabled in the DT.
>>
>> This is why, if any explicitly disabled link is discovered, the
>> "disable_of_route_checks" flag is turned on.
>>
>> If all links were explicitly disabled the sound card creation will fail.
>> Otherwise, if there's at least one link which wasn't explicitly disabled
>> then the sound card creation will succeed.
>>
>> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>> ---
> I think I could understand your situation, but the solution (= this patch) is
> too much complicated for me. Indeed it might detect disabled device, but some
> board might want to detect it as error, unlike your case.


that is true. One problem with this solution is the fact that you can't

really distinguish between links that were intentionally disabled (see example

from RFC's cover letter) and links that were accidentally disabled (e.g. user

forgot to set 'status = "okay"' for one of the link's devices)


>
> You want to add "disable_of_route_checks" flag to the card, right ?
> How about to add new property, like "force detect xxx", or
> "DAI might not be detected", etc, etc, etc...
>
> If we can have such property, it will be more simple code.
>
> 	if (it_has_flag("force_detect_xxx")) {
> 		dev_info(dev, "xxx");
> 		card->disable_of_route_checks = 1;
> 	}


well, I think the solution is made up of 2 parts:

    1) the part that allows link devices to be disabled

    2) the part that allows routes to fails


what you're suggesting is dropping the first part and going with just the second one.

The problem I see with this (let's assume we have the BASE-PLUGIN example presented

in the RFC's cover letter) is that:

    1) You'll have to specify the links inside of PLUGIN's DT overlay (instead of BASE's DTS)

    2) You'll have to do the link connection part inside PLUGIN's DT overlay.


So, our example DTS and DT overlay would look like this:


[snippet from base.dts]

	my_card: card {
		compatible = "audio-graph-card2";
		links = <&l2>; /* here, we're only allowed to specify links that exist */
		routing = "Headphones", "C20",
			  "Headphones", "C21",
			  "Line", "C01";
	};

	d0: cpu@0 {
		l0: port { l0_ep: endpoint { /* connected when plugin.dtbo is applied */ } };
	};

	d1: cpu@1 {
		l1: port { l1_ep: endpoint { /* connected when plugin.dtbo is applied */ } };
	};

	d2: cpu@2 {
		l2: port { l2_ep: endpoint { remote-endpoint = <&c2_ep>; } };
	};

	c2: codec@2 {
		port { c2_ep: endpoint { remote-endpoint = <&l2_ep>; } };
	};


[snippet from plugin.dtso]

&my_card {
	/* here we're forced to also specify l2 even if this is already done
         * in base.dts. This is because DT overlays don't support appending to
	 * properties.
         */
	remote-endpoint = <&l0>, <&l1>, <&l2>;
};

&l0_ep {
	remote-endpoint = <&c1_ep>;
};

&l1_ep {
	remote-endpoint = <&c2_ep>;
};

c0: codec@0 {
	port { c0_ep: endpoint { remote-endpoint = <&l0_ep>; } };
};

c1: codec@1 {
	port { c1_ep: endpoint { remote-endpoint = <&l1_ep>; } };
};

Assume that we also have BASE1 that is compatible with PLUGIN but
C0 and C1 are connected to BASE1's D0 and D5. Since there's no D1-C1
connection that means you'll have to create another DT overlay. Thus,
the scalability of plugin.dtso decreases.

Now, for our particular case, we have BASE0 and BASE1 with the following
DAIs and CODECS (these are physically present on the base boards):

BASE0 has DAIs D0, D1 and CODEC C0
BASE1 has DAIs D0, D1 and CODEC C1

Both of these boards are compatible with plugin PLUGIN that has codec C2.
The possible DAI links are:

For BASE0:

D0 <----> C0
D1 <----> C2 (only possible with PLUGIN connected)

For BASE1:

D0 <----> C1
D1 <----> C2 (only possible with PLUGIN connected)

Since the D1 <---> C2 connection is valid for both BASE0-PLUGIN and
BASE1-PLUGIN combinations I think we can make do without the support
for explicitly disabled links. But I don't think this is ideal because:

1) If we ever need to support board BASE3 that is compatible with PLUGIN
and uses Dn != D1 to connect with PLUGIN's C2 codec then we're going to
either modify our devicetrees (to make plugin.dtso applicable to BASE3
as well) or add another DT overlay (not really desirable because we already
have a lot of devicetrees). (note: more of an _if_ situation. Don't think we
can actually use this as an argument. I just wanted to have this out in the
open)

2) People might get confused when looking at the "links" and "routing"
properties. Now, "links" will only contain links that actually exist, while
"routing" can contain widgets from codecs that don't exist on the base board.
(note: perhaps not a deal breaker? again, just wanted to have this out in the
open)


Either way, I believe your concern is valid. This new feature adds a lot of
extra code and validating it is a pain. Still, even if we go with just the
extra DT property as you suggested I believe this is a step forward so I think
we can go with that for now and see how well this scales.


BTW, thanks a lot for taking the time to review this huge series!!

> Thank you for your help !!
>
> Best regards
> ---
> Kuninori Morimoto
