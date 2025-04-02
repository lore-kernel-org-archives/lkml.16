Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA1B021ABC3;
	Wed,  2 Apr 2025 10:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743589324; cv=none; b=INGpBkhGDJClogQvRltl5AdA2HaQxeLuyL+1gfsaBsVI84zeeQ1NB8xtmTJ03v374NWh9S5lRphVio4pgy8i1IckmVtqDxyUXrx8W+JnsI45zjjaFOFoJ9Gw8JuUAS4C8+b78cmbwh8rqftyA4+Hk0xIc9HSfa4+lFYpznzwbzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743589324; c=relaxed/simple;
	bh=BdORvnXoGJLZV9Q+UHKAr4GajfyQXVCoCL4Hlvs5oxY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=QFrt/k+VRCIhK26sgMJlBZyZCpo2o8OMFt8KDDAUglVkp1nCwuAdoYzMMsIB3udGI3R7GeRy5rMavwyYqelBynsCgT3azmg5igv0zbZPGWcOLQEkgfU+3+T3r9pCMrSdjB3X8nQmz8RL5iO0jtSe1iTpYhCH9VwA9rqZQ3urkP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=jny5Ptsj; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="jny5Ptsj"
Received: from francesco-nb.corp.toradex.com (31-10-206-125.static.upc.ch [31.10.206.125])
	by mail11.truemail.it (Postfix) with ESMTPA id 5A5E21F8BD;
	Wed,  2 Apr 2025 12:21:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1743589312;
	bh=CQYsomTp7PnswtMuL1xQSA60xFVOu9qYyptJXh/jGag=; h=From:To:Subject;
	b=jny5PtsjG0wPoGRtXXHg0zU5JdKj0Qr+PNc8BNB/H6R0B162IrlBy4b5meL0fJxLs
	 Sf/ayIAaWpveluejxUxUlHir62C+dv0s/5bouZennpXysxI0QED2+sjeZYhyBwBGaI
	 y9PRsNa+yZfUaGT3euy6AUKjQid3AcpygE8P9arKbKCR2EM5RdrfTvK/RFQCwQcApK
	 PUoIfI08Dm56dNmV4WHJjxSY3TLYKZiK1s9q0KVAiIbr4vd95YacIeCb6UPpZxIO0y
	 uOdIeEylTliL+yFH2S6jZ8LuJsvm9e6oNjmnVKDBKUcAy7wYfieA7VOYmmU3ZOT38Q
	 TKIq3RgK8ECYg==
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
Subject: [PATCH v4 0/2] hwmon: (amc6821) Add PWM polarity configuration with OF
Date: Wed,  2 Apr 2025 12:21:44 +0200
Message-Id: <20250402102146.65406-1-francesco@dolcini.it>
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

 .../devicetree/bindings/hwmon/ti,amc6821.yaml | 18 ++++++-
 drivers/hwmon/amc6821.c                       | 50 +++++++++++++++++--
 2 files changed, 62 insertions(+), 6 deletions(-)

-- 
2.39.5

