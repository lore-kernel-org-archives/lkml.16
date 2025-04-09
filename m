Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76AA31DD9AD
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 07:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744184904; cv=none; b=FA000Ykiyi4+5tNrLjt60S7PSMLEy3cG2AYiqHMYdMUIxTN7+toEfF0Nuh3kD1el+m561PWbin4Ag2FuJgQYQGoxU14RD+KWpncZPmoPv198gHjWIe1hZWBUzJH/VD0cUYBQk+zKvyUr9c/7oVvLnSMOKngwh1Oq/SlUxCzdATs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744184904; c=relaxed/simple;
	bh=CVRaKnBtdcLRjR5kbcpcnlB/ovnUiXudXDc8NsdWX1I=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Ko4R5fpmFY6JEqs0NRoPgtonWHN/wFqDtpCef39EWXk1ryGgI6sl2Y0NP7KktwFIfOhBC9JsSems4jD4yRbNYpnMPOt4jZS3pnEJFft1l36FEEOPSh+eK2w9HuWWjrjyqwQzlgsBoPnKfyzl8a8QxUjji+h/lKGMvz57tD1dRVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cCs91Xye; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cCs91Xye"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43ede096d73so29294565e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 00:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744184901; x=1744789701; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HGFyqT9NPIWBCWTRXkDoS34nBBaN8hdpQFO+BMOZHJ8=;
        b=cCs91XyebBMz9Dxfs2JDJIbqE9XZnyVh10AlrdAwvJXZpUq/XuKgLL1n7grp7P/rvm
         6HwFDXeyNI7P1IdS0JDddyxjVkEdtwc3cxNTRXpE3G/cPK3vDsYfzOe4Ellw5DrisaYA
         qaq6mgfr7ZY+jpYhaOpSDWpIjPbQhZbjg4GHT7SIjn/WFbT9b06oQKzdHPh4JPhyfwb6
         iCFDc+DdCgUEF06eQW5NvZDtZd4wPSbnsP7SjOYX//1ivuv8EV6UYrIpNVkVNpFMdpk4
         O6R/jc6sdEdVV7IM3yhdLQx6AZbwMDWnkP4AOGknMJg0f4cvEjdNQ6Tn9pA1mQ9H7o2P
         Mqhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744184901; x=1744789701;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HGFyqT9NPIWBCWTRXkDoS34nBBaN8hdpQFO+BMOZHJ8=;
        b=sLsJkTcfteHUbLOrJmWHAitQE78Na2ehdbqt0S2GKM1WXsAgGS+im3QGVG8HsTjgDr
         KquRvu4egEj8bxV0Vq9QZ4e8UD165CYK0G25IumYybjCJjo/Pdi9xKYvSAvgoweEPuOA
         eEywCTXLwm6S3gHyiWVX+cXga2b/IMFb0yUZjFx4+r3x984waxWYBT7DshBx4uha8wcE
         cwyFwPsaH+7lhTSSFl67zTurz2yw/rfeHIZbxuibOkNwhacuvYsJJiJoeirNuRzR6tmo
         I7NxHzA2lnj75SLH0eEUl+61RiijKvi34PSpYFIxz/8gFuuXZRH41YfyICP4LIo67bqj
         e6Tg==
X-Forwarded-Encrypted: i=1; AJvYcCWg+oCU/fpDgOveTgPRczXV8rOtvFw1BpPpOHh4dVgzaLhKO655scTXO7+wfme6b1En5qcJ7ev005B6mU0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9NIRSSLAAjTZnAOekX2VnIy6irDa6baa2mfmSeVrNcyYHzY5p
	pOcWioT6yd1mLofW6+bDVjdDLnMmM2sscUX28OkoYoPPgh4AAbG8sWOdfNkdJQ0iYGA5ffdUbrw
	U
X-Gm-Gg: ASbGnctQsMcSTnmBPqMT80lDwxZwq9931WNeXJ0jV11c9qUyVcMEBNfsCXp3P508E4h
	fEMJ76j9qebs6yGkvEP0c8Z7GeKRh8JY+ISQWe6mvvNGzxSLpRGTpnMCF2haUfNFJ7F4hRMKTsB
	bVM9ipxJoYxdknX0eQoAhhuZSHnDflGVJTT59R6ZqUg2/+k65zKvDmoYZYqLURkbYYuNVy6O6Q8
	vodJqs9t81OwIjPVHjLTOB1yvoMTMzW1vkXJE1Xig60MK5xWsPeYnR4norVQv2b5jzW2F3jqgYp
	GHI8YbZKV9FBoXl/fcfPcQ+KXZSxLP7E6p5olfWK7V887mu8cpWycq6eL9pf3toyk3W5x5bPGT9
	fRh4sHl/6DIQUSwkSYg==
X-Google-Smtp-Source: AGHT+IHfjF7uGAS/KgUH5dBtEW7W+pagDQLtXM/5QYQL0V2if6drhjKkNryn2CQ+vhLloCnfvQVRpA==
X-Received: by 2002:a05:600c:1e20:b0:43c:fffc:786c with SMTP id 5b1f17b1804b1-43f1ecdb07bmr16859475e9.19.1744184900748;
        Wed, 09 Apr 2025 00:48:20 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:87d9:979a:1261:ab65? ([2a01:e0a:3d9:2080:87d9:979a:1261:ab65])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f235b050fsm7390925e9.40.2025.04.09.00.48.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 00:48:20 -0700 (PDT)
Message-ID: <c0af0d1a-1ad8-4aa1-8b98-f32626aa1e1a@linaro.org>
Date: Wed, 9 Apr 2025 09:48:19 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH] arm64: dts: qcom: sm8550: add iris DT node
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Dikshita Agarwal <quic_dikshita@quicinc.com>
References: <20250407-topic-sm8x50-upstream-iris-8550-dt-v1-1-1f7ab3083f49@linaro.org>
 <jpf7vqlmzlaykgm77brsfcqh4mqxau6pcahd6s3e3e7u3umnyn@vukqip26nqrw>
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
In-Reply-To: <jpf7vqlmzlaykgm77brsfcqh4mqxau6pcahd6s3e3e7u3umnyn@vukqip26nqrw>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/04/2025 00:00, Bjorn Andersson wrote:
> On Mon, Apr 07, 2025 at 03:03:33PM +0200, neil.armstrong@linaro.org wrote:
>> From: Dikshita Agarwal <quic_dikshita@quicinc.com>
>>
>> Add DT entries for the sm8550 iris decoder.
>>
>> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   arch/arm64/boot/dts/qcom/sm8550.dtsi | 69 ++++++++++++++++++++++++++++++++++++
>>   1 file changed, 69 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
>> index f78d5292c5dd5ec88c8deb0ca6e5078511ac52b7..ab49329a435d87107a4ff20cb7b9eeacbaf63247 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
>> @@ -3220,6 +3220,75 @@ opp-202000000 {
>>   			};
>>   		};
>>   
>> +		iris: video-codec@aa00000 {
>> +			compatible = "qcom,sm8550-iris";
>> +
>> +			reg = <0 0x0aa00000 0 0xf0000>;
>> +			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
>> +
>> +			power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
>> +					<&videocc VIDEO_CC_MVS0_GDSC>,
>> +					<&rpmhpd RPMHPD_MXC>,
>> +					<&rpmhpd RPMHPD_MMCX>;
>> +			power-domain-names = "venus", "vcodec0", "mxc", "mmcx";
>> +			operating-points-v2 = <&iris_opp_table>;
>> +
>> +			clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
>> +				 <&videocc VIDEO_CC_MVS0C_CLK>,
>> +				 <&videocc VIDEO_CC_MVS0_CLK>;
>> +			clock-names = "iface", "core", "vcodec0_core";
>> +
>> +			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
>> +					 &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
>> +					<&mmss_noc MASTER_VIDEO QCOM_ICC_TAG_ALWAYS
>> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
>> +			interconnect-names = "cpu-cfg", "video-mem";
>> +
>> +			/* FW load region */
>> +			memory-region = <&video_mem>;
>> +
>> +			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
>> +			reset-names = "bus";
>> +
>> +			iommus = <&apps_smmu 0x1940 0x0000>,
>> +				 <&apps_smmu 0x1947 0x0000>;
>> +			dma-coherent;
> 
> Given that this node depends on vendor-signed firmware and without
> firmware we're prevented from hitting sync_state, wouldn't it make sense
> to leave it status = "disabled" here, and only enable it in those cases
> where firmware is available and firmware-name specified?

Right I'll only enable it on the qcom dev platforms where the firmware is
already on linux-firmware.

Neil

> 
>> +
>> +			iris_opp_table: opp-table {
>> +				compatible = "operating-points-v2";
>> +
>> +				opp-240000000 {
>> +					opp-hz = /bits/ 64 <240000000>;
>> +					required-opps = <&rpmhpd_opp_svs>,
>> +							<&rpmhpd_opp_low_svs>;
>> +				};
>> +
>> +				opp-338000000 {
>> +					opp-hz = /bits/ 64 <338000000>;
>> +					required-opps = <&rpmhpd_opp_svs>,
>> +							<&rpmhpd_opp_svs>;
>> +				};
>> +
>> +				opp-366000000 {
>> +					opp-hz = /bits/ 64 <366000000>;
>> +					required-opps = <&rpmhpd_opp_svs_l1>,
>> +							<&rpmhpd_opp_svs_l1>;
>> +				};
>> +
>> +				opp-444000000 {
>> +					opp-hz = /bits/ 64 <444000000>;
>> +					required-opps = <&rpmhpd_opp_turbo>,
>> +							<&rpmhpd_opp_turbo>;
>> +				};
>> +
>> +				opp-533333334 {
>> +					opp-hz = /bits/ 64 <533333334>;
>> +					required-opps = <&rpmhpd_opp_turbo_l1>,
>> +							<&rpmhpd_opp_turbo_l1>;
>> +				};
>> +			};
>> +		};
>> +
>>   		videocc: clock-controller@aaf0000 {
>>   			compatible = "qcom,sm8550-videocc";
>>   			reg = <0 0x0aaf0000 0 0x10000>;
>>
>> ---
>> base-commit: 2bdde620f7f2bff2ff1cb7dc166859eaa0c78a7c
>> change-id: 20250407-topic-sm8x50-upstream-iris-8550-dt-2846b493e652
>>
>> Best regards,
>> -- 
>> Neil Armstrong <neil.armstrong@linaro.org>
>>

