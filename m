Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A83FE170A0B
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 11:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746445063; cv=none; b=iSMnzLUrr6r8bIhUgnrj2VhgorUJjPev//aqG7nVIC+rLo9KdHz393aXpESUrS78Fk8wQyPsumdqrKPwrnoBF24m6CcrmnEGBCfIiw4Oo3jw79898rxse3OYNQ7fnclswj929xqCbu1kIt5T3vP/svRqLD/o/z92DlHfRdkhjcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746445063; c=relaxed/simple;
	bh=qtePzRqkZlEs81bNXFOWekKO3l6xt49e6qlCaSj1eq4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gYEJVvueBwHhWBcEO6Y5ZOJ2Aa4a8NVWVN+JmiAQEBROGicarBAZvasd60CeaX78Rf0sPUf8PYcXMLMZzWmlsuSm78EDfMJBIyA/Y9M9RHmr4En51ms1Rk7T17Ew3bFCTp6BXyT/AKQfzRR6zRIeEefVK0YFBocEafuSCVeLKIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=f4jCI14N; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f4jCI14N"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so27610175e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 04:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746445060; x=1747049860; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oKte3VgudbHc3RjluDFuTdUTJFhTrJEHbiUVWp/kvpI=;
        b=f4jCI14N+DEHv/a9Nw+foFMMN6qhHZB4c2anm/k5QMkIPVT2jQ3SUPTBCANBFboVWc
         tPYI4oCfa6oQ5iquT3mCKAQl6bjg+8PgVlalx8Ds3ssQxSdIQTx0KSTrTM2zbq4s4rXf
         DuKBEmJ/YUUIXFgUaUUwc4/l0Jx2CzolSW1bR0OmdijDu3vFKcDdzIE+s0LH12S+2tPR
         3NMz1Y3eoWBkk7V5U7mwZbyX9vNgsb0xlSG8f/G0XHvNM4zRqXloVmaqRefIrx4O5rlr
         kY5ADt27BQzUYoXJBOuEOkuRp712+kL/psQl8IG0Du5N3QrGr3AUpNAdJg6qU82ZfbNP
         3kAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746445060; x=1747049860;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oKte3VgudbHc3RjluDFuTdUTJFhTrJEHbiUVWp/kvpI=;
        b=iR7V3UKcSFTBiOpIU4LiQOcZwF7hDPhcpdzWcXneXyVl7x179uXDmYavM9bYzUF2qM
         Hd77w45krQnus5Fco8w+LsCe22Bvy/Wdycj0V21Jc6wEVVWfzfxXJR9Q3FwDoIsAwgvV
         56gTOXjOIWjdG86HZo8u5QV8WcGoC2ah0aTra7elAelYO6l7wSY0IeRVmtHngPIHFzxv
         lddt7FlbtcIv2AabWipaPWcwoguM3kFYFhPrN4CUmbztf/9Oi8cfieVqGGYZMfHTZKGg
         wnWKOX8OJFBeyeM46I8/0TF+a2zi+Ex+VhU/PFFGhnDrz0E1QdUSWpIb1trwAXyU23pp
         Ic4A==
X-Forwarded-Encrypted: i=1; AJvYcCXVYL+rro1nqYjnGqUP7Pk+NuT6zy8ybtzyu641p9gyuLX7qh36IluXo4uIp/M/gHEfXjcUYiUJ6d3E0G8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAYPWqBmJYPNMJDnQgcDOdX1d8ig0S5+XOB1McZXyMyAoZkLlZ
	clVSi+a94UyQJb8pgLFft+GRJCxwdczPZjvbqnSUtsy+y9/oJu9nusPd4weG0pU=
X-Gm-Gg: ASbGnctXdmmw2MBG4D++h6v16h1NjJP2KESdzZBoRXPwwVdvEvut2g110ZgG1mHTbZE
	ynNcnCPli3ReOOY1kZ8DztLBVlURoGsBFdvbmrZS9bLXNvqxQpgDnx3NosO2PgX2KfpgN7iKb4h
	GCq097lkVIuHlTZ0HtQHNtwRP/0jZw1aWw57ecFCA9eW7vUBTylbRyceT3JLxAekjo4b0fi4yu0
	W0/8Zn/NAOsjiyeN/tQ5sLHCBzc7rljpyYqZc8wOTEB4+Me8e75Rh0Dz29ol+wnKsOxhEa6kApn
	9MhIYT3uPyViExevnxekGbEbmtTmOLWPfcYjYLroY1oCIg==
X-Google-Smtp-Source: AGHT+IEgQ2kmvDjquNKG+AlhhBrFBkbkp03G3W97BEk+O8YtzxGREh5AbJQUtjEqUzBOaf89aKK5Bw==
X-Received: by 2002:a05:600c:3c90:b0:43c:f44c:72b7 with SMTP id 5b1f17b1804b1-441c48bdfdamr60684065e9.14.1746445060102;
        Mon, 05 May 2025 04:37:40 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-441b2b44474sm178310645e9.29.2025.05.05.04.37.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 04:37:39 -0700 (PDT)
Date: Mon, 5 May 2025 14:37:36 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [RFC 2/7] firmware: arm_scmi: add is_gpio() function
Message-ID: <de456bd70a3e092a6379f548ce35e38253ff97b1.1746443762.git.dan.carpenter@linaro.org>
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

Parse the GPIO response in scmi_pinctrl_attributes(), set the gpio
flag, and create an is_gpio() function pointer so that it can be queried.

In SCMI only functions and pins have a GPIO flag so that's why groups are
not handled here.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/firmware/arm_scmi/pinctrl.c | 38 ++++++++++++++++++++++++++---
 include/linux/scmi_protocol.h       |  2 ++
 2 files changed, 36 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/arm_scmi/pinctrl.c b/drivers/firmware/arm_scmi/pinctrl.c
index d18c2d248f04..f842bf7fe628 100644
--- a/drivers/firmware/arm_scmi/pinctrl.c
+++ b/drivers/firmware/arm_scmi/pinctrl.c
@@ -28,6 +28,7 @@
 
 #define EXT_NAME_FLAG(x)	le32_get_bits((x), BIT(31))
 #define NUM_ELEMS(x)		le32_get_bits((x), GENMASK(15, 0))
+#define GPIO_FUNC(x)		le32_get_bits((x), BIT(17))
 
 #define REMAINING(x)		le32_get_bits((x), GENMASK(31, 16))
 #define RETURNED(x)		le32_get_bits((x), GENMASK(11, 0))
@@ -107,6 +108,7 @@ struct scmi_group_info {
 struct scmi_function_info {
 	char name[SCMI_MAX_STR_SIZE];
 	bool present;
+	bool gpio;
 	u32 *groups;
 	u32 nr_groups;
 };
@@ -114,6 +116,7 @@ struct scmi_function_info {
 struct scmi_pin_info {
 	char name[SCMI_MAX_STR_SIZE];
 	bool present;
+	bool gpio;
 };
 
 struct scmi_pinctrl_info {
@@ -189,7 +192,7 @@ static int scmi_pinctrl_validate_id(const struct scmi_protocol_handle *ph,
 
 static int scmi_pinctrl_attributes(const struct scmi_protocol_handle *ph,
 				   enum scmi_pinctrl_selector_type type,
-				   u32 selector, char *name,
+				   u32 selector, char *name, bool *gpio,
 				   u32 *n_elems)
 {
 	int ret;
@@ -217,6 +220,8 @@ static int scmi_pinctrl_attributes(const struct scmi_protocol_handle *ph,
 
 	ret = ph->xops->do_xfer(ph, t);
 	if (!ret) {
+		if (gpio)
+			*gpio = GPIO_FUNC(rx->attributes);
 		if (n_elems)
 			*n_elems = NUM_ELEMS(rx->attributes);
 
@@ -610,7 +615,7 @@ static int scmi_pinctrl_get_group_info(const struct scmi_protocol_handle *ph,
 		return 0;
 
 	ret = scmi_pinctrl_attributes(ph, GROUP_TYPE, selector, group->name,
-				      &group->nr_pins);
+				      NULL, &group->nr_pins);
 	if (ret)
 		return ret;
 
@@ -679,6 +684,7 @@ static int scmi_pinctrl_get_function_info(const struct scmi_protocol_handle *ph,
 {
 	struct scmi_pinctrl_info *pi = ph->get_priv(ph);
 	struct scmi_function_info *func;
+	bool gpio;
 	int ret;
 
 	if (selector >= pi->nr_functions)
@@ -689,7 +695,7 @@ static int scmi_pinctrl_get_function_info(const struct scmi_protocol_handle *ph,
 		return 0;
 
 	ret = scmi_pinctrl_attributes(ph, FUNCTION_TYPE, selector, func->name,
-				      &func->nr_groups);
+				      &gpio, &func->nr_groups);
 	if (ret)
 		return ret;
 
@@ -698,6 +704,7 @@ static int scmi_pinctrl_get_function_info(const struct scmi_protocol_handle *ph,
 		return -ENODATA;
 	}
 
+	func->gpio = gpio;
 	func->groups = kmalloc_array(func->nr_groups, sizeof(*func->groups),
 				     GFP_KERNEL);
 	if (!func->groups)
@@ -763,6 +770,7 @@ static int scmi_pinctrl_get_pin_info(const struct scmi_protocol_handle *ph,
 {
 	struct scmi_pinctrl_info *pi = ph->get_priv(ph);
 	struct scmi_pin_info *pin;
+	bool gpio;
 	int ret;
 
 	if (selector >= pi->nr_pins)
@@ -772,10 +780,12 @@ static int scmi_pinctrl_get_pin_info(const struct scmi_protocol_handle *ph,
 	if (pin->present)
 		return 0;
 
-	ret = scmi_pinctrl_attributes(ph, PIN_TYPE, selector, pin->name, NULL);
+	ret = scmi_pinctrl_attributes(ph, PIN_TYPE, selector, pin->name, &gpio,
+				      NULL);
 	if (ret)
 		return ret;
 
+	pin->gpio = gpio;
 	pin->present = true;
 	return 0;
 }
@@ -815,9 +825,29 @@ static int scmi_pinctrl_name_get(const struct scmi_protocol_handle *ph,
 	}
 }
 
+static int scmi_pinctrl_is_gpio(const struct scmi_protocol_handle *ph,
+				u32 selector,
+				enum scmi_pinctrl_selector_type type)
+{
+	struct scmi_pinctrl_info *pi = ph->get_priv(ph);
+	int ret;
+
+	ret = scmi_pinctrl_get_pin_info(ph, selector);
+	if (ret)
+		return ret;
+
+	if (type == PIN_TYPE)
+		return pi->pins[selector].gpio;
+	if (type == FUNCTION_TYPE)
+		return pi->functions[selector].gpio;
+
+	return -EINVAL;
+}
+
 static const struct scmi_pinctrl_proto_ops pinctrl_proto_ops = {
 	.count_get = scmi_pinctrl_count_get,
 	.name_get = scmi_pinctrl_name_get,
+	.is_gpio = scmi_pinctrl_is_gpio,
 	.group_pins_get = scmi_pinctrl_group_pins_get,
 	.function_groups_get = scmi_pinctrl_function_groups_get,
 	.mux_set = scmi_pinctrl_mux_set,
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index 688466a0e816..b4ad32067fc4 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -792,6 +792,8 @@ struct scmi_pinctrl_proto_ops {
 	int (*name_get)(const struct scmi_protocol_handle *ph, u32 selector,
 			enum scmi_pinctrl_selector_type type,
 			const char **name);
+	int (*is_gpio)(const struct scmi_protocol_handle *ph, u32 selector,
+		       enum scmi_pinctrl_selector_type type);
 	int (*group_pins_get)(const struct scmi_protocol_handle *ph,
 			      u32 selector, const unsigned int **pins,
 			      unsigned int *nr_pins);
-- 
2.47.2

