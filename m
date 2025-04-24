Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC522571BF
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745487259; cv=none; b=h++uvH35Pz4cj+j4Xz3rDejYbA6WMnG2kJUIrRm620kNHpE0pn/z/9oGqLC5cjEKAfe7bJ7Z3lEOcc0uAgq5EfD9cWFcdNQ+7w9io0V+9IARiH6vjvpa2WGbuIAenlh3+8YVRy0mCHJnWi2l2JgauTmGdbiSRq3c+wwTUazFd70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745487259; c=relaxed/simple;
	bh=W2UdDM9Gz5lK2YImWaOi4sawa1oA0xKXY9iJZEb34wU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pQVhAwxBUW+i5UJ9AasJNXer9XapchL7tZv37r8FiA41dUPYdSo/rSOH+KEGGTdKAR9xrtnoGXddhJiVA5sC2lQAxaNnlmScAyf49dy0chQhoxfd5c7hZL726xsB6UKEXk+PeuSkcOEOuhkLcTg3qpMIqYetbu7nu7mUJmsz5aU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sh38oJ8H; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sh38oJ8H"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43cfba466b2so7135865e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 02:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745487256; x=1746092056; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VtiMeBtG7DKFIw/MlZYPyAoFtecT0rBQL9R+KBs9yMk=;
        b=sh38oJ8HTQdcmD6Kl1dDD54+5NzOLoLVvGiC0pMAp3KIgu63cTY67XTGc53J6wHumR
         Mk8uWVJeftnvaDVNCdmIDjgjGt/eKnnxrZWxShWTTBd1q1NU3ON7ek0mOMN0vvBiN4sj
         2hn3wNf5ydBJHG1e5aY64C1jxRxOSOmoWbtj/1vqH2Eup6L3g9cAKiSGM8MSzzmRnXAX
         PM2Os5RjCBQ+ow42ovTFVUlkMNTDY9Gt4NwOOBVkUFBSJfgz27W/gGsiFwJcolBwjoRh
         yyutPLKTRldJ5ZjHeKo/tPD1AVAmEVTGZb+WzNxuGjlgGasykl3RnJAVcXueWZqcOJu/
         5vOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745487256; x=1746092056;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VtiMeBtG7DKFIw/MlZYPyAoFtecT0rBQL9R+KBs9yMk=;
        b=hh4EX8DLgoGnppDqFYkZs0VUX/CnI/7ewD/onxN2RsbPzm9KcoXibb/NoBoap85oOM
         1kZUSwWSTsyDHBlOt+Gp/Wl6qaOPvjBEnJIAo92IjErVEtM3azJDPAEaqR4MtxXfxfKh
         z0PNcK/Dxok8aZIelpPqZzmYqAC1AIVaggxbxSADeqiCPpFegPKvCjVbx987P+P1NkWN
         r3rFv7/L0VPX1iZ8bW9xaqr/dfvSH7i+0YRLpGqlJ7fONQgUZDUIjm8frU2MbJAFSCzs
         lN6P0Lh1Jv1W8IAdL/R7vIhge4FsfPmx42/Krm/u2JgdM2jeulHS3aeD3W+cr5WqeZ8E
         Iw0A==
X-Forwarded-Encrypted: i=1; AJvYcCWP+PTWQn0PAdvDcJ6gGcHCNOo99L4OJm/uhICcTcjjObxknHZPs4QullOrrM4JrKRiS7xM9TpEQQFrugk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1ZJG0wrpMB+EZOIyBo7Hvx6W1cbFJusqweiFkeI00UoyMRv0h
	ztPTFWMPZ1D45GRP1gccdp7MQrLaoY3zzl/v281qez80eaSEfQgfQNqrACNLMM4=
X-Gm-Gg: ASbGncvyS42jAMNNJLUlyiX4YAC6HeqJ+GLWulkEHs4RMh8k991OOBhryFYNkwIe7xR
	JhwrIGAJlP4ObPJQ1CRlvJZd3QZgPoii2h1tO/kt39uL8cCHFs+EU4kL9gNjSiFFW0BayVc1brg
	il2oqpCQ5xsO3A4qC9YkgSiDOuwyvTKYpRBbpTNW/z5KXa05nBbz/h1bzedMZpeTGbSEl6yQoq8
	jzbUWwbW2m/Zjd+mB77xIDejw74jHFTxa076nLsgMhvp9gQMDtAj2jFmZzOJoGFh9qIqqS+PVB6
	s4Yw7AZLdFZ307VY4RXtJSgJelbZwS4OvQWplIm6d48/M8SjPl8NeuGwUfYrIYTX0fmUCh5jq8o
	FpmNV9Q==
X-Google-Smtp-Source: AGHT+IEdBmL2+QOX0Fby79sdwrm+D04fNRL3vM33gjqGvaPB6uAl38Q5X0016d+zpuDYUabB6o/lJg==
X-Received: by 2002:a05:6000:4008:b0:399:6dd9:9f40 with SMTP id ffacd0b85a97d-3a06cf4b575mr1650020f8f.9.1745487255883;
        Thu, 24 Apr 2025 02:34:15 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d54ea48sm1476432f8f.94.2025.04.24.02.34.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 02:34:15 -0700 (PDT)
Message-ID: <54eeb470-cd90-4bc2-b415-6dea1ce2321d@linaro.org>
Date: Thu, 24 Apr 2025 10:34:14 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/5] dt-bindings: media: Add qcom,x1e80100-camss
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
References: <20250314-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v6-0-edcb2cfc3122@linaro.org>
 <20250314-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v6-2-edcb2cfc3122@linaro.org>
 <3ec3fd62-bf21-47e7-873c-ce151589d743@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <3ec3fd62-bf21-47e7-873c-ce151589d743@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/04/2025 07:40, Krzysztof Kozlowski wrote:
>> +  vdd-csiphy-0p8-supply:
> Same comment as other series on the lists - this is wrong name. There
> are no pins named like this and all existing bindings use different name.

The existing bindings are unfortunately not granular enough.

I'll post s series to capture pin-names per the SoC pinout shortly.

---
bod
