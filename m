Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E43E43AA9
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 14:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749219643; cv=none; b=oLIbjVyJN6AsrEk3tLkmusogcDdyEcbfKTXOO4EDwhg7Jb+DG9NzWvnlXO+SBueKQoFPMGFBbr8DkXfV2G2tUGrpLGds5gkWoMqb5rSESYkAxT6Ge3rg22L6bbpiYvOUyKId/MiVWc0B1MS56ixomHM3FKxfyCBuhvy6cmXB/HY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749219643; c=relaxed/simple;
	bh=cBfFaDkjp8cn9ZsqfhZtThmlU0g1ewE4x6fWUwfuIqQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VLvuhF/pq5JupQPwx8sZdzT7WkI/MU2y+CAUCao/7rlQ2CGThhemh0S1g+iMYTo0EFzs00ws0Avh3D3X5aus39Ty09XbfaLHfOYCWpCNqvBY3OF2x9shAp/pxDi7+9WDy5azzfhDPW72J43tx7KXvrXQ/I32dqhL9X/5sDi9TSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=UG8149b9; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="UG8149b9"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a5257748e1so1566326f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 07:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749219639; x=1749824439; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wv6YLDN8CkaWn53LtM3+C3UNFVc2t/n3NaXm0d2EaQs=;
        b=UG8149b9fNLK5R4KGiFmRknnZ6FzjNFeG66lQutYDTAOVR01SaRXfQO+DYTBhAXI88
         DRMJ9gs7d30XCyTFG2raeI2hC0g5UhVEVN6I63XdnaABMxzXE9wkZIdO4pLWvuNNsPMG
         aHqqAxzJPmb1GhpJ63DrPli9043LJvPyJn1LoV4FjnxEJsKcl/mHQZ2z5OWQiwSVv850
         LG0fnQSk7m8oRwCpwUmNwdDjiCCKxYeDr4fi29wK3jqbWOwhrirKRfRdnhN8r4b01BlS
         mugAeabCugtAgWboTHKQrZQqiKNFoCHusWgwa77ial02NiN45eH+xj7gpg8OonKAC83c
         6zUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749219639; x=1749824439;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wv6YLDN8CkaWn53LtM3+C3UNFVc2t/n3NaXm0d2EaQs=;
        b=q7QvF7Y/N4GrPOSZgPebp8U6sxN42eT4lkSaqIdL7CN5tDBnGKAXhDVLq/cp5/Ijrl
         Pwc1zmYb0zmjtnHa9MNJStTZmvqBw74SGXygvzgwq9P3c1IPAEeWrk/D2NajE5KtaYlA
         jI5id6XT4+8mE2pTtXnFIdJgNAAG5vDtSzorA/sr8BNNc0O14dartRQfkyxFC0HMQS1T
         rTEjCCW6zAIYmYkPgTviPwz80Ow5DWSY3lV++VFY/zGNvEpu4whiQ2siWnYOs3twq4t4
         FdRsBf2ycHKCMqnvxIJ4goqDHeDvWMgyMy5vw8DohiXCXKnzzlv+wTVHqyE0RSr38uzy
         4nwA==
X-Forwarded-Encrypted: i=1; AJvYcCWoLx5w5giPItAJrNxrObIwb2pVjRALWB4cVEb0cVZkNxKwpljqzVaX2GyC/BON6ILHpDkoKLK5wfpQYeM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyih0D9/cgSKdjyvEQt+9R5gGxDAG0vgaTTINcaCn8I211dNUtj
	om1Ss4YXMv7Af97F4eZsw9DEs0Mm3TZk2UPOd0yzx/21sk53fJWElViOHkm2dNl5Bds=
X-Gm-Gg: ASbGncuQNpA2FtkvKDdhS+AMEUnsNAqulKfC7A+NwEsX7PB6PB9le/YmbgKL1ADNeun
	Oe9oM0WFo5+5OtdjO4Jo4/mMNcSqIhNK2QQ/NFLJPpmh9orPS+yPHsgy9z7AjlXpCkDRmkOf288
	W1cKRT92UnWknW5EfcvItwJ8ND+w8wcayp0hKTz0W8lI7Y/XyaVR4GuVh6d+Ebf613gHOB9XErN
	48ElNTqETjFhWTB9EJrGHVaFq/asysAPFtd0jobKjVo5+B+EbvvJjgC1s301oUCxnpBrOkCmm6F
	53iR0opClq2JgFmNDYYpe4y0390z8scDC/N5U2vFF3YGyhczGcOp9tG5TmQzDx0bwVN0YexFBXV
	VMdk0M+Cn++nxJQS6tk7N+mET2QNOJlk=
X-Google-Smtp-Source: AGHT+IF37F/jINDH7H2db1udG2JDyKrV0755zPZUiYV6DkuZZCp3DPM5k1KeUHEdsmDsp87Q/GpBTA==
X-Received: by 2002:a05:6000:402c:b0:3a4:ef00:a7ac with SMTP id ffacd0b85a97d-3a5319a7ae1mr3050442f8f.45.1749219638714;
        Fri, 06 Jun 2025 07:20:38 -0700 (PDT)
Received: from [192.168.0.2] (host-80-116-51-117.retail.telecomitalia.it. [80.116.51.117])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45213754973sm25686345e9.35.2025.06.06.07.20.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 07:20:38 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Fri, 06 Jun 2025 16:19:17 +0200
Subject: [PATCH v9 2/7] iio: core: add ADC delay calibration definition
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250606-wip-bl-ad7606-calibration-v9-2-6e014a1f92a2@baylibre.com>
References: <20250606-wip-bl-ad7606-calibration-v9-0-6e014a1f92a2@baylibre.com>
In-Reply-To: <20250606-wip-bl-ad7606-calibration-v9-0-6e014a1f92a2@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1303;
 i=adureghello@baylibre.com; h=from:subject:message-id;
 bh=1bBjL7VlkgNBkqwPeVPqoUWRyRoNRlMdTRY5+MPjmRY=;
 b=owGbwMvMwCXGf3bn1e/btlsznlZLYshw+vFsApPX851X8qwZrpmor1L946L5+tWTw3/7b70/O
 U9H6Qz3hY5SFgYxLgZZMUWWusQIk9DboVLKCxhnw8xhZQIZwsDFKQATCdJgZFh/4nRgUMb+5VtC
 v7Kw/y99EpjQ33j33YqJ+tWhbvqlNlMY/vDUf33NZZjpeqDu9JoQha+PfRLsjxk0HTnvP2OmSfa
 2x3wA
X-Developer-Key: i=adureghello@baylibre.com; a=openpgp;
 fpr=703CDFAD8B573EB00850E38366D1CB9419AF3953

From: Angelo Dureghello <adureghello@baylibre.com>

ADCs as ad7606 implement a phase calibration as a delay. Add such
definition, needed for ad7606.

Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
 drivers/iio/industrialio-core.c | 1 +
 include/linux/iio/types.h       | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/iio/industrialio-core.c b/drivers/iio/industrialio-core.c
index 178e99b111debc59a247fcc3a6037e429db3bebf..f13c3aa470d774bfe655d6a9fb00c263789db637 100644
--- a/drivers/iio/industrialio-core.c
+++ b/drivers/iio/industrialio-core.c
@@ -188,6 +188,7 @@ static const char * const iio_chan_info_postfix[] = {
 	[IIO_CHAN_INFO_CALIBAMBIENT] = "calibambient",
 	[IIO_CHAN_INFO_ZEROPOINT] = "zeropoint",
 	[IIO_CHAN_INFO_TROUGH] = "trough_raw",
+	[IIO_CHAN_INFO_CONVDELAY] = "convdelay",
 };
 /**
  * iio_device_id() - query the unique ID for the device
diff --git a/include/linux/iio/types.h b/include/linux/iio/types.h
index d89982c98368cf72c0fc30fa66ab001e48af4e8b..ad2761efcc8315e1f9907d2a7159447fb463333e 100644
--- a/include/linux/iio/types.h
+++ b/include/linux/iio/types.h
@@ -69,6 +69,7 @@ enum iio_chan_info_enum {
 	IIO_CHAN_INFO_CALIBAMBIENT,
 	IIO_CHAN_INFO_ZEROPOINT,
 	IIO_CHAN_INFO_TROUGH,
+	IIO_CHAN_INFO_CONVDELAY,
 };
 
 #endif /* _IIO_TYPES_H_ */

-- 
2.49.0

