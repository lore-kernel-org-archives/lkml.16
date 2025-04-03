Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F30F524F5B4
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 14:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743691537; cv=none; b=f9ZiWNEX3WRSivkIwaecH6zylbVZGehbcjhPbB0somIYoe3eoI+Nzr74f++E5bxQw5fc1TiEoED1KbVOE8zQI/LxBffCsvF3XqWgZ3k4NlgU3RZ/UhG7YnsMPwxSwGKevUz7Vw3VnTPA1IyEJDiRu9nxCqNYHjQsPskj6DpCyQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743691537; c=relaxed/simple;
	bh=nu94xce3hyuD6l8b5q4Pb8Eh8vp9Z2NiKH6joMYQjlo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KcgzFWmI7DE+wC4Qe/zCkAdyWGM6IJZ4/qRX350+rBCsJ15hyVJOR4rd903PWT1Lqu2rhIXF8y4Wnzuvu0t4ryAtUtXPlQHv4HTPlN6Poj2RklVt6K6sbXEHoMV5UkuiUdOfqP8EfV5NBv1Yo+bisiSGZOpERXiWiALLda/A2lE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EmlVsqqZ; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EmlVsqqZ"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-391342fc1f6so850119f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 07:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743691534; x=1744296334; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o4ophriFopD1iIs2XtFpF4lW4o87XIA47+/GjWwD8Ak=;
        b=EmlVsqqZn/KNWAqaqm8fCn+iC0rrFtOxSQKvyHghCyuCyiNna+B2E07JrufNSPJUQl
         i7hpjb4dKOI1sHBq9n2nait7hIntVaMF+J6mYQezhUySfye/ePmlbaVbKXmuz03+Su99
         HqPCUl9I9+Eo3TM75saWxTjiNznHh1JLl78qUHpP8nZ8ZrZJ3e47EoYSvOokkOy52hTm
         tgrwpTPGarhyZ/kLwr6KEosVrRDiOci6fpyO+Zl2rYxcIvPK4xdlStcim12cSZR+S5Gx
         pqJ01XnjkK+6DdgYUiGsks1N0bVVPv3jpmXSOW5vXCi7w9jAC7W5hBSXtyVIH38HYcmy
         9vDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743691534; x=1744296334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o4ophriFopD1iIs2XtFpF4lW4o87XIA47+/GjWwD8Ak=;
        b=cNTL4H0g3M3FSYLJ5XPtdkavcQsBJjEwAfVVpFfPVi2T2+JP4egjJH5OIo8CWMxd84
         ICbg3HO3+kwtAZN/xNiRZ0xX/Vg09epD7Mxw4irQQ4E/39rcVeLQDY28ENzPmcDm2x+4
         2TSVo7gNyyQ+EJQ5OaqhpZMEizFubY7hAy8e087adAsYwKPzYRMvZalGY8ZC9xbVZ+lm
         gKdgZFGlwoSl8l5WpD+2iTBuHlHHyzrUU0sR9qDf72jBENrx9xtGimdMTkM9g2habH7J
         sthAAelJKXVp7xDBl+epXqwvBsyEXqRTQP/z5H0b3Al7rc0Ug1esOVHQ8l92gfrb5lAt
         Vpbw==
X-Gm-Message-State: AOJu0YxG4b0wBtASJB90+n+nWkoqzowgwacYJPKPG1MDLi4sY0fmOLCu
	CzsXEIaYehnAb5MJgf+UTVhyTZpOyZgqsWo8gv9CLHNwHkIGMBdd3hABJxJqSFE=
X-Gm-Gg: ASbGncttkp0ZgMMvAcyGCKhO6pVgAR5dT5rqR1lThyrqOk341VJWAXK8rLo7wRQKOVz
	XSC8hQh+xYariFqU2pSeOaxFYeoHh/YPTT2iqH28TdkyVLgZ+U3ifEeZP02ybbyRodijTFODeFL
	vRBLijnhWMZhchAqj2iedgEGPjjg1ONe6HZyiO1R3S0z1XxbsQuNQQ7ERtpfm5thmJeDCVsBVhP
	WQLp85wom43Hb2erbDZQ22koMQiPaG6ei4Yg6qFdio7S8fBL2x2hcLDGOTZH1z1BD5lUMerbnzO
	QSV9rOwqX4QXoVqKD3wwx8d1ZPul7QCAqHJubcXugMbYL8dZFI9aJOSJ2Eg8dRRwIfpXf+oPJmx
	/Ia+d
X-Google-Smtp-Source: AGHT+IEfiyId7UJESEU4EYsFTbpdQpQ+o7lOEA2rA8h3qGB3a9oH3LXTAZmReV/mANISv4nk9jXiAw==
X-Received: by 2002:a05:6000:23c7:b0:38f:2efb:b829 with SMTP id ffacd0b85a97d-39c1211b758mr10545483f8f.50.1743691534153;
        Thu, 03 Apr 2025 07:45:34 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d661sm2044374f8f.66.2025.04.03.07.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 07:45:33 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	Sricharan Ramabadhran <quic_srichara@quicinc.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	George Moussalem <george.moussalem@outlook.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v3 12/13] dt-bindings: nvmem: Add compatible for IPQ5018
Date: Thu,  3 Apr 2025 15:45:00 +0100
Message-Id: <20250403144501.202742-13-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250403144501.202742-1-srinivas.kandagatla@linaro.org>
References: <20250403144501.202742-1-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=980; i=srinivas.kandagatla@linaro.org; h=from:subject; bh=7KrYFwn+zoxtcS7p7RKNnXyTkthKyH04diDTbjPiXp8=; b=owEBbQGS/pANAwAKAXqh/VnHNFU3AcsmYgBn7p7kuqkrbBFgImiw9ZOyRPVqD40fnJhoJoaXj 5/P1pke5OaJATMEAAEKAB0WIQQi509axvzi9vce3Y16of1ZxzRVNwUCZ+6e5AAKCRB6of1ZxzRV N3wVB/0b5mwGInPpoeyCVzGwxIqja8ci7eXR1xQBugnjreqNPnsLoMb6aqQ+PVzEmBK4L/CykBh fiz6VfBOnMfKoWe1bqS7bVGaF021bmkfTjXdFhBslwopXxfZZ861lc/cdtkRsSe45hYGbgMA93v CXNGmWJRxmpCLgNkgRpHIVhBgRpGTvKvaEEVqoS4Fkz8hHR8pt2kHbSVSerJx+9j3Eq+c6UYAlN b6S6GALNW0ttOTBWzkepy+iZQEWptjFJP4r4nf3gb0DfySt1dmRumZqgE/iI/MfazjIQIpxiyes GvUvgKjNbXQdZuGtFHt9rQgVgNGjKWIkPNyi5R5EKn7bEgCx
X-Developer-Key: i=srinivas.kandagatla@linaro.org; a=openpgp; fpr=ED6472765AB36EC43B3EF97AD77E3FC0562560D6
Content-Transfer-Encoding: 8bit

From: Sricharan Ramabadhran <quic_srichara@quicinc.com>

Document the QFPROM block found on IPQ5018

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
Signed-off-by: George Moussalem <george.moussalem@outlook.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
index a9de635bf31e..69e3669f8178 100644
--- a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
+++ b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
@@ -19,6 +19,7 @@ properties:
       - enum:
           - qcom,apq8064-qfprom
           - qcom,apq8084-qfprom
+          - qcom,ipq5018-qfprom
           - qcom,ipq5332-qfprom
           - qcom,ipq5424-qfprom
           - qcom,ipq6018-qfprom
-- 
2.25.1

