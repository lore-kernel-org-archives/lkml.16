Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADDD42586D5
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 11:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745582047; cv=none; b=g+Dv1CiFfuiNTTPjrj4GsR3K34wDz+4Xu8ZBQy1sPyRoSURj3lG5aCfabTKyuXmfyYKzCxrGt/Ld0pToDCHjALsutY/OSxjMJ6tPh7X2P89zlx52LcDG5Ss3Xpunb8S4MCw767mFq6rSkNAAQu5WjdI72+uFweojQ06/qP3gFJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745582047; c=relaxed/simple;
	bh=Wp9iWaEevQ0aCH/QYCEHu08kXHucbrbsnspzcdlMP28=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oEm60T6u5EcsIpirS8CtnUBO3lwjZyQTj6wWs/mpoerlKvmd6l5pwKuOK+NFGeDVTHf9cplwtSjh1SeA4U4MLiDWfM41R441Zsx2Jpjmv3XOlnw8/UxfTACMYMWxhzlYAnwst0WC2PtTSExGK7iTysj4WxarnK+T6uFXeW6VqBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=R+eeTKLK; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="R+eeTKLK"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5f4d6d6aaabso3415557a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 04:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1745582043; x=1746186843; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6cpfS3QrdUns68NcbMwvTGZPMa8x+Cgf6fBqEa3ps8Y=;
        b=R+eeTKLKPcu1iJwwRVh74OGOwVyksp/ePYONMTkyEewi9nh9LhL+/8JOq+LvmsNFz3
         JqBD3o6NOTPHTGbRPTJu8unkUUMa6PQW2Xf6SCsRFQhmcroyGLoahqdSCNhDrqo/KQZ9
         zdZjAsBAbx/dLpcy9wKEo+WJNulL/blN3aLhpCgaOmV8iheUFuwkuLccMdpdDlxU2Yor
         /xona+hE9M+BDLRRSGw85PpUUKkH3oxeW8I0LtbETfJij7fv4VuGuJFCYV18MWrnRx22
         wDPp4erBwBcam90iXr+K0+8MhWGvOesyNuKnTSmlJjFaY7dRF7UtmDT6Q0hx06pgSjCT
         aRAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745582043; x=1746186843;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6cpfS3QrdUns68NcbMwvTGZPMa8x+Cgf6fBqEa3ps8Y=;
        b=HteWN9hq9jOTv1tHGhio1sRqSWA1ARIpmEndTIduENL8rFVZBXLInU27nKeha2kFR2
         Hlh1Jta/tnulWa8OG2jjpx6VwrXscCWT6rUVmW/3rNkAY1nT0DLNmDLu/vcqFfJLCfpU
         xj1lU8J45FBcyfLS77bRq7pS9uiAtbFKwI2IK9xq87s/XvHJLTiCmY6xpIJNAj3Mndco
         gsOXpsKkUn/Frizp6Mj17gQPs5F/5TFXKKk9tmTEStr/9icZc149fdb2YKfYjOuht1x5
         8k/paVmVbvuxDiYu0WzO5rwUyjQEhVW4CbpVffZjuC7zzTJZBBU+vp+ekhwJryrL5LJ6
         iecg==
X-Forwarded-Encrypted: i=1; AJvYcCWkQGo+HEbLwMmTHzZIYuD+kRf4tdkliTppr/XtVJ2gu+rMfjWRpZStW+y8lpNCCDyJVbcvouB38hXdJrg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyuMUMj7IyK9sgMcNg6jhn+MEiIEqKrQbpxLRfaXrAoQ20FKRaX
	Dr2xpfe4plLmdrihXqCsm0bN/6nrRutzZ2hBPUT9lXtbeHXOy4T84fbMzMRKNsk=
X-Gm-Gg: ASbGncuV2LuodsSK650Mfql6Bz093B+P6cUBJGa2GE0dbb/asNfxaU9Xjt/oB7ijSo3
	hmlLPR1XSFEbM+LUfkPOqu4picn6SveH7tnrRDksa6X1VSaPJlz4ukZbyghF7n+rVxdNOgySLhP
	g5Z8ukII2hcFPD8l/OgMlTUBX+po/quKEs/1+eSgFucmJbY4I/+RxKqZX+jWpNhq4QQlHU8sHbS
	p7+4tEVa5hm8JIkQBjT3hSJrteXtHGD9jVhckkUi6/J/9hPFvpAZUX3+a6wf60aQClTvrVGtW15
	zqUNqXigtuZRVN9aFJcYx/ofbt0hZIsvnv4MolqjZnh3iY11CMGR3jFwTq9JvwWjBf/W19rKpH7
	ISuawdEszoYNLkzYEd08qRYFda72pBXq0ne3gSqJxBCFgpwBe8WANbPTR1PowSl4wbfg=
X-Google-Smtp-Source: AGHT+IFMeoo/hjF7l+e0BlykAtp+n1CvAkIhTlWy1LgZY1D314XWrkAO+8/iKA1i2R/FUs6u4NVzAg==
X-Received: by 2002:a17:907:60d0:b0:aca:a1e2:8abc with SMTP id a640c23a62f3a-ace7104d6d4mr182372766b.12.1745582042961;
        Fri, 25 Apr 2025 04:54:02 -0700 (PDT)
Received: from [100.64.0.4] (2a02-8388-6584-6400-d322-7350-96d2-429d.cable.dynamic.v6.surfer.at. [2a02:8388:6584:6400:d322:7350:96d2:429d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e41bc36sm126081566b.33.2025.04.25.04.54.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 04:54:02 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 25 Apr 2025 13:53:49 +0200
Subject: [PATCH 10/11] arm64: dts: qcom: sm7325-nothing-spacewar: Use q6asm
 defines for reg
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-q6asmdai-defines-v1-10-28308e2ce7d4@fairphone.com>
References: <20250425-q6asmdai-defines-v1-0-28308e2ce7d4@fairphone.com>
In-Reply-To: <20250425-q6asmdai-defines-v1-0-28308e2ce7d4@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2

Use the MSM_FRONTEND_DAI_MULTIMEDIA* defines to make the code more
readable. No functional change intended.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts b/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts
index 85a928f980775de0617cdabfc31a96d044c5744b..befbb40228b51ad2771a4c0e6799d26045af5917 100644
--- a/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts
+++ b/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts
@@ -1223,7 +1223,7 @@ dai@16 {
 
 &q6asmdai {
 	dai@0 {
-		reg = <0>;
+		reg = <MSM_FRONTEND_DAI_MULTIMEDIA1>;
 	};
 };
 

-- 
2.49.0

