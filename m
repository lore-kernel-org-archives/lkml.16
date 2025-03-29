Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E1BC15A8
	for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 01:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743211615; cv=none; b=l96N0/hdbA8gRnknFRDMcah7lZcAv8E9r7STzDGAsDGrSp7Qhc73dIVGPwsUyKeY9tiBO1dZIBo9/vy6CSXjSUfuZz9JMiDD6YewP6SG7EzR4xX92xipA7yFgczQiiN+RUjAxxtR+1q7QQc5yWSn6o5KiveFu64d9Q9MDwk3k1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743211615; c=relaxed/simple;
	bh=ieo3v3eB0Q3Vd8qHSezVD4mOnD8BGH4gMrjlTPEOOWA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To; b=SGssrcaW06LvQFDNSjcCwH5C0CEtM1jf0dHI5HyoPs8fpwFOeuzj8sYUowxlZCT/nLm6S+VCZUoNsF+AaXlOkOWu6M9dSru548A1QBWFlteM/BHch6zrBsR1eaXjUFUeVd4oTayw0USP4Bzt08D9oOCPBEfq6cIJH/tueoQs1uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ekTOO4iG; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ekTOO4iG"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3995ff6b066so1556921f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 18:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743211612; x=1743816412; darn=vger.kernel.org;
        h=to:content-transfer-encoding:mime-version:message-id:date:subject
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z3qGhnuDainIiSGsnAJ33rQSgGHUL64MysGlQKWygUU=;
        b=ekTOO4iGHIY9n6RbogazejacyBhs3WT8xEMUSvxTKow1CbTN/aG0eMi/ccNE1mi1kQ
         OkwP/q+N4Wzdv0gObmIgoGW/RwQlZZH8tSpqG9pQltEyDdIzgVZUZGA/gCEiuXOMhNFm
         U0zfT72QPqd2saBKAKpoealSQEu4nZg9EYL6db+JbGwibxzuYETVwCPf2vtxLtXKhAC/
         CgeN5elnspGQkPJFKZs46A5Tdq9CYT7zcrFbRbCH8zEkNTijcy6fBiK+X8iR+j0wA7/S
         x9vIiT7P7FUu6vBp5Dy/GyTXi0W8eYeCZ16wptxQ1wQpy8GzyTKOJhqSr6IO7BjCMWhi
         ffNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743211612; x=1743816412;
        h=to:content-transfer-encoding:mime-version:message-id:date:subject
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z3qGhnuDainIiSGsnAJ33rQSgGHUL64MysGlQKWygUU=;
        b=A4ZWjimEGNR4u5GgE60bEQxQm33RR1AdTmYyGAX2Ym3qgTOe+hA8r92WmLYtGwSJeZ
         Nn9VFBw1DAKPgwq73NZp/QkixV0smv1pHhoRAiW3WqmTBn/4R+NabLeV5eySsMyJyDJK
         QUKBw6+KpwYr1qewyz1xB/yiICa3RiD18Wrvs/s5z4GLgzJEn+IXt3EKiad+0vTWSC9d
         A8RM3k6iWb4+Z23Vt1Q6IHovFxyo3fO/KXAUo3iACm7v8k6L6OyQMXv3IUBRJdgdkvtE
         96KJsquPVNrMcxVBcc52XZ+3MwO/WeAyER0qKcGbTUkmIalpTqeMLI/jWW57QigW/Rql
         SPVw==
X-Forwarded-Encrypted: i=1; AJvYcCVzR53kgIn0pkT71PcUBXm1MUlUffDreYEgWtXEmGOdqEN+YDTpc2Nj82b4L86E14/UVNmWDtREne/dWto=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJGmwZPC7F1XOm8Sj4hhnZNKbP6SBfu5evsy12xZGPg3O7ojxn
	YrijG1dgDTViTlOurMvl4QzivWZ2ZaQKNP2HiO2Uy0xLZgFgC2KF6msH9RS4npk=
X-Gm-Gg: ASbGncvJo4QQ5y2GH+31+7GEwiNAjnb+XDSwloU3m3EyIwsLSCwVg6CgxBisXLG687L
	UnXO9gvi5AT7TsbDTQ05N4ObbwJ8AeBYyg7vlSsEPMdAiYpHafbl7pPgIlkznjz9qo3n8YQ/D/6
	cpzUzLRsYZn39VfXp6GQeg6qNzgapIOTsx8pEQvhEGgxt8PfV5IHRV+ZarPCVhpClRz+1//jfm/
	WoJ60/qt+WEx3JEGKRGYJCrzczTAFWef/QokfkwfqiWaNmIjXlkuEnRNRGVT0GofmUAgn2Zxrif
	AXCiz0CPPF1BtlvFD+x2/u0jqoUg/pbUgkJXoZ7mQwbrmz7XABfaOF6vX49eOIkSSHAXCHMkCRS
	I98CGSwGUILW6+u43tFn5
X-Google-Smtp-Source: AGHT+IGTHkSX5Lsugh5eM7Cu6CGWHlhiuVXW/CQFpV4/rGcYQLEZya9631aVHT9jxzBaZCaGHcBp/w==
X-Received: by 2002:a05:6000:400b:b0:39c:dfb:9e8e with SMTP id ffacd0b85a97d-39c120c7cc3mr845271f8f.8.1743211611742;
        Fri, 28 Mar 2025 18:26:51 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b7a4239sm4264655f8f.94.2025.03.28.18.26.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 18:26:51 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH 0/2] media: MAINTAINERS: Add myself into venus/iris to
 maintain/review
Date: Sat, 29 Mar 2025 01:26:49 +0000
Message-Id: <20250329-b4-25-03-29-media-committers-venus-iris-maintainers-v1-0-0ec1007fde3c@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFlM52cC/x2NSw7CMAxEr1J5jaWQtEC5SsUiHwNeJEV2qCpVv
 XsDi5HmvcXMBkrCpHDvNhBaWHkuDc6nDuLblxchp8ZgjR2MsyOGHu2AxmHrmRJ7jHPOXCuJ4kL
 lq8jCitlzqS0/TcHdqB9TvFwDtOWP0JPX/+v02PcDoz51poUAAAA=
X-Change-ID: 20250329-b4-25-03-29-media-committers-venus-iris-maintainers-eb38e49dc67b
To: stanimir.k.varbanov@gmail.com, hverkuil@xs4all.nl, 
 quic_vgarodia@quicinc.com, quic_dikshita@quicinc.com, mchehab@kernel.org, 
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2

I'd like to help out getting patches reviewed and merged for both of these
drivers.

+M for venus
+R for iris

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
Bryan O'Donoghue (2):
      media: MAINTAINERS: Switch from venus Reviewer to Maintainer
      media: MAINTAINERS: Add myself to iris Reviewers

 MAINTAINERS | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
---
base-commit: f2151613e040973c868d28c8b00885dfab69eb75
change-id: 20250329-b4-25-03-29-media-committers-venus-iris-maintainers-eb38e49dc67b

Best regards,
-- 
Bryan O'Donoghue <bryan.odonoghue@linaro.org>

