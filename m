Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9C6C1E1E1B
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 18:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746212083; cv=none; b=NELz/bXUuCshI7SX/CBTVLVJC/ONzWvh2+8rgcHRDfy/qbNMixxXuuxGcmplFfVikjr46tvZ2Os3oBWH1ZLTKLGyG5QYhndac1zKDVck8BykH+6DWwBbdZx7kcP4RX0m8UoBkeExf8VPT6rf/vyCo4K7AoYCBoBXFMrEX82RjGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746212083; c=relaxed/simple;
	bh=etET4InrPZFfLVNbBfsGBvrQq/2AsRr7XUB0q5olziI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jlihz+p26BAxyNIrkxCNXgGq7JwKLFGESwlm+O473UBuQav/BhbBETesiPj0r+tR2EiAwzMAmPGs/MWy5JhKmQYbKbZf9yMvkBoj7zn4DVzm2Uv3VEtetTvb70OOYrrPyxX+nUi6wvnIp7ipqiCBrsFQO93eTTepzHHy00zJdAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=YzMBEKTq; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="YzMBEKTq"
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3fefbbc7dd4so1629730b6e.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 11:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746212080; x=1746816880; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o0v5QJaDLKj7eiDa88mbshkSyU/5sC59jCX11a9PYWo=;
        b=YzMBEKTqsD+BZdkWxkpGJMWWMKyilOR4Zmp3PXghZcy3XnI1GKivB83PUGRJ7JJfcP
         WBizkXiGkNBXB7WekDSMLfDGYiIqramxd+gveNRfYU8lIt+9wfqHtri86ltsaH3h2bRt
         32xNhvkfGaGekAGuvbxA6mQFwa95xYDKoUv6FxiwcLRMmqlLq4crT3diNsOQ8gfZ2NEa
         Ha2y12XNj1bnuinvNCLjEIvR/CEpA1GVlLjXPvk4qFzk1ugTo6Z23C3eaEfsMXxFig7u
         Sv7ADOTvUbSSOiMMIwQpRGRuCBVOX55zVE0RFuZLwVaZ6BbvU0sgECkOMYkcjGMlHt2z
         ZyNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746212080; x=1746816880;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o0v5QJaDLKj7eiDa88mbshkSyU/5sC59jCX11a9PYWo=;
        b=dTMjealJBdT2K8j29AVlBx4gRRbMMWPlffdy7kXv1CYIDdhZq07OtBRXUMuSN6mitE
         /BhYNu9nGr1Z/ZwFMxsuDBxm9fYgm5NoewpZOs6givDG2FodzMKxIbMplfPqWXwATEH9
         em+u3gIFe9b78zlxsIDdksUiBbMmrk2rnNhfBor85BH6w5j4ce+RG/aqPSd6Dddz61DN
         t/K3P2M3D+RiIamMTfguRNVh+IS6/aI/1ermAX7XwQPlzwPLNSPvF5iwi8jWnbHC3Xfn
         5ccm8HmlQZWIY3i9ahOZ2MVqKPPjtkvr2sVEh2oTvhZ2Ndm+DV+LyGJlRbTbQ71i/tRh
         uVRg==
X-Forwarded-Encrypted: i=1; AJvYcCXkjh/3ApetDog4K/vPsb1+1CF0MQuJQK1bBwf5JD3BtEpWukgYpY65A/uRvOn6sJGVKbBVDFn5DTBrLic=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8PI79xcUwYNarAExIaYH05gNaQBasLZCUJJStxtVhVrVFxt3i
	8n2gDhyOKjMuV08iFJrhl6zkPoWZc9XSrbG1xoCTvY8bTuTTRPZj8cf332MNoLI=
X-Gm-Gg: ASbGnctrEoJfSKHnR1DHMeaLVZrABxe9KixRhSZbrRIjhdjdguWSXM+Ni1H5ekkZEy2
	HXNzlmAOmqKdU7PPwZ1vOynr/kVUREGgGPY1j0lAk0Umqfq5AlnUJ9V4/k8pQJdHrcFl/9ThJFm
	kVkyZqha85eMVOHZL03i5b4FZqsekHrVlexwgoWDhOU2L6aaq15q9aQ2HT+bronk/zZmHbwZ5O3
	M6ZMa7hwr47+LmLQwS36GNhmE2qqkgz+6rOI4PQtovESMpMuP6Cc8tkXIvr5SAEO1WUOFLHK0BA
	P93EP1TehRLIy5fXqhMu42Xj5JIQnbtOJ+c/sBY70oniImd5yj/0FgAXrgApb3hduaCiLmbgVBk
	ZUDB9FPvN/Yc7X1gAzm3q4PQ093Ke
X-Google-Smtp-Source: AGHT+IGg3NfrHCT9rWDG9WuCsQU3jADp64M+/PiypBGRCbX4Dd8LSeFbkh4aztyl1pAXJ+UtiOQbLg==
X-Received: by 2002:a05:6808:2e4c:b0:3fc:1f7b:c3b3 with SMTP id 5614622812f47-4034148814dmr2250631b6e.33.1746212079887;
        Fri, 02 May 2025 11:54:39 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:4489:d382:ca90:f531? ([2600:8803:e7e4:1d00:4489:d382:ca90:f531])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4033dae382fsm685964b6e.21.2025.05.02.11.54.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 May 2025 11:54:38 -0700 (PDT)
Message-ID: <8ff3f1da-f868-4c7e-9123-00a3c54904d5@baylibre.com>
Date: Fri, 2 May 2025 13:54:37 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] dt-bindings: iio: adc: adi,ad7606: add gain
 calibration support
To: Angelo Dureghello <adureghello@baylibre.com>,
 Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250502-wip-bl-ad7606-calibration-v2-0-174bd0af081b@baylibre.com>
 <20250502-wip-bl-ad7606-calibration-v2-4-174bd0af081b@baylibre.com>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <20250502-wip-bl-ad7606-calibration-v2-4-174bd0af081b@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/2/25 8:27 AM, Angelo Dureghello wrote:
> From: Angelo Dureghello <adureghello@baylibre.com>
> 
> Add gain calibration support by a per-channel resistor value.
> 
> Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
> ---
>  .../devicetree/bindings/iio/adc/adi,ad7606.yaml    | 29 ++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml b/Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml
> index 29f12d650442b8ff2eb455306ce59a0e87867ddd..d4b8ea51f60be367e79a4db18d932cbca9c7dc91 100644
> --- a/Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml
> @@ -204,6 +204,15 @@ patternProperties:
>            considered a bipolar differential channel. Otherwise it is bipolar
>            single-ended.
>  
> +      adi,rfilter-ohms:
> +        description:
> +          For ADCs that supports gain calibration, this property must be set to
> +          the value of the external RFilter resistor. Proper gain error
> +          correction is applied based on this value.
> +        default: 0
> +        minimum: 0
> +        maximum: 65536
> +
Max should be 64512.
