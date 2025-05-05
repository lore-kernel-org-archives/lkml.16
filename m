Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C42F1B0F31;
	Mon,  5 May 2025 18:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746470634; cv=none; b=nF3KK4jZpW7SfQEtqCsPJRafxGYPMrIQbx3d71K2kMsSiV1ZsoWdU3xFe876Cj19R01YsBQfOr8clK57QZhGOh7LKEyEXkF1lJaJyeS7kRcFA9Ub5Uxlfr1zaDsNoUYcPrd508iXH/PcpKYICfnp4ZaAWCYxa3WHbCPNKSZT6RE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746470634; c=relaxed/simple;
	bh=LbuYk15hVptDZsuRbMqI5YgO3RsvLpjnt+XuoYI2XaI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=R/WTGNmfqvHIo5nhlu/rnRn7GmbJDcs2J4SBZiWWJu7eAJO4jTuTBHrX5N+vXHcpFxVzXGtcTzo3t6FgFJod6+M5q8QEAyIsXIMDB1pLeAu+vXsEjNHTUBLHOkVXp+rN6X14vkKUT1r+DIrBE4oAEg9kQPMiDVq9EmeKMgHge08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RSMLSwyj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RSMLSwyj"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 09A88C4CEE4;
	Mon,  5 May 2025 18:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746470634;
	bh=LbuYk15hVptDZsuRbMqI5YgO3RsvLpjnt+XuoYI2XaI=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=RSMLSwyjuf/aUVLVbsPtvHS5RmZ7MU4VYH4jTbHX7gVskffXjV2gg6oYQxnYSg2qQ
	 1dONMxyZCLLnqftYqA++ANtfpKwl34+jkF71JqoHIUQfYpcMHYIUf1Hh513Oo3NLBP
	 5PgXEKkNtfqKfR0vS2Ry7E3XiSeWB90d6z8wsxE6VkDNDk656i58SZnD+OJ78a0QP2
	 5DItM0+5K9jk91xRoUuussvulN4Zjlpw3tjpbXHjU1eNRm5yNplthc6+YT0ow++Ote
	 jupZtzZwKiNyD//2SwmoTMTQvqX3k02uXecB3S1iH0Di6JlvLgwWMVCyC+T+JMAMGE
	 raOkKK1gODx6Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED4B4C3ABBC;
	Mon,  5 May 2025 18:43:53 +0000 (UTC)
From: Kurt Borja via B4 Relay <devnull+kuurtb.gmail.com@kernel.org>
Subject: [PATCH v4 0/2] platform/x86: alienware-wmi-wmax: Add support for
 GPIO methods
Date: Mon, 05 May 2025 15:43:30 -0300
Message-Id: <20250505-awcc-gpio-v4-0-edda44c3a0dc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANIGGWgC/13M0QrCIBTG8VcZXmd4jrqxrnqP6MKp24SWQ8OKs
 XfPjSDp8juc338h0QZnIzlVCwk2uej8PQ9xqIge1X2w1Jm8CTKUTACn6qk1HWbnKYoOeqmlqA2
 S/D8H27vX3rpc8x5dfPjw3tMJtuu3gmUlAWUUaqYAOs37Vp2HSbnbUfuJbJWEpWxKiVnqhgNve
 CcNw3/Jf1IyLCXP0qpWtRwNAIpSruv6ARus38EWAQAA
X-Change-ID: 20250413-awcc-gpio-24b1f5c546d2
To: Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Armin Wolf <W_Armin@gmx.de>
Cc: Gabriel Marcano <gabemarcano@yahoo.com>, 
 platform-driver-x86@vger.kernel.org, Dell.Client.Kernel@dell.com, 
 linux-kernel@vger.kernel.org, Kurt Borja <kuurtb@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1934; i=kuurtb@gmail.com;
 h=from:subject:message-id;
 bh=LbuYk15hVptDZsuRbMqI5YgO3RsvLpjnt+XuoYI2XaI=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDBmSbFcldaW/3n4TcmjDk3sC+ev23X+1sN7WfxrvCVm+6
 MubvXeEdJSyMIhxMciKKbK0Jyz69igq763fgdD7MHNYmUCGMHBxCsBEXCIYGT7t3LY4znne4d0n
 dVg2hLmLxN6Zr3b97PM8tkqp/LTNPb8ZGV6J+qybV/jl8brFRcabEo/0xEj9dmmasyY10yi7UmQ
 qPzsA
X-Developer-Key: i=kuurtb@gmail.com; a=openpgp;
 fpr=54D3BE170AEF777983C3C63B57E3B6585920A69A
X-Endpoint-Received: by B4 Relay for kuurtb@gmail.com/default with
 auth_id=387
X-Original-From: Kurt Borja <kuurtb@gmail.com>
Reply-To: kuurtb@gmail.com

Hi all,

I found a great blog post [1], which described the reverse engineering
process of the GPIO control methods present on this device.

In summary, these methods expose some debugging capabilities of the RGB
lighting controller present on Dell gaming laptops. See [Patch 2] for
more info.

Exposing these methods to DebugFS is useful for developers exploring
this RGB controllers (myself included).

Thanks for your feedback!

[1] https://gabriel.marcanobrady.family/blog/2024/12/16/dell-g5-5505-se-acpi-or-figuring-out-how-to-reset-the-rgb-controller/

Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
Changes in v4:
- Reuse name[] for all file a directory names in awcc_debugfs_init()
- Reword commit message to correctly reflect previous changes
- Link to v3: https://lore.kernel.org/r/20250502-awcc-gpio-v3-0-ea9a932d1124@gmail.com

Changes in v3:
- Create pinX files dynamically, based on GPIO pin count
- Added note on dummy input arguments in Documentation
- Link to v2: https://lore.kernel.org/r/20250427-awcc-gpio-v2-0-c731373b5d02@gmail.com

Changes in v2:
- Dropped module parameter
- Added ABI documentation to Patch 1
- Small improvements to documentation based on Armin's comments
- Improved Pin description table format
- Link to v1: https://lore.kernel.org/r/20250423-awcc-gpio-v1-0-160a11bc3f9a@gmail.com

---
Kurt Borja (2):
      platform/x86: alienware-wmi-wmax: Expose GPIO debug methods
      Documentation: wmi: alienware-wmi: Add GPIO control documentation

 Documentation/ABI/testing/debugfs-alienware-wmi |  20 +++++
 Documentation/wmi/devices/alienware-wmi.rst     |  82 ++++++++++++++++++-
 drivers/platform/x86/dell/alienware-wmi-wmax.c  | 104 +++++++++++++++++++++++-
 3 files changed, 201 insertions(+), 5 deletions(-)
---
base-commit: 67e2635fe0cca5f0383c0780db986d8237e83f0a
change-id: 20250413-awcc-gpio-24b1f5c546d2

Best regards,
-- 
 ~ Kurt


