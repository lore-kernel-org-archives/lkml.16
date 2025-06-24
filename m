Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE1228DF36
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 11:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750765747; cv=none; b=b7qeEEGPT1gcKWHBTgAlOmRBlvTEDUyR7JvtBoZU9WkXcAQbsdM4hBvwuC/dfFIV1abvaQBKX2VOXKANqbajL98OaRA19dgQYm9Un3LK7nYxEkyY+NYZTu2Qu91Ac0dZY8LE4+eHMDvBMltUEXe5hPbGWBaIQYS9EP0Sqza7V2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750765747; c=relaxed/simple;
	bh=UxTC9xRj/zj8ryzAX8TqE4eUO7zS1dCWnLFe+Zg1R4A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=tOUPEoe7CrS2iYk9vi4fldVCkvqX7KCMfVakO25I9XDLc/md4U/edxa+cA3V6NNzKH0EyQSh/vExYQu3kOw+dXOa6L1EyBMKTC+E/wBGfQ6zV9PS7F8edLrqPGIKjpiL+/yY5aqnOPcuTCvWlsij2ulQ7LdYG+RjaA/TxH56DNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codiax.se; spf=pass smtp.mailfrom=codiax.se; dkim=pass (2048-bit key) header.d=codiax-se.20230601.gappssmtp.com header.i=@codiax-se.20230601.gappssmtp.com header.b=ckVOXXo7; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codiax.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codiax.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codiax-se.20230601.gappssmtp.com header.i=@codiax-se.20230601.gappssmtp.com header.b="ckVOXXo7"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-55350d0eedeso356037e87.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 04:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=codiax-se.20230601.gappssmtp.com; s=20230601; t=1750765742; x=1751370542; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YDe4d6DAb1FPdDH1nEMDmv6KDrUedHX2gEqJkiLhXb8=;
        b=ckVOXXo7T62cvZjAdf7HtZTh3MwLJVlRzVWw81NMJaoZQvc6AiFjggK+q7UcWOfryc
         UI82g5i0OwSBdRM0jNaF64UhWfPdMsCKKbCf5OedxpzfAUdq5UHGyjm7CnPq7uDiNjaI
         XSwOsdfOFIdky/c7Eu0sEZA8ScNGaiLPR5/0PDzOS4hBdFJVkdsHEvPnluLJz7JLu4Fi
         7XrfpUz+pOzqez2kAm5otbQVKrKAYUioT9FWTQ2OEmjzc4ZjCeMhHmh6R5CDy6ESPdUW
         CWulya1J0wYB8sd9h3zuIcNDNDcbQxJrjnH4TJyUpEnHIOx0kdKh99HOW8ssF5VzjwkG
         gWhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750765742; x=1751370542;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YDe4d6DAb1FPdDH1nEMDmv6KDrUedHX2gEqJkiLhXb8=;
        b=UuA+Jcqg5aF2pOJVR88A7MAu8WJZ0wAJpZdwtG59BeZq/f9/DbgDb1k9N602IIbS1o
         UvJ4xSW2nKuAs7JfLtU5u8PTJcKqXbRphvNn+rOgY3PTxHstvjeehAn3hUfI914cHU7n
         6FJMlVonDRSbabxCNvj+OQkiSYb1O9sRibbNlOp86tKCMlpbQj12uUWRJfj3tC+c4NCe
         7SdE4U5/aH3C06k7iphFlibYn5l8M+JWAx0KzQW1OFZ5oVsknXW5ZAZf6SFkp9VAISSA
         ugNdrnk571zJY8Q8weFURyZKHS/68Jw/3CP3dq3c51b0YQFtYUcXjZjnt/oIHtoCbXKK
         AVYw==
X-Forwarded-Encrypted: i=1; AJvYcCXSXQO/SoRS862lXRZtjLQCL35iJBB2URQdI/YBZvudGVaoT6UaBxnGny0GGRCNVTO5vY8Lf710AKHTk7M=@vger.kernel.org
X-Gm-Message-State: AOJu0YyR6jsWb/tiWujVriVRw0BwyG4ktcgRDdUreolpuY4XAMGa9KQd
	KCfbfkofRzddnguw4J+rAF7oNkC3cLjlTjS9TrRMyLKTERDRAKQckxP46pM1bGyw4Ag=
X-Gm-Gg: ASbGncuw2psu8j0dThcJe94Qw7m94L8T/h1Zqip1Vg6eh+71nOxjFWvar462ASJrraI
	V+nHEzIoFBK7MVl3/UDSwhOy3ga35kGeMH6IYom2bczMmWZcF2gcniGfk0lOBN5M9PPgmGhlCYA
	8So+mcO6f0KbSPxEbuU7YZ9bC1V++6E+yblgQPfqz7FPOEHq7syOz1SFAHpjyLVn7cC3WC4I6xM
	88M17ZW6yTBArWLUWYcj97PKXwTBhtp3cvr6YwsK6QrQ5+xGdl5V66Ukq2h2M5yce3fx+CWaz/G
	vMRVOJ1Q8umgpttzZRc4lXNZ1/O2DHeeqyteowE0GGqzF1ub206Wtg/5Xdis89p5IMuaKCniceP
	3Z4mA1MJ50n8xlS3ObcC01FL+/nelAbNn
X-Google-Smtp-Source: AGHT+IEfSt7tNNrH2iQBY0OqVXLuy72EhSV4+ycj/JlWBqXpOEeYEFU9T6O3BE1zu7c7pWadRz2Lug==
X-Received: by 2002:a05:6512:12c8:b0:553:2e37:6945 with SMTP id 2adb3069b0e04-553e3cfda88mr5286333e87.32.1750765741784;
        Tue, 24 Jun 2025 04:49:01 -0700 (PDT)
Received: from falcon.codiax (h-37-123-161-8.A137.corp.bahnhof.se. [37.123.161.8])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e41c2e5csm1806724e87.155.2025.06.24.04.49.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 04:49:01 -0700 (PDT)
From: Albin Tornqvist <albin.tornqvist@codiax.se>
To: tony@atomide.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	albin.tornqvist@codiax.se
Subject: [PATCH] Fixup BBB dts typo
Date: Tue, 24 Jun 2025 13:48:38 +0200
Message-ID: <20250624114839.1465115-1-albin.tornqvist@codiax.se>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,
while trying to set up the Beagleboard Relay Cape for the Beaglebone
Black i found a typo in the dts for one of the pins. I spent some time
pulling my hair, hoping this patch will save some time for other devs.

This is my first contribution, I hope this is the appropriate mailing
list and that i got formatting correct.

The testing procedure is described in the commit message(for the first
and only patch in this series).

Albin Törnqvist (1):
  arm: dts: ti: omap: Fixup pinheader typo

 arch/arm/boot/dts/ti/omap/am335x-boneblack.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.43.0

