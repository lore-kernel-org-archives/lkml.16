Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6950A2144C3
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 12:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743079672; cv=none; b=VHGItEraUAi8vY5lK7TaUCoJvB8Bk5f6I4j20TSNHKjTx8GTmZPxEhwqJ8W0WnXbCT0zBjR18N2rPBCw4MQzyVF1DuCsXGOtSLrN05OAuLPYVksFh9IJM2L9OpK7ZnXQZkNcCiEAxHdXXR/AYyjkY/ItvSxMrClcjPZtyeLZT+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743079672; c=relaxed/simple;
	bh=tycgOQWwWJbi7HTyc6T2xiJuVmwbFijiHW6hOcGcs3c=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Bp9QptajJRaDtv0QCHr2v3JCdz9kzPKCSml6feGjbrABaqt/lUAR/eF4ZVTgY9eaeWuCcLIyKsVBtOn0auiLife7mag8trvuwqNdRdBPw89FWQ2c17fAZpjSkgHDmoZG2CqwH0UKotz4QU5UK4q4BftUKABXaYVKV8qRbBxzpQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZsitrB2t; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZsitrB2t"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3912fdddf8fso1336952f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 05:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743079669; x=1743684469; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nrhZhK2vDq2GLpC5AXkPOJNIZAgprokk9oQOGjga9nQ=;
        b=ZsitrB2tocBSgyIgY9s/XNEs3xztFn5hc40l6x8pkyOsGnJ/lJAZy/g1iQqgHiruQ2
         kVCWUSTCiggSLgmhC+iRvMNZPlp+1xzF4bi9S+a2unAMo/Ls2jWdDOuRpNJ0MCWrVMpP
         +d4OUhCONbVuMKina4HIIp8CqTexa3RRJHv2JA/DuWFCrp88fIIzPs8w+OGRxJXZlvbT
         xAt1yOCd1lmQNQG8vLgP9jfDZtNMNkJbsBKAgaixhxo6iUFSz6266kU2TPnuM8EqRPfr
         GLoyLX75M649yqhe1lnvkSLs+8SK7IETs/mr6g2cx/Hjb6vcgRQP/Ku/mkZGR77lIUel
         4w6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743079669; x=1743684469;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nrhZhK2vDq2GLpC5AXkPOJNIZAgprokk9oQOGjga9nQ=;
        b=wn9WvdeJpnRkqR5f//XR2BDJe1BsMNywGzwMc9kbDuxGLzwDMn4jrhKVpPlGHavlc7
         iUpN/DhjzqKeJVqVuSp37KDCKJ8Sw3PzN+aQwvb/gQ35w7otOWiBxZjmd/wNxyVn1txp
         kZxjsp22Kgn0pI9TPneL3foauAD6H8ewUgN3kjrfcpFdlzBXCsAmSVsJqKYCyFnBdDcf
         92DOUEM1I5T2qV8eKTAi1ONrfr5n8gdLWYA0oHXTzQ3gAwXVLYLFM+CWX8Okv+ryg+cE
         3PeKrals9/PIZHStArrRvN0u8ar4lLR+ZXrDtS7xLxBKwVRmP18WvjMmk34PBjNqcIEk
         ahMg==
X-Forwarded-Encrypted: i=1; AJvYcCVK7vwHqN3BxBFuzNWLZTkkc/W1OaNz9tMc5ILq2Ta8w4Zr+2fFRj/4LxonagBzZ43nYGav/YMR2T/m/uw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8+J542Hp8jm/RRD+cgOJISMHgsXWGaalJXnk9OQ5GR6UGU49Z
	5IIm0oFVV5WLbKzCTgVJP1ySEsy4jALkL+PXrLbdcAoA5isdM30YbGpprckDDWg=
X-Gm-Gg: ASbGnct51+jK/rFe9bxPsehZD4+fC7qePYRBul6eYknEvk/1bTqpgYv9RzitxPS2q84
	R6xjY0NmGGfPz/xPGFDCjRsL0sO8Du5rqDAOxYKAYJhDwt3MTI9XncwCK0VNR0VlX8N/Wh4m50b
	nIGmg140oi8M97X2KmGUzhxL065nCPc/mN3b2PaFv9SvB8XU/NsKyoGDrTcyRmlwLt9+DyUWSyA
	cLupg9PdScWC4IRfXc3H8QGsWXh6I2vuGAlj2SnmXVVcOymZnWTIzPZslEDYNUSE/zisiJqhLPM
	W1RRXVBLPZGCiSbmOyK8OvwwLdNgPN7Xx6rfuK2b346EWrLBQjnLLqXZieYMNR0Ze7qtr/Nkf2G
	HXSLdIa8y/N1FLb/jAYV4IQ==
X-Google-Smtp-Source: AGHT+IH7vTkD1EpvQ1pnTdIXyT11ZQroNe1bXfZ6Z2W1J3NovHK5NVozVnLU1L6ojpmVJC3grA6ZVw==
X-Received: by 2002:a05:6000:23c9:b0:390:f9e0:f0d0 with SMTP id ffacd0b85a97d-39c099b5d7dmr97829f8f.6.1743079668789;
        Thu, 27 Mar 2025 05:47:48 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:f1b8:272a:1fa5:f554? ([2a01:e0a:3d9:2080:f1b8:272a:1fa5:f554])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9a6326sm19380815f8f.29.2025.03.27.05.47.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Mar 2025 05:47:48 -0700 (PDT)
Message-ID: <5be7a006-054d-4275-9c83-2687461028ef@linaro.org>
Date: Thu, 27 Mar 2025 13:47:47 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH RFC v2 2/2] ufs: core: delegate the interrupt service
 routine to a threaded irq handler
To: Bart Van Assche <bvanassche@acm.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250326-topic-ufs-use-threaded-irq-v2-0-7b3e8a5037e6@linaro.org>
 <20250326-topic-ufs-use-threaded-irq-v2-2-7b3e8a5037e6@linaro.org>
 <4a5efc8e-ec61-40c8-9b36-59e185b0fdd5@acm.org>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <4a5efc8e-ec61-40c8-9b36-59e185b0fdd5@acm.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 27/03/2025 12:56, Bart Van Assche wrote:
> On 3/26/25 4:36 AM, Neil Armstrong wrote:
>  > When MCQ & Interrupt Aggregation are supported, the interrupt
>  > are directly handled in the "hard" interrupt routine to
>  > keep IOPs high since queues handling is done in separate
>  > per-queue interrupt routines.
> 
> The above explanation suggests that I/O completions are handled by the
> modified interrupt handler. This is not necessarily the case. With MCQ,
> I/O completions are either handled by dedicated interrupts or by the
> legacy interrupt handler.

Will update the sentence with that

> 
>> Reported bandwidth is not affected on various tests.
> 
> This kind of patch can only affect command completion latency but not
> the bandwidth, isn't it?

Yes, but on a fully loaded system, it will enhance bandwidth
but with a greater latency, but without eating irq handling time
for other routines.

> 
>> +/**
>> + * ufshcd_intr - Main interrupt service routine
>> + * @irq: irq number
>> + * @__hba: pointer to adapter instance
>> + *
>> + * Return:
>> + *  IRQ_HANDLED     - If interrupt is valid
>> + *  IRQ_WAKE_THREAD - If handling is moved to threaded handled
>> + *  IRQ_NONE        - If invalid interrupt
>> + */
>> +static irqreturn_t ufshcd_intr(int irq, void *__hba)
>> +{
>> +    struct ufs_hba *hba = __hba;
>> +
>> +    /*
>> +     * Move interrupt handling to thread when MCQ is not supported
>> +     * or when Interrupt Aggregation is not supported, leading to
>> +     * potentially longer interrupt handling.
>> +     */
>> +    if (!is_mcq_supported(hba) || !ufshcd_is_intr_aggr_allowed(hba))
>> +        return IRQ_WAKE_THREAD;
>> +
>> +    /* Directly handle interrupts since MCQ handlers does the hard job */
>> +    return ufshcd_sl_intr(hba, ufshcd_readl(hba, REG_INTERRUPT_STATUS) &
>> +                   ufshcd_readl(hba, REG_INTERRUPT_ENABLE));
>> +}
> 
> Where has ufshcd_is_intr_aggr_allowed() been defined? I can't find this
> function.

It's in include/ufs/ufshcd.h

> 
> For the MCQ case, this patch removes the loop from around
> ufshcd_sl_intr() without explaining in the patch description why this change has been made. Please explain all changes in the patch
> description.

Ack will update explaining this change.

Thanks,
Neil

> 
> Thanks,
> 
> Bart.

