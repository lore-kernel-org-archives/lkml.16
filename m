Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF81128F509
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 12:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749557836; cv=none; b=cJC0/jY5w77i9xRoQa7KmtYadksuaBNk+2JGUWiTQmCVMaHLBAAeO+DAdeuG2sbY85e3DI17o6MRWQK9kHeLoty6KKoUwE9zabCS3X8CC9Gz5z0V4oBguGdH+JOPKcBVt+pgGPDF7bkfnSHiXN8hgLHlmkapK+lI2ntqa7dgL3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749557836; c=relaxed/simple;
	bh=lwTyGeXdkHTWPJfBg7BjQV3UUjr/nweOwsfORFMzM90=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=cJf/a1uFWSlsdfxDCgoJi122XHeSG1gdIkoxt9qQdx/d+p9mFdjBIXS29j9OM1MEU0QakHHxJhMcKSPSCNXq4ptIUzwtYu9g221vuONuDY8MSJSSkE/A0Q5leXYrja16ypP8TGA18S9ocUeT7RL8faRfJk8g+wmEoBt7RwcJFk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bTjT75cM; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bTjT75cM"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-451e2f0d9c2so41873685e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 05:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749557833; x=1750162633; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IuRj0Ug6ZJKS4fqR2KpE5gyA/o+babJBVnYG2DvTa+g=;
        b=bTjT75cMtrNTs3pgOQqiR0ze7Y32RVFrmmPU9dFl+7v3IzYRr3Glb7Jy5Za0ANldVi
         oYUIyG1p4c9f1/dpBtoB0Rvu6qWUpLlxBffBKXLJCxqtDN6KFadEQLhCRJ/8yd+F4uJq
         ztGPTxCBN4nvVH1jHUzp5FR7ld4Ybl+5FCVkNR2wLUwILsydGAgREhicYw2vDdlIh8Y8
         1VypVRmqnKCb06z6RnBTcFNfmxYmtz+fOUaBBmO7dMktyn/IOejvr+dSHYTmNuqUKPRX
         WLy5pQDNYI4LPaQZ0VYi8YjrqB1e5mpdnOWfNrs/vLj+UTEccF2oXQDbygKr6NT05Uf1
         qgDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749557833; x=1750162633;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IuRj0Ug6ZJKS4fqR2KpE5gyA/o+babJBVnYG2DvTa+g=;
        b=VEh6JJ0OVYHy1p/lumsv9mCpRoHaZNEimexLXluSv272rmgu8T5Wg6Ny43HDeGUJRI
         ZMjdC+xvpyJYRoBvLIdfzY2PRyHyyA4q310VvA3JitoR707y4xbOqtI7kUsI5tA+xs/W
         CIWbaAsv+JYyoFar8V8Dq5/Clcb1lgvtuYMp5YNrtx+0hwivV8rnQWMcUARtzXEYrdzH
         hBbKzEpDrExYXfI3twNX2GjC9EcUYNDNzkoQzSIo4hGOrFu0Sl96gvzgbYSWrYwUTk2M
         6yYGLxdKkr6U+iBfMW/dfT6442lbQbbPDyT/ks5pIL1qaGp2JAvjOWMOFIx4vDJsRS01
         6kmA==
X-Forwarded-Encrypted: i=1; AJvYcCUqqRIsxYCVGDRCXy/VXeFnJDrg2BhvT86vFABcJb61LBUi3bRBRZB1G1hb3aAXzcG3ciG+470oz4vJz64=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqHI5sLNyOyzt4BuF3IALYSv3g/p9OSg0vhE2uuZQcVLMl3UoD
	PRoCvUIj9+hD6X6X9N8M6AOr/KIczsd/zRBUbS/ESbQ4OD3nxtSBdx11fkqnDr+fc5Q=
X-Gm-Gg: ASbGncsVlTHJ2b4op9i82fWbVuOyQYEm5A2NrePrFN53DKv22CTUflA0MUly2N9HtDK
	Ivq7R23pnKOlggXczrU4dtn+0HYPYNeJJXAmswzA1/lvCLWRomEOMNoPPry8/mWxKYGSyR02dMb
	VXNqNegSApT+nED45AI2AmpfR3qSe4N5YkHvutVOIH8Gkn/fHBDAchckwksZMqw2vvwaKf0LYcV
	+h/Ms60DwZuTJMPv5W/SoyH5j6owbJof265UFNZLxUhKQMAk1xDiCVkMygZLAnLht3O2yRZ2QnZ
	wbrnhd+YjZYOlbK4LyFxG3IyjVE9OJtZgHUl+Ljd+xSAWCAbhTDcspLJ3y/zTr1HgN4ZRrHgTEB
	F86r1QXo=
X-Google-Smtp-Source: AGHT+IGZryHptsIAfWJgutrc/pv6q8jGoH1/bsVGr2feMOgq4/suOW7VZ43KFE9ciIcwtc866C4hEg==
X-Received: by 2002:a05:600c:5251:b0:440:69f5:f179 with SMTP id 5b1f17b1804b1-4531ce9f6d9mr27818275e9.7.1749557833268;
        Tue, 10 Jun 2025 05:17:13 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4526e1595d4sm136313625e9.16.2025.06.10.05.17.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 05:17:12 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250606203729.3311592-1-martin.blumenstingl@googlemail.com>
References: <20250606203729.3311592-1-martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH] drm/meson: fix debug log statement when setting the
 HDMI clocks
Message-Id: <174955783271.1721274.13898926968868576990.b4-ty@linaro.org>
Date: Tue, 10 Jun 2025 14:17:12 +0200
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

On Fri, 06 Jun 2025 22:37:29 +0200, Martin Blumenstingl wrote:
> The "phy" and "vclk" frequency labels were swapped, making it more
> difficult to debug driver errors. Swap the label order to make them
> match with the actual frequencies printed to correct this.
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-fixes)

[1/1] drm/meson: fix debug log statement when setting the HDMI clocks
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/d17e61ab63fb7747b340d6a66bf1408cd5c6562b

-- 
Neil

