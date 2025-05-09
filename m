Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04220221D94
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 11:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746790568; cv=none; b=IvPZGmiAhyY9N/WLicbfn5zq4XrnWBO5oVlU04mPovjYKoVdotryd1X5ZhFlz3GQ87uLyqm7aSdvyOzuL6o3JMh2uoCbCaUOskNnXHf8DPciysLOtkmb++rpYohweF50lR3hjOAG5546qGaridLoWlKRC2syqaIB/i+pgD1ecBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746790568; c=relaxed/simple;
	bh=xBU++8c6J4fZ4GQ8du/8VqKT/VdxBXVcSwhpuUJudOI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f1sD/h7Nmo12ftVWr624lTMFgDK6iMvPXBIXNegemmoMS12Wfy8IJa1sUNLga1Z7I6HBM7qGfOAUi89BhlJ3bARMvJUDk0Q9MFWC69ZKkCcopxz4Chi/Om8vonphOEp+Yca+Dw7rOV5Yk8VMv+sWAoMhpas6nPtYF+JvPabXmnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W17HQEZf; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W17HQEZf"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-442cd12d28cso348245e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 04:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746790564; x=1747395364; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tPnQGbJY6qzXsG54dxOhAsZfcJwhZhWhqpOSIo2IWUY=;
        b=W17HQEZfKtSyM+JorV5hh8Q+JHQmwajr9KWKaQ5c2PU7SPi46ygPZQ7UGt5rOEP+0w
         26s39da+4ESD2nuTRWFfTRxO0D4yrukmWIu4KR5opDKXJXNVdrFHzuxkMczwPEutqibv
         uy3TAvj/Bk/ZHsvbB4qRYAptifuAjSAj+1Ck1nOL1PfxnqKU1x7oOD/8ORAxtvrB+bCk
         dRPXF0nBiebU691AnEtp/kBWduba5xcs/mK9IYYfB2O1nH+6gl05euiueR9CeMrLUCzy
         E2YDd0EdenCiYE6DpdI4/48oKmed4M755SE7V8UCI4YppXepMo1kES14gkObs3ROixRy
         pu8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746790564; x=1747395364;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tPnQGbJY6qzXsG54dxOhAsZfcJwhZhWhqpOSIo2IWUY=;
        b=gVmkaSRmeaIKUHahroXW65pBP7YR2fujY0I06yqKVDLnoHGihJRoErzHyyIYMPlR3m
         SF3WZAFnAGoGbvZlt8tMgAei6g31ScDdeY6CQNixm3t3aN0Sb+SmRoyP0l+U6uIAnfJg
         5WeEbYpyVXLpI+4LktILbRx0+iIghv2Or2WZDAHGz0V/dI2ewOnhttQucyQk4vwdqUje
         /HOyVyLlV9mP/kopAonZhe5COW4Jkd+6u/JG0bKGJJU4uPzofVWrM80o3G6bHhpdDQOv
         kAnjdjbaL02bHirw0hK18jsOkl64xmZBPINmKQR0xQ5dy16kdGdLqhxBjSvtMDbVjSK5
         iNsQ==
X-Forwarded-Encrypted: i=1; AJvYcCUX3PRYfiicBcXuzpolJ9y8M8IYXTwPD/nv+HrSlJpcSHvnLTpqF7XCI1YfgjMi0a+4AvlbRKIle1yWBiA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzA24pA4XqYC3HR2tDVg0Bsd4uVt5MGaDxD9shI1MqZ6DJ6gycT
	9Osu/Q5FYPli2KsnR9I34EAOcgFvjOsAZl+YrVETCRn3Frp82UsG6Yj/TJDH1mw=
X-Gm-Gg: ASbGncsdCZsdCZGqIEGe3IgKlhHp0y0wY+TEoyZfLRFGzaTCtTliVPM7xpBOFierYKU
	Pmy91WMR9QGGJAIkzd4PuVdCqwJego55/Fj37NTFiZ/EeBjBr3EGhfBwgAymtJDLrK0pO7Z3m5S
	t6s7uJcoMKf8wfXYfoVPSB1jkrF28SQZ55XDEwaHJ62hKhaycDTQUxXCkHVUSEc0sWxs9htpVhm
	L+dhxG0FOfi8sBEzGo2z/xwYYU4RHljy7C4nAeWWea8f1R+cnYin/O8akeCkEIhMwvvB5ISCrh9
	8iR4a9YWo5DwRmz87IS0WynMnccZ2ReHmlUv6fCOS2lsP1KOJxuom8SNPLc=
X-Google-Smtp-Source: AGHT+IEgrPuM7S4VVAaNtLdBoJxKXTA/1M96VqclVtrFn/BtmxjJuTsUGVTrZ8ByY2d+iylVicPD5A==
X-Received: by 2002:a05:600c:5118:b0:439:88bb:d00b with SMTP id 5b1f17b1804b1-442d6dc560cmr7713535e9.5.1746790564255;
        Fri, 09 May 2025 04:36:04 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd32f3c2sm69392795e9.15.2025.05.09.04.36.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 04:36:03 -0700 (PDT)
Message-ID: <4f7b44f0-128c-4615-96cf-2d9d8bc54cdb@linaro.org>
Date: Fri, 9 May 2025 13:36:01 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASPEED: bmc: Add device tree for Meta(Facebook) Clemente
 compute-tray.
To: leo.jt.wang@gmail.com, robh+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, joel@jms.id.au,
 andrew@codeconstruct.com.au, keescook@chromium.org, tony.luck@intel.com,
 gpiccoli@igalia.com, geert+renesas@glider.be, magnus.damm@gmail.com,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, george.kw.lee@fii-foxconn.com,
 leo.jt.wang@fii-foxconn.com
References: <681dc3eb.170a0220.1fd80.c9ce@mx.google.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <681dc3eb.170a0220.1fd80.c9ce@mx.google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09/05/2025 10:59, leo.jt.wang@gmail.com wrote:
> From: Leo Wang <leo.jt.wang@fii-foxconn.com>
> 
> Signed-off-by: Leo Wang <leo.jt.wang@fii-foxconn.com>

Please run scripts/checkpatch.pl on the patches and fix reported
warnings. After that, run also 'scripts/checkpatch.pl --strict' on the
patches and (probably) fix more warnings. Some warnings can be ignored,
especially from --strict run, but the code here looks like it needs a
fix. Feel free to get in touch if the warning is not clear.

Please use subject prefixes matching the subsystem. You can get them for
example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
your patch is touching. For bindings, the preferred subjects are
explained here:
https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters

You CC-ed an address, which suggests you do not work on mainline kernel
or you do not use get_maintainers.pl/b4/patman. Please rebase and always
work on mainline or start using mentioned tools, so correct addresses
will be used.


...

> +&io_expander13 {
> +	gpio-line-names =
> +		"rmc_en_dc_pwr_on","",
> +		"","",
> +		"","",
> +		"","",
> +		"leak_config_0","leak_config_1",
> +		"leak_config_2","leak_config_3",
> +		"mfg_led_test_mode_l","small_leak_err_inj",
> +		"large_leak_err_inj","";
> +};
> \ No newline at end of file

You have patch warning.

Best regards,
Krzysztof
