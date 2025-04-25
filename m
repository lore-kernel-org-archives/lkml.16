Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B761626AC3
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 10:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745575619; cv=none; b=pAoGmpy6WsWQGlH77jQxuKNFxNkKTc05FHU/I7OGkz53mVeYOiX/Shv2bGFBN5M2jspHG9tjQ+vmRcsnyS9QtqPd8LBvV3dLK9PhJpaRq3eZd6zY12p6ioaN6EEYAqRfKda4XBQsrziQSLBppmwvEspsmo+dy+ci6pJHRNik2LU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745575619; c=relaxed/simple;
	bh=obu+Qt9zPoq9Pg2EOlGvIr3eXjoQttpGQqYbnKED+rE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JD029XJ/eNO0h9N+7amEIUxyWtYAYtZyRpxA5bK8Dh71gs5si9nADzIRbVXAI5TwhElV+DloNUeXKisG2I++J725GC55ThX1za5GBwA+mgSLkkbWsfyNtjFnFwdik03qeRdrpd8xjB4D67lRl4vDrwsoZTnvsXqqWu4EqUs3b4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tX9XKfF7; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tX9XKfF7"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43cf3192f3bso18172045e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 03:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745575616; x=1746180416; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CJc4EEGZ5NPCdipsMsCOV+mhzV5z2YlJ4t595WgVtEw=;
        b=tX9XKfF7rl4zBkbO74LE69pIe31YkQV55gtGz0e0dQyEtA/ChN0OH4kK59xjM7b4IP
         RjLXZpZx0x6mIdTEK6tVNF7NgnePoBSWy0MUdO6fruaLXrP/bFwpnRKbTkRPd6XVk9Wl
         kg9S8DbbgyYBEoQOcI0V86ab7TsOLyYEJ6spNyMdx5WOW2lRaT54WJdjCCJBmldif/o8
         uCe99kKzirSler/QOBecAONB1y1VHm2c6whXlKo1PvIgJrb4cMfQ8ZTt6dG+1ISxP7cc
         Zzo/0mKB+s935dIjT3jAGABz2lnwNRz3IZByapVF0yeEo1h8YNaTpzSVCSHBgN7siasw
         qlFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745575616; x=1746180416;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CJc4EEGZ5NPCdipsMsCOV+mhzV5z2YlJ4t595WgVtEw=;
        b=ic2iZdKa7r4nRRUVicYkk+WTE6P/c+NH5eFKSgO8alriZq5LmzFJzIb7rGY+Wt3gn8
         ACmb9mBC8d+urfMLEUWxFSmvXAZKw5taBYl2BQT3jccyCv2X5a4dwQYjnqijQC2QEwDq
         xAaTdAvtjGmJ9vVauH6hYmfGViPPSQDQK3D/iJlrYs5PvpLAGi2QZ0EUjeQhbphswvdB
         +zVXrcSJ4qt9kY8iiJbBZsZyf7j/STNrORTfUWerogUbhhfW6o/DFVRF3u+/nA1MV9h/
         CV3f4VwbmKp3wz2bBSECNZgVhno1TzugB+t8MSZVlf6alj/YIL9gcalEnt245l1f1hm1
         qfgA==
X-Forwarded-Encrypted: i=1; AJvYcCVywdf57wmwSeLB3YYbrK5QT9pA0A1cTjyORnLbGDvaI2Wq84TVO2jOfgeUrxgkTfYgW7NtN0t1P4WkCKs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyP+q1DoHsfj1Y6dtzzrBbLdhcczlCo2q+oxlI1520k3FFHGmYr
	KAB1UPGcwh8aC5S9HxHeWqW+65L07nGJ+eByqPAJvlcqlCKcF7bW8jkN5nUdnp0=
X-Gm-Gg: ASbGncvSb1baPaNUOFFkDKZHnRlNga4YmqQyhM0onHl6ZufcKpQ564R7SkUMbe/zfxR
	OSTUa/mbOLl6x6vggU1E7pBMYk3rb8w/gVtWjAI/giFIRNvoRpCrDzAeNyjkAqo7GKJe9eisC7Y
	0D4fWerAdlfKWMGpU8uwOu9VGjPLay4FwZokpJIAqCNVKP7WL268X6LDG+C0LBeZfJ1LXNiIJyA
	KA8wc8n8UVbipDrwc0HLwklXJFqlysc2O1gSKqwlldFeEUYkXkpOf8kPtt380oxlfm8RfT4VZRG
	Si0EzfXwZHfHNhLUjF2O38fbLJ5MhO75+dhyY1dmBZOziInpqW6K5Nj8yv+kiDr9DwNBspCT+h/
	XtMSVRA==
X-Google-Smtp-Source: AGHT+IE5F4OU/e3M5Qxu03zUGP/1/CF6PkbZtrEE/1QB/qtY4l8x3I7V+uOqBhsxX/jjOQYPzZRFYg==
X-Received: by 2002:a05:600c:35c4:b0:43d:738:4a9 with SMTP id 5b1f17b1804b1-440a66ab49bmr12249625e9.27.1745575616014;
        Fri, 25 Apr 2025 03:06:56 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a530324dsm19279455e9.10.2025.04.25.03.06.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 03:06:55 -0700 (PDT)
Message-ID: <b74d90d3-2a85-4853-9843-6a6f22720587@linaro.org>
Date: Fri, 25 Apr 2025 11:06:54 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: clock: Add Qualcomm SC8180X Camera clock
 controller
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
 Imran Shaik <quic_imrashai@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>,
 Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250422-sc8180x-camcc-support-v1-0-691614d13f06@quicinc.com>
 <H56Iba_grof22uzTtGCI-APhiDAGSejNod6jsSVIykm9ijaaj7PWqyszShCEGjIpM2wCLOn4a3Vfb8Hjziqklg==@protonmail.internalid>
 <20250422-sc8180x-camcc-support-v1-1-691614d13f06@quicinc.com>
 <621d8556-f95b-4cbe-809b-864417f0d48a@linaro.org>
 <b96f8432-132b-4c16-951e-718e91ec52a5@quicinc.com>
 <f74d8b50-35a1-4ce8-bfdd-4c90782b8db5@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <f74d8b50-35a1-4ce8-bfdd-4c90782b8db5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/04/2025 10:35, Konrad Dybcio wrote:
>> The dependent GCC clocks are marked always on from gcc probe, hence did not mention the dependency here.
> Let's do what was done on x1e80100 - describe the AHB clock in CAMCC
> bindings regardless of how we handle it.
> 
> This way the DT represents the real hw dependency, but the OS takes steps
> to get them out of the way (and then ignores the GCC_CAMERA_AHB_CLK entry
> because the clock is never registered with GCC)

Ah yes, this is an always-on clock isn't it ?

But in principle I agree, the DTS should just describe the hw as-is.

---
bod
