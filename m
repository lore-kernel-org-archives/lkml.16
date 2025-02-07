Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D3E1624C3;
	Fri,  7 Feb 2025 11:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738928809; cv=none; b=P19enRTWq6XqsI0kCPvvtki0+ERn8VoIt0s4FIBidOYGAf0ow8SZvApNlf0V0NZ5Db8KPKKasMcbK45yu6oRj6Oa30hcyI11cRSd7hUpEReKDZ+s/+ntKGh1UT9VUkBXy/irF0tCL/vZpLdUr7USG9D+/w8Iqpgo/9rPY+AKAzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738928809; c=relaxed/simple;
	bh=sjN/g62W9GZCGhfmhpvikdNIpkQvCQh2KKR1vBQPh84=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DtT1TiHgyHCTvVwf+WJURtEJfMmKmjMzj2LBqCay77wqbdHrGvnLGPKGvNt4EUy6ffST7Z/PoF27RRlbii8zKA0N5KCoq0KCIYw9n37Po0RAEPOmW1hCFkN4MkuZOf6z41UiiwHZK1U3P23HwRBcyn2VqDLdhagQxoG3prsn8sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=emrjmMB0; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="emrjmMB0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1738928805;
	bh=sjN/g62W9GZCGhfmhpvikdNIpkQvCQh2KKR1vBQPh84=;
	h=From:Subject:Date:To:Cc:From;
	b=emrjmMB0ml5lExd73luM0XYoz4ylcY4lNsZtA9QhEB9JjTAqzPnYAT07xZlTihLBd
	 kJf+a9zvQCvxRF2DjcQ3Fb/w1n7qVtTPrNO17XXM53mV1Z5wvi4WIlwaJYShWJX3hP
	 ZX/0wUiAONIjYGjGGOuFkeOL22Sl5ZyA5R6Ea62LtIF9ojslqCbalmEk2JOnFAaI+l
	 kCX/MEohlxcJk73r+r2todghlKSw67UtGznO/WRRNBmiY7sBt05Gmx0gLauLzV3eBe
	 +K356uuNZbT4VecR75ZAw6q6qkSqnnu2pxyGYKjY1qMAXdGIZcXkA2ZbZQAAATCpPL
	 ymWb1sgwiOW+w==
Received: from localhost (unknown [188.27.58.83])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id C726D17E0850;
	Fri,  7 Feb 2025 12:46:44 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: [PATCH 0/4] Sound fix for Valve Steam Deck OLED on resume from
 suspend
Date: Fri, 07 Feb 2025 13:46:01 +0200
Message-Id: <20250207-sof-vangogh-fixes-v1-0-67824c1e4c9a@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHnypWcC/x3LQQqAIBBA0avErBswK5SuEi2kxpqNhgMShHdva
 Pl5/BeECpPA0r1QqLJwThpD38F+hXQS8qEN1tjZWONQcsSqkM8LIz8kOFsf4mEm70YH+t2FftB
 t3Vr7ABk/fZVjAAAA
X-Change-ID: 20250207-sof-vangogh-fixes-528afd048737
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>, 
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
Cc: kernel@collabora.com, sound-open-firmware@alsa-project.org, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2

Stress testing resume from suspend on Valve Steam Deck OLED (Galileo)
revealed that audio may break and cannot be recovered without performing
a system reboot.

This patch series provides a new ACP quirk to address the issue, along
with a few additional improvements to AMD Vangogh/ACP SOF drivers.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
Cristian Ciocaltea (4):
      ASoC: SOF: amd: Add post_fw_run_delay ACP quirk
      ASoC: SOF: amd: Drop unused includes from Vangogh driver
      ASoC: SOF: amd: Handle IPC replies before FW_BOOT_COMPLETE
      ASoC: SOF: amd: Add branch prediction hint in ACP IRQ handler

 sound/soc/sof/amd/acp-ipc.c     | 25 +++++++++++++++++--------
 sound/soc/sof/amd/acp.c         |  1 +
 sound/soc/sof/amd/acp.h         |  1 +
 sound/soc/sof/amd/pci-vangogh.c |  2 --
 sound/soc/sof/amd/vangogh.c     | 22 ++++++++++++++++++----
 5 files changed, 37 insertions(+), 14 deletions(-)
---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20250207-sof-vangogh-fixes-528afd048737

