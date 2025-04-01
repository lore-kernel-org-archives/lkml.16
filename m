Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65BBC21D3E9
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 22:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743547846; cv=none; b=uNBMieDiKgelpehJFRj0HDItop18I1fLdG2QcC0+i1c3wBy7b0PFl8hq45isur5nUwqcbkT+zYfHeE5wWX/Lj2riqle8m5PZ+t1B1Ai7lholNwpULK/t5soX7BQZbRtIV7of5zglnFRC6FsQyFT06ntDKoq5usSduDf3rjSeO88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743547846; c=relaxed/simple;
	bh=l4ovhFo/GzqCAr/tJep6ZW+QzYV4DEuHtmNsouGPBYY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YcFCl1EtwRmiBCuwNQHObdUa9HRr/zj6BThM8IKWe0WpXovTul5MN4qnSRQ3XlutqR/0wsZ+f74QJPQprR41AX4zRrXXTTYdFBRLfR6JQT/oTbt9f8quH22aDX2thMvU2M/MzIybkwYA4yX1BI902zMOgWSuK7wwZCJWJXJCNyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Ftxaf8Fu; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Ftxaf8Fu"
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-2c72cb91e9cso175481fac.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 15:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1743547842; x=1744152642; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nBCDwaIxUQd/u+f/hpgM4pDWmpkYUglr1PKpMsLAoic=;
        b=Ftxaf8FuQ49cmFyUjyzNc5t9IR71aC6bJ+k/VcsagAtpUWDOLkx22ArEGiEug6CHAP
         dEywpVTsvC5ElTsFqHrlGwbTOYM5OKi8Et+1hgqwqrtg09NKWF5Ei+cAXNoLYCFMkeS8
         sV7YPT/qCWpf5gZU8PyuzoKE5/na7+ZEcIoTtatTfF3rBGXENK/VeBk5RPkxdkzooRFZ
         EcoM/H52az8JHBUVaaEdNWSvXLjmdgszFonU3Xp2lAuk2kY82VmdFX1HbejBHZuiMSaV
         DKukjbYUT0ImLHhQSumUQJ0qn/2DbNrI674DG29Tnv/ZpVKDTz+lZpTouvsqxdKhNQV1
         a8BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743547842; x=1744152642;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nBCDwaIxUQd/u+f/hpgM4pDWmpkYUglr1PKpMsLAoic=;
        b=wRMVPGMR4ryZkA2COxMC2XRvm83mAiQgjn2uGCcPe5B5zUuZovXonpYCGpn1gEews9
         aMvHQyi9cHl2DqjTm0Ng6JVXWK8YpNi/bUZrgkjbJwBYD8336MgbQysuNmaMolxhG6kZ
         H/rjeTuX/nKWBU/ozNFx+xPkLlpNbJ95eNnRvh4s0iOBT0vh39g3glxf2PEqFXgvOTCq
         y67b7YL/Z2RxWEnxmjFVeusRHVW4mztHyDS4QTsmTd+O01Yf3kO26z3QZN/8YLs/cNPQ
         aNu1aweDkQZXX5d6W3Pn/yZQ9P1/uvq2wwIxtPYU9r3T9GaMFhJt2JlIo7XgDuXNWvZ6
         mGZg==
X-Forwarded-Encrypted: i=1; AJvYcCVEzXb6rh1zDBWzc6lF/Y54UFWIQB3nHpMzmAovy8Mz9OkIKaVjDpscOBn91DTGAfk38A14CxS9/Rgk4M4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxalW/E/fM8dU20VkqbK/q0Ft1YFGNv2Yzs3XHnN0/i45Uy0ada
	qgxYvO9B/oG/8TZqwtgB1LhkP2giq/QW66ak5G7Ty7eibiITSUEl3J6LPvAliX8=
X-Gm-Gg: ASbGncux7AIxf+zOudr8ShI8iby157WFVfh2s6ZNwf/mfrBigzxyQo67irxTVGphI48
	cd8vBFBVjHwPb0cVdhPqorwcI9zN5zaIpkRQSmAvrzQJBbHhZCxRUGx/A6TV2W0okG1n118unUR
	iaPO55TVXiZV/EcZQLxqvDX4r4ou0jSOSoaF6L291CAjlGbcB1tSFlY+y6H7dSmkVfDtHM0D9pz
	UXEInjdaX9u8ettvt3e/2rSQQCK957iLI7mZ4HGR6/K2jTer9NpRkrmboDx2vqOwbwvN2CM2rHt
	pJX7Ri/b6gf+fme6IdqWkabPvWZ2q+8ZdXq+ajm1aIpmau/mb7NHLeVka7wHp2Nn/aZMRnLDTeg
	5
X-Google-Smtp-Source: AGHT+IG0RQHyDvXPFu8JV/9+WZdcEeqrgyW20fSgLeCJLHlRPKjnuoZzwGLndZZ6UfK8jDOTJsiFtA==
X-Received: by 2002:a05:6871:aa0f:b0:2bd:607c:c804 with SMTP id 586e51a60fabf-2cc54fd24femr1065837fac.6.1743547842472;
        Tue, 01 Apr 2025 15:50:42 -0700 (PDT)
Received: from [127.0.1.1] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2c86a860267sm2541894fac.36.2025.04.01.15.50.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 15:50:42 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Tue, 01 Apr 2025 17:50:12 -0500
Subject: [PATCH 5/5] Documentation: iio: ad7380: add AD7389-4
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250401-iio-ad7380-add-ad7389-4-v1-5-23d2568aa24f@baylibre.com>
References: <20250401-iio-ad7380-add-ad7389-4-v1-0-23d2568aa24f@baylibre.com>
In-Reply-To: <20250401-iio-ad7380-add-ad7389-4-v1-0-23d2568aa24f@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-iio@vger.kernel.org
Cc: Michael Hennerich <Michael.Hennerich@analog.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Jonathan Corbet <corbet@lwn.net>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1360; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=l4ovhFo/GzqCAr/tJep6ZW+QzYV4DEuHtmNsouGPBYY=;
 b=owEBgwJ8/ZANAwAKAR+K+IyC93wDAcsmYgBn7G23WMhCW7TbNSZvazzPiomXbl09MZazclNtB
 fCYnNnM1zSJAkkEAAEKADMWIQSKc9gqah9QmQfzc4gfiviMgvd8AwUCZ+xttxUcZGF2aWRAbGVj
 aG5vbG9neS5jb20ACgkQH4r4jIL3fAOq2g/+OjQ17WKD87fY99tB+cemDltxMECfTBSuDgl8osf
 /FWPmdyiaR/AWO5B9bC1JRXevV31aslR861AdpEmjzcUEEYwJaUfce7VnRFrTDB7wfz6/4m+oFA
 RojezRzqmUPMZjtSUhRELY6O9N9NHA3c0Im8959uL1N3RlCV4eFX6Rxv3U0I21OYTN7kutRcyqM
 DH7j1P6wFnBD86mVNukSIAPgy9l4iIOpfzg9Kr8B2I5GBUItHXh9YrCcKaQah3usts0UDSGNtz2
 CJPOsdBJa3ccu2dlzBp81K5sL8EoavDVJYHgen3fowvsw6ypXqFw4C6N6KDmEdAXRYlnnEeQo1c
 zxz1lbFaoE7Cfnm9gZ/x8Sktwliobva92+S/ZEzUJhLMVXCo43STxd0n0iEP5mdsZZQVpIeeI3W
 JPYj4VNKj5yZILUTA+Rf3Bq1/YfKgG1E9E+OeFUCB2Qy+3HnRGmMed2lj8HJ5fqpg9ytDGjvgMl
 j4AOGGmmTZZ50cJxSqBji2uq3rRqetlqzAV3tmHQl/CjyfIfr8CgLhjCLdKGWaUSnptxazRP+Hu
 oywwWA2266i+1QH3rf+nOpP6vMGZhg1dbvPemWc7vVsEwX2y/+oSZDF8ZAKipXsluVNwrzUoJnr
 qGzVhyUpoFvcU0b9VcXDGokYp7hDHe1loXC+alFkhkz8=
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Document support for AD7389-4 and it's quirks.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 Documentation/iio/ad7380.rst | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/iio/ad7380.rst b/Documentation/iio/ad7380.rst
index 24a92a1c4371db6b59ef47edf06cee860641ebbf..d51f9ee3e939c9d33515ce79701fc7c89f5094f2 100644
--- a/Documentation/iio/ad7380.rst
+++ b/Documentation/iio/ad7380.rst
@@ -27,6 +27,7 @@ The following chips are supported by this driver:
 * `AD7386-4 <https://www.analog.com/en/products/ad7386-4.html>`_
 * `AD7387-4 <https://www.analog.com/en/products/ad7387-4.html>`_
 * `AD7388-4 <https://www.analog.com/en/products/ad7388-4.html>`_
+* `AD7389-4 <https://www.analog.com/en/products/ad7389-4.html>`_
 * `ADAQ4370-4 <https://www.analog.com/en/products/adaq4370-4.html>`_
 * `ADAQ4380-4 <https://www.analog.com/en/products/adaq4380-4.html>`_
 * `ADAQ4381-4 <https://www.analog.com/en/products/adaq4381-4.html>`_
@@ -50,6 +51,12 @@ ad7380-4
 ad7380-4 supports only an external reference voltage (2.5V to 3.3V). It must be
 declared in the device tree as ``refin-supply``.
 
+ad7389-4
+~~~~~~~~
+
+ad7389-4 supports only an internal reference voltage. ``refin-supply`` and
+``refio-supply`` properties are both omitted in this case.
+
 ADAQ devices
 ~~~~~~~~~~~~
 

-- 
2.43.0

