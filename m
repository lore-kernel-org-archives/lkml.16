Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33F1415CD46;
	Wed,  2 Apr 2025 16:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743610521; cv=none; b=pfSSprsnRwTCbB4E+JXfs91eDAqD5GD9+9eH8KLwV8xTjXEHgpmb70EPwiQCniJQSBrqjLcfDeyOiH+GeeGVRBZw1FA51eC4ImeewRLo2+hGKUJYhlHtHxd5vN/oCXliZVaGn3WdLrMSnnG7+9IFww/70ubQ6t0/OHpM82Yx0sY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743610521; c=relaxed/simple;
	bh=3P4dIsLvdB2naVZgeDCo7D0zQXUmX4Rt4uUbqrfkRSU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IdlIfobccr+Z/smb6IYVsiansyZX3mqlHYkCvIuvrx+kT86Ac8cQbKD60RSfVnv9OgzdNGpKVktVV61R4eATrLRVGn3OSe/6FWwCU3zu4qVxSP5Z7UkCj4klFlii73ZJvDpbP/t5/bUPivD17InGWWiHzMh1z5JfrSnLy30iPbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G+YZYaAo; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G+YZYaAo"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2240b4de12bso399745ad.2;
        Wed, 02 Apr 2025 09:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743610518; x=1744215318; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=csAo3LwiWlGZmXH5J42qN4w+xtaVZr2WefQWohcxcEc=;
        b=G+YZYaAopvbYvwmmqUhYAKamEBt7pFTrwsoFQOEgjjBRuxJCXq8MZpuC26LrEF8lms
         uHNRwiCIwC65RO20tUdmfjsltpd2wDyLd3ModBhtNTIUy59j8eFeQQ7QQ06NYJYVwV2b
         oZ9BbGxXtdezimUy3qX4PCjFe27g61Cokq1FDxkiL8/V8Fp7hq9TQ9NdkSPgJlkJZCnc
         Xkx6VWJTc7CdDvT7X+XZU1VnSrOpPpO6589FfshcAEauFjFfN93fQEH+EdZlOIEs7RTS
         UfKDZ95oAkHiQ+boECdKh4D/G7nVcJYaIqTmQGhfi9ZyizIqXz1UFQKudMIjevsbGsYF
         a/bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743610518; x=1744215318;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=csAo3LwiWlGZmXH5J42qN4w+xtaVZr2WefQWohcxcEc=;
        b=eiuuAwTxypXdZR/H1GmuWWxXCu3UBqJmMBQkMIzOoaaJNYCZRXtabxqXARxo5a7+Td
         WNsoFB2WrNldcjwQQSA+0M20ghzjv2tG2th4z9QOtSalX3phLjMCCjYXiFSX0PPQM9SK
         vLQH7xajNLO+Wk/gprARFXc0TVRuh8vRH3x4AnPjzgnUhgCKmjlkpuBXSWGKKOEy3IEx
         BVQSIm1XPupTu0xsVpuZvvxaIXfm4nmUaV9IGcUU8MGZLODLEGD2RNfZYOsgM5oUKFWS
         hHZnCZxJOFE2URq05jMiUv63rSKTPfxEdqq9OeGudlLWCRm28mvkObdqX73xm0XnG8jd
         //cQ==
X-Forwarded-Encrypted: i=1; AJvYcCURZEQwcAtlo0krBnoZ8ryw5d0JoublxTk4WJr0Eu0LJcy3FsIruHBV6Z1RguwWmvn0ZOhvSJRTZEnW@vger.kernel.org, AJvYcCW+amHS+AlDxs9Y6WZfRy9/jWFubQuLsvqSyFwklQVqfYhGKOy1bFCObuOlBVB89cWlvAaIlHGKm4yDUrQ=@vger.kernel.org, AJvYcCWaKHc3VQiFhZweN3mlIEyVdV9pJYbRdBdbUH+PIGv/gzADCeMORZdQDzfc9IfnphgvjZ2TM+Xn5sI2g1lB@vger.kernel.org
X-Gm-Message-State: AOJu0YxEB61oDa30nHv9gjBzplKQ859W8fdlW2HDFjsp1+gY6wEoXjUu
	Y15cFw6OKYdrZYwEnHGVm780joIzSFOIDyn4MauekLisde96A+EikuCm6A==
X-Gm-Gg: ASbGncugfwoufOpoI53OuOih7T8APQ7FFFWzIfh3hZoudf6++/T5Er3x9j3yTRcFFNs
	TpCRHg52yHwJguuAYLbQKMTJodjakw/oxgEHNniMzAgYTsGkGsJQQ6W2crwtGGo1qvE8X9ko8Lk
	LQFTWaavjrqUKmIq5T206XnhXHYd+jqfCdfIJhbbMlwWhNERvuZkPj8gblVnQUtdVHTiTADaNJo
	+sGFDYHe49gL/TFVEoNkps9cC/XQQESn16cwHeQXkDFsXfBrKvaL03gZ04c7I76xUqTYSD4Zx2q
	lksyIkNm//+MJYi84/U2u/HYLOlPpsdMaBf41vmPFg8epiVNYE1kWziFk+FxH+/TcfTu
X-Google-Smtp-Source: AGHT+IGF+9rOl5bvU3y8GRaa3JtEcHMLuZVvnfRBFjz5nGkXhn3B4mN/y2Xd4GExSKbpjQc6XOtrYg==
X-Received: by 2002:a17:902:d4ce:b0:223:6180:1bf7 with SMTP id d9443c01a7336-2292f9efbcbmr232948895ad.42.1743610518473;
        Wed, 02 Apr 2025 09:15:18 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291eee0bfdsm110882305ad.72.2025.04.02.09.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 09:15:17 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 2 Apr 2025 09:15:16 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Jean Delvare <jdelvare@suse.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Farouk Bouabid <farouk.bouabid@cherry.de>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: hwmon: amc6821: add fan and PWM
 output
Message-ID: <cb88cb97-d033-4aac-be26-049248d85429@roeck-us.net>
References: <20250402102146.65406-1-francesco@dolcini.it>
 <20250402102146.65406-2-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250402102146.65406-2-francesco@dolcini.it>

On Wed, Apr 02, 2025 at 12:21:45PM +0200, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
> 
> Add properties to describe the fan and the PWM controller output.
> 
> Link: https://www.ti.com/lit/gpn/amc6821
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

Applied to hwmon-next.

Thanks,
Guenter
