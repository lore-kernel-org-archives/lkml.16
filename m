Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EBED211299
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 13:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743427326; cv=none; b=IQ/Vmic/QTVmWhpH+Vr8JWAdMq2nSOjdk7eXUKslQCRZqGiCECRR6GiVLl/e5a0oJc0yJtt4Xm51R3k1gSBLippaJLrY7/GgbkzqiUoEs5OsVUdEUoH+OISZIh2f0nAfdxoCdAB5BrVD7BG60Ju/bYLnz892nDo3wJo8tLnp8p8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743427326; c=relaxed/simple;
	bh=H0+BMW7QcTDjy39aSiOdTsRn5xBpuJir+R08vpDsJPw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=o/Ocn3u1lfRC/4agDSdgTt0Yi0cIlPgyFCc+Y0Fn1jkj7TPbRfDCOkif6RJvG2g/6eyqmn+4oMjfleRjasiSb2E8rbYniRR5AO1uiZaRlOuw+7S+FPi11kaFD3Fnf5Mk6QtmC+bL5XYk7jz7iw955RyvILz/G3UtkfAa7UBE2Ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hvALBDxq; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hvALBDxq"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-39bf44be22fso2221924f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 06:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743427323; x=1744032123; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/rYByIuq0b2PjmjfZxltk1e0AePkOWa/aML/nirCPWw=;
        b=hvALBDxqQg9oiZZIGFnButnEGwVuV9QuaZEchqH+Z1Ig5kk+JiGVEhB+QDSbvlrp/l
         CbmkA4fA7l5ZvgffF8o4U8gTR4hY1L52+cNpmsvU0yOdJt5Ci6jAyiiypA9undLevQEv
         9a4/ABsE/wZxFgbjS6gBiznjR7iWzc65ec1VX2oEKW94X7UHvtUtmn5I+c/foQ786Zmg
         nUq1Su8o8wpZFi5U8OishATRQxIc+UIqG4URdxox1+97qqCjQcEIZBAe7lSdv74VaRzx
         8p2kBfFTwa1NjGXO5GP67loO/mkJw6B9W/ZXaUbgB5tkrGsjU7WFxmej2S73nQCLZsWW
         k7ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743427323; x=1744032123;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/rYByIuq0b2PjmjfZxltk1e0AePkOWa/aML/nirCPWw=;
        b=VSz5Hz0ALOCz+vHeRlDCuYSdgONGTpjwI0E6P9ftKYj+vLBZ/xIe4nLs8siL5CaN5m
         4gkcIhiRpe2pvqY7LcGIJUguU61GXIEV/iSIRKIm6bjkQgF1wPGZxsuAAVD1pL+C0orx
         9vd85RZnLkp4a5PuvP6C7iYKIt8Fz7DYn8XGy+3WV0NdtCrgod6oxkp3cj/20ulLs4mu
         zj8f3/xzfymqKz9+DWtTvqyHF4V6XGUFq5gVogZBX/+epY6t7FzLoqm2aVTEMJ4U4nBC
         IV23jYEDgetquhRt+kpo9xv/B46l/fbBza59CqCmoATpW8Xz3OytSiwP2u57BSpaBtgi
         qdxw==
X-Forwarded-Encrypted: i=1; AJvYcCXNw8d2eiqvjB8RtQB0/EIposdGUMDhdYpSjC0fxscZv3Zq+YcZKt5V4PEZrXSmMkUEPb2zryjByxI2nCw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6b4FX/Fn12UTo3I/bec1l1ngW87HZqVz7j3tRttp/ePZ+ZEVX
	7DyhQPhJ32Ucak2IpEKxRg0qS7XCjGYhMCuinY/bW9lQqgruzWhDg2xxBLP/oww=
X-Gm-Gg: ASbGncsUhzb3Zr8pGIaHux0cMUF5z1CCdU8IQTZs0ygXUnW5Ox66/Z5tBdAw7vWrqX/
	FbyJ2DAG/K07d9YTR1+V7QWrgYI8p1/1sXA48TVrjsDo1RgJhlUEBOqv6wcxozd5ynIqDS3nrxf
	CYyvfX8XDRqbpfmsxXNvFXm5Lus9BM4AfsEXvRThU3GUquM58kvGWkVUOvSlJOwUqExc4FgBoTV
	NIXfRtpNJc/Hh834dll3Y5LZWg0ZwKLgU58J9Et0Z7EkXYcvaKGbQbk1TJUutiCpB4YXNq9Dar6
	AJxHZ96oRNwPeGSiugUALC+KG+sMAAEcDlHT6VcJx5QsCEbdn6k1BPnUeDmYbQqIxV2Ss8AtESs
	fnuSMnGect12OopIC
X-Google-Smtp-Source: AGHT+IHUVZ074JKaAb9ncND8Uu7WRhh2YlGnAcHVleffCEEVTpj1+nUfZQDJb2JS+yVkEbfZ4DlSNw==
X-Received: by 2002:a05:6000:240a:b0:39c:142c:e889 with SMTP id ffacd0b85a97d-39c142ce891mr6232553f8f.27.1743427322771;
        Mon, 31 Mar 2025 06:22:02 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:143:2e3d:45f1:fd2? ([2a01:e0a:3d9:2080:143:2e3d:45f1:fd2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b7a4346sm11469954f8f.95.2025.03.31.06.22.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Mar 2025 06:22:02 -0700 (PDT)
Message-ID: <7c986d1f-315d-4cb0-b160-ee1f564c26c4@linaro.org>
Date: Mon, 31 Mar 2025 15:22:01 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v2] net: mdio: mux-meson-gxl: set 28th bit in eth_reg2
To: Christian Hewitt <christianshewitt@gmail.com>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org, Da Xue <da@libre.computer>
References: <20250331074420.3443748-1-christianshewitt@gmail.com>
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
In-Reply-To: <20250331074420.3443748-1-christianshewitt@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 31/03/2025 09:44, Christian Hewitt wrote:
> From: Da Xue <da@libre.computer>
> 
> This bit is necessary to enable packets on the interface. Without this
> bit set, ethernet behaves as if it is working, but no activity occurs.
> 
> The vendor SDK sets this bit along with the PHY_ID bits. U-boot also
> sets this bit, but if u-boot is not compiled with networking support
> the interface will not work.
> 
> Fixes: 9a24e1ff4326 ("net: mdio: add amlogic gxl mdio mux support");
> Signed-off-by: Da Xue <da@libre.computer>
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
> Resending on behalf of Da Xue who has email sending issues.
> Changes since v1 [0]:
> - Remove blank line between Fixes and SoB tags
> - Submit without mail server mangling the patch
> - Minor tweaks to subject line and commit message
> - CC to stable@vger.kernel.org
> 
> [0] https://patchwork.kernel.org/project/linux-amlogic/patch/CACqvRUbx-KsrMwCHYQS6eGXBohynD8Q1CQx=8=9VhqZi13BCQQ@mail.gmail.com/
> 
>   drivers/net/mdio/mdio-mux-meson-gxl.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/mdio/mdio-mux-meson-gxl.c b/drivers/net/mdio/mdio-mux-meson-gxl.c
> index 00c66240136b..fc5883387718 100644
> --- a/drivers/net/mdio/mdio-mux-meson-gxl.c
> +++ b/drivers/net/mdio/mdio-mux-meson-gxl.c
> @@ -17,6 +17,7 @@
>   #define  REG2_LEDACT		GENMASK(23, 22)
>   #define  REG2_LEDLINK		GENMASK(25, 24)
>   #define  REG2_DIV4SEL		BIT(27)
> +#define  REG2_RESERVED_28	BIT(28)
>   #define  REG2_ADCBYPASS		BIT(30)
>   #define  REG2_CLKINSEL		BIT(31)
>   #define ETH_REG3		0x4
> @@ -65,7 +66,7 @@ static void gxl_enable_internal_mdio(struct gxl_mdio_mux *priv)
>   	 * The only constraint is that it must match the one in
>   	 * drivers/net/phy/meson-gxl.c to properly match the PHY.
>   	 */
> -	writel(FIELD_PREP(REG2_PHYID, EPHY_GXL_ID),
> +	writel(REG2_RESERVED_28 | FIELD_PREP(REG2_PHYID, EPHY_GXL_ID),
>   	       priv->regs + ETH_REG2);
>   
>   	/* Enable the internal phy */

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
