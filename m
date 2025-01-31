Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB9743D66
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 15:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738335803; cv=none; b=o4jbCOZzjIeyaS/Gna9uflx+Kma6onJrD8rYEO2+iW5iYGS7xnEG4r+wMfiKWC1H/qwRtei6CtDGTrff+CrWXLW8JvHfNHBd7d9V8lUJq27XMRVTAZ1yB4SesPIav/xiqmoahlp3wWE62tjmiW/uT91j0FVCNjpCY80PiJBmLCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738335803; c=relaxed/simple;
	bh=SQxyJFMg3gBp7lSoZ7WOgJA3LdW1+oWZENbqGdTJsCI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ht1Vc1MUwhmR2tnOjgvdsxZFfXEKliSJvJ2maUD+CXnSLo31RlevowZol59d8FMhEx+k6S+0LDWJ3MuPudQ9ppAWPB5xBILLv6G56vOoM2xwJTfyGTIlRvqUB7Cl96ae3QCbH+nfzapMoWLowOVMc94xqtUFTsKhCZqSLDO+cM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tDPeVVNm; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tDPeVVNm"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-436246b1f9bso2968595e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 07:03:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738335800; x=1738940600; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KfhNXlBVSPOAhrzoDNzwgTxVG2wC1I3quOzSh7mjUbE=;
        b=tDPeVVNmgSW5lSe7p46HqNV8r/PJCVKKPPzEg000C1XAAKYAP8f6xoX78PTDTaz4lK
         SH+CI5ZyGx2gqXH5bgViLiza+63WjWtD5xXCG3dw/iHekPnGSaKRFOkVh2EamTsommr5
         mb9c/9W3n+Jhb3T1vjvF3HhSVNKQwy8pupSbfDP6ctjmu+L8fN5FWimI214KXjl+rPu5
         pBIxoHOLiHtlFLfzLjF7VcPEkMbwVO3UxzBfIESLczySjXnJ6MC9//UOhFpES1LuPwxf
         zVqNFoGYwbERlYrPNZKbOHOL8bXfaDVb5Y305Cus5biH0M9imwXsxe0nH7F0s1ymrjTD
         zBVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738335800; x=1738940600;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KfhNXlBVSPOAhrzoDNzwgTxVG2wC1I3quOzSh7mjUbE=;
        b=AaycCnfSvBG78GIJ7/+azgJgDXp7ak4efiSKGpuXDBdjcCtU4jgeWJVSibSng6ciEL
         1kMxbGCMX8njD0RCgMMjaogMff0qE202eUUpDE2Ed85VsI4lyDcatIs8Y3P2slMy/9NH
         xSjrUn17/+Wm0e9qAYK9k5+2G9ZdnFrGP2AwioDr7UNzVBwG12YuqCBvTOBM2XF5EQjo
         FLg5sxAkiKhIVmXpOCXXbvNW5ZxI07IR9lM6STIa3gK9qgwdD3cJzkxUj5rLq5blPbE4
         obP/l3qtHcNYoyweREDvCVlwLTxQnAgzCG60K7f3phGXlQhhCipCER8R6Xfpc+B0G7G4
         uFag==
X-Forwarded-Encrypted: i=1; AJvYcCWiG9lj7x3l27qgkcRpBJHW/CME8BpodHMrgQ7S/up+Ds0jdHaUWXPthH99N9wqwxox9vNJjOqkBqlPRJg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyljLj57Y8Go0RpsBsA1ibxFKwEQLCW4yVHXEIGlUF2afVKBzVw
	UShMQYH/THLPjzhZ/ZZGa+UCzn4bx9KI4OY1q0e/Ic7hLO4c1dw/8/5nwRujT+w=
X-Gm-Gg: ASbGncs46lw9DzRiAbwbsEOisGucdGJoR9WsdUsVn9QjdNoYFKBY7itmPBU4/Z+UzW9
	5UxATmUinKIIXRru7/HskEbimNGwHEHDcJBaYa7AOo5xWP2PXzpWRWOOzNm87TvTupiH62HuTNx
	QX0clix4VAv7t4HzD+dpWqzU26TScxN+Z0vZfEno6K+FtBFDwq3y/UZyZ6BXzkv6PwInbQsqGGJ
	jlCyf78p3Rrz8aYvnb3Yr8/KRSlVslBl1J7PCBHe6ObnHtKaeD9igfjJXIhBnFJbNtrIBd+2ao9
	AssLXtnptDRms4wQOsF4JwoUy5ztFIQ=
X-Google-Smtp-Source: AGHT+IHPnGgkYwPUj2l4BkoTVGjO/72Nk1bxY7vDjxwIQ8mRGo6Er8pjlk+fnyU5cwhkesYBHWv1gg==
X-Received: by 2002:a05:600c:1d1c:b0:436:1b94:2deb with SMTP id 5b1f17b1804b1-438dc40d358mr40451075e9.5.1738335799159;
        Fri, 31 Jan 2025 07:03:19 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438e245efbcsm56679925e9.33.2025.01.31.07.03.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 07:03:18 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 0/3] drm/msm/dsi/phy: Improvements around concurrent
 PHY_CMN_CLK_CFG[01]
Date: Fri, 31 Jan 2025 16:02:49 +0100
Message-Id: <20250131-drm-msm-phy-pll-cfg-reg-v1-0-3b99efeb2e8d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABnmnGcC/x3MQQqAIBBA0avErBvIwqKuEi0sRxvIkhGiiO6et
 HyL/x9IJEwJhuIBoZMTH3uGKgtYVrN7QrbZUFe1rlSj0ErAkALG9ca4bbg4j0IeO9Kz08b01rW
 Q6yjk+PrP4/S+H0K0N1dpAAAA
X-Change-ID: 20250131-drm-msm-phy-pll-cfg-reg-7e5bf5aa9df6
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=803;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=SQxyJFMg3gBp7lSoZ7WOgJA3LdW1+oWZENbqGdTJsCI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnnOYoQAt8mGdV1azM597UlAhPWf3yQDkl9Y9b7
 +P29C0qprOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ5zmKAAKCRDBN2bmhouD
 1wN5D/wPgFY8s6XvDVg8qIUESZsJ85X1ukKvm5xiUKKhSk6LNd25wzI2LLR241KBwwU1xqTSWvV
 5BEwKUIccSvpZNlD2aCBoH+A+hEAmYM84+NqCz9+EuXMlffywHmRDE6QUmm7i02dQMW9aRAaLy2
 70n2GZruBTHyQ5R9ttVmHH/dpeBjh0jPCPznP7KvLTovqAY5BkhvYt6NcxZZjqSzt5JbZci8WGz
 QSe/Gs4rNwHdo6NCjCWehEJSnQBz7Ba/NVAFics6s7zzg6C0hjUrC4FqxGsQg/XT6UW9uWQ+dRp
 C2qdO7ksoZ64/04Ohb6Tr1xvqVDY6ciiygYsz2nYyirXVT1rclvA4nwFrTGGXl5deq5F2ImELF0
 R9fvTukuk/XlNN7KeHJEoIXtJDgaXXUNodvajVujqGO5qcYst4v2MIHe/dyJxZWtnJ8PpcX7oIi
 dDKZaDGxREgamftrJ6IprEv4wzw3lSU2qNBoyR/oQualH/HozYiPfa6sSOxD4EriuqdbjsMZdSX
 XjCGeAs+nUJpOdqhfkbk3AVXs+Ot+9xQKk0CkbxZei0kZQIpvOBeiP8wtzm+3xvRMSvxl7uJQ7V
 AZeYI/0o7WK1NFTJxrFNIeT/EpZYTWb6XxcZQQVMlHLijOkkJDYQ86b23l0tcBOmCpQY1PqcBUx
 KH0mkZJwbxoR9MA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Calling these improvements, not fixes, because I don't think we ever hit
actual concurrency issue.  Although if we ever hit it, it would be very
tricky to debug and find the cause.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (3):
      drm/msm/dsi/phy: Protect PHY_CMN_CLK_CFG0 updated from driver side
      drm/msm/dsi/phy: Protect PHY_CMN_CLK_CFG1 against clock driver
      drm/msm/dsi/phy: Do not overwite PHY_CMN_CLK_CFG1 when choosing bitclk source

 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 50 ++++++++++++++++++++-----------
 1 file changed, 33 insertions(+), 17 deletions(-)
---
base-commit: 375ef7b3d85d8b0fa72092642582ca5b95a64e67
change-id: 20250131-drm-msm-phy-pll-cfg-reg-7e5bf5aa9df6

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

