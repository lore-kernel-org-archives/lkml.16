Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA95A256C9F;
	Wed, 21 May 2025 11:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747828625; cv=none; b=nPQx0G4pwANIRhZuZ8tyT9T9BkdH72CmntWlN99HMkjA1AtKr8kg93fcm24AtdRM/HtG5klyLf53idYISEVrjfzbuae8aW8d3v4am6/d7T+JHu83GEcTgE13essgDp6AlOa63OOSxCzwaID2t1zaf1Ltl9kWwGy0alcPiWrKpmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747828625; c=relaxed/simple;
	bh=H7tka3wJf1QGS7YJfOe3so9uCmt6OfTvEwQrEsDXtMQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mc/i0e5DA9XAD8GL6zq0xASvA6ufGKIaE5ACAb29eE+c9TVkhqmRxXDQsws2xtbdEA0vlPebi6wNU+7DBtWrDuvOCqRu6LKfyfn7+F7rxxZzzrcD2uoMeJ9QS62pAfZkRC7YnFzqZszmnTU9hs2Pe/+pjq4LCBpsP8u1XAAKmN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dYaScVOV; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dYaScVOV"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6019b564d0bso8606208a12.2;
        Wed, 21 May 2025 04:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747828622; x=1748433422; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/adlGvCb5MNbmrGHbVV4yYng8LO7Mr1poA+A93TwMjI=;
        b=dYaScVOVOcawFjoWu1BRGaXsyKTLDiXC3r+XngTfaunOlLKKYZ3rg7n/tl0AZpg/Z5
         lCQbkh3vgjCXjJO7K4aCr+r+tth4wXCaf1BK85QIsCmF+CmK4Ob44FrwL8JvEKx64Enc
         QWmQKXIBc3Do9tDgm65yIAVzypOYF7653dvyc9g7q82xVJ+VBNXtfkJ6n4zjAW/Wo7aP
         Hdbd2L4Vbnuy9Z9R4fUloyLRMY4PaAbjXNGNN2T/N34sVWGb6LzX63uv11lKL710gnQE
         AyBjeYxCP0m7y6m8Z5C11hTO85AJizO/BcKNzOe8jzOlrn1bK7mpv9NOPBQfUf4cFQGK
         bs/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747828622; x=1748433422;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/adlGvCb5MNbmrGHbVV4yYng8LO7Mr1poA+A93TwMjI=;
        b=QrJ42TsksQE/HvqvzW3plN4/kDteuS0Xn8v+qaNw9/kLYO0Lf/yaEwkhUHC3nlUyiA
         MPocbFpxkUtNcyrEh24Bxp3eBsNQGqF3ZE/R2cXs2P/Ll+7f+AdX08xkMcdlWRHHRsAl
         96+ts1oJAM3Gt1pPKPsB9GjLPUsTq6FgQgqqLgIBcAqqC4uJovUIW2E+zD4LahtoPWvb
         FRkJu5u/4J2XtyLDOKOBYQIKTSofPJkCeZxfSfziN/dTcaf1vFWrispkMAYCv30Ke5bw
         5EyITU0TTD3Ul9/RU7v10Hrb3AaioUfHjG+/A5JFWNpAPgttO2xCpJ9QDFQlG6vc2Hys
         EV4A==
X-Forwarded-Encrypted: i=1; AJvYcCWrXGdefaxG+fXl+I9Bp5AIOpExMA0swAayZngwkOMURrd5dNU/2Pk4S/fEtMdXGHGW+w22/sELrAo5ExM=@vger.kernel.org, AJvYcCXeSUDD/CVDc/lgrHXogg//HO1XASe4CDCD5rBPVAHQ/WYJyCcHb5rWNXcitcGj/7DH8vYwwuI/nTPzpBM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyw1Be0aeCHJz43l/FRM5xVltUjNZy7oR7GQtRJRTECvJFEtXbY
	Le+i3x1DWS7QOFMbG4nCFbOrBIIbI5vgww3YMVja5hPVuhEAfu8ZRSy0
X-Gm-Gg: ASbGncsENYBhn6CZgBAFhV1wavBJk2kQeo9ykxBuju84epKuroLdms/R1ps5MdEaGNm
	8HE8esDrDbntKT43/EifP7jmP/8wuMjqZJUELvqa3i7qqHKQJiCF7NSMPRIvIKuN2FKu4gZ+TUQ
	x+oHUN00odgomnUWSlJI+ctHHngw/lrEQpK1b+ws0+JCZdFUjZzCgy69M1sqAuMnh7hoL2enkQf
	LQRgmDpLSO/iRB0pjYOoco0gBkKddDJ5KfsoIKulc6zRcmM47kmE7/bxYUePMfWpC49BlaIDlaQ
	vsJEshdPzV6UFDa0ClzBxoiVa/jFwLn52s6JfTbLpufMAZtS5jzDsl0kV3wiBOpZy4VC0ikpn8V
	fQ1W5
X-Google-Smtp-Source: AGHT+IHK39Que8B/UTnefmzsZ6iu5J25oa/W4ZeUS/rX0JY6r8nQ4BS0ZCOq1nZC475b0yOL+2dKvA==
X-Received: by 2002:a17:907:3f1c:b0:ad5:5b2e:655b with SMTP id a640c23a62f3a-ad55b2e7968mr1186993666b.25.1747828621936;
        Wed, 21 May 2025 04:57:01 -0700 (PDT)
Received: from [192.168.5.82] ([92.120.5.1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad53603a369sm845847866b.47.2025.05.21.04.57.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 04:57:01 -0700 (PDT)
Message-ID: <fc2cbb54-58aa-4362-9b84-20df510b9038@gmail.com>
Date: Wed, 21 May 2025 15:15:20 +0300
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
 <e6d88cbc-accb-4423-80e4-3972766047f4@gmail.com>
 <87o6vonmjw.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-GB
From: Mihalcea Laurentiu <laurentiumihalcea111@gmail.com>
In-Reply-To: <87o6vonmjw.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 20.05.2025 03:38, Kuninori Morimoto wrote:
> Hi Laurentiu
>
>> so, the problem with this is the fact that (assuming you've used a DT overlay
>> for the PLUGIN) you won't be able to use the DT overlay on other boards because
>> you've also added the "Headphone0", "Codec0" route which is specific to BASE's
>> Codec0. We have multiple boards so our system would look like this:
>>
>> 	BASE0			  PLUGIN
>> 	+-----------------+
>> 	| CPU0 <-> Codec0 |     +--------+
>> 	| CPU1		  | <-> | Codec1 |
>> 	+-----------------+     +--------+
>>
>>
>> 	BASE1			  PLUGIN
>> 	+-----------------+
>> 	| CPU0 <-> Codec3 |     +--------+
>> 	| CPU1		  | <-> | Codec1 |
>> 	+-----------------+     +--------+
>>
>>
>> The plugin is the same. The only difference between BASE1 and BASE0 is the fact that CPU0
>> is connected to Codec0 on BASE0, while, on BASE1, CPU0 is connected to a different codec: Codec3.
> Ah, OK, that it the reason why you added the route on BASE side...


exactly!


>
> Hmm... I think my previous suggested idea (new flag) is reasonable, but you
> mentioned that you want to check whether it was "disabled" or not.
> So, how about to add "plugin-route" and "plugin-links" instead ?
>
> BASE
> 	my_card: card {
> 		links = <&cpu0>;
> 		routing = "Headphone0", "Codec0"; /* for CPU0-Codec0 */
> 	};
>
> PLUGIN
> 	&my_card {
> 		plugin-links = <&cpu1>, <&cpu2>
> 		plugin-routing = "Headphone1", "Codec1", /* for CPU1-Codec1 */
> 		^^^^^^		 "Headphone2", "Codec2"; /* for CPU2-Codec2 */
> 	};
>
> Audio Card2 parses "links" + "plugin-links", and
> "routing" + "plugin-routing". It is more intuitive ?


hm, I believe this _should_ work. I also think that we can just drop the whole

"ignore_route_check" flag idea since you can just use "plugin-routing" in

your DT overlay to specify the CODEC-specific routes (instead of having

them in your BASE DTS). This way, you'll avoid having routes that might

not exist in your BASE DTS.


if we go for this though I think we need to clarify the usage of the

"plugin-links" and "plugin-routing" properties. For me, these properties

only make sense if you use them in a DT overlay to add additional links/routes

introduced by the PLUGIN board. This is basically a workaround the fact

that DT overlays don't support appending to the properties of the BASE

DTS.


also, I believe we can drop the whole "explicitly disabled links" idea

since IMO, links passed via the "plugin-links" property _must_ exist.


anyhow, I will have test out this new idea on our particular scenario and see

how well it works. Thank you very much for this discussion! It was really, really

helpful!


>
>>> 	BASE			  PLUGIN
>>> 	+-----------------+			^
>>> 	| CPU0 <-> Codec0 |			| Card1
>>> 	|		  |			v
>>> 	|		  |     +--------+	^
>>> 	| CPU1		  | <-> | Codec1 |	| Card2
>>> 	| CPU2		  | <-> | Codec2 |	|
>>> 	+-----------------+     +--------+	v
>> one important thing to note here is the fact that we can only
>> have 1 sound card because all DAIs (CPU0, CPU1, CPU2) belong
>> to the same component.
> Indeed it depens on the CPU side driver style.
> I have updated my driver to allow to be multi components by checking DT.
>
> I'm not sure which one (= use plugin-xxx flag or use multi Cards) is
> more intuitive, but supporting both is not bad idea ?
>
> Thank you for your help !!
>
> Best regards
> ---
> Kuninori Morimoto
