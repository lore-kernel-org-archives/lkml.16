Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DCCC251782
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 12:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746189620; cv=none; b=G6OnfriyvRWmr1t7gR57lz9LZ7plb3j9tZGv3kbCCkWadKHpgJ2Guv+UupS/Dqj7l2thbtSw/aqB+KDj5/Lf3EYmiQEJd593hH2REjMWTeH0Cz4ClXuNu3S/W6HTtk2C+yapgiYWbHem7DAV9EnmdId3Jkp9q2LcilwGEtHP0Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746189620; c=relaxed/simple;
	bh=kXHh4bekX0rbt5Td7HC5fwo2DH3JDp731V0c2xbEl1A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p0yrJAklRxmbLM7ZMu31C3t+zJLTDO83uXkavJLy5L3WnAqACQsDpPK4ZSQxbN/rnDXEmwtyS20Dw1TBJ2039pOEw01ycTp7UmZR/Vk2GpOlQsv+D+Ax7PiJ/5jXyqgUIrx+IpXqjPqhfXwIV5unL5yckXrEJP0w3f0n7Uw+45M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kCAX5DcH; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kCAX5DcH"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-39ee623fe64so1912776f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 05:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746189615; x=1746794415; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hO4jrfvcXwDOgHznp3vJRhe4wcy5ANNCwq/KWVr/OIk=;
        b=kCAX5DcH8ZLfwkB7SEtsP3nRJOWEfcU6DzqLGmsKGTjRwHx+ez97kSmPfnCtG96A5x
         HnVzISr+thTYQnMpIj0EFPl/qu3u+SryIrlh7TnwKZ4DGeYu9gi/t4WJ4AXj2eJCBcrG
         W2MXeOGFqRF1iWripW8pAezAbQ86PVQH+PBFCE013Sfd8q8IVy5dXXGzimw5RX6knWrS
         jTZ2dPqLS//ppa1NKZDZXKvKWCy8hOT+hvMd30QbqN6+/pqhYcRiknYTBJH5JTfEfdd0
         C1xVYgqw+yr3E/JuUZj3JpUVXE8FaW/DhoauZQLXQEVUWzb/3YSGMmwdKN9wIUfoEnnt
         oKAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746189615; x=1746794415;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hO4jrfvcXwDOgHznp3vJRhe4wcy5ANNCwq/KWVr/OIk=;
        b=FtTsNHyAfRhtCIyhxu+YmLUa6qe2NYFVKIp9r1g6Ea1x83gzEddm88Cx9GaCrQmj8B
         7MNT2+v9nuT3s8mWWSVqXf44KwNxP7fHac1z4sWJ3xEqhyv5tm3BfsjMEuUInhZovQnU
         N7CJqMkPf/Yep8ryksymRZszbixP9sPN8T50osKvLbd6jPI2+ssASUmDMv/7goM5JKRe
         +XldWCdc2U8ghXkQh/MDLXHQgjSUfL7x2C3Q4xqZ20KbXmTn6xTYe8Qy+5MTYKZEEpCC
         7uzUMF3dKt/q9UUxAt5DCsGE3vBiNV96ZUd+Tdro/jxtZ/ju+vCbtiUXFVSYjS9zpkNP
         /YCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFax70WMUgRkfIsvYKRr9K7F6qLokQp5TdDBND4prAR4RJJ5ixPi+v/CBIQo2G88X9Bj8Z+rjg4S6ZrrE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzwjia/Xe/en8kZ9AVokWTCDp0Jzbl6+TPln9QqRLP4WLMBWOn7
	bD8jMjoD7+v/knaHmwHAf7OiZ0s58zkg04zPiHdnuqgAt2A8bb0OdYD2FykYjbI=
X-Gm-Gg: ASbGncu4Vdc1zVFpSRXckvQ/P7cGj9+9wJNX9A/kpRQH+mkaH6KasK3ShW0a/XMC/pK
	bZZVRj3noKKBZ1U7ozGf/5xW5P0pH9t0DdggEJbxgFjYBd6fhcXsRPvxmZSv7ggR3S8sTvyVV8U
	CPadPI/AUBnJlqe2cEEzknN+/6/Tpt+v/XbvasjAd0H+oq/d0XfhjAIyebrn8T64vBYlxF6I3iX
	tsSrlrhSlClASVpcpeIKQxK+w5Ngx4n2iSp3gc1KBoOwTDUmpPpSbzrmOMNtXG/Xk1/abUd8eIs
	c62gvTyUrA8rk0QptefVIeXksvrR/5QeZJeXRDjSykk24UaevCYarumIilQC4jMbX8NBgPY4IB4
	goB6hvEhIBLwDoLQy
X-Google-Smtp-Source: AGHT+IEOS82TsR2KY66VItn5wS/PhdQ5Z/iPWuns9/rZodNO7i5a6/Ht1tcfU7koaHBozYfd9ylhJQ==
X-Received: by 2002:a05:6000:1a88:b0:3a0:7fc3:b1dc with SMTP id ffacd0b85a97d-3a099add333mr1924412f8f.32.1746189615520;
        Fri, 02 May 2025 05:40:15 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099b107c4sm2043868f8f.76.2025.05.02.05.40.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 May 2025 05:40:15 -0700 (PDT)
Message-ID: <bc9ba136-bd99-4c6c-be97-8915464cfb11@linaro.org>
Date: Fri, 2 May 2025 13:40:13 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/23] media: iris: Track flush responses to prevent
 premature completion
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Stefan Schmidt <stefan.schmidt@linaro.org>, Hans Verkuil
 <hverkuil@xs4all.nl>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 20250417-topic-sm8x50-iris-v10-v7-0-f020cb1d0e98@linaro.org,
 20250424-qcs8300_iris-v5-0-f118f505c300@quicinc.com, stable@vger.kernel.org
References: <20250502-qcom-iris-hevc-vp9-v3-0-552158a10a7d@quicinc.com>
 <20250502-qcom-iris-hevc-vp9-v3-10-552158a10a7d@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250502-qcom-iris-hevc-vp9-v3-10-552158a10a7d@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/05/2025 20:13, Dikshita Agarwal wrote:
> Currently, two types of flush commands are queued to the firmware,
> the first flush queued as part of sequence change, does not wait for a
> response, while the second flush queued as part of stop, expects a
> completion response before proceeding further.
> 
> Due to timing issue, the flush response corresponding to the first
> command could arrive after the second flush is issued. This casuses the
> driver to incorrectly assume that the second flush has completed,
> leading to the premature signaling of flush_completion.
> 
> To address this, introduce a counter to track the number of pending
> flush responses and signal flush completion only when all expected
> responses are received.

Is there no other way to correlate command/response than a counter on 
the APSS side ?

Usually command/response protocols have some kind of identifier field or 
sequence number embedded in the protocol headers.

---
bod
