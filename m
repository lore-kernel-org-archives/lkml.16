Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C3D323CEF4;
	Mon, 10 Feb 2025 15:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739199629; cv=none; b=XqczrCy9kIWmpprtNhQ/jJkIUre776ORfCiljLgKfnN+cfYlYQ+hE1BBj42/EHsXQK3xUEC9PvFbE8f4vnilapCsx2DplPAvDCxUC+HkxXF6pPt4ms/j6lAGgvKxeY4lg78WS9HvclnNZQtFpMKPpJwMTmegtb0TtzT8+Adi1k8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739199629; c=relaxed/simple;
	bh=Wu/8x0tKfGZ8vQwjbXavFri9TuaV2YjlBE2HOdcaDzs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Xzhqm51gBkfBiJXBXvUmoXYJZtIP1QJyn4dROZCkSeZuwdJGSCDHl3K/VYB7qgLQT6M+OZCoPkvMLjoLf+1sX/QVT/ImW9DtxRBaijyypRzPol9HFXeIPA9Q99b+/DBTb6Qw5y5pa0kH9mf0Tl8NI6UY0fY1WXHzpDMyIHjrTBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=dzRdUblY; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=XyylDNkx reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="dzRdUblY";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="XyylDNkx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1739199626; x=1770735626;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CXDFqYlNp+TrVoKDYxHCUwL/kqcqvFbl1BZczTsZMz8=;
  b=dzRdUblYv4IgJDVM+EWNLyAX9IyRu/O0VBfkpwF64/s1WGPYVbB9v5M+
   sPZ6dT3fwpBhORL5IJhfFMWl1TjqYAMAdYXygS58wu0NYI2w61qPa8G4j
   Hd3TbqejWgJ4xXd83f4BcSOXhnXg6TUWkviWmVUGvA67GtMc0TVSMHf3O
   gHwdwsxrRgASq9tZTzlZuJiiBJJ8CoqtAnAKref1cDZft0ebLeK2r386M
   3cJTXXKTeEzbNlIpGEvjtDgBGmeMK4w6/cqNo33gJQTpZyqy+C2Cf2hSg
   g1dHX+Uq//2DiSRwAzGOTM6kPHpiTwJ4zyKl/kRwWx8SRywVfp5OCOzGm
   Q==;
X-CSE-ConnectionGUID: 477MuB47TtiAKlY1k0/nLw==
X-CSE-MsgGUID: OnwByv64QQ+m64K2kC+RTg==
X-IronPort-AV: E=Sophos;i="6.13,274,1732575600"; 
   d="scan'208";a="41722355"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 10 Feb 2025 16:00:23 +0100
X-CheckPoint: {67AA1487-1D-27DB3AF7-E9544489}
X-MAIL-CPID: 5F26CA5C8F51C6DC4E3DB5F53EF510F7_5
X-Control-Analysis: str=0001.0A006378.67AA1488.0023,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 00BCB166BBA;
	Mon, 10 Feb 2025 16:00:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1739199619;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CXDFqYlNp+TrVoKDYxHCUwL/kqcqvFbl1BZczTsZMz8=;
	b=XyylDNkxO+9aRD1SG7gxpsk0RAYmxMp6NmPdFpF0/UkwoqzutDlNNemxtpbrJbPMndeOzX
	ko+WVSuHmYkcvj3boph+gLCz3JZcXypLTN4Q/c2Ee64yszCfU4xAFctQLSFB7GGm+soet3
	7uDnflsShuhskEbSnbX7RusHJcCDDtbCWnQ/T6jtVVbzOZDb/mtHH26UyPWDYuJgABhzgj
	ybK7+WB16kPz8WkhJmZYR/KYZbXtwWwL6SHWshOo9twpazL3um56MlaNJHrfBzgewxwZ6C
	SIj1ENU7VAKui1Ayv6QDEO8sC6K41cGiJcha/SRLcurPWIsD9QI9kLCeL6OZiw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] dt-bindings: hwmon: gpio-fan: Add optional regulator support
Date: Mon, 10 Feb 2025 15:59:29 +0100
Message-Id: <20250210145934.761280-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250210145934.761280-1-alexander.stein@ew.tq-group.com>
References: <20250210145934.761280-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

This adds an optional regulator support (e.g. switchable supply) to the
GPIO fan binding.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 Documentation/devicetree/bindings/hwmon/gpio-fan.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/gpio-fan.yaml b/Documentation/devicetree/bindings/hwmon/gpio-fan.yaml
index 7f30cfc873506..d5386990ab153 100644
--- a/Documentation/devicetree/bindings/hwmon/gpio-fan.yaml
+++ b/Documentation/devicetree/bindings/hwmon/gpio-fan.yaml
@@ -23,6 +23,9 @@ properties:
   alarm-gpios:
     maxItems: 1
 
+  fan-supply:
+    description: Phandle to the regulator that provides power to the fan.
+
   gpio-fan,speed-map:
     $ref: /schemas/types.yaml#/definitions/uint32-matrix
     minItems: 2
-- 
2.34.1

