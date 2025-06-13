Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5081A279DDD
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 09:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749806073; cv=none; b=NlXsKZ9tNsTvldPLfu435vCgST8UPVlelIhbCMrnGN4MBUth6fj9EhDHcfc8eqUfOgF7RPBY6YkBCA2QUKT0hYacYGQsDl6v8Zgo8TzbUE01iHjEbgsc1GPPUJJ4wgbiqu4oXwg+5Lr6jST64/Eq6jwp02rC5hU3jx3BuIYa3Xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749806073; c=relaxed/simple;
	bh=U4FrUnxsS+O88EpMRs/X5M2gy9Ob8GhzpGYbm/BQic0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=U+QOUMT/FSsxq0tjxjls4Ui06TX2T5oemaEdPXdvLA+4kELvyhf4GPSHCNAue93Pbxs/rUiVbkOc0mll9dQ6N59cq6N/3zqOQgbgKkK4aY+9vtDsi2HlZZBeA1DGMWl/86A9QM4kkbC7zdb7iq2Pmk/v2X7VGTbUSG4hgeP/Qyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pqUDzcBF; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pqUDzcBF"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a536ecbf6fso1217868f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 02:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749806069; x=1750410869; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QxfIULPvH1TVJo+Bp0irHce0KEkyksYpcZ/Cbp7r00Y=;
        b=pqUDzcBFV6RG06MgGflTxIjg1liDnk1gsEGgSGBoZMh+pFiUq/2G502r9TXTwDsjVj
         JbZ345JbxpD3v1u6bUt/dqyUSYq8bJtJVPWqIudiToPjlo22LcQVjozZk/1dmJNN38G9
         OHt86ReFqDxTB2Q46Bpzq3B5IMS4XkYaxQtXjVVkB/2yOqGlg5u8FlzANeDjfoBV9TU5
         uCPmYyQImOn0NJMzjYIwUPHUqOE+DJ4djlQtAo4dLE0eDA3qlkcjEEDKSRF+hR3ko9dC
         iC82B/tH+yUpyEo4oJ57s1Hbcz1cwAepYYmgWOpnvKF9ZL5J/kqWZkqbWRMFljGlqWMQ
         zfjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749806069; x=1750410869;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QxfIULPvH1TVJo+Bp0irHce0KEkyksYpcZ/Cbp7r00Y=;
        b=WdDQGoHp6y/JpMcWe/6g1i6pc/HApPMsa9l3KoPVf2OHAHR9NfHw+sGbyQXBaHXWTa
         qQBrZHT9K2W2algc1c1aYj9AnK/wunyCvHow9MdKn9ytSw6GHf7YMAyxdTyKssABvmIW
         y9hSlA8doPC/SbVlRcOdp2KhykzCGjevRYe/lqFxTTyPJi1Qt1U47r03Oswasel2rvK3
         ynBVAuljvvvro7QrmbhssYRjz9PtENDjJlV5AsRdYFFmC1b5Y0fTXLTj1VruyTrAAAJO
         wv6YHu2y9z9GPcszibRojQqXS3k3jx+hxXFzmG1DOida3WS1oznvsQft0xw6yuBAEro7
         zaaQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7TuSVxKWrVjHXHm6263EDfVqe+ygaLbkOg5hN1lwkzoul8pybxC5HD0Yt6GHEGQUtrDxPG8C9XHIrEYM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtbtBwDomFoGn5EEbJM8t8VUcMasYhZlFBe3idbyTME/nk3BeD
	z1R/cjVusPLCA2cPutwzJnHqEAi169VYmvBmTDFSYCGKvD4pDEsh1Zp/p9Uespi8C5U=
X-Gm-Gg: ASbGncv109VVNGYSUPfyT9vQjxDaUlRTNIEAjJmf6NhllQAZBOLTU0urDxyGp5LN0GT
	Xi3GaHcyab1XlddxP5yE0N57eamDYeh85XM/voBSMS3XjoWBR3JWzh4E0l93PnJuFd/LuyhyIT8
	73+yTns04MJPoAIK7XohSSN1ukWDpF4emaM1H9jSXuVDNeqBvuIwc1aZFRXm87ozLzgJ8/bLa5v
	8BOMwphvZM2YuUvLYKk11s1f2TQWOvErAhnWLdYYJgkN1BEYi2yz8MRwKNEqSKg3Olyteqn0H8N
	U0IIIWPpHUMXBczodqb/TCDUwVNVtTLYlw/ZI6NWGBhXBhn3xEhgRr1kPzNONkXuk7CHbrMyrxO
	QWAAsdNSq0VjCeMqliyAQrwJkzcsulY11VgqTbdw=
X-Google-Smtp-Source: AGHT+IGQOFD/EY7S2QDUIKx6X5WFj8qb8/qrnjFsfEXjcL1hzrA6uPRMdM2o+qwKrI1AezZg1EjOrA==
X-Received: by 2002:a05:6000:1445:b0:3a5:52cc:346e with SMTP id ffacd0b85a97d-3a568655fe0mr1850481f8f.6.1749806068043;
        Fri, 13 Jun 2025 02:14:28 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:4144:6a84:fe1d:3aae? ([2a01:e0a:3d9:2080:4144:6a84:fe1d:3aae])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a54a36sm1781165f8f.15.2025.06.13.02.14.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 02:14:27 -0700 (PDT)
Message-ID: <5d624bce-a46f-4b75-b785-56def0c7f108@linaro.org>
Date: Fri, 13 Jun 2025 11:14:26 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/7] dt-bindings: phy: Add document for ASPEED PCIe PHY
To: Jacky Chou <jacky_chou@aspeedtech.com>, bhelgaas@google.com,
 lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au,
 andrew@codeconstruct.com.au, vkoul@kernel.org, kishon@kernel.org,
 linus.walleij@linaro.org, p.zabel@pengutronix.de,
 linux-aspeed@lists.ozlabs.org, linux-pci@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org
Cc: elbadrym@google.com, romlem@google.com, anhphan@google.com,
 wak@google.com, yuxiaozhang@google.com, BMC-SW@aspeedtech.com
References: <20250613033001.3153637-1-jacky_chou@aspeedtech.com>
 <20250613033001.3153637-2-jacky_chou@aspeedtech.com>
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
In-Reply-To: <20250613033001.3153637-2-jacky_chou@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/06/2025 05:29, Jacky Chou wrote:
> Add device tree binding YAML documentation for the ASPEED PCIe PHY.
> This schema describes the required properties for the PCIe PHY node,
> including compatible strings and register space, and provides an
> example for reference.
> 
> Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
> ---
>   .../bindings/phy/aspeed-pcie-phy.yaml         | 38 +++++++++++++++++++
>   MAINTAINERS                                   | 10 +++++
>   2 files changed, 48 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/phy/aspeed-pcie-phy.yaml
> 

<snip>

> diff --git a/MAINTAINERS b/MAINTAINERS
> index a5a650812c16..68115443607d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3696,6 +3696,16 @@ S:	Maintained
>   F:	Documentation/devicetree/bindings/media/aspeed,video-engine.yaml
>   F:	drivers/media/platform/aspeed/
>   
> +ASPEED PCIE CONTROLLER DRIVER
> +M:	Jacky Chou <jacky_chou@aspeedtech.com>
> +L:	linux-aspeed@lists.ozlabs.org (moderated for non-subscribers)
> +L:	linux-pci@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/pci/aspeed-pcie-cfg.yaml
> +F:	Documentation/devicetree/bindings/pci/aspeed-pcie.yaml
> +F:	Documentation/devicetree/bindings/phy/aspeed-pcie-phy.yaml
> +F:	drivers/pci/controller/pcie-aspeed.c
> +
>   ASUS EC HARDWARE MONITOR DRIVER
>   M:	Eugene Shalygin <eugene.shalygin@gmail.com>
>   L:	linux-hwmon@vger.kernel.org

Please move the MAINTAINERS change in a separate patch.

Thanks,
Neil
