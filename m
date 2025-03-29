Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D31F1E1A17;
	Sat, 29 Mar 2025 18:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743274773; cv=none; b=YUMJNIl/nx/jY0hzHvToCsbBZrXA4f8cV08OuJ5jphGSDPI5bhRZRDSjQbzI7c3Yvd3FjjLFqRnqUj3CDqpKNGnrVLQ7Wsl4hTrHIBIFAbhXZjNJTL8+0+wIj9q2wuAn3ZvU2R2lM8zcmZzFr0bg3INHOcv06/sBFAw3DXQk5Ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743274773; c=relaxed/simple;
	bh=JeT+Yv20rIC4G1XXJi+Rw60mDZSnWFVaPcn+cM4Asko=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KUra/udsajkY1YrpCP3/+h6+zYry4uEhN/3gyuVPEzXvuZOLYw3k4v3RE3xFYY0hGLmw4sNtAd25Schn0v1LWbQ7G9MonKhJpZbpnxs4zzc2rhPFiMX6Dj9ejlEl4G4ESeINWmHT6GztgBfigOP+uJGesczXPMULdQhmnc+IUtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=diFp7+aT; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="diFp7+aT"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ac41514a734so535975466b.2;
        Sat, 29 Mar 2025 11:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1743274770; x=1743879570; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nM1iEKnX8goZJjbBqk+vEAeC/fnWWVRUcl0seopOhvI=;
        b=diFp7+aTzTbUeWOM4tjtxasKherU2tZN3grbYBjAXt8G55Zbvqtr44h789ISLAiFws
         B4dunxTkxZUf2Fu0Vj5Gb2jr5js3XrAH963KlHgzDdE1q6A70pq2dy2qqZtMSPYjzijf
         Dp/2GhBTQo/1Y6DStTQM7KYNQ0u1Z70hP+adtRSUe8mdpEUgYAY58xGYXIMKZAh7ME47
         I93hoMTfeMPbrsEH8F/GpzUJiEURRIAtBT1IHGuaru41tcodzLC9hUULEbw4kL0nidDw
         2zfgZm8PCy7T3SHHJmEVNR1VL+TJgdUA+nf5qzaYE3SOXXlqxbEpFGDu2OB2gQ9UTuN2
         HFTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743274770; x=1743879570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nM1iEKnX8goZJjbBqk+vEAeC/fnWWVRUcl0seopOhvI=;
        b=sRQgu0SPYvqQM3ICrbCXwlGldVKjF2gPX+j0xK+6R1dgVB6UFaE+dtbTj96e7Q8cy6
         cpZEUcMglXCb12ec4FEkoDGiuJwlzz1z/zl5hTeZTnHycUjZUSMBBomaeC7u0anbht5g
         otsDiSDjIQPk+f/A0RhOy5I1G2EPO2N1n8r9ft29SCkVIFdNPlJOTIB5aaQlRQk7CMis
         JlqYtysFamGSZOAhDkryhiOXKYDGfeBdRilKWoA2wPJorP44X4tIk4xwnkKJAF4PpHy0
         pPCqnQEZ6iF0Phow++4Ib0DhkzA1/gJerOda+VuQCwK1LMilDCgukpjveLqCgRMBnxoZ
         ustg==
X-Forwarded-Encrypted: i=1; AJvYcCVoHU4T5IC4Lu/Q1NS9hcDXBfb+7fxlDO99D0T5AZ2TbMlMiUD3ksv8cKMKJFp1tWCP3I15mAFafWDi4KBy@vger.kernel.org, AJvYcCWwrcPjHVCnL7WgxuGAcDwHbj5ZuK7NCjtah3NLZxMtRIufm5+nEKcBzqjUQyCtz5s11XPlIWVFKdcz@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7Rhqr8InVD8OF4/zhA+dB9hjGhG5lGIovB7Qsak6kpCe4nk6A
	GVotPUhU0Z7yZaIHBkGdv6jcNuV7Pi7esIJz/RJDy6aNRKg9XLsj
X-Gm-Gg: ASbGncvBgUkxU2mf0QXLpWWJor83uZxjX1CHh++3xNkZrrKnuLKSPLLXV0ty6BsjMm1
	UmJMJv1FmjvRInpADFGDVs6ekfGpVBlxqhz4VcR+9x4u1E8tKvFeN7FmQrVdHdcZJlZ0uMWgwly
	568L2KNDmadaw+KUSdPI28m2u7C0wsiPUpRERsKfns6L0V2GStrxLhKEJKtvdakfqapo7gnMFOU
	tMspPbdhh/Eju7xDBrf007LdNCkMYgl+keS4MAUBw1yga8IFCXEFeTqwbY0iKwTVMvA09ji880q
	EXzeX+a0xZIvjhso62osCOK7L1w6+AoCbnRORE+qF9HiqkNPCEoFxOAyQnsjXH/hSdkW0040u2+
	vdkMlDeC2ruaXVp0f5hzrC290mZGMoKcNr4OYTQXbrwAo2nei+N/AK5IDl4Zwf6DzfRtuADRp+Y
	z+1i8b
X-Google-Smtp-Source: AGHT+IEz7v5Ljt9ZJRFv32Hw0OIPcmVi+flrUYAm3zPFqUuBjHYjrY6pgvKN0F18tzS38DfxADncyg==
X-Received: by 2002:a17:907:869e:b0:ac1:ea6e:ad64 with SMTP id a640c23a62f3a-ac738a3f376mr380847966b.28.1743274770291;
        Sat, 29 Mar 2025 11:59:30 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ad73-6800-0000-0000-0000-0e63.310.pool.telefonica.de. [2a02:3100:ad73:6800::e63])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-ac7196dd46asm364497866b.160.2025.03.29.11.59.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Mar 2025 11:59:28 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	jbrunet@baylibre.com,
	khilman@baylibre.com,
	neil.armstrong@linaro.org,
	christianshewitt@gmail.com,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 6/7] arm64: dts: amlogic: axg: enable UART RX and TX pull up by default
Date: Sat, 29 Mar 2025 19:58:54 +0100
Message-ID: <20250329185855.854186-7-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250329185855.854186-1-martin.blumenstingl@googlemail.com>
References: <20250329185855.854186-1-martin.blumenstingl@googlemail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some boards have noise on the UART RX line when the UART pins are not
connected to another device (such as an USB UART adapter). This can
be addressed by using a pull up resistor. Not all boards may provide
such a pull up resistor on the PCB so enable the SoC's pull-up on the
UART RX and TX pads by default. This matches the default (from u-boot
or SoC hardware) state for the pinmux configuration on these pads.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index a6924d246bb1..2df143aa77ce 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -1164,7 +1164,7 @@ mux {
 						groups = "uart_tx_a",
 							 "uart_rx_a";
 						function = "uart_a";
-						bias-disable;
+						bias-pull-up;
 					};
 				};
 
@@ -1182,7 +1182,7 @@ mux {
 						groups = "uart_tx_b_x",
 							 "uart_rx_b_x";
 						function = "uart_b";
-						bias-disable;
+						bias-pull-up;
 					};
 				};
 
@@ -1200,7 +1200,7 @@ mux {
 						groups = "uart_tx_b_z",
 							 "uart_rx_b_z";
 						function = "uart_b";
-						bias-disable;
+						bias-pull-up;
 					};
 				};
 
@@ -1218,7 +1218,7 @@ mux {
 						groups = "uart_ao_tx_b_z",
 							 "uart_ao_rx_b_z";
 						function = "uart_ao_b_z";
-						bias-disable;
+						bias-pull-up;
 					};
 				};
 
@@ -1654,7 +1654,7 @@ mux {
 						groups = "uart_ao_tx_a",
 							 "uart_ao_rx_a";
 						function = "uart_ao_a";
-						bias-disable;
+						bias-pull-up;
 					};
 				};
 
@@ -1672,7 +1672,7 @@ mux {
 						groups = "uart_ao_tx_b",
 							 "uart_ao_rx_b";
 						function = "uart_ao_b";
-						bias-disable;
+						bias-pull-up;
 					};
 				};
 
-- 
2.49.0

