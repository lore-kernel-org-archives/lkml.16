Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02E121A0B08
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 13:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745502723; cv=none; b=Euw5EuyKJ3uz8MBBJ2lZlZmMnLCLruS1/+hcie1j7uu3BZxL/WON4kes6JVA/YhAk0b1S6EhVLbJ6ixcryMsftv3eqQzRMeUgfadUsBkjfLHtRRg2/61eK4lU2NWTCtVvSeWOtg1y8j/4d1wzy3FDD1TCMYWeGjLNAF55hnOd6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745502723; c=relaxed/simple;
	bh=HuSOrMsBPvuGrn3yCiHEz7f6WJyDx/K7FHHcANFQ3v4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Cn5Hj3MHNsWu9mvPyDPFDTrm+uSEzJ2JoGx8cBjClObDVv0k0dmnM7z1ZWsMFZdNmPXzKBVl6mhMZKvlHijJKj6/3N7DPK+/vps4GXrpRR0x4Al6czFPEVHaVZO/80qS5lPkKqZJs18yzHXv3wYlegIcGbZa1BTFOYc9XxWCJc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LbJAJE0R; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LbJAJE0R"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-39c0dfba946so764104f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 06:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745502720; x=1746107520; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ol+RP36G4w38iAX1eUTpERYoeJnh8WjSro9BvevXWbw=;
        b=LbJAJE0RonQRNOqt3LtqDyXav18CEHyT4p+BINufoiJKCiZS0qLXdC8Rd716QSmAQm
         7BIj7kq0ibcARscoaWNbgxbm2b1hm1yOYCr0c8+NIIv6XHNn9yyTmCQOFniDAat/rmsH
         lvyWZz/OeOwrPaTiEEFsC+GuwH2AVC5A/6yD1ASaVwFaE/Fmb6xjZAaAftbOSOiqmE/i
         eJOx49HEnrZf057V5AeOP89tf/dtc/yoaxTgke/OxqaquJdkSxQHbEy/UYoXnV8G+VRh
         PhGQpDTa+xPS+80TrA0A67fmOQsJTvh/2On4sSv476YyT+cfIQVFWa3xRnm4+1r2txv9
         E+pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745502720; x=1746107520;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Ol+RP36G4w38iAX1eUTpERYoeJnh8WjSro9BvevXWbw=;
        b=Kp0+OAS8M3TqAyR2iKDm90wweN6mLQClK5EzjfasEEkQyo/2PERpQQC/rok+iTmL+Y
         cJ+GJP/CNVka2SJUovltnGMNd0E9tAJf0w1oz2Rt5uPBiWHwShpWVtDBmoDHrEy+MrPm
         p5ZZTH//UFVMtfuvgsnf3WG5zA9bWQP3vhVvtgZxAY4KE8Q2+VuOIhLBlWDPvW19vOVY
         4n0FdzaGVg7WueLDJ4O1EeuY+qkqsOmKhPZhv0Kcu+iXbeSM7Jd0ckUy/w9OZp4XMgW7
         zE6ToL5NEySize8IMJLO6Z+QNcAAvCDPtfZIkkkmv4Hg092b5ukiGoYWq2CFGYdKpAGd
         xz4g==
X-Forwarded-Encrypted: i=1; AJvYcCV0X9njq6LXuXeaz8fa2QfgWzjal5hOAU/1Q8FVNyEoCzhbZTg5+su/4dWR0KTJupZdJK+sIHjkeJRQH30=@vger.kernel.org
X-Gm-Message-State: AOJu0YynWFzyVNgSVxRIbGCuvrHOsvIzLGq+LJxKYAJ7Io84pM441b/S
	L/TbU9KRNBKLjOMXvBvmggRD8BQ+wW5cHJ2l9QssZ3WVtzgyKEjgYJlkpVtJHzMsU1tooK4syN7
	9
X-Gm-Gg: ASbGncvAya77mezO8dJp17l4N77zGuDZp90gPDtLfRIUF9fEn9OzDawXGTxxw+Sg4ek
	RNL8krJroKSWv61PTraifgvDHRQW9qqZQnTWDdNBC1HhpXFoqi/2+axyvUNyGQ27ps+wNQ20pRm
	m/CCDJYtOhKfD0yAKflyghPWEwMLPB4KqD7P7CJGxdFLV7P4gg1zLZ9gYDeSyvNGfXsAfIuTcFp
	PbE3znAc0fMnolaXSVG0MaHX8CZy6eHjs4ut+7I7PoGyQwWGIG1kDj1ic9mgQisqZMw2wy/vd8L
	gSWHQDXtQ5WPbm2ZJlyRAKSTQhV8A0IR5Rl0e11VvOnTca9Wo1MIlkY14QEduAG7fmJm5AA6HCe
	Wm5eYeqmKZyLpZtlXNw==
X-Google-Smtp-Source: AGHT+IGt0ddBz4oRFk+JyZ3+u5ZV6Qt1q6gXu50XzgPpKAgL/bI02kyNDZx6wTjkCqJ8NEWTMa8wfw==
X-Received: by 2002:a05:6000:178a:b0:391:4674:b10f with SMTP id ffacd0b85a97d-3a06cfa2c6amr2261345f8f.36.1745502720246;
        Thu, 24 Apr 2025 06:52:00 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:a24a:bfda:f031:720d? ([2a01:e0a:3d9:2080:a24a:bfda:f031:720d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d4a815bsm2169998f8f.8.2025.04.24.06.51.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 06:51:59 -0700 (PDT)
Message-ID: <479224f1-86f1-4561-af28-01b6354b4829@linaro.org>
Date: Thu, 24 Apr 2025 15:51:59 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH RFC/WIP 3/4] arm64: dts: qcom: sm8750-mtp: Enable USB
 headset and Type-C altmode
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Jessica Zhang <jesszhan@quicinc.com>, Abhinav Kumar
 <abhinavk@quicinc.com>, Abel Vesa <abel.vesa@linaro.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250424-sm8750-display-dts-v1-0-6fb22ca95f38@linaro.org>
 <20250424-sm8750-display-dts-v1-3-6fb22ca95f38@linaro.org>
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
In-Reply-To: <20250424-sm8750-display-dts-v1-3-6fb22ca95f38@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/04/2025 15:04, Krzysztof Kozlowski wrote:
> MTP8750 does not have audio jack connected and relies on USB mux
> (WCD9395).  Add necessary nodes for proper audio headset support along
> with USB Type-C altmode and orientation.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 58 +++++++++++++++++++++++++++++++++
>   1 file changed, 58 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
> index bd0918e8a7a7e03530eea577c7609454fecfdaf7..c3470e1daa6b7f31196645759be23fb168ce8eb7 100644
> --- a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
> @@ -53,6 +53,15 @@ wcd939x: audio-codec {
>   		vdd-mic-bias-supply = <&vreg_bob1>;
>   
>   		#sound-dai-cells = <1>;
> +
> +		mode-switch;
> +		orientation-switch;
> +
> +		port {
> +			wcd_codec_headset_in: endpoint {
> +				remote-endpoint = <&wcd_usbss_headset_out>;
> +			};
> +		};
>   	};
>   
>   	chosen {
> @@ -220,6 +229,14 @@ port@1 {
>   					pmic_glink_ss_in: endpoint {
>   					};
>   				};
> +
> +				port@2 {
> +					reg = <2>;
> +
> +					pmic_glink_sbu: endpoint {
> +						remote-endpoint = <&wcd_usbss_sbu_mux>;
> +					};
> +				};
>   			};
>   		};
>   	};
> @@ -845,6 +862,42 @@ vreg_l7n_3p3: ldo7 {
>   	};
>   };
>   
> +&i2c3 {
> +	status = "okay";
> +
> +	wcd_usbss: typec-mux@e {
> +		compatible = "qcom,wcd9395-usbss", "qcom,wcd9390-usbss";
> +		reg = <0xe>;
> +
> +		vdd-supply = <&vreg_l15b_1p8>;
> +		reset-gpios = <&tlmm 152 GPIO_ACTIVE_HIGH>;
> +
> +		mode-switch;
> +		orientation-switch;
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +
> +				wcd_usbss_sbu_mux: endpoint {
> +					remote-endpoint = <&pmic_glink_sbu>;
> +				};
> +			};
> +
> +			port@1 {
> +				reg = <1>;
> +
> +				wcd_usbss_headset_out: endpoint {
> +					remote-endpoint = <&wcd_codec_headset_in>;
> +				};
> +			};
> +		};
> +	};
> +};
> +
>   &lpass_vamacro {
>   	pinctrl-0 = <&dmic01_default>, <&dmic23_default>;
>   	pinctrl-names = "default";
> @@ -973,6 +1026,11 @@ &pmih0108_eusb2_repeater {
>   	vdd3-supply = <&vreg_l5b_3p1>;
>   };
>   
> +&qup_i2c3_data_clk {
> +	/* Use internal I2C pull-up */
> +	bias-pull-up = <2200>;
> +};
> +
>   &qupv3_1 {
>   	status = "okay";
>   };
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
