Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A69532528E5
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 08:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745828318; cv=none; b=fxB1YHlU0aDmhe5lzxvAFtTmAr80inRuKUp3zMFQ/EGm97QCau+4le+j71gKMFYTxGXhyXVwoU18qTrT7JWHXod3pqtMcThedmYwUSgjJ1cesmL107gqTx+w8KaJ2JIPm8YLLxW72H3+YMpUZbGe5sgOuUY2VC+u5wR68/jcbys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745828318; c=relaxed/simple;
	bh=crOtzf5/6guJoCvf8cAZoi9PSosViFX25ektwm+jJ9c=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Tc36zaZ1TFTRIgDwoJJ2Fv4c2V0akIRvhEaXosX5f+49xS19o2JrrTsy0Vngp0nyulzVkDUo07kfQEDPCRjkl5DRxxS921/S/fppRpbsvmw82ed1pUgiT6ueJquUZ1aEHeQjDKKt/zTQE5iAe/fCqBFbvP9o7jL5qrWU3ODha0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tPSN1mBn; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tPSN1mBn"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43d04dc73b7so40563755e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 01:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745828315; x=1746433115; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n8WqmCsZc7Afx8MDa3zXhmGTEdG/beqhVSCiHK9pXos=;
        b=tPSN1mBnweiQUT45TzV5+ragvFkqUEuiNsTYTnvBP+6Pt4qiAERZV7mzOmavnwdZTA
         bn+qwgHCunnSwm+QNeZLKXF22P7m80owXpqrh9rLanjRhpv8JV5TtVULfLS+HEwqj7t2
         DVnuo0Ocg+XFy91rHZwiO3MK1yD3j+wnH1JlNyh4H/OkCIFafK1m7o3csRcLtZiYjpZM
         QMM98Cb+Z/oUdpqfi4flUjjcL7Kx8bf446GxxKHX9EpRG0Qu3ZzrzUdUmpr/hkR/hkB2
         iBM/DBBRuduuVy5GXk/X970b2VetJ3ocUBIFN1UcIjxM8xYyfLeV1oAliKIbHToXKfj3
         ajeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745828315; x=1746433115;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=n8WqmCsZc7Afx8MDa3zXhmGTEdG/beqhVSCiHK9pXos=;
        b=tXKLY2WFj3sEgmAc5RQ0LGJ0fUrH8WHqoLpDq2pJ2KaNJVCmkpWUNgNSM0TTbglNFi
         thKRUQjCtuQb3FE8O1/p5ebp4F0/EzRcHkygQeaWo6n0lW5mO3ACjmKkOIOvnXADaeN8
         RrBwsohhfWgm2OYXhrEKL+Q44fanXssqELHssW+ORzMD/HWiq4hznWQl10pZ7UmVMtnP
         rhLLAgXxmRZ1Z4ExHpLxHGerPMhxI8TqQniKUk8anw2S/h0J91uVa2vN4pg8JAh3g8KY
         ECFO53SETVTvl1sjOfQf4yEowDe3Y1wVEuqrH9KcH7fyJLlL4xtRaiWRhXIDH/Dhr41A
         1sUQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6uderYgPfyiSN2c4BWXGhV9rSVHJUnspTT9VUUfOXR1yx5wJMdrJF7/6aU1iwGqzYHMCo8jYbu+wdxxY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxWXrRcNfsXoKmHN4NDzXvfpL0SHKu96qPHFxbIMUOQIp9KLrr
	w6ZcfHc3KDLuQAPf0f7/KQc//o05GwX36dYJdCZ6ahh/ywKSI2S8CJ5rQta8Y0I=
X-Gm-Gg: ASbGncuPLWBtLcZRkK655p4KeHDx/rFNtI/BFC3I1mWAL9Do5Tk4FSSNR1sohKuhMn7
	jbiYWe/4+Ot2VBF/NQ8M86WXArcZfaJazRlkO5XSdbAmnHufhVhI+x5LeVdvMV6SNjA6kkiI8tm
	VJ+9KIBpNDftwovtoMa3eFbbRIGWISyI48XkNCavA9FOgxBzzg9CS9zIR9HK+BwijR15I4mBiZp
	OKwWyzWGBpfmTiIYvWTiZ1n7D3+pUZfaLxwx8wPKm93vX3xEC4Em+WV4qR1/2nMsfQKA5tUPJLX
	dKz3PHEX7jti+A5j3A/mB+AAbwTWdzAN1eaba+fQaX5WA6Sh01gVpwySWamjNivo3YlCkEJG+Xq
	mXaTu0pUinMrLwNGICytzRz8oDady
X-Google-Smtp-Source: AGHT+IEw8sBIV4QCGTp/d7f4QlX79Z+s4e4JXNT0qwvelGmJMAyIBDN/KZqeQrAxUXI5eMNAEi1orQ==
X-Received: by 2002:a05:600c:3b89:b0:440:6a37:be30 with SMTP id 5b1f17b1804b1-440a9ec664fmr84526495e9.16.1745828314859;
        Mon, 28 Apr 2025 01:18:34 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:e2bb:d0cc:c4c9:4442? ([2a01:e0a:3d9:2080:e2bb:d0cc:c4c9:4442])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a53044besm116320015e9.14.2025.04.28.01.18.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 01:18:34 -0700 (PDT)
Message-ID: <db91a526-e2f8-48f8-a071-f3fcc75235be@linaro.org>
Date: Mon, 28 Apr 2025 10:18:33 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v2] arm64: dts: qcom: sm8650: add iris DT node
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20250424-topic-sm8x50-upstream-iris-8650-dt-v2-1-dd9108bf587f@linaro.org>
 <3498cfda-a738-449d-9d9f-754bbc8125c2@oss.qualcomm.com>
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
In-Reply-To: <3498cfda-a738-449d-9d9f-754bbc8125c2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 25/04/2025 23:49, Konrad Dybcio wrote:
> On 4/24/25 6:32 PM, Neil Armstrong wrote:
>> Add DT entries for the sm8650 iris decoder.
>>
>> Since the firmware is required to be signed, only enable
>> on Qualcomm development boards where the firmware is
>> available.
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>> Changes in v2:
>> - removed useless firmware-name
>> - Link to v1: https://lore.kernel.org/r/20250418-topic-sm8x50-upstream-iris-8650-dt-v1-1-80a6ae50bf10@linaro.org
>> ---
> 
> [...]
> 
>> +		iris: video-codec@aa00000 {
>> +			compatible = "qcom,sm8650-iris";
>> +			reg = <0 0x0aa00000 0 0xf0000>;
>> +
>> +			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH 0>;
>> +
>> +			power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
>> +					<&videocc VIDEO_CC_MVS0_GDSC>,
>> +					<&rpmhpd RPMHPD_MXC>,
>> +					<&rpmhpd RPMHPD_MMCX>;
>> +			power-domain-names = "venus",
>> +					     "vcodec0",
>> +					     "mxc",
>> +					     "mmcx";
>> +
>> +			operating-points-v2 = <&iris_opp_table>;
>> +
>> +			clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
>> +				 <&videocc VIDEO_CC_MVS0C_CLK>,
>> +				 <&videocc VIDEO_CC_MVS0_CLK>;
>> +			clock-names = "iface",
>> +				      "core",
>> +				      "vcodec0_core";
>> +
>> +			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
>> +					 &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
>> +					<&mmss_noc MASTER_VIDEO QCOM_ICC_TAG_ALWAYS
>> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
>> +			interconnect-names = "cpu-cfg",
>> +					     "video-mem";
>> +
>> +			/* FW load region */
> 
> I don't think this comment brings value

Right

> 
>> +			memory-region = <&video_mem>;
>> +
>> +			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>,
>> +				 <&videocc VIDEO_CC_XO_CLK_ARES>,
>> +				 <&videocc VIDEO_CC_MVS0C_CLK_ARES>;
>> +			reset-names = "bus",
>> +				      "xo",
>> +				      "core";
>> +
>> +			iommus = <&apps_smmu 0x1940 0>,
>> +				 <&apps_smmu 0x1947 0>;
> 
> I think you may also need 0x1942 0x0 (please also make the second value / SMR
> mask hex)> +

I don't see 0x1942 in the downstream DT, and which mask should I set ? 0x1 ?

>> +			dma-coherent;
>> +
>> +			/*
>> +			 * IRIS firmware is signed by vendors, only
>> +			 * enable in boards where the proper signed firmware
>> +			 * is available.
>> +			 */
> 
> Here's to another angry media article :(
> 
> Please keep Iris enabled.. Vikash reassured me this is not an
> issue until the user attempts to use the decoder [1], and reading
> the code myself I come to the same conclusion (though I haven't given
> it a smoke test - please do that yourself, as you seem to have a better
> set up with these platforms).
> 
> If the userland is sane, it should throw an error and defer to CPU
> decoding.
> 
> This is >>unlike venus<< which if lacking firmware at probe (i.e. boot)
> would prevent .sync_state

Well sync with Bjorn who asked me to only enable on board with available firmware ;-)

> 
> [1] https://lore.kernel.org/linux-arm-msm/98a35a51-6351-5ebb-4207-0004e89682eb@quicinc.com/
> 
> [...]
> 
>> +
>> +				opp-480000000 {
>> +					opp-hz = /bits/ 64 <480000000>;
>> +					required-opps = <&rpmhpd_opp_turbo>,
>> +							<&rpmhpd_opp_turbo>;
> 
> nom (nom nom nom nom nom)
> 
>> +				};
>> +
>> +				opp-533333334 {
>> +					opp-hz = /bits/ 64 <533333334>;
>> +					required-opps = <&rpmhpd_opp_turbo_l1>,
>> +							<&rpmhpd_opp_turbo_l1>;
> 
> turbo

Ack

> 
> Konrad

Thanks,
Neil
