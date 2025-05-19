Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C71835947;
	Mon, 19 May 2025 09:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747645943; cv=none; b=MdFEZ8SoL4g3TvDDvOJHlWBKOA+qeE9xw++u25JslUbu/wsZMQW7BQrO2oHL1a5QHIfU8rrPKuT59x07XyU0lybCOU2ogkfGQeD0viQQMJlLvvPyo1azRMkMYN7dAT8VzapiNuJXztyZbiz8h7mpJLq6lMVeseAjkNxeTW/UewA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747645943; c=relaxed/simple;
	bh=Q/r+/Zon8SsRaNOI0f+eNA796nFcU1p/BFRcYLCCsVM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I8BZ+8D/CtFdl5XaMvm28QvnZj/N12D7V8SDB0kepn1RklB0qbuKVzzWuRCMvDrcUXL8oooljx0TuJrkMoIsDYfMpRoNT72EzB+Ae/VJf6yvRSxe+mhljXqLMR0NkmmOCR3YMEc2UZ6QGSjJcAvceN1A3jtOctitVnwxoT4ycGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YjUT14rl; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YjUT14rl"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5f3f04b5dbcso5917863a12.1;
        Mon, 19 May 2025 02:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747645939; x=1748250739; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LGat+CqdPFtcg5jQSgfD98mPtp2nCHlBED2Mf+O2MZo=;
        b=YjUT14rlS3uc34OXufXnCD2lX/Mj9IdkKiStZN7U1hEQjd+/OxfuxMKqr3FnETZQaC
         EAlJV7sj9oS4HVNj7mLJjkO90SsULA6O/Sx1G1el9UYeIgKoMP61CoKaBid/lmBnDPr1
         vtuQj5NsjHmvdkQf4RppFf59uHKGTlPjP2jTBka3knQT+tdehNlo45ONLRhUJKl5lsFc
         s2BBX4+Z9y3kY75Jd3KVLODMoV9Zi98Gx7Ohl2g93itVJzhfb9kl9q7c6wa2euZ/AAyy
         kYjnP5xXPoYCcgIvchGFXUjhwmMriVtYjhKP5afjzMZp9dLxTXza6ag1hnsFe4eRHTxa
         CZpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747645939; x=1748250739;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LGat+CqdPFtcg5jQSgfD98mPtp2nCHlBED2Mf+O2MZo=;
        b=vUh3a0I1eXvxoGGYLeLLBOyyEIgEear7ZBlwgIaWPMbWGGrByJnAJRtCzowJAWauCw
         UGmawgBIP9apXEmexVLF0LBat32smycBIla+ZfiGyH0lz7I/2n5lAt2WCMwkxYTw914+
         py0wKjM/ykzY3es6y/x448Zd/2SXybtgZ8KcBGkZpItQnBZYUVfyDDb/9WqqJTXKgXXe
         BCh1mMQsrEu58gPVOUOAmWCwVjf+dpk7OO/OIhHLhGOBxbKk46MHmNfyNTqXr9Wy1aKi
         LzEVADlp4IyGpWbKXcKw4GAxM5UBaRtXE6y6YmSj8NHboEHl4uwA7GFAR8VjCxZeacSb
         gTSA==
X-Forwarded-Encrypted: i=1; AJvYcCUVngJNLUyqmVKf90Ys+aX+5KrnXhTjc7VOxdSpSXnV5cXaxEHBNcZJDD0PNVwTDGx0uJUhia4jEV22Hjw=@vger.kernel.org, AJvYcCXDQ3Rb1rZE2+egfS56qifKQ2sgFbgCMAI4mxcz08bMT/3347brevakjii/KTb944TfmjhyfRw5lTOj0zU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOsWrzojdTPTUoFxwrW78pBoZwSTYPQOeqYGuBl/yt5WCaNovj
	6Pa8Bq4MErdpzqs9WmLKKmRI8G12Qo+g8cPaWL7LDdF/ZCUx4tVK1ngb
X-Gm-Gg: ASbGncsFulwQBRU4jS/XI5Ou8F4DFWERzQbqCxxonjRXO+z+azmZ7++4dnVc0Wm2Xj2
	yjcFeHa+qFEfvlWVsUPL8LuvAbz6z+dkBQmvf20e6lhKL0xfTA4sY+N1uJfcDbo6CFdBxdUH64e
	3m+LNPPcUuCBZLkleHXDhlbTAauOoV1FGxASdx2l1wtNTFMXBEItbaXcaDwnfJH1Xx0u+Xz03Hc
	9EGs3jRJsVmNKJEj1D6c0HfoJZPo+pRVupbnvRrVVJygRI2Rhg7xd3wbDDs83FFBLvFiaxrt8f1
	fgWqaLX9QfV4OT4Bx/3VixikuAbd4yiwMOdRaRTkzNdu5ifcJ0Ycc9sTPrUNPPvyldoy+AqLbF2
	wRw==
X-Google-Smtp-Source: AGHT+IFi0xTP9AswLVv6RpQNL+inz9R10asKObEYdcOw+GpNVRxRmF4gLn/+2931Dvys9Ua653cX2g==
X-Received: by 2002:a17:907:7e87:b0:acb:5c83:25b with SMTP id a640c23a62f3a-ad52d42bf0cmr1168206266b.7.1747645939103;
        Mon, 19 May 2025 02:12:19 -0700 (PDT)
Received: from [192.168.5.163] ([92.120.5.12])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d04e665sm557812666b.5.2025.05.19.02.12.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 02:12:18 -0700 (PDT)
Message-ID: <e6d88cbc-accb-4423-80e4-3972766047f4@gmail.com>
Date: Mon, 19 May 2025 12:30:23 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 2/3] ASoC: audio-graph-card2: support explicitly
 disabled links
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
References: <20250515153128.147457-1-laurentiumihalcea111@gmail.com>
 <20250515153128.147457-3-laurentiumihalcea111@gmail.com>
 <874ixltjzw.wl-kuninori.morimoto.gx@renesas.com>
 <0aa11ef6-4166-41d8-98bc-6c7687d10b11@gmail.com>
 <871psls8nw.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-GB
From: Mihalcea Laurentiu <laurentiumihalcea111@gmail.com>
In-Reply-To: <871psls8nw.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 19.05.2025 04:15, Kuninori Morimoto wrote:
> Hi Mihalcea
>
> Thank you for clarify details.
>
>> [snippet from base.dts]
>>
>> 	my_card: card {
>> 		compatible = "audio-graph-card2";
>> 		links = <&l2>; /* here, we're only allowed to specify links that exist */
>> 		routing = "Headphones", "C20",
>> 			  "Headphones", "C21",
>> 			  "Line", "C01";
>> 	};
> (snip)
>> &my_card {
>> 	/* here we're forced to also specify l2 even if this is already done
>>          * in base.dts. This is because DT overlays don't support appending to
>> 	 * properties.
>>          */
>> 	remote-endpoint = <&l0>, <&l1>, <&l2>;
>> };
> This is very nit pickking, but I need to confirm.
> You want to indicate here is this ?
>
> 	&my_card {
> -		remote-endpoint = <&l0>, <&l1>, <&l2>;
> +		links = <&l0>, <&l1>, <&l2>;
> 	};


yes, I'm very sorry for the mistakes....


>
>> &l0_ep {
>> 	remote-endpoint = <&c1_ep>;
>> };
>>
>> &l1_ep {
>> 	remote-endpoint = <&c2_ep>;
>> };
>>
>> c0: codec@0 {
>> 	port { c0_ep: endpoint { remote-endpoint = <&l0_ep>; } };
>> };
>>
>> c1: codec@1 {
>> 	port { c1_ep: endpoint { remote-endpoint = <&l1_ep>; } };
>> };
> This is also nit pickking, but I think above is wrong.
> I guess you want to indicate is...
>
> 	&l0_ep {
> -		remote-endpoint = <&c1_ep>;
> +		remote-endpoint = <&c0_ep>;
> 	};
>
> 	&l1_ep {
> -		remote-endpoint = <&c2_ep>;
> +		remote-endpoint = <&c1_ep>;
> 	};
>
>
> Your are indicating very confusable naming, so I want to understand
> correctly as much as possible.


yep, you're right. Again, very sorry.


>
>>>> 	CODEC A has widgets A0, A1.
>>>> 	CODEC B has widgets B0, B1.
>>>>
>>>> 	my-card {
>>>> 		compatible = "audio-graph-card2":
>>>> 		label = "my-label";
>>>> 		links = <&cpu0_port>, <&cpu1_port>;
>>>> 		routing = "A0", "A1",
>>>> 		          "B0", "B1";
>>>> 	};
>>>>
>>>> 	CODEC A's DT node was disabled.
>>>> 	CODEC B's DT node is enabled.
>>>> 	CPU0's DT node is enabled.
>>>> 	CPU1's DT node is enabled.
> (snip)
>> Assume that we also have BASE1 that is compatible with PLUGIN but
>> C0 and C1 are connected to BASE1's D0 and D5. Since there's no D1-C1
>> connection that means you'll have to create another DT overlay. Thus,
>> the scalability of plugin.dtso decreases.
>>
>> Now, for our particular case, we have BASE0 and BASE1 with the following
>> DAIs and CODECS (these are physically present on the base boards):
>>
>> BASE0 has DAIs D0, D1 and CODEC C0
>> BASE1 has DAIs D0, D1 and CODEC C1
>>
>> Both of these boards are compatible with plugin PLUGIN that has codec C2.
>> The possible DAI links are:
>>
>> For BASE0:
>>
>> D0 <----> C0
>> D1 <----> C2 (only possible with PLUGIN connected)
>>
>> For BASE1:
>>
>> D0 <----> C1
>> D1 <----> C2 (only possible with PLUGIN connected)
>>
>> Since the D1 <---> C2 connection is valid for both BASE0-PLUGIN and
>> BASE1-PLUGIN combinations I think we can make do without the support
>> for explicitly disabled links. But I don't think this is ideal because:
> Let's avoid BASE3 case here to avoid _if_ story.
> You are now indicating too many complex/cofusable situations with wrong
> setting samples (D0/D1/D2..., C0/C1/C2. BASEx has no D1-C1..., etc, etc...)
>
> I noticed that why you need to add disabled Codec routing on BASE DT ?
> It is the reason why you can't detect BASE only sound card, right ?


exactly!!!


>
> 	---- 8< ---- 8< ---- 8< ---- 8< ---- 8< ----
> [snippet from base.dts]
>
> 	my_card: card {
> 		compatible = "audio-graph-card2";
> 		links = <&l2>; /* here, we're only allowed to specify links that exist */
> 		routing = "Headphones", "C20",
> 			  "Headphones", "C21",
> =>			  "Line", "C01";
> 	};
>
> 	---- 8< ---- 8< ---- 8< ---- 8< ---- 8< ----
>
> If my understanding was correct, your system can be indicated like below
> (It is not same as your D0/D1/D2 sample, but I think same things, and
>  not confusable sample)
>
> 	BASE			  PLUGIN
> 	+-----------------+
> 	| CPU0 <-> Codec0 |     +--------+
> 	| CPU1		  | <-> | Codec1 |
> 	| CPU2		  | <-> | Codec2 |
> 	+-----------------+     +--------+


pretty much. The only difference would be that PLUGIN has only 1 codec

in our case. I think it'll be much easier to just stick to your naming conventions...


>
> How it works by below ?
>
> BASE
> 	/*
> 	 * detect CPU0-Codec0 connection only
> 	 * Codec1/2 are disabled, but not related to BASE
> 	 */
> 	my_card: card {
> 		links = <&cpu0>;
> 		routing = "Headphone0", "Codec0"; /* for CPU0-Codec0 */
> 	};
>
> PLUGIN
> 	/* detect all
> 	 * CPU0-Codec0 connection
> 	 * CPU1-Codec1 connection
> 	 * CPU2-Codec2 connection, and its routings */
> 	&my_card {
> 		links = <&cpu0>, <&cpu1>, <&cpu2>;
> 		routing = "Headphone0", "Codec0", /* for CPU0-Codec0 */
> 			  "Headphone1", "Codec1", /* for CPU1-Codec1 */
> 			  "Headphone2", "Codec2"; /* for CPU2-Codec2 */
> 	};


so, the problem with this is the fact that (assuming you've used a DT overlay

for the PLUGIN) you won't be able to use the DT overlay on other boards because

you've also added the "Headphone0", "Codec0" route which is specific to BASE's

Codec0. We have multiple boards so our system would look like this:


	BASE0			  PLUGIN
	+-----------------+
	| CPU0 <-> Codec0 |     +--------+
	| CPU1		  | <-> | Codec1 |
	+-----------------+     +--------+


	BASE1			  PLUGIN
	+-----------------+
	| CPU0 <-> Codec3 |     +--------+
	| CPU1		  | <-> | Codec1 |
	+-----------------+     +--------+


The plugin is the same. The only difference between BASE1 and BASE0 is the fact that CPU0

is connected to Codec0 on BASE0, while, on BASE1, CPU0 is connected to a different codec: Codec3.


>
>
> And/Or your situation is similar as mine (I should have noticed
> about this sooner).
>
> 	d70be079c3cf34bd91e1c8f7b4bc760356c9150c
> 	("arm64: dts: renesas: ulcb/kf: Use multi Component sound")
>
> 	547b02f74e4ac1e7d295a6266d5bc93a647cd4ac
> 	("ASoC: rsnd: enable multi Component support for Audio Graph Card/Card2")
>
> 	45655ec69cb954d7fa594054bec33d6d5b99f8d5
> 	("ASoC: soc-core.c: enable multi Component")
>
> My board is handling above sample as 2 cards, by using "multi Component"
>
> 	BASE			  PLUGIN
> 	+-----------------+			^
> 	| CPU0 <-> Codec0 |			| Card1
> 	|		  |			v
> 	|		  |     +--------+	^
> 	| CPU1		  | <-> | Codec1 |	| Card2
> 	| CPU2		  | <-> | Codec2 |	|
> 	+-----------------+     +--------+	v


one important thing to note here is the fact that we can only

have 1 sound card because all DAIs (CPU0, CPU1, CPU2) belong

to the same component.


>
>
> Thank you for your help !!
>
> Best regards
> ---
> Kuninori Morimoto
