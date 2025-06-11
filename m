Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB2DF2367A4;
	Wed, 11 Jun 2025 08:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749629124; cv=none; b=I8du7Wqh3a5R9UIgEAI2J9mDWKbYLrHY/jZ6Vz4E9ui/kJwlG8IatzlzujW6X/brzDqSC0AG3mzIvhqbdwQ3guE1efEJWGUyFB1ileZiueYTKx7aZhTfpay20V8y1rKVd11KJ24UoRHKL4eRVw+MiD6ahiprQleQQ0RGETud88Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749629124; c=relaxed/simple;
	bh=TrAaHDqfaAkeRAns0IKgf4jyj0nQV9bZo6VPAJoiMnM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oskr4s+s3V4POHezeeH6y2MMFjmkt9xdgGO/fr/GDZvdyoXEkObhZY/W78T/Y4GxL8VctSRR5Uj+tf+68ZBGqmuiUNZPWTU/y9kEteORCM1rmNJs4khGI3btUJhZ5/WVIlUgC14EFCoCBwdhXBr/kO/r3B0BkBbnhByjdRcrzNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OI8G3VEE; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OI8G3VEE"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2350fc2591dso6054965ad.1;
        Wed, 11 Jun 2025 01:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749629122; x=1750233922; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dAmqS9TFfQgR6ZuXXgUeH384PenfewbVMCpyFtNRxxk=;
        b=OI8G3VEEraHFdUW8XgxWhVIV5VKF9zotpSqM2FwAvW8XicKIP+3LKkAf7VbP3yeiM4
         DsAEXqztPE6/Oz6h+kRadrsVZ4jQcKOa6NUegQlblzbLKDBoYeqvntHz36FtscBhQ+Zl
         WWoZOz5uEhFQQOXK7nrHcGW6hhrqI9YcQHoPNR9JDPA3Zxsx5FnVjke34QNLhhDA0xlQ
         OnnRHL+VdPNsh7srxoIa0pB4hXbZKiP2T1p5a2hV09ZxLv7E3zQjs3ef4DQIuW61XKal
         489yjtou8seth+AS402S2zUiAwioPYS6Ojip6K3r8l5yMCYZViBIPcDITPNu2Zi/MqnN
         g9sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749629122; x=1750233922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dAmqS9TFfQgR6ZuXXgUeH384PenfewbVMCpyFtNRxxk=;
        b=VSAL3zKNeqk9A6z2+XfKtecUXP8vXIhLE4cnnE3ZvXd0DjSngylLM2vFMwmUs6IbKg
         gJWRw7m449lrs+9bTp7d//OVIRg+blgffLvT+iZO5vW/eGwvnTf/AkAcL45wHbw8tVlK
         4LYAWr/SiK1vOCCrJMJfks+o7x0Z2vez77LX6ubwb3z0wZvUTDwO7Pk24O76XRcn5bNy
         a9mRXXEaRUzVJxYVmz7/CA1EnP5aQPHaVtVMOtJTCBSYAQu0/7y/8UJKUviqROYqHc9M
         fkKq2JGsBvpI7LcgSp98AAGj80Hkfew18I7CV84+r+yqMyqva8a3+3NSFZex5gEOU+yz
         0Hig==
X-Forwarded-Encrypted: i=1; AJvYcCU5pZ+epZZwj7XE8DsU30Bkc7u+K151Yk8r7lX183oGnhCAj7sybikNXry5so44JmWfSi5F23zOpjeYLaKB@vger.kernel.org, AJvYcCUCBPD9Jas8FOVlSyqJeoq39RWy4Z+fesEDlj5hi1Xsmm3ozCvz2+HJTcSSNYfmd+8EKbIqH8rqHu1Y@vger.kernel.org
X-Gm-Message-State: AOJu0YySrs4RYLZ9YcH33zK7+1kXeAQOMtKqUX+6BXzE44SVNKELbBfi
	ZIPM+jC+jYJC559ce4n+Ib/83wOxDqVHBv4zkoDwaSWmAoqL0haDmOqUgkLCqg==
X-Gm-Gg: ASbGncttZsvs+LGNalh3qxfLQ2lywiIRRNQvHZce4OPxPOtmOBl0GFwjoUwsBmkq9nU
	nCwn7uCbmIdXdOmpRagWWmMkc8BK3N66gRFw9XWWPZpB5zMld98XygP04526ZTVeBuhkzdIid7H
	Cj/knKjskjq4XL3gzGcVKtG0OMN2Iq60qGdhVQPzCyKh//bCc5Czu14FAnoGs3wW0yOf7uqqs9G
	gldX4h9Z4FrWhdwgbvOC/outLgpyQI8x4yXjMy6qRsQ0ndNTr8ZQOwz6qMxkLnYbniETcNcWO/6
	XCq2twp5uzRtf28ld2BON/r1JdDf+A1u6QVgGVsY28kSZSkTU5GJ46fcYHlAxNbnbkbQDTR9hF7
	F0RTaGBElUQdFb/x8RtN0vTUuEwJ4kDSlpFKjOLusjAPj95fuHQwExOZ2bWE/NmjpC3ZQKjCHfX
	co6kTpTjcK11+z3sBD
X-Google-Smtp-Source: AGHT+IGDGJ0np861gl/BsOafO+Lck0L1DptXpwjhh1Oi95aNBuT054cfghigc5NOLUKgNHLq69TOBw==
X-Received: by 2002:a17:902:ce86:b0:232:59b:5923 with SMTP id d9443c01a7336-23641851c95mr37292345ad.23.1749629122052;
        Wed, 11 Jun 2025 01:05:22 -0700 (PDT)
Received: from localhost.localdomain (2001-b400-e357-b8a8-7759-271d-6134-9aa3.emome-ip6.hinet.net. [2001:b400:e357:b8a8:7759:271d:6134:9aa3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2363ad90982sm21283835ad.220.2025.06.11.01.05.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 01:05:21 -0700 (PDT)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Cc: peteryin.openbmc@gmail.com
Subject: [PATCH v2 1/5] ARM: dts: aspeed: harma: add E1.S power monitor
Date: Wed, 11 Jun 2025 16:05:10 +0800
Message-Id: <20250611080514.3123335-2-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250611080514.3123335-1-peteryin.openbmc@gmail.com>
References: <20250611080514.3123335-1-peteryin.openbmc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the E1.S power monitor device node to the Harma device tree
to enable power monitoring functionality for E1.S drives.

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
 .../arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
index 9cb511a846e3..3a215bb1e220 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
@@ -354,11 +354,22 @@ imux22: i2c@0 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <0>;
+
+			power-monitor@45 {
+				compatible = "ti,ina230";
+				reg = <0x45>;
+			};
+
 		};
 		imux23: i2c@1 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <1>;
+
+			power-monitor@45 {
+				compatible = "ti,ina230";
+				reg = <0x45>;
+			};
 		};
 	};
 };
-- 
2.25.1

