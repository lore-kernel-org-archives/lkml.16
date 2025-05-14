Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C18E2260C;
	Wed, 14 May 2025 03:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747193162; cv=none; b=kCay3ON9YxnOxH2s3c+RpK4V3jx/6e+kAZpm77g3HixaPEaThWzFnI0omuRiQL6GjiEYxwBps+saWI0eW5EslpSe3oU6wTRkX4VyZe0K/0vLhr9//1sL0RqiQo5IuwwX+oO4rg5xtIiF5oXEGTN8hzmGN8aDh9+zd/5q9p8YgYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747193162; c=relaxed/simple;
	bh=ijzwnnI/HGCOYp81pOseMCjlmDojsIOrtfsqtslA87M=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=IvWm28YS9zBM+247/2imk7rwiXBpEm/DMMtWqmM5v2mDqpew7pjVEs+qZvaoi4YgwLwY7cxiB9OaRXlA3FpKKt4o80BykBoo2aRJKfk1uW7pKVDhs+rkKvgf+zQeC+HZrB+e2ys2pq3WuV2OrC+Y+KGBNKUAnY6E2cfzAH50bZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dashgXX8; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dashgXX8"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-306b6ae4fb2so5943335a91.3;
        Tue, 13 May 2025 20:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747193160; x=1747797960; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:date
         :subject:cc:to:from:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TcDZQwTmMdtyKKt05qTa4r45+8RvNA2opPyhd5OidXw=;
        b=dashgXX81pwxSGYVdJceiil9kod+EZRv4R2iTfJRHqp5RHS8QvvQ0OD1ThNxtSzfPM
         F0lL/Gf79uJCMM/y+LU7UmUMl0sCU1LsWVDYcC8Kc+VrpMob2IyirsYQ5DIb8oAuRhiB
         yKRPMRkRf351yFyHG3XzvFPwZrrFfMJYqhoKYsQ3pOrpKQNnWUksFXxeKpuasKgy3pVI
         uyaoZLWcvziA79mUaCkfOekEcZ1Had6TTZKNiivAqab2pgGHEeWfRDC8RP2/7UfQFxC9
         Pbq6HV+ZAwRgCflF1xotLpKiXPjS9xe9t/zsYwFCnJkOigD1e+pC1EgPnAgB/7AS85Xa
         qJ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747193160; x=1747797960;
        h=content-transfer-encoding:mime-version:references:in-reply-to:date
         :subject:cc:to:from:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TcDZQwTmMdtyKKt05qTa4r45+8RvNA2opPyhd5OidXw=;
        b=Z8yPbDNAvJpz8mQ0s9qZ9KSgE72EPyo8alxZ1DmTCJdP6gS+3VuJJM2Rd9nrBVdxt1
         Jx5tx5D5sC7+nQ2T0mawasix7DIQU8GBFe/AYJpFz5D71ewUQRE6gEQAtq/oomxQgdkH
         aTB0BA6BPFjGzvWXyBa+FrcMLykkG9mEEo/oDyhLevD5Kt1AtfVLE/azJomWLEf85sM+
         S4JdLyURG8KiTalYJgeUmODQYzZKxg+GgtwFzSlk7JjqqZrqMSyMAWgHbsDmJ4vBhag+
         ogvTDV1tMo24uYuodgVFR8fc51mQkvUQGSFxrO2ya0ZsAJIBgL5SkHnpsgvByGmARiJX
         94/w==
X-Forwarded-Encrypted: i=1; AJvYcCUEvlWUGGl/FYlfPBaUXa6iwWZp2KHn0yPqnZDSNSDwL2gci+hfmcfG/6nOc/FHex5mU/GKv3p+DpI71SA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzkY9zQEZoV0E5EMX/uCsaypPdrgM/0bgF7DHazX9Br3+X6+iNl
	KYv7LmltERXoivagxNhD1dfqqNZTAR6oz7SPUhqQURnlem98zUq3
X-Gm-Gg: ASbGncu0P6PgPmncPzfTuS72pM04jrQ7AUJwbD4+erE4mz8R/X1zyZYLMtb6yLsWMRF
	e/BO9Pkw3G16ExbdIHOpacRvECvWJYlvF1fHf2ui6LIVf5hzgJB7lj1zk+3oKCj7kBzZVt4x0CA
	9YJgbeXRTw7zvZ79vfIk6Aha5ckkLf3cb8pKzEzpb35/fWf0KfgsiYSTozi5uYh2rirGdfWGkV1
	6FcHWt7J1iTEdeniPwieDvyUQrxTy6l+Wn+8Zeij2wak5m7gcRiElsAmEcv34zxoq3DScVTmSh7
	VFDtUev9Vm/XOiGQ3cNdQZDg5QVgOLRdMaUPyF4NDoNIvLS3oQbtzQ5fCxatE3BkFQtFCYdb
X-Google-Smtp-Source: AGHT+IFgFmbcbTy2fzroMryy0JD+lhC7K5WXE5pPjhmZCsckNBHxwrPKsqyWRirO1mBQ4wl5Y94zsA==
X-Received: by 2002:a17:90b:3b4e:b0:30a:4906:c20c with SMTP id 98e67ed59e1d1-30e2e644d17mr3039146a91.35.1747193160314;
        Tue, 13 May 2025 20:26:00 -0700 (PDT)
Received: from dea88b1475bb.. (125-227-29-20.hinet-ip.hinet.net. [125.227.29.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30e33451e6bsm414599a91.22.2025.05.13.20.25.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 20:25:59 -0700 (PDT)
Message-ID: <68240d47.170a0220.ba589.0feb@mx.google.com>
X-Google-Original-Message-ID: <20250514032452.275855-1-LeoWang>
From: leo.jt.wang@gmail.com
X-Google-Original-From: LeoWang
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	george.kw.lee@fii-foxconn.com,
	leo.jt.wang@fii-foxconn.com,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH 1/2] dt-bindings: arm: aspeed: add Meta Clemente board
Date: Wed, 14 May 2025 11:24:52 +0800
X-Mailer: git-send-email 2.43.0
In-Reply-To: <6822b830.050a0220.27a24d.d064@mx.google.com>
References: <6822b830.050a0220.27a24d.d064@mx.google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Leo Wang <leo.jt.wang@fii-foxconn.com>

Document the new compatibles used on Meta Clemente.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Leo Wang <leo.jt.wang@fii-foxconn.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index a3736f134130..4416a40dcd86 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -81,6 +81,7 @@ properties:
               - asus,x4tf-bmc
               - facebook,bletchley-bmc
               - facebook,catalina-bmc
+              - facebook,clemente-bmc
               - facebook,cloudripper-bmc
               - facebook,elbert-bmc
               - facebook,fuji-bmc
-- 
2.43.0

