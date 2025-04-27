Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5DE323E340;
	Sun, 27 Apr 2025 06:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745735118; cv=none; b=Acu2KcpkTAiN0oS0n7sy3nfEm01V1YZcWt1cjsUIY+R+5hkwNtaNvDYiQpxz9TQD1p160EiSrWpwNn6hyuHGi+pFKcXnoh3eWhzzL1gx2vGQLeI8x38WZSfmjI+FDH+JuP/M5aVgeDe+hcZ+GMGJ+MnTYmPrk/bFBye0EWNE2eI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745735118; c=relaxed/simple;
	bh=SnRI4E+XNy8GG/C2Rg6Ulr3oImnQQogQ6gtX19wzy+g=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hGLq4W2wXO9ORMiupwXu/VA22YZ90lLnbOnrvGZhEg0Q2EcYEMm4Pb5184zPb9O2TfIl3n+7OH9qzsvIy9b5LyG+JOGCCiQ6D2eP9qKWwup4hV8F20y1BuVIX6kGFjANza8YYyrtOh+ANiaOKIV2JiNW/YaO+81iq1PJJjqjqNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jiJztOKu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jiJztOKu"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 270D4C4CEE3;
	Sun, 27 Apr 2025 06:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745735118;
	bh=SnRI4E+XNy8GG/C2Rg6Ulr3oImnQQogQ6gtX19wzy+g=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=jiJztOKuNIOIsK1QSHy3DT9ZMn5lWJodKrCM/ldYEs3W+OmPyA2KZIgDRJ2S/8GDg
	 p6aJS1wgNXSO8Pobtg1lQnRa7Tnhb3B0dFLftM70Ghy8EuvSmq7xH5H0YE8YFf4ITn
	 TuRcOZZqChflR79nCpWyAwE+kXP9Rqnv+qJvTBMYzggtcMOBBNqxGROEQXqFgjabnC
	 NRiXg1kWRjujY6sEQGTuOjJJaI6oT+TVges2tex1QOCYTdur53vekxzPli3d+i/pzC
	 UFoC2zUvBbZlw7h0zKIx6mKWwYhrkxd7c4uvraQZyIBU0MXf4sKOOs3BdjvTZ/GmBH
	 3e0woOxNvxEjg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 134FAC369D5;
	Sun, 27 Apr 2025 06:25:18 +0000 (UTC)
From: Kurt Borja via B4 Relay <devnull+kuurtb.gmail.com@kernel.org>
Subject: [PATCH v2 0/2] platform/x86: alienware-wmi-wmax: Add support for
 GPIO methods
Date: Sun, 27 Apr 2025 03:24:47 -0300
Message-Id: <20250427-awcc-gpio-v2-0-c731373b5d02@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK/NDWgC/03MQQ7CIBCF4as0sxbDUGiiK+/RdEEp0ElsacCgp
 uHuYuPC5f/y8u2QbCSb4NrsEG2mRGGtIU4NmFmv3jKaaoPgQnGJLdNPY5jfKDAhR3TKKNlNAup
 /i9bR67D6ofZM6RHi+6AzftefIv6VjIwz7LhGHE3rLvrmF033swkLDKWUD5r/8sGiAAAA
X-Change-ID: 20250413-awcc-gpio-24b1f5c546d2
To: Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Armin Wolf <W_Armin@gmx.de>
Cc: Gabriel Marcano <gabemarcano@yahoo.com>, 
 platform-driver-x86@vger.kernel.org, Dell.Client.Kernel@dell.com, 
 linux-kernel@vger.kernel.org, Kurt Borja <kuurtb@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1473; i=kuurtb@gmail.com;
 h=from:subject:message-id;
 bh=SnRI4E+XNy8GG/C2Rg6Ulr3oImnQQogQ6gtX19wzy+g=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDBm8Zw9//5QTbaPZ1HxRxurjnuzSKWL7n5pcWO+x7QvT3
 OKemSbRHaUsDGJcDLJiiiztCYu+PYrKe+t3IPQ+zBxWJpAhDFycAjCRCbUM/zN1edYYK16XShHd
 rGk2d+KJfd9mXrkRL/DpN/sJjvl/3NYyMjzvPab+Za9hoNG5+N8cxbaBSdsD2WcY3lj3+51RR+z
 zMAYA
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
 Documentation/wmi/devices/alienware-wmi.rst     |  78 ++++++++++++++++-
 drivers/platform/x86/dell/alienware-wmi-wmax.c  | 108 +++++++++++++++++++++++-
 3 files changed, 201 insertions(+), 5 deletions(-)
---
base-commit: 981527828c301644bc4014faa9c523e8a5e32a32
change-id: 20250413-awcc-gpio-24b1f5c546d2

Best regards,
-- 
 ~ Kurt


