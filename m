Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA9A928DF20
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 15:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751298083; cv=none; b=jgmKM2puWA5gh9MXQN0sZr16lS+wnX59ebkUwD6cTT4BTFkD8WwcyBD9wWhie1cJcXYin9poCXZy1nI29pQ6WzutieWmqix4Gbz72DH9Ap4Sk+XRi8WBtUJmMtLrJ4otxH2Hfs9MHXVXRyPxTx+3vE1zVrFcwZPn6F8MFhD+TLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751298083; c=relaxed/simple;
	bh=TxdOtgVn7aBHw3u7r5Eza56bp9saXogFpjFjd1vydaA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=WbHuqul1WkF9VIrTir87SYjoLeBn4xDsodnJTmrTQDlowoilPjBulr2RZgS6T0grw5HZ3tzicoxi7UirjWZCjte853SbLrslZPAfSfibxLdq4ewQGy4UDltbdX7FmueGCXwDlg4OMe9BaVNJAg7CNl8LLmJKp82irSFqoj7+WbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=l/bvYIwT; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l/bvYIwT"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4530921461aso30401395e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 08:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751298080; x=1751902880; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wIBoKnvqHm7jPzDveA9hy26/rZ1VMnuhsibGyxt03cs=;
        b=l/bvYIwTLe+P/YxQ/fVthVLj/wfTXaueom7iYq9pGA7+Bvd4VgzG3PwqZ+lxILFWH7
         hEGMmAd6MnVHwua0SxlkMHoKunanemfIY9O2nxdZD4SKsPBoDLP8YMsEG2jOiOzlE9fa
         cKhdz14FkEtQen+0ydDmPnAYuzh/U3efxThxySe1s03BGkRizYEbjO3adrhWTZq/ruq5
         vKUATi+Y4/8s0Hmk3OjrJr7FSvexq4nzkv421HRr1Gh6lA0kWpqgakO9qtJaXLbuzyph
         BhFQ/jocYNXYRil7QSzNL7JcTqWIW+NhSK9PgAu7JeYdB8GPV3ztkB7N07npA+xLorDc
         TBDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751298080; x=1751902880;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wIBoKnvqHm7jPzDveA9hy26/rZ1VMnuhsibGyxt03cs=;
        b=qp/NAfC5i1NEeNf2Kk2Vh/XDyc65ZvjpTNrEn2XYk/QalbnkctqHoVpiJWRlY6PkvP
         yG3SQmHmuF5m7RHBRQp8x36HW4z+RNXncb/44JmKoJDeNEGHyeaQqmmKkFODSHzMtlVg
         anbABzxwoWbCkaZ4Kb+staYCqT/5dXcAfp1d/Alysq54pu9CRCig0biLm5zB+YpUw+w9
         kQ0rsAsG8+L5z5weqeAOwzDfZ9oQuQRQZe5JYxcL5qDv/SDvYAsEisaIZ09PKYozYqvD
         m0ijHquT6z3kX0WKK80B5J1qnbKJJLfP749X4nPgCqogMbbRGsxhkVUSA9FeLGkKEunI
         cA+g==
X-Forwarded-Encrypted: i=1; AJvYcCX9R+5GhAWmCfSYh1KbrZNz3O0E9S2khp74Lt/YoZ3dE9xsR7j3Fc+3HIeA9l2TWnqkfFpBXIuwu5nXssQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZO/QDt7j77aR9WIB42LHSb1P+mZynYLdX0YRBIyUEw2kdCnmZ
	qiJbF2W4fqIMWtbqrO7RhCBLFxML/pwSF/iSLR1F2tbEQ/7kZWaxI7Idti/TRkScbWI=
X-Gm-Gg: ASbGncs5r35icmLvyPunQMWCkBKjeBaREbqR3zV8zCMydi8Mjhvwoj44SgMyfZKW+14
	NT4RGwiYQVkkWUWgjwajY+BOTk+y3NP5PiIrmYZk84KM1EZZO0lJyjxOVo5WTWP0oWcu36R890k
	ly4kVuz0LpZwfZqHyMy3/8r9fBuhewJycbBAw5ceppa93fR/XgfyfjbbokjW/tu9tAlujn5nKUm
	74emcS4h8Txqvm4j+ipS3+8Vbn3ZXsSwlMO/jL8s8yGlCuRBCV7V14qyR4Ku+hgnFVSWIMBGsvc
	XDehhsgxAWeFyb/h3G9XsJj76lf4M5xJ5q0r7QxECw1y5SFFm368a11YgJGmoEwpvIktg3ftRlG
	AeciKTLg=
X-Google-Smtp-Source: AGHT+IE4551ep9ypNSyk+kUT7ORHBKsH3ZNJO70PmyyYi6i5YwLUZhV22aROUA+T9WDlUEHG+Ihrqw==
X-Received: by 2002:a05:600c:5392:b0:445:1984:2479 with SMTP id 5b1f17b1804b1-45390bad330mr126646345e9.5.1751298079968;
        Mon, 30 Jun 2025 08:41:19 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453823ad01csm170270975e9.22.2025.06.30.08.41.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 08:41:19 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Luca Weiss <luca@lucaweiss.eu>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
In-Reply-To: <20250611-fp3-display-v4-0-ef67701e7687@lucaweiss.eu>
References: <20250611-fp3-display-v4-0-ef67701e7687@lucaweiss.eu>
Subject: Re: (subset) [PATCH v4 0/4] Add display support for Fairphone 3
 smartphone
Message-Id: <175129807911.2286551.14063311790282968036.b4-ty@linaro.org>
Date: Mon, 30 Jun 2025 17:41:19 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

Hi,

On Wed, 11 Jun 2025 18:33:14 +0200, Luca Weiss wrote:
> Add a driver for the HX83112B-based panel, and enable it on Fairphone 3
> to enable display output, and enable GPU as well.
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/4] dt-bindings: vendor-prefixes: document Shenzhen DJN Optronics Technology
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/978a84297371ac33a15c56a7d31fd1b125427dac
[2/4] dt-bindings: display: panel: Add Himax HX83112B
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/54bd1390e98450a2c1cad99da3e2594e92c41a4c
[3/4] drm/panel: Add driver for DJN HX83112B LCD panel
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/df401fa1b80775109e2a52360fcb0b2b2300525a

-- 
Neil

