Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C1581AA7A6;
	Mon,  5 May 2025 05:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746422437; cv=none; b=FqnAQyKgrPOaXnZMGjE1Z6V0l8w61sxnRNzigKEBKsPMiPMrWFS23AwAgVe+cqj7XOElFe3C1u72Xc9jJkHs+1pCRGx+f6DCt1MzszQazoJgT7hH1cSgVEI04osS2cQ6SgH48NBJlRGbz5G8F2RY8R+/qYHfZvj5P435VzESH9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746422437; c=relaxed/simple;
	bh=Npt4xYeE5cAR7GRbHzsaDhd0uGoWV1B3qLG1zO+vHYQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=l6D4bUM40JhuirzxZIokotx33s3xbs6DmuR6NsfDDHC+lok8B0/Q4+GgpjDwHiMyU9wFn6JkPQrb2nvSRey4+z0HzbRjRhWNSCesgMZg0Ztzb4tPCRnmhXKJf/mz0A0uW5ZFfrPeFedjE6n7yv2Q6OHd2uUA0QSkF/RR5Eh9G8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WXvt8n4j; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WXvt8n4j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EDA4C4CEE4;
	Mon,  5 May 2025 05:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746422436;
	bh=Npt4xYeE5cAR7GRbHzsaDhd0uGoWV1B3qLG1zO+vHYQ=;
	h=From:To:Cc:Subject:Date:From;
	b=WXvt8n4j1KEzztv3WUglTfs56WruCL0SLlXOPM2TiVvfLtdcoWZkaE2ahW4kGNTsG
	 PL3TOPqTtLsJkcRAVspyjDWUabzf8huRNAFd80MN/y/auREq9vnbjBc4cR1XMAWpou
	 SQ0HP8qLnt79tXKe78L+kyYgR6sokyXzVh1m/39Zh6U2EXkVR+HGLDisXC/2dbfQpQ
	 9EtbDBKS/N5qCzgsTxj52HOUsOoigasF8HxMHXHBBuY8V95fBkjciGJskDXDnrSr7p
	 f8YtuR5oB1lICWnEn81PFTjS1c7vnQMTI8y4OS77mUT9Cfws7pxRkwr/NY3U+24HVo
	 cHR9fHNXbDeow==
From: Arnd Bergmann <arnd@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: usb-audio: qcom: fix USB_XHCI dependency
Date: Mon,  5 May 2025 07:20:21 +0200
Message-Id: <20250505052032.1811576-1-arnd@kernel.org>
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
 sound/usb/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/usb/Kconfig b/sound/usb/Kconfig
index 6daa551738da..15bc212cb211 100644
--- a/sound/usb/Kconfig
+++ b/sound/usb/Kconfig
@@ -178,7 +178,8 @@ config SND_BCD2000
 
 config SND_USB_AUDIO_QMI
 	tristate "Qualcomm Audio Offload driver"
-	depends on QCOM_QMI_HELPERS && SND_USB_AUDIO && USB_XHCI_SIDEBAND && SND_SOC_USB
+	depends on QCOM_QMI_HELPERS && SND_USB_AUDIO && SND_SOC_USB
+	depends on USB_XHCI && USB_XHCI_SIDEBAND
 	help
 	  Say Y here to enable the Qualcomm USB audio offloading feature.
 
-- 
2.39.5

