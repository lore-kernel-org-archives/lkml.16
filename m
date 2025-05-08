Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 005EF223DD6
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 12:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746706232; cv=none; b=qEo75sIxlGp404mROX84mLx8u9OX14cK2l861Vw6Nb/lQqltsr79Jfr8rIvZYXXDUM3nEzwujZ6C7CN+UGarUlpgzp8EGZIJukgFIw/jflC2RZY2GhRXhr8yy7lpPRjxy26TrZ+89FPZ7NpSWRaAndO2DKd0bqL8M7zGl4P/5TQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746706232; c=relaxed/simple;
	bh=c2UydYRiZABjDwi1OkGZ49SkeDVc0eAIDOarIMlelG0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YDKGCgYtvqyd+5U3WQb8O2IwTe9tGwx33jzrljVBBZgKu2q+0jOY72pmt0sPbOCRARrkQX4PPuXxaDQdaWXsJcOh0FE84FpMGzeVpZojetURDA0GPhHM4hpIlyFmkADy7ewXvmgNq7jGCDWnENowNJvAhN5JyvOA1PX6SHO+QXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=A/BO6B2q; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="A/BO6B2q"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so9245275e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 05:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746706227; x=1747311027; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eCr/fASoQ9d+Wzr6jsBtaRUDuMYmgQ3mva/5+I8JLbU=;
        b=A/BO6B2qBFWOU+YWTUQj/o1grCfVdHdHzIRFQfHAkYlZjuVLD2ixhduspLPdR10AQ+
         rGW68TZuo62SqqBbgYk1DBItRoKPHf9mo+UU3/viaEFqXeP24PLXllzPfsH5kvJkRZQq
         Pi5ekNQ6oopSaEcvj6drgHXDnUBOJQeIi0i012ewClcuF5yEtyLl57dTzqkdaFCVnEwe
         bTmSX3q0gugohF5+HkFvk0JO651NtY+D6TsiwGIwWXd0kFqtxN00u1gNR8WK46aQKMu5
         m9/dkOxJwK/c3TScq/TR8BlRLQv/SdMqWteIHbC+HRooFL/1h+YNhjBLOddEc6GvHgt1
         9QGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746706227; x=1747311027;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eCr/fASoQ9d+Wzr6jsBtaRUDuMYmgQ3mva/5+I8JLbU=;
        b=SNlvV2vQxS3oxo3CK3lyidB84Ld4o+KVNttL4NoMaEBmJ+gO6eVSwB8Bi8vnk5jL45
         2fCdanSf0H7StskexayOHW3R1nRbvjcOvimeXsy86KS7ZhSJ7+j5PD6QAm8Lshyi/9AN
         bv0w3YRS8e8lKyNQuCMoyQOAOqPcOJmEbAWiOIhQsSDGrs2ZzuNBni4O6Tm8eOyj/Wip
         8ZXqVWCh8HholCOa4Zj/shTAZjt2fTk3y/WhRYb9XT7Zhvjm+46anDyaLJS7B7kShMIz
         CcumOAlU8UL+BUXND9LUw1zTABQ1ON1kIiO/C2J3Tz+8fHxaLShBv6CUrdiyVBRAAibo
         Suvg==
X-Forwarded-Encrypted: i=1; AJvYcCX+fr6ll9L4TCDWGU9HBwLCToNFpZITqcM6W0aO9d3JEy3+5S43LdUbAYUusTdsuMP0pHqARYE9D+lOhi0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCsA/YN0W8gIoIr55smIMpOkIAExzKOApEyNPtmvzpdPewCXpE
	oGfWAI7v3wr//9s7qOB7DBpyc04n4neHT/F5gAruoVpMPEtrT6UB1RezLRFyGbk=
X-Gm-Gg: ASbGncuk9i1rRns25J9zoh5BtknTQUGiODpaxuZajCAqcWE1UjkfhJvgln8bQeH1dZS
	b8Vfi4MdmTK9E1Lmzar582XI+c3whTjyXHP7Au5RkqO5IdAeciXqAqD6G0HslriALtufTpECasq
	cy30OSjLSv8vsAQvaidqr1XaKogxi7KLuN6XfJrHlesIE177puGh5VfwPvoeAJN6vWINA3GLGID
	hfvkPJhf6qFWeWo/yhZ3tFJXUIchwMp5DcahGjTrQvxYysRCneB8QdnPlokAgrdhZO2vXN7PsRK
	7Sw18z4axv+jERD/2LGntN/vRGuHBYdCrOLK/6uUXDlLF91ySdzhC6Qbwf1A/fTb78/tQAA/STe
	83LfGVb0=
X-Google-Smtp-Source: AGHT+IGfsmdkVxEPUXpvMPfmbVXBe5hRiXLdwuPpS5TCsEgIhe2fGLTYlh6QBdkZtFblzbFt29O9eg==
X-Received: by 2002:a05:600c:4eca:b0:441:a715:664a with SMTP id 5b1f17b1804b1-441d44dd0c6mr49544275e9.20.1746706227250;
        Thu, 08 May 2025 05:10:27 -0700 (PDT)
Received: from archlinux (host-87-8-31-78.retail.telecomitalia.it. [87.8.31.78])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd38179csm34813465e9.39.2025.05.08.05.10.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 05:10:26 -0700 (PDT)
Date: Thu, 8 May 2025 14:09:12 +0200
From: Angelo Dureghello <adureghello@baylibre.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Michael Hennerich <michael.hennerich@analog.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>, 
	Jonathan Cameron <jic23@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 4/5] dt-bindings: iio: adc: adi,ad7606: add gain
 calibration support
Message-ID: <bttbhfjxwtfc4rxqde5rc6s6gqpgutsya4s2mezjl5t37yuuoh@lgayj2yp2mva>
References: <20250508-wip-bl-ad7606-calibration-v4-0-91a3f2837e6b@baylibre.com>
 <20250508-wip-bl-ad7606-calibration-v4-4-91a3f2837e6b@baylibre.com>
 <174670267187.3889412.7858960687511929039.robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <174670267187.3889412.7858960687511929039.robh@kernel.org>

Hi Rob,

On 08.05.2025 06:11, Rob Herring (Arm) wrote:
> 
> On Thu, 08 May 2025 12:06:08 +0200, Angelo Dureghello wrote:
> > From: Angelo Dureghello <adureghello@baylibre.com>
> > 
> > Add gain calibration support by a per-channel resistor value.
> > 
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
> > ---
> >  .../devicetree/bindings/iio/adc/adi,ad7606.yaml    | 29 ++++++++++++++++++++++
> >  1 file changed, 29 insertions(+)
> > 
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> 
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250508-wip-bl-ad7606-calibration-v4-4-91a3f2837e6b@baylibre.com
> 
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.
> 

I am getting no errors at all by:

make dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/iio/adc
make dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml

Regards,
angelo
