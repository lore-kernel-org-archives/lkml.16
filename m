Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD7E1DF97C;
	Wed,  2 Jul 2025 05:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751432669; cv=none; b=jSCa69aK6E7qavKLzDzXkaEyR/hCk4vCYUcf8NaHBb5gXY4+Jn3H17qTNWXI2bRm4tErM4q0pjt6gUvuNJgJNY9bDss9ojkHLJ5OAmB86FiymcFnxhh8ok0FDInKVsuFV0Kg1EJnUvGNzhEf0lL0mPsjWeL5TLhmbCEZTNAJ5wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751432669; c=relaxed/simple;
	bh=euWdO1Iyusso38SAg6feil4VSbjjkVkZKVp9bmcTszo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VidDR9IVtMTD7SQKc4dkDMa5EEqlGhRh1HqKzSZy8uXGmz81dYS24fCJRjN2DyA70xhlM/YfOtzBLfoVXTTIDyXsBNrhMu69Pho+5UaUJaANyz0vAOcE/Jg4K/kiCFeQm2FExPqXFtF+vkw5qcAgP0WKilsnpKJwCJdAWaqqx3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JmhyznBq; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JmhyznBq"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-315cd33fa79so4327688a91.3;
        Tue, 01 Jul 2025 22:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751432667; x=1752037467; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QXmso8g2COR1WBKWaY8Z/xRycJZ8eCt0dgwiFP5AhaQ=;
        b=JmhyznBquAB26qUDcjxopEk3vbQRcKYQ4/vVy2G4vjO9+jGvewXIsqoKuj8jNd87AA
         iq0zQCJKUZ1w69rM02wrzULtJON0EBwaAHRieQLI071Y00BRja7qt59n1qMNUy046eLS
         PHOprsd6rrK1jHBtz3rXyMlNiK6dcrA7qkT2dypESGspmtPP/bCVla1ZwwVaSyQ9hj8C
         96welZuwj4scRcSRouAisNx0sQoM03c6/Qguj4/gOGqqYk1Ou4IY5NSHiWeNQN4XJ0cE
         e1uOcFR6SzEsqSvIE77WG6Dc+mMbnc1BdWENYaVTx7sTLnUPoBu0eot5mDZy3Ts2T8Z4
         uqBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751432667; x=1752037467;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QXmso8g2COR1WBKWaY8Z/xRycJZ8eCt0dgwiFP5AhaQ=;
        b=Hstl0vZ3ScSnr7oioQWWz95vMW8Zb0SfKuUC3uR2GF5lgE1DwDp1ta6v7rtx6TYAh1
         0LvyZjovtRUVuFD70YUxpJ46oUXyqjJFO1nIDl/w47kJrQWWc2mTo/Hx9i/NjEvBESJy
         0QMMcurAXQ9KbxL9jyzsQBtvF37mCpYXZV70BPjvlrGkhKuaJ8GyMNE7n+ool88CXEvy
         D6Fbwu/j5QM3NEWUmHEhOWZfvZWtlhcXRIIj8toabL6SAZwcu4/1b5gxt1a7YKNTziWJ
         pPuJSYqrWivliK6cpixyLflOGaHvLOAooV7am4jtuBBmQkCCqxyX7uR1dnWBdM8T4R/w
         1aAQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4qadWTqF0L2B7o+j3oNPr13E22wFr2JGxH1p7e9ie3+McC+DJ+MjA7V+cC45a/sS2OvHf0viAy4It@vger.kernel.org, AJvYcCWluEoH/N1YqA/kZ/xAple5a4wxrpvZ5VVWWzCcrBHkK7JnIUVKQQOM+vuORb6wIfBioZVegaoBq9k8xN+m@vger.kernel.org
X-Gm-Message-State: AOJu0YxQ/MnrrvKtcnqyeEXuppzuZUdwfhxdJHoyPfXF3XdgVt2p1L/l
	OgmgZ6wM9mtxDopceH3TpySjlJqwaWRw2ukh70nviUMkNexAbE1FYmuv
X-Gm-Gg: ASbGnctjKOyh+XStVU745K6VBhJpUT7tR68Drpoav4KWRQEabm8imgvLRTSaR0DwJZ7
	PKPCb9+EBiDVpOdGrljmJpgoOE9iTJBPC4iEPL0BeSetVSUTTnyCtRBgIl/g+bnOYzn3S0hXp6G
	3L0Ay9Wr1jMXjSoAhEt2aeySjX8bI3FdWYMIBnNXTJ7nx1Y29p0qlG/7MJ6nq5M+Uor5UhGBPNE
	ldne/hVkc5X09dcmBnpOykDyQzk8gHc13/Wb8LV0JWYlzR0RFxGzGm5YZNA4gVZ8Hk+VMkoiy56
	JvaD3MmkGYplbBWPEBF7YYuxTUNxJLobITs7RhdDkQiCZ31XhLdzEV9XGH7+DGJKsnUrPRzKFuc
	IcX7NmD0RGthhsqz2GuMDAouibUtxtBMizjZ6vOI=
X-Google-Smtp-Source: AGHT+IHUG5YCrucrr/166eG7coq7r8DcPuqMV7G9sKstOJsamQmMYN1ozIbRh3jEQoxq+KuGWSkBRg==
X-Received: by 2002:a17:90b:2812:b0:2f8:34df:5652 with SMTP id 98e67ed59e1d1-31a90bd4786mr2068529a91.21.1751432666963;
        Tue, 01 Jul 2025 22:04:26 -0700 (PDT)
Received: from localhost.localdomain (c-76-133-73-115.hsd1.ca.comcast.net. [76.133.73.115])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-315f54270a5sm18168323a91.25.2025.07.01.22.04.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 22:04:26 -0700 (PDT)
From: rentao.bupt@gmail.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Tao Ren <taoren@meta.com>
Cc: Tao Ren <rentao.bupt@gmail.com>
Subject: [PATCH 1/5] ARM: dts: aspeed: Expand data0 partition in facebook-bmc-flash-layout-128.dtsi
Date: Tue,  1 Jul 2025 22:04:12 -0700
Message-ID: <20250702050421.13729-2-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250702050421.13729-1-rentao.bupt@gmail.com>
References: <20250702050421.13729-1-rentao.bupt@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tao Ren <rentao.bupt@gmail.com>

Expand data0 partition to 64MB in facebook-bmc-flash-layout-128.dtsi for
larger persistent storage.

Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
---
 .../boot/dts/aspeed/facebook-bmc-flash-layout-128.dtsi | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/facebook-bmc-flash-layout-128.dtsi b/arch/arm/boot/dts/aspeed/facebook-bmc-flash-layout-128.dtsi
index 7f3652dea550..efd92232cda2 100644
--- a/arch/arm/boot/dts/aspeed/facebook-bmc-flash-layout-128.dtsi
+++ b/arch/arm/boot/dts/aspeed/facebook-bmc-flash-layout-128.dtsi
@@ -32,19 +32,19 @@ image-meta@f0000 {
 	};
 
 	/*
-	 * FIT image: 119 MB.
+	 * FIT image: 63 MB.
 	 */
 	fit@100000 {
-		reg = <0x100000 0x7700000>;
+		reg = <0x100000 0x3f00000>;
 		label = "fit";
 	};
 
 	/*
-	 * "data0" partition (8MB) is used by Facebook BMC platforms as
+	 * "data0" partition (64MB) is used by Facebook BMC platforms as
 	 * persistent data store.
 	 */
-	data0@7800000 {
-		reg = <0x7800000 0x800000>;
+	data0@4000000 {
+		reg = <0x4000000 0x4000000>;
 		label = "data0";
 	};
 
-- 
2.47.1

