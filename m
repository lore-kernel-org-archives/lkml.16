Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82331268C6B;
	Fri,  2 May 2025 08:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746173358; cv=none; b=epI8mOWFNbhp8SAa4pbaRyssIxXyrnSCnY0WFJVUZvfGYaRW91J2f6ngrNGGir0Ks0O2CRTHyv9+5mbV3rStevhmotpFIhStbEc8gBZmm9VFoe030l62D1dt9/WZjwQMAm5BU8Pq2DCHnPYESkBVgQzYMfvf5I/Y5pMREc4hQJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746173358; c=relaxed/simple;
	bh=L/55x76jq/qiQEmKk7ejxbxAQIAOe3h5IfdGTNBl5v0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=UTgFcz56Mj7IHOt1Ca9U3xyD3aHLOwuUWOWthlfTAL86fpO52idPDQHM4op7kSrqEY1d0C0OxWxCjmhE8JyD2cKjNag955s0Y0DLuesIPXM8iqGsbyYrTSSh8/fQiCRPLyGOGbeYxmhMNoPCNLJeeZZkJWL9/HWvd1q4oytZq0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GhRTSV34; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GhRTSV34"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E5C93C4CEE4;
	Fri,  2 May 2025 08:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746173356;
	bh=L/55x76jq/qiQEmKk7ejxbxAQIAOe3h5IfdGTNBl5v0=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=GhRTSV34QIRiNaHFws/2YCtVEf0KfmYQucJN52woJV620ZFu5d5h4lxfn1inB5I7j
	 gsgM/LfMfS1yOx3kn6tSpjGNaoaP2QunkRVjNpWN8HZbzjEq2XUi6Qp1RPrKRG24vz
	 zrqH8J17ipveqPMTaMTtUfnXG07qGh5L/Ny8uk9jwuDZpcakWEMGeGrLA+7OXwCAwJ
	 KZ5g1PjFOzHqzC4lJ4bS6KPht+VFqP2DGNISO/dPdM8zfz8auYXrBsz9uyrjl6pnFc
	 jZEOX50EIBsGcZhmXz+QKN1A6CpLhYOLSMrPuqKkc6MloSroU/LEZnjPw39ZMYVGbQ
	 jAQFBJEoUUwgA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D563BC3ABAC;
	Fri,  2 May 2025 08:09:16 +0000 (UTC)
From: Kurt Borja via B4 Relay <devnull+kuurtb.gmail.com@kernel.org>
Subject: [PATCH v3 0/2] platform/x86: alienware-wmi-wmax: Add support for
 GPIO methods
Date: Fri, 02 May 2025 05:08:59 -0300
Message-Id: <20250502-awcc-gpio-v3-0-ea9a932d1124@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJt9FGgC/02MwQ6DIBAFf8VwLg27gKY99T+aHhBRN6lioKFtj
 P9eND1wnJc3s7LoArnIrtXKgksUyc8Z5KlidjTz4Dh1mRkK1EKB5OZtLR8W8hxVC722WtUdsvx
 fguvpc7Tuj8wjxZcP3yOdYF//FSwrCbjgUAsD0FrZX8xtmAw9z9ZPbK8kLM2mNDGbtpEgG9nqT
 mBpbtv2A7a35ITcAAAA
X-Change-ID: 20250413-awcc-gpio-24b1f5c546d2
To: Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Armin Wolf <W_Armin@gmx.de>
Cc: Gabriel Marcano <gabemarcano@yahoo.com>, 
 platform-driver-x86@vger.kernel.org, Dell.Client.Kernel@dell.com, 
 linux-kernel@vger.kernel.org, Kurt Borja <kuurtb@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1694; i=kuurtb@gmail.com;
 h=from:subject:message-id;
 bh=L/55x76jq/qiQEmKk7ejxbxAQIAOe3h5IfdGTNBl5v0=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDBkitav2S5pG/troxzWzYR6HlKjlk5650qGtl/VCJ0xs0
 cr/9om1o5SFQYyLQVZMkaU9YdG3R1F5b/0OhN6HmcPKBDKEgYtTACbiYszIcNLy0cZoIbkV6TF7
 r1xyWV3K/XdyTYZsRIKnr033TKPb1gx/hSqeZS5/mPMrTdKr045nXh3Du9vGl1mEp7w5skxcYeI
 6ZgA=
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
 Documentation/wmi/devices/alienware-wmi.rst     |  82 +++++++++++++++++-
 drivers/platform/x86/dell/alienware-wmi-wmax.c  | 105 +++++++++++++++++++++++-
 3 files changed, 201 insertions(+), 6 deletions(-)
---
base-commit: f618f1b298d3195d363b20f158ccb3facf553f0d
change-id: 20250413-awcc-gpio-24b1f5c546d2

Best regards,
-- 
 ~ Kurt


