Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2A3255F31
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 13:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746192505; cv=none; b=gVyBYl1tyKkme9uA5kcXHkOFhQ0cEWhqbN7XvTfzSNk5QgtKAxssl09+nCYOi036v4blh2GUoue/Cfhis2Lt1lajVAldTfsWvknk4nq/YJIRnQs+pfSEVKC3vMLv/0tSihA3qN96xukRJgEMhjUSSVuOz2AmQoCAVjnNfNTf2PM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746192505; c=relaxed/simple;
	bh=658K7PIQAHWTeqfub9IF13mtqppos+JQfTxA2DxmiaE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C1FLuyri/3BL7sOhXKndvuhSxlNPdzGULm5AajGVzy2VU9Gf7xc8w4vBHPaoNdbJwdAf4Hzh1FmRnSzAIbxoIq19Oa52d2PJaSPngt5vfDDjjzOBXcO4xaQK5y2jFD8RpP6hzDMlAs5+Uu5xB3gm86wQOyDlF70KWHE/vycYTRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=1eDjtNld; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="1eDjtNld"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43cf06eabdaso15493555e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 06:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746192501; x=1746797301; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ko4XzeCfRxJSYkHXmEw3Kq0LMIgaczU2YUNiyT4rRrE=;
        b=1eDjtNldm8tMy9RxoOFMgP6OAgIFzrkF7/GvYQIk8TfhlK5/oe5xHT+MWj9QeMbcOM
         zGu2/AdEfmZa8id8ipYIgcb1qEo0+I+YsEHXtkdMx/qh7UY60+wPXEwkHvfrfF+bPoyk
         ToNGadSwnnsBgEa4s8FHvQoJBuAAGozLxkw6KbtAHem5LL17swLlS44h2/bBSnjImKYX
         1LnHXRtysWDUbQ12AIK+c+YhcYfET48DQ16GyD9eaY1U533lDBDxNBJ+4caa774D2Tjm
         wDXeuQUW89BKnJe5uG9yaz2EOqeVvZ6BTqEQ6SeVbyb4q/btMHtO+gO+tQtTPLi7gRuU
         oZCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746192501; x=1746797301;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ko4XzeCfRxJSYkHXmEw3Kq0LMIgaczU2YUNiyT4rRrE=;
        b=wIjlRe/9tNUtpxXY0CC6Tj6mxudFf3iQtDnLp2gS8zvEmJ4H+yu9oq3VVKvpngqI0j
         s1nrAj+Y1sBWH21L6A8XbCtqIFqVbiekc66dhm2Zf3rp1IVn1kGncJVrEGbXlR8CP6FD
         MkMGGSmbBvyB0r2oFe5gfY8NV4dcu1+UHU8+w2/mjFz6CDxvmliXhZsfzqf/QXipaxVH
         xWnaGL6RlV8XoUrVHRD1D/q3MiR1QDdfwcmLBA6Dvz21qwjnEA7FHwOQcs35tg0lQgQq
         o/ooSmxqU8/rxTt7727tMl/AUC09bRDXWZ9DwpV1zYNZ/OMKxwlTET0eQlllVhoewAUW
         o9tg==
X-Forwarded-Encrypted: i=1; AJvYcCVenOAP/YpXzKO5dQ3USayiXwMvd+COHV0WqC8bZ2dTkRURlVpQoiLYGhcNeQoHYkVyF+f0kGKOMTynVag=@vger.kernel.org
X-Gm-Message-State: AOJu0YzgSoKMiWrxSAjRl9ZWafFdrYhctToTesFK9R8tmpMhzDhtuTuN
	lu6ZxE55g8Koayn6vsKPSEmIqBjnCoaYiKegYtUfB9KBKVblHsDqt+9/k1VCHAU=
X-Gm-Gg: ASbGncvSZBBE5/onUe2lc7WsMMCq/j1qTUdEi3LuwKyUcw1WXgKrHD3fpxgcCEzulrO
	3jEfMa0R+gsxHHaqx+NoP/xkTvxUIzUMq3hipHWEUoqi5CAoysU0ygaz37TdqGNgNwsUP2xx2si
	1SbyeT/F9Ov974AK7pIGUsou5V4U6LE0NxWwhePhdZDqgyTvhvzuBN63PiNe/WTsk7/aVDPbXTI
	bimvjCo6kmx7yJQLAFrYJQf9mR70Xl6Sd2ua4A8GULv3D/5E0Snv5xBDL/YRz0uYatuNmp00ltc
	tyjZBSsv2wU9StR7Eau0YrWjh+c2ihPI2HohRhmlpKuaGN8+MlRe/Bc=
X-Google-Smtp-Source: AGHT+IHqu6npZnoo1tMQXhFVSXZhk97xB8/dC6INz5DWhYGkdMpkf8hKdcZ1b4KvlUg5Gi4OtXX8tg==
X-Received: by 2002:a05:600c:4688:b0:43d:300f:fa4a with SMTP id 5b1f17b1804b1-441bbeb479emr27826105e9.12.1746192501148;
        Fri, 02 May 2025 06:28:21 -0700 (PDT)
Received: from [192.168.0.2] ([87.8.31.78])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b89cc50esm45761065e9.8.2025.05.02.06.28.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 06:28:20 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Fri, 02 May 2025 15:27:01 +0200
Subject: [PATCH v2 4/5] dt-bindings: iio: adc: adi,ad7606: add gain
 calibration support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250502-wip-bl-ad7606-calibration-v2-4-174bd0af081b@baylibre.com>
References: <20250502-wip-bl-ad7606-calibration-v2-0-174bd0af081b@baylibre.com>
In-Reply-To: <20250502-wip-bl-ad7606-calibration-v2-0-174bd0af081b@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1977;
 i=adureghello@baylibre.com; h=from:subject:message-id;
 bh=58Mw58i9Kk13WReJVrGmQuK/NUkXTb5m2i6zmre6waM=;
 b=owGbwMvMwCXGf3bn1e/btlsznlZLYsgQOaG+vn112+GtIo2cm58V293c7jGtN/LSiw3Kbx4s/
 BSw4rHHho5SFgYxLgZZMUWWusQIk9DboVLKCxhnw8xhZQIZwsDFKQAT8W9mZLihs5VFLiXeU+jd
 1Q+TKniS1r4MPPpi6/zT5Z53le7xeb1lZOh7s67f5YUz8xQd8TC+tOOLg390rV5dc8Zyl97lEIZ
 KbmYA
X-Developer-Key: i=adureghello@baylibre.com; a=openpgp;
 fpr=703CDFAD8B573EB00850E38366D1CB9419AF3953

From: Angelo Dureghello <adureghello@baylibre.com>

Add gain calibration support by a per-channel resistor value.

Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
 .../devicetree/bindings/iio/adc/adi,ad7606.yaml    | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml b/Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml
index 29f12d650442b8ff2eb455306ce59a0e87867ddd..d4b8ea51f60be367e79a4db18d932cbca9c7dc91 100644
--- a/Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml
@@ -204,6 +204,15 @@ patternProperties:
           considered a bipolar differential channel. Otherwise it is bipolar
           single-ended.
 
+      adi,rfilter-ohms:
+        description:
+          For ADCs that supports gain calibration, this property must be set to
+          the value of the external RFilter resistor. Proper gain error
+          correction is applied based on this value.
+        default: 0
+        minimum: 0
+        maximum: 65536
+
     required:
       - reg
       - bipolar
@@ -256,6 +265,25 @@ allOf:
       properties:
         adi,oversampling-ratio-gpios: false
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - adi,ad7605-4
+              - adi,ad7606-4
+              - adi,ad7606-6
+              - adi,ad7606-8
+              - adi,ad7607
+              - adi,ad7608
+              - adi,ad7609
+              - adi,ad7616
+    then:
+      patternProperties:
+        "^channel@[0-9a-f]+$":
+          properties:
+            adi,rfilter-ohms: false
+
   - if:
       properties:
         compatible:
@@ -398,6 +426,7 @@ examples:
                 reg = <8>;
                 diff-channels = <8 8>;
                 bipolar;
+                adi,rfilter-ohms = <2048>;
             };
 
         };

-- 
2.49.0

