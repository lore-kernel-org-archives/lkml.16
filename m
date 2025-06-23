Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A8EA149DE8
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 07:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750663821; cv=none; b=Brd5juCJgACKEO+ta5KGHGk6iErcpGIfCdJZzZMTvwrSQMtNvv0MKAtBU7xI3kCT6BMZjqZQ9rGLkg2MUIpzPtLCvUrK3FKwi5C4Aijc1f1WuZZQVBrosw2PRKu8gqTzQavFovGmouTQ+5QLrR3Q0o56FhL8cAD2FCr6WUxgiiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750663821; c=relaxed/simple;
	bh=1H4Bg1xSrIFZOITWzyXEdnXralTg6Df4XFkD/EzqYK4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Uhc/0DJQaX/b53JDhn0TCFrFoVLn+CeLJxP6MUvrtXqcUgxHKa6SlUO4IDs8y6HLOyvJWv+NWR/o43jIS+eMUOCxXw9nH5m3lXeItS/Qd/tuO6bjAQl0aquh4BkRNNoPoh9ge1NgFleRlcVR/wykmXPy82Fe0bnJt2JU4Pvxqmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zmh8NBlJ; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zmh8NBlJ"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a4eed70f24so575841f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 00:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750663818; x=1751268618; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JyX7Id45J55w0I/fP0ufUOPO5FO7kbptXGfhsQYTedw=;
        b=zmh8NBlJ43y+YhVlIOzdEx82ohFYHpmrNJYOsfx7RTzGSJOR4D1yrF1GamsOXuBV59
         yUsfQLWfopbxfhZl0PSIgFBjzR/ywxemqJaMYfvjwLAZzooaMI9/8uHtnhlXnahTVgBO
         mt+gZWv6b40oo3HZaOgaOiu+SNXXYaPj6xnezt9dLIimEk919ivtIxtq+Nf22M9k4Qlo
         HR5srk46NTpMr47ZNGbQ/wWA9BKOiBgdpKpZfXBl3yoxGCezBA4key8KSeT4lik0l95c
         rcmHVU5Eu9isRI7nMdAYsvzR8X8zzP/F6ko0gY8oF8rIOA0AzjeD2lGz/BfXtxBWWbeC
         ea7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750663818; x=1751268618;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JyX7Id45J55w0I/fP0ufUOPO5FO7kbptXGfhsQYTedw=;
        b=i3MRiY1gsJbgp0vF5uYmOpJ9Xa5+ShW/wFmFAhxa1BppHE0wU6grNDnLN4iCct99l7
         hYb6jsWXhKNNBTCWd8PVPZAX5biu0jDkTkb89JJC13pwZKkfCMLuCaxWyQIRI0enf9aG
         ELvQZiJAtJEsBzbTTkSf0wSp8osD01daZl7OPvs1ntzlQHx7Dqx/5gGq+/7TnIPvbppf
         HYnp0KdMx80/s52slBZAZhwWxQPeMr9jRDxtuLo9THDtj8YA+AhX6+8x9kOD2Gv//xLy
         0DOZQt2MSujOyWKyYZui5z5Rt8soRrLOFre7fB1pgQUQ/95OXf5mWYGCvR6zFtnHHFzR
         PT0g==
X-Forwarded-Encrypted: i=1; AJvYcCVjPdyknHZi/T8lR+3Nmwuuxv+EbGqaFjghc9cuT3DfYT1ubXUfv5CrHPpCvJgGEs2Pz60bkYRZ5O3Z68s=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywzw6WkF4P4Taf0dyETLqNpkCbtkRFJktR1hPu0Qx9AHE/xWIQL
	s5WBDuW7bHqNvnXzpjYS0bt4d1WgE77mAfd6gX3HtdR3/4ilo/Eqho7V0y9aerOHIGY=
X-Gm-Gg: ASbGncvG1XBwpA1kG5UQ5gvqoE9BTG3oGHVhD6pP92i/FVvZnc8rmjGLwiG0paeJPcT
	3h8UZRuGmPhKOGqrcED1rwsnZ7fNPApzmcG+2/IqKiwpkJQ3er0WwPC0DS1M0YEfSv+cPOUPuTg
	U4ctD1cyu4tsoA+sRe+zpnQLs1Gn4jSUyr21M8Q7+XYJxbXbkYfUa8WraUwsotkuGESiHXH1eA9
	y2+jCuRE6ZF88UywH7KTsJfHEojtrcwgq7UT6GrfPiV/b84eoFrS+brCGhJdVE0gTPBjwtnWTC4
	tTBwZkz53NrMe+7UrmScdloESpRE/nSph/F9GMIq+kzOYf33XtJc1AtwfVMBToV9pNhAXiWibj3
	oNQzO1dz2kb5roINuag==
X-Google-Smtp-Source: AGHT+IE5sAJn2EldwKQPeiP4adLRE3U5OsQwf6bTownItGgAHFLMi64HBwYJ6D64VqjEns0LJrnYrg==
X-Received: by 2002:a05:600c:3549:b0:43d:fa5e:50e6 with SMTP id 5b1f17b1804b1-453659ddde0mr39535235e9.9.1750663818470;
        Mon, 23 Jun 2025 00:30:18 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453646fd816sm101186905e9.24.2025.06.23.00.30.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 00:30:17 -0700 (PDT)
Message-ID: <16ae3a9e-4ba5-48a0-959c-4c593d1f90b6@linaro.org>
Date: Mon, 23 Jun 2025 09:30:16 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/10] ASoC: dt-bindings: mediatek,mt8196-afe: add
 support for MT8196 audio AFE controller
To: =?UTF-8?B?RGFycmVuIFllICjlj7bpo54p?= <Darren.Ye@mediatek.com>,
 "krzk@kernel.org" <krzk@kernel.org>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 "broonie@kernel.org" <broonie@kernel.org>, "brgl@bgdev.pl" <brgl@bgdev.pl>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>, "tiwai@suse.com"
 <tiwai@suse.com>, "robh@kernel.org" <robh@kernel.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>, "perex@perex.cz"
 <perex@perex.cz>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <20250620094140.11093-1-darren.ye@mediatek.com>
 <20250620094140.11093-9-darren.ye@mediatek.com>
 <011093f8-85a1-4c3c-b3fa-7be9e6df8a25@kernel.org>
 <3562cdd32d6f723a35ed063b65560a8e25801255.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <3562cdd32d6f723a35ed063b65560a8e25801255.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23/06/2025 08:52, Darren Ye (叶飞) wrote:
>>> This patch adds initial support for the audio AFE(Audio Front End)
>>> controller
>>
>> Why this was changed to undesired 'This patch' (see submitting
>> patches)?
>> I think you are circling back to previous versions, reintroducing
>> issues
>> fixed in between.
> 
> Thanks for you feedback. Just to confirm, for the next version, should
> I revert the subject/description back to previous version and only drop
> the document part, whitout making other changes?
> 
> 
> Please see the following change:
> 
> ASoC: dt-bindings: mediatek,mt8196-afe: add audio AFE

Yes

> 
> Add mt8196 audio AFE.

This can be longer, but just read submitting patches regarding preferred
style. Changing to less preferred makes me thinking you did not read
that document.

Anyway, don't send new version just for that.

Best regards,
Krzysztof
