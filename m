Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C51A223BCEF
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 11:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744801612; cv=none; b=b6jd1b1zYyG6HjPL1Z1u1HBssugncTQX4rvduCEh5gVMV7TxCpLHte1HL/0EI3OOYxh/Hyjfy4Kp3T5pDWVFQCUeEVWoXyW473Bn0lIgHiar1DxkvFd2fFiSmsmhliTM54JZK+Y+Qry+tDplXnVLndQa4Z+U+fL/0A/j4BLqghk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744801612; c=relaxed/simple;
	bh=MItm8lfg7E21L1vIBXLReQo7hX1VUAj4VEBvbFisqZE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=sA8RQD+FA45iqfQ/JujfpBm+oX3EV901rVVdTrz8UZ0ZIEdQmYUGUHnOgcS6UIOP3SYItT2sYOsN66ln2O78hI6jHeDrbkfRNTxBJXNYaOEJSfQMnB9olIUcEg9ChJzkbg30K6KG+ex0ni9Oc43ANTJcIWgXTVIqzjxg0MQGSh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=qC9rshun; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qC9rshun"
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C466A965;
	Wed, 16 Apr 2025 13:04:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1744801485;
	bh=MItm8lfg7E21L1vIBXLReQo7hX1VUAj4VEBvbFisqZE=;
	h=From:Subject:Date:To:Cc:From;
	b=qC9rshunoFPJTVYEBtXZLhs2K1cIrIlA7aqHAbdD9PbPINT4OznhORb6VXBp6SAJj
	 Ily5xjnjg3s8x3XzYSSnHrgYChzQ1BuEXpSnk2Quvdounh3tAUHSw7RdktEJ+9dhZR
	 /4xgh+tS10NMFnPv41Df8F+OZJroSW21ssXjxsYY=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH 0/2] drm/tidss: Delay reset if we have a splash-screen
Date: Wed, 16 Apr 2025 14:06:28 +0300
Message-Id: <20250416-tidss-splash-v1-0-4ff396eb5008@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADSP/2cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDE0Mz3ZLMlOJi3eKCnMTiDF3jFIs0YyOLJHNDMwMloJaCotS0zAqwcdG
 xtbUAaVb/Ol4AAAA=
X-Change-ID: 20250416-tidss-splash-3d8f328b7160
To: Jyri Sarha <jyri.sarha@iki.fi>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 linux-kernel@vger.kernel.org, Devarsh Thakkar <devarsht@ti.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=869;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=MItm8lfg7E21L1vIBXLReQo7hX1VUAj4VEBvbFisqZE=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBn/49DPxxfKLpcZ7G4rANhH82N8fji5+GFN7rDx
 y+R+wmemjaJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ/+PQwAKCRD6PaqMvJYe
 9bwCEACaKS0vBsmA/uj0Hpf7onTI2RJWGA6XDX/luy5hA5rbiXMN2/tnreZ/zXD3WVkeVLMB2Q5
 T5PYt1v+Sh1zLZon6exPF6ZnRIHMQVZP1F7qeH/b2U4nUHylro9VtZfPdbHautaWjxZJOPZB3dU
 k/nHo+fV6KeSdzXzw4Br0cDw5mUhmheiMOCxby4FeYX7zBy/JqhGw8/zxzPAVRSa+sjcaTLzeBB
 wPeB4a8B+mqQWPCELIG6WVDtmayRosYctMiX5VzcPyD7+WBjeUM/C5BbIxYT1YmvzNgUpyzPD1V
 znM6ZrT7c3ZwjX6RWnRbEhaBNxFIFYq2Q51cpZwuoKAElee402GySx//pquaJVWe32zlba/HQ07
 cIWL7dmOLKRgIQ5BmNtdpoBQNTfeeXjmtwFuVIdKBL1lofVIoRMZaSN5Ss6tZynF+xLCTaZTYgJ
 jxe48VcZIiH9uDAoxUjcOvMV+rNuufC1VWTX+MDT3m7BB3B3JklBczzyryniVV7bxgtFKBz4V5p
 JSWPvpErxSLGSzRE1eNe23G+Vb/FsL7f8c0sRs7cb4DLQEx39C3eV18pkgWf365yCaRCbgwMWhQ
 0mbpZFY76aDlAiNJhr1LluhjvdKpG1atDz5NObpOaZo9y1uw/1YH/8WqwGWCL5eL7ZFVxHKY7cp
 aiMmpTRiZorFYew==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

These two patches are part of a bigger work to improve splash-screen
support (i.e. the bootloader sets up the initial display, and we try to
keep that on the screen until something else (Weston/X11) takes over).

 Tomi

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
Tomi Valkeinen (2):
      drm/tidss: Add some support for splash-screen
      drm/tidss: Remove early fb

 drivers/gpu/drm/tidss/tidss_dispc.c | 126 ++++++++++++++++++++++++++++++++----
 drivers/gpu/drm/tidss/tidss_dispc.h |   5 ++
 drivers/gpu/drm/tidss/tidss_drv.c   |  38 ++++++++++-
 drivers/gpu/drm/tidss/tidss_drv.h   |   2 +
 4 files changed, 156 insertions(+), 15 deletions(-)
---
base-commit: aec8a40228acb385d60feec59b54573d307e60f3
change-id: 20250416-tidss-splash-3d8f328b7160

Best regards,
-- 
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

