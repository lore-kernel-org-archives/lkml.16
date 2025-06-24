Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 192E928E607
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 11:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750765759; cv=none; b=Bob/3kUB2gsRVyGdot1FfB/D2JZ8OWKbbwNAsFOSopy1o0/iPwPHa8eKwVsoeAub3ytgFiAK7mrXNhVhMyONW885nJYzhwURfKC8UYnryRSx6bUeuAnQfl8KUQAKD2iKTZPzvI7hPVuBG0tCryg/VbneLs5vIN7ezdFYGVc3Ygw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750765759; c=relaxed/simple;
	bh=C+ldSKk8CmcmIkATHZDyFz0szza0IdxJ0ts1fTi5YiM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mAyC1DuOJbaP8z688s9abH14oNJ2x6d78f8xgNUKVhBbCgh3Uft/WF80gFHd+JoQFmW81vyjCuLJ22gWBD8/WKJzHl+ikzxLUhUHZDTW2Dx4hoaoU4ZYo1OeF3DTtmOEaHIS+SaoDsu6CW+/5siiV1LPc8KokZvAmB4eKO7D/DE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codiax.se; spf=pass smtp.mailfrom=codiax.se; dkim=pass (2048-bit key) header.d=codiax-se.20230601.gappssmtp.com header.i=@codiax-se.20230601.gappssmtp.com header.b=MPyaUrd5; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codiax.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codiax.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codiax-se.20230601.gappssmtp.com header.i=@codiax-se.20230601.gappssmtp.com header.b="MPyaUrd5"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-553b5165cf5so410998e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 04:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=codiax-se.20230601.gappssmtp.com; s=20230601; t=1750765754; x=1751370554; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rrUbcmZF3TAdKKDR84X6iLmpavcaVxBgM0j4vAqCqGs=;
        b=MPyaUrd5PYYE4IGNfXqoUsY4Uv9jrcq8rHPHT1JWbrzqZ9fNJ7NP5eEv61atC4e+4h
         gKe3vGgVtEB6rOI53kUs0D1309u9Mr1hBD8Y6/236FHZKday0IaqZFgmtCWR7uwajY4u
         PKKALhuJrgaIuoj2oMyu1yv/eHz4rcp9omRRI2tI26QppDY7yXfQ3OKKwAjSC9cLNHCY
         zkmzFKwrCxkonP7ufXQuTqlVJBKmjgY9wSNuqouScG61br52ijabfQG5fxQw1/7eOu67
         D03NJ286MO5eynj+8GPheNchsimAtkhNvo4vBNsv9xeGTznb4RLv5vFZ/tEO8ULgXW/D
         f63A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750765754; x=1751370554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rrUbcmZF3TAdKKDR84X6iLmpavcaVxBgM0j4vAqCqGs=;
        b=rpG/HL0/Iufvf0FFCr4wRm8PuHcX+TeG86Eg+Jkt3nx2g6cC9LrwfJDgbpG4iA8yVi
         7BMMTg9UlbiNfWj/iKVoQnXwQXn5O5PxQZAzZoCO6Zg8PV5N3myY3wcwvqpbR5sft2Xt
         v1VrN4gLRvl13iXrYS1xQjLkJLIHaWPCaHmkwvF7r/mZnSUvnUk4C70mpHS0bFy+PBsh
         oC6rt4aj2MOzMkDlOJQzMnNJRmkSBdcMD23A9HsIOG+biLMMTuxUGPgwPl7y0dQS/dBJ
         hE1DTldBSXTWateozwL6Oz3T4Oq8GVRIsaJgnmu5TCTNtIkKFIDWTirq5jY/NB3RUc+y
         A8CQ==
X-Forwarded-Encrypted: i=1; AJvYcCWefQvv0nKgc0IrozkODmzODSznePGj90cMq/Bk8D94LbM65b/8oKlFIUtjVdF3SF907VpM/3JBo9y8NaY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwfyfE7NCIQoqZ+gVWZI3jlRNWW1qSNX8LtbheTf+itbhClc9DR
	w+K2Wi9tmtSqtUh/TssVQLkY/ZiLQJLGNtK9Jv4HJ5XRugp+uPql5AYvQWRu/iqE2IkuQjLVqu7
	FRELQ
X-Gm-Gg: ASbGncubuFyE9muWpYSOt5AQap96rmXTutBITORXCzP2JCj72UpvfNWLZnmejcJiQWg
	1ayzasuSYhE4aOUG1MCaC5BsimlwWzAAOLVYF+fjZ5tyFdxvaC5bZjiWyL2Jy50ItUrqJoAhz7G
	Gmwf5t7HI8c55my/E/td5WDA9rw/gOM6VIMvxAwiN0l2qg5B4xcTjsth6yUX9/WKl4p8Wz7sWk9
	KKFBideYnwzx72bdS/uxzLXUwxhonMLdBFaHs5lWj/3+Uie3/OO3ewSzsh1R246vbtY9cJmtJsd
	+HvqPpJm+yYhMacp+PRm0slpfNGrfYGK/NpLOM2n6AP5UEOiQcwir+zxTlvgZlGUn6wuWd0NToa
	A4azQR4DGHrWpUwwcOQmEa74zMwmoM9S7
X-Google-Smtp-Source: AGHT+IFSGexEtfcMzAQ+fzVvPpnt09+h/hiP53/5GJBuSDikVVM5naJcA0DuDdEg78KtDtVifjADUw==
X-Received: by 2002:a05:6512:b87:b0:553:a456:a0c1 with SMTP id 2adb3069b0e04-553e3d04850mr5554575e87.43.1750765752686;
        Tue, 24 Jun 2025 04:49:12 -0700 (PDT)
Received: from falcon.codiax (h-37-123-161-8.A137.corp.bahnhof.se. [37.123.161.8])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e41c2e5csm1806724e87.155.2025.06.24.04.49.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 04:49:12 -0700 (PDT)
From: Albin Tornqvist <albin.tornqvist@codiax.se>
To: tony@atomide.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	albin.tornqvist@codiax.se
Subject: [PATCH] arm: dts: ti: omap: Fixup pinheader typo
Date: Tue, 24 Jun 2025 13:48:39 +0200
Message-ID: <20250624114839.1465115-2-albin.tornqvist@codiax.se>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250624114839.1465115-1-albin.tornqvist@codiax.se>
References: <20250624114839.1465115-1-albin.tornqvist@codiax.se>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Albin Törnqvist <albin.tornqvist@codiax.se>

This commit fixes a typo introduced in commit
ee368a10d0df ("ARM: dts: am335x-boneblack.dts: unique gpio-line-names").
gpio0_7 is located on the P9 header on the BBB.
This was verified with a BeagleBone Black by toggling the pin and
checking with a multimeter that it corresponds to pin 42 on the P9
header.

Signed-off-by: Albin Törnqvist <albin.tornqvist@codiax.se>
---
 arch/arm/boot/dts/ti/omap/am335x-boneblack.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/ti/omap/am335x-boneblack.dts b/arch/arm/boot/dts/ti/omap/am335x-boneblack.dts
index 16b567e3cb47..b4fdcf9c02b5 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-boneblack.dts
+++ b/arch/arm/boot/dts/ti/omap/am335x-boneblack.dts
@@ -35,7 +35,7 @@ &gpio0 {
 		"P9_18 [spi0_d1]",
 		"P9_17 [spi0_cs0]",
 		"[mmc0_cd]",
-		"P8_42A [ecappwm0]",
+		"P9_42A [ecappwm0]",
 		"P8_35 [lcd d12]",
 		"P8_33 [lcd d13]",
 		"P8_31 [lcd d14]",
-- 
2.43.0

