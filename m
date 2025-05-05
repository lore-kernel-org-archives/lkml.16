Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A7B1CB337
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 11:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746445049; cv=none; b=UXDWEHnquqS8gUUFqL5GEfsgaLWE0LXTBXBJEjxauJLhesoL8Xv2BuyG/wyJ4P+XYmOn7HFOqVJkDzhcIbzxRKelHn3y6zwkq3vbVnRmkceQL2OmRBGJjnsKKQRWsnI5NkEjvRzHZzf4WzREMX/B7Em1nCMDvW5i2vq3xnBwfvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746445049; c=relaxed/simple;
	bh=NGvVaxHT6GAmFiO4/MidCvEywAVxDk7Jl939F55Z0dI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=olZ8kslp66F56Lry4Otd1OvyObM6q8zKDoV2uaIVRc8rd8XkcV6dUJivZWDuQvqWVbOEES9wQsytIPDAPK43cHHiOonhaqppCIjxo1GUl6GvF0W8+BjG58ECHDXVPbUmnFNxfWxstQiGe0Qzl3BQwg/cCd9E3q3GMwTFQTlszNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AAax0nTi; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AAax0nTi"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-39ee57c0b8cso3898913f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 04:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746445046; x=1747049846; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=X8e0Rkt8jdkgvftQKNoZRYfHGuTcfUv00gpyykQyZ5M=;
        b=AAax0nTiW9IuezvwhRzm6R1DuiwUbaGGeYNG+j7YCAENkuHuS/EuTScf1PRyavmTDt
         h6pWuoY3euCyhb+KAgVz1NC6tyF/TwJfECiUneCDbL9ltX8e02ge18Jx0DVFaA3cqdh5
         2re3pebPGIUA/8MlziUyNBY5befuE3Qb5pAZQCEPWOfltwo5FNLIbPv+AF46MqnlCdCJ
         5RLv8dXvTt/gv6czsyGlC9Pj3a7uHGqL7XulwM+ne9JxtaAaQh9bwYBPj6viOPecPjzq
         OjWfn9jwnYdcY3GhqaBwDrgg6dtxaug0YrweG1RVsUP8OTGFUHJ1gIOn28NLmjGUQNbz
         MHgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746445046; x=1747049846;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X8e0Rkt8jdkgvftQKNoZRYfHGuTcfUv00gpyykQyZ5M=;
        b=gcWU0Wzkl5SPDLViciGDqv35b0g4gnaPMb/gO1CH23K1uOPoJya9Fcl++sVH495twk
         TaFEGuKuFyzbA4ZFqaqrDt4gE5W2o+R49Bp7hZCIQIkiDzn6tbaCUvgV3zs2sR08c1wO
         2Gnyu3xcXxNr2bylvWTXCTBkViFTQadzz5cYbcUMyYTx6tY1XWqMIUCs6O17rn9K4Ebi
         sgM88fAUlWrKBAlLDfdf0ySBycslX7UEzVd6FzNjDSZAnlQsfV50oLeKVuPT+JxiufJw
         O6Cx1x6VwHCWWvuZizzlRliJfaoeC8IpFHgfPDMYOztlDjv+HCURJIJ7T4aZiRaoUGXT
         s7Lg==
X-Forwarded-Encrypted: i=1; AJvYcCXxY5z8cafPoBHPGm3ffOjisbJa7zDClx6vl+5VoY8T9Ao1aPDkL08M66n+6jR0WkhBKXeWxtpKLt60UpI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxm1vE4RcM57ZgtL0nVP1N0k8rLecrWlvx1+AF0fZjuPDhdO1cj
	/mq+zzZjWOLMBMQdhrzVtX/nxPSVb8c8BjMNYlQDME6/ZTMn6E53q6EGdRPP0k8=
X-Gm-Gg: ASbGncuVenQDxLYtKCq32J0CEU6lBD7DrYM45Ag0/fIOrXRohnUciIhdLjzEC/vpkHB
	N6giGuRP34aenGZPh7LEERtbbi6Dl8KaW0gd9XHiLb4VmZoqCB/805usIBroL4V4zVrEq2drkfo
	FKkG0rV7aX2yezcfa1NMeJab8mjkHB72uwPrQKCvDXZQyrk9ERbg6sT1nEqpKtb3hCOmFualIDn
	a1WZwqqFHu3PIJvmtL+/c1sXUJy4RmT4emECobnls/rIFsJ5I3pE052D2/UUvAmQkJC35jSWuZi
	9vd0VQ/+upplXveiv6gZG9LDVHIXZ5QL8LnTy12tES4Jlg==
X-Google-Smtp-Source: AGHT+IG2R6Ok3o7iGac7nBFNlC46WQLcSy3Kp1MNgBFG8zSUc4nmJCHq5ybXRtOuOQcBVHgNmjqcfw==
X-Received: by 2002:adf:fb84:0:b0:3a0:7a90:2702 with SMTP id ffacd0b85a97d-3a09fd827d6mr4633313f8f.35.1746445045686;
        Mon, 05 May 2025 04:37:25 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a099ae0d3csm9975184f8f.3.2025.05.05.04.37.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 04:37:25 -0700 (PDT)
Date: Mon, 5 May 2025 14:37:22 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [RFC 1/7] firmware: arm_scmi: move boiler plate code into the get
 info functions
Message-ID: <8bee4505bdc1d74e62533ed9975dc4500b2cfe53.1746443762.git.dan.carpenter@linaro.org>
References: <cover.1746443762.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1746443762.git.dan.carpenter@linaro.org>

This code to check whether the selector is valid and if the item has
already been recorded in the array can be moved to the
scmi_pinctrl_get_function_info() type functions.  That way it's in
one place instead of duplicated in each of the callers.

I removed the check for if "pi->nr_groups == 0" because if that were the
case then "selector >= pi->nr_groups" would already be true.  It already
was not checked for pins so this makes things a bit more uniform.

I also removed the check for if (!pin) since pin is an offset into the
middle of an array and can't be NULL.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/firmware/arm_scmi/pinctrl.c | 108 +++++++++++++---------------
 1 file changed, 48 insertions(+), 60 deletions(-)

diff --git a/drivers/firmware/arm_scmi/pinctrl.c b/drivers/firmware/arm_scmi/pinctrl.c
index 3855c98caf06..d18c2d248f04 100644
--- a/drivers/firmware/arm_scmi/pinctrl.c
+++ b/drivers/firmware/arm_scmi/pinctrl.c
@@ -596,11 +596,19 @@ static int scmi_pinctrl_pin_free(const struct scmi_protocol_handle *ph, u32 pin)
 }
 
 static int scmi_pinctrl_get_group_info(const struct scmi_protocol_handle *ph,
-				       u32 selector,
-				       struct scmi_group_info *group)
+				       u32 selector)
 {
+	struct scmi_pinctrl_info *pi = ph->get_priv(ph);
+	struct scmi_group_info *group;
 	int ret;
 
+	if (selector >= pi->nr_groups)
+		return -EINVAL;
+
+	group = &pi->groups[selector];
+	if (group->present)
+		return 0;
+
 	ret = scmi_pinctrl_attributes(ph, GROUP_TYPE, selector, group->name,
 				      &group->nr_pins);
 	if (ret)
@@ -632,21 +640,14 @@ static int scmi_pinctrl_get_group_name(const struct scmi_protocol_handle *ph,
 				       u32 selector, const char **name)
 {
 	struct scmi_pinctrl_info *pi = ph->get_priv(ph);
+	int ret;
 
 	if (!name)
 		return -EINVAL;
 
-	if (selector >= pi->nr_groups || pi->nr_groups == 0)
-		return -EINVAL;
-
-	if (!pi->groups[selector].present) {
-		int ret;
-
-		ret = scmi_pinctrl_get_group_info(ph, selector,
-						  &pi->groups[selector]);
-		if (ret)
-			return ret;
-	}
+	ret = scmi_pinctrl_get_group_info(ph, selector);
+	if (ret)
+		return ret;
 
 	*name = pi->groups[selector].name;
 
@@ -658,21 +659,14 @@ static int scmi_pinctrl_group_pins_get(const struct scmi_protocol_handle *ph,
 				       u32 *nr_pins)
 {
 	struct scmi_pinctrl_info *pi = ph->get_priv(ph);
+	int ret;
 
 	if (!pins || !nr_pins)
 		return -EINVAL;
 
-	if (selector >= pi->nr_groups || pi->nr_groups == 0)
-		return -EINVAL;
-
-	if (!pi->groups[selector].present) {
-		int ret;
-
-		ret = scmi_pinctrl_get_group_info(ph, selector,
-						  &pi->groups[selector]);
-		if (ret)
-			return ret;
-	}
+	ret = scmi_pinctrl_get_group_info(ph, selector);
+	if (ret)
+		return ret;
 
 	*pins = pi->groups[selector].group_pins;
 	*nr_pins = pi->groups[selector].nr_pins;
@@ -681,11 +675,19 @@ static int scmi_pinctrl_group_pins_get(const struct scmi_protocol_handle *ph,
 }
 
 static int scmi_pinctrl_get_function_info(const struct scmi_protocol_handle *ph,
-					  u32 selector,
-					  struct scmi_function_info *func)
+					  u32 selector)
 {
+	struct scmi_pinctrl_info *pi = ph->get_priv(ph);
+	struct scmi_function_info *func;
 	int ret;
 
+	if (selector >= pi->nr_functions)
+		return -EINVAL;
+
+	func = &pi->functions[selector];
+	if (func->present)
+		return 0;
+
 	ret = scmi_pinctrl_attributes(ph, FUNCTION_TYPE, selector, func->name,
 				      &func->nr_groups);
 	if (ret)
@@ -716,21 +718,14 @@ static int scmi_pinctrl_get_function_name(const struct scmi_protocol_handle *ph,
 					  u32 selector, const char **name)
 {
 	struct scmi_pinctrl_info *pi = ph->get_priv(ph);
+	int ret;
 
 	if (!name)
 		return -EINVAL;
 
-	if (selector >= pi->nr_functions || pi->nr_functions == 0)
-		return -EINVAL;
-
-	if (!pi->functions[selector].present) {
-		int ret;
-
-		ret = scmi_pinctrl_get_function_info(ph, selector,
-						     &pi->functions[selector]);
-		if (ret)
-			return ret;
-	}
+	ret = scmi_pinctrl_get_function_info(ph, selector);
+	if (ret)
+		return ret;
 
 	*name = pi->functions[selector].name;
 	return 0;
@@ -742,21 +737,14 @@ scmi_pinctrl_function_groups_get(const struct scmi_protocol_handle *ph,
 				 const u32 **groups)
 {
 	struct scmi_pinctrl_info *pi = ph->get_priv(ph);
+	int ret;
 
 	if (!groups || !nr_groups)
 		return -EINVAL;
 
-	if (selector >= pi->nr_functions || pi->nr_functions == 0)
-		return -EINVAL;
-
-	if (!pi->functions[selector].present) {
-		int ret;
-
-		ret = scmi_pinctrl_get_function_info(ph, selector,
-						     &pi->functions[selector]);
-		if (ret)
-			return ret;
-	}
+	ret = scmi_pinctrl_get_function_info(ph, selector);
+	if (ret)
+		return ret;
 
 	*groups = pi->functions[selector].groups;
 	*nr_groups = pi->functions[selector].nr_groups;
@@ -771,13 +759,19 @@ static int scmi_pinctrl_mux_set(const struct scmi_protocol_handle *ph,
 }
 
 static int scmi_pinctrl_get_pin_info(const struct scmi_protocol_handle *ph,
-				     u32 selector, struct scmi_pin_info *pin)
+				     u32 selector)
 {
+	struct scmi_pinctrl_info *pi = ph->get_priv(ph);
+	struct scmi_pin_info *pin;
 	int ret;
 
-	if (!pin)
+	if (selector >= pi->nr_pins)
 		return -EINVAL;
 
+	pin = &pi->pins[selector];
+	if (pin->present)
+		return 0;
+
 	ret = scmi_pinctrl_attributes(ph, PIN_TYPE, selector, pin->name, NULL);
 	if (ret)
 		return ret;
@@ -790,20 +784,14 @@ static int scmi_pinctrl_get_pin_name(const struct scmi_protocol_handle *ph,
 				     u32 selector, const char **name)
 {
 	struct scmi_pinctrl_info *pi = ph->get_priv(ph);
+	int ret;
 
 	if (!name)
 		return -EINVAL;
 
-	if (selector >= pi->nr_pins)
-		return -EINVAL;
-
-	if (!pi->pins[selector].present) {
-		int ret;
-
-		ret = scmi_pinctrl_get_pin_info(ph, selector, &pi->pins[selector]);
-		if (ret)
-			return ret;
-	}
+	ret = scmi_pinctrl_get_pin_info(ph, selector);
+	if (ret)
+		return ret;
 
 	*name = pi->pins[selector].name;
 
-- 
2.47.2

