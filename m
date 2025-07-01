Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B24D3D69;
	Tue,  1 Jul 2025 21:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751403657; cv=none; b=jvNfEU8pJsW+Fc1Lt/RtOzpqrTVZzCOWHv1ejof1pTDRlppIELCU4s83O2NtLJI3gd7LlrfBmORPqSKWNnrcqXZn0xAktoZCWQBJ5f9fyI0DSnR+UI0o98vCgRgysP5G6CvvCiZadwZqyJ8zplsHLB1DCD57WkShZwJ2J+FtDxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751403657; c=relaxed/simple;
	bh=kwMk5TprZKCx1JDhnDxWSf8SIXmrXdGYvZd4f7l/slU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WZ1nd7NRou7AyafTWz4NJUU5YV16cNdMUd5cAcriXgPD/gLevhiN+NRo6o5EY6FyuR3p9npw3S6h/V9xcn/cGXadY1KgJBA+KBFmlzga9aNOrGaYu3xHXxb02HMXS1vflPO3gX6iG8fctLidPjZ/EHlPEhHNRepEwBmH6uq5e3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LZDnsL7c; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LZDnsL7c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68505C4CEEB;
	Tue,  1 Jul 2025 21:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751403656;
	bh=kwMk5TprZKCx1JDhnDxWSf8SIXmrXdGYvZd4f7l/slU=;
	h=From:Subject:Date:To:Cc:From;
	b=LZDnsL7cKhhPCLAz+ZG4gjmlbUDH5LsuCyjrAfdX2O3b8fjodzObXRzM/MJPekt62
	 nTeDu4i+FVUlGYoHIpM+ZHULwIuB9lzHnYPtr661Tb8UNG+yy8pU1UICcZyhMLr7rQ
	 5wIG8EtG3E+OHk78tJXs/KvGVH9xAKTnMCMXa6RG8F8+pBwCNQi9MVyJfo/lnTAiG1
	 3unsPdqMZIJc15yoz+zLXDwuX+wk5DQLV2eZTL2LIq9qtdmigzntdzUTkL4ACNz0wD
	 152L6feSP7TQKIA5Ea+1xxShzy1Qi6tu2b+WpzQdQ8Ceg622ANuqhdXNW/OLqVv/oW
	 NqSNHDCBf1Kag==
From: "Rob Herring (Arm)" <robh@kernel.org>
Subject: [PATCH 0/6] dt-bindings: hwmon: Add undocumented compatibles
Date: Tue, 01 Jul 2025 16:00:39 -0500
Message-Id: <20250701-dt-hwmon-compatibles-v1-0-ad99e65cf11b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHdMZGgC/x3MQQqAIBBA0avErBsYhSi6SrRIm3IgNTQqiO6et
 HyL/x/InIQz9NUDiU/JEkOBqiuwbgoro8zFoEk31JLC+UB3+RjQRr9Ph5iNM5JlMlYbs6gOSro
 nXuT+t8P4vh/2VN1mZgAAAA==
X-Change-ID: 20250701-dt-hwmon-compatibles-0ce0bc2bbf18
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, 
 Frank Li <Frank.Li@nxp.com>, Jim Wright <wrightj@linux.vnet.ibm.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15-dev

This series adds some undocumented compatibles which are already in use 
in drivers. They were found running 'make dt_compatible_check'.

Please take via the hwmon tree except the last trivial-devices patch as 
it has a minor conflict with my tree otherwise.

Rob

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
Rob Herring (Arm) (6):
      dt-bindings: hwmon: national,lm90: Add missing Dallas max6654 and onsemi nct72, nct214, and nct218
      dt-bindings: hwmon: ti,lm87: Add adi,adm1024 compatible
      dt-bindings: hwmon: lltc,ltc2978: Add lltc,ltc713 compatible
      dt-bindings: hwmon: maxim,max20730: Add maxim,max20710 compatible
      dt-bindings: hwmon: pmbus: ti,ucd90320: Add missing compatibles
      dt-bindings: trivial-devices: Add undocumented hwmon devices

 .../devicetree/bindings/hwmon/lltc,ltc2978.yaml    |  2 +
 .../devicetree/bindings/hwmon/maxim,max20730.yaml  |  1 +
 .../devicetree/bindings/hwmon/national,lm90.yaml   |  8 ++++
 .../bindings/hwmon/pmbus/ti,ucd90320.yaml          |  6 +++
 .../devicetree/bindings/hwmon/ti,lm87.yaml         |  4 +-
 .../devicetree/bindings/trivial-devices.yaml       | 50 ++++++++++++++++++++++
 6 files changed, 70 insertions(+), 1 deletion(-)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250701-dt-hwmon-compatibles-0ce0bc2bbf18

Best regards,
-- 
Rob Herring (Arm) <robh@kernel.org>

