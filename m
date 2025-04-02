Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 707652356B5
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 12:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743596660; cv=none; b=DNrr3DkChgj4+0qzy2ydgI4yrb3QOuIZ+umbfI3NlT5xLpin/6jqN9GH/jetoob750CN1qeRfpX2MKZy8qqPJsB6bJIhFNfX8Y3pg5k5cTNFMrmQY0ARcGS1MYRqMnbHVr1Ypo9s1I/FkSHtQ7b22z71BEffs6d/eVcwYRTF0E8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743596660; c=relaxed/simple;
	bh=0v2URiG8esdkRgUTyd3SngcEHuSOj0Zafp4N84xHkg4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hOG1TXg2a++OkFnk/5qKZ28EReqAHQ47Zs1ndAwZz6/iHo5umK8Hd6FcRxLhtvQqmOkmq5ITZqAfGEvaPLYb4WdF5Hsabq2d0uud2cicOqHao/0+oKLrYoMQu3s3xofPGT1kPyRTN/btSgxdxKPy9DFxQ9NuGVbBUebEw3pfV/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sGYF0GSe; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sGYF0GSe"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43cfebc343dso49608735e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 05:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743596657; x=1744201457; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ztK8X1ZBqwTpCQZgzQx75WiIn9I1zX9gTe47p5OjGL8=;
        b=sGYF0GSeNVXXFwNIelq2JcE7p2k9EUARs3S/FzjucEFbRNJDZO+iNusSH6DpNHfUYh
         7Oci/JxglJ/EjAVKagJ1msMF51SxzoM93l9mXOMhlnUDiFOdCVzy2DLbj4tE/zcbe2HU
         5ucqlbzBTmsjUxxIe2eFF6r8A7xIExAr4unP03Uy1Ja9pETHp5Scl4MQaXAFMDz8ww7Z
         pUd1SHOL1rRIB4B1IJK5Jw1DlPP7Qz0DbVEnfrf0bwPixpLK/8Q0RTWyDYTvkrJKHTCW
         SFgHqqiphChv/gBlnTfueNWEB6F4AGrp3qDH6ElaLsaaNyyrqdpLoU4zt2vRgQ3ylyrD
         JuLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743596657; x=1744201457;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ztK8X1ZBqwTpCQZgzQx75WiIn9I1zX9gTe47p5OjGL8=;
        b=FxuvWMJKI53JcGGCsgGImDB+mazfTAQOc9WMugqcYzIhgHsT+qiu6P5oqYavwO8/q9
         Vyyu/otx3FJUKVsuNAVJOlK26zXDq5C9L/+MXASApr8E6dQOEPIvpY+IaM6f6U3qKmDR
         NBopOqVdFTQMo0dG0gjm+Bta4K2kd7epdGzCNIxKiizMpuXJhHe714+R/7PCimUgmi2D
         eRAB7VS/NdirWsXvkPT4tsdsCaBK8sQVRyX8fPBmilOaGq0hcrlVz44LstyZVjFX+tjG
         hAFnxwti9qz1n4GN9PiTTG1AA37dnrD4msKI4w18P5jrRPfKEZRFDxicCcsaDsihcEzj
         DVdA==
X-Forwarded-Encrypted: i=1; AJvYcCVOEw3TPbpaNzCAt4jDGXVB07mnNlnLZjvDgn6YbJ1sh/I8+IfE2eHwzdrAqK7cz8SveKe59axoVVaDpe4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHV0VKrXBWED06lZzSMVth7TP4h9lfn3u/yrH1BkSeFRrAftA/
	/8ILn0Xx0bz9Nrg3lxUtT7gu6NX58SvdviAnCAHUMPrNe3PWMRwyCQjM4epezbc=
X-Gm-Gg: ASbGnctWx69Tb09FpGzdfvT6b5x5Txa2hWDaMvOIIadOP2cxt4ROGzvWRW0PdjTOtdo
	k8mwE3gnX7RBnX2JZOr/mzqHAo5CKJlE8jOWVzpgdSjfvxZG+RE46Ew+qSESui1Zu6SDvfpF22A
	nH24oc3qBlwXilnjT+MFCM30fUxsoUg4UrkQJM4hU+ck2a3SXoq1zWgaByd7GuDI5YIQNfNxqeT
	IuyHufE88217XESIF1legIac0UspDsfcF7Z//oD+AxI3qo1XWYJOdWTENLKvDWmaedbPv4e1XMI
	UQF5YGrWNpZJ90Ki+pEFzjPwI0l202mFtfSYhS0jzmTP02YaXD6Ou4CxNVcGXQEuASo+KRa+OTK
	DNv2gdDLH8J6qW3tPRHdo
X-Google-Smtp-Source: AGHT+IF40EzUUmGVd0zd7rqUsdkDiAiIczPUOCxpw6qKHK2XBj0/TDqOPqbFk3OkguXZaFpVMQXW9A==
X-Received: by 2002:a05:600c:450a:b0:43d:ed:ad07 with SMTP id 5b1f17b1804b1-43ea7cdfdf8mr50511585e9.29.1743596656675;
        Wed, 02 Apr 2025 05:24:16 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb60ccc66sm19418675e9.24.2025.04.02.05.24.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 05:24:16 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v3 0/2] media: MAINTAINERS: Update venus/iris reviewers and
 maintainers list
Date: Wed, 02 Apr 2025 13:24:13 +0100
Message-Id: <20250402-b4-25-03-29-media-committers-venus-iris-maintainers-v3-0-2b2434807ece@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG0s7WcC/6XOPQ7CMAwF4KugzBilNv8T90AMaeq2lmiCkhKBq
 t6dhAlWGCz5vcGfJxU5CEd1XEwqcJIo3uVAy4WyvXEdgzQ5K9S40YQHqNeAG9AEeR+4EQPWD4O
 MI4cIid09ggSJMBhxY55Sc017Xh8au93VKl++BW7l8VbPl5x7iaMPz/cTqSrtf16qQINmW2m9a
 xsme7qKM8GvfOhUARN+IFT9hmBBaIuIraE9mS9knucX4+8NGlwBAAA=
X-Change-ID: 20250329-b4-25-03-29-media-committers-venus-iris-maintainers-eb38e49dc67b
To: stanimir.k.varbanov@gmail.com, hverkuil@xs4all.nl, 
 quic_vgarodia@quicinc.com, quic_dikshita@quicinc.com, mchehab@kernel.org, 
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2

V3:
- Was: Add myself into venus/iris to maintain/review
- I'll be helping to pickup patches for camss, venus and iris so
  +R to make sure checkpatch.pl includes me.
- +M Dikshita as she is an expert in this area.
- Link to v2: https://lore.kernel.org/r/20250331-b4-25-03-29-media-committers-venus-iris-maintainers-v2-0-036222fa383a@linaro.org

V2:
- Remove Stan from venus +M per his indication he can't continue
  due to lack of appropriate test hardware.
- Apply trailers from Neil on patch #2
- Link to v1: https://lore.kernel.org/r/20250329-b4-25-03-29-media-committers-venus-iris-maintainers-v1-0-0ec1007fde3c@linaro.org

V1:
I'd like to help out getting patches reviewed and merged for both of these
drivers.

+M for venus
+R for iris

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
Bryan O'Donoghue (2):
      media: MAINTAINERS: Amend venus Maintainers and Reviewers
      media: MAINTAINERS: Add myself to iris Reviewers

 MAINTAINERS | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
---
base-commit: f2151613e040973c868d28c8b00885dfab69eb75
change-id: 20250329-b4-25-03-29-media-committers-venus-iris-maintainers-eb38e49dc67b

Best regards,
-- 
Bryan O'Donoghue <bryan.odonoghue@linaro.org>

