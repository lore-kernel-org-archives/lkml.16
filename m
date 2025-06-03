Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C2848494;
	Tue,  3 Jun 2025 18:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748976400; cv=none; b=UJtgssiNGOjw6sPXBZNWKkGgEaAbjKxdosim+I0o18Gnci7/4h5zoI9LBcV6INP1TLUu4ETRNgi240vNCZhsnA3ZHMb1j7O8+OE0rsnQwPAnQEnJuPpucts13D5SyqMLM2csm+qKLKW4SKejEyAam6I2mmuYBr62Yr1gDOvDfYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748976400; c=relaxed/simple;
	bh=6YxfXBW8yHwsAfvzOrx7vVDCuuaIMhPjOPQeml1grfo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hv11qiySyUUpe3VXdoLhj3IqxWGjmvde2zO1S2WlA2yu5kOAn/gHy7lXP5m6QB8PeUtFvtSYEfR7O5zlBysIEKmL4XazEtVh8rB0LFvZjdQz9zHXCoFIhhEKjU5nRubUjnDhnripPndbFai+yyIYmiBO7WL5iToOx8ExTAYnsKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SixH3Ezq; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SixH3Ezq"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-234c5b57557so52758455ad.3;
        Tue, 03 Jun 2025 11:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748976398; x=1749581198; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ppE9vk917BHduobClc1IBbd2o8JPuLm3PkUKaicBhUU=;
        b=SixH3Ezq+KfhLiraBvlCW7VkMybZ9KDC1M+MgHF9DvEWn8SMHqCbd7Kfh7PvhjyHjR
         ps5sLiivrsVOEf6inxXud/79XJ7auLAwT8ZAEQ+zKtGQY23JooqIBNerJAk2jpP93amR
         nCkeajdE5E3efUUlwAxwGkjhIQVBhUjuxKxjGJVXlQDF7FXm2arfq4EsnZrlbGHxOZ9S
         QfGcrgVImXtUWACwp8GY/bhaTKirE7D+xBLRWIl0SiZ8MhF5hPpZRxOJAOicJxCgUFGc
         5qxXihPBEFVNAnPxbpk4GUqzig1bFa4BfqSh7QRYvxS5EhmQ8xkoDPp4ejzaDRdedMZ8
         oSEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748976398; x=1749581198;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ppE9vk917BHduobClc1IBbd2o8JPuLm3PkUKaicBhUU=;
        b=v08+GnosOIHJKOPLosc8s3RBUroFd05c+C4LY/9JvDZr8jYCYR3K06/8DALuhieM5d
         9LZr94E0sowVuoLorXKkeyvEW8zOm+EoBxbDgee+uqQFAu5dsfw60IPqqNKN+PHNrGeo
         ur48dbaSyGhUZSO749Ul5BjCk97s279Q2/W2Im/ti/gVsKlaAcrPvpM/+iU9pE3siV7n
         AUTobXbZJW3213js4L0pCj/EBjFLkmXzhcpm2E9u/YkY9TRPgbspz3wf1s/AZGxJiTpV
         e1LRNT9jivWKquVIoArBt64h7yb0XzPYV67nd5wgOW5DnK8k79QeSNTXJ8EPVio5Mwub
         syew==
X-Forwarded-Encrypted: i=1; AJvYcCUVJGDqcDlIidSwNF5YBZb8sGdt/W/S+PHauyYgEHOqXNHwm8LCnAGF5b7DrRDjmvZYntVt+VecMP8zoxxX@vger.kernel.org, AJvYcCX6Oz8TNo+ProiH5vmOSBFkK46aHrtA6siIUpNuVtqau8FuzO+bFs3WYnw1b89Sz2XXXNf0e5sTeeni@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5LsgJ3kLeEy2EsbkBvtQcsUTHpig81duxPjgl6shYlGTiCQ0N
	NM6UBXNkbM+OWc+i+uX4Cxbd5Yif4sRDlssqMPn930X+Mbpa6LLKwtS4
X-Gm-Gg: ASbGnctkE4ezm0AcdWqAZnPtX2sh2BcBxzupKfHgju1wc2ytHgHhbW6uPl4WC+KEA21
	pXKw8J9Lab4SAvoiJ8G1H+jV0Tc81o+4VMLLrwt5D1JUVFulQ7hRE0vOGFb7H6oLthTgHPSQaoA
	9H/q4NXD2NpYolCKk3tN1Fj3Yk/6qxHv7aE7yXkys4uoMAbKYVZzvp0Z/yEy0gEo45WdeLWbF3F
	iiFvJrOITy6PKCGDKUMUCTLqiNVi+b0L1niX8QxOHdxZY0fuAbIik62oma/GP5rpApCOP+4uB/W
	uXL4bbX4zTIP36m8Bfzc/SrQeibdAcKTCMZGTvAXn1ot82wQ+phR9DgKIWX3oISzGI3LfYSVKg=
	=
X-Google-Smtp-Source: AGHT+IFcH3grCHzJsyskubvaf0Z5s6fjHytLM/lQCsPAO1zATzfGge59L6TrwZPqmDc9Ts9cXibr5Q==
X-Received: by 2002:a17:902:d544:b0:224:10a2:cae7 with SMTP id d9443c01a7336-235396cb241mr273853675ad.40.1748976397805;
        Tue, 03 Jun 2025 11:46:37 -0700 (PDT)
Received: from joaog-nb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506cd8da6sm90709925ad.146.2025.06.03.11.46.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 11:46:37 -0700 (PDT)
Date: Tue, 3 Jun 2025 15:46:32 -0300
From: 
	=?utf-8?Q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <jpaulo.silvagoncalves@gmail.com>
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Farouk Bouabid <farouk.bouabid@cherry.de>, 
	Quentin Schulz <quentin.schulz@cherry.de>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	=?utf-8?Q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <joao.goncalves@toradex.com>
Subject: Re: [PATCH v2 3/3] hwmon: (amc6821) Add cooling device support
Message-ID: <ukezxbl6x62mmdgxmzkjsb3mtg6tz5ecyib3cu6y7iavpr7257@vvxmy7vawpp5>
References: <20250603-b4-amc6821-cooling-device-support-v2-0-74943c889a2d@toradex.com>
 <20250603-b4-amc6821-cooling-device-support-v2-3-74943c889a2d@toradex.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250603-b4-amc6821-cooling-device-support-v2-3-74943c889a2d@toradex.com>

Hi all,

> +
> +	if (IS_ENABLED(CONFIG_THERMAL) && fan_np && data->fan_cooling_levels)
> +		return PTR_ERR_OR_ZERO(devm_thermal_of_cooling_device_register(dev,
> +									       fan_np,
> +									       client->name,
> +									       data,
> +									       &amc6821_cooling_ops));
> +
> +	return 0;
>  }

There's a mistake here: `fan_np` is used after `of_node_put(fan_np)`. I will
address it in v3.

Sorry for the inconvenience.

Best Regards,
João Paulo Gonçalves
