Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD811C3C11
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 09:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739179973; cv=none; b=nShV3ps6jwb10e0LmN7GBZDu+f30/5KVZQjwAwwM0SPYIkhoK/9ly6O7a90wlqPDRVHr7N1PKz7o8QA1iVRw+Wqcl8WCHq9W14GO8Ul6pPKWL8PwyVEEJv0AKFWW69Gwzp9QsRFhPwBlu7oCQ4vMx+Y03iepRiEaRfPiZL50ako=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739179973; c=relaxed/simple;
	bh=lfPxQaMFtbZZ21l+5BkGf/b9VmjDtPXz4pGJe8td0xs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dQfbNLo55vsOyDeXyS05JUsG8oMCzCdpcIbgJH8Re/DW+cNPqIclSPOBnXw5RppkMiM0NaWsn2xxhdLnn8F2SZ7mgO74uOl3b1C8+y1ZnG2WSkaSwGtaV9gcOwpeN5iBZ1iKkJoZn+qa4A2MNRRLswHZGHa7xaaMzAv4NM//Ois=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vznp9r4k; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vznp9r4k"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4393dc02b78so5911455e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 01:32:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739179970; x=1739784770; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I6IMyTwFG9nX5XomX1cPcbTQEA5dGNGjA4zy+aU6zlM=;
        b=vznp9r4kRG/5HpMbAThTa42v6X8kAbqrxSfdTW4/u6jTkxdGRyFZ5lsrYbp+2tadWE
         CDnm5uLebDXVJNqgrzj0KA3AnFZCp1hYZSywuQLCKlQGweuHYJRFOt17bC6MSIMi2Qz7
         5mdfMYugA3+0Ecq42MPRP65lfMw8pShP6GquW8Lzx8k7TOPbrbLdxzKMIY8R4JdfnjBO
         F330n43LfU/ooxUUNWPz7APiZiGDLlyWZpinBnJgbr+QhXGtyuiSbyO/6yul1KIprThE
         A3oCDTwbV737gESNN+s2RRrM55ByclAevmqWwoMrqtvbgJQcAUBTYxIC8llXJMzd03Dg
         no5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739179970; x=1739784770;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I6IMyTwFG9nX5XomX1cPcbTQEA5dGNGjA4zy+aU6zlM=;
        b=eyVbBW/asjdxSzehK669k3GKjWlk+hphYJalFg4yFQUeVz8zx5P7M5+C6hUDdttN49
         75skJsAW0m/2ko6EM5UgZlUWNWJJ9SMfmQBY+BPX/wGH9En15PBzqYK17U4ZTN87PYJq
         eBRG3dbjz2htYsbm0H2KDCj4Hj5iJtKSDURzQovnWlZhyzvXzKrawcSCJFkjSdvDHhR5
         a5m1xdPAXwVk9pwKC5gqsvdBrlpznsovrXHDi0jeOzpVp+5XLo2u1ZcQ8M2lIxmDOkCW
         rVziH+Y9v+DZDB/w+6UryZ2TJiS1g8R1qi4W7bF2agoEKCMXwh/OqPJB5rg/podCl98R
         SRMA==
X-Forwarded-Encrypted: i=1; AJvYcCWA9monR0VnnQpVgPEraTk3T6Xv5KCc6vzKpDdl6WFNNBMOIVX/VSyg9t7pcSr32EMrUHxeMM30sNB2C+k=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZrBoQPs4CDxr+JH7eeUSYg684XeMvXrk6YBNiFyKh6q+c1Bip
	DTaTKQ/d4CiDlS9X602gg18suw+VUiFQqpTPVI/hNDxpB8opaR10ZGMXMA2wwsw=
X-Gm-Gg: ASbGnctyU/tWkgAmAPdgXg6T0YBSXOZvcKbXFXOzAWT9xKGKXyJXgLKnXpAieywhDkT
	zFotQ8fhsdStWIZBNCyTZYQmosuAgdV8sUIIhDbB2YOttVB1abPhBw8KDm9PgS7AfKY400iPO6C
	UuKT2oziBdyIbq3y1/NIbUUujjDz3F3LiSMjDpjJE4yzvTWHPRKCPGu3kdQOyav8+ghyOR99oGn
	lZW3gru1tLB5wG+foreajJs3JwxVqKiQKWU2SOyXGdlHir3xjMOnT6U1lXZsJUYpMPwkhtbILdf
	dXtAG3nn4BjLdsTSoppAaa9/z8wHb/2g4CPk
X-Google-Smtp-Source: AGHT+IEwRlW2DrLkiktuMQW07Z2SL+sgeHovK/MRPd++QhDmgF5mqDzEvYPl7b2V7XAwAGPCMCGvAA==
X-Received: by 2002:a05:600c:1c28:b0:439:4825:727e with SMTP id 5b1f17b1804b1-4394825731amr10547935e9.23.1739179969602;
        Mon, 10 Feb 2025 01:32:49 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391da964e2sm141340895e9.4.2025.02.10.01.32.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 01:32:49 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 10 Feb 2025 10:32:40 +0100
Subject: [PATCH v3 2/4] dt-bindings: display: qcom,sm8650-mdss: explicitly
 document mdp0-mem and cpu-cfg interconnect paths
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250210-topic-sm8x50-mdss-interconnect-bindings-fix-v3-2-54c96a9d2b7f@linaro.org>
References: <20250210-topic-sm8x50-mdss-interconnect-bindings-fix-v3-0-54c96a9d2b7f@linaro.org>
In-Reply-To: <20250210-topic-sm8x50-mdss-interconnect-bindings-fix-v3-0-54c96a9d2b7f@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2075;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=lfPxQaMFtbZZ21l+5BkGf/b9VmjDtPXz4pGJe8td0xs=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnqce81eAz97fUjAcEQoJORzuzKOeABTMSToiwQoHR
 qUCUVImJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ6nHvAAKCRB33NvayMhJ0fplD/
 0cYY7doqunfG1masd3Y/dnrcjJOQZun5jdN203atsgPQP4RpjN7SJwpQRjldFB3ECitFP6Ts3jXjJB
 Mzo/orhdxvng7eUp4tgvlgCFj0oRSFiJEq+bK3baw546MjZjqNE4Zdb8tJr9ZSVBbfRLyv5Cb2n4kR
 Ir5o69mjEbbqIoeEidhvOSycaPtbofamK4vlVAyksAYUHn8LFyl8VjFGVeB7MG//MiREqtb7s5Lvof
 9lmLQPrq7f5wV/iiWgyvNKoIQL66ASxQwHDKVEKiQ2ZINVkrs11Xq4NlRa8U2mPQDnSpWjPnV+sdzK
 I9giyxUJT9WRRS+coOa/ArWtE4kAd9khekWm4PLKfLeCp21zhKsv8zieZ8icHVMw7rSREy3TJj32zM
 0fBeAcICpneYHFJ2XY1aIyneMgjMzpkoApLjjuplu49EJ+l4IXgonehRtIUvuqWnk73vy9vzaFTIpS
 j9+G5Dg+ZC0CZyHp8JicLzUSZTXsGhDmN7a3yK3b7fYsIP9VblL9ScHfvZ+pX0B/jR+QLu9pGxdd4V
 qx0cAFnlkqmX5bxRgwQfcRkh4tSjBwkKUJB0G/Kte9ME0EjH1QQUqOM6NMt5C94Y3ZfyTj74St+jm9
 6vcTY7/gQWyaCVC+mVK2kP9KW7q4uJvdEMDB4cEnQoWVwKlww2yh4auzz7+A==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The mdp1-mem is not supported on the SM8550 SoCs, and having maxItems=2
makes the bindings not clear if mdp0-mem/mdp1-mem or mdp0-mem/cpu-cfg
is required, so explicitly document the mdp0-mem/cpu-cfg interconnect
paths and complete the example with the missing interconnect paths.

Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml   | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml
index 24cece1e888bd35f169dc3764966685de4b6da1d..a1c53e1910330af473a1e6c7827026e0770131ee 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml
@@ -29,10 +29,14 @@ properties:
     maxItems: 1
 
   interconnects:
-    maxItems: 2
+    items:
+      - description: Interconnect path from mdp0 port to the data bus
+      - description: Interconnect path from CPU to the reg bus
 
   interconnect-names:
-    maxItems: 2
+    items:
+      - const: mdp0-mem
+      - const: cpu-cfg
 
 patternProperties:
   "^display-controller@[0-9a-f]+$":
@@ -75,12 +79,17 @@ examples:
     #include <dt-bindings/clock/qcom,rpmh.h>
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     #include <dt-bindings/power/qcom,rpmhpd.h>
+    #include <dt-bindings/interconnect/qcom,sm8650-rpmh.h>
 
     display-subsystem@ae00000 {
         compatible = "qcom,sm8650-mdss";
         reg = <0x0ae00000 0x1000>;
         reg-names = "mdss";
 
+        interconnects = <&mmss_noc MASTER_MDP 0 &mc_virt SLAVE_EBI1 0>,
+                        <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_DISPLAY_CFG 0>;
+        interconnect-names = "mdp0-mem", "cpu-cfg";
+
         resets = <&dispcc_core_bcr>;
 
         power-domains = <&dispcc_gdsc>;

-- 
2.34.1

