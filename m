Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91419230D0E
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 09:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750150962; cv=none; b=reakB7YVmAuyX5O1Md9UqrweURD68ZlhpgZ68VcrihtCCUGuOWmvr/aJx39FatDzrokMd9z92+IZEAQRvrkEm4uCsFf4PFxXfyd+aNvkRHElQLDv8rwVpWnc273ai5/HIwVzlxk7s19rrFpdbz7u363Ml5aQH1gem/eVp4YucNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750150962; c=relaxed/simple;
	bh=hZpp8NilOYk4lk2aLMATM3rJ4jK41OW6tkT22EaNR68=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RemLtLV4uI8eQEjxEY+sIP9ldUG3PH9x7XD64IWtnoLBFcXKsGdDtvat3QIkxaGyTS4FSbyjXDgrNDVG4W5h5GE+d9Vzrp6GpH/f6PndBw9eWtgSOvrPX8ILR7qkwPUGuJvVETvpbmfsQQoNc7qvJg7fEJ91S2ClSASYoJHvIg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RF8fAesh; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RF8fAesh"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-553affea534so422724e87.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 02:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750150959; x=1750755759; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p6FSyDeLV5tNzI8jmBk6dfrtvJpCsYW4RkOqJj3Og0s=;
        b=RF8fAeshrVI5aNgHBrI+v4jsYBHw1T9TD5djqPMGUlFm9/QOZIFOQsBrO2Yn0hX3Rl
         roiEWZIuHYWaCHMhuc63tY1pv7QaKRKspyOfCvs/XRavK0914EP2W3ngmawnWJitf9PH
         30kvNGLLToIcYLnzQVXR8Rgf1/Nse8O9ZnJIA/dxdfzHtj1T/9mlZU6A5ZydQdCs4eQF
         AXFxgEO3j4vOGd9utqYFz5N7Ci8+9d+OmEgP3n626UqRTba28hHEZvCtBquVP4dlLXHh
         niTU0CZ7vOiPlN29KE7H8PdX6ArvIUsVaQGbdJOyAZ9YAcjuS87uWp2JlI5hnG0XzblK
         kW7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750150959; x=1750755759;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p6FSyDeLV5tNzI8jmBk6dfrtvJpCsYW4RkOqJj3Og0s=;
        b=cUM9hVLBTb8ww6eLKQhEY7DqO8FhT3mKxoiwi4+0HgNMEnz/f/9SiK+ikOzbA/sG+n
         C9roCai9vdwIlGaYFVop21aPLfsRKivg+rrf3RqyIPXev91PhPwygw+nIjDb7xr+nx6N
         R9Z0xUZeA7LMzFd7Tlq7ppiGBfe4ajR6Uol4AdEyo1l0Yv1Hug/ybfhQvfw6VXC+UH2u
         X1EuAh3Og3/+28+omEiLBDZOxXvELJjMJaSiNoLilcJQKEJooc+/b30qT1sdWjo6jhDI
         B+90sjiWfywdVnfOvZc6UlvX55qTOdRqScPFFmQ0mnr06eaJbInnVXC8gj4VvgFCFiyd
         Fbrg==
X-Forwarded-Encrypted: i=1; AJvYcCUP9Y1SWsuF8YITGlfpbSC2deaehg+Ug5ZssXHLvqf+HB2rojnBlSrkuLhnlQXS2kDU3Z4LyllP+AAnhnQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywosqtdz4LjmU4VakzizVhPSQimTE6YlaHliXc5YvQIVDXc7yLb
	hjxnv1KAJ10DGRrAlnWh//fVLAS4hn8PWoYxEVx3sWep25IXRPCjCm3I2LZAcsCCGRpQbJZL+fC
	MjLVK
X-Gm-Gg: ASbGnct++yHZUqbvFDpBkaYDtUDJxeuxDlpiVptg1/ms/fJeMGw57CJTCIyB6l52cf4
	9XNwhhG8xDbW7Fr71VSD3krLXGSGL+s3DWWjjZpDgCXEA1R0ZAyG2AWBRK7TMhWfpGCmmx8rg3P
	WcJnxz9OC5UbZPwBPlKd8QAJLCik83f6qQknGSUMu/LbebTT+Sv2tgdbRXGtOshgoQXetbA0BRP
	fuizKecEeqZ+RWF+UNeywB+nD2JGawkTMOAoTLvVxbqRSrA9bS5nCGFMAdpabICAOv3g8sOOYPq
	0S9baKSZl4OQp083PRG8teAJXYEsD9f7jJ9hOfiNeNIT+oeqOvCiMk4lARQJoPOL/P+dIUKx+Xu
	hRCb+Bwl2Js0GfvIZI01RUp6/Ta4uuqwLugdVX8ch
X-Google-Smtp-Source: AGHT+IEv7meiVd5tMWXL+doCxvXY8Z6vYW1YGEvunNjM0gGLHZU0DJ0LcAS77/p7fgnwyjuHi+JcZw==
X-Received: by 2002:a05:6512:691:b0:553:2a11:9cce with SMTP id 2adb3069b0e04-553b6f4cc69mr1044756e87.14.1750150958516;
        Tue, 17 Jun 2025 02:02:38 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac120167sm1823733e87.20.2025.06.17.02.02.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 02:02:38 -0700 (PDT)
Message-ID: <3b2f1bba-6dde-4f7d-ad87-219306e37829@linaro.org>
Date: Tue, 17 Jun 2025 12:02:37 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] media: qcom: camss: csiphy-3ph: Fix inadvertent
 dropping of SDM660/SDM670 phy init
Content-Language: ru-RU
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
 <hverkuil@xs4all.nl>, Depeng Shao <quic_depengs@quicinc.com>,
 Hans Verkuil <hans.verkuil@cisco.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20250612-linux-next-25-05-30-daily-reviews-v1-0-88ba033a9a03@linaro.org>
 <20250612-linux-next-25-05-30-daily-reviews-v1-1-88ba033a9a03@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20250612-linux-next-25-05-30-daily-reviews-v1-1-88ba033a9a03@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/12/25 11:07, Bryan O'Donoghue wrote:
> The moving of init sequence hook from gen2() to subdev_init() doesn't
> account for gen1 devices such as SDM660 and SDM670. The switch should find
> the right offset for gen2 PHYs only, not reject gen1. Remove the default
> error case to restore gen1 CSIPHY support.
> 
> Cc: stable@vger.kernel.org
> Fixes: fbce0ca24c3a ("media: qcom: camss: csiphy-3ph: Move CSIPHY variables to data field inside csiphy struct")
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

--
Best wishes,
Vladimir
