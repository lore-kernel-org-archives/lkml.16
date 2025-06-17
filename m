Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 379F02DE1E0
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 12:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750162826; cv=none; b=mQHguNMCvb9b38fly1nRhjqt5icxnroeeVn7X6Viau91RCBorJBz/+p02FwFdpPVFSusT/aLZWcJnFCgSj8xox+eHud2z1qdITjoN+HHkXr7AEXgWR+1gzVP0jSYlLzWqVk8BAfoND0nkLxTxjxyeV6Eeb6kbVfK/Dx2bBRm7XE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750162826; c=relaxed/simple;
	bh=DwcF0NlBlxdXmxZ4P1HYVbWm6Pa7UHrd11SXdQpckGI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=inxte0t0YVOLYow6mkzLdOtNmE6l9kVZPBLLyZzAapFLBSpftbbref5QmnLxN2kYdPC8cRpqjLqGe7aYyx+fQULnObn12pPmqKA4mVOltsRZFLmrUHDiIlJ7fjtcuO9KyPOHBObmc9ZrH2iD6ygqmIXzBIdrsEjmVLmMEqt/jxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=OL0VXSCc; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="OL0VXSCc"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-60794c43101so8956007a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 05:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750162822; x=1750767622; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EUdlhR7H14Eo2mUGN1/ZO0ngxMr42fTDow94RiXbg9k=;
        b=OL0VXSCc/eUsfqlBUy0rYg1yUN79DIw8lPDh1ZA3L0n/44xmAqcqXzNJXNi+srWz/H
         EPeGpXgc9ErDTlDB7tql/uvTa2SlGMWwyI/FPhK4NWXALlgXCJlH9bXN5fVw5QGNPjZ4
         p1OwbC0jHtpRMrIGILXSmu8aT30qpHPaRchEzOFssPoMqIpyet0ljMwc26TU7q594tcC
         XetWKaE3q4EikCBFPpRBThJaW/Pc+XhKUAC/rPunSI2DbDaHCus1QtvyR/BlCRvDYB05
         QMg9OPAPRdt28uD0iAwhQgbieYIYungae/XLJVlhWDz+quAJX9WIMwIpgJ5xLMRXo4sz
         +Yhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750162822; x=1750767622;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EUdlhR7H14Eo2mUGN1/ZO0ngxMr42fTDow94RiXbg9k=;
        b=LRV9QEMCg5BThytkMzdvk3NiL8BYRLVIRgTNhMvYXfO7z0u6CwHJLeJ8JCMbxDLklQ
         +51S+SHCTfahLLHY+bAbWlCnglFsgz9fw7xPS2Ocb/e0CJhj4ZoRUUGXLgEEwJV4BKPh
         TI85Eo0yIlcTRdxfPtORnzKL9zy84C9lm5Bws7ykrWxYsxhwMvcVlyyNTy5pG7s1moOf
         EnwM78s/igfCfUFDzoGSOfzRM7vX7BD+jeb+6VKhyQNQuQ+r7wrLqL9dzW88w27+PVsS
         A22Jtz2fWZD82641D4Toc0RKMQrLgN33xfsvEaJxyeqCuNQa61nVhBHZogWVdjf7S8PK
         TZLA==
X-Forwarded-Encrypted: i=1; AJvYcCXISWgPPiNZOBAH6ip+5XCKyITAX4nx0ZHcUYsda7vNm3Pk22s1qpiQVEmN59J/gu1WMD6d7QxRBaXLAkc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwlpJdTgrH9b7cBc21JVqnzMw6+i+dSSeJLrcHV3mPC5L0JkRSx
	mbttFLYDjgZti8yNICw415dMj0VofjO9H2++UnDeNKFY8ufe9AcnjyZyp8yaq6JbmTN21K7ydDn
	XlyNeplE=
X-Gm-Gg: ASbGncvtDOFZl/Wj59uBZBALYL6bUq6IUCqkwfLcbVO9smbL7CUEG6WOo0dUtfgf7CD
	RhOKNDNBH79EHj5HoJESYsz/F9kBhj/aSDzJqrNPqVODn3exoa9iqkt+ctYUE1KAt9Cqz194vAG
	0nvAgiq0mCjm/lW9zXRScD/jl6K2lh0NmigCoXihByAF1YtLXgtOlhcaZkkqot4/zsQ2i/M/AC5
	sVzUbEfaiF1Mc7gvmXnNmtZnqzeuoNW31+eYGk5LnIUbsELODm6pP7F8sPOyVwWo+x1k9rJ8z9u
	espGlwoEwxHv9izxD2N135w83YtyTXOOp/W2P3E++X6Hx1SSFTXyVxvEt4l0GlwAJKjPU53Dj74
	Q2pNXfWXsQR/luMcay8+zY+ndVuR6tNR3
X-Google-Smtp-Source: AGHT+IHXdzCpZsabrbUfZ1/mAGhW1nkU1uiB24DWPjENG/rLfQm1pdzkmZDiD5h6daPKGYzfxXx5lw==
X-Received: by 2002:a05:6402:3506:b0:607:32e8:652 with SMTP id 4fb4d7f45d1cf-608d09998eemr11138714a12.19.1750162822453;
        Tue, 17 Jun 2025 05:20:22 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-608b4a8c34asm8053834a12.55.2025.06.17.05.20.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 05:20:22 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Tue, 17 Jun 2025 14:20:12 +0200
Subject: [PATCH] ASoC: qcom: sm8250: Fix possibly undefined reference
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250617-snd-sm8250-dep-fix-v1-1-879af8906ec4@fairphone.com>
X-B4-Tracking: v=1; b=H4sIAHtdUWgC/x3MSwqAMAxF0a1IxgZs638r4qDYVDOwSgMiiHs3O
 DwX3ntAKDMJjMUDmS4WPpLClAUsm08rIQc12Mo2VWs6lBRQ9l6FgU6MfGPtBhe98yZ2FnR4ZtL
 8n07z+35i7VCTZAAAAA==
X-Change-ID: 20250617-snd-sm8250-dep-fix-4393fa3a1f72
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Wesley Cheng <quic_wcheng@quicinc.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Matthew Croughan <matthew.croughan@nix.how>, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2

With CONFIG_SND_SOC_SM8250=y and CONFIG_SND_SOC_QCOM_OFFLOAD_UTILS=m
selected in kconfig, the build will fail due to trying to link against a
symbol only found in the module.

  aarch64-linux-gnu-ld: sound/soc/qcom/sm8250.o: in function `sm8250_snd_exit':
  sound/soc/qcom/sm8250.c:52:(.text+0x210): undefined reference to `qcom_snd_usb_offload_jack_remove'

Fix this by declaring the dependency that forces CONFIG_SND_SOC_SM8250=m
when CONFIG_SND_SOC_QCOM_OFFLOAD_UTILS is =m.

Reported-by: Matthew Croughan <matthew.croughan@nix.how>
Fixes: 1b8d0d87b934 ("ASoC: qcom: qdsp6: Add headphone jack for offload connection status")
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 sound/soc/qcom/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/qcom/Kconfig b/sound/soc/qcom/Kconfig
index e86b4a03dd61d2d3ad6a4d9602f69effbaefaa83..3d9ba13ee1e5250c7c4ecce664ff5a62dddf5094 100644
--- a/sound/soc/qcom/Kconfig
+++ b/sound/soc/qcom/Kconfig
@@ -186,6 +186,7 @@ config SND_SOC_SM8250
 	tristate "SoC Machine driver for SM8250 boards"
 	depends on QCOM_APR && SOUNDWIRE
 	depends on COMMON_CLK
+	depends on SND_SOC_QCOM_OFFLOAD_UTILS || !SND_SOC_QCOM_OFFLOAD_UTILS
 	select SND_SOC_QDSP6
 	select SND_SOC_QCOM_COMMON
 	select SND_SOC_QCOM_SDW

---
base-commit: e04c78d86a9699d136910cfc0bdcf01087e3267e
change-id: 20250617-snd-sm8250-dep-fix-4393fa3a1f72

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

