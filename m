Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F4A626FA5D;
	Mon,  5 May 2025 18:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746470634; cv=none; b=qMHQaM0AG0csBSpmexGsx4X+796hGBN9bBlMSsytkPYYfcNfvYtucsrD9X4FZgoIFKrVm/i5uawHaNmqMgZZnpaOCDx8RjmHHaD5jJUzLy44CprjVEa1odcojXKmYhLqnoPraJ+HJENKYcgNuHBJoIONBRaRXjl5ZfdeVKO8NWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746470634; c=relaxed/simple;
	bh=222XQO8mIFdeK93gPTX+FiisVY1wVm+zHaX+uMTtNyk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rsMjPGyKAyDpWXHHiqbHmDYeRUgtAM16FmACuv4Bj/WCoT02htNziRWTcujhDeXn4RwHk+N3aKHGtQN+unjyObT4SwCG9RLWf5ZpOsEbalXwbWEC1eNXzNXTVH50shlnb9s+WcJgmjgblgX3lVIPOthyEvWSdA7IMaPV+/ewwrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nu9wOlzA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nu9wOlzA"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2509EC4CEE9;
	Mon,  5 May 2025 18:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746470634;
	bh=222XQO8mIFdeK93gPTX+FiisVY1wVm+zHaX+uMTtNyk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Nu9wOlzA6oj2bq6Rh0Y2n77R+wHlhkO09NwvtVGDGY6FDESPx1vCYO46d4ZrJP7fl
	 x3uOwPA5oqwXWCoCuTkVYkNec3r0DYksj58yGHK+Fhbwm5I4mISkQHUGbpTUN3N+2p
	 opYjqyGzqUlGCldhZMxxGguUMrX12WfEXl0oNtvpZwD3rRCUv1CLbT6rCQCLuBtd9e
	 rKZuXUX0GBZnu2QhGunhNHdydQFFgSv4Cfe+d0Uf6uD41GWGKd0crz1x9meWUTfU5C
	 hq+fSinEYY8sDKfZQCcHrB9lshkltYz0GcqMkHfdtdk9ipdX0rGPE5IqKjv4Jyt4Cn
	 HlfNCS47I+7lQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1612AC3ABBF;
	Mon,  5 May 2025 18:43:54 +0000 (UTC)
From: Kurt Borja via B4 Relay <devnull+kuurtb.gmail.com@kernel.org>
Date: Mon, 05 May 2025 15:43:32 -0300
Subject: [PATCH v4 2/2] Documentation: wmi: alienware-wmi: Add GPIO control
 documentation
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250505-awcc-gpio-v4-2-edda44c3a0dc@gmail.com>
References: <20250505-awcc-gpio-v4-0-edda44c3a0dc@gmail.com>
In-Reply-To: <20250505-awcc-gpio-v4-0-edda44c3a0dc@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Armin Wolf <W_Armin@gmx.de>
Cc: Gabriel Marcano <gabemarcano@yahoo.com>, 
 platform-driver-x86@vger.kernel.org, Dell.Client.Kernel@dell.com, 
 linux-kernel@vger.kernel.org, Kurt Borja <kuurtb@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5479; i=kuurtb@gmail.com;
 h=from:subject:message-id;
 bh=E4gkeRIqe9/4ceUXqpKcpLW0DOBvrYPY99p6cCu4H4U=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDBmSbC84Lm5vcFxpVPt8ofD6M7/v5WQn2514oyLZo6Jgf
 MmhP8Sxo5SFQYyLQVZMkaU9YdG3R1F5b/0OhN6HmcPKBDKEgYtTACZS3s7IcDTKnffWPkEF3vQ1
 G6ymGX3PXh4dF9915pZwXkKoltWTDwx/xUIiT8cuWjP3ogBj5KRGI6nG8DsODxc8X5scLMzG8z6
 SAwA=
X-Developer-Key: i=kuurtb@gmail.com; a=openpgp;
 fpr=54D3BE170AEF777983C3C63B57E3B6585920A69A
X-Endpoint-Received: by B4 Relay for kuurtb@gmail.com/default with
 auth_id=387
X-Original-From: Kurt Borja <kuurtb@gmail.com>
Reply-To: kuurtb@gmail.com

From: Kurt Borja <kuurtb@gmail.com>

Add documentation for the GPIO control methods.

Reviewed-by: Armin Wolf <W_Armin@gmx.de>
Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 Documentation/wmi/devices/alienware-wmi.rst | 82 +++++++++++++++++++++++++++--
 1 file changed, 78 insertions(+), 4 deletions(-)

diff --git a/Documentation/wmi/devices/alienware-wmi.rst b/Documentation/wmi/devices/alienware-wmi.rst
index 79238051b18bc5de9b502325017cd5c5fcf41748..1d9d43e2e314b03c134e6c63a0f9124036939e32 100644
--- a/Documentation/wmi/devices/alienware-wmi.rst
+++ b/Documentation/wmi/devices/alienware-wmi.rst
@@ -231,6 +231,74 @@ WMI method MemoryOCControl([in] uint32 arg2, [out] uint32 argr)
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
+| N/A                | Get the total number of GPIOs      | - None             |
++--------------------+------------------------------------+--------------------+
+
+.. note::
+   Due to how WMI methods are implemented on the firmware level, this method
+   requires a dummy uint32 input argument when invoked.
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
 
@@ -239,10 +307,16 @@ WMI method ReadChassisColor([out] uint32 argr)
 
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


