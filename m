Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 516F61367
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 07:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748418285; cv=none; b=mze46ljX21f5WFkgFkiJih+eLONj3eilJWhgBcwOavYyJIjG618Byf9azIiMy252fZ9v+FRgsh9b8RfTqv2gLmom0aLa+zLxEm/D2P1zBHtyfSMwsS/eLPVWwQ7+o0y7TUoSrSbg9F2S1lEkn2ZfMEZYt8W/L/fqNRhVx3xu8p8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748418285; c=relaxed/simple;
	bh=9n0cPJV+g+yarXV9zmLs6fR1CGDsXbBKFs5PKVOvzX8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sBwtnNUfM67UeR4jGT0sE/kl7TjX8vT25DqcxGVju/tG8QeEZhSjEXcSVnKI6C9KlxlKkBN4v34kmuNT8y1ya8hF7M3CjR/Bt6DXKARBh4zt21M4NNnrwTgZRqDtgHx4sRcoarSoIh01D2QTCHvgTM2FW1FxbBosZ9A8aNecq/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=R3CA8d9E; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="R3CA8d9E"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-442f5b3c710so38921345e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 00:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748418281; x=1749023081; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NCAzjCL4Bl6CH02UvykJmrP16J+tWlFWZGvoCIzzt7U=;
        b=R3CA8d9EK0zyietaYcN++gt5HGPpzFv1JD5ABNjJk3oHFpjslnQXmxjpQQS6GjvHTW
         81H2MVjfNiXXZpZa4gMXwFxxPO3jCUr1QdNJIFWfNfGf5+AX7pd7XOWtAG2MSjfmCbvq
         lownUMvsWFu8h2NtbnVke4leOTgrlt/7RkB1QwdIO468S1xdz83OL6i5TKiHaCZH5MVT
         slTbFLsFDZSup7Tlp0tk6SQRwoRMqXXp/Yx3b4z1r+Aoa5m3kLGECKyf1TthW+MzF6JU
         G7knqzShOf4js/1jXwLWDF/hHfuWlf5Ij2wcZUq4PQnNqUUJqAWTpPMpzuKSMHvtsD57
         neyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748418281; x=1749023081;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NCAzjCL4Bl6CH02UvykJmrP16J+tWlFWZGvoCIzzt7U=;
        b=rzvNSSE6wQbZg/3QG9f9+OqvObtuSKs1XFno7OlKniM4VK4gHCc0IITATaUhcu7KIU
         DbffQVGGcFbe34gnGZU4eVWhUUEjqvlJ7oWi2heTQr7Gr1t0hnFvEULNVdLKWorbxhwf
         JSRbU8XFXEBog6EOG7gRuK1MD0/f3OWSMZzZoUxSoDroy2FwFhACFF7xXw9jUvyAwfUq
         VIDhyYUjbPXv7V4pwKmoMb6Khvirtx0YTx/aryxzbEIibszkg6NthQ8zHUV774VZY8Me
         zfLClwVPVUuxMgEcj6tigE7oz9c/R4RzxMikU9L/9km6VOB1lMVkMz7B6g3uJy4DLMmX
         S5UA==
X-Forwarded-Encrypted: i=1; AJvYcCVRVIDs9KmWvxNGz+rpT9PI5EdNkwQgb/Y8Rpj7J5gQIqsQlAQYYUzVXKAaXTcvmTPPAU5K4fVrdZ63aZg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxO/5/sjg3GUMUEQOQV94OsRaxmrUvoeV9xDsd67o/W5LQTdwmL
	Sr3bN7PnfxFP5XA2SXXMnGVRDgEEvFHLMdPRdc7SAmYwYN8Lc2m9+nT3rE3/FVznJGY=
X-Gm-Gg: ASbGncsxxwMfM50lO5NdaxgW5e9OcJ7xNWxXqRcoRqAg7nnQtYcK6TmK3l6lxktVGPD
	af2N2mpKWH483ASSEw5Nd2oPe8xMX8Ud8y/SoliE7oo7qbNS/TLgbSOLJnin5LEZyISFjgTYIsZ
	wV4kBoUqNP4/TNrPJ+00Q0dZxrsEQNQh/IMb5wd9RNKLZ2MSsXnUlwWLNQ8VdXVu7d8lL0puUvD
	z/Hxg1BMoQx4DFNQDnzeiIxY0XJU1x2gNQJsnnRMZ+mEm92XpqhVulRfA8okOma9ns3cSslsWom
	IT+gDcbeBCNgJwczSAGqzbo+JoBssTNZodBh7Qf5bIarj2ew
X-Google-Smtp-Source: AGHT+IE/iUqPKQrG7bwzgJBp3KKnYuDmJ/JAmKt65e94C4RB9c06whWy8YwNSu/XTnIj1izcf15HNw==
X-Received: by 2002:a05:600c:4e0a:b0:43c:f895:cb4e with SMTP id 5b1f17b1804b1-44c91dd158bmr145314685e9.17.1748418281526;
        Wed, 28 May 2025 00:44:41 -0700 (PDT)
Received: from linaro.org ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450064a1246sm12549605e9.10.2025.05.28.00.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 00:44:40 -0700 (PDT)
Date: Wed, 28 May 2025 10:44:39 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100: Add interconnect to primary
 USB3 controller
Message-ID: <aDa+57zCFSOXyYY7@linaro.org>
References: <20250527-topic-x1e_usb_icc-v1-1-43b604cb0609@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250527-topic-x1e_usb_icc-v1-1-43b604cb0609@oss.qualcomm.com>

On 25-05-27 21:26:17, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> This seems to have been omitted during the initial bringup.
> 
> Fixes: 4af46b7bd66f ("arm64: dts: qcom: x1e80100: Add USB nodes")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
