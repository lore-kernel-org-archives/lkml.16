Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F5062750EB
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 19:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746472954; cv=none; b=dU+RDpDWNuW7j9LVxG8adX1USJumK5xXFmemABlD9qLo/xtchzeUrbWb6FCJAy4H95mE9jU4s5BkXFS4TJiPo+JZyZqAGqd1awS8jKi0Q5XkMMOz9iXmVoy0QwaN+iWpbDcW9JgmF48OAi7T58KqiSPgyQXSd2le8k2YSfJqiBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746472954; c=relaxed/simple;
	bh=dpNYuGn7Y514sf1VJraufXNOQk+UtuKrBSvwhBZtups=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CuUnVFqO4jUKf+i1FdYSDWPGkcgp9QjI4d/1iFg2p8OCpFOoOZ0FWM0An11OoFE5h8v8pgF/raCte1U8lLKMjeyoy7SQJaL7LKFNey2AiUaJ5FuxBXk+F84wHJB/38v2P7BeeFSX+sgc+bUl3/ROtR/3wHDaSKrVpt3DLaorsq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=NRT3g4Yb; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="NRT3g4Yb"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-72c7336ed99so1165731a34.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 12:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746472951; x=1747077751; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YshWpf1FxBsh73RdxUKeKhzDqOZcrz4zqd3LmlcIjnc=;
        b=NRT3g4YbgyZN9s5Y1LX1U4Ot1tQ2lEsORWesAg6xnv70eYb5HC45srMVbdFr0M2nd9
         4duTqlp1Ld9gKfVhBz47D/8EuCjb//YKJn7r8SZNTVtzIKhJyaXoQE4sT87paOdY/NFi
         jIKp9gq6NJzazfAk+NmaSTU8dw/0y8pEX4q1KPgWVU2pyFtOB1ZUnzMz7CZEYQYgCEpI
         ZjhagS8/NeJX4vAyziQGIREuS2ufgu9j44ETmJInanaLRZgY6+VUjS3L8bQ2Dzu4Vimf
         uPSVotpwKvSArEhC5fgIoCrAJMAvdkPmjaBhTbFKNy48mwqD3UlxKosNzJtbB/KwmiTL
         RcpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746472951; x=1747077751;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YshWpf1FxBsh73RdxUKeKhzDqOZcrz4zqd3LmlcIjnc=;
        b=ffRSxqucDk1PFUkeamuNSMO2n1OrcHVBLdgo/WqEtyl1KM3CtoFk74+hqPLfxKMR7f
         2Z7mLizRlm4B/ESlGFc6iHVCO8XHybMauSKIMNNnKQ5iXpTz+6UX9cEwq10jKJceX6aR
         azYoRB3/gaz0w07lASw2t2EudiT3J1nEQpf8mwKx+Y24bBZJDDp8s2HK3b/bXswZFPZd
         J31KZw7/lEmgjb7lqSKnqDbbVlfFeg1NnBvom82z03ZHEDX6oBtXDOop1mS/iP3OfxuF
         p2RO6l7D9nLmCyZtdDjnVrCsfhxRMlchlHGvTS/wWR5PBYSs6GeWDjZJPce7yDkqLMsH
         GQ1g==
X-Forwarded-Encrypted: i=1; AJvYcCXI/keelvA5N4f/utiETnSIP4o0OdnyLQTi94GoLTVbhF6j4TqVf6U2jyTA/m9tFZQcUZ3mc8M4/83/nPw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9JaZwHnBKbN18fqZQ8NvRoPmJa5ivInwzmybOvLgQwMmRKTO8
	AvudpA4Y2lVSQGm1tt5ZgvcuQD1F50gg1tNjMLzfoCOvXqadEb+YIfDQ3K1RU2E=
X-Gm-Gg: ASbGncsfwhp6uWIjgBTB047yritqD/FgJrkkeZzdUbVzqG8CW8tykAXyqL51RrN4m2u
	LseNHG3yn9PMJgnPFF9+R7fC+KjED3HND+y1/WJ1F9VDpbBfHeRAw7RfplEtDGESnWuImdOjJtd
	rNSArJQCFFhU09R5oDCSVs+qDYKg6PrIiHMRxjTbMEprPE0bhSOK3J0K8BBkTaXgyChriqF0rhs
	4jWBmTFbehbbKk8Otnajq4W+Pnt5hAopah+WIUEv/KsVZe4T0SCguwl9La9/0jJOL4SzXXDSDSk
	1Ftn1AX643Iwd2zbcZyy148H1NrwK/4VuYVzMLrn+Wi2Uw==
X-Google-Smtp-Source: AGHT+IGCV8uJBSBkCHou4letYsnwGXYc1cdmAE/9CRy3xAv01oUt3LNOK1PaUpCjZydbnysxI9wttQ==
X-Received: by 2002:a05:6830:2815:b0:72b:9d5e:9429 with SMTP id 46e09a7af769-7320624bbfdmr476010a34.12.1746472951384;
        Mon, 05 May 2025 12:22:31 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:2151:6806:9b7:545d])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-731d34daaedsm1683415a34.51.2025.05.05.12.22.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 12:22:31 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Mon, 05 May 2025 14:20:34 -0500
Subject: [PATCH 07/14] iio: dac: ltc2688: remove bits_per_word = 8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250505-iio-remove-bits_per_word-8-v1-7-341f85fcfe11@baylibre.com>
References: <20250505-iio-remove-bits_per_word-8-v1-0-341f85fcfe11@baylibre.com>
In-Reply-To: <20250505-iio-remove-bits_per_word-8-v1-0-341f85fcfe11@baylibre.com>
To: Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Esteban Blanc <eblanc@baylibre.com>, Jonathan Cameron <jic23@kernel.org>, 
 Andy Shevchenko <andy@kernel.org>, Oleksij Rempel <o.rempel@pengutronix.de>, 
 kernel@pengutronix.de, Song Qiang <songqiang1304521@gmail.com>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=916; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=dpNYuGn7Y514sf1VJraufXNOQk+UtuKrBSvwhBZtups=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoGQ+3nNp5+QaDuoSGNQzF/tELjxev2xwcYHoex
 ewpo5MDil6JATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaBkPtwAKCRDCzCAB/wGP
 wLP4B/9ITjPg1egaCOMT/sh9kFEnTuRrdgGX24GyrYUvccqU25KloXujivOZldfSQMkgf+KFSs6
 kptSm9N+K5WRGcrkMLwfuelAtlc0PfiGn6CZAxhGW5lypevS8wwcekWEBXOLzO94znan5ZZ4Jaz
 XKpGGLepVqp3FDgkG4JfHpVvuzdFvn8BzG8oVYUdQD77H73RJt82YCnn53sWVRtS+3kwAlBq/Yt
 r1dzuWPoo/VC+3e6DbEd3OkYRFTBTtzjVEOpnFdLCA/fQH9b8L86sfoXsFkQM7C2TmXzlS93CMF
 AmhcnK64pdpbRcoUWPjuczBn0UVjWUgJgv41T6NG//I6s1b2
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Remove setting bits_per_word = 8 from the ltc2688 driver. This is the
default value for SPI transfers, so it is not necessary to explicitly
set it.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/dac/ltc2688.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/iio/dac/ltc2688.c b/drivers/iio/dac/ltc2688.c
index 757b4831dc3e7c14574e3d811ba9a48d8350213a..1f24f07d1ad24ac1730da0e03b65207ca5f07884 100644
--- a/drivers/iio/dac/ltc2688.c
+++ b/drivers/iio/dac/ltc2688.c
@@ -104,13 +104,11 @@ static int ltc2688_spi_read(void *context, const void *reg, size_t reg_size,
 	struct spi_transfer xfers[] = {
 		{
 			.tx_buf = st->tx_data,
-			.bits_per_word = 8,
 			.len = reg_size + val_size,
 			.cs_change = 1,
 		}, {
 			.tx_buf = st->tx_data + 3,
 			.rx_buf = st->rx_data,
-			.bits_per_word = 8,
 			.len = reg_size + val_size,
 		},
 	};

-- 
2.43.0

