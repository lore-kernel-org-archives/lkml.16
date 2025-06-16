Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D2228DF4A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 11:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750072812; cv=none; b=jm8OpMfHp0IqGCEIMgHJvdeT/VtKZ3cX7RD1o821f9lR704+vNx2dc5gH8cpJKAYXPT4hksWnYocmbxB5mvN4uScKNu+3PLa1/GaQwBbAAf4AOCJclORAO/Dc46UoYnR7JHnq0x6VmwEu6rzo8tCsBjPvfTEvgt/RspwadRDGSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750072812; c=relaxed/simple;
	bh=2Croy3VQv4pwWkm+7Q2nQ06igcoamnECHdKYOflnbd0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yns3HCUUONflOb5sbfrhTeqW6ERDsnSWKh2ec8/kNAeCpw0FBrTcDgC+eeHCPH9UFJh2JkukmILhU5vlVNR+TLcEeexeu7l9VXvp4S/5FMwfsT+zuaBeAQzitDZci8tH7j4vgd5YoxTRoEiF58Tt7axE1UfgPFNo1v/tnYbSZS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CGJstcJa; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CGJstcJa"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-45345f1a1aaso535575e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 04:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750072808; x=1750677608; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vcv2XIvWxU5pxWuDwkwh8yx+DE1a8VaXwVfVG4mZA8E=;
        b=CGJstcJa0U+LvD1baSIiI/l8hA7E/zK8PXTfS+v/3NHtEiBuxCiQoCXQ6MDbkQvy3O
         WDy8hJtFZ+GTNvT3sLy5t1yVWJQPz2I9cEL9fGCNkOKtBvFfd+0AfYkuR37cdGi26A6T
         nP9wLYucoi2AdFK+IK6raSLF0T4EikM0TAH7gOCRqo6ZTg1MECJt3Va5gNeqO/lMMnFg
         Tvw7MsbPROToWbMW0G6UAyPF39/2mF/bLARfZJ38ra3ukRx1d+71MqivHU+ZhHDu24W2
         TCKzi6nYLjJAa/2X8y1LlFtOMaYnSV5T1W/KAbl3dmWsTLmV8XUOpzG5DXzxyZgMMvE7
         8ubA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750072808; x=1750677608;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vcv2XIvWxU5pxWuDwkwh8yx+DE1a8VaXwVfVG4mZA8E=;
        b=X2qQj8HsxU6Oy/U0n/l4n9uo8y3OWqdCHkJbErKuz7UPpjuVJsQcg4KfkYIVzvenoA
         B0d8Hyg3kncTRxW7D2TP6E5sDDyB4Iasm7neWsY8ObQgdqaK5yxfTHvRVbGed1KO3zV2
         FS3opJQJMWJvRrK2FnPm5dSJhaIjNPBQgmVN6IE+s1ow69VP7m2G9tUoiHepuOXqXlZ1
         XydX4UNcopKpfUZwL9qs2VbH5xNfX/NrmwdPRLPwfOztn1jJ5+1Eq4j0JdDFAy2bXNB/
         kSvaQCqDFTCh0MKbkS5uviUAuTVbovZlBynER+ZgkjWEtv32CJ39615kzwF3E27YOia6
         hz3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXEzqBY2WJvUIJ5KlSXBnLZxA4h2B2Wgb9HsMj+Dyy0DncI058/WbT0A42P6Tn8rePxaZjMOcXuWe8sB9Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUqhCWVecJqjUXdWvrlrCr6FAtaIYC4SirQuBmsLR4rIT+dX2l
	7eTRf6GOHrqMFHct+Cju7WFsvWIr5mZtoWnH0wcZbiRtGCC3it55PlZY7ltynwa3fYc=
X-Gm-Gg: ASbGnctP6tWBOzYpUz3gUJbUcQKW5WS6tTM5uTwLmnXwkcREYHhaBpPdxmS7Y7jko/g
	lZmQ7YidPC5ue0dnzpaxLtSMePV5lWvfA40Il9know8EwCPHA5HHoeIakoA6y5uczJDcfoDC8e9
	ZPEg12fT5Re84dLLu/1dfhsRQkZY3rR3vV5/kqhJg48Zf/Il9OM7ux7+re2m6XTKzDcOBeBXPwi
	n1I+S/Dt2mQL7XiZUo9sg+WQe1M6NAU6+7fnU73HAc21kIpW48/ZCuDQmMuIV4DtlcDBAu5AngA
	Dy7Z/auLZe/Ne2BKzHYMEfw0RnSW0qN7pMYhaUZg/FEzm2VKl911kyWEFwwGfHbNVtbevLr507i
	3N4rgiy8=
X-Google-Smtp-Source: AGHT+IGflBlKKmsnkRHLRdVRAo7ixBlU3WskSkZZIOAfUixdXhdYxc0rTq/As2rL22r0UuNx5xw8ww==
X-Received: by 2002:a05:600c:695:b0:453:4376:8f48 with SMTP id 5b1f17b1804b1-453437690a2mr13432485e9.6.1750072807907;
        Mon, 16 Jun 2025 04:20:07 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e2522b1sm139952475e9.25.2025.06.16.04.20.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 04:20:07 -0700 (PDT)
Message-ID: <fdcbaaed-c088-4ccb-8897-bd69080a3346@linaro.org>
Date: Mon, 16 Jun 2025 13:20:05 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: defconfig: fix renamed Qualcomm EUSB2 PHY symbol
To: Johan Hovold <johan+linaro@kernel.org>,
 Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, Vinod Koul <vkoul@kernel.org>
References: <20250616103252.32642-1-johan+linaro@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20250616103252.32642-1-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16/06/2025 12:32, Johan Hovold wrote:
> The Qualcomm Synopsis EUSB2 PHY driver was recently renamed along with
> its Kconfig symbol but the defconfig was never updated (which breaks USB
> on a number of Qualcomm platforms).
> 
> Fixes: 8d3b5f637546 ("phy: move phy-qcom-snps-eusb2 out of its vendor sub-directory")
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Cc: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> Cc: Vinod Koul <vkoul@kernel.org>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Thanks. This was sent on the lists some time ago and since a week is
already in pending-fixes. Should be in coming RC as well.

Best regards,
Krzysztof
