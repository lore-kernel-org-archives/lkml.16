Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E49086347;
	Mon, 31 Mar 2025 15:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743436359; cv=none; b=W8JsJZSGgM9t/Ftz+gRcTqCQK08Cr9pvqVnLrMP0Xgd+lz/WkH3ZNqIihLEMSR0O6RBVBL0qYhH/d8AMFZ4wYYvThlV7UHRgFXdhnva78+lik4A1+fMXY9ZFT1mmzOXRYLhMVMHEr8paHTW92K9/8/IoccQg/J2v5KrOcxmEW8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743436359; c=relaxed/simple;
	bh=kSAzx+eej0uycF+Jfn1RtLgdWxBP1noPEe4qNaH57QE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ZJLZRuI1MhX7jWJjljImkG7/zEY5CApYAnm0IA5QE19oPJkQVtHnBARmn6S+sWMSaWKK9sGx50vzG4+BnZrBlhzg9g8ZCJBbGHUO/Ap2bKVdazIhuMD6/EGQeKvoqVTrvuMCtCPOCgZT82FzBsXBbqgjeFUrAtgkb3Ql6qKoIrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=uLWvvXBZ; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="uLWvvXBZ"
Received: from francesco-nb.corp.toradex.com (31-10-206-125.static.upc.ch [31.10.206.125])
	by mail11.truemail.it (Postfix) with ESMTPA id 495221F93B;
	Mon, 31 Mar 2025 17:52:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1743436354;
	bh=KmFGNeGUi5nO5jd0LDYCS2bFrp7mfdJc99mrkzyV6hk=; h=From:To:Subject;
	b=uLWvvXBZysCpj9nS486sUa+eL6MnSBa8wL+u0yOrO6CbTXJap4QM+MTHtb+3XJyTL
	 BL9ZASM9fhkziVQAckEIvTvLJAWstk0S7YWcYll9dZkKDuYbhEWF+FqmrSLRwgFoZS
	 SlpqqkvoThcxytHJWj6I9K7CMVcfiM6kXNa15bzGYHkGsQBMr9J2o3d+dVIXn69VRJ
	 OAexq9i6bD/vTP0/5K+3OGdvvIIHKkhShvdCj9kixTou3sgAeVg9HMzOpKGcbF34zn
	 dfYeH4hzxWHdFbpogu6VIeIBNxMibx95tDrct72aamsaw0IkYUttOkXiF3MPYpsBNI
	 sNmSPXiemMN4w==
From: Francesco Dolcini <francesco@dolcini.it>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Farouk Bouabid <farouk.bouabid@cherry.de>,
	Quentin Schulz <quentin.schulz@cherry.de>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] hwmon: (amc6821) Add PWM polarity configuration with OF
Date: Mon, 31 Mar 2025 17:52:27 +0200
Message-Id: <20250331155229.147879-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Add support for configuring the PWM polarity of the amc6821 fan controller.

Francesco Dolcini (2):
  dt-bindings: hwmon: amc6821: add fan and PWM output
  hwmon: (amc6821) Add PWM polarity configuration with OF

 .../devicetree/bindings/hwmon/ti,amc6821.yaml | 14 +++++-
 drivers/hwmon/amc6821.c                       | 50 +++++++++++++++++--
 2 files changed, 58 insertions(+), 6 deletions(-)

-- 
2.39.5

