Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C16211282
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 16:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743784994; cv=none; b=qzgBC/StwDZCBy1ePCmD08B91TPhD5AqkzP8FBXXJ9HDmFsOtGUzxCktgT20ufFGhR5w1KY5/m7nClHNRdvKE5m13EsfaVyw7ZWl8A1u2TppEWHe77fq/FXIgaOm1Sb8EnML0X/wmHsWy7Vi4n37ssaHC1bEr6R+krgX2RPRa6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743784994; c=relaxed/simple;
	bh=4h/h5Ey4YkMehMG/YIdYL0cH70WRN3xek869zn7JOjs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QJcL0dk3Rjvpk7TxYb57zX6x0Shvi4j3DTZcWu9jWNyZyuar5EW/MQHDVhCLniFBg5CV2RW288ALvAng/biv7goNghTXSWgsJxzSyno31c3D95INoUu/V34iQZMTw4QYCNwx3iASjyrfhv9LQUkwh62oa1zWqxW1NobZmD7LA+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uPWgwOWg; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uPWgwOWg"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43d0953d3e1so1878835e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 09:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743784990; x=1744389790; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xAGsnLdrspAycxCBxeKM44JqaHnIQt6B7n8T1zYYWxs=;
        b=uPWgwOWgsk3o0w/ihhuR9MqF/8M6stdY6HHoCyuAEq7bzhUmtpSXdP2MkN115kSzOC
         aBlDICzHLvmo50VNn1V07ebwppM1zq78KQ/gyVN0ChWLauzzz/Hs5W7bFsYJmVhmwIH7
         egKtNoz2SRCdQnM9kGymiKDkUKeHxlJTCQ3Wxx0oD8M6XfcPh42/bUD0AxG/81cTnSWJ
         2z6/eO4i3dU9f70cCMgnS2JN1cFfAQZVmEChOyhFGuW7twcH0sv2mY468SycVp49+3XG
         kLQSX10xPVfeugsx4iDjFtiAGW+3LbdavUaJMs+Jpa/dargniEI5ND7xYvKZOpbeajhI
         4dAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743784990; x=1744389790;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xAGsnLdrspAycxCBxeKM44JqaHnIQt6B7n8T1zYYWxs=;
        b=cgFMRlV768F2inuHJt+tKxnyn9WjYePq2/R1TceADHgEboq8ViQTg4fsE/sqQK1PWj
         TKipc25138y90FoDygIwQv72adk/yQa0r7pVJkGBBhFUdItU+NXcwpJCy8Vl8qrOtspt
         PxTsGzSVNR7CvbTkPNNIw1ZrNqianKPDy6yqsEi+2Y/MSigK6imomIpA7OGZ59TktfRA
         lXjB8yAyYzLvvABNLjgiD68vpcCzywl5vkRgKNMgZJzruoJv/Fw0LcPWqYCIMSCGAsnC
         Y2+4VaPEa22HinNgSr7hQxvirABG+s4QJ2Mq2KTeSh71fa877baOiOw/766TbqrNHDTH
         Lc8w==
X-Forwarded-Encrypted: i=1; AJvYcCXrQXiGhgWTTywSB8ZBKb9dD/3QQuH5Ib18JQ9laRNo8sYSu+bM22iC9tkj0vccrX5MISM6VTuV0lnYJgw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUaEq1dGYUzfQ9F/nIc7ied85y80s1kazFo6cHMZ394WEWKowS
	GobxN5O0ee43lgjyDAljQoRKvldmEBY7U8umtXQMY3kneHVTsZcuFI5+5uGs8Jo=
X-Gm-Gg: ASbGncv/P4PDNFh0RDeyvVR1dBSRNxCxuRCLL0poHPCp3K4/TaETEGMGWHBqoigQMEQ
	MjzL5yoEWxsSOLg3N5l8nVkFd2/cx+4yK3pbbj+2CE7WYrcUKIjt31VZws+Z8hWO1zkhTaADG8s
	nZmOB8yQiI0dmRLpmz0TMp/oBUcVPfETIfP3BN80lgc/37AVLgY0PrRVQ7lU4yuWF/5DBWlfV/f
	XgTWWI/+oP43cFKuP+LrHbnSuu9AbLlFVbb2jM4kqMcH9R1S2UNvXVI6ztqoOnhYuc/TrUnPqGq
	kyhPMXcxW6Lx+QXxSj/RrtQR06f9YD76AaAWF30xrDluG3sEn12dwBEHAvpTGrhz
X-Google-Smtp-Source: AGHT+IG2IbUlYSnGQ6rLAHHC6qjUasnOVdNNxP1zU9JNrvGwlwZmuhSUx3coIjZGTA3VjYqWTFYtwQ==
X-Received: by 2002:a05:600c:1d05:b0:43b:c0fa:f9c4 with SMTP id 5b1f17b1804b1-43ecfa03395mr12662335e9.4.1743784990341;
        Fri, 04 Apr 2025 09:43:10 -0700 (PDT)
Received: from [192.168.1.106] ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec34bf258sm50009095e9.23.2025.04.04.09.43.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Apr 2025 09:43:09 -0700 (PDT)
Message-ID: <c5319e0f-6388-4f9a-82dd-526fdeb4ae26@linaro.org>
Date: Fri, 4 Apr 2025 18:43:07 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] clk: sunxi-ng: Do not enable by default during
 compile testing
To: Andre Przywara <andre.przywara@arm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai
 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, =?UTF-8?Q?Emilio_L=C3=B3pez?=
 <emilio@elopez.com.ar>, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-sunxi@lists.linux.dev
References: <20250404-kconfig-defaults-clk-v1-0-4d2df5603332@linaro.org>
 <20250404-kconfig-defaults-clk-v1-4-4d2df5603332@linaro.org>
 <20250404151320.53c4698b@donnerap.manchester.arm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20250404151320.53c4698b@donnerap.manchester.arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/04/2025 16:13, Andre Przywara wrote:
> On Fri, 04 Apr 2025 13:57:00 +0200
> Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
> 
> Hi 
>> Enabling the compile test should not cause automatic enabling of all
>> drivers.  Restrict the default to ARCH also for individual drivers, even
>> though their choice is not visible without selecting parent Kconfig
>> symbol, because otherwise selecting parent would select the child during
>> compile testing.
> 
> so I remember we changed this to "default y", because there were some
> tricky problems with regards to RISC-V and ARM. See commits:
> 
> commit 0ff347db4c97cc16b4e428dc1db550ba3628f1e2
> Author: Samuel Holland <samuel@sholland.org>
> Date:   Sat Dec 31 17:14:25 2022 -0600
>     clk: sunxi-ng: Move SoC driver conditions to dependencies
> 
> and 
> 
> commit a26dc096f683ca27ac5e68703bfd3098b4212abd
> Author: Samuel Holland <samuel@sholland.org>
> Date:   Sat Dec 31 17:14:24 2022 -0600
>     clk: sunxi-ng: Remove duplicate ARCH_SUNXI dependencies
> 
> Don't remember what broke, exactly, but just wanted to give a heads up.
> 
Hm, I missed that. Quite unexpected commits.

I would expect they to change default to match exact case but apparently
for simplicity they became default for everyone? No clue...

Commit says:
" Do not duplicate the same expression on the `default` line, so the two
lines do not need to be kept in sync."
what it did, but not WHY.

Why is the most important thing...

The rest of the commit msg:
"Drivers stay disabled under COMPILE_TEST because of the `default
ARCH_SUNXI` applied to SUNXI_CCU."

is true, until you enable SUNXI_CCU. Then all of them became enabled by
default, which is not necessary and in general not welcomed. You should
compile test only things which you want, not everything.

Best regards,
Krzysztof
