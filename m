Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 799AE14A0B7;
	Fri, 25 Apr 2025 15:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745595922; cv=none; b=lRKs0QbSbIxStq27xNPn090JlIhCWFzy0n2XryYCB26mtt1YbPMpTc6ikKuMgXjsJhmpNPd2vpHmOGkvJxs8ELh2NNmllzW4huranJNwFckMn3rcIA0/zQLtcfyC5N4mSxAyrhnL/bY8UrlZSdVJyoNX/bqD5E7H8XmkCTpxueg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745595922; c=relaxed/simple;
	bh=pDgkUVe28oVTN5MSvErUnjN2xGQ1drBuKrCY7rObOoM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=acDh4m/UDEEn3Y/huutTX1XiUeMktnlZrDLO4n6yxz9FmIF5Og/8cI3lV/CXse8/BVsq5Sbbznpd6NWp5osuPgdxHUq1iR/EG1a7VVfsetiSrdEDzCUrQeRvdeay0J4xAvrkXoM/iAYFn2vWlRUX0IMwoX70QROPFVtcQUhiKEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dfpioFP2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dfpioFP2"
Received: by smtp.kernel.org (Postfix) with ESMTPS id EFAF1C4CEE4;
	Fri, 25 Apr 2025 15:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745595922;
	bh=pDgkUVe28oVTN5MSvErUnjN2xGQ1drBuKrCY7rObOoM=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=dfpioFP2tk8m4MFjj6Eo32Yae77XFKfMYuY6wHm5f+6RXzugT7GOVFmJf/8cv0V6i
	 oIALwRUfJb4vwRk7GuMbVaLz2MMNl7gien4varSEemSTDXIsHG6oeowdgN/MNm3qeO
	 L5VYwaq70ldIAepO/eHaLcYK0+bYFzYvjjQwUfo1Z3E60LqsMNuhUS/SjNPHVjJb1C
	 BAH5ZglFhb6C5xvlMQH19SHP4h7LKKaTLkqUMImndqLw11MTGkquWjWWrJq0xnCQLm
	 Z2uOFqDAuB5WmdkVm0/Vlubbgf8r5I60f8G7KOn7LvxIKEHzXqzUO+9RQMYe8JOLGs
	 p3L0VO0ygKSpA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB98CC369C2;
	Fri, 25 Apr 2025 15:45:21 +0000 (UTC)
From: Kurt Borja via B4 Relay <devnull+kuurtb.gmail.com@kernel.org>
Subject: [PATCH 0/2] platform/x86: alienware-wmi-wmax: Fix unitialized
 variables in awcc_hwmon_fans_init()
Date: Fri, 25 Apr 2025 12:45:05 -0300
Message-Id: <20250425-temp-id-fix-v1-0-372d71f732bf@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAGuC2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDEyNT3ZLU3AKgmG5aZoWuYaJRanKKuUGqsaWhElBHQVEqUBhsWnRsbS0
 AyTz+110AAAA=
X-Change-ID: 20250425-temp-id-fix-1a2ecd70e391
To: =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Hans de Goede <hdegoede@redhat.com>, Armin Wolf <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org, Dell.Client.Kernel@dell.com, 
 linux-kernel@vger.kernel.org, Kurt Borja <kuurtb@gmail.com>, 
 kernel test robot <lkp@intel.com>, Dan Carpenter <dan.carpenter@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=564; i=kuurtb@gmail.com;
 h=from:subject:message-id;
 bh=pDgkUVe28oVTN5MSvErUnjN2xGQ1drBuKrCY7rObOoM=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDBnc6wQUP6yZWv3Ef6PHuuCqd9GXp4kvti0SsF4cL5t+d
 vUyK/3WjlIWBjEuBlkxRZb2hEXfHkXlvfU7EHofZg4rE8gQBi5OAZiIRwLDfz+vXE6Opt/pB3Tt
 vCWluxV4qpY8WbpiQoPZj/MtARPun2X4X8BYu36mXpiiy4cJpx61Tjjwzbr+wIfa/a5z8sP/T5N
 s4wcA
X-Developer-Key: i=kuurtb@gmail.com; a=openpgp;
 fpr=54D3BE170AEF777983C3C63B57E3B6585920A69A
X-Endpoint-Received: by B4 Relay for kuurtb@gmail.com/default with
 auth_id=387
X-Original-From: Kurt Borja <kuurtb@gmail.com>
Reply-To: kuurtb@gmail.com

Hi Ilpo,

These are based on the for-next branch. Thanks!

Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
Kurt Borja (2):
      platform/x86: alienware-wmi-wmax: Fix uninitialized bitmap in awcc_hwmon_fans_init()
      platform/x86: alienware-wmi-wmax: Fix awcc_hwmon_fans_init() label logic

 drivers/platform/x86/dell/alienware-wmi-wmax.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)
---
base-commit: 981527828c301644bc4014faa9c523e8a5e32a32
change-id: 20250425-temp-id-fix-1a2ecd70e391

Best regards,
-- 
 ~ Kurt


