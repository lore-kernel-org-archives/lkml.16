Received: from mx2.securetransport.de (mx2.securetransport.de [188.68.39.254])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11F8512D1F1;
	Fri,  4 Apr 2025 13:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.39.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743774167; cv=none; b=XmoJR+/LGO7Qk8fXJ32rIR7voqae2EglZ77P9UVphQQeMc/a2PMBAwmy9jV9t5P1zx5/ul4f3gWZVx2u7HtP4L7XEvEEfjeC7PF/PJgo3M3pNzXx+wMYmQnCxvLt6wIbqHt16YdWngflDYt+t+OWgzmkYKjuFo/lPTZxTUDk+vU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743774167; c=relaxed/simple;
	bh=u0SPVnMW7m9xp1q5Fto8u0ZT8lP0XSxKjLxGAkfDFcM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WfMw4nOkq4cG2o/iNikmGxyI/LxlZHpcw7CT93CdRGeRreSsYbgD7kV/LcSYgvswGVNV6es1GVT/tkmFIvvbucS3lNdX9Xi9hqbyAZLYc5irziAeoszufNGKbsT5TSR3ztoR5pQ8vVF/yPC3zMiBsd9qdy8r1g64s4QwGTvyr2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dh-electronics.com; spf=pass smtp.mailfrom=dh-electronics.com; dkim=pass (2048-bit key) header.d=dh-electronics.com header.i=@dh-electronics.com header.b=i4RrI9dK; arc=none smtp.client-ip=188.68.39.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dh-electronics.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dh-electronics.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dh-electronics.com header.i=@dh-electronics.com header.b="i4RrI9dK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dh-electronics.com;
	s=dhelectronicscom; t=1743774124;
	bh=mEWTFQi0x5I0T2Dvamc/ses98XmOTmvVCWZ+pb/lH5c=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:From;
	b=i4RrI9dK1RsghyjTi4uJ/ikCIThxUd2xmZNgFuyrDqOCsETVlNS2SdKEVP3QWoGK/
	 PoKjj04RKs25xqe2xXxwoy+r2W6Uj9H5rheKaX+YdPlv45XCtgpt2Nm320jIZ1J05Q
	 7uEbySnWIm61SVx1LqnENQLUbddf/u14dyhBSjRZg4DogquJ8UylvYUWoCcgkMrl/Z
	 gOM1soon6JyJeV9dwVhxwS9lBFdBczAn7fRkDPQfl5hx9iz57Q6W8NC1eZvS+kuevn
	 SXJweNY/go1Wx3Hg9aoiLUAKiznMA+hyF92AIDMaPZf6PmMSeVO4jN0qJMo0j0MVx1
	 aoEsFUBXvKr9Q==
From: Johann Neuhauser <jneuhauser@dh-electronics.com>
To: <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>
CC: Johann Neuhauser <jneuhauser@dh-electronics.com>, Jonathan Corbet
	<corbet@lwn.net>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
	<broonie@kernel.org>
Subject: [PATCH 3/3] docs: regulator: userspace-consumer: Add uevent-based regulator event reporting
Date: Fri, 4 Apr 2025 15:40:09 +0200
Message-ID: <20250404134009.2610460-4-jneuhauser@dh-electronics.com>
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

Add detailed documentation for the new uevent-based event reporting
introduced in the regulator userspace-consumer driver.

This documentation explains:
- The new supported regulator events exposed via uevents.
- Methods to monitor these events from userspace using `udevadm`.
- Practical examples for creating udev rules and scripts.

Signed-off-by: Johann Neuhauser <jneuhauser@dh-electronics.com>
---
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>
---
 .../regulator/userspace-consumer.rst          | 92 +++++++++++++++++++
 1 file changed, 92 insertions(+)
 create mode 100644 Documentation/driver-api/regulator/userspace-consumer.rst

diff --git a/Documentation/driver-api/regulator/userspace-consumer.rst b/Documentation/driver-api/regulator/userspace-consumer.rst
new file mode 100644
index 000000000000..308873fd20cb
--- /dev/null
+++ b/Documentation/driver-api/regulator/userspace-consumer.rst
@@ -0,0 +1,92 @@
+============================
+Regulator Userspace Consumer
+============================
+
+This document describes the Userspace Consumer Regulator Driver
+(`drivers/regulator/userspace-consumer.c`) and its userspace interface.
+
+Introduction
+------------
+
+The Userspace Consumer Regulator provides userspace with direct control
+and monitoring of regulator outputs. It now supports reporting regulator
+events directly via uevents, enabling userspace to handle events such as
+overcurrent, voltage changes, enabling/disabling regulators, and more.
+
+Supported Events
+----------------
+
+The driver emits uevents corresponding to the regulator events defined in
+``include/uapi/regulator/regulator.h``.
+
+Currently supported regulator event uevents are:
+
+- ``EVENT=ABORT_DISABLE``
+- ``EVENT=ABORT_VOLTAGE_CHANGE``
+- ``EVENT=DISABLE``
+- ``EVENT=ENABLE``
+- ``EVENT=FAIL``
+- ``EVENT=FORCE_DISABLE``
+- ``EVENT=OVER_CURRENT``
+- ``EVENT=OVER_TEMP``
+- ``EVENT=PRE_DISABLE``
+- ``EVENT=PRE_VOLTAGE_CHANGE``
+- ``EVENT=REGULATION_OUT``
+- ``EVENT=UNDER_VOLTAGE``
+- ``EVENT=VOLTAGE_CHANGE``
+
+Monitoring Events from Userspace
+--------------------------------
+
+Userspace applications can monitor these regulator uevents using ``udevadm``:
+
+.. code-block:: bash
+
+   udevadm monitor -pku
+
+Example output:
+
+.. code-block::
+
+    KERNEL[152.717414] change   /devices/platform/output-usb3 (platform)
+    ACTION=change
+    DEVPATH=/devices/platform/output-usb3
+    SUBSYSTEM=platform
+    NAME=event
+    EVENT=OVER_CURRENT
+    DRIVER=reg-userspace-consumer
+
+Handling Events with Udev Rules
+-------------------------------
+
+Userspace can react to these events by creating udev rules. For example,
+to trigger a script on an OVER_CURRENT event:
+
+.. code-block:: udev
+
+    # /etc/udev/rules.d/99-regulator-events.rules
+    ACTION=="change", SUBSYSTEM=="platform", DRIVER="reg-userspace-consumer", ENV{EVENT}=="OVER_CURRENT", RUN+="/usr/local/bin/handle-regulator-event.sh"
+
+A sample handler script:
+
+.. code-block:: bash
+
+    #!/bin/sh
+    logger "Handle regulator ${EVENT} on ${DEVPATH}"
+    # Add additional handling logic here
+    case "${EVENT}" in
+    OVER_CURRENT)
+      echo disabled > /sys"${DEVPATH}"/state
+    esac
+
+API Stability
+-------------
+
+This interface is considered stable. New regulator events may be added
+in the future, with corresponding documentation updates.
+
+References
+----------
+
+- Kernel Header File: ``include/uapi/regulator/regulator.h``
+- Driver Source: ``drivers/regulator/userspace-consumer.c``
-- 
2.39.5

