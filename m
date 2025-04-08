Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F091823E235
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 17:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744134713; cv=none; b=Zf5R6XoM0KLFwcz2fbO89OmJjg2nLG8q4J1HpVJW8TgX1N9DKXW8rLn7ywNnmELR+HbbP/H9rMjmqmW1zwgqWXwC+uhdrSQgtykYjZFiIkMU5WGxUV58fbhddJaPfvvpV+QO9TP5TTXtg79YVoko0tc9G7cZNTuzjdBZXkGWQrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744134713; c=relaxed/simple;
	bh=pfNiNb8Fe/zcwQj8jQmkgpYm3CZKoam63wk0H25fTyA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=imi1wVFQZSdHFwfErpgIUKtXUOwMOFHKQs67Bxqfu8EwWgtU4p0u/4rfCdlYNq6ci3R0pO0TJBAnlVOA2xincuOHRe5vx8jq86UZEq4QXFkYnM2ZlLgkcbDZ4/AzQTXk658BuhK+IaZZ/UmTj2y1+AJy+cec9Ea6YIDaAAZQXqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=ag4ZO0o6; arc=none smtp.client-ip=209.85.166.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="ag4ZO0o6"
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-85b40c7d608so503580739f.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 10:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744134711; x=1744739511; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EXZ0+VsyT3ItyrY8CgiqoYB+yPWPKWB+ae2oWOWvhgI=;
        b=ag4ZO0o61M7o/cV47ct6rJR7RnMvZyYnZK8YvTvri2+iGPVp95JX0DuBqKg2Pp3/HG
         iURoLCsYBdri1agZI3VSs0e/uThFjVo7ZJljNZEAj5afuIGUx54thzQ1xXBpMjd6Cu/A
         6FNifwFG75MFSkQKrRyU+nTy4nm5srHh8RlXGZnsLWjWGtYThzw2si6GDcNbRp+F9e7m
         +aCDKEHzozcOPuIh9UZWIJUC3ZGsqO+nZ26zgCNderBziI4KSM1ZkG/kvmDzED6bEAzc
         YNXP7nnlRPqh+bQZ09TFgcKkPqBZfG+CcxMBOdccP9/YIjPnadIVz02ABpBz7RORI4KZ
         /mxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744134711; x=1744739511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EXZ0+VsyT3ItyrY8CgiqoYB+yPWPKWB+ae2oWOWvhgI=;
        b=SDPtJFXw7Rt+IzdRRnCNLFsIhsF1I6s4528FglC0jFBmpW7MU/y2ANWbc+3Uh+2VUF
         uckpjiE+ffN1m/lLVuP65xIfKbrQv2oksvLyOrDwQSDI1BNpyB0qtuKOmDgh5mWTDCco
         OeRPmHI0Zc1t4shO2DI2065txce99/7e0IkI0rW0xLgt4z9e3zkY0VVqgg1SUs/70OTH
         AAoDqbmUqYoqjkhp6kWVtDULxQwdR7UBMoyCYZnMdnr/br6n2xP3/NE3BpfwANBa9VFG
         KW2ztR1DQ8pMINy9TjlMJtFB/8UMYmIVts6BwD2xs49sSuRDdlTEDKKmHh12BTQRXhTW
         yoOA==
X-Forwarded-Encrypted: i=1; AJvYcCXoGjUJi/Ho05G1/ch+k+3acYktlOxVNwlrPXc0tG9tWrwewKfACuORMl1BC8z4Bww7ekif7CQ/HCS/7RM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxG9AfdglD2FntqOm4KbvavY+bU1ZNE/482LJ9CEVeQK5BYZxN8
	9fRxr/t0W7B5sUZy0wVOPnp4VhSBtZrZGjKQz3r6Ha1zfSrVNlwjOFfXex257W0=
X-Gm-Gg: ASbGncstbzQ+Q1zhxq+9/1lNzSELPWB1dqTgYYS0WQtKFaPuVgp5xqOMXSYQnlPiEiK
	Ty0+1J8blScw6X0GZi6YmKJMul4uB+LuF1I30AdLcw/piLNvzKoouQAUujW0SUUPyY+x1NNa4Pg
	gpYBAVbFU4JQShrspIn0VKsgc/O2EBINC+VzwwhzWouQlmJRVNVJvNxeXJAh97LsrzGCGhNhqwF
	Qk/LWi+BbYT8GwU1RTdJwOLrwsxq0xkQ8rNhW4cmAsTI/k5m2AbIpoBZuUtPkoIn7XsLJ/otmDQ
	MRWIM3HtGl0DAsRDVj+cNSFLlaDN1ivSM7DS6pqNDoFZBCIgF2tjW0iEBQ33KGdrsd3/w2kQn9y
	gsrFcR8Gs7ZNLBSR1GEH6bEV4IOEr
X-Google-Smtp-Source: AGHT+IGVxxwmqJkqflwzOHKjV4l4VlvMzZwjLfYihFRtDlDdDH3ptiChk4kVDxgr5Yqkd4y8bj8J5A==
X-Received: by 2002:a05:6602:3995:b0:85b:601d:dfb9 with SMTP id ca18e2360f4ac-8616118207amr9274439f.3.1744134711088;
        Tue, 08 Apr 2025 10:51:51 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f4f44e26fcsm595914173.120.2025.04.08.10.51.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 10:51:50 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org
Cc: benjamin.larsson@genexis.eu,
	bastien.curutchet@bootlin.com,
	andriy.shevchenko@linux.intel.com,
	u.kleine-koenig@baylibre.com,
	lkundrak@v3.sk,
	devicetree@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: serial: 8250: support an optional second clock
Date: Tue,  8 Apr 2025 12:51:42 -0500
Message-ID: <20250408175146.979557-2-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250408175146.979557-1-elder@riscstar.com>
References: <20250408175146.979557-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SpacemiT UART driver requires a bus clock to be enabled in addition
to the primary function clock.  Add the option to specify two clocks
for an 8250-compatible UART, named "core" and "bus".

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 Documentation/devicetree/bindings/serial/8250.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/serial/8250.yaml b/Documentation/devicetree/bindings/serial/8250.yaml
index dc0d52920575f..1adf935b7f36f 100644
--- a/Documentation/devicetree/bindings/serial/8250.yaml
+++ b/Documentation/devicetree/bindings/serial/8250.yaml
@@ -135,7 +135,11 @@ properties:
   clock-frequency: true
 
   clocks:
-    maxItems: 1
+    oneOf:
+      - maxItems: 1
+      - items:
+          - const: core
+          - const: bus
 
   resets:
     maxItems: 1
-- 
2.45.2

