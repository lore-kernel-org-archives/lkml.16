Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82A0840BF5;
	Mon, 31 Mar 2025 16:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743436873; cv=none; b=L7VLgRRg/J/KM3RoSDPoEalGNKX6wUroIni5y/cD6bHZqd5WoNICEJ9YPNFSf/UzSEJFPO6SahTWs21IDShvbqK7FzdwIfRswscU/C2UxoEKteZAFYYO1HSXjHG1ltL3UJmMUTKjNB6Fk1hA9xm4kBl//NhTe3j8YOD4HiSlblw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743436873; c=relaxed/simple;
	bh=uVjb0RyJm1L/PaivBHBBBL7QBJ2FyjZoMPhE51nwvnA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i3cvb6ZL9K2bP49fVglW996PQ8a/4/Tk733PipR47ROBqRTF1bM8QJbeQc4wIE+suRMiRexquJoOEYJB20rE02w6yLLvobwCHmf3JVbmlG0CgScTmq9ywkj+VEPwY7GpQrrRqkxICuap3QZQStQfIGIvcjfYuLJyv3wZVXxz8AA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dr5+q1OB; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dr5+q1OB"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-224100e9a5cso84332845ad.2;
        Mon, 31 Mar 2025 09:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743436871; x=1744041671; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=XzCJyG6oQ+0B3aFeUDBm9UYjT0tfcf104yg1JE/+lVI=;
        b=dr5+q1OBbAiOelA81MFEeLHOn9URyeY8ER4RoBz6prah2gfxlUxPAUBEcb2e3/smtn
         V/guUkfSqqK7kD3d09NUIlq9W1IDcrQevzy99SX5cwAyPwitmXEoNLjsBWj1XXYyxfsB
         Y6czszDUSFv5iZBD+MlJKsAYArdsF+C7ZtgjkBnvYepqXkUNr2QP/Ffdw9Datt2smjel
         fetfiO26VixSlwvw8AODxpx+Ji8xY2xMe6j4+33TtxOobGSMkqFVzr/7Zr2U5fUDyeeH
         2yJc+POPwYfw6eunSmd62GxOau3JPTQvLapIEGZLqP5CO52HlqX1rCQkSuB6RFFYnDak
         1+rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743436871; x=1744041671;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XzCJyG6oQ+0B3aFeUDBm9UYjT0tfcf104yg1JE/+lVI=;
        b=lFruvly2P7GKS1Cbwohl4wb2vsWR8ei9Qtqb93RZhXDdZApQWlbLNxmIPYImTfKt6U
         oEVg/CquDHCzLD+DKFRTksNhmUKJUwAd5gGeuxCsrzu/FV6WMQWrC8GXL7u1xVl9J5T9
         Q1C7qEIznEYSlcGQ2gKkSS1le3bpQ1D0reVdHeeWL5yxAawu6bHzTFEbLdyBmWFUgCMx
         1M6TNFFSI801SDlME+JcheqaDr1oEaeamjtuQzGUOQS7y+9ebsBFZg0ZBoZ0JxUh0ups
         6dUNOLjETF/hQZR4+TufG+kr4G/w/Bkw5p8Z5vEwKX2N+KEev02PNV1Lzdtft3U3DlJZ
         tUhQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8hf2rxqQgPlRWbKXWj6FJAQTqj+vntb05gQWdgStX2Ua9+scRg/53xJ6ksXN8e9vWlPVVQFPVcru2uKDv@vger.kernel.org, AJvYcCUPqSUNVq7IaIM1lvafDi8VUtTNLd2qy1C/gfnqvypw2mmE5hQOgdDJGqpbqjp1hkXQ65thWuCwrd/eGM4=@vger.kernel.org, AJvYcCWLMzQo7Hk3+KaGRQ1DQOd+mo26Xc2vMyvWVAnLjwRfY7RcucZiiM+N+uCv90uc4mmONYb46FYki4PG@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0fiM3WLxex0a8swSmTgsVGXK1SXAxXVyTc3sYzXADVmBL9/2a
	jWfXxU8CkDdLEvw33IZfBvXwrglYO1f95REQVHg0/gS+Qf7a5fHB
X-Gm-Gg: ASbGncsDG4d2lX32PJ9gr7yaaHEsu3Xv3rNoUhCo0GRVNwUubYqNEAW6+6EeF+TuEkB
	rlgyqBW+x+xl2JxQqWt6Apzfk7qE3XguANujnrst4mCR6JKyWcO1KlRNFgOyhwRwwO83ZNAEXrI
	NhH3/uaAQ/2MFR52JIDqqqrUWh7qhxnIf2dsqkwVsCjpODPf/WKU3EyPSDMoEOTXbTqgFotMk5+
	j2V37SbYT3mHN6a1mwDUu7EG0kDo+kGYRIU/gyMcljLJeCDMlue6MYCk6ImKaqyEsO1l5mJ9E8E
	pil+EMhubb0YDD2H9cJGJS1swykiMYfC7A3pbtuANbcsDuQutTmw5x1iW2rBuh376737Ecpej1B
	0cH50MJbNSMN1b+/oQw==
X-Google-Smtp-Source: AGHT+IFAFkzTCBhjjbFbdUKV9Pbr+1K4JWfSCgpFEEtvHRH6BSIbnWoo3dOs/0Kbgui/FAWBv8Zx9g==
X-Received: by 2002:a17:903:903:b0:223:5c33:56a2 with SMTP id d9443c01a7336-2292f97a2aemr160002045ad.28.1743436870676;
        Mon, 31 Mar 2025 09:01:10 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291eec53easm70800385ad.24.2025.03.31.09.01.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Mar 2025 09:01:10 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <8064282a-17aa-4b97-b5d9-1b4a8b0dc40b@roeck-us.net>
Date: Mon, 31 Mar 2025 09:01:08 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: hwmon: amc6821: add fan and PWM
 output
To: Francesco Dolcini <francesco@dolcini.it>, Jean Delvare
 <jdelvare@suse.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Farouk Bouabid <farouk.bouabid@cherry.de>,
 Quentin Schulz <quentin.schulz@cherry.de>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
 linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250331155229.147879-1-francesco@dolcini.it>
 <20250331155229.147879-2-francesco@dolcini.it>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 xsFNBE6H1WcBEACu6jIcw5kZ5dGeJ7E7B2uweQR/4FGxH10/H1O1+ApmcQ9i87XdZQiB9cpN
 RYHA7RCEK2dh6dDccykQk3bC90xXMPg+O3R+C/SkwcnUak1UZaeK/SwQbq/t0tkMzYDRxfJ7
 nyFiKxUehbNF3r9qlJgPqONwX5vJy4/GvDHdddSCxV41P/ejsZ8PykxyJs98UWhF54tGRWFl
 7i1xvaDB9lN5WTLRKSO7wICuLiSz5WZHXMkyF4d+/O5ll7yz/o/JxK5vO/sduYDIlFTvBZDh
 gzaEtNf5tQjsjG4io8E0Yq0ViobLkS2RTNZT8ICq/Jmvl0SpbHRvYwa2DhNsK0YjHFQBB0FX
 IdhdUEzNefcNcYvqigJpdICoP2e4yJSyflHFO4dr0OrdnGLe1Zi/8Xo/2+M1dSSEt196rXaC
 kwu2KgIgmkRBb3cp2vIBBIIowU8W3qC1+w+RdMUrZxKGWJ3juwcgveJlzMpMZNyM1jobSXZ0
 VHGMNJ3MwXlrEFPXaYJgibcg6brM6wGfX/LBvc/haWw4yO24lT5eitm4UBdIy9pKkKmHHh7s
 jfZJkB5fWKVdoCv/omy6UyH6ykLOPFugl+hVL2Prf8xrXuZe1CMS7ID9Lc8FaL1ROIN/W8Vk
 BIsJMaWOhks//7d92Uf3EArDlDShwR2+D+AMon8NULuLBHiEUQARAQABzTJHdWVudGVyIFJv
 ZWNrIChMaW51eCBhY2NvdW50KSA8bGludXhAcm9lY2stdXMubmV0PsLBgQQTAQIAKwIbAwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4ACGQEFAlVcphcFCRmg06EACgkQyx8mb86fmYFg0RAA
 nzXJzuPkLJaOmSIzPAqqnutACchT/meCOgMEpS5oLf6xn5ySZkl23OxuhpMZTVX+49c9pvBx
 hpvl5bCWFu5qC1jC2eWRYU+aZZE4sxMaAGeWenQJsiG9lP8wkfCJP3ockNu0ZXXAXwIbY1O1
 c+l11zQkZw89zNgWgKobKzrDMBFOYtAh0pAInZ9TSn7oA4Ctejouo5wUugmk8MrDtUVXmEA9
 7f9fgKYSwl/H7dfKKsS1bDOpyJlqhEAH94BHJdK/b1tzwJCFAXFhMlmlbYEk8kWjcxQgDWMu
 GAthQzSuAyhqyZwFcOlMCNbAcTSQawSo3B9yM9mHJne5RrAbVz4TWLnEaX8gA5xK3uCNCeyI
 sqYuzA4OzcMwnnTASvzsGZoYHTFP3DQwf2nzxD6yBGCfwNGIYfS0i8YN8XcBgEcDFMWpOQhT
 Pu3HeztMnF3HXrc0t7e5rDW9zCh3k2PA6D2NV4fews9KDFhLlTfCVzf0PS1dRVVWM+4jVl6l
 HRIAgWp+2/f8dx5vPc4Ycp4IsZN0l1h9uT7qm1KTwz+sSl1zOqKD/BpfGNZfLRRxrXthvvY8
 BltcuZ4+PGFTcRkMytUbMDFMF9Cjd2W9dXD35PEtvj8wnEyzIos8bbgtLrGTv/SYhmPpahJA
 l8hPhYvmAvpOmusUUyB30StsHIU2LLccUPPOwU0ETofVZwEQALlLbQeBDTDbwQYrj0gbx3bq
 7kpKABxN2MqeuqGr02DpS9883d/t7ontxasXoEz2GTioevvRmllJlPQERVxM8gQoNg22twF7
 pB/zsrIjxkE9heE4wYfN1AyzT+AxgYN6f8hVQ7Nrc9XgZZe+8IkuW/Nf64KzNJXnSH4u6nJM
 J2+Dt274YoFcXR1nG76Q259mKwzbCukKbd6piL+VsT/qBrLhZe9Ivbjq5WMdkQKnP7gYKCAi
 pNVJC4enWfivZsYupMd9qn7Uv/oCZDYoBTdMSBUblaLMwlcjnPpOYK5rfHvC4opxl+P/Vzyz
 6WC2TLkPtKvYvXmdsI6rnEI4Uucg0Au/Ulg7aqqKhzGPIbVaL+U0Wk82nz6hz+WP2ggTrY1w
 ZlPlRt8WM9w6WfLf2j+PuGklj37m+KvaOEfLsF1v464dSpy1tQVHhhp8LFTxh/6RWkRIR2uF
 I4v3Xu/k5D0LhaZHpQ4C+xKsQxpTGuYh2tnRaRL14YMW1dlI3HfeB2gj7Yc8XdHh9vkpPyuT
 nY/ZsFbnvBtiw7GchKKri2gDhRb2QNNDyBnQn5mRFw7CyuFclAksOdV/sdpQnYlYcRQWOUGY
 HhQ5eqTRZjm9z+qQe/T0HQpmiPTqQcIaG/edgKVTUjITfA7AJMKLQHgp04Vylb+G6jocnQQX
 JqvvP09whbqrABEBAAHCwWUEGAECAA8CGwwFAlVcpi8FCRmg08MACgkQyx8mb86fmYHNRQ/+
 J0OZsBYP4leJvQF8lx9zif+v4ZY/6C9tTcUv/KNAE5leyrD4IKbnV4PnbrVhjq861it/zRQW
 cFpWQszZyWRwNPWUUz7ejmm9lAwPbr8xWT4qMSA43VKQ7ZCeTQJ4TC8kjqtcbw41SjkjrcTG
 wF52zFO4bOWyovVAPncvV9eGA/vtnd3xEZXQiSt91kBSqK28yjxAqK/c3G6i7IX2rg6pzgqh
 hiH3/1qM2M/LSuqAv0Rwrt/k+pZXE+B4Ud42hwmMr0TfhNxG+X7YKvjKC+SjPjqp0CaztQ0H
 nsDLSLElVROxCd9m8CAUuHplgmR3seYCOrT4jriMFBtKNPtj2EE4DNV4s7k0Zy+6iRQ8G8ng
 QjsSqYJx8iAR8JRB7Gm2rQOMv8lSRdjva++GT0VLXtHULdlzg8VjDnFZ3lfz5PWEOeIMk7Rj
 trjv82EZtrhLuLjHRCaG50OOm0hwPSk1J64R8O3HjSLdertmw7eyAYOo4RuWJguYMg5DRnBk
 WkRwrSuCn7UG+qVWZeKEsFKFOkynOs3pVbcbq1pxbhk3TRWCGRU5JolI4ohy/7JV1TVbjiDI
 HP/aVnm6NC8of26P40Pg8EdAhajZnHHjA7FrJXsy3cyIGqvg9os4rNkUWmrCfLLsZDHD8FnU
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250331155229.147879-2-francesco@dolcini.it>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/31/25 08:52, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
> 
> Add properties to describe the fan and the PWM controller output.
> 
> Link: https://www.ti.com/lit/gpn/amc6821
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> ---
> v3:
>   - explicitly describe the fan, use standard PWM and FAN bindings
>   - pwm.yaml cannot be referenced, because of the $nodename pattern that is
>     enforced there
> v2: https://lore.kernel.org/all/20250224180801.128685-2-francesco@dolcini.it/
>   - no changes
> v1: https://lore.kernel.org/all/20250218165633.106867-2-francesco@dolcini.it/
> ---
>   .../devicetree/bindings/hwmon/ti,amc6821.yaml      | 14 +++++++++++++-
>   1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/ti,amc6821.yaml b/Documentation/devicetree/bindings/hwmon/ti,amc6821.yaml
> index 5d33f1a23d03..94aca9c378e6 100644
> --- a/Documentation/devicetree/bindings/hwmon/ti,amc6821.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/ti,amc6821.yaml
> @@ -28,6 +28,13 @@ properties:
>     i2c-mux:
>       type: object
>   
> +  fan:
> +    $ref: fan-common.yaml#
> +    unevaluatedProperties: false
> +
> +  "#pwm-cells":
> +    const: 3
> +
>   required:
>     - compatible
>     - reg
> @@ -50,9 +57,14 @@ examples:
>           #address-cells = <1>;
>           #size-cells = <0>;
>   
> -        fan@18 {
> +        fan_controller: fan@18 {
>               compatible = "ti,amc6821";
>               reg = <0x18>;
> +            #pwm-cells = <3>;
> +
> +            fan {
> +                pwms = <&fan_controller 0 40000 0>;

There is no explanation for the parameters. I guess that the first is the index and the
second is the frequency. The index is not used and can be dropped (there is just a single
channel), and the frequency only makes sense if it can actually be configured.

Either case, the fields need to be documented.

Thanks,
Guenter

> +            };
>           };
>       };
>   

