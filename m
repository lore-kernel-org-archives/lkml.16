Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA8A528DF5F
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 17:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748454296; cv=none; b=HST9RaPPf/99MphhgRQrnNSmmGq5MdUhYVv7rVFzxunVEABfZ8v3+vtd9eW+J60guFuwLInejN5d8a6UjlblJyR10tgKTuUmN5pgew/CcZW8RcJXIa5Q2EhI9V51N1qHvq1zRn0bYrLMnSyJpSK3DjhiMeus4iDEJFSvgiSLzSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748454296; c=relaxed/simple;
	bh=tYdsZ0eZeGSjydj2c6TY6kEuy3RilDMui8Sm27gIZOI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ANty0xG0HKEo39HzpFUHPkZWER4ZKKGwDMpfMx9WlZjKtt/44Jt361LTvLBfnsmuGPP91WaXtMjCKVJ8IMevNLvsw1xN1bplnq2VFmQrH31Rs5cdMMeQ+eoHtwfBLW1bLDYJdFWkv5kbqjF5iC/3TPe02ep+Boi5Eb20/26jQoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dtokazaki.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gffNcBIR; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dtokazaki.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gffNcBIR"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-310e7c24158so10233a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 10:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748454294; x=1749059094; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=U8AteTtctIWx6h9aoSScY/JDCxlCRSuoc8ZWugz21Z0=;
        b=gffNcBIRyojLkL2iF4iGNrSNx5GcDb6s0ON7J37Y1nBqtkGUdG6Dw+e5eJp2zf5elK
         A7ulihgHWAQDHS7HH+2I1baXzjuPf29C/ScvYL4hGv/LKrfKeeU9/T77pJGW2N9brkeD
         CwiUNv6YrfDYqllWv7KkZReAgFkx9fk8F8LK48ops5SaQ+cS8tfc6M2EVipdhe2TRbse
         n8+VPMEk6DuJXU6N/dIk4eB/Ay7Lf5pdicFvnJN5oe2wgIyIaMRue2oqb1iO41VyB4De
         kdnA8ggfdGva1E+EMCk9SBCYS1Cn7qUq2I4TjhAHmOexD6rRoL0KZf5btMM8gQzNbe6c
         zKJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748454294; x=1749059094;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U8AteTtctIWx6h9aoSScY/JDCxlCRSuoc8ZWugz21Z0=;
        b=K6ldKANuskhwOYZgaZFpUQ6I20+IK8CyJqqV4l2VgrpOnmRD+SOx1W9bYpfud5TMj4
         B9aZkbkuDTm5hGrmBhm9g146OnP/icP2MrhPzXYUZkDwIY9kKxmCtJYC6OW5xJHDzFFH
         PcyclDRNjeCHAtoWQhyWUYZVRRDXDXco1sdrirQtf+uvvjqVkiTUVYPYdDRWMiD/oBNG
         PD2blscXiQtt1sQuKWXKRAtA52AlMo98swkNxvrMfV9eXCroKX1vqC0ba6cBVNkzUcCU
         oBV/Rv4fIS06nby9nYSSC9jYiV+UKxfBXrg+keq+Nx8AIzNMHMB4M2yI2efjWLSzHq9D
         VxrA==
X-Forwarded-Encrypted: i=1; AJvYcCXZsvDnq2Qd09D2Xdgk/JOqyOEiemYqQep/K+tBusqXLKTiKZTzPnxYO4lkfH5zLt8malXk/C7BaEBbNHo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZPEhmOlhe/HK/IqVVCciSX43IkMaX4Us8we/V4Ccx1Y4Xt3I3
	+2XhpC7HguFSu1zqDrimHOQ39XK+DpFeic4rruseouSCw39tFFTT37MsHTj2ojj3fH8S/Uxouns
	j+YkXw4dXBNh+DhivXg==
X-Google-Smtp-Source: AGHT+IH4qmilJcy/YpD2gHC3eQJIqw/F2Ghw8xg9B2Dp5xhXh/aI/Q39StwCpy0g0btihAkSdFONXo9bLIM7JSM=
X-Received: from pjbrr8.prod.google.com ([2002:a17:90b:2b48:b0:311:33e3:7a1a])
 (user=dtokazaki job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:2790:b0:311:d670:a10a with SMTP id 98e67ed59e1d1-311d670ac7amr5477774a91.21.1748454294140;
 Wed, 28 May 2025 10:44:54 -0700 (PDT)
Date: Wed, 28 May 2025 17:44:24 +0000
In-Reply-To: <20250528174426.3318110-1-dtokazaki@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250528174426.3318110-1-dtokazaki@google.com>
X-Mailer: git-send-email 2.49.0.1204.g71687c7c1d-goog
Message-ID: <20250528174426.3318110-2-dtokazaki@google.com>
Subject: [PATCH v1 1/2] regulator: Add regulator-output is_shared property
From: Daniel Okazaki <dtokazaki@google.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Zev Weiss <zev@bewilderbeest.net>
Cc: Daniel Okazaki <dtokazaki@google.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The existence of this flag removes the exclusive requirement
for the supply.

Signed-off-by: Daniel Okazaki <dtokazaki@google.com>
---
 .../devicetree/bindings/regulator/regulator-output.yaml      | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/regulator-output.yaml b/Documentation/devicetree/bindings/regulator/regulator-output.yaml
index 078b37a1a71a..9bc4c68b9978 100644
--- a/Documentation/devicetree/bindings/regulator/regulator-output.yaml
+++ b/Documentation/devicetree/bindings/regulator/regulator-output.yaml
@@ -25,6 +25,11 @@ properties:
     description:
       Phandle of the regulator supplying the output.
 
+  is_shared:
+    description:
+      Indicates that the regulator is shared and should not take exclusive control.
+    type: boolean
+
 required:
   - compatible
   - vout-supply
-- 
2.49.0.1204.g71687c7c1d-goog

