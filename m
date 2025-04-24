Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E8B979F5
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 07:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745478070; cv=none; b=iiV/CmsaEQrn1/WX+47l5+Pw795BvOHTMYRWIe5eSweb3Ckh710UKEM++6t+80yOnX9h5FzHJgH2kCm1EivONj/7SRiGJTUDC7muKcdzA5GjYfaarFMKOYv7tE0z85zoC+wS5N2E/jGOrGYTuHn064cjRNn/zTI7RdsQaIOnExU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745478070; c=relaxed/simple;
	bh=L3APaDNcpcKWy+ljj6wYw1aJYFyDyEbeFg9xBsk1Bwc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YFuIsIRzBt4EJyC7KX1JFHuOQ8M4aH+uPFUmAov2+mXS0nPnmCOfx4YUKPgYXIaHt+IwuXftlKNrtHyej1BZeL00v7VTHCTkucQA/KaGPhq+VdDSj5cYnmHvKmGKIz4agLGIJApCL8ef3wqIY9YcCu9EUW3SNS9C7/8pRJ16qjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LXyrZaND; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LXyrZaND"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5e5e0caa151so1305753a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 00:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745478067; x=1746082867; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Bd6KF7qnJBjEfDBLcMQiy13vHf6l7mQMuJsOH543KwE=;
        b=LXyrZaNDE75SaVENfMyCd+POEynZSKdQ9kE9kUVLhwJESd1zgJi+BeJoNZit281zjn
         KVHBqcGjhxHelqdm7Tn+iJBcXjsW7X5cfYhrY4uTNeQXXiqKcc4QPStV511Nu5Fg59QM
         KKI1GJPBQbphXmEpEtyppGgX5InfadebEJuZQkuUlp4g34SqewQtAOgh8rjVKAr0ueln
         cqtYyz0KIs2xqS/cpXElC653DFBONmeaKCAKJ82P7JTQx4czmrYTcDMO6Pls7uMrYpOY
         Iz9IuPeD3MZnXaCtFBEpjg98RxdVGN8M4nlMdvMtP+0BlA7ij9DsLb1OzNjdSCPOMiPZ
         Vv6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745478067; x=1746082867;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bd6KF7qnJBjEfDBLcMQiy13vHf6l7mQMuJsOH543KwE=;
        b=mi2PBAl6zDB3RKuFUQumNguOIPmgpnKLgDZWHza7FFptrmN3ge/gOHK3r/eSgc8fEI
         UfXiyyrYVeD27ffLUsdSA8Iwz/fmApvpj2a8YhHnTpqQUhnoCphRxSjqgeZUrFe0oe44
         /OACEZ55mYGHmMiOm/T6DJwDf8sZJisMZ+aVdyB7WOQMT7G5UNbvDemDT1Kt5pfcgjoh
         Gpd4zYV3IQh5sAnDioEDLLMKErXAnrTkuKJSnBUKlAfzTz7CMRpHHKNcKPN7AQEylVW3
         7lT3OBWbFjPmEIWkeDWFHJezSLXmpqEIRnHzhfeQW0WzFJfK9Or+Aqe9oSoV3Fh6HC5r
         NCBA==
X-Forwarded-Encrypted: i=1; AJvYcCUylCeP6wq2/tnEnTAhk40q/VaMgRigYbby4Esw0+d9GcFY4PTEb6qaJGXA7hSKK7FJachAfruRlV82xYg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzx1AhOa1TOe+RAAAV1nyD1Rch1i9wBcB/Eit6GlhycMy/LKaEb
	GGyFX/RMDcQaa6FITGbp82rplOWqP8ZbIS8QldP0qK6FGzty+vrzRAeSJOeWnjj1OMbnSfsrar4
	t
X-Gm-Gg: ASbGncv8TATkkKzYz01KS4P7SRMhdKDBb74OsQGe5VcDCZMVUZj2LIB1We14PpHupQx
	RWkznFUz7ksQRQYbMZswjkwS7odyT1lgrTAazDDPPPyn91AARLnqTmVvpvKDlgZgC4VAW9uGVdW
	dK9cudmgN3eRthmVvoiRyMHDe0RZkYqmmscHHq1WNMs67ZWFcr2tSm0maib8isSSp1BGZzirkZO
	LdwC9cCW0F0Knqa6+Mr71KyvleDKudmvNjptEI/RVsfCq93dkLIYw/D4VYvm9sr6k+k0F6/9h+b
	e1ctZcYAGREZw9/zfYDWsFLNN/dfIxQlnSZqWQ==
X-Google-Smtp-Source: AGHT+IGwr/WuZPUfvax9eIsb96aaCta/8FzIuwMP4WW4Ar2s0sxwfKKsr5uKtNR7HMl6jcdgRdFKDA==
X-Received: by 2002:a17:906:44e:b0:aca:a204:5df2 with SMTP id a640c23a62f3a-ace573a6ec3mr96658366b.49.1745478056074;
        Thu, 24 Apr 2025 00:00:56 -0700 (PDT)
Received: from linaro.org ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace59830fe7sm59240666b.13.2025.04.24.00.00.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 00:00:55 -0700 (PDT)
Date: Thu, 24 Apr 2025 10:00:53 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Mark Brown <broonie@kernel.org>,
	Sricharan Ramabadhran <quic_srichara@quicinc.com>,
	Varadarajan Narayanan <quic_varada@quicinc.com>,
	Md Sadre Alam <quic_mdalam@quicinc.com>, linux-spi@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] spi: spi-qpic-snand: propagate errors from
 qcom_spi_block_erase()
Message-ID: <aAnhpVaVzn/G8TR3@linaro.org>
References: <20250423-qpic-snand-propagate-error-v1-1-4b26ed45fdb5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250423-qpic-snand-propagate-error-v1-1-4b26ed45fdb5@gmail.com>

On 25-04-23 21:31:57, Gabor Juhos wrote:
> The qcom_spi_block_erase() function returns with error in case of
> failure. Change the qcom_spi_send_cmdaddr() function to propagate
> these errors to the callers instead of returning with success.
> 
> Fixes: 7304d1909080 ("spi: spi-qpic: add driver for QCOM SPI NAND flash Interface")
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
