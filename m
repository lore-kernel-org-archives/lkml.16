Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40A9F372;
	Sat,  8 Feb 2025 01:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738976616; cv=none; b=M256x8dX8Ty4uAKY5O8gDmv5AUagKc5ZwntwBayJlodExXI8FM5QwNmHINfEN5qufzkJsNe8sBAxsDHbRJsEbUI49Zd/Jbko9mN0L2AkgagBLyQcXuhC572HycZ1Q0CNLXWBVNOThK02y8SvlJ+8eRSOUHtCOe0M5MW+Dcoh1No=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738976616; c=relaxed/simple;
	bh=bkeoRT5TmU0GZhxYnlHDc49a+v6HYhTYtvuPIR+pDvg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=d4dflaIrgM1uKBiV3sjV5MFYaGVBvpQ4/qby3PGkHRU+nKm+TUN/PY8XMTEIj3V1qZ8xdr52vXnOMYmkyXRP4QaDOQ4hjoEYJF18h/M3i3pVtpMhdmnkiKg9HckvVBh5pgN3pB/pGMZY5YIpNinF1sl0Ov74T85zrR2B6kIm5/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sg736TP6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sg736TP6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62363C4CED1;
	Sat,  8 Feb 2025 01:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738976616;
	bh=bkeoRT5TmU0GZhxYnlHDc49a+v6HYhTYtvuPIR+pDvg=;
	h=From:Subject:Date:To:Cc:From;
	b=sg736TP6xwBs/Fxv8/z4QmvFLp1joqTi2piE2ndZKclcfXAkF9kqPUWGm4zdmw4sO
	 Dh1RtfGuJVjj0GC2T5KHuN5KUCTquukH1deiCzREh5h8b9PY4/jlzrQa/L6wTTnYPC
	 uXBwNFbl4LaG/6U6lyPZk7w/I0F3gDSIzMvZAYq5u0TGHiaqXvVV5V1vw53vBAOZrK
	 vx2zMcWwaXFPYC8v6mWU1l7f8M0b3kQGWoYgrCbiWg0lzSlhMXPWoWq7OMjUFXvbIx
	 POXgCSY4gQjKLe2LRck+PJLX/5sz9llqLvD5rx5mt2zzLPygKhPSa4tOP+vNo8fqpr
	 cqxGTkRSA/0Lw==
From: broonie@kernel.org
Subject: [PATCH 0/4] ASoC: tas2764: Random patches from the Asahi Linux
 tree
Date: Sat, 08 Feb 2025 01:03:23 +0000
Message-Id: <20250208-asoc-tas2764-v1-0-dbab892a69b5@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFutpmcC/x3MQQqAIBBA0avErBN0sJSuEi2kxpqNhhMRhHdPW
 r7F/y8IFSaBqXuh0M3COTWYvoP1CGknxVszoMZBo3YqSF7VFQTdaFU06Im8jaMnaMlZKPLz7+a
 l1g/e/xLxXgAAAA==
X-Change-ID: 20250207-asoc-tas2764-f128ee84f68e
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Dan Murphy <dmurphy@ti.com>, Hector Martin <marcan@marcan.st>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-42535
X-Developer-Signature: v=1; a=openpgp-sha256; l=898; i=broonie@kernel.org;
 h=from:subject:message-id; bh=bkeoRT5TmU0GZhxYnlHDc49a+v6HYhTYtvuPIR+pDvg=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnpq1gV+UPLkT6rQaMKQJkHeBRwFcsu/peWLAkL
 AWcaiBFtiqJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZ6atYAAKCRAk1otyXVSH
 0LRiB/9L5jDT6I0QbXpPeKSwau4fkvY8zMY3nQM8JsZ4wohdFvHXmV1kR5AZnmE8Csb9VMYteIz
 v9nfXA7hNrFcsCTsAy+IcqHBnOfQLkvjtqX5RWw91q98BiYjpEXlV3eKFEbwhErPJRnl/KEDDWj
 wswNouHYr6107my65JBmktUz00hkDEljjI/N7x4wQS5/9GJyR4JSWwcqvjl/qABh9NY0WYZU2I2
 GtWvBtwP8Hla4a3dCjiU6f51GE/d7Sz0cvUwytOBoIQoo2QqppdOrHpi2NEcN21H5i9+pvHNMYX
 uvN1x+beRu0Ez1AmIx2NlwHT6JihCxu/X9YlI5iGUrQjmQX8
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

This is a random subset of the patches for the tas2764 driver that I
found in the Asahi Linux tree which seemed to be clear fixes and
improvements which apply easily to mainline without much effort, there's
a bunch more work on the driver that should also be applicable.

I've only build tested this.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
Hector Martin (4):
      ASoC: tas2764: Power up/down amp on mute ops
      ASoC: tas2764: Wait for ramp-down after shutdown
      ASoC: tas2764: Mark SW_RESET as volatile
      ASoC: tas2764: Add reg defaults for TAS2764_INT_CLK_CFG

 sound/soc/codecs/tas2764.c | 61 +++++++++++++++++++++++-----------------------
 1 file changed, 31 insertions(+), 30 deletions(-)
---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20250207-asoc-tas2764-f128ee84f68e

Best regards,
-- 
Mark Brown <broonie@kernel.org>

