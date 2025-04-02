Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C3E7236424
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 10:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743591598; cv=none; b=B13pVYfmLIfBYzbTCb3W/7qTDCZ3imUnlsySKRhUDgCk2CJ0mzrL5LrkAZ6RfxNT1sH16Q/fdUFtpJA1V4ChByUf4oIwLfwrmce5dv5F0MsQGdOFBeeBw/mBzi3B8qXUyE1+MV4Td9CRhgmhGdqHwK7sX4fW9y4ex9URqzOmTo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743591598; c=relaxed/simple;
	bh=9yLicTejlhArWUH0AESaCnDBxMtBvX2kpvdlV6B/8A8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X3kwrNT9fJRH4EXm16Oql2FmXL/x1E3I3+9dOrr834cydC6SqrPCf/eQ10CETrLTn2XUlv8GgwoAYZFpFr91lZ2a4s1Kc3osO9LPQ0tA3iHux9KjuX4L6myz9ZvGttIvG7iJ5XJNydTsmQQzNXhDBBcIywvdD/kOj4VJEsKpZfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Iizv5asM; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Iizv5asM"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43cfba466b2so65622645e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 03:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743591594; x=1744196394; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GTwEOtU7c1REAcQAM15r5ogMxhu3BYdLhsrAnf1aryQ=;
        b=Iizv5asMiua2B/rjAMbI9R+nt0nkTUhtyFlelshY2Wc1P0HyQqOnqQzk+Mv/hyzObm
         Dc8jqEE89lm1+yJAAh1rfPd7s7zUhHqbMbljqbfqwxWmpIBhMszoHJ8BBd96HqE9aA0u
         Ai94zMpUf4M9K3Do1o1hM6ps3SX/sz9b4h2Gu+2X+SBVPTzyiYD38cd87+mCKp/LQpi/
         yuNqP+1DdQjILH0I3BOArl/Bsnu2OrWbBC0pMBejLPbb88zMn+j8dX+on6K4RgwJ41HT
         W92fHWDaTUae5NCiXX2h/wlVrYFSX05BU7GZaJpUxX+eBZWhW8gWZW5N1S0mHfRXbaqE
         7psw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743591594; x=1744196394;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GTwEOtU7c1REAcQAM15r5ogMxhu3BYdLhsrAnf1aryQ=;
        b=HauEp9HCI+T4idbj8jgU7T6ZT7v0NY9ZEdj7xawjgdjCrYak1mMQF+ssuKkbISYZqu
         YgI2NBXvcAlkPpyWliXRYPze/3HRDwlNRzkvEN7PATTTvYnJSSM0do9MEFAusZuihbDk
         XRFJSVQvFRDCwMHEuCpQT1DDD1Tp0ubht2t6W4cjZVoEkJbFNo1cXHwZEPskAQt8RZv8
         vwTiTvbsdYPQwwRuIpNDaRNEV1cOHBSdhTQbceF5e+Nq1Srl0AvyvVwP6UnGyQSugIY4
         CsFm4gXKem+PGAOZmoNYv6axCbRESnWaoOg9Sm7ynF3SmKyN3wt3VtR90vczPZNxX2KK
         4O3A==
X-Forwarded-Encrypted: i=1; AJvYcCWJRqty7B8lgpctCZ+4NL+Vv5uDA7lhH0s9LGlAEhkZgq+CFyB0JME0dX0A8ktpIaPhrvsC2MaRF4cDcKc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxcb99/elPfqIdP4CeDiMrUB+hu2atxfUokXyf7Idll8NvwFSTj
	SmubC9GRx14Cd4tJdT4F9SGDwS38nEJUywFXn0KzJhK0PSxuQu+vdX9OCeUVXDo=
X-Gm-Gg: ASbGnctki7Bw+/fi0InB1at1QGFUz8DNLpHk18tQiYCU/bK826koApDwAn/pZCiRsJ6
	fL35VBzSVQ6FEKA4QHXrx4fz+YlGsf8T3e3bnxgkgkZdw/wkfy6t7oGG8RCVNL4lKiGZzI0OlzW
	wWtw/V/hPxw/eCc5cjZ3+7Fmi7AQLhyYvjmh13WcHIMAu+a/vCOOit1XS+p4+k6mJINfoBca++S
	/9akMusxiy1OmRpsHPcM2mDdnGEHobyeqHcXyic+x/stTjGLeo4wY+5pBk12mIHz7FaY4hIWCFt
	HYBpzlTgH/NdHgcZZ0EwowM5AtKuM4PbqW2NOdONBhsiE91ZLw==
X-Google-Smtp-Source: AGHT+IGo7cTRo8kiQ/h++DgBA8RW5r2euHnxHw/uTOTKv4yUHsRawjSowGFkmPkzcA245vQdY6nlTQ==
X-Received: by 2002:a05:600c:46d1:b0:43c:f8fe:dd82 with SMTP id 5b1f17b1804b1-43db624aed9mr150397785e9.18.1743591594310;
        Wed, 02 Apr 2025 03:59:54 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43eb60d3627sm16842805e9.24.2025.04.02.03.59.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 03:59:53 -0700 (PDT)
Date: Wed, 2 Apr 2025 13:59:51 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] remoteproc: qcom_wcnss_iris: Add missing put_device() on
 error in probe
Message-ID: <4604f7e0-3217-4095-b28a-3ff8b5afad3a@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The device_del() call matches with the device_add() but we also need
to call put_device() to trigger the qcom_iris_release().

Fixes: 1fcef985c8bd ("remoteproc: qcom: wcnss: Fix race with iris probe")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
This patch is based on static analysis and has not been tested.  Please
review carefully, etc.  Another option would be to call device_unregister()

 drivers/remoteproc/qcom_wcnss_iris.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/remoteproc/qcom_wcnss_iris.c b/drivers/remoteproc/qcom_wcnss_iris.c
index b989718776bd..2b52b403eb3f 100644
--- a/drivers/remoteproc/qcom_wcnss_iris.c
+++ b/drivers/remoteproc/qcom_wcnss_iris.c
@@ -196,6 +196,7 @@ struct qcom_iris *qcom_iris_probe(struct device *parent, bool *use_48mhz_xo)
 
 err_device_del:
 	device_del(&iris->dev);
+	put_device(&iris->dev);
 
 	return ERR_PTR(ret);
 }
@@ -203,4 +204,5 @@ struct qcom_iris *qcom_iris_probe(struct device *parent, bool *use_48mhz_xo)
 void qcom_iris_remove(struct qcom_iris *iris)
 {
 	device_del(&iris->dev);
+	put_device(&iris->dev);
 }
-- 
2.47.2

