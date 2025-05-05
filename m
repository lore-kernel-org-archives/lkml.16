Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 158621A316A
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 11:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746445174; cv=none; b=McABqqylm5vIK2yspexADvHrs/bSi5TphjiKa2zdu8YXWYpzgRdHdsCqDw1wWBYeI4nA944vDntnYDt0O99WXfzzaVHzqPn7SLjjGEsxEfoNnolGQsilYMu3I4dsem02BCQeYyYedUoQkUUnRMJoudIqE/LTRw+k8uTXs0Gyeis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746445174; c=relaxed/simple;
	bh=ivuMF4AiyTS/4JYqXd/Q51GmUAE+wVce2hJ7HRmspx0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kaSZ7o9KOpJ9mfLPPN1gFY1uicmpRHUhW/JatdVp5C967hKMMlBZS1GyAE4ST/kx8vRlXW0AamxIZJSmio+ZAAH/NDKpjoTxpamtWn/PbQiAE+bg0C9O/FWocYBhV3hHg3URgfzblfEUrvCEZbeVgFdZr9HOfxk8TNZ0JasEySA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Yo9G/U4g; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Yo9G/U4g"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43d0359b1fcso26616085e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 04:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746445171; x=1747049971; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XnllKV8s3Tx8+pvOlOa62d3loJC0CAU43X1zb3557EY=;
        b=Yo9G/U4gm5ENY1N56ruYbEY9yTflS7Mb3qHRiK7rIphbVVKBzqyhQWFyJe6sbfLsiv
         S+9GXlD3x5qI2ENniiOHEpxnC7ge6fDOazIkA4SxLzveGKIQ9Lu22rupbaL+Q/s7uYqH
         94t+MNJBPErNEkCuRZbHNqA8OG3xHlEBF4FM1ZystO6tJ8nwCt7ShqVnCGLU+OSSI6Ch
         MshNUT8awgHOqewzJxVOA/547zFl7IluW38JSi4+eMnY8D2ULEoAMxHyvkZFwo4C8/9j
         dE9YHB1ZvxETW7rlvV3Qa/mY6P1ewJrAzA7C5bJuMNHvjM5uaJl74OPr/XzXZ9P+XMl4
         k0aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746445171; x=1747049971;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XnllKV8s3Tx8+pvOlOa62d3loJC0CAU43X1zb3557EY=;
        b=KQx9X3+K4cpIT+udZI3CxaclYlwR8NZnEC/7ZGYuoIaWTJlnDBDeZMW5vDxVfV/hbo
         PAZ348EVmfCK6bvOVVChLiOxYJ1pS7YSgplxsVGnBrC/a4E+xilgrF31sxTiULoloFmg
         uK+H9g2/dOdhZTkxa8XTlSRwlZry/l+RC6JIggNuX6/wQM+HBozdQm2HO9fURz7lwJRR
         9ZmAYg+CM6cP6bQSSZF8CuKXDJn02e/VC2TH1JzHf1qdjpjanDa/FPjJgyj3k2TTNBwW
         a0xBFOcspKtL9DH+o+8Gf9Z3f0gpN+M2XIB/z+AL9zAf8Q3bqwpQt8gSBM24VYWOiBWV
         M8ig==
X-Forwarded-Encrypted: i=1; AJvYcCVGcN4Awz6U/Isan/rw6/dhMFmfYPqjxrrwlffYzZ7CxfAS5bjwdF9ap81xXPiDavzn3XU55m8YGTag+Rc=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywyc6Mm3CenxEoNuvzl/iAyK9F4sQDHiN8QOL/SNA1vVDqgAaIJ
	cVnMj61+cyowfpUr208HLp83NkB67s4oLjAyZkpEysEc4u3gI8idzioesTPYbbo=
X-Gm-Gg: ASbGncviHWaAXrxXS2vwDnhmFSE+I2gcgRm05vqd6RcgdH0rDYY0fIn9//q4NXkiaw1
	vYDNn3QvIdUut0OqV2AAiuYtCSSzakhD479Mj80DKaicsg6stgFvN0r3Z2TZAdEXfIUIveak/z4
	58MnMHES9HdzMVG5G/M4JkuwgcFlbi0jPuYYEuAruCizbZJ4lG8tLzBEC0vyZWPB5diczxK34Io
	XRVAOcp4FHNYgOJTOQmupZjnZ77t5CVgKFTqyQvObCdvvLraY3S5L4s8zSygAiY9i+4voAkKgXB
	kOW7fRWIzSYN0sNuO4eYh9CIVrDtf+lQU47hL0j7j7lCVA==
X-Google-Smtp-Source: AGHT+IEa20MlrBHGITVX3bXAuaInVkSaScwYRHy4y22UhCPjKxK+cq5tGX/c8wkWOhLGOqkhp1PM5g==
X-Received: by 2002:a05:600c:4e47:b0:43b:bb72:1dce with SMTP id 5b1f17b1804b1-441b7481655mr136942135e9.5.1746445171320;
        Mon, 05 May 2025 04:39:31 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-441b2b20aa6sm178602255e9.27.2025.05.05.04.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 04:39:30 -0700 (PDT)
Date: Mon, 5 May 2025 14:39:17 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Linus Walleij <linus.walleij@linaro.org>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: [RFC 5/7] pinctrl: Delete PIN_CONFIG_OUTPUT_IMPEDANCE_OHMS support
Message-ID: <81fb0a1b0cf15d73e7635081594d8650bf1a258d.1746443762.git.dan.carpenter@linaro.org>
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

The argument for PIN_CONFIG_OUTPUT_IMPEDANCE_OHMS is supposed to
be expressed in terms of ohms.  But the pinctrl-scmi driver was
implementing it the same as PIN_CONFIG_OUTPUT and writing either a
zero or one to the pin.

The SCMI protocol doesn't have an support configuration type so just
delete this code instead of fixing it.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/pinctrl/pinctrl-scmi.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index 362a6d2c3c68..f369f0354e43 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -262,9 +262,6 @@ static int pinctrl_scmi_map_pinconf_type(enum pin_config_param param,
 	case PIN_CONFIG_OUTPUT_ENABLE:
 		*type = SCMI_PIN_OUTPUT_MODE;
 		break;
-	case PIN_CONFIG_OUTPUT_IMPEDANCE_OHMS:
-		*type = SCMI_PIN_OUTPUT_VALUE;
-		break;
 	case PIN_CONFIG_POWER_SOURCE:
 		*type = SCMI_PIN_POWER_SOURCE;
 		break;
-- 
2.47.2

