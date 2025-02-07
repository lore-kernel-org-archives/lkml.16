Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F421F18BC3F;
	Fri,  7 Feb 2025 16:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738945876; cv=none; b=TjC+EOw9NxigvrxawKUYw0UI1YOaz5a8iDb0Dy2y/v0b5zVqLM31+HcZuJ22Ta15AvqL6uSJHA2fdlVIZcF5jCyYfy5o1n/O+4Uj2r/z4Q9DrZC9nOTrGDJ2OxHZmna9Yk87JiIYCndGZ95mRNJBKybD6LUdutRgS4W0SC2QWXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738945876; c=relaxed/simple;
	bh=3rHb+tKlCuLegTX3Cv0TdmZIeOzyZRa316mQ0pQT6Vw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XiFv/GP8ZHRQDstV5iXkH7KCSmrJ3vL9HtfxEAa1ciZ8lZ4r1A964Bd1+EEu+K4sacxldFyx3QYd2HdGByMPye8LLC+wWtHZkxBu3zgVS7BOi5oP/pJwLpOv2bhSeo/t8j3erVnlldZTrCoMIkIYWPmeWUTReN36ePkugV6wV4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UwSjCpkF; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UwSjCpkF"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-38dc73cc5acso762126f8f.0;
        Fri, 07 Feb 2025 08:31:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738945873; x=1739550673; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UYnGgZPDK4gRxkfUxbitpLr2RSPLoi7AT6rj4xgzIwk=;
        b=UwSjCpkFv6OUi1We0gWD7NqaErC5gnypoqQyX7C9f4ur4bUgFEvAb6FbtGWwNoOcTU
         2jeTE4DxpmV92UMpROygq/TyatG83pF+nYAWJ/MHbpzj5NswwSEzEnp6LKMNKPFkoWAr
         XG/ir7KP0gbyRVKwvUvIhoyzPr/UhOwCP1pxfI3iKTQSSsHPD3L53kgk/UfY/PbQ/NOL
         1r9Ssxi/VI9PVee69+tomsxT/6PoGK/3BWyNAj6QcrPbcE2PaGVdJnQNZA93Iji1+tTs
         f+eCClAf432vHNl2q+wQzayvneorFJ/kcn4QSnKkBeIRm9uhfIa7jvLeNnBug1h+SJmc
         BZfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738945873; x=1739550673;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UYnGgZPDK4gRxkfUxbitpLr2RSPLoi7AT6rj4xgzIwk=;
        b=D/cRYnXxt6rsaWvZhcIpwATugJihQHFOWdW+Dx/1wkIhRfUAKHB8L6cQh95FTlg81O
         IcoEcdzoY3z/5qD6i2ysGowYigyXACUnPEGhq+9nK3iZn+YdXHzYlP3ZbwXS3C4h7I5I
         Ca3BxNvFFcy1xJF8ykl/K/2kqp2ddEfaCIyhjC4/0v3XyOpBJHGRHRv7/F64+R2vogSx
         qY9E5KS5jWy2BeKgw+yP42zqIyEyxsHhwdFb9576owGFfpwNZusMia3N2ZgYmvFvpytG
         BEKj5dmIjr98goTMGk0HXoqgKDd5NUKngB3pMUTGIfiRNnL+9UVGCsNLHgfUPxONKF7z
         um3w==
X-Forwarded-Encrypted: i=1; AJvYcCUFV9HoXu6M13TWAqwYkjcFBV3RHhtPn4okfaAt1u0x4uJxw7hwPTi0lXnApBq0u0cwSbJ0QaE6+g7Ti42H@vger.kernel.org, AJvYcCVm4lgi77d4SQhrteyfjHPoeHM8AONDr0W/XOabOkGonIQ1rgNvpwFYAqSGIgdhK3sYwh97IX1Yivyc@vger.kernel.org, AJvYcCWBPrim/sBTNYQuKsrad4FiIDMOL5N4Nc96aJGwKR2wU9KegEVlsK+3Q3m9iuT3RyVSMR0OQ0iPzys93b4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDo+Qxa6kz4D7AsGtkPfYPLr6wqEOE5tC46MFGDhIXZWthmzYn
	WU3YZPaA6xIZQze3ClMIYFwSBTetNnQKfx2jGoExuhgjOVrn6+yZ
X-Gm-Gg: ASbGncucAnAzneFTlA6Kn3Y2q4gmNaANLuvlV1l8632ErwsqmbACfKzWkg4MEDHjjIy
	TYQBuh4ohot4+VS/+1d/mzP1Ur3qKpXrRzjMj8tY2e2FpQZMFKmYFQGyzY5ANFqB/eY4+UqLe3S
	9kQInqmVoTdHxivXurySvf3Rm4vm1gj/TG2CFwUd5qEALyDUyn7tfLaDraWhW+U8hy0AcIW5uPt
	Mu42FZvZaCP7yO4x29TYzPHrNvKZv7yFPE6nk8yLmw77OFklPVH/FoYMbQHbWioqdtGkmOC/6lr
	E/Ci96pqBfhzxGKp3OYs60u9L84V+aktJIUPxjhO62UHg3BXBi1+cQ==
X-Google-Smtp-Source: AGHT+IFkdTADIPTPp+4U7XElbVxbfJRvAfoKWeBJ3z5NDrM3R19vG4v0kiOYf5OhwHGFSQiHjJfM3w==
X-Received: by 2002:a5d:64a3:0:b0:385:faec:d945 with SMTP id ffacd0b85a97d-38dc9924025mr3008547f8f.9.1738945872663;
        Fri, 07 Feb 2025 08:31:12 -0800 (PST)
Received: from playground.localdomain ([82.79.237.175])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dbde0ff2fsm4890258f8f.80.2025.02.07.08.31.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 08:31:12 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: dt-bindings: wlf,wm8960: add 'port' property
Date: Fri,  7 Feb 2025 11:30:29 -0500
Message-Id: <20250207163029.3365-1-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

The wm8960 codec may be used with audio graph card and thus may require an
additional property: 'port'. Add it.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 Documentation/devicetree/bindings/sound/wlf,wm8960.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/wlf,wm8960.yaml b/Documentation/devicetree/bindings/sound/wlf,wm8960.yaml
index 62e62c335d07..3c2b9790ffcf 100644
--- a/Documentation/devicetree/bindings/sound/wlf,wm8960.yaml
+++ b/Documentation/devicetree/bindings/sound/wlf,wm8960.yaml
@@ -75,6 +75,10 @@ properties:
       enable DACLRC pin. If shared-lrclk is present, no need to enable DAC for
       captrue.
 
+  port:
+    $ref: audio-graph-port.yaml#
+    unevaluatedProperties: false
+
 required:
   - compatible
   - reg
-- 
2.34.1

