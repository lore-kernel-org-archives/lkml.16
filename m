Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09BA323535B
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 14:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748961478; cv=none; b=d8Z/1F3odFHn3RBDHpKhFPkVq9I64rPSpHi8NM2r+dYNhoJzpsXSYG1rok/rrHy6NyNwckelBRez+MEg1KNTr2pMqDUvXAiYEr3Glpxi9HN1rs9zhKgFu48KC1ybkhUnpEPhv4ekwZnJq5QfKrl+wLqvTGP9n9Vwz+Lb5Y4nmX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748961478; c=relaxed/simple;
	bh=vFlQmUYfvlbdocc1660HFvFkLaTTtU9EJLRp4LGDp64=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DI0FnzsCVnCWyyH4wrMIjsbRJlv3QEtN96U6JN1/r2bHhFNq1hUxSo1ci8QMdliVhFULX9Laq/1DDUCaCW3PrIKDZn2NJ1tU5D6cW3y/uzM7lnGnXL7hyxXGQyHwldj/w7Gj/vim4tTkrLGYOCcriURr1wn28md3qli2XSwB/Ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=YuZxYJUE; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="YuZxYJUE"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so66442495e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 07:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1748961474; x=1749566274; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q8aakW4/a4S4nlb27SNIiYOlQ/gC3M9NtCJYtqbcxPc=;
        b=YuZxYJUEsTYaEQowAoQreEgKrVEYlLdsiESbNeXAk9mbartslzVjXmw8pE0wC1QpBa
         7EaZcdTjS8/vPwlEkSvEFrE4RqxY71DuxZ/L0BzbZXF9zHomH+aD5QdlScuTMOoy0+9t
         +If7qpyQ7tfHXLuv55hNfScXz1Uh/ZqHjnmeN5pQoTjokw2O47n7no3Kr7XD9uiJhFpx
         PHjKwOwd7EdCy5Tcs2ymScXKc3OY8C2M0MJ89Zripu5ob5rEWLEX48agpXEQ6nj1Ux8D
         AJ1JXh+E2Cgus7p6+/AhcEFqM8Xr8h4oVlBC04lQ09j+Obf3v15/59sU28wwJZyBOk2P
         JQyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748961474; x=1749566274;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q8aakW4/a4S4nlb27SNIiYOlQ/gC3M9NtCJYtqbcxPc=;
        b=rdgxEMM9ovm2gmXD8F3Qh8QsauNXeDf87iOYT1WFEqhKM8NaVyl/5+uOnaMXoUoqrI
         k04Fwp50uJt5KPcd0HBPtzfV63+8NKa+UJtvd7zLGKmTieX4W9+We1PG5t5skGP0Ip5i
         r7hZETtQopH9avGozPcOFIVel2PfqfO06zeID79espb53wQQS4bLn5xdWpsn641eHzj8
         PxAc4xKQ4MYey1EtVaEFA1NL6tHQq9X/inFJK4jXfPo9eG1fGuXRm+7uUFFS8SQ1F7Lm
         KDZfr0cWwGFl7/Uikurnnk7eYa49qfJJOZCqTHeAftoM952uuKt45kqC7WTd/XqNBIKq
         32qg==
X-Forwarded-Encrypted: i=1; AJvYcCUAFiv97/GViYTk2dxY/MN2jb0s1EmotIR96PmRcf4OhzDNVo1fi63DNOn6q2PP2xz9xbfzOvkc2H3ffRA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTrRzZUoVyWlUHcx+g7QzSxSHValyWaqVm64nNZ9mqPKUN4xXb
	JttMnHUjv1HEEKPTf0EWNUB/Q0rF4xGrdGkK2zJca0wzxFo2yRBiWtuH5J++oz2XX50=
X-Gm-Gg: ASbGncuP6Ms0ggIZcRYNQxln+z+7vD0ofeH2k7jfudIALmuMbpLRElmb/xDwgMn/DsE
	s7inQNr0noRs1Hpd+VDfCAwNY0hjyzSTxV8Y9KHOH51D8suBorrMARHxNApYhwoYZapuRdO0JMs
	mitr6dprwZ9aWkAP+l/pKIQlMHft0Dl6ibItFqhwhXcQh6liBOk6ZbCIOslpgzfG7+vQWWJXivO
	zMm79kT3pU9wZjb83oPk8czUeqXmF97ttpASDudrCwVIKwTzqvy3BbNolXbd5FX8D17490F4rFY
	oWo94HC6yp3dwfAnS3fBSnLMAhlVqiA+zphtFUq/FPCGhO7M3aGtS+Gb0miQ91wLIE1VHLCJlhP
	ZxmHXeniK9J0Qnj2qCg/c47mzqUtdVNetD50mTprtboh1tg==
X-Google-Smtp-Source: AGHT+IE63ru04iF+eA9B9ePzkthoe1PsuUeCbzbIdwhycOn2XyNJ7zYSmtNyfiB44EQBSpSKYQ6V4g==
X-Received: by 2002:a05:600c:8b11:b0:450:d4ad:b7de with SMTP id 5b1f17b1804b1-4511ecb9cd9mr125640035e9.3.1748961474126;
        Tue, 03 Jun 2025 07:37:54 -0700 (PDT)
Received: from [192.168.0.2] (host-80-116-51-117.pool80116.interbusiness.it. [80.116.51.117])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d7f1afebsm164430945e9.0.2025.06.03.07.37.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 07:37:53 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Tue, 03 Jun 2025 16:36:23 +0200
Subject: [PATCH v8 1/6] Documentation: ABI: IIO: add new convdelay
 documentation
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250603-wip-bl-ad7606-calibration-v8-1-2371e7108f32@baylibre.com>
References: <20250603-wip-bl-ad7606-calibration-v8-0-2371e7108f32@baylibre.com>
In-Reply-To: <20250603-wip-bl-ad7606-calibration-v8-0-2371e7108f32@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 devicetree@vger.kernel.org, Angelo Dureghello <adureghello@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1850;
 i=adureghello@baylibre.com; h=from:subject:message-id;
 bh=m1V9a4luyCqmxst4hAeMv2hk5LxVMC81ZTSMIekPDQ4=;
 b=owGbwMvMwCXGf3bn1e/btlsznlZLYsiw56h49tXVZsOVs7u3tdiwdDf/nZHMUv2H/8LtpwfEv
 /EGfIxX7ChlYRDjYpAVU2SpS4wwCb0dKqW8gHE2zBxWJpAhDFycAjCRg1UM/z3k71Qw8J28dkH3
 eMmC78z5T+fOubQioWfO24vVc/LXbL3F8M9U6MrctPkCW7pqfZ/Zn1ob27zxJeesj0UPdIzabVl
 /JHIAAA==
X-Developer-Key: i=adureghello@baylibre.com; a=openpgp;
 fpr=703CDFAD8B573EB00850E38366D1CB9419AF3953

From: Angelo Dureghello <adureghello@baylibre.com>

Add new IIO "convdelay" documentation.

The ad7606 implements a phase calibation feature, in nanoseconds.
Being this a time delay, using the convdelay suffix.

Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
 Documentation/ABI/testing/sysfs-bus-iio | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-iio b/Documentation/ABI/testing/sysfs-bus-iio
index ef52c427a015cf47bb9847782e13afbee01e9f31..7e59cbd5acb85fd0909c1d56f9d76a84933d418a 100644
--- a/Documentation/ABI/testing/sysfs-bus-iio
+++ b/Documentation/ABI/testing/sysfs-bus-iio
@@ -559,6 +559,30 @@ Description:
 		- a small discrete set of values like "0 2 4 6 8"
 		- a range specified as "[min step max]"
 
+What:		/sys/bus/iio/devices/iio:deviceX/in_voltageY_convdelay
+KernelVersion:	6.16
+Contact:	linux-iio@vger.kernel.org
+Description:
+		Delay of start of conversion from common reference point shared
+		by all channels. Can be writable when used to compensate for
+		delay variation introduced by external filters feeding a
+		simultaneous sampling ADC.
+
+		E.g., for the ad7606 ADC series, this value is intended as a
+		configurable time delay in seconds, to correct delay introduced
+		by an optional external filtering circuit.
+
+What:		/sys/bus/iio/devices/iio:deviceX/in_voltageY_convdelay_available
+KernelVersion:	6.16
+Contact:	linux-iio@vger.kernel.org
+Description:
+		Available values of convdelay. Maybe expressed as:
+
+		- a range specified as "[min step max]"
+
+		If shared across all channels, <type>_convdelay_available
+		is used.
+
 What:		/sys/bus/iio/devices/iio:deviceX/in_accel_x_calibscale
 What:		/sys/bus/iio/devices/iio:deviceX/in_accel_y_calibscale
 What:		/sys/bus/iio/devices/iio:deviceX/in_accel_z_calibscale

-- 
2.49.0

