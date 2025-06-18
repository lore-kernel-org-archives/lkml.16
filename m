Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B9F6249E5
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 13:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750253289; cv=none; b=U7nRk1wHQ8uHn8ObV9E4ZjigxJcENC3up2oaMcoBnV5iOZSuGJFx7EcBVhlAEuFFnl8T777qDoFjTuo0XWi7kNBOjX9ST36tgyc1M/mBoeKysWKDhDyKIb3U275jRaHoNcnxj/vqoc78z3aThIrEM+OedPNJCUjxXE1+UpkIR3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750253289; c=relaxed/simple;
	bh=CQWYf5240z2KPgUiqlRF9wP/4RTd2ZVb2iMhFh38Ahk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GjIqBGZoWhs3ilS58mYec83h3ytj053hUR/usHqOo65lg2dAMXtgcrUjQPrrH9Eki/pW5Wc+sJXsk2OA+ME4+mEFKpDeAWNBlEnfQfqUYdjRL7H/93DSCAzzVntaTpPZNFYA9mgeeurZtWfAulR8/rEsj9NzFD7gXDwU4BqHTGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K3Rd4B5a; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K3Rd4B5a"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43edecbfb46so52175475e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 06:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750253285; x=1750858085; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CQWYf5240z2KPgUiqlRF9wP/4RTd2ZVb2iMhFh38Ahk=;
        b=K3Rd4B5a0O/vYISxLM3S9R0Lns2i/o83cAKPOZuPiBUQ2y8rBvSPlBN+7nPsjrSxlF
         dUAh7PZVyztBqzet+0LqZR/dXIv6KeNd6P5WpHZ2Dz0vrHBd3ydL2B0dESJrpmeyzxJY
         FbRMWjwzkrHyA/N0nZ4PTppUq+Jd+GyS+gicWIr6rziApzgq4sHZbCZKvhbRWfddbYzO
         IhuF5XeT2MWJMpyhts4KLO0QdzmMl7MSWPwM1qmMiXKowD0TItqiQfCSW2mlnKTlBqNR
         TavoQF2ArdABrMzWumXNu9up5Za3M6MRPeoQQ43rWX40hkIGzkicO8F42oT6HKZQUTrn
         NU+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750253285; x=1750858085;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CQWYf5240z2KPgUiqlRF9wP/4RTd2ZVb2iMhFh38Ahk=;
        b=ESfQq+1/WFfUCD17YPTN8NHoA4hAMncvZXmFkzChIxVkXXuoEwe3fvE9F8ye/WYYXc
         fciaTMFrv3ffomQDiEwhKpHo4h/oSGYA/RE5HUg/HDfNH3AJtAIA8AgPjD4BglSMSKFs
         JF1RdlLWfXJg15JWBo4JX1XU+ltPCYNKgFLtryRuwSsht8zTepnQ67RNKL4SL3RF0SGq
         eRpIWfV/rVUFNYRsnRMyJnsAwZPQsTh4JpBpU5gsAuVdNwbx4uq3SDDcKg8LXfBOaTbj
         j5OrhZClc13euTFWDQY4ZbBEZ/xBHCYlkU/YXs4QLEDAUYNl1PQpKVscknKrusKXTG/f
         XQEg==
X-Forwarded-Encrypted: i=1; AJvYcCUVY0MPZYbKI3zl81FdQ2y6GaW7SErhwVQ8gjJPe7JP4Vjc6Qiz0Al3P09A0k2JX1TGhwcOu0w4B64280Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YzffEtSBo2M+fdba5u3wl8R4m9dmS8x1j4TnBYYexbd6WPNXCe4
	RmiVtsJAOyqeeOmc21+Oj9Deroce9UpRVdEbqaWPCjm4kBeSZs3VhqpeAWxg/wl/Z9A=
X-Gm-Gg: ASbGncv7GE2l3cn0nDnVXHNXXFqRVmqOUmxxmK5YmHNAbc9DqW+cdI5SWFvXsj3i+7D
	VivZzcnfpenTRKhCj8BTsuDn1ulEC3rIhxlQMnn4nsTBIByQPliRFUNnyq2y9xINZUGe60EV5ZC
	xZpkLOTlxKJi6Zm3Kl+pG2YWKRD9NTuf2AiDPazher8QSgRxlgTYjorSslsk1pSoS2tp+k7Se5l
	2u/bOj+msl92bJ77ucfy0NC/eFl5ADSS+2xKw9kRcw/HFLar6UkjL8dMhNvLXyBICo5ScwFh+T8
	oBZiuhW3Xo1qFCicmuA6+8/FY+QjuX55n7mmupaMh7xiRZHZWDe/XTv8WFcSc1IADn4BBewNZ7B
	/OALAC9PJi2Y5gataISEQpopDIGL1HHcrVoChbA==
X-Google-Smtp-Source: AGHT+IHsYnHdB0JOFwGUBbfz/Nz+oX7/Nt70Eian/OZWF7OabodaY5ap19RQq+MRP53eF3NO5RcWyg==
X-Received: by 2002:a05:600c:1c28:b0:440:6a79:6df0 with SMTP id 5b1f17b1804b1-4533cb4bc8fmr134287185e9.22.1750253285546;
        Wed, 18 Jun 2025 06:28:05 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a633ddsm16799417f8f.26.2025.06.18.06.28.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 06:28:05 -0700 (PDT)
Message-ID: <ca3c6d72-2fc0-4e04-ac61-486ad75257b8@linaro.org>
Date: Wed, 18 Jun 2025 14:28:03 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] interconnect: avoid memory allocation when 'icc_bw_lock'
 is held
To: Johan Hovold <johan@kernel.org>, Bryan O'Donoghue <bod.linux@nxsw.ie>,
 Rob Clark <rob.clark@oss.qualcomm.com>
Cc: Gabor Juhos <j4g8y7@gmail.com>, Georgi Djakov <djakov@kernel.org>,
 Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>, linux-pm@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <TIkPOGVjPeCjPzjVtlSb6V5CIcpaXf2-6WG6HjAyaOW59Hj01-9VK7Z8DKadakOKr6fJeQICi6h0Z8mft9DQyg==@protonmail.internalid>
 <20250529-icc-bw-lockdep-v1-1-3d714b6a9374@gmail.com>
 <ca9f7308-4b92-4d23-bfe7-f8d18d20de10@linaro.org>
 <75a46897-040f-4608-88f5-22c99c8bed97@gmail.com>
 <04ab699e-b344-4ba1-9ca1-04b6e50beefe@nxsw.ie>
 <aFK2Kl2I46dTYBI1@hovoldconsulting.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <aFK2Kl2I46dTYBI1@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/06/2025 13:50, Johan Hovold wrote:
>> I think we should sort that out, either by removing one of the locks or
>> by at the very least documenting beside the mutex declarations which
>> locks protect what.
> Feel free to discuss that with Rob who added the icc_lock_bw, but it's
> unrelated to the regression at hand (and should not block fixing it).

True.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
