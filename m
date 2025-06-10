Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B8B2BCF51
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 14:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749564379; cv=none; b=EZzPnCDHpbfAjE0FazUdgtFK26OdBgvo2HnklrvC/MbXKHheY9Rt9OYf3zpmCzATWS0ZGdzAymCG3easNUjA5Kgq2+gr5Y02si9mZIGJ+Osg3BwmPguLcnSGboTLVcoVv3rX9V5Lp0pcjOESmUJiXMmZhl43D/iLWVAtMIIaHeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749564379; c=relaxed/simple;
	bh=zXT5KqsXrSGK/lPM3MXSFlSxuq5G3CuX3u2b43D0aEw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S+htmuHT3jkhCwpw7hFpWCTmOK5cNfmLFWhQ77Z4fanrdElwGuUiv3XBaZ0yusJrnDfo67qA+8dRLEwXRhV5x8ZkFA6mRC0QcZQgQ+I6HaSMtqFiZcYyHN9ty/ifGlQjqjw6ZualbVlXhmKJd/+k2AjKfOgvw6+H0b5mKhk0zWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bs9CdH2q; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bs9CdH2q"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-450d0526132so2555745e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 07:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749564376; x=1750169176; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FzIry+niRGay8PThnz32i8jV1sSA67calFaeSw/btE8=;
        b=bs9CdH2qJRYH/lyQAikmhYv/aBGJ8yl360ZW5njZ8vQoR6xrdkaN9UUd0CmlQSgxiQ
         2NZV1wt6/l+Be28vkkx59Wo2VgD0FUX0RYVbwas2Ti2/A+hUwNlLProeQbQibCjOfIN2
         ntxeDpjCcTS7ayCC2mTU8WIGHfcYLPCxi2Ce8bevwPMNGXjdd3ddVdifL+SzW4LLpbFF
         PofGLStPJlZhULaQWfwE4m9WEFGeTyzud3BRwjTxxDoboXLGK6o/9SWCFtKeNnD+sPGo
         XAc6wPuqUMU7zcXqXiCyktibc/E2h3PhWldInF1MypI2DgMWELE0YTjLG6tvFdLd7jdx
         WqPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749564376; x=1750169176;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FzIry+niRGay8PThnz32i8jV1sSA67calFaeSw/btE8=;
        b=Y73LWL/4G+7++D592YVxBPbT3xAWiBYi/8oyV0CBKcofS+8ECc4zHSgwMb7eqvDJI9
         Ln3CAumawyRxe9vVpFwaTBcbGi4w/dnLLYAv0J7pORfNUFHHKR9fUt/j1jShvB1qcxyh
         AclZCLJgr3vc4ewZgGXV7VHo7tvwfQJMt2BZ9QJVzxul/z8pgYREKItihfibAxpa5xR1
         gVgPkxPK7B9x97kUpnEfoVIOpljUSS1PZyfYMlGPxBHUtSWhFXfuLUzxDHzQjUw+4VP1
         NWyBh9KeudNuEIUOMz9ozU6tohveeGaHPneJCHisLFwBnIqb2UWvVVfTBCelgvMh9k+Y
         zejA==
X-Forwarded-Encrypted: i=1; AJvYcCXwgcKMH4Hs2+V4m04DhIDe9YJX8hnkFD7Xe+Zs/2RETKc7d5XWgIJpbGncmLK/sQW5BbbOTCmNTxafeAg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxB9wipdtJd7Zu1+rQxyPRUqOR1S33r/3IQmAiJQ9gE6MBhuIuc
	BxXedF/1ZsWwz5mlrvdY/JtikoTHu6CXXDzXKaztMJTSIX92syHKwWB2O3npRkj7Ns4=
X-Gm-Gg: ASbGncsor8dRDHmvK8Et+Kov3xPojEGfOtdFUwVRfke3FheZXmmmo12wHmCeCnbG3qb
	pnzlYiU12gMpM+RGxGz9BNzSAzSow7NFg2t46NfKZmzPS9cWCgbiJ2G4aLj/iKCX4cH4jhPrbxb
	pJrXh1nwfOlEm6ZfyHuXDMXOVuYzFMr0QV3mogSIKkGUh5gfTnCOvp6KNzg3NXYrlgRMbyR6lY5
	linyAPFQz0kORJrsZf6E9bzJGDlSVsiCHSBzmgU2hVGHKgtEbgkzwvEwnrA0/vGXHtfY8erMunD
	SDIQeCHW4PUXwYHkJllocKNIC2pJDtEi4RQHRCgjtcDgDNTFYdCKIFn6KAAjLUSIP/pXW5Ecwr1
	EeTSdFw==
X-Google-Smtp-Source: AGHT+IFm9QPIPtKj88kCIYqZXKQx3x9C5G98AeBxEuV4QWyOUJnApYLXqRwTArllLYrUbNaqeStteA==
X-Received: by 2002:a05:600c:c83:b0:439:a30f:2e49 with SMTP id 5b1f17b1804b1-452014b3cdamr58900325e9.5.1749564375620;
        Tue, 10 Jun 2025 07:06:15 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244df06sm12734469f8f.69.2025.06.10.07.06.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 07:06:15 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 10 Jun 2025 16:05:41 +0200
Subject: [PATCH v6 03/17] dt-bindings: display/msm: dp-controller: Add
 SM8750
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-b4-sm8750-display-v6-3-ee633e3ddbff@linaro.org>
References: <20250610-b4-sm8750-display-v6-0-ee633e3ddbff@linaro.org>
In-Reply-To: <20250610-b4-sm8750-display-v6-0-ee633e3ddbff@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-clk@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1260;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=zXT5KqsXrSGK/lPM3MXSFlSxuq5G3CuX3u2b43D0aEw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoSDvBcBnYyTfiL8zs/evhNuS7T+Hr5JIuH05SG
 aYTeABkv3aJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaEg7wQAKCRDBN2bmhouD
 1z8YD/9Hu6oG7XIW0TSKmpY6kmKcXGI1YkCyklXDyNvXdkTDAgAHII8m4k/zWtNiKHPbPrPJu+x
 usF+MqYI8h1uJ86crkJCdDy1zM18kr23DKFG5+3yqZfWvSKjl47IEGTXI5/GgXc+kG2a6FdaY37
 aMRmAESSmgTUn2ZEKRbB45pSSKIi2qaeegOP/xNPIIp4ewm/YmRNGvj+x69xfRkFE0BDpFjfurm
 jdsvopb8XV55PqRtyGqWXf35CdZEB3a91avjTgY9UERXzpqMAGdmokzeKoCqIrDgtb5RobQ5T4H
 Nq7rc4co+/qkkYuoSSqedmGU3ed042KVcp8OHlnR7CEP97Sx3FS3SLljZ5OLlcbGIG/+j6m+Lpn
 EBimXHouJrsOev6ogYy8x62VhpUSVCoqan2YSM4pVcJC60AJJEpKZALYUIpIJOrYeC22QYdd1/Z
 V09reHRMtJ62QbYRIM0zDySRN00Ft+b2ouxVTP7M9FSyHsZXorl2lSeM8KR8q86IggLVu4yfwrV
 O5V5IK6/JMwY8yVMzAItlxEAjZ1QH/LEc4F/I2zAc56kin0i5Fzr+pYZRUPa+SrS2T7wE8hMj5A
 VnMP9+5n8V36v54XZg80EriuA8Yjvfa2sPLQofwxtlLLxKVbv7SQfj7gJsLOIpM9Y4R7L3gB38G
 9NhjA0CTiCHMoWw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Add DisplayPort controller for Qualcomm SM8750 SoC which so far looks
fully compatible with earlier SM8650 variant - both are of version
v1.5.1 of the IP block.  Datasheet also mentions that both support 4x
MST for DPTX0 and 2x MST for DPTX1.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Changes in v3:
1. Extend commit msg
---
 Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 246bbb509bea18bed32e3a442d0926a24498c960..9923b065323bbab99de5079b674a0317f3074373 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -38,6 +38,10 @@ properties:
               - qcom,sm8450-dp
               - qcom,sm8550-dp
           - const: qcom,sm8350-dp
+      - items:
+          - enum:
+              - qcom,sm8750-dp
+          - const: qcom,sm8650-dp
 
   reg:
     minItems: 4

-- 
2.45.2

