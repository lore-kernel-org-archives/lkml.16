Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E36A82AE97
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 14:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751379067; cv=none; b=CS+U4/7dsX5WQSItkNUC5dDYWqVajjs/IrF7JfVI2gMGm/ikJu08z4woERUsWtQ6cBGXI3/Mo5xSqmsHJOpcgdM2EBrXIZkaA8mUGGwydjwjKpMWeSRE1tSCh+LJtbkPKQVbqstM6Afwwv5GYv6DsFA8SRuf3LKBDiQSByUwPas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751379067; c=relaxed/simple;
	bh=2K9ZivYXUuwV2vkpZBcFHQhkKQ12wzxuV9+F7FGnQiI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=esrdsJympYxFS+MjeFEUsBZ4ixSiXIKtzR+KHIy41NYYmadRhOmZaydzVVlqN1PGvoS7TtZnwLp9RO7IY/ZnfH7HBocdjmeSLtPpp2rN1WnwBaSfmVvLRyNQ1Saxd7/S9h0xsiorQDf+byDZ5gPf/u/0e/qZqyWTIkTmEAIJPR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B8cLmJOW; arc=none smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B8cLmJOW"
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-2efb0b03e40so978142fac.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 07:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751379065; x=1751983865; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zBZDo+iIbaRT38p2M2Gt1DuCw7wsjHy8MPcNuCpg9Jk=;
        b=B8cLmJOWZ85dvlR0loL4sewjAfNI5G3ID6fjYVEbTA+sMvm8ltokHdskJm2RBrG5KZ
         OPUGpIge5PdeahyZQsCsmRBgMa5bPeoFbsZlKwsxWh1mLfw8/51bSKVEoLzVzBQfcmHH
         w5lIJdGxtgIa5e/OyHNOji0Ggn8do/Y0C6OCQb+dM+TsZ69Mi5QIZzMxc4SS+iPvoDj7
         sbuDxzvFtbW8mK8YfSt+vyrkcz66COd3QXoT0hUSSG7vF4K1UM5UFNLQbvXcXen8CMvK
         pdzTKzloeOA84kJCDJwekfyzBlqHJNG578h2a+AY4F5iQOAct4P6RI8AfexGi5NiiS3J
         Ky9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751379065; x=1751983865;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zBZDo+iIbaRT38p2M2Gt1DuCw7wsjHy8MPcNuCpg9Jk=;
        b=R6chJljkH8O4RQkF0Oex4yUEtgXJilcBxasl4VW81gPt2tBK56lh/Hf3voib7o6WRu
         2c1E5lcLURjuXcm0wBWe48z/MRRb+E3m2FR2OilVQtcqYTMgyZ1LIW6PdbM3/kDXO8SA
         SnUd+ipQ8QjOAmH1Rj7HVwwP2TXcbKr2+8RM05c5CVryiHdEQfO/0dHqyyKo2ZecvbMQ
         AAxcHqD2gMMnPZG8uN4wqt5YJmyeoqkK3w1ndLHsGPUS81f6sdfiNgcBTjT49FRcbOVn
         /GtNJym7Gb9ytXcbyVFZJvip/EvWbtb5WXyWyt5vCupR3/U0F8SykTH8VFfuTsdkyHLC
         ekKw==
X-Forwarded-Encrypted: i=1; AJvYcCU/gHXW4bnwN92KenSAo1MbE7mGSixiIhq+TU2d8dTlPABDqUYIO/1V6JWeCcvauowQR7wkYHQkU8SFDeY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwlhkqlJw1gwgKC01AlRQULEwi/x1K5aZAmBIow0n9am1ei0jWc
	5RsLqrI1R76YAAb7cQQtuEFmxam68Oh66l+3RdaPfKcdMnr/MZ3WArHsk/nNYGZ0HqA=
X-Gm-Gg: ASbGncu64yziz2w3AaIarq85zmCnjYlWlBW5mkzgS+fo1k29lWzpKwdw/ptUppU5d5T
	kcl9nWRfkNUISN2H2mSbwb27SVY00NI5gOh/TXoQpHxyur88x1GsDeV4JgOrHuibOEpRYOdOA/w
	6nwkc4qIqpl2XUdXrHTQ/0CfZ03vODDN6+k9lSAPG8RUIGNwaIAEgB4CCcKAfvZeIh1zyOrgbDp
	eZpsF3VwOhpyI1JEYBJ165v781YsDHQFpB2h7ifcyUqz4s0ktCOKYDoz4Yqbj/NKu6W4yEuhiw+
	1/TAAiFLXwgGSqU7msUYjEP+eKjVNAB3rxpEl4KqJRpvSb01lu97Rz6L+/WnVITyIo1VnQ==
X-Google-Smtp-Source: AGHT+IFLkQYxN+cJSXm+bghahO0tFjg9oH443l9I3mmEiA3RIQYgQ4k8orQ+i61VslSoHfkS0P+xRg==
X-Received: by 2002:a05:6870:b689:b0:2c7:6150:fff7 with SMTP id 586e51a60fabf-2efed776901mr13786145fac.35.1751379061278;
        Tue, 01 Jul 2025 07:11:01 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:8ebc:82eb:65f7:565e])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2efd4ef026esm3306223fac.11.2025.07.01.07.10.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 07:11:00 -0700 (PDT)
Date: Tue, 1 Jul 2025 17:10:58 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Marcos Garcia <magazo2005@gmail.com>
Cc: gregkh@linuxfoundation.org, philipp.g.hortmann@gmail.com,
	karanja99erick@gmail.com, rodrigo.gobbi.7@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH staging] staging: rtl8723bs: replace magic numbers in
 rtl8723b_InitBeaconParameters()
Message-ID: <9f4ae2d7-5a8b-4785-9df8-3d22925b8f3a@suswa.mountain>
References: <20250701074243.1300186-1-magazo2005@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250701074243.1300186-1-magazo2005@gmail.com>

On Tue, Jul 01, 2025 at 09:40:49AM +0200, Marcos Garcia wrote:
> 
> 
> Replace hardcoded values in rtl8723b_InitBeaconParameters() with defined constants
> TBTT_PROHIBIT_VENDOR_DEFAULT (0x6404) and BCNTCFG_AIFS_MAX (0x660F) for clarity and
> maintainability, addressing the TODO comment in the code.
> 
> The values were sourced from the following documentation:
> - REG_TBTT_PROHIBIT (Offset 0x0540): Bits [15:8] = 0x64 (100ms prohibit time, 1ms units),
>   Bits [7:0] = 0x04 (2ms margin, 0.5ms units), as per RTL8723BS Datasheet v1.5,
>   Section 7.3.1.5 and RTL8723BS Programming Guide, p. 112.
> - REG_BCNTCFG (Offset 0x0510): 0x660F sets max AIFS (0x0F) to prioritize beacon
>   transmission, as per RTL8723BS Datasheet v1.5, Section 7.3.1.3.
> 
> Hi Dan,
> 
> Thank you for your detailed feedback — I truly appreciate it. I tried to contact you
> earlier, but it seems my email didn't reach you. This is my first kernel contribution,
> and I started by addressing TODO comments, thinking they were straightforward. I now
> realize even these changes require deep hardware understanding. I used AI to assist with
> parts of the commit message, but I didn't review it thoroughly enough, and I take full
> responsibility for the vague comments. I could only find limited references to these
> values, and the documentation seems restricted. I apologize for any oversight and
> promise to research more carefully in the future. Thank you for your guidance.
> 

I feel like there needs to be some kind of notice on patches which are
generated with AI.  I was so puzzled when it said that the units were
in half miliseconds, but AI sounds so confident and professional and
people do crazy things all the time.

I have sent my fair share of guesswork patch where it's like "I think
the code is correct, but it's just indented incorrectly" or whatever.
And I try to put a note to say that it's guesswork so, "Please, review
this one extra carefully."  With AI it's all 100% guesswork, but it's
formatted as if it's quoting a spec.  There is a lot of potential for
confusion.

regards,
dan carpenter

