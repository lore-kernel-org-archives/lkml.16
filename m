Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 830B922D4C3
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 07:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745826772; cv=none; b=lYpXOYQgM2sOzu0NKgVvv/irr29GDA/Wqb4ZZAQsQg73SR+KW4i4zpWe+rfEfa6KxTxE2dbG0L5zQmaVTMJRcmsf71uNY3y0iNQOZu+FbGZSqRWshcLDv9Wkdc/lYtXVKt4gZzo7F2eUlE56yhhXwXTMqV22b8pjUEGZnKn6cyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745826772; c=relaxed/simple;
	bh=a2q8227S7IVaFeHAdaSJ94I6tLSiVXiu9D8/iCz3E2Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LW0YFQGa3UMIyzJILVwhyt4FdwhYjz9ZGTDgMxuP8ErJ3C1lT90ps6NfIGBEw3BsgsEWSXiOaU8aHldiuvFIGLsHg3eHPnjsZKL0OT3Kb7Z+LAQ2VPhb+Y5XDeJxv8KDlRxU0Haw4EyMPrQ8xYgBXX1+NacGQYQPoW+ypSxV+qE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=J0/7aSPx; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="J0/7aSPx"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5edc468a7daso714481a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 00:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745826769; x=1746431569; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=++CyndwUisWgWH/S4dHSTfV3pOj95NuarysuXxNeUys=;
        b=J0/7aSPx9Fzar86FtLC5mfXMq41kzabU7D+MbU0K6zdsOJ8knuYQYwBDfWbhG7ayOV
         POUhBJ6YLuF9rXm2wlsPbTn0Stn+jje0LMnMqVzOJLTcAZjbNkgDyQ113/4Crr18sGBJ
         hqy9fy7OPLMRU2UQuT+5yXnclw4zK88YvRpKsTWQZUuLnmkKnuFbJ92d/Uoj6ZbBkYXe
         VROnnxFYWDztkmoEYsmqkeuva8VJIXa8OTPeWdJa2TDp+Z/Hku4i8CFtcKiCSgsfSjTH
         Fl2C5ltxDiKn7p9wjq8EJIGwtvwmcf6+Tt8fT3w7vfq39Sug73cAWfXiaSVft+kcOeBU
         GV1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745826769; x=1746431569;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=++CyndwUisWgWH/S4dHSTfV3pOj95NuarysuXxNeUys=;
        b=QLjyFc7y5YT+T09AYEB9E63i+TghUQAAKU9jsRk+cruA4u549S1peeNBWkhRLcSVWI
         Z5nM8RL/ymSWc4//uYLgOtJFk+W9VTVfKbW9mUp7UtaP80ldq2geBRY6bOeuF/6eNsPD
         dHCJuhH6VVJy8NqSFE4/cPAZExGAlciaMhltfLoAT3rbyg/i5ABFaTbSaU1YUtSku0Ff
         cQSV9KRBLzq0Wcs5cIeJ+uVvWEqs0qKO4gCNvrtjhv2b+w7exoGEf30K2TgsMGZHzlf0
         VIiKtnbOrONsXRWxQ9kWn2LEfBVzCFD+zdu0Q8ohrIlKw0v9lr9H7YD6i1dEXnGdYCVV
         R10w==
X-Forwarded-Encrypted: i=1; AJvYcCUhDGYYUGEJEI0Xnh8jduJGNHADhsfoFBcdJtW+SKcNyRsGdDbl3RlYkzz3U3T7loIB0EC9BIe6lQhTNDo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqxaAw0tXnmxtZdoCp8K7JThthb2lVsH10wl4fI1f897e9I+i9
	wmZujWSTV1+k8UdxGwF1yZUxswRZ5bxBJu7ZvGoF1fkFpYcC7udVTS8bA0RYAvs=
X-Gm-Gg: ASbGncvM2sNo9OQJTUDruBAkBq5dEu2gYjfxt2csvRidgOd50qKyAwc4MhjXChAItN/
	xWulYNl5O6XpqWfL1cy/HnDd7QI9fzv481eiJvUSv7z72NgpSRjkNwjYPkIWB8KG+XJEfdwAQTx
	DT+RcGwgD3nKwkFFAOdt6b420/AHbMrHDEq8LxKnZ+YXpb1x1umPFipRhLHZY9xKu7cz6rkyFW3
	VmOMwhUgBY9GIN6+DifiSJbMCPRy4lK7mBbHf0Rcu6UGH5zZFeiLD5sW12T1dw99kdi/jTQ1Xr+
	VW4Pd9ZHgH9xtYfx6XyHCvjZeoCKykRCrIJu69mb66t79OuVwQ==
X-Google-Smtp-Source: AGHT+IEGTZVZiJqfJ5HX9QPHWnLpx/E8XElCGd6Od8tueakLMxHqw2Flou9h+m1FaZ7wEavBKyTctw==
X-Received: by 2002:a17:907:1b10:b0:ac0:b71e:44e0 with SMTP id a640c23a62f3a-ace7110745fmr364254166b.9.1745826768533;
        Mon, 28 Apr 2025 00:52:48 -0700 (PDT)
Received: from kuoka.. ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ecf73a2sm574036866b.114.2025.04.28.00.52.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 00:52:47 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	stable@vger.kernel.org
Subject: [PATCH] dt-bindings: remoteproc: qcom,sm8150-pas: Add missing SC8180X compatible
Date: Mon, 28 Apr 2025 09:52:44 +0200
Message-ID: <20250428075243.44256-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1205; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=a2q8227S7IVaFeHAdaSJ94I6tLSiVXiu9D8/iCz3E2Q=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoDzPLrwtfBdFg7DRuVbMa3eXN3qGCKlYj2Hb2v
 5JF0WZv9B+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaA8zywAKCRDBN2bmhouD
 1xNdEACCfDg4cenrjMEuYZSPid+RtrHlHDfmvB3y6qJw3UkferBfwYrKfsuY/YEXdZLiQpBiH6z
 n+NZ9RmBze3OXQvX/XbAFMzDTWiEfIIafzpBsn9iChkXxCFz+6fPi5fY7Znf7vg4Iz72gHU4VIb
 d7McqqNy52zQSpQyH9Za4zRM9BN9BSpRRQ8uCk1oPj0bHZp3EsIa2zUohIrgdoUiwxVUgS/l+I5
 VXAcNLbe4YQVb5gxn0D9Bm6I6bJ5DTGuRuyaxod2Ek+NS/wZT+marX012rGtF9gVsckzRYC7NqI
 cUepxVvh2Q6umX3hTmbWGlIXRQbqGlk+kqUdTJ5F5xl1UyxfThzCoLX3NthXg3/M+xmN2oAlIdF
 BjC6Zsg/Ik6hRVNNs163S5ikj5muJgxbdmsD6M8wJ0t3IBycjOAVcMl8dqrZWj5spc9+NGiHH9z
 i8Xo6jCSs8c/t78EO1pI8YZLh9KaWvlcc9l95YHNZhxjK8pvx8edVSsyOP7KfbDqw88BnhVu5H3
 yOD5FkDzSeTiHc9eK5keu5d4+ryTML0wpx4OJzwkIKxwX66ZyHI8EYfpS0WgeYmIHOY3pz2IP2M
 b45vbG8Q4hFCdHKmXOXyREDDOXIaIpZDVo5a95TNDTp76bI3Yro7Uvs3CasHWuDJNW1o+Cr8MAq 78ytQgYEaiOOFiQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Commit 4b4ab93ddc5f ("dt-bindings: remoteproc: Consolidate SC8180X and
SM8150 PAS files") moved SC8180X bindings from separate file into this
one, but it forgot to add actual compatibles in top-level properties
section making the entire binding un-selectable (no-op) for SC8180X PAS.

Fixes: 4b4ab93ddc5f ("dt-bindings: remoteproc: Consolidate SC8180X and SM8150 PAS files")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml        | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml
index 56ff6386534d..5dcc2a32c080 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml
@@ -16,6 +16,9 @@ description:
 properties:
   compatible:
     enum:
+      - qcom,sc8180x-adsp-pas
+      - qcom,sc8180x-cdsp-pas
+      - qcom,sc8180x-slpi-pas
       - qcom,sm8150-adsp-pas
       - qcom,sm8150-cdsp-pas
       - qcom,sm8150-mpss-pas
-- 
2.45.2

