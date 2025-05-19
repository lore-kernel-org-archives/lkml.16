Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D17F272E51
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 10:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747652119; cv=none; b=vAqYCSMy7zsw+/oY1nnamXGAaBXb3OW18UmheaNDDa+go21BNpnvQ15rWec4PjAF00/knVuLUYSZ+E+bF7+fcMlUESirBf0CJnbr5IMIU9dGzk5QiVqC4QOck+ynfR0DNawHAWdjCzG2TxrPRYupqkMdo5022QZIJVL+gkPs/7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747652119; c=relaxed/simple;
	bh=PzfkeF67xi2GoMUYcGvqwEOhE8nFTMY+yeJf+y2fnOY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O4VsFq4DuRhqOKKUjk1mrHxue5I+LgFZY0WB/c8/I0SlDZgd8vNtjp3WKOZc2KOsQe5rTXKRKkfwDAF5tNSy9YfJ9XECBEr4RLrSFMaj0WoTTidpJhNtjDTCttCWpUPQHfwmEy7eGliv5HYP+ehjeb1Q9vURGGjago6lpwuLd3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=If2rhX/n; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="If2rhX/n"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43d0618746bso33233695e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 03:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747652115; x=1748256915; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ueJhJRaSbKSvp1WqYqL5yk7HRHK1xuho6oDidakstGA=;
        b=If2rhX/nr5v8PDP7bji+SCVMK+XXyBD72tweavL7Ip9meDI4Iv3NTfLO1VMrcSl+xs
         OQMLLOTaRpGMvUToyCypuVLr39FYyPkp4x2U6c2yyD44EwJTFoXtoKHnNTnHKL8FF6fm
         n+s+YEXQYtBgHiJw/ev97UNQJo9DOSc/feCVs0gdybUS7vUhRjB6oXQ8mW6i0hCfq259
         Plall4NOjo9LzAayS6jc4MrzOiNs3GST5yO1h71KUdeZhcJiaHwtqZeSYUfYFeqUK4+z
         KP5jKBSWu1qkRfc1zFTk2htUxQjnQ/8doolY7TfW8j4+AyZYBvmIyAXkuV7yRKbKTLdn
         CHpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747652115; x=1748256915;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ueJhJRaSbKSvp1WqYqL5yk7HRHK1xuho6oDidakstGA=;
        b=qxkUCEeX4a0TrEFNoRJRYvQgglfIOVsGv00IxWFYbm2f1XfFpbS0v3JLcwn7gbZD6o
         MeO0oKeU0HjVXv8we+DEk22yfQLKu95XjcIbVs4/6OykXrjxXrEZQzhuQZWTKZn/WaQA
         oKYhGHHCzCiiDevT4ecBLh57W815NZgh4f3kXn0IQL9YUlOB5KAsQNUx/JaCWE4KPfOp
         s+sqUsZ+MaMztiu8nuJscTO4EYDsKA5hCFlxg5MIk2GvbJVGR8DnnyBTjhQIfhMNm5x2
         w9fX3Dc0Wj6CICvo5cUtKvCTHnDfPApwdk2QN+eS37j2hMv1yIA9tR2R66bTkK+/E6wU
         t2jQ==
X-Forwarded-Encrypted: i=1; AJvYcCX5WWgPf5VbvYWgfDmeUBAgS4cpdJL8O7ROxI5N3d/8TvJ1sCG5/atq4vdZGju+V4GvOLxysmhBKbXb2To=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWo8l+XOLHynF9rdfQuxSaezLz3Z2ry5NKQw1qxvc8ImCMIspy
	ZFsYGl23oaax+UWTJOJj1WCGU0uOmV4m5buXEZq53EGwIJoJ+WbJ/r1mZiQvEZ5CGw0=
X-Gm-Gg: ASbGnctls3BQiNmhj5X/2VZLmRpUpEYpigQ4DxotS2itjZDec6CwSm7eVLm82D4FRFT
	FTkiFr07/IeJAv1OlHXKB+ucbAMonNCrarVT6mV9I/kmDBWXYObPS4BaADQ/lWwc76BVkFHmiK9
	hdCU9H2yfKOsgOGjSoUN87/fe3yCcoG9qzZ3sZDnRg1a3QPd0zqBj6v82Mkc1fME/QoVhXgf59y
	iIRomogXtKw47ZCWvYjHyFLiGZDzLHnqICsqqY2oPMOXALgWP6HXnDuVix3T9+N7/hN+PxYqdHd
	rxwAb1uwS/Bjq00KhXkAvQB9cZc6LhyEawrgM2GCN+GP/lSIEOMAQwzp0vKlX+s4vG9Py7fguDr
	R6u5QUpJ+f6U3EDEP
X-Google-Smtp-Source: AGHT+IECzMkl/j8ndcEIBGJahHduWyX4b0BqqSZwZhjdHPF7JoURouc9w8pWFfoFilDuHYffnnZaZw==
X-Received: by 2002:a05:600c:c05:b0:43c:f689:dd with SMTP id 5b1f17b1804b1-442feffb593mr113388045e9.19.1747652115507;
        Mon, 19 May 2025 03:55:15 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f8ab839esm166199545e9.17.2025.05.19.03.55.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 03:55:15 -0700 (PDT)
Message-ID: <88f6fea5-89f2-4128-a00b-dff760bc42b8@linaro.org>
Date: Mon, 19 May 2025 11:55:14 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] media: venus: Add a check for packet size after
 reading from shared memory
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Vedang Nagar <quic_vnagar@quicinc.com>
References: <20250519-venus-fixes-v4-0-3ae91d81443d@quicinc.com>
 <20250519-venus-fixes-v4-1-3ae91d81443d@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250519-venus-fixes-v4-1-3ae91d81443d@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/05/2025 08:12, Dikshita Agarwal wrote:
> From: Vedang Nagar <quic_vnagar@quicinc.com>
> 
> Add a check to ensure that the packet size does not exceed the number of
> available words after reading the packet header from shared memory. This
> ensures that the size provided by the firmware is safe to process and
> prevent potential out-of-bounds memory access.
> 
> Fixes: d96d3f30c0f2 ("[media] media: venus: hfi: add Venus HFI files")
> Signed-off-by: Vedang Nagar <quic_vnagar@quicinc.com>
> Co-developed-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
>   drivers/media/platform/qcom/venus/hfi_venus.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
> index b5f2ea8799507f9b83f1529e70061ea89a9cc5c8..c982f4527bb0b9f9ef9715c6c1dc26729f0fc079 100644
> --- a/drivers/media/platform/qcom/venus/hfi_venus.c
> +++ b/drivers/media/platform/qcom/venus/hfi_venus.c
> @@ -239,6 +239,7 @@ static int venus_write_queue(struct venus_hfi_device *hdev,
>   static int venus_read_queue(struct venus_hfi_device *hdev,
>   			    struct iface_queue *queue, void *pkt, u32 *tx_req)
>   {
> +	struct hfi_pkt_hdr *pkt_hdr = NULL;
>   	struct hfi_queue_header *qhdr;
>   	u32 dwords, new_rd_idx;
>   	u32 rd_idx, wr_idx, type, qsize;
> @@ -304,6 +305,9 @@ static int venus_read_queue(struct venus_hfi_device *hdev,
>   			memcpy(pkt, rd_ptr, len);
>   			memcpy(pkt + len, queue->qmem.kva, new_rd_idx << 2);
>   		}
> +		pkt_hdr = (struct hfi_pkt_hdr *)(pkt);
> +		if ((pkt_hdr->size >> 2) != dwords)
> +			return -EINVAL;
>   	} else {
>   		/* bad packet received, dropping */
>   		new_rd_idx = qhdr->write_idx;
> 

Yes, validating the pkt header against the expected/used dwords is a 
valid check.

One thing I'm finding difficult to do with this code is get straight in 
my head why we are continuously shifting >> 2 and then in the other 
direction << 2

Surely a candidate fragment for some rationalisation down to

dwords = *rd_ptr >> 2;
if (!dwords >> 2)
     return -EBAD;

I count six shifts in twenty LOC or at least four shifts more than we 
should be doing if we just worked this over a bit.

Anyway.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
