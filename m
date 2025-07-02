Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C841C24111D
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 22:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751493673; cv=none; b=KAk3d7Q8A+wjqupzsUBV4pcbjK6H65Kggq0+mhUq4WK8HwTXJgQxpq+rj9Mlcuoci5CehYIfff4byRkYUEOPzW4Rd88ie8VaaPQLy5fU1ip7xemWtNdhmnBLOVt4TBiJi3rre54csp5dnjMn6QvF26muwd6+uZ+NJdzYQ8Wxsqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751493673; c=relaxed/simple;
	bh=hjhHlOolfaZNDUs+RdvLckgniM7ltNQJFdfTBZFssqw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=LWpnTwRMGHPiv8B/zvfdtZH+/ykj/RKBq464zrTJygTMtdJDYeVlFHNYD6exKjdxh74ZV0gCux92BWylTp+QmiM6DINJthCpe233F4fnd2lPPWB9beY4bwkGbeVPQiNsgx4fzRcpvoZEW/26YykHcex7eaJmMhC+49OtTRVtCo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=y48xNPQ1; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="y48xNPQ1"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-73a8d0e3822so3796202a34.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 15:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751493669; x=1752098469; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DKgWS7/qdk7+Eg50DbHdDl8mGYC2JyCvr3ER8bCDhe0=;
        b=y48xNPQ1VGFonG90ers22n9CaIGu/U0THcQn5c8nBkrNDl4s9PaFjS+j1I6g9WKNKk
         AIt90eg9oaV1EgKUwMKqT6KK+6qZm0ycbC3hNp4m6EMABEfx09alAUON+kWaoxtIKcLc
         KpF0R66j9mNHBxgK3gVzHPFVU3zoE/wqhAbjqow81uQxg+cfY447RdnKngepHdBwkEoA
         erkhwbWUhLFkvzceqJ0cHWv3nN9vR0F3ZV9QQRRlcAkjmr2yRwkjT/VoCkPEvvC4uya0
         +4NGqWis8xoTuzKwFm7oiFKXthN/Lw8UdUwMqdkbwyOEA+arjT+4IL8OlrccbhJhMKY1
         F5nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751493669; x=1752098469;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DKgWS7/qdk7+Eg50DbHdDl8mGYC2JyCvr3ER8bCDhe0=;
        b=KTwJmo50VKha1g1EWfPinW7/YJmkJ1zTABF6DkCIMI1Me2fPmIOZRYLwsabksuGObs
         F3cbR7gJapzoCXfnW+vw3LZGuSB1aTIP+hMh3G6l0eYyMAu9DfRDu+xdhmLBeN+yqEis
         DPLkIfsevJHVpVkJmtm2/nhNpjVtTWyOg4pLXE2dCzrEjJWQK9qeU7Nf79TidoLpt6RT
         xNDeUm+jQQ3UbJmi8bLwyH30jCED/XQq7LLlZQQp6tY7aFo74omWmXQ1tTZmD3VuRtYI
         Uhdlg78U4Benx/wR1BqBzLYDdT0jeBpYmduUc43wdo6Fnajkha0ceF+E1AfgdgXONxUD
         XCXQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1CagLyoaDeGctquNE3ilPKg8kl57Xj6mV3AB4v3XjSklqdStdONZKXHkAhWyyAVLetHaYT40wxqhMnEI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxyhNOi22ZO5nSnZKsynZaRpvZ+1p5qX0KoI3iJ4eBL1MEjJqkT
	vnDPW2S2DLZH39b6+0wE50OcaMXJ23jwl9AH1YLe2KA8rIoVlfg2snGqfaLGQ70V110=
X-Gm-Gg: ASbGncufbQkn2p1+eG1AxCyeH60ru+Vjlds9o4XOxfSt0806LLLqemUeT2BfM94lIxv
	y0mx8IWdoE3RYu0g0HrNcXM8yJ9U4GaPJiLpef6hkDgyRh6axG4gpqWMUFjQ9t56h6CP7rV4DXY
	4tXVC3hU9Fo7caxTRtHGty4/iYrpMd+TBEuIN0d88jdOA+tnhxlcOSlNj9VLhGHYpLrc8yOBygk
	B545g29oVE6I7N37znrxJscyrPCoi3VSx7xV80CSdJy+OeJRYRZfG2sbMkFDaGgM1J/M0MIAmYr
	q7QEgrpAl96Lc2JSJ6pmW/ljMPnTVIIkli/orqryM5pTMtU4p7pfJTnb3dak2+uiAaLKQiy/BXW
	DvpDngaouLgl+/m7q7XQ6gJcz+EzRtND4vxYbHcs=
X-Google-Smtp-Source: AGHT+IHKZNhePlF0+T6dWuoOeOIoDbpvywH95ABuicUB05Dmc1aVoalsdNueqPirXs97Btv0KkGWcg==
X-Received: by 2002:a05:6808:e8a:b0:403:3673:65f0 with SMTP id 5614622812f47-40b88b25dc6mr3169424b6e.31.1751493668851;
        Wed, 02 Jul 2025 15:01:08 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:5c00:24f0:997b:5458? ([2600:8803:e7e4:1d00:5c00:24f0:997b:5458])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40b32420c83sm2747613b6e.36.2025.07.02.15.01.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 15:01:08 -0700 (PDT)
Message-ID: <a30cbe3a-7d1b-4072-880e-99688657a093@baylibre.com>
Date: Wed, 2 Jul 2025 17:01:07 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: iio: adc: Add support for MT7981
To: Aleksander Jan Bajkowski <olek2@wp.pl>, jic23@kernel.org,
 nuno.sa@analog.com, andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, zhiyong.tao@mediatek.com,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20250702214830.255898-1-olek2@wp.pl>
 <20250702214830.255898-2-olek2@wp.pl>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20250702214830.255898-2-olek2@wp.pl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/2/25 4:48 PM, Aleksander Jan Bajkowski wrote:
> The temperature sensor in the MT7981 is same as in the MT7986.
> Add compatible string for mt7981.
> 
> Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../devicetree/bindings/iio/adc/mediatek,mt2701-auxadc.yaml      | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/mediatek,mt2701-auxadc.yaml b/Documentation/devicetree/bindings/iio/adc/mediatek,mt2701-auxadc.yaml
> index b489c984c1bb..ceb914dde15b 100644
> --- a/Documentation/devicetree/bindings/iio/adc/mediatek,mt2701-auxadc.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/mediatek,mt2701-auxadc.yaml
> @@ -26,6 +26,7 @@ properties:
>            - mediatek,mt2712-auxadc
>            - mediatek,mt6765-auxadc
>            - mediatek,mt7622-auxadc
> +          - mediatek,mt7981-auxadc
>            - mediatek,mt7986-auxadc
>            - mediatek,mt8173-auxadc
>        - items:

The new compatible with fallback should look like this:

diff --git a/Documentation/devicetree/bindings/iio/adc/mediatek,mt2701-auxadc.yaml b/Documentation/devicetree/bindings/iio/adc/mediatek,mt2701-auxadc.yaml
index b489c984c1bb..14363389f30a 100644
--- a/Documentation/devicetree/bindings/iio/adc/mediatek,mt2701-auxadc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/mediatek,mt2701-auxadc.yaml
@@ -32,6 +32,10 @@ properties:
           - enum:
               - mediatek,mt7623-auxadc
           - const: mediatek,mt2701-auxadc
+      - items:
+          - enum:
+              - mediatek,mt7981-auxadc
+          - const: mediatek,mt7986-auxadc
       - items:
           - enum:
               - mediatek,mt6893-auxadc
---

Then you can validate that the next patch matches the bindings with
`make CHECK_DTBS=1`. I would expect it to fail currently since the
binding is specifying a compatible without a fallback but the .dts
uses a fallback.
