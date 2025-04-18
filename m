Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C1615442A;
	Fri, 18 Apr 2025 20:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745008573; cv=none; b=V7ysEw8DXjYPWwH+24il34RoFgIkISG8/hVNYDRbqq8KkBcJBdGnGTsunWhtYdX42kuFWwO4opcLBaTIvpnVuS3ZRxmAX87zewbtMLOqBox0cvWmV0TQFWDfp4Vcf79At0UpqpzebvFMnqWmFeY3I4R57QX2r0l+mGB0vpYL/uI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745008573; c=relaxed/simple;
	bh=18pWZCw4Dd7J/FW0pBxiidBFm9WLO/okIf3gflkH/9M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=XI+qx92u7EBECIz8wlFxJLr8bXHmJcKOaM7mUPBLGTB5bGbThdE/eGujrIOQ0tKmXyiEKJGvie3oQ52krbYkzOBd7VPVx9NsnEKcmDJP78SsLLhR7IjP0I+P2/UWvt9DMzkucYZkyYJ63w8zHLufAD6jUrYqTa7CDpcu0xvzUQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TacjyiO2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TacjyiO2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8EDDC4CEE2;
	Fri, 18 Apr 2025 20:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745008572;
	bh=18pWZCw4Dd7J/FW0pBxiidBFm9WLO/okIf3gflkH/9M=;
	h=From:Date:Subject:To:Cc:From;
	b=TacjyiO2A9VHKdAICV+IK6O/Z7b2z9a0HZ9ZYq7ruHdoUKewTkjNK99Lk51JNLno5
	 p2IM0WSSkV/Y87ORmfWDBIW3oha87Xl897RJs4M47CyQhjW5BBPNeY6fUlpsVEE9nC
	 nQnysw2sctoSfAuTI6Pv8YLeHAVaGWgj3GCLFVbXkQ3rFNXc71lLjJH2XKxq/m/4xj
	 2z6pqrcwbMBsz14NGIVAcEi6BcDw9cMAx8R4tcB+Bm2ZZ4Sph4TZWqrcCoQtL6HZRN
	 pNTTTGDtSozCSHJ1nUibEjs8AnZkvKdzutD65cGQpl+JhaOJ5EKoGFg+/JEoFPkT1w
	 9YO6ZrvhOK9tw==
From: Nathan Chancellor <nathan@kernel.org>
Date: Fri, 18 Apr 2025 16:36:01 -0400
Subject: [PATCH] ASoC: cs48l32: Use modern PM_OPS
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250418-cs48l32-modern-pm_ops-v1-1-640559407619@kernel.org>
X-B4-Tracking: v=1; b=H4sIALC3AmgC/x3MzQqFIBBA4VeJWd8BUxPpVeIS/Uw1UCoORBC9e
 9LyW5xzg1BmEmirGzKdLBxDQf2rYNqGsBLyXAxa6UbZ2uMk1u9G4xFnygHT0cckaMiOjXeKjHN
 Q2pRp4ev7dv/neQGiQM63ZwAAAA==
X-Change-ID: 20250418-cs48l32-modern-pm_ops-3e4b5860e366
To: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Mark Brown <broonie@kernel.org>
Cc: Stuart Henderson <stuarth@opensource.cirrus.com>, 
 Qi Zhou <qi.zhou@cirrus.com>, 
 Piotr Stankiewicz <piotrs@opensource.cirrus.com>, 
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
 linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2195; i=nathan@kernel.org;
 h=from:subject:message-id; bh=18pWZCw4Dd7J/FW0pBxiidBFm9WLO/okIf3gflkH/9M=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDBlM23cdDWdumqH77Oact2nH5376YjJz/iw3mdc2Xqf+y
 97OVSrn6yhlYRDjYpAVU2Spfqx63NBwzlnGG6cmwcxhZQIZwsDFKQATsTjByDDn8MTL9XdcZy81
 +y3Np/5nzp1nvYw9hmuYDuY6Wy2K0HjM8FfoxQ+H7TN1jCc4t0cd7CrapXajucHPbG2fWM2E7NA
 P63kB
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

When building for a platform that does not support CONFIG_PM, such as
s390, cs48l32_runtime_{suspend,resume}() are unused because
SET_RUNTIME_PM_OPS does not reference its argument when CONFIG_PM is not
set:

  sound/soc/codecs/cs48l32.c:3822:12: error: 'cs48l32_runtime_suspend' defined but not used [-Werror=unused-function]
   3822 | static int cs48l32_runtime_suspend(struct device *dev)
        |            ^~~~~~~~~~~~~~~~~~~~~~~
  sound/soc/codecs/cs48l32.c:3779:12: error: 'cs48l32_runtime_resume' defined but not used [-Werror=unused-function]
   3779 | static int cs48l32_runtime_resume(struct device *dev)
        |            ^~~~~~~~~~~~~~~~~~~~~~
  cc1: all warnings being treated as errors

Use RUNTIME_PM_OPS and pm_ptr() to ensure these functions are seen as
used by the compiler but be dropped in the final object file when
CONFIG_PM is not set, matching the current behavior while clearing up
the warnings.

Fixes: e2bcbf99d045 ("ASoC: cs48l32: Add driver for Cirrus Logic CS48L32 audio DSP")
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 sound/soc/codecs/cs48l32.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/cs48l32.c b/sound/soc/codecs/cs48l32.c
index 8fd0df671730..90a795230d27 100644
--- a/sound/soc/codecs/cs48l32.c
+++ b/sound/soc/codecs/cs48l32.c
@@ -3834,7 +3834,7 @@ static int cs48l32_runtime_suspend(struct device *dev)
 }
 
 static const struct dev_pm_ops cs48l32_pm_ops = {
-	SET_RUNTIME_PM_OPS(cs48l32_runtime_suspend, cs48l32_runtime_resume, NULL)
+	RUNTIME_PM_OPS(cs48l32_runtime_suspend, cs48l32_runtime_resume, NULL)
 };
 
 static int cs48l32_configure_clk32k(struct cs48l32 *cs48l32)
@@ -4057,7 +4057,7 @@ MODULE_DEVICE_TABLE(spi, cs48l32_spi_ids);
 static struct spi_driver cs48l32_spi_driver = {
 	.driver = {
 		.name		= "cs48l32",
-		.pm		= &cs48l32_pm_ops,
+		.pm		= pm_ptr(&cs48l32_pm_ops),
 		.of_match_table	= cs48l32_of_match,
 	},
 	.probe		= &cs48l32_spi_probe,

---
base-commit: 0b0a18f1bd72c64ae845a32d975f6d4c727b38e3
change-id: 20250418-cs48l32-modern-pm_ops-3e4b5860e366

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>

