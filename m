Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FF0C274658
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 10:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747649735; cv=none; b=dWwhoZIvdOl5aEZdkrFrA8pYU42ujPCL+RxAwfiovB8gTqStAG5ocr+WOz7NbkbanXnI472o+YaSo8QunbXtOnvRnTUYnhg5ibdpjKeT2zeX6ntZH7tPAuUgFeQYkxOWZ+oIGL7uXB1dCIKuUmdtYpntyr+2afM0QkBmF9T0zd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747649735; c=relaxed/simple;
	bh=kAXfCDDkqD0YIX5fRdivLoZDb1cS9/ZqEEtcHuRvJc4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uNXGsoydAVpndlCzLlVR58ZAssEPEOj9zs0eZLVI+p0uu9rDJNxN5QuOnqDUeu1hU57nQCCTw9JK8G5kijtZI+H+SEAu5JkjaPA4N4XCTUXzmbiJkgwgG7fh1jDBp+bn92Ca70Cn+fBCVOIqe+98Z03FUDjvu0K/NArDl3rZRJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=gvQq8HzH; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="gvQq8HzH"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a375888197so222388f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 03:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1747649732; x=1748254532; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fCnfzj1ToVJ8veFs1TqP1KJeHenvC/HvjKycXP/yVqE=;
        b=gvQq8HzHrxAwosigLcKy+tRLlQSxdstOmMmayhHeowy7WvjKNfMUJCNqj3VIfLtNH5
         13kQ7eptQkqs+PSXdIyQ5cuGAh9ZrIFyj0dzASNro6XMp6cbm24euF4aSFADsKBXs39n
         VHDPyM6rZFUf5Ed25roBhiODBPDuqWpwXqVdKAJ+ppxpXtb9gi4W6lbcnAbpLq5UKaIm
         7RgvWmO8/FkhgRCz0wJfATYlXRm7MiT25OaEqTtbLGZ4OAzOlzcg/vBurLeBsTxNp4b2
         oJNv8eg7mqpcWa2/WpLcrYwsffuyOqrA+mCnzeOuI3hCEwXpe7DG/k3/g2QvMl/elbKH
         Ia6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747649732; x=1748254532;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fCnfzj1ToVJ8veFs1TqP1KJeHenvC/HvjKycXP/yVqE=;
        b=r6J3/Dv7tFd+42mFYoFS875J/BTY58pdZbfjW/pr9Gafl9niJgv5SZFf0SREsQWpm/
         IIE4uX7BP/hVTTOVa9smc2TXHaACmv6lJzczfT758FtYStGwDeA1lvgp9Qwph46d/iTs
         UiCpbdVDEtk3lsC/9lpA4PJbRBWaXbWjfPu80qnu38V6dEtug2qSPfvwrI8XzUQlPrIQ
         v19an0lkt8/rbj93HPLRS5TgXa85KXtFn2TNJhjTdcPYLT1+ULQQV2TmeCZYmkXrEr4+
         7intTsmoLowVv1cRK0ac/ixUwbyM61LbPA3XcPjbisB7HQAfYfV2dS3QaP+1Gs27ZQg0
         ALbA==
X-Forwarded-Encrypted: i=1; AJvYcCWRNHWMvBulSW0pmYptA0dL9xITCMIIvgpRn3FyQJRZG+Pl3BeRI4nurH8fO68+azt78Ok/XQiCDTatRcw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyD79N7lkH9laDGOSbEph6MLxYrb/Fss5vs/wrzBIA+KniXXJK7
	xB13uFUZF8tI5tTXQeEp0pX7zp2VfKPjbCMrveH6ICLkidakh3Ty7IZVCANfZdSQB54=
X-Gm-Gg: ASbGnctloTTl1GEoqvDl+pKw2gEe//7BRGiNeHO9nFNnZqou5wSBCned9D344ns2IL5
	V6iRtF1rjaw6BWhs6OP/ST8Wnahen2/vB06kNMhJ3tO2B+YT2oouV8xIl/bsmbm8jZwjoeIAmQZ
	7SB2Ywum7YotcA/qVUKB9x+ofcgHlLsCITs3DK1yPZvfSCAuS9fcWXYvyCMmyznczPn9YIwRL3o
	RuazoN3lhafL8wWMh2DjdLFOedtnI3ygEKwWaFyuPSj8OUHxx0FcGNQXLOIaNr9HoamPbudCP3F
	uQvUvwDOqCBEVVswTkx2Y7E7yFGzYO6lXIEEl5g8mfQmQNyprz7KxUOBNUWE9g0zY0JmaTuhZN2
	tvWoItIoNPygqxNVlEegDRVSlYM6/Qhw=
X-Google-Smtp-Source: AGHT+IEkeNEpFV4F4DukOo+8s4LSL5goJzYTBy9MSihVWCaRY8jONp/y+12U3eIyMbpPCa2we8wGpQ==
X-Received: by 2002:a05:6000:4313:b0:3a1:f67e:37bc with SMTP id ffacd0b85a97d-3a35c7dca79mr10651186f8f.0.1747649731714;
        Mon, 19 May 2025 03:15:31 -0700 (PDT)
Received: from [192.168.0.2] (host-80-116-51-117.retail.telecomitalia.it. [80.116.51.117])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca4d105sm12499021f8f.11.2025.05.19.03.15.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 03:15:31 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Mon, 19 May 2025 12:13:38 +0200
Subject: [PATCH v5 1/5] Documentation: ABI: IIO: add calibconv_delay
 documentation
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250519-wip-bl-ad7606-calibration-v5-1-4054fc7c9f3d@baylibre.com>
References: <20250519-wip-bl-ad7606-calibration-v5-0-4054fc7c9f3d@baylibre.com>
In-Reply-To: <20250519-wip-bl-ad7606-calibration-v5-0-4054fc7c9f3d@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1861;
 i=adureghello@baylibre.com; h=from:subject:message-id;
 bh=WN6HkM4XgPmjxefJhFewSDj6qFVZk19CADasf1AQmr0=;
 b=owGbwMvMwCXGf3bn1e/btlsznlZLYsjQZol5vdl757rEBKY8s/9MKk8Ze+XZkpdHzDG+kv5cZ
 KqkGmdWRykLgxgXg6yYIktdYoRJ6O1QKeUFjLNh5rAygQxh4OIUgInsW8nwP4736t0wBo0JtdrO
 SmfirR6Ka8y0VZ+zzOurms2nK7prVjIyXF5wLK5dLoiJ49E/VlvFzCY3zdo0iSUhprvXFPPLvHN
 jBAA=
X-Developer-Key: i=adureghello@baylibre.com; a=openpgp;
 fpr=703CDFAD8B573EB00850E38366D1CB9419AF3953

From: Angelo Dureghello <adureghello@baylibre.com>

Add new IIO calibconv_delay documentation.

The ad7606 implements a phase calibation feature, in nanoseconds.
Being this a time delay, using the conv_delay suffix.

Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
 Documentation/ABI/testing/sysfs-bus-iio | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-iio b/Documentation/ABI/testing/sysfs-bus-iio
index 190bfcc1e836b69622692d7c056c0092e00f1a9b..4cf482eca3d8a0a80b051fbb496f82f836ab76f8 100644
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
+		I.e., for the ad7606 ADC series, this value is intended as a
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
+		If shared across all channels, <type>_calibconv_delay_available
+		is used.
+
 What:		/sys/bus/iio/devices/iio:deviceX/in_accel_x_calibscale
 What:		/sys/bus/iio/devices/iio:deviceX/in_accel_y_calibscale
 What:		/sys/bus/iio/devices/iio:deviceX/in_accel_z_calibscale

-- 
2.49.0

