Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 277F926FDAD;
	Wed, 23 Apr 2025 07:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745394904; cv=none; b=S+0HvU1KTS9G78FJW+utXmboq2JevXE1ueLCI/EIHyoQbsvFMfF5aIqoN9XP1pZuvd9Xx62cz9vfrWMbBlXyr2BJlV0hONi+zefwQRv1cRwXZ/dEO+rRbu4vDrGuE+BkYTboa7Tr4d7W3TMMJkQC3YqXaQv/oCpELYT36G9Q1DA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745394904; c=relaxed/simple;
	bh=fSRnfCoL9a6bxdshBIQMdkRn5cXeVSOBriq8mo2FYvo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rcOV+aCvYaU6VKhJFhnx98WJSGEhUOFHu52chMfpaV3CUYH0XHM063qtTz1xsACgiwrQpLnz62BGA8At1/j3YiqA2Xgfr8DeCb5WMyjuP0qvBlILIq51cE+0nh7+x6wKkXBtklkPwxsDIVIApwciFXscbFw04EREWLKOb5kxmoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KFSyyzAP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KFSyyzAP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A1A5C4CEE2;
	Wed, 23 Apr 2025 07:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745394904;
	bh=fSRnfCoL9a6bxdshBIQMdkRn5cXeVSOBriq8mo2FYvo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KFSyyzAPKxzu2KSN5dwToRslJYt1kEE1qzWiFDC2D2hHU88F5Xb2oBm07xyRUc1vP
	 10LNMKic6iymSfu7tv9hLAhZ8bi68CptoNIXrJKo5e5mpICQWx7WTwtfYZHyIpDLMr
	 VuyEWfPSmktZslptNH03EaK4NI0d20ouq4kgvy1Ko7scSqjZVNhcikNziV87bX8aOg
	 W2gaTt6q3PJsCwD0RdMgc36bcCzzBTLEvwUhTi7saKGOtR87k/QT7FH58FvB6ufDDB
	 RwXOgbdCGejHMJtwBuhEaLveWP/yLs2IIFKuH25zy3wqLYx8bDxwHyTB1/OQ0mD6g4
	 4cZQKS7MD964g==
From: Philipp Stanner <phasta@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jaya Kumar <jayakumar.alsa@gmail.com>,
	Clemens Ladisch <clemens@ladisch.de>,
	Colin Ian King <colin.i.king@gmail.com>,
	Philipp Stanner <phasta@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Mark Brown <broonie@kernel.org>,
	liujing <liujing@cmss.chinamobile.com>,
	Andres Urian Florez <andres.emb.sys@gmail.com>,
	Oswald Buddenhagen <oswald.buddenhagen@gmx.de>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	David Rhodes <drhodes@opensource.cirrus.com>,
	Ingo Molnar <mingo@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 11/28] ALSA: azt3328: Use pure devres PCI
Date: Wed, 23 Apr 2025 09:53:29 +0200
Message-ID: <20250423075346.45907-12-phasta@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250423075346.45907-1-phasta@kernel.org>
References: <20250423075346.45907-1-phasta@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pci_request_regions() is a hybrid function which becomes managed if
pcim_enable_device() was called before. This hybrid nature is deprecated
and should not be used anymore.

Replace pci_request_regions() with the always-managed function
pcim_request_all_regions().

Signed-off-by: Philipp Stanner <phasta@kernel.org>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 sound/pci/azt3328.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/azt3328.c b/sound/pci/azt3328.c
index 8a895d838005..053a18f434bf 100644
--- a/sound/pci/azt3328.c
+++ b/sound/pci/azt3328.c
@@ -2347,7 +2347,7 @@ snd_azf3328_create(struct snd_card *card,
 		return -ENXIO;
 	}
 
-	err = pci_request_regions(pci, "Aztech AZF3328");
+	err = pcim_request_all_regions(pci, "Aztech AZF3328");
 	if (err < 0)
 		return err;
 
-- 
2.48.1

