Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA2E2F49E2
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 18:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750271259; cv=none; b=K0ymHLYnWEpDQ3pi32FutYRZgp4XTPePr12dAAKvLfx4LQJVvWXyZI9kbn4UHotQa6oOQoTtTvRvJL+npOjbUv15q+hqdxQLN7673UH7MC7DfNQX254o2HpYE1lHKUyMOPsU8UCz3TUVNyJ5zwktWSKQfCPzGRSqbTs+FefwPkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750271259; c=relaxed/simple;
	bh=8erTa4lex0kgWaCiz++yqQTutSRNZ0et/sDqzyR34Rw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gSrJVPqIaRuyzCjLTZmRnMEwzVaPsA398goe8sVEBa6TSfXHr3kyWSqfuW4fM5khDWi1YojvKJavnerj0Z/F6BZB1wvtsAGbI0BedoDVnew7XN4Y6la725s78cl6IKQqaTj7tYM3q9tQ0XgSPyuNEmrfmbqiWfwFPZiHnlYUkZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Vd2WvKgj; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Vd2WvKgj"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-73a43d327d6so2719979a34.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 11:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1750271256; x=1750876056; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/YBYuQYbzLC80oZvh7S2m5LwCzlb8lJZIkclLoGPtU8=;
        b=Vd2WvKgjICOoIyD3DUGFwVR0jICN8GM8IOCFL1VOC93a/lKI/F+L4qLfEiWuUTxAbU
         FMfHcGhW5FnTbgPSspLrz/nDVHrVXjvXxrQofbX9HqUTpPpDR4jgMRmDY4YUAFRjN0Hy
         AMHKmhzmsYckUnfZnuoc9aY/wLJ0q8gkoSgs6F122yoA70VAAFdmjJKWtfe0o8hQORE2
         PxRYzuL+8lrRjovbhLgtZ8rzsPntfp6AaRxBQbn6yo7CRlSviky46p/Bxl26gFKyJ/A5
         oKy96jDoIeE1v5EoFTuqZFEiL8y8pdvtv/JaOh83Tx1c24RCwYCj8WAwhiBEO0AfobZD
         Tb+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750271256; x=1750876056;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/YBYuQYbzLC80oZvh7S2m5LwCzlb8lJZIkclLoGPtU8=;
        b=b0uLymQ+UwAJsif3KFeJRyKVTYzyLshPq2xHAdVwJg8XgBYXlPcrzWzZ6V/r4zBoFV
         zzdul23NyLBAd2MB4w50GqYDpSx3o+fBr3wsbw2EE3Bz2UI5PSXvVGXp7YdJlyhK05Cn
         dHMqdPpGgsP8bYS/o4MEit1qsRbg1yf03pxd/ZJrB3k8mK7Sp3SPr66fKlTPWPvvE/62
         dgX4g2oQNwqmweIGcP7unN/tnTcM8TNvFZWuv2hNZYjjLBisG92ROOnurzhDbDFkyvWP
         KN9RE2kWY6N4kNICtVIG+w6+CXMWu6UmObFv3P+nArGcGdfKuADgv8v7p3e75r0286kZ
         nCHA==
X-Forwarded-Encrypted: i=1; AJvYcCXgmnxuDFHN9JEfERn/+yKE1an9EZf7WlB6DKnqEjazcuo4UbDXy0Kz18XGBRayh4ABnduyfycJBUnU4k8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwrCVfd9+nKNp+RLHFpksad0UCvMI++ueE99dm72/dA+rY8NAPV
	5sC1OwU1zdOKYRPFagioXQ4Vk2raYWs9+h7u+D44H+CWqrjXt77bRyv6YOBNYnZHUaE=
X-Gm-Gg: ASbGncvHWiutM4Ih0494WV78/s/PmDf8RoPuHRzGr1FiF5ZLrLbXnAaEhEuHRSL50GB
	YP+mZ3k2mbWgIaJ8sumWNgyFeNt9XJoWjPct9OCUohPx4Tco178ZtX1zoECJAub+kTaGIxKSyz4
	1KZi3emmpeV7GyBWHW5dD0A6MLRfo/sTnQRPn9RVNVVXV1QUZ8fdV4JeEZQ1oECkDm1i1eiq0xn
	ZpJA5IvFW1kMxUEn5QbMh/wRwPA5aGc/r6pxdTi5x5kASelULUQAJAOyJ3ta4tbpCTibyl2ijl2
	6ZLVVcTxv5T4OztspMCAzBuJzGyR5y0s0XK7jw5NS5TUdpKf1Qy2nm+1O311gJrGDLOlmEE94ym
	DG9kqtn9eqV9ZwA7ZTOMDDSl1IeQzITmu5UNJBEU=
X-Google-Smtp-Source: AGHT+IGfYT6pTX84G34dN1v1rA2QrNVoZ5Qci8skHuTcu6xXSLE5XMAg/YdsULkFqRm5674RrJMxag==
X-Received: by 2002:a05:6808:13c7:b0:403:3fb7:3870 with SMTP id 5614622812f47-40a7c1cbe28mr10969858b6e.10.1750271256246;
        Wed, 18 Jun 2025 11:27:36 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:9583:1e37:58ed:10ae? ([2600:8803:e7e4:1d00:9583:1e37:58ed:10ae])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40a740c2748sm2437844b6e.18.2025.06.18.11.27.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 11:27:35 -0700 (PDT)
Message-ID: <2588bb7f-2a3a-4001-ab1b-6d9bd57b545b@baylibre.com>
Date: Wed, 18 Jun 2025 13:27:35 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/9] dt-bindings: spi: zynqmp-qspi: Add example dual
 upper/lower bus
To: Sean Anderson <sean.anderson@linux.dev>, Mark Brown <broonie@kernel.org>,
 Michal Simek <michal.simek@amd.com>, linux-spi@vger.kernel.org
Cc: Jinjie Ruan <ruanjinjie@huawei.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org
References: <20250616220054.3968946-1-sean.anderson@linux.dev>
 <20250616220054.3968946-3-sean.anderson@linux.dev>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20250616220054.3968946-3-sean.anderson@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/16/25 5:00 PM, Sean Anderson wrote:
> Add an example of the spi-buses property showcasing how to have devices
> on both the upper and lower buses.
> 
> Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
> ---
> 
> Changes in v2:
> - New
> 
>  .../bindings/spi/spi-zynqmp-qspi.yaml         | 22 ++++++++++++++++++-
>  1 file changed, 21 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/spi/spi-zynqmp-qspi.yaml b/Documentation/devicetree/bindings/spi/spi-zynqmp-qspi.yaml
> index 02cf1314367b..c6a57fbb9dcf 100644
> --- a/Documentation/devicetree/bindings/spi/spi-zynqmp-qspi.yaml
> +++ b/Documentation/devicetree/bindings/spi/spi-zynqmp-qspi.yaml


In addition to changing the example, we could also extend the
spi-buses property for this controller since we know this controller
has 2 buses.

  properties:
    ...

    spi-buses:
      description: 0 is the "lower" bus, 1 is the "upper" bus
      maxItems: 2
      items:
        enum: [0, 1]

Not sure what to do about the default though since as discussed elsewhere,
this controller needs the default bus number to be the CS number for
backwards compatibility rather than `default: [0]` as is specified in the
previous patch.

I suppose we could leave default out of the generic binding and leave it
up to each individual controller to decide how to handle that.

> @@ -69,7 +69,7 @@ examples:
>        #address-cells = <2>;
>        #size-cells = <2>;
>  
> -      qspi: spi@ff0f0000 {
> +      qspi: spi-controller@ff0f0000 {

It seems more common to have spi@ rather than spi-controller@.
Is there a push to change this in general?

>          compatible = "xlnx,zynqmp-qspi-1.0";
>          clocks = <&zynqmp_clk 53>, <&zynqmp_clk 82>;
>          clock-names = "ref_clk", "pclk";
