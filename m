Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D7D224C669
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 12:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746448209; cv=none; b=WBlroY5XFGW/03ilD5kUhqSBxxWWA6BDy+CAA1Y8fjnCv+CizBlPG+BX58PnQsjTZDO4pgumXTWivHqHsBPNgwQdnqRRtGlOOQUGSGHZoMhXMoigXpYpiDQaDpiyFdL4bnoWV0LmjaJ82zc+Un09iAOzBPxQ7Zb0a1emDqGEgjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746448209; c=relaxed/simple;
	bh=eC4rf7B14lDTCwZ8B+eqbwh8ui74TY7nf9x4H9JFM7k=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=XfSPBcjthzq801LGrwedwXpIvTpmOI349AcyZgPL9oijMG3Sd+X0+AGY1eygudWmCIzjWsmAJm7PAa0wqBS6Y0ckf0Q7CN2N5N9cby0jIm7MfooCd2YSQ9xaUkNOQ9zpumF9pRJ1uM8Vd4hZoHnSCSS+Zd8udpu7SQ/c2GJrFgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bAfu4hin; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bAfu4hin"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-441c99459e9so7932715e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 05:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746448204; x=1747053004; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t0GjryULo4v09EAImrhm7s0nrCH1vBTnHzkq05ckM1c=;
        b=bAfu4hinbiGfwi6+7dL8teBEkKg63WlGuzzsHJGajG5YWCAJgwsvbfq1EzT48DYAjg
         ASCAeIm7hk0PQyNcRZ+5XW4IVKjKeOSARnIiU6IaFWJuME8Bc1y32pRFxi+6oIKid166
         sY1mZJwmRDwdLbqe2ABzsHdxwEboHDPrgDBpPuchJNVufuk0WySIw7S5yZbeOwuTMytV
         aNOPzJq4cgh9uPciFqW/P7ZAkp7q+PmTJ7SkOJ81haWAJ2YQ1fOH4tMJCKg45Acgmd/1
         R1guZbZ4IAa8KxKUtT90/PTvlvczKHZygNGmFAWAhYpgqKaOBquPcj3FGc+HecxlqMP4
         bZdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746448204; x=1747053004;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=t0GjryULo4v09EAImrhm7s0nrCH1vBTnHzkq05ckM1c=;
        b=kgS/Bx7zv0hqZn009lDQpcGjOCKQk4syH1Lc1XVEHu7wV5jfCHoNaWbqdWd0zXs32Z
         VZ1RYqrw9T7lFMOz46BZ1PGgB5d36c5BgO6dFvF3Ep+SNMEBtXJL4EGQyvWLvGexMUhI
         cSJnvu7WANL3J8CCahHsA1h+XUQy1MM9A+AqyZlKv/lyTg8GaD9V6VcAcPs/gjjrfgb+
         hoXI5yq5c1OCndZeMYUduC9VPZrXuEEbb+gEV8N+46CU7z+8buxEUf4cxTKsgLRpio+x
         sXVfYEp2IiJqhnv7mhSn47MsKLZy/jN1PqhLZtomXdVAz2i1Aoh4mvpD8vhhMSCmOufl
         PTfg==
X-Forwarded-Encrypted: i=1; AJvYcCV8TsiiO8jXDz4Ou/OHsS9B81IfnYOsOUA10esp8DENLQ/0wDeCaUKBeZ2zgc8gY3xol3UfW7ZsgLVYnQU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyyGHaWUq5KqSzxXrjQNXbf8B0dHgLFEdK8vN+MjcUyiY9TKLGa
	KSq2Um//ujdBDSay2g7qZfUwqTK5ddSQBeygGK0s1HidaD0UGXM337q9lLjYi6Y=
X-Gm-Gg: ASbGnctvOt+uIVLJGHukePAxueoC2l+ouRz9aR9eXBrx3noVtXV/iOqiwHv/2BW5+Hl
	1iIoQo5o1FtVF50q7zN1Wx07/iC42HM0RSX6pG4nczfP6h/UgPKhPh0Ni8fiRfeIA25POq8dT+u
	qnqoRRzYzSzzjlqINDPot+YWH15/gV7dJA9AuFI/SYKc/THdYHcYYlPYaof5UO7nLJsdiZ6nbcN
	dGPuSUfeBC6+Dnjc9E0dNnPUo1E5VxVV+PJd7wbud188aG7hqlBLKtJFFNUyC09Db8tood7LS90
	xHssIfKlMqWx1uCcYsPjoBkc6dAXq22np/lOG4Q+X0SAZ+EdZ2J4azCmsKC1nTfDSsYgakRnZZy
	uNVkp0YvaHCngDEK2fQ==
X-Google-Smtp-Source: AGHT+IEXaFpXxqRcmFqcdi7rW9veV7mUOW9LMRdHD1faNwTOAtntg/32GzuRuVivniydhFYII1GnXQ==
X-Received: by 2002:a05:600c:19c6:b0:43c:e9f7:d6a3 with SMTP id 5b1f17b1804b1-441bbec2a80mr104674185e9.13.1746448204392;
        Mon, 05 May 2025 05:30:04 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:88d3:1ad7:3ae1:56e3? ([2a01:e0a:3d9:2080:88d3:1ad7:3ae1:56e3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441bc83d471sm108852165e9.26.2025.05.05.05.30.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 05:30:03 -0700 (PDT)
Message-ID: <5bb02494-e974-4d2f-a00f-417312b73bc1@linaro.org>
Date: Mon, 5 May 2025 14:30:02 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v6 1/3] dt-bindings: reset: Add compatible for Amlogic
 A4/A5 Reset Controller
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Zelong Dong <zelong.dong@amlogic.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Rob Herring <robh@kernel.org>, kelvin.zhang@amlogic.com
References: <20250411-a4-a5-reset-v6-0-89963278c686@amlogic.com>
 <20250411-a4-a5-reset-v6-1-89963278c686@amlogic.com>
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
In-Reply-To: <20250411-a4-a5-reset-v6-1-89963278c686@amlogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Philipp,

On 11/04/2025 13:38, Kelvin Zhang via B4 Relay wrote:
> From: Zelong Dong <zelong.dong@amlogic.com>
> 
> Add compatibles for Amlogic A4 and A5 reset controllers,
> which fall back to 'amlogic,meson-s4-reset'.
> 
> Signed-off-by: Zelong Dong <zelong.dong@amlogic.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Acked-by: Philipp Zabel <p.zabel@pengutronix.de>
> Link: https://lore.kernel.org/r/20240918074211.8067-2-zelong.dong@amlogic.com
> Signed-off-by: Kelvin Zhang <kelvin.zhang@amlogic.com>
> ---
>   .../bindings/reset/amlogic,meson-reset.yaml        | 22 ++++++++++++++--------
>   1 file changed, 14 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml b/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml
> index 695ef38a7bb346c92b4cf428e7615d45682c940a..150e95c0d9bed74c7045942610a311114a257889 100644
> --- a/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml
> +++ b/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml
> @@ -12,14 +12,20 @@ maintainers:
>   
>   properties:
>     compatible:
> -    enum:
> -      - amlogic,meson8b-reset # Reset Controller on Meson8b and compatible SoCs
> -      - amlogic,meson-gxbb-reset # Reset Controller on GXBB and compatible SoCs
> -      - amlogic,meson-axg-reset # Reset Controller on AXG and compatible SoCs
> -      - amlogic,meson-a1-reset # Reset Controller on A1 and compatible SoCs
> -      - amlogic,meson-s4-reset # Reset Controller on S4 and compatible SoCs
> -      - amlogic,c3-reset # Reset Controller on C3 and compatible SoCs
> -      - amlogic,t7-reset
> +    oneOf:
> +      - enum:
> +          - amlogic,meson8b-reset # Reset Controller on Meson8b and compatible SoCs
> +          - amlogic,meson-gxbb-reset # Reset Controller on GXBB and compatible SoCs
> +          - amlogic,meson-axg-reset # Reset Controller on AXG and compatible SoCs
> +          - amlogic,meson-a1-reset # Reset Controller on A1 and compatible SoCs
> +          - amlogic,meson-s4-reset # Reset Controller on S4 and compatible SoCs
> +          - amlogic,c3-reset # Reset Controller on C3 and compatible SoCs
> +          - amlogic,t7-reset
> +      - items:
> +          - enum:
> +              - amlogic,a4-reset
> +              - amlogic,a5-reset
> +          - const: amlogic,meson-s4-reset
>   
>     reg:
>       maxItems: 1
> 

Do you plan to take this change ?

It has been laying around on the list for a while now, I plan
to apply it in my amlogic/drivers tree at the end of the week.

Thanks,
Neil


