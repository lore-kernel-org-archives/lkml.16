Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AECC24A04C
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 12:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744805407; cv=none; b=S4OunrFcI4fxr8g8G77y4sD8Qix3ySxbLXndfhKDZ17Go92ANstnTbSw4I8TQ9Fr0c1+toA1k5xLLIZsfM1T/WfTiD7DbrRJr4/IGCzDPN3fk4Wi+Y5gvqztvjNYY+VLW3OzLKBhxRXNH+r8J9Ph4ahS1gX8l8StX8l4ctLw6PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744805407; c=relaxed/simple;
	bh=eSqUxdw+knq0VEg3KUP5yWXKZxiSUA8O46Zm7+37lpM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EMvhtSyUUYSsfpUiBzdDkt+oRhAahNKlfov6AdFxJLSu5rJL8y37dHbgZjuks2gv6e0bZ/3yxrNwZdibn1k66EES3ENKtXtYhvLghH6aqxiTrynaP8i17R1aVe23O4RyvDMo5kos1bs47II++jauOk12GSvX1LCIGLRrqNESEcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UUPd16u4; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UUPd16u4"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cebe06e9eso50004285e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 05:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744805404; x=1745410204; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y42aZbJ+EXJLkSTiNisifgjorzr07bQAgsETmkkzDgA=;
        b=UUPd16u4zMkjxdNK3GkNr/6f8Qc0Va0FlgE6Xv/QK03WyuJTEcPWjh+ZwHOQc5mID4
         7HelciPn5jYmJBhnf5D5XTZ+3FiLZddbNmVHaEMzqdi3WkQK9A32a1IxE1m2Q9fMuTSp
         9z3G69ngRN9Cd3kAbcMbLZFELjOmPA6dEZIirqF6mR/qmEuRBPQn8y7eIjUjzMKalyjb
         AG3krQv0h7TQrEb7WDvZjKbH6OhUdb9f1G8QDBGrtSmd94OP7XxfWn6xBUBeP3gP1D4Z
         1UKSwKZFGYCnzv6CK7JEojm6coDpouAaO58U+ia5Lj04XxrESxGdpQisfdIDQ8aEWwiG
         W58A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744805404; x=1745410204;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y42aZbJ+EXJLkSTiNisifgjorzr07bQAgsETmkkzDgA=;
        b=ROhK4a5y6fHXQdzTDoXqog1q6ttr7FDwCiqct9gubQ7N47+LYv3w0A278U/MuSURDx
         wKE53zfSeaUw8fy6NHeocQ9MyWZ1su1H8AA6/PPpuZeQj4/2Yq1CORREZPm4ihZcX8zZ
         H+eN+moI3aWfHhgZS4YztSA4pk04wl22U8IyUpFIJAtHaBytMv8/O8wsE0wTd1H7jo3L
         Bb1Ykg5ItiTMG8/c53l0Xy1lU4FIECEC/yMmPKE+tAVt9Vkni8rm/8zUF8tfdTh0TdtW
         IDlQWnH0qQDZrAAi7J1imNjvV2ncCX5xmax04EZspJEKc3M0SjCrcXwg5iOGJPwDo01d
         WvQw==
X-Forwarded-Encrypted: i=1; AJvYcCWA3w6++EN9t1yEkIFavxEMFO4hbpx/9Hkh0Ksq4pol7dKeZa3PWzqeJwilW8ojcSIYXc/sp9ZUIjA/FAA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwK9N2aP7dWZ3h/mJL1eVh6vaJNYyIKG98y43XjruTHujhKByvw
	xjuLilI0YyOXX0bw+IEx9ZS+gtzBJiCR/QCfuZ4EyxaxOtDHf3SDfRaIpv1FpVE=
X-Gm-Gg: ASbGncuXIK8ua8DOqPVFnA3Fq27rv6flxfXpjYCQ8ca1K1qhvzgMR1hla/bJKQubD4O
	rm/AuRiGaK9Yq+9jl1+23fa+wDkcVwae/q+VHincldSan/ak2nSS9SOu6J9Ox9VgO1bHT4dhVCG
	HGyOhrz11A5QMsRVrXeAvF1VTHy8D/kkt+e9C3X6IWR0lnm33EaUDQygpbPXTWDbcyjwwp+2zMZ
	jNDwVxSfaaHJryv+DKG0jrFB76xxYadp8ZrD9j55t5mWTJJelIR0Ezb1xbqIWxQqjSssSnmrKIs
	nYKSOuFS68hSZiY+N3IBlL7yiNrAXMZYqpSEi+PAjJPcG2g/PXeQKxBbychR/UpbjpsqFGWjeWl
	pqBupXw==
X-Google-Smtp-Source: AGHT+IG/5+8sfYkHLGOAY6lPDHCl7HnqCX318hQLUFTWjKL/iIuVLzmSZD/M/vmf4/QtA5Lbe/j/Cw==
X-Received: by 2002:a05:600c:a09:b0:43c:f00b:d581 with SMTP id 5b1f17b1804b1-4405d6decb3mr13337465e9.29.1744805404203;
        Wed, 16 Apr 2025 05:10:04 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4404352a536sm37332905e9.1.2025.04.16.05.10.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 05:10:03 -0700 (PDT)
Message-ID: <70a630cb-06ad-403c-b2e2-ae6d26e0877e@linaro.org>
Date: Wed, 16 Apr 2025 13:10:02 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/20] media: iris: Skip destroying internal buffer if not
 dequeued
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Stefan Schmidt <stefan.schmidt@linaro.org>, Hans Verkuil
 <hverkuil@xs4all.nl>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, stable@vger.kernel.org
References: <20250408-iris-dec-hevc-vp9-v1-0-acd258778bd6@quicinc.com>
 <20250408-iris-dec-hevc-vp9-v1-1-acd258778bd6@quicinc.com>
 <811cd70e-dc27-4ce0-b7da-296fa5926f90@linaro.org>
 <137c68d5-36c5-4977-921b-e4b07b22113c@linaro.org>
 <96bd9ffa-94f6-0d1f-d050-5bec13b3328f@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <96bd9ffa-94f6-0d1f-d050-5bec13b3328f@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/04/2025 05:58, Dikshita Agarwal wrote:
> Although firmware makes sure that during session close, all buffers are
> returned to driver and driver will release them but still we shouldn't rely
> for this on firmware and should handle in driver.
> Will fix this in next patch set.

Shouldn't we reset iris in this case ?

i.e. its a breaking of the software contract to have failed to have 
returned a buffer by - close.

Its not enough to free the memory on the APSS side as the remote end 
could still assume ownership of a buffer... right ?

---
bod
