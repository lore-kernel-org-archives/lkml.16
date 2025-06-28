Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8B8D21C184
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 19:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751139302; cv=none; b=at3sS4ZiNrPcQDh4EmvFbpgc9LieNtKuFZxzbMjVARX8M52eWbyY3lPTGSNmbAqQkap13VHcm+LmedZ6s51F8QyQroT+4U6BeKsAQv3WITF+BtrmYVi/OLQqn+8anVzbRVJH4gjarrrXxmd1HtNjj3AlLeTN3M5wbvTqOg3h3EA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751139302; c=relaxed/simple;
	bh=me0GBiFpCPuIttbulTyQIXZU/0+othOGnQ83X3C3dWY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aOq97E78qSfvbJZHtRb0wS6Fz/a8o/SO2Ofd//gesA22dNxw17GwhDcJq81gKfX4bLO2JS2o7lx8F0BJCRnQlWLflrdx1VwfKopVfPUmmtX7SVqd79ib7YTzPSjGnnaHYJ0aesrrPKqKFSpB4b4AQBb4dvKa5D8einEL+SU6Ji8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=QdpGTVRv; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="QdpGTVRv"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-234d366e5f2so7885385ad.1
        for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 12:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751139300; x=1751744100; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iHKDnUlLTqmdXQjkvRCxfzluB2rJv+pX3lyahvfq2jQ=;
        b=QdpGTVRvkeFW7IdNuTbgvYagltuOMuqRYFpy5I9hWcBUf8KfYhyxFX8HAWCWSLALmQ
         DXGEIO5hmi1OmHS1dc8SygA2IeaLsvT4MfFJYa8E3FNGaahYMl/R4I4O6ix+V4d+77uQ
         EIHZipfTjZ21olOSRklLhd+175ugR975k8vkJMv/+oJTQnPBggA03aLcXIL2ufJckf6z
         RFHEduq0HrT5njjsS6hshP+gfg6Wc7A1jqFt8npsCuD+IBbgKjnTO+vRgGSVqxHODkPe
         hxpxdywM8/BdxfXiYXmt5em5UdIS704dpW7TmHPfesLLppGPxt/tFhkXKWAqMXbnJ2Vx
         5Tdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751139300; x=1751744100;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iHKDnUlLTqmdXQjkvRCxfzluB2rJv+pX3lyahvfq2jQ=;
        b=T0NqQYUSAHs8eHVwWQFpUhrALYlCIEjgX782ZKKJdAq/kFdSUcL4PowVGm6KDTl9QC
         hfFxCiKvwhAcVbHQPsCN/jvJ6VkEa+9JuicZFxJPm8f+BQAj2e+MaYZV2dN2f04gPjUu
         UCPo+pLZJA4lzDSV5vfUd31MzZyP+iYlrimktg7HJUlkUTQP7yfaOXzQqsitNi9H9MkP
         7781yYfq8mvY4CE429EXPtbti0gJhEBcTt23IYXIrik/rxewd6oRgdqhP5ngfNSiOc6f
         b6qTkNZvpAzA+ETPiAU2f3nMtFW9/k8edqRMH8AY/8ce9/tvNqUJt7t1btz0pAUic5Kr
         OzCA==
X-Forwarded-Encrypted: i=1; AJvYcCV72cJzpZzvcY9YQCvBNRqzi1tguy6MqY1QSpjL3qkkT7+oNJWBPUbxP2NzJkX5W7kJkdh/iaTLqbUwj54=@vger.kernel.org
X-Gm-Message-State: AOJu0YyV4zxBbSpd9m+XTvVZ5g3JnhI9rQx0PMifdQBq4Ra1QguAarvV
	gTKTFOh8J/jqHAjGpvNbd7tep25yATcFrpu4WFGqsLUbdaiRFZg3K/6G1OB1JhiGCVw=
X-Gm-Gg: ASbGnctC4xsK92v8PhTuIgwr+1rHNgVgBtGE6YJ249oaLCYjCnDJy4t9fRoDVnGo13H
	KPk+Tqf+D6a4V6tnoARie4hkHJas928uaRufgGJ2AxfydrCDWZOp5PwLpw6Bs1qMtBD5SvllQfL
	IdCysXzQ/zs31ihnpFuPp97vHvxPmSje6FMd06DhJC5MYljfevLkUYvioy0SnlKa2HiGcyT3QFg
	IZ5FNbJ2grhnhsqS9uoeuI0EZu2r/qb8fcywuF9AgMOn8lQ5n2LU/ZZKUrLyay2zL8XZXPuoSbf
	CIAYVA1kYw44x92AGyDE2tTg9bYukuktWpoI2bK+/GehvPfYJ8JZYSud3VSBZa2nVUFR2w4/HWV
	KpF5YXnJ9iWZ5Ep7ceqfC1Q==
X-Google-Smtp-Source: AGHT+IHeu4su47hMzl7j4en+VxJcuaRJIBgkjqjt+h8WPfbb35xW3vAml+KgyRy3W91TVd/V6Wf5/Q==
X-Received: by 2002:a17:902:e849:b0:234:986c:66d5 with SMTP id d9443c01a7336-23ac3bffbc6mr149337145ad.5.1751139299978;
        Sat, 28 Jun 2025 12:34:59 -0700 (PDT)
Received: from dev-linux (syn-076-088-115-008.res.spectrum.com. [76.88.115.8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb3ce960sm43929425ad.250.2025.06.28.12.34.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Jun 2025 12:34:59 -0700 (PDT)
Date: Sat, 28 Jun 2025 12:34:34 -0700
From: Sukrut Bellary <sbellary@baylibre.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Angelo Compagnucci <angelo.compagnucci@gmail.com>,
	Nishanth Menon <nm@ti.com>, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/5] dt-bindings: iio: adc: ti,adc128s052: Add adc08c
 and adc10c family
Message-ID: <aGBDytRlnOalhicd@dev-linux>
References: <20250614091504.575685-1-sbellary@baylibre.com>
 <20250614091504.575685-2-sbellary@baylibre.com>
 <20250616-wandering-blazing-pug-ea09cc@kuoka>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250616-wandering-blazing-pug-ea09cc@kuoka>

On Mon, Jun 16, 2025 at 09:19:07AM +0200, Krzysztof Kozlowski wrote:
> On Sat, Jun 14, 2025 at 02:15:00AM GMT, Sukrut Bellary wrote:
> > The adcxx4s communicates with a host processor via an SPI/Microwire Bus
> > interface. The device family responds with 12-bit data, of which the LSB bits
> 
> You have checkpatch warnings.
> 
> My ACK was given with conditional - PASSING checkpatch.
> 
> Does it pass? No. Don't add tags if you do not fulfill the criteria.
> 
> Drop the tag.
> 

Thanks for the review.
Sorry about that. while rearraging the commit message, it slipped beyond
75 chars limit.
I will fix this in v5 and will use the tag with no checkpatch warnings.

> Best regards,
> Krzysztof
> 
