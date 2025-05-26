Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B541F463A
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 10:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748253886; cv=none; b=tb7EGBVPGKB/7WiXQYFBd4FcWfEVAI+Dbs0E9V+Jpomi328Plou/E8rB5leA96bL3rEKk3s4QxGq3k8+7o7BZaI1b65PoE0Ro3U7SRfLGIDH8Y0wVBGs4CefOjMcqCO4wSxYMgE2lFlnqBgE/0N9yWcXyqYH/pRf5Mg7EflKBFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748253886; c=relaxed/simple;
	bh=vFlQmUYfvlbdocc1660HFvFkLaTTtU9EJLRp4LGDp64=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YdmP3Y71ebaTn9EVWFVxccCyT/QyHjQder1k1TLJHRwOL9xq6/aLH8EcujK+fuGcGktT/ENoEeP6CpP9R9BtqcswDaSCP30TBTYxq0KODzaZIWiQIF7IY+9FWVpesMtL2vBUKp7GCPceqS1UF8nX419kcL7ls27MpitflEYc4xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=SgetagGs; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="SgetagGs"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a4d877dfb3so922481f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 03:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1748253882; x=1748858682; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q8aakW4/a4S4nlb27SNIiYOlQ/gC3M9NtCJYtqbcxPc=;
        b=SgetagGs8PSOW6gjJUzHNSL5KPbyJ1sL9I2V/IWqwD9YnWWb+38p2+oQ5gavmbAq2R
         Cos+w2j0ZKhg7kX6jByUIJe0/VkA0DW7Gh+YevRwbNaSY6L+AsWY6l7Hh6ctUTCK34Fa
         zYwtbajXaADGRALvhHLSEQLtgfD7E6zJvvSP27ZJcJH9aSK3nrTHNGAfVLQ1QIkCGZ92
         VOzV4eNytJypC2RL+fhijepz5q6co6urg0mTcKb0/fglon9LLv3etlyz2oXCNUMzdv1A
         7iDLafPdp561ZoLxGNWDMhRB+PHnnU18E3shRmU4hudOlmx75TP1k1fWSzzovZUCOoed
         pj8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748253882; x=1748858682;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q8aakW4/a4S4nlb27SNIiYOlQ/gC3M9NtCJYtqbcxPc=;
        b=Ddlxte+uURhMcEHh4yYalhbpbHjE9ULaVgsmTGM/6hX6yRmc7g321wvlStAvi1YUjI
         0wgAlMc9EHf373Eo1PwQLvYRLMfep2FsokT5etYUat3zlwQuDYbdnbhCQGtY3P354UrY
         Jq5eKgYxsycu9R6fufXF5oxP+ewbjAvnuBQ9XKcq4ow+NJgDEAEqtJVD1MMdl3wVq16x
         l3+8j+klwp98XC3/zjYtKtWqktMA5mxqZEl9oVnz19LICHeUgvkOaU5ywqpFaODcOXMx
         zCIn4un/V9aqTNFztPHhpj6ov7LwYYVpN3Hj/s4rz1hQ2v7HUKSdxXO3eqQDXgb/zeIC
         /iFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnKCzX9RsGm2o/rMVc8PmvpCPLs59xRBziRWNDVqfWD1FiwRSftECMhzEgN8IxZA9zMLI54nNOZh8uHi0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyeMO/eQzLFwi/lRuSaZcLGLhY3ReFowgjIQEjS08T/Zb2GttVc
	q/VgdS9y8xF1MkFM8iqOR3YWmYBGiANwuPkG9GecyoORxazxpSgi8FTZ1zUdRqZEtMA=
X-Gm-Gg: ASbGncvxwFpgfOEXjwtz0kuD8cYrhVCT7mKVOCxPxlpigjbwHILQ3LNdWYWnE5PazPJ
	ePzTCrqT0HuGNpK+ouh3dJ+v+1I3cfbyOGE5e3D8mjBulYEmSi5RJNB5z/CBJUfTXTYEcjM5XNN
	w/on7zi6F08vo5b03aERQdcmCS4RuEpTsKfKM720pogLtFkYD6/UeCkp7WlOIWoWCIJ12gXd92S
	flkTZAMHl9lyY0gxFX9ux7Pl/tXCWHQf7hYD2h1vLijc9dtzqJb673BPJo3pnY8rP4MUddPB6uY
	oOXkZ5G9BNwKGgmH2ltddjog3+6oak6307bh/uTRex1sC9tGpOocRWfTworBBNK8qpj7Ub1pc3R
	dzND2HnPUiMLOri+A1KaEZFT3ufVa528=
X-Google-Smtp-Source: AGHT+IHV9Jp069LZjK2ZpV1/c9KQ2bNBfj2JjLVwtRuY/y1IZo9228sqOpSdgVRYYQ5s3ofRpZ1qNg==
X-Received: by 2002:a05:6000:2890:b0:3a4:d7ba:940f with SMTP id ffacd0b85a97d-3a4d7ba9678mr2708636f8f.8.1748253882426;
        Mon, 26 May 2025 03:04:42 -0700 (PDT)
Received: from [192.168.0.2] (host-80-116-51-117.retail.telecomitalia.it. [80.116.51.117])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca888fcsm36141834f8f.78.2025.05.26.03.04.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 03:04:41 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Mon, 26 May 2025 12:03:16 +0200
Subject: [PATCH v7 1/6] Documentation: ABI: IIO: add calibconv_delay
 documentation
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250526-wip-bl-ad7606-calibration-v7-1-b487022ce199@baylibre.com>
References: <20250526-wip-bl-ad7606-calibration-v7-0-b487022ce199@baylibre.com>
In-Reply-To: <20250526-wip-bl-ad7606-calibration-v7-0-b487022ce199@baylibre.com>
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
 b=owGbwMvMwCXGf3bn1e/btlsznlZLYsgwscm+fy5Mqzei19Suf4fkFLsQo8JKtimLciJnL1fVv
 jD/l71ZRykLgxgXg6yYIktdYoRJ6O1QKeUFjLNh5rAygQxh4OIUgIlcuMHIcCtPn2N1a1fJdps5
 zQYczLLeXObN5X1tyVenx8b8/N27ieF/za/ClMUGpWdEI1I6DNz1f95U+JrCdjH5T39aaHUP6ww
 eAA==
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

