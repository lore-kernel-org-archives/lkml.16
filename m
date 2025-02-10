Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B99B1F4613
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 16:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739203981; cv=none; b=SD7l7l+i7gs8eUAg+pjHNGANhXQTkkCp3ph8SLO10OcbtdHyaVGdRC9VluNiwHIVtG2vZoZPT2J+jhqQ/w3KDkG2/3N0fsng0VMBULICRBvJ3n6pnpn3OP4PT76Ek40KOF4UrNmEqtaapcssTMq2s0YvurgVi1i45kP5/TBxILU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739203981; c=relaxed/simple;
	bh=EYN2jmjQpt0Relr6D6FUdK13M4l5zeXDuBWC3e77YUw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Lq+tArS2qgZUJfMdDuTuOq/13f0Imk+aGKhDxAiRrgflL346E9CG4cdEsQte+DjBsrM0OVc/Pg6PnzDQumB/xc7k1KJ7wRMlnTom9+0atMoAkkDGe2W97l8fh8QqHmHDyHahh462YRczOseiVtHiNmWbiuGhNsX/s5zIM5mahmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=FPHLrmhX; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="FPHLrmhX"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-38dd9b3419cso893117f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 08:12:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739203977; x=1739808777; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iIjPfuFGXuMmM5B5bh3vlcOXqvUxOsdFQdpkLRhWYHE=;
        b=FPHLrmhX4ts/LCgk7/x3bYH2HAsnyNptf+3hs4tl/l0O/vXV98N6bdaJEht7+q2MHd
         3wv3vg7xXFzhXXQHV7y/pMariaIkHuHrQAlYbBXr9/uFmnIJlTyBw7hOLguJNEp555MS
         cq8woka8YhtXvjRiC+n2PPo3OhHyKy3EuFB2UnSZTkrZfmaIUKnQS8cX3Xe3P5JGVFju
         3l6xIk6/c34RuOSrdbu1N51TKCxYrhSLz+elkzbExhfvWjax/zRQPt+Vs7pFXaixf0wD
         JG5KmNcKQyhAVDSbRGnkzNrA3+2b69hwxcDFdAusbkM67pmSjar7GnH8oqb/0oc/mvN0
         NDCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739203977; x=1739808777;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iIjPfuFGXuMmM5B5bh3vlcOXqvUxOsdFQdpkLRhWYHE=;
        b=k7EkJXzugHWgjKV9JDA0IZno0phMW0GR92eq8ZjTtzO37pdQQv5I53243PBjRzvwUI
         sSBChRPN6VvBGkkWI6MCJuGp5xzg0X33zIqT8S2KtDPaS+8toC0XWOpnj8NipBiZFdoj
         zfQjmPs3L29R7SXp1f6J66vGdkRVtJP6d/qpsCRamTx73Gjnr4KlRTvFPbZPMFXDSRvo
         UnyVTRoKdUjAbzSVt0F+8fT1yIFxkduy/oGJU5+5R6TZDqPQ4uZ/Jeu6SyID0kLDr4pT
         SOHofu9Ydose+bTJofXQquCupSvVZuzLQaeqh6ML03QidCUzkrL1SKhHJUSoX+fLPAm5
         Nmfg==
X-Forwarded-Encrypted: i=1; AJvYcCVQBRDxHmnC3963v2DRNSOY6pWvOhzKMloH9Cvsamv3dqDbK9jjc2iC8BMwftB1AKGLTzc31tbnIWkzWAo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKKmbB1ykS6UujjstgYWBT5oBFUgrGateQRvG4iNuClcVrOQDm
	LpG78ATy0XGmDJUg6cDSp16JgYJrMy8qYGhlgPPkIkvVQ4gclvpWdARwozf1eOQ=
X-Gm-Gg: ASbGnctj9QqoMwEHx6HzKjmsi5J6ZCvGEzKokBiZYVvhd7KupGDhxmQTzvZgYFhvK09
	f+YxbGg00wAH76nodyLiiozQqYXERApkxWOKgLH/skcIaEZ1yZo1JgaqBHc6yAKkVd+6LSeW29q
	rge5l6Ug3cmTJ92oqr+vETVQ3js9Xq1ImiX+gBfV9xi2n9wSnUyUhFbhjftJF1f/15vNpxW2Rny
	b6e3iYzBP8JLBPBfo1m6LgAOwy/UL7gAWWksF0ssz8ogjYY28SKdp6mD2zUGrzdhT8kVk+EwJ3J
	rBh5Q/561dJ66nQmI55GBTGt6lq99ZaW0WdSmMsW9mDABOK1jDpQPvbZ298JDGg=
X-Google-Smtp-Source: AGHT+IF8U4g+gzBJ/cIqcckdV7LgaRgLDwbSHf1t/ZRLRiATW6wIMx/g/+6UZw2NAefFPk2iWnxLJw==
X-Received: by 2002:a05:6000:1787:b0:38d:ae82:e5ed with SMTP id ffacd0b85a97d-38de41c3d17mr166768f8f.51.1739203976810;
        Mon, 10 Feb 2025 08:12:56 -0800 (PST)
Received: from [127.0.1.1] (host-87-8-15-130.retail.telecomitalia.it. [87.8.15.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391dc9ffcdsm146637945e9.15.2025.02.10.08.12.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 08:12:56 -0800 (PST)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Mon, 10 Feb 2025 17:10:57 +0100
Subject: [PATCH v4 7/9] iio: adc: ad7606: protect register access
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250210-wip-bl-ad7606_add_backend_sw_mode-v4-7-160df18b1da7@baylibre.com>
References: <20250210-wip-bl-ad7606_add_backend_sw_mode-v4-0-160df18b1da7@baylibre.com>
In-Reply-To: <20250210-wip-bl-ad7606_add_backend_sw_mode-v4-0-160df18b1da7@baylibre.com>
To: Michael Hennerich <michael.hennerich@analog.com>, 
 Lars-Peter Clausen <lars@metafoo.de>, Jonathan Cameron <jic23@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandru Ardelean <aardelean@baylibre.com>, 
 David Lechner <dlechner@baylibre.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
 linux-fbdev@vger.kernel.org, linux-iio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Guillaume Stols <gstols@baylibre.com>, 
 Angelo Dureghello <adureghello@baylibre.com>
X-Mailer: b4 0.14.1

From: Angelo Dureghello <adureghello@baylibre.com>

Protect register (and bus) access from concurrent
read / write. Needed in the backend operating mode.

Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
 drivers/iio/adc/ad7606.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/iio/adc/ad7606.c b/drivers/iio/adc/ad7606.c
index 7985570ed152..07656fdd602e 100644
--- a/drivers/iio/adc/ad7606.c
+++ b/drivers/iio/adc/ad7606.c
@@ -862,7 +862,12 @@ static int ad7606_write_raw(struct iio_dev *indio_dev,
 		}
 		val = (val * MICRO) + val2;
 		i = find_closest(val, scale_avail_uv, cs->num_scales);
+
+		ret = iio_device_claim_direct_mode(indio_dev);
+		if (ret < 0)
+			return ret;
 		ret = st->write_scale(indio_dev, ch, i + cs->reg_offset);
+		iio_device_release_direct_mode(indio_dev);
 		if (ret < 0)
 			return ret;
 		cs->range = i;
@@ -873,7 +878,12 @@ static int ad7606_write_raw(struct iio_dev *indio_dev,
 			return -EINVAL;
 		i = find_closest(val, st->oversampling_avail,
 				 st->num_os_ratios);
+
+		ret = iio_device_claim_direct_mode(indio_dev);
+		if (ret < 0)
+			return ret;
 		ret = st->write_os(indio_dev, i);
+		iio_device_release_direct_mode(indio_dev);
 		if (ret < 0)
 			return ret;
 		st->oversampling = st->oversampling_avail[i];

-- 
2.47.0

