Received: from smtp.smtpout.orange.fr (smtp-81.smtpout.orange.fr [80.12.242.81])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51F9F221555;
	Fri,  9 May 2025 10:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746786003; cv=none; b=Akr28imkDLmPqxeO4mhszG8sXWPdkm2AfsTThq6sG3FHg669zgox7DzE6hQfMDoDJ6/1baemPSEL7RPn/JMj0Q2AYx/XHIVrwsZExfbXRDh6UU8b/3k03Sd3Tf6pTZf4iGs3ak3oXANtiG541EaA54m1pVMAZj3HsmeotZ88Vws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746786003; c=relaxed/simple;
	bh=nhZbxLcaA1L0wgdRYS+DgH51pI40wMr2c6Djku/HaQg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RJCNw9yNuuz89LcAopqnAVBb4QQ3B1f+5Uu2sPDPSxeu/QZ5hH9sVUWgnTiKqgMUxrCeV8+4iwzBKoutQooiqFJiOidDFtgP30gvs0cNEmH+5LdDMau0Y22ttgq5+sakNYsOXE0Zmjk1hTHVugN5GecLUJ0RqQpe2CBAnB6VdHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=H4jNBHaY; arc=none smtp.client-ip=80.12.242.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="H4jNBHaY"
Received: from localhost.localdomain ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id DKpZuH36qoRemDKpauZkEE; Fri, 09 May 2025 12:19:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1746785991;
	bh=4T4OKqCpmGd4eWS0YdpRFZzYKVA44JQrfsP6WU1Y1hs=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=H4jNBHaYKHsDNqjWuV/DHS7VFrOpqm35BFT1rM5RPY2Yxleu8FHLR79KJrxoO1Edo
	 Bi4UljDZxfQi7aJHQQvzcZsDB44+IH5NCMOZH90+qsjgsjrEq3HtklKCnxovaWsm7Y
	 b+OuWJLfcQicaqmEn6g85wvMlI51z/ZuuLbq1Sf4zOPoF/fxkroqhlmXKGfFK7+ogI
	 ZWkbPTRLvAofGpEZnCkGJjvZ4/AYqz/r++PsEGroZNG83cnfg8b/gp/f4Y4uUEHX55
	 OsIe6FoYoWvQJff/4qsueGQDe4iDc4tyCRhOk/SqGnUKXzmX/PIzPn6ycdlBpZA6y/
	 jTCfihs4xfv+A==
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Fri, 09 May 2025 12:19:51 +0200
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Mark Brown <broonie@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: usb-audio: qcom: Fix an error handling path in qc_usb_audio_probe()
Date: Fri,  9 May 2025 12:19:40 +0200
Message-ID: <335f54da099240d9b6c7aca0397c7d8c6bb629ac.1746785961.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If an error occurs after a successful qc_usb_audio_offload_init_qmi_dev()
call, qc_usb_audio_cleanup_qmi_dev() should be called to release some
resources as already done in the remove function.

Add the missing qc_usb_audio_cleanup_qmi_dev().

Fixes: 326bbc348298 ("ALSA: usb-audio: qcom: Introduce QC USB SND offloading support")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 sound/usb/qcom/qc_audio_offload.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/usb/qcom/qc_audio_offload.c b/sound/usb/qcom/qc_audio_offload.c
index 8b096f37ad4c..65ba4d90d438 100644
--- a/sound/usb/qcom/qc_audio_offload.c
+++ b/sound/usb/qcom/qc_audio_offload.c
@@ -1957,6 +1957,7 @@ static int qc_usb_audio_probe(struct auxiliary_device *auxdev,
 	return 0;
 
 release_qmi:
+	qc_usb_audio_cleanup_qmi_dev();
 	qmi_handle_release(svc->uaudio_svc_hdl);
 free_svc:
 	kfree(svc);
-- 
2.49.0

