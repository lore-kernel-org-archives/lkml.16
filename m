Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F59B2E406
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 14:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749826665; cv=none; b=cjzCPQaT+EZHz37BCVJmLoRp4ZIBRND8GtpDksIFS6S/2iKnudu4m7f2TsTriNxwV6i5tBUUBEVJKBP0dZYIsNRUCzbBf56kSM7Orbo2bH70bFuvwHrNdiG6JAsY30M66B6PHOo+cnQZitulV3JMTkOJsA358rhxUXwHWLzPmZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749826665; c=relaxed/simple;
	bh=EiQOOWFkzzeyj6/G+hsyo5qE25sCt/13o6+DhimKiOg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=EULLGdHGmeSsykF23670baNui5iC8yCzP+I0HihzqlC679AUj25ZqGnnu4KcglSJxPzBbPITuPg4yUYMv9KsAJAgJC5a7GDeE0VP5Uiuu3a5dt4pb2xKntnKkYNAM1WvmlN64W9poqZnO+mKPvgtxnCFyBuZfQgOnhx2PGyHT5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RBIYBh0M; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RBIYBh0M"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-442fda876a6so19685325e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 07:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749826661; x=1750431461; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1CnpYz9K0mT/m/oiAcVJkvrvCJiX+sS/URqYCr0+onU=;
        b=RBIYBh0MOVLTOxaPIPDGDrkDLNKEOqdscG4ac6OpZ87Wv25gexHv8lI90GPPI3UAnY
         pyQskyMkBuOAieR3TscHAHep3VxJOPlI+MbIgjZELmj5JgY8+hgOSRBsshR1BxikrkWa
         de479Jjz/+iM87fcOZkwA4UCiQlCYsem1ITzNVUEgob75AOP+ODa0ITT/0uRzjrI4M2T
         14Sc5OJjkXclvURQ3e93J9K42ecwUILEMU3d5y+/+JPB+tZYE6+pVPkD5546EcPkxffd
         LdusvH4iLCNbj4hqFG4wrBgME1aolK+cZsIAtA760YhTPWkyh7unJFdFRYDkVrVwPUb/
         YOog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749826661; x=1750431461;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1CnpYz9K0mT/m/oiAcVJkvrvCJiX+sS/URqYCr0+onU=;
        b=f5r5Nek0tH4Kf0uVudnamk3HCrBB7hv9IJFXKzZQ8EXA0l5CTO4wFq3lvJsqpmrEDW
         nlsLNtwkT8//UNJE9qnCKj3GfPb7HwL6Vp5DVPdr1Wb0yKXXw/JlA2OZyJ/tK/hQWmN5
         ZCmxSd8CYLGqwT/Fb3k5X3GStDOCJO8mqbCSyCsBhVvsUFcPwSxnurElCgtAWMJcEpdv
         tgE3QhKtQkbSVwLbjDUFW7pJ4DQZ3vp4nelcabQG2kEXe5CJX6IPqgamxV5/7yDWINeD
         6/T7miJ/XtckiQ7TdVAPpJ6W9AeqDveZlTM13+0UiSsabN4NwilxQCzjPqyBALa2Zcv4
         WjSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBBwDVxfHu33VKa8d4rIZJsxqEZawR+9m8UAzlw9t9hOLdCOhtkGZY0qGFxI8pnfptd8rQIZhv4Y93nIo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyrPvZ8/LJ2tuKvb2MG4gtBTTiqaZuBWHWANPevKZzylOoifk8U
	sjr9dJ14rfQrcDjzbAtVho6QXSiL5mNEYlsI2V+iJ1HdPWMQnm+QSLRiUxvxTP2kYd5ki4/E4XC
	s4yGOuTk=
X-Gm-Gg: ASbGncuVW+fAue9U2TTZKImWKG3YKodxZFy882VlfCQXU7b/1j5c96vV7xKmmBljtZD
	21oDrabY2Ay85bDbz1v/jMdLr0jWc+61peqH7H71YvhIazmYvqBkPUiERFTsdqcJb/kn/5PxrI1
	dvsOQoVTFuYzJoo7Di2CGYlEmpwvbHHgaiwih/z4Y/m5vXyljX58/89jHdLE0Z9LUtRAPTkMBkY
	gJLSXXEoPragyPsKELspF5LHyMRj+eOEsYl7M8djYZlLWRWuNObr5w/s8IsQLVp7d4sDnFSCKD8
	Zwyr5mg34Wea//jjaLCZwHiwSPqvYS34yAH3ouC+XkPw/KmusAlOLGZvPKmfmvX7hArR2/Kq6kY
	9ShM=
X-Google-Smtp-Source: AGHT+IHGukDkZVswTcj0Lp6moWGFAwYliY4cT6cRYlRm6eZSgyLpxqv52EshO7PcMNoDb7jfDD7ZSg==
X-Received: by 2002:a05:600c:a301:b0:442:f12f:bd9f with SMTP id 5b1f17b1804b1-45334b2aaadmr25496635e9.27.1749826661479;
        Fri, 13 Jun 2025 07:57:41 -0700 (PDT)
Received: from localhost ([2a02:c7c:7213:c700:c8e2:ba7d:a1c6:463f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453305a0d9dsm48887925e9.21.2025.06.13.07.57.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 07:57:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 13 Jun 2025 15:57:40 +0100
Message-Id: <DALHS6EU059G.18NCREBNOHJ26@linaro.org>
Cc: <freedreno@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
 "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Rob Clark" <robdclark@gmail.com>, "Sean Paul"
 <sean@poorly.run>, "Konrad Dybcio" <konradybcio@kernel.org>, "Abhinav
 Kumar" <quic_abhinavk@quicinc.com>, "Dmitry Baryshkov" <lumag@kernel.org>,
 "Marijn Suijten" <marijn.suijten@somainline.org>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "open list"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/msm: Fix inverted WARN_ON() logic
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Rob Clark" <robin.clark@oss.qualcomm.com>,
 <dri-devel@lists.freedesktop.org>
X-Mailer: aerc 0.20.0
References: <20250613144144.27945-1-robin.clark@oss.qualcomm.com>
In-Reply-To: <20250613144144.27945-1-robin.clark@oss.qualcomm.com>

On Fri Jun 13, 2025 at 3:41 PM BST, Rob Clark wrote:
> We want to WARN_ON() if info is NULL.
>
> Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Fixes: 0838fc3e6718 ("drm/msm/adreno: Check for recognized GPU before bin=
d")
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_device.c | 2 +-

Apart from tag problem it is usually a good idea to add relevant people in
c/c. Especially when you fix the reported bug.

Best regards,
Alexey
