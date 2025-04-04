Received: from mx2.securetransport.de (mx2.securetransport.de [188.68.39.254])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 302EA12D1F1;
	Fri,  4 Apr 2025 13:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.39.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743774153; cv=none; b=b3iLjxcpF3gfdDQlGx2XMvbyjISTr2bwQmyA58LWyh3GCQ7NicbT1loDFQ2KBAHwpnvN3Osyq65UFwKWIeJuAixsuKW4QxLX1DmgziG9LRgNIF0FzU7sjSVrxvlMhWw9PfUdbvc2tdNP45ZV1XQM10OCN5hCoarxTbL8HNPJnnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743774153; c=relaxed/simple;
	bh=m+p7eMnkKuhdy70SAUmOiT3zT3XpgZxgRzYdf5rk1J0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WitMaQ/ynTudxaOIv3Ga4QpZTKjI7cy0pSmqMaIpb9W926kLAWvmixWH6GM6RasWgnifZ3CXpU8cGiUfacGwWMhDvIMqV8/cBKnxCZ/1w86braC0FK/s4e0J4SNYbAKgmgMpg1r5h1eRaelIdVIXIHmrGwqw4Z4OdRJhFagT/Ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dh-electronics.com; spf=pass smtp.mailfrom=dh-electronics.com; dkim=pass (2048-bit key) header.d=dh-electronics.com header.i=@dh-electronics.com header.b=QAjTQBam; arc=none smtp.client-ip=188.68.39.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dh-electronics.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dh-electronics.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dh-electronics.com header.i=@dh-electronics.com header.b="QAjTQBam"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dh-electronics.com;
	s=dhelectronicscom; t=1743774114;
	bh=RZ0jmwBFYdzhS3iHe4uxhfbTjqPPf5KQuSOU+fJ9O28=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:From;
	b=QAjTQBam+uaeNnDDCQGS8FYV0KabuM7uLlPVjaSZWAkaqPYaIVJerLyr96DWmkb42
	 FkDtWhOCh5SWSXY1+++oLIFHHgAa55xFL46p29KmRsYt6WaZpZxu/TyA08WFdoTLn1
	 XhbRzF//7VZiCjOlpGj5jUyy+T2KzKmY3VIqxY6LNwp7NyCa3JkLLMNhiah3cpI9G2
	 rBOczeKhyKdGPRnAht3wVL7KGsOcx+ZGSv2iELc5Ba33zXb7IFdmI6OWOA/DlCA7t6
	 D/RXVV7oonP8cRHVk6B5KnRiHOFRTMFfhTH0HyTHnrc7nYQUYwtjUIKMpe+Krn/NVJ
	 w4rGFHR3IIKjQ==
From: Johann Neuhauser <jneuhauser@dh-electronics.com>
To: <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>
CC: Johann Neuhauser <jneuhauser@dh-electronics.com>, Jonathan Corbet
	<corbet@lwn.net>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
	<broonie@kernel.org>
Subject: [PATCH 2/3] ABI: sysfs-platform: Document uevent ABI for reg-userspace-consumer
Date: Fri, 4 Apr 2025 15:40:08 +0200
Message-ID: <20250404134009.2610460-3-jneuhauser@dh-electronics.com>
X-klartext: yes
In-Reply-To: <20250404134009.2610460-1-jneuhauser@dh-electronics.com>
References: <20250404134009.2610460-1-jneuhauser@dh-electronics.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Document the new uevent-based ABI provided by the userspace-consumer
regulator driver. These uevents expose regulator events such as OVER_CURRENT,
ENABLE, DISABLE, UNDER_VOLTAGE, and others to userspace.

Clearly describe the ABI entries and possible event values to ensure stable
and predictable userspace integration.

Signed-off-by: Johann Neuhauser <jneuhauser@dh-electronics.com>
---
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>
---
 ...ysfs-platform-regulator-userspace-consumer | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-platform-regulator-userspace-consumer

diff --git a/Documentation/ABI/testing/sysfs-platform-regulator-userspace-consumer b/Documentation/ABI/testing/sysfs-platform-regulator-userspace-consumer
new file mode 100644
index 000000000000..2d518afb0d32
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-platform-regulator-userspace-consumer
@@ -0,0 +1,23 @@
+What:		/devices/platform/<device>/uevent EVENT=
+Date:		April 2025
+Contact:	Johann Neuhauser <jneuhauser@dh-electronics.com>
+Description:
+		Reports regulator events via uevents for platform devices
+		controlled by the userspace-consumer regulator driver.
+		
+		Possible EVENT= values:
+		 - ABORT_DISABLE
+		 - ABORT_VOLTAGE_CHANGE
+		 - DISABLE
+		 - ENABLE
+		 - FAIL
+		 - FORCE_DISABLE
+		 - OVER_CURRENT
+		 - OVER_TEMP
+		 - PRE_DISABLE
+		 - PRE_VOLTAGE_CHANGE
+		 - REGULATION_OUT
+		 - UNDER_VOLTAGE
+		 - VOLTAGE_CHANGE
+
+Userspace can monitor these events using udev and respond accordingly.
-- 
2.39.5

