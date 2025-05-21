Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC7A816C850;
	Wed, 21 May 2025 13:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747835759; cv=none; b=H/bjJFD0XlOJsAVSODFF7KwLMACnxuVQEwQow5bRmaGDUWxGpX0SnTzl3XSc4Npdjv2g/Czv32/AzPXrjJj+XmiyP77NuqPdF8xktlXj/1+CQlN6vXNsIkx3YSSAwpezV2dlcKlI4gEHE1Tqr6jHDPm3u4N0dBYVQcSeTYI+3B4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747835759; c=relaxed/simple;
	bh=y49OqZ1r1amqYKiX6aSIdElgm4pVfHUhT/6lzRZrSw4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pB01/uZufRj81oV0uqPeGwaYIvR3MNZX/UfmLpGLDvKkLE1o2JGA7MNua7qqxInoiOAhLvxNstAK+8dm7FYJaUl4Eo7kF6NaO9+yOJR7ZKWaqXRrshHVRxIsHyy9dAqsXxKXaBc2Xjjqwg2jiui1sxGuhQUC6ti67RlxBtLQQ+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IluV9/5V; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IluV9/5V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 984BFC4CEE4;
	Wed, 21 May 2025 13:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747835759;
	bh=y49OqZ1r1amqYKiX6aSIdElgm4pVfHUhT/6lzRZrSw4=;
	h=From:To:Cc:Subject:Date:From;
	b=IluV9/5VJ5/SXz/Ebbvt8qTGw6crcPE2AXL5x1mIfUiW5NHhH2iHCncSCrfFfu6Zn
	 +c/xDvOPKmwUPzJ5KyrvOqqCPGvxcZkNczSos1YOWaJZJKAEC/+PDt7VjeHsaVUJe8
	 nr4564TcIfd9kCLF+OJojIlelbdSm1i3ykyPHO7zodEhPW6q44WBZTccsqUg/53dO8
	 CfEGMfl81SW3svg/QtdvnzeOVUkS3+p+KdjEKcXxoTs4F3ow3OaAdLvE1ZCE+pBfzf
	 4YCO9Gyg+XK629E3heRZN+O51TS9KX53Xl8yFHH84rgUkpP25rHV9EdHY/r4eCKE1a
	 2+Ghrqa2KxMnw==
From: Arnd Bergmann <arnd@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Mark Brown <broonie@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] [v2] ALSA: usb-audio: qcom: fix USB_XHCI dependency
Date: Wed, 21 May 2025 15:55:43 +0200
Message-Id: <20250521135551.2111109-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

SND_USB_AUDIO_QMI depends on USB_XHCI_SIDEBAND, but that is a bool symbol
and allows it to be built-in even when XHCI itself is in a loadable module.
That configuration causes a link failure:

arm-linux-gnueabi-ld: sound/usb/qcom/qc_audio_offload.o: in function `uaudio_event_ring_cleanup_free':
qc_audio_offload.c:(.text+0x7dc): undefined reference to `xhci_sideband_remove_interrupter'
arm-linux-gnueabi-ld: sound/usb/qcom/qc_audio_offload.o: in function `uaudio_endpoint_setup':
qc_audio_offload.c:(.text+0xe88): undefined reference to `xhci_sideband_add_endpoint'

Add the extra dependency on USB_XHCI itself.

Fixes: 326bbc348298 ("ALSA: usb-audio: qcom: Introduce QC USB SND offloading support")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>

---
v2: fix up Kconfig symbol name
---
 sound/usb/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/usb/Kconfig b/sound/usb/Kconfig
index 6daa551738da..41c47301bc19 100644
--- a/sound/usb/Kconfig
+++ b/sound/usb/Kconfig
@@ -178,7 +178,8 @@ config SND_BCD2000
 
 config SND_USB_AUDIO_QMI
 	tristate "Qualcomm Audio Offload driver"
-	depends on QCOM_QMI_HELPERS && SND_USB_AUDIO && USB_XHCI_SIDEBAND && SND_SOC_USB
+	depends on QCOM_QMI_HELPERS && SND_USB_AUDIO && SND_SOC_USB
+	depends on USB_XHCI_HCD && USB_XHCI_SIDEBAND
 	help
 	  Say Y here to enable the Qualcomm USB audio offloading feature.
 
-- 
2.39.5

