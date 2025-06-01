Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7665C1E5B7E;
	Sun,  1 Jun 2025 15:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748791834; cv=none; b=qpw3pQaFXxI1e+0WIz4n62iVtkvC9ELqk52NZxPHrNiAfkidSfCI2KZQWR/2xv50XUpLoRs5QM50CtsFufgXbnU3ilcUO+Iqhu1bB3gwnLk56aPvsNDeBpHkxR4yM8DYl07270RDW8d0aUlEOVQ3c3v6cvNOTFoRdXRQe8uUTWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748791834; c=relaxed/simple;
	bh=ewMxPKNI1gCqQUMZiCSFJZPglDtFYw13pudtUsNeEgM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CEYTTaRfbDccirN0kUB7iMdKY+lF4otKGa+HzSiFw+npFGA6wHPOcuR1KRpNMwQrT8A7WTWqmd/9Km2SGXl13Ja9BzRPDFdycdSVHh0p2mUJHssrc+fwOUolDmOwnOJxRUEeZeO6oebISYpVO+gn/lfDwYNTX9S8LHH6cSPDGYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L8Fbhdyb; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L8Fbhdyb"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a374f727dbso3056595f8f.0;
        Sun, 01 Jun 2025 08:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748791830; x=1749396630; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qj7jnOMeEuDpFtwVbiI++WWA1oeG5yeZQ6rIejO+hq4=;
        b=L8Fbhdyb3Z2GUTbcuF2TSjfGWQNkrCpctO3sBCOi3QVqTeMnkNKwgD5utu2BPnGuw3
         QtEgYCodoKKpNAEH0MlYAuEheTRdHMZ9pc1SZsACeUC/3DwtLaFphMirhKD3TJ5RpBlP
         /U9y+K5Th6inpz94l5PatphR/nT8jakCyK9J1zCU382zd3R/7cZPN+3SMdQeCOOuTcM+
         eDkrnz2Lb2O5nv6LR4MIRkZpBVC2EA5UgNjPAqHvZGWnFOYuN3ZlDnWU3W87ya+M1B4z
         +tPDgZX2phaQGA2ihcHVjUazOz/Tl1/NUSBlcVlJxn2iip1k43JQdIHZRbLYnpUaadW3
         /hNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748791830; x=1749396630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qj7jnOMeEuDpFtwVbiI++WWA1oeG5yeZQ6rIejO+hq4=;
        b=Mi490p2KnwG78wWtoHTKol74gOGS79Rc41rq+thYOFH6Eaz9kuiQx3nAyuF/bSKQO6
         U5OCvV7IebL6oJN4MLntacJ9BJKLNdWQkj3XkfiEriEPxNa8lXJhl3mmAfSxm5CWNZfL
         vHk+A5apAfN99sPjfnkkG63aCsX/SDlp+xdv4RJVQo+vn/9iuuum0foP/jQcEoayUzgG
         Webg6MgKwAp/GjY2k4bfRzS9TDC7QJbN5qbMuY23sfmdB/irgrUELjHaW0Znjj9cBbDE
         H8JQsUVab4yUtpTmsXI+jjv1Y75dW3/7DSdy9nA0k91gYncc+zZmePaR9SyhHSrveXdV
         cljg==
X-Forwarded-Encrypted: i=1; AJvYcCUCCSwcNzvXFT1/ZF3yJ+BuPVJ2eKueClFA4MXXZ3pph/oxn8Ov0ys1k8D+iNi96WDyiA5jGVtFuqTA@vger.kernel.org
X-Gm-Message-State: AOJu0YzozK9xd1UcdYP1vi1rPd9WaYK9Nbz2Ei6SkMClRbX9pJ7ebXaw
	fmyr0QW1PFYJ4b5w89E9qM3aU6gZJEQGjnaFfu1n3toZhthbGZQWbkQE/PEZOEOx
X-Gm-Gg: ASbGncuMFa/hhZHGekjy+HspRObzMCA54IA7POuVTBiyfTAgR4rw0H5NZ4QTRqwQrZH
	dUUmzVZC+U4sgeJMBaon6M9uf4yUMSm6ivt08lLyChIM/sNoRO+2qJVHlPw/SS3mRVu6yOZalcJ
	iVtMtbw8pOeRX5RY8I4fEkOodsLbB/r5YlSD96NGSNzXLphT9v4ncl4sIDZYfo1w0jCs3MU2VKZ
	92SGyym97OtwYnLEp44OcmwWbofxtuVyunIWq8tITzEggMGwU8MYIbi5FZ4mdXYDSjkPa0sEQRr
	YLZ0ZzUUcZJL7orP8YsD78yU7685vHC/HC6YWZOQ526HR0Otnor526CU8Qz9AUMTTAFyJ4QVo+6
	yulkAt6r0zLc=
X-Google-Smtp-Source: AGHT+IGU28SeXfp8H3UluGfqoFcDdGdUamZo5fdXlxh2A8sDEIYvEfOkDFgTVe7o4IrPzKXqOFovPA==
X-Received: by 2002:a5d:64ec:0:b0:3a3:6e85:a529 with SMTP id ffacd0b85a97d-3a4f89df3c2mr7321665f8f.51.1748791830302;
        Sun, 01 Jun 2025 08:30:30 -0700 (PDT)
Received: from masalkhi.. (ip-109-43-115-37.web.vodafone.de. [109.43.115.37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d800671csm88780205e9.30.2025.06.01.08.30.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jun 2025 08:30:29 -0700 (PDT)
From: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: arnd@arndb.de,
	gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	abd.masalkhi@gmail.com
Subject: [PATCH v2 1/3] dt-bindings: eeprom: Add ST M24LR control interface
Date: Sun,  1 Jun 2025 15:30:19 +0000
Message-ID: <20250601153022.2027919-2-abd.masalkhi@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250601153022.2027919-1-abd.masalkhi@gmail.com>
References: <20250601153022.2027919-1-abd.masalkhi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the control interface of STMicroelectronics M24LR
RFID/NFC EEPROM chips.

Signed-off-by: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
---
 .../devicetree/bindings/eeprom/st,m24lr.yaml  | 72 +++++++++++++++++++
 1 file changed, 72 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/eeprom/st,m24lr.yaml

diff --git a/Documentation/devicetree/bindings/eeprom/st,m24lr.yaml b/Documentation/devicetree/bindings/eeprom/st,m24lr.yaml
new file mode 100644
index 000000000000..6d72325865d6
--- /dev/null
+++ b/Documentation/devicetree/bindings/eeprom/st,m24lr.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/eeprom/st,m24lr.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STMicroelectronics M24LR Series NFC/RFID EEPROM Control Interface
+
+maintainers:
+  - Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
+
+description: |
+  STMicroelectronics M24LR series are dual-interface (RF + I2C)
+  EEPROM chips. These devices support I2C-based access to both
+  memory and a system area that controls authentication and configuration.
+  They expose two I2C addresses: one for EEPROM memory and one for the
+  system control area (e.g., UID, password management).
+
+allOf:
+  - $ref: ../i2c/i2c-mux.yaml#
+
+properties:
+  compatible:
+    enum:
+      - st,m24lr04e-r
+      - st,m24lr16e-r
+      - st,m24lr64e-r
+
+  reg:
+    maxItems: 1
+
+  pagesize:
+    enum: [1, 4, 8, 16, 32, 64, 128, 256]
+    default: 1
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: >
+      Maximum number of bytes that can be written in one I2C transaction.
+      the default is 1.
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      i2cmux@57 {
+        compatible = "st,m24lr04e-r";
+        reg = <0x57>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        i2c@0 {
+          reg = <0x0>;
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          eeprom@53 {
+            compatible = "atmel,24c04";
+            reg = <0x53>;
+            address-width = <16>;
+            pagesize = <4>;
+          };
+        };
+      };
+    };
+...
-- 
2.43.0

