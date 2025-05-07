Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A6151FBEA8
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 09:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746611026; cv=none; b=eYFpueLUQZNMVlgf2CoZBWjPoMSmGrxWdHbr1s+l9N/ky03H8+Jv3CCrbtfKcxamihA80AmQbicZSlxRqRTITdLyI8TcWxObuSv7kbn3NDxdiV33Owd+1keBMEQmaEYDwWGO/+Cw4QbM1zp9je5Zr+2C6QHcsvAVl28ImyaNdpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746611026; c=relaxed/simple;
	bh=rAFzUZAkSv653DMA1Gt82SdKNPVMD+FcAEb6O/SlSkw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZWX6wOvCc2hwPwuK7CQxDtNA/IMV8avoUt4TezYBDCzz5NZzHwDthzUydaGnaE8DzX6mRairR7IycmJn86N35vAxkEYBp4jq3dxnfoNGfgY/TCaBoNaW9kQBOTZpvClFYyO0gLlkSYgDuxieSJe1xnUaAXMGEmQzQelxW6q3C8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c0dLRzJH; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c0dLRzJH"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43edecbfb94so56843015e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 02:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746611023; x=1747215823; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T3uAu3A4YUWMgeScFXrknXczo0EYOFrNx11xrsJM7O0=;
        b=c0dLRzJHr8H+fG33Xpd59yZtU3fyemVSeWnjqiofLQZ9vS+OlurPpwzWNFUXjeAI5H
         k18vKVsXxCb+vpllWSGDhYRqmIW1UerrxyTRO9m1TKqqQVtH/M7c5xVwGjrt3knNYpkf
         uudYbk5t7DQbUrYJBRCzEzLulN+TLHm7D30onUGKmPfIi0t+kDefOcj2DJky6NKsMCoS
         JKJYbBL1rUTrK7qoc1oqclU4YqIbKv0jPhpxJx2SQRb3AJJqzIWehK6utxHJNPlqk+PM
         bG3lyOO2eWH5MhsYXi9zY8OegI1A79Jcz4cnSmHV8tUKb84Qf0sMyB38w/CQXdE/mZ+L
         aXUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746611023; x=1747215823;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T3uAu3A4YUWMgeScFXrknXczo0EYOFrNx11xrsJM7O0=;
        b=GIPs8FSoAECco8K1S7uOCx1BG0mZu6b8MVTVsKM6Wv3WuyRj1GWI+Yp9oQaBW0d7Uf
         zM331jdJR9scuMM0IUQEjOSAMtx6gdhhyTF8EI5aVXxwHGYxTSDM9pRmJWvrnMWyjaxT
         qcVWGtBPanPyCvp1aWuExgFgIcRmPPNkH15IH3YCT6XrdtD9FT7Fq6B604KbS7aFiMcB
         MxLcDUtSy8KSuBjJhCVOB6wm5nmbd3rtodMiHZMYL7ePkgp3IoJXF4EZk/kqOMzze15/
         xY/NdnF7KMBaDmj/b4uVp+JMyTRR2FoI84efmESz93lFG10hX4QeAZiPrh2LkZUsLeKT
         uVGA==
X-Forwarded-Encrypted: i=1; AJvYcCWBuyAa00oRUF58S2J1CxdDAYxsElmbuvkauqkS2/R2eD/49zGCsCcW8hDmkJ9VTWB27EoxbqKP8Yyqmvc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSf5Vl0yp9xFiTl/N8DhSqUtwEM/Zqq8HqwANzfdQhFjwUdre7
	KcY1UT95yfbjxfvDaCLhK9mfnmBfJ2m/eLpyyokag2+7+a2iHpemYcM7x78zn/s=
X-Gm-Gg: ASbGncsCNq/vVLRJzzizF5W8Ab4xFWx+qDROdeuc4GpsQwtOLveLWLPZs3LTIuX2A4c
	ZtH94WFGKMw98jjR3Kdip5G/EBqSiPKhl8pPmNOybBuR9W+BhHlewhRtt/cl9PB5G61spfRjVaD
	AqByeFF6PZBSRSz+FnXYjsRfdHl8ek27uq9B8slq3Wjmb7tgg3KHNiHw4E/rYeD/8hViKoFwllU
	sf6arGt2B+8wLaOq0Iy3F01VlLrM8UIZ/bH7F/hRRKjBAJ7AgG7SnOxi/mfEq1E2eE92oWbMPY0
	+qa6fYMtuEQv6TyMCx9Tz+wo2EoUj+SXL/fRMJGfuM4yaZ4zonUu4t37bP89IY1Sw2hsukyc
X-Google-Smtp-Source: AGHT+IHt+sBETV7AcQ5ySJc+/4bO8iXnJ5nEH5DDXoH0tDCQC0XyTyRIpVj5JbqDYI8TkrtgXdjG7w==
X-Received: by 2002:a05:600c:871b:b0:43c:f629:66f3 with SMTP id 5b1f17b1804b1-441d44c0777mr23958755e9.18.1746611022563;
        Wed, 07 May 2025 02:43:42 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441d434670csm25360095e9.15.2025.05.07.02.43.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 02:43:42 -0700 (PDT)
From: neil.armstrong@linaro.org
Date: Wed, 07 May 2025 11:43:38 +0200
Subject: [PATCH 1/2] dt-bindings: display: visionox-rm69299: document new
 compatible string
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250507-topic-misc-shift6-panel-v1-1-64e8e98ff285@linaro.org>
References: <20250507-topic-misc-shift6-panel-v1-0-64e8e98ff285@linaro.org>
In-Reply-To: <20250507-topic-misc-shift6-panel-v1-0-64e8e98ff285@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Casey Connolly <casey.connolly@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Caleb Connolly <caleb@connolly.tech>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=997;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=RZnJ7ALArB3S7wde3YqyxUd7RDqI3oA1G2B1Dr/Q+do=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBoGytMfrICmXcZpVLyNNF1LWs5ATDo8J//hPClitGB
 mHXtpFCJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaBsrTAAKCRB33NvayMhJ0UrKD/
 9uFikz4Cx5FmB5ZYZEfJ6npPS2W1zrA3S/+SRlRbwm3f18jGaw6S9RcdZpTPnnlfOAicY58Jy/R6Zu
 EZdzKqTnm9RNt3UoPl/u+l79YT8vSuGES6MCyF9Ltqsv4NZG/RFseAXblvGAvpNvHeaXkBFEltCYX7
 kOhHNLRfJFwW1LINdKGP/pp2jSye8bnxszQlY9jN4OL/ocGqcV09LJGxr9MXVkOQ4ZwSUWcfCGE/oq
 GbUgpGlCQI/qvOwBjtfmYzWA2Q65UQ5Z6v3a4PWjBoubHy1h1VJm6inI6sZZRkGTw+qugSk/kwlWc+
 BZMqztvkXK5sZQwTYa4mTWnA063UYWEVfjYNmtt2QEYDjUSbWH2m+ur3gBb2FJzBDSVYdYo6lubZSP
 UUwUTxD8HS9y3n0A4KoMikCn0EOot8w9aeft1i81TPwiym8fTewVanPU67J0ivbMLk0ATyZ0Jv41Vi
 vlZX83cCZPQQkn+a8ZuwMHmcnIP8uu2WW0oRcS+MaK6En/Q1UZORYIrqJ4k2AmSQJMfmzUdZVeM9Tk
 J4Iv5kxd2JHvRtJWXQe0lVdMtJCIEIwm8yMZvyTvF7S5D9iYU/04ELjqf6o2qawQcp7n+jToX5fzcR
 mwkh+kO2KrGUQcv9C222i4iM6uus6X24ewDl6SKrvoB0lg3DCYWMZDE2ANEw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

From: Caleb Connolly <caleb@connolly.tech>

Document a new compatible string for the second panel variant.

Signed-off-by: Caleb Connolly <caleb@connolly.tech>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/display/panel/visionox,rm69299.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/panel/visionox,rm69299.yaml b/Documentation/devicetree/bindings/display/panel/visionox,rm69299.yaml
index 30047a62fc111ff63cbbc275914ef8bb7cb4ffd6..f0a82f0ff79099cdccfd5c5001de0d319e94410f 100644
--- a/Documentation/devicetree/bindings/display/panel/visionox,rm69299.yaml
+++ b/Documentation/devicetree/bindings/display/panel/visionox,rm69299.yaml
@@ -18,7 +18,9 @@ allOf:
 
 properties:
   compatible:
-    const: visionox,rm69299-1080p-display
+    enum:
+      - visionox,rm69299-1080p-display
+      - visionox,rm69299-shift
 
   reg:
     maxItems: 1

-- 
2.34.1

