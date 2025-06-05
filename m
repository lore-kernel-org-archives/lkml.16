Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FBC521B908
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 13:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749128791; cv=none; b=MkElnmX2y/tdKQD9RACBg0cXiAaWGcBn/I53tBRVrTnqejRtPzCVikDg0H7JH4hrBHUIbqAIqUJJ/BYzJop3dtxWXBjgFl4ZD4mVnYVrMYaLWEdZCA2aHnRUrHSOrRpJsc7gk5IPf2fwGlEMhIT4vIC1o5FcFEnXHLRv+QjsutE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749128791; c=relaxed/simple;
	bh=zS8ecJYvpJitQ3UMbVXIWGqUkE6qbecokkfr7msuPkc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lLbNSJ/+tBUHfxJHNHA5NXAy0dTcwnwNHOHePE2Ni96lpxJJWhyWwssyw8LUyDpQUJN+SOVQvdd9cPqk/vuSSZDkg6wSXfI2Blxo6t09gQCEQUDfaB8w8BrJiJOEROrCGh1UXZ+05Jhpubk3JdX/Ynr4meZAUv8GCSxIpDd/zgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hE37ZiDG; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hE37ZiDG"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a36efcadb8so819307f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 06:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749128786; x=1749733586; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ALKVA2fW4irMbGXjAfGWZNtggykUGJCgahiUtNxuSd8=;
        b=hE37ZiDGu7jX1TYfxpGeiiSGeyzR99Jeoii3ivurbeE99fHaO2Y8MtfLhAOunRy0yx
         8zhitREKYvNICRpKf5pBIXnSKK/uMZv8A86Fug9mOZr75VM+FMqwfnTTlIzg+sv+Y0DY
         l2iLsqKB6Ks/IpgoBpYHuAlC69QZ4sstmmeev89FMW9EXtNNqLR/b6js1POkgY8PqBL5
         mFHXIlrHZTVmbPrOaF7aFKFRDCkGdav8diIUirYvUMSNBjD8gQYF4nZeNbNU//gtjHHy
         6XLZabXNJgO1HWCLmX1laGZZoQEZZp0ZYSJg95TsAOzjlzIj8DVidL/ePleu3M1iDJ1i
         pL8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749128786; x=1749733586;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ALKVA2fW4irMbGXjAfGWZNtggykUGJCgahiUtNxuSd8=;
        b=moj8myvUhoyPTzUrt+gpv+hSHJIJn20ckpLE/ZD8xC0s3dJ4kdERbwcXaM5OVsPsaD
         AZxxDxJe5KoJm9jU4THJz776KIdJziAof2+wwsF9CI5xp/kOsbm4hhdKexYWxK2tpLRh
         qBm+MrwqoVFuXqTXpcmnPJ7bMWSv5pVz4GhtOt9/Et/J/D1/99jy1C6dkYf/WYFxWiH2
         5+EqXYzsTCuu85D4eVsdVvx2W7ut9he0Fq40QANvY9DqXInGaRj97Sc6TS4C4y6Aeut+
         eSyhgCPIUB0VcD8Q8DmnzcktaK0oh+OVOPz3/nDN8/E25o4YPQC4waO/pAkHDDnKRm4P
         IkRA==
X-Forwarded-Encrypted: i=1; AJvYcCVb5Ej7aSx949rF77JkTuYts0lam/RY9HXKJwflitZvMpaF8TwrTv9rErLYeVPUkl9ti6Kx4ZedTTna8AA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtDKZ7PyEiW8L36BgIVhtLWHcGaeQoVNEVnvEyCthpixGY8dFw
	U4bqj+KQpzUsC4MzVRKU0g0MOtVK8BdPPjawouEJXcSrCnpZfqO/O4agF0LNf83Tfuo=
X-Gm-Gg: ASbGncvvMz1125QzapP1FfhGoYKP373yOCJNUStRkO8iNGrbcQboLoVGw5/IfEqVtEF
	YlafmUCXIxTSIa7AUhOAm+FO072GWsmrvc3F6ioFhEk8bGB5i3MK1qIALfTJqaW7CcbmIM+xAjn
	hy22afndj+sGJ5b8D2R2RpPKPxKO9JM6M1GGlWwYW9wsdKYEV5he3jcJzcdri64f2cPWK3oxeLm
	SVKetAM+ttcD3Va/PHuXF8ECUb3XKri3lafGrb4dPGlV8+E47ChYA+iJQPQ4tgoAG7KitKE2c1X
	T7T9cSnXVRJBV/oRlaCCGdERzCAyBIDmBVERUztmz/vM5HPtW8TlqyiEtLK8tTgZVHm0aw==
X-Google-Smtp-Source: AGHT+IFlFSrl3XSTZnrLX3liutqht/hIRQLoBNZPN0qE0WMgTCPvfiUO9lKb3LhAK0eALpw01RUcqg==
X-Received: by 2002:a05:6000:1a87:b0:3a4:f7f3:2840 with SMTP id ffacd0b85a97d-3a51d8f60c3mr6177072f8f.1.1749128786358;
        Thu, 05 Jun 2025 06:06:26 -0700 (PDT)
Received: from [192.168.1.221] ([5.30.189.74])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-451f99248a7sm23764615e9.36.2025.06.05.06.06.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jun 2025 06:06:25 -0700 (PDT)
Message-ID: <99d180ad-7e64-41fc-b470-62300a064bbf@linaro.org>
Date: Thu, 5 Jun 2025 16:06:22 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dmaengine: qcom_hidma: fix memory leak on probe
 failure
To: Qasim Ijaz <qasdev00@gmail.com>, Sinan Kaya <okaya@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
References: <20250601224231.24317-1-qasdev00@gmail.com>
 <20250601224231.24317-2-qasdev00@gmail.com>
Content-Language: en-US
From: Eugen Hristev <eugen.hristev@linaro.org>
In-Reply-To: <20250601224231.24317-2-qasdev00@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/2/25 01:42, Qasim Ijaz wrote:
> hidma_ll_init() is invoked to create and initialise a struct hidma_lldev
> object during hidma probe. During this a FIFO buffer is allocated, but
> if some failure occurs after (like hidma_ll_setup failure) we should
> clean up the FIFO.
> 
> Fixes: d1615ca2e085 ("dmaengine: qcom_hidma: implement lower level hardware interface")
> Cc: stable@vger.kernel.org
> Signed-off-by: Qasim Ijaz <qasdev00@gmail.com>

Reviewed-by: Eugen Hristev <eugen.hristev@linaro.org>
