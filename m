Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A24F4281352
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 16:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745338372; cv=none; b=qXNlZB65RHLEHEdsvjMLND1k3UAGnCeU9UZJ7iV1unydhXLZv6Wp61OoXEIyDIhFbk5sPDCNilZ2DBxqTzzLtezUvakdD4MpDVJmlI9MnxprLydva9q1knY69WC+QWh48gZEHLlhKzAPEhEru44w2UxIJ1e7jtDfXm65zlcwI8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745338372; c=relaxed/simple;
	bh=RGhyPnsDqiY2S40qn37e871t5HmcKxZxCc+fO56toGs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s6PO2lKM8n8vjsGsOfEBuBu48isD1LB+vspKMjunbAGcXIgSgLpYhHuS4VYhzheQDJAe8Nwj+/uhHCag4eUa+3gQPllq4txv+sSuA8AtFmPA1YeGkrvGegWMMemetxSMh+5G7jmA+K1TjWnX0SXAwBQtliP3n6v+J44nJm3KQoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=aAcPHZ6g; arc=none smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="aAcPHZ6g"
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-605f7d3216bso862969eaf.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 09:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745338369; x=1745943169; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H8E7zBmmWLg3ht/ivGt6wNiB8HhGYbCrWpBk3ARRpsY=;
        b=aAcPHZ6gRHg7/BYYGLMbWQYAJTrkE2oPPh6bQDAb+xVwqmsxFbgldtFgEWm4i0KvlG
         K5R2DZEGn1CA1v2fniOcB2OKJvCT3ZGvE3RKvhSwCFv8TNY+33j2rWRvbpRYrJJjGjuR
         YIxMgnKS6dA8ISUOr0mc5yrRnDJGdcnyhi06dkHX9pxD6lvMn8jrDuVWL7fENNuK3fxl
         jbSMGx+bBpajNuU4SSE7emQ1k/4xU95D6QMab0i5uW1sv4cityWbmbnMNdHxb0XkQg9z
         E7jql7aTdDVmkYcfu28z4Wj12J9+eNJuV8TnfG/dWgHb8faIysjFlTCmL25Zo1GCUt2I
         tHgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745338369; x=1745943169;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H8E7zBmmWLg3ht/ivGt6wNiB8HhGYbCrWpBk3ARRpsY=;
        b=kx6PvwD/U7NOLvjY5KNcn0OgdGNltn4+ZRDuL0HqLy0BycPQYmsuz+Ncx+7Equ4KDS
         ROtrG+5JjbSJlPdLQEJDNpS2zrMmTm068fgfJmJ0tKxEjVuUSvebCMSqjB/gujPRI+ZM
         Qvtb4rbhufIYvePB+0Q4FHRgjAS8BO/Sfv8xLflD1Qb5BKiMEVIVA3RyiRpJe9AtLW55
         dWrOoAjztWM8RTV6hdmAfnYJ34jTsAQKN6e0qcKyfxmQxSr9PCOWWHysXzTgjvb6QRib
         9qRNfxMZQLSD3lx4U7W5G6slf/fBZAnEL58721em/j8u2Vdxu7a50I9If4gfwyUBbppw
         E6yg==
X-Forwarded-Encrypted: i=1; AJvYcCUTIFmbKFi5AVk+z42kzpocC+qT/D6QmQD9d8cwXH4udZsNMi/rMOITxAKgHVNDVfNpbJRplwIjNkH3J90=@vger.kernel.org
X-Gm-Message-State: AOJu0YzyoSugxZj8E+O4VQAKPbugSmz0t1M9m7ZPUykTdewr1dEc3oe3
	MJjvqKpKqLJsR1Nz3fI2clHfCkHr+/k35x6c4+9jII1nFJF5qlUOU9OrFGKRnR4=
X-Gm-Gg: ASbGncvBLSVThhAfKG7vrTVhi8CbjxUx9+Q0HSyy2zrAjJBrfvHBQAJPb/JL/Nz6UBO
	OSEXGHiRAIdqJUTWs6VbRDWtbYK66lXtDCCvmYEVelsKPBZutLDnKmjbdhZIsNqiiRuMfW3dZlz
	SKD2N7c2fdE98Kv4bKILdXq1Cett5KcKwKgsdxQsVPirU86ZDodD8vgomrINq3jUBbCIZerEq4a
	WjATFhX/f4vXqcysr4hX0MdsQnxkm3WI1YTdIOmpkT10BvxM+eudkgjHaQ/E+DKehFh5PuTGvHq
	mWNqPR8tyn9qg8r2ee8T1M8B2qzngYfN91bmAVSIfk4fdPs7+uM1Yi1TLCrr++c3kpYzrL91kNV
	lhsw7wEDxgS95pRxuVw==
X-Google-Smtp-Source: AGHT+IF9Z3gSX8kmSbSuKPRtpakMkJO137BJhDQaCwgNlo/KRdfZOcLBygIlEokup5a5MePwFQ8OtQ==
X-Received: by 2002:a05:6820:618:b0:603:f973:1b3 with SMTP id 006d021491bc7-606003ec9f0mr7716312eaf.0.1745338369622;
        Tue, 22 Apr 2025 09:12:49 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:c8d1:e0ed:ce8b:96a3? ([2600:8803:e7e4:1d00:c8d1:e0ed:ce8b:96a3])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-605ff69c258sm2150287eaf.25.2025.04.22.09.12.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 09:12:48 -0700 (PDT)
Message-ID: <8fe546e7-4fbc-4c63-ad0f-576ffb117508@baylibre.com>
Date: Tue, 22 Apr 2025 11:12:47 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] dt-bindings: mfd: syscon: Add ti,am62-ddr-pmctrl
To: Andrew Davis <afd@ti.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Markus Schneider-Pargmann <msp@baylibre.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Siddharth Vadapalli <s-vadapalli@ti.com>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tero Kristo <kristo@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250122-topic-am62-dt-syscon-v6-13-v1-0-515d56edc35e@baylibre.com>
 <20250122-topic-am62-dt-syscon-v6-13-v1-2-515d56edc35e@baylibre.com>
 <20250124-heavy-jaybird-of-vitality-4cbe24@krzk-bin>
 <20250124-able-beagle-of-prowess-f5eb7a@krzk-bin>
 <mocfnpebc67xegcis6tx3ekhsjcsqnvhwtipufycrtq2be4nbh@pmxhir5gmkos>
 <639b4e3a-3f68-4fba-aa33-c46dcb6fc88f@linaro.org>
 <d6252b73-0bcc-4724-8144-d6a98c8980f8@ti.com>
 <74ee6d9b-fd78-4d8a-a94f-b2c4dc794b60@linaro.org>
 <ebsbaaxyatrcikoem75t2blkhhceuidq3wnj3r2hbezfcmtc3u@ptffexrigbff>
 <f9a2247e-e0eb-4e22-8626-80e87afa9386@linaro.org>
 <qjwlppsq4eorzepvjsgjjyyaddouo5w2rjguu5c2mqesd6luwp@f426xeghy2ht>
 <2130b439-74d0-475d-8429-1a1b4d9738aa@linaro.org>
 <b7f6570f-3b80-4fc1-8201-d44f5692867f@ti.com>
 <07bf9f93-deb8-48a1-aae9-a8a053680cc9@linaro.org>
 <6241ff00-27e6-45ab-808e-f04e39854753@ti.com>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <6241ff00-27e6-45ab-808e-f04e39854753@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/21/25 12:03 PM, Andrew Davis wrote:

...

> Which parent device? That is my point, if the top level node for the
> whole CTRL_MMR region is made into one big syscon, then a big regmap
> is made that covers the whole region. All the child devices also make
> regmaps covering their device range. Now these registers under the child
> device belong to two different regmaps. No synchronization is done as
> these are not the same regmap, regmap only handles this for multiple
> access to registers within the same regmap.
> 

Why does the child device have to create a new/separate regmap? Can it not use
something like syscon_regmap_lookup_by_phandle_args() to get the regmap from
the "syscon" node along with 1 or more args specifying the one or few registers
out of the full range that are assigned to that specific child node? This way,
all child nodes would be using the same shared regmap.

(And yes, I know technically they don't need to be child nodes - just using that
terminology to be consistent with the previous discussion.)
