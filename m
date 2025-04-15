Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A71D21D5BD;
	Tue, 15 Apr 2025 17:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744737667; cv=none; b=U8rpokwe8ezs5NXJrYmeg0P8e1NqAZwwJUsfRsCc319QYYz592p60N+eYqpcwnWA5Dl4khgCfkMV/JkR8DvnueCyFLb38t9s9HBWrwCT+lrZEEDJt9YVCg1+/Li7o02GfI4M0SIfxeXsvjr5aJiSlB97Cuk/cq12XMFT+jMRk9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744737667; c=relaxed/simple;
	bh=jtozxlDlFArb33Vwn4r3NVMWeWlV1gMBeUBT/QzmsQA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Zn9/6oskOY08wKccW+XYdvmX7GoIr3dGQfLOrYFNNoQ7jpZb9ky+QWLSAMqbIbkWznfEQNK4cD8idPJOlHfdrfD1rrXmvuunOTPNLue8mTfY7d7TyVnGh5pvrm36933voeP03njPYS0Hw7dtdXF8KEZwXHMAYuJd2AjL5uZeW8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j3gLA6b6; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j3gLA6b6"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43690d4605dso46513745e9.0;
        Tue, 15 Apr 2025 10:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744737664; x=1745342464; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gu5G8CnhO94dSAWaShWe9FJyZsw97QYskm73IppyfbE=;
        b=j3gLA6b6vqQhTkOvXcAxD4NaGrDIpMMsRseNkSeTWx8AYLgWGFJ+7/f8QRLgnV0Dxi
         LMtphC+qs+gwRPxWW13WrJTKA/YshJBWU0iXEAlQ+Y1C9MAZ3XZemxd7Mfj7JI4fac5l
         /i/jp22//sthyNlm9qLQaQhL/Gz6lJUY7klw0fcayNiD7wprwHDLxTuf9V3L+I9cP9n4
         v23Ka9l5pcEVZCZ2GNkYIHR5Chjvt7T+qAe0ZCRfvU444HeISp/1BhIbMLsp3fgnF9AH
         7Cwcjo6e8/sOXK0osFwWt03FDqQ7Xlq9EDmJHfGSONRZ1PBugfkIhnuCkIToMH7+zsov
         VOvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744737664; x=1745342464;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gu5G8CnhO94dSAWaShWe9FJyZsw97QYskm73IppyfbE=;
        b=d2rAa53S0FGZEWwHduoP+5UWK3zpEFO0c+EEt8uNNrPeL8wzVgGcGqyhWbfzgXnpAJ
         P3Xrqsqkt+nU+gCrNd5AvIr4NfuEtlkPCRDdNHdS7XCD5pXCvIWl8ztKrdpB0Tl5lAXp
         GuMMviFWSLd0oC1tK69ZMQ121la4aknmhownp1AoHqkDEV9oEXYKkZ3LtRLNrZy0j2vh
         lHc1s1icu0Zr151up99vVZyCKXGXDksPvF7ZLoRY4495Q6VvVIhY5n4wuNZG6p07AnqK
         lvvIXsQhTck7lw2O98WidHTXo8JSCjv1Cpch0XPlDtUhaJH/JdEzp3819Bx5z4Ti8DD+
         sSrw==
X-Forwarded-Encrypted: i=1; AJvYcCVYIy86TRjAttazeRhaY9BFET6O+Zmb4cpV3LbPrKUpO4gZU9UC7VBv4mkp1WfKbC+PYN0qltPnpPj7@vger.kernel.org, AJvYcCVloEmld0CSzjfjz6o/NkbPoZowuh9MkjvlelW+edUIZxHbWcG8mn/7mi52djSy5YPAFKbsdgNgYMTx6Mxf@vger.kernel.org
X-Gm-Message-State: AOJu0YyonNRfZ9xTzObYrMuxut2BK7TR6Z1dud/JHQ712L6bHfmFdy4W
	FluFPY8bY+0xvuZlzDTqlISvCa2+lqNMzC+FNofXNHEIdgV9REZE
X-Gm-Gg: ASbGncvTTyZhRn5dYtb9TNwzaClxUijNpaIRhysc++qzVKoQPDBCGDAc7JVq3ixAkxq
	4MkjccRTWaO+7BLwlJEumy1UR51jKuYzxFAb4pUBAF/sY20GStF8qQZ/Sh8FyLH2udtOEpCRF4s
	i6nBk9b16lTnrBsdkdQW+NvoIPWNk8Z0vJ58tXQp7KusA3c/njJLrPfV5fx2RvlN6C2mmrNiaPb
	X2TSimMurAisF8/6LJjh+7QCujxMcVG3YR8v150IJFZdxbu0sXHamJK18ftxl/e8etawP7+kwif
	DiE7dm9709umQ7k40yt6gWK/iI9wyW/WjIHslus6AuftJhipQvqqRe2V8FPpPnZUfRn0Hr3Ia+J
	F8Uk=
X-Google-Smtp-Source: AGHT+IFhl0ZD6Te4jksLApB9uC8vj5bATARcjgVkhtCEkuWPZe/GZXC+cxHuIeY6ryYtb9ba8vUOMw==
X-Received: by 2002:a05:6000:1ac5:b0:391:2f15:c1f4 with SMTP id ffacd0b85a97d-39ee276eba9mr240487f8f.55.1744737663780;
        Tue, 15 Apr 2025 10:21:03 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.157])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae963f4asm14987714f8f.16.2025.04.15.10.21.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 10:21:03 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Frank Li <Frank.li@nxp.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 2/6] dt-bindings: dsp: fsl,dsp: document 'access-controllers' property
Date: Tue, 15 Apr 2025 13:19:15 -0400
Message-Id: <20250415171919.5623-3-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250415171919.5623-1-laurentiumihalcea111@gmail.com>
References: <20250415171919.5623-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Some DSP instances may have their access to certain peripherals
conditioned by a bus access controller such as the one from the
AIPSTZ bridge.

Add the optional 'access-controllers' property, which may be used
in such cases.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/dsp/fsl,dsp.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml b/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
index b8693e4b4b0d..e610b7636a08 100644
--- a/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
+++ b/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
@@ -91,6 +91,9 @@ properties:
       - const: runstall
       - const: softreset
 
+  access-controllers:
+    maxItems: 1
+
 required:
   - compatible
   - reg
-- 
2.34.1

