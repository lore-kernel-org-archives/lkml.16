Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7DA923FC4C;
	Sun, 27 Apr 2025 06:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745735120; cv=none; b=fPBW0eMhNZF1JGeu1xnD086hpar3p2sjFcieQBroN+nAkHr7IdO1BbConbyHsj51C6/0ISZZF05VUiXYWkPwXFstw/ww0+Z8y8fe0SX1pAz0QQaUACA9MmpoWlPGw+Varz0Qiv54FcUUaeO5ThHiOCKPxJPFzKi0n2OgsrQGJW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745735120; c=relaxed/simple;
	bh=FWcrry3t+sNJr7gey8S2h20kX41J+xHQ2HEJQdJI/MY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HqT/P2El3z5QNUdCbFjglScOL45nG/BOC1j7djQwUnfkDbx2e4J9SQI1HcRIDWrQu5ADQW9PHoQs+JQ/13Of2oxE4ns6nFa3mH7+QGXMHy0ORsGJfAyUfMG+qOLPC2X68dEABHjbCgxwpwFo6+FoeyZkniTHWxGqhLWZTgLlKfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kXHp5+UO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kXHp5+UO"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3CC88C4CEE9;
	Sun, 27 Apr 2025 06:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745735118;
	bh=FWcrry3t+sNJr7gey8S2h20kX41J+xHQ2HEJQdJI/MY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=kXHp5+UOdI63m9dvZW+5Xg6AogHZ1dyNyO13UomNy911DPgqSax42ihHIfZ8RBrbF
	 SBhiuicu25bXFXXL/E5NDUSNTKOBGZNFsHB6s38hSzEL4LjPbEEs7QUbuoscCTFMmz
	 WqffgqFvGhcmKGvremIM3jeQOy2asZSM7WO4NrFfwx9sD+rhSxVjXcDVGdtZ+wSxYn
	 RoHqs3Wd5gI6fDb/TBEb2WwI7LrfWiGjiM9atEtwTt0S8FQZNnANypVgKA9FRqf/nH
	 Y5mCzl4LUmyDaxoAYDJ3rJKJO3iH5M8KT2eJOAYPoKKivhA7+vp1CR4ENheRxFJuvs
	 AC/ipHjzQxYYg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FB14C369DC;
	Sun, 27 Apr 2025 06:25:18 +0000 (UTC)
From: Kurt Borja via B4 Relay <devnull+kuurtb.gmail.com@kernel.org>
Date: Sun, 27 Apr 2025 03:24:49 -0300
Subject: [PATCH v2 2/2] Documentation: wmi: alienware-wmi: Add GPIO control
 documentation
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250427-awcc-gpio-v2-2-c731373b5d02@gmail.com>
References: <20250427-awcc-gpio-v2-0-c731373b5d02@gmail.com>
In-Reply-To: <20250427-awcc-gpio-v2-0-c731373b5d02@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Armin Wolf <W_Armin@gmx.de>
Cc: Gabriel Marcano <gabemarcano@yahoo.com>, 
 platform-driver-x86@vger.kernel.org, Dell.Client.Kernel@dell.com, 
 linux-kernel@vger.kernel.org, Kurt Borja <kuurtb@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5285; i=kuurtb@gmail.com;
 h=from:subject:message-id;
 bh=zC8+gJDq11VBsTxTMVnO6aUkwcVu2ZYewNrS8rkQd+k=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDBm8Z8+4+7vMOnyoK9+6QtPZIvq0nU+WWtNaRYmdT+u3Z
 3LZ9p7rKGVhEONikBVTZGlPWPTtUVTeW78Dofdh5rAygQxh4OIUgIkcuMPwT99iWi4b75XcjcLi
 AS+1fjak/A5cZZO9JphHRrjR8LjzRkaGv2fu50VNfPWs4b3Y7zdLZAOSEi/efqaew37ni7aVaZQ
 qHwA=
X-Developer-Key: i=kuurtb@gmail.com; a=openpgp;
 fpr=54D3BE170AEF777983C3C63B57E3B6585920A69A
X-Endpoint-Received: by B4 Relay for kuurtb@gmail.com/default with
 auth_id=387
X-Original-From: Kurt Borja <kuurtb@gmail.com>
Reply-To: kuurtb@gmail.com

From: Kurt Borja <kuurtb@gmail.com>

Add documentation for the GPIO control methods.

Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 Documentation/wmi/devices/alienware-wmi.rst | 78 +++++++++++++++++++++++++++--
 1 file changed, 74 insertions(+), 4 deletions(-)

diff --git a/Documentation/wmi/devices/alienware-wmi.rst b/Documentation/wmi/devices/alienware-wmi.rst
index 79238051b18bc5de9b502325017cd5c5fcf41748..2a6052efb9ae0e3fe0a5d9d5775073234dfc96fb 100644
--- a/Documentation/wmi/devices/alienware-wmi.rst
+++ b/Documentation/wmi/devices/alienware-wmi.rst
@@ -231,6 +231,70 @@ WMI method MemoryOCControl([in] uint32 arg2, [out] uint32 argr)
 AWCC supports memory overclocking, but this method is very intricate and has
 not been deciphered yet.
 
+GPIO control Methods
+====================
+
+Alienware and Dell G Series devices with the AWCC interface usually have an
+embedded STM32 RGB lighting controller with USB/HID capabilities. It's vendor ID
+is ``187c`` while it's product ID may vary from model to model.
+
+The control of two GPIO pins of this MCU is exposed as WMI methods for debugging
+purposes.
+
++--------------+--------------------------------------------------------------+
+| Pin          | Description                                                  |
++==============+===============================+==============================+
+| 0            | Device Firmware Update (DFU)  | **HIGH**: Enables DFU mode   |
+|              | mode pin.                     | on next MCU boot.            |
+|              |                               +------------------------------+
+|              |                               | **LOW**: Disables DFU mode   |
+|              |                               | on next MCU boot.            |
++--------------+-------------------------------+------------------------------+
+| 1            | Negative Reset (NRST) pin.    | **HIGH**: MCU is ON.         |
+|              |                               |                              |
+|              |                               +------------------------------+
+|              |                               | **LOW**: MCU is OFF.         |
+|              |                               |                              |
++--------------+-------------------------------+------------------------------+
+
+See :ref:`acknowledgements` for more information on this MCU.
+
+.. note::
+   Some GPIO control methods break the usual argument structure and take a
+   **Pin number** instead of an operation on the first byte.
+
+WMI method FWUpdateGPIOtoggle([in] uint32 arg2, [out] uint32 argr)
+------------------------------------------------------------------
+
++--------------------+------------------------------------+--------------------+
+| Operation (Byte 0) | Description                        | Arguments          |
++====================+====================================+====================+
+| Pin number         | Set the pin status                 | - Byte 1: Pin      |
+|                    |                                    |   status           |
++--------------------+------------------------------------+--------------------+
+
+WMI method ReadTotalofGPIOs([out] uint32 argr)
+----------------------------------------------
+
++--------------------+------------------------------------+--------------------+
+| Operation (Byte 0) | Description                        | Arguments          |
++====================+====================================+====================+
+| 0x00               | Get the total number of GPIOs      | - None             |
++--------------------+------------------------------------+--------------------+
+
+WMI method ReadGPIOpPinStatus([in] uint32 arg2, [out] uint32 argr)
+------------------------------------------------------------------
+
++--------------------+------------------------------------+--------------------+
+| Operation (Byte 0) | Description                        | Arguments          |
++====================+====================================+====================+
+| Pin number         | Get the pin status                 | - None             |
++--------------------+------------------------------------+--------------------+
+
+.. note::
+   There known firmware bug in some laptops where reading the status of a pin
+   also flips it.
+
 Other information Methods
 =========================
 
@@ -239,10 +303,16 @@ WMI method ReadChassisColor([out] uint32 argr)
 
 Returns the chassis color internal ID.
 
+.. _acknowledgements:
+
 Acknowledgements
 ================
 
-Kudos to `AlexIII <https://github.com/AlexIII/tcc-g15>`_ and
-`T-Troll <https://github.com/T-Troll/alienfx-tools/>`_ for documenting and
-testing some of this device's functionality, making it possible to generalize
-this driver.
+Kudos to
+
+* `AlexIII <https://github.com/AlexIII/tcc-g15>`_
+* `T-Troll <https://github.com/T-Troll/alienfx-tools/>`_
+* `Gabriel Marcano <https://gabriel.marcanobrady.family/blog/2024/12/16/dell-g5-5505-se-acpi-or-figuring-out-how-to-reset-the-rgb-controller/>`_
+
+for documenting and testing some of this device's functionality, making it
+possible to generalize this driver.

-- 
2.49.0


