Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1786B281526
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 16:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746722675; cv=none; b=dCmVYr4ixuCaBJ+FWfigjBQB24P2mTzLTEk4vSmH+qEi+sxI7y2T6IpoYOiemyInNcK7y5Bg0fm+MGy8Lj7dGFfRPxI/vOD7JY5SqCnIO23L1kdDM8eukAyUj4Qq580iwufCO0d1jyWLF8Zy6KYmXFmF5NBC7tKdPnD6gs3PkkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746722675; c=relaxed/simple;
	bh=X1nbJSmxcQuuOtNumA+SYFcQM0q4zJpxtssYnRhUnZM=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UXtOvCCF9bOv13T27Z7UoAFj9r6zQnEJNOsBsREM1HDfzuPHvJOpjpJcrd/vB5aJb9gfPtjIHWpdg7+jm9kVsd7q4ewwrj/abKmeYzJECqzhGn6EN9AEIKz+dp1wnPMNa0jPWhfiJWw6Dm0PuUHJXrdYxjB73WJw5sg9+uexuWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a0c7wX7N; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a0c7wX7N"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-548409cd2a8so1493440e87.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 09:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746722672; x=1747327472; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aHVG5Ewf3BsYnjta0/dgnDN7bGT14wd5wh/nwWQ9VDk=;
        b=a0c7wX7N9vJsE1cBoJFZrEIqs7nB4wQAbgqNY7I/WFk9eK8plufJZVS7J5b8vCwrjN
         IKSpzzbBkoQwclgicxNW3TgpbiArq0vYdSfefmo5SjZcwtzgSWdSMBsaHLvxfniPpy5A
         FZfY39hi8JzV/YP7Y541E0ptxtWcpKwbSfN+1gVeXd7xKyEDNvTaJ26obp/yfpNcEFUd
         HwKS0sNdsg2nwKBEpD2/iqtaTIvyt0i0wN4UtLYz4qNWcI1lDTFTbJ3DFFJI6rm9zQEr
         Feo0fWPaxhZTOWZhIA5xmyZ63mVIgvAeJ1NDVV/oyxNprt86Dpv9/ll+hkF8S85DTA2D
         hfMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746722672; x=1747327472;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aHVG5Ewf3BsYnjta0/dgnDN7bGT14wd5wh/nwWQ9VDk=;
        b=Za4rp99olQg0sZf6OusbDYNicOYln2iu6MP6uI5ZaaoPUmZkS0QOwEGAwnL6GT/53h
         SwIldaxrPhbvGbgc5KElYP0Sv0p76eYbCE1fltI0rQIj05S5YBVsCumM8bvr4UuTLMSw
         WmNN3Dqo3MiOY3Y9GADMAUMKN53P097eTINrDDl/+7zM5V8/k3rVusl7qsCD9/HwLub+
         8OX8JY6r+BfZhHAfvlYK9qeJ88YW95wWK1JjhPSGPczziWMWdFHeEW+LnxjGYUGispLu
         xk6ixdKK6SZL6xLlvCEu9XxPC0tZlwyTcpOrb5SJeKIf0YPzsczAIucGM6c6IKHSzDvw
         K/vw==
X-Forwarded-Encrypted: i=1; AJvYcCWO3Y5uwe1Uqg4XR4x0odhza9bOaJ7GAHX8ocqONt0b1tDuHHL1+QE9ioRo3vjuS+bzjADc3Dl7RI0Y4AQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0L+WZXSkk+cHw/K/zh8D6emc2XImEcJBMxbruGC/g10iADJJN
	iZlw/mgrtB6Unfa+FZg6JnE7wpvFaNIzhz6M3U56XEggu7vgbGa1kTksG6m5
X-Gm-Gg: ASbGnctaYKJTU6gyOpnQ/BKQOGUYK8ZMJZO97/SWbbV4+rqbSP6+VugjJgmZ1e0Uqei
	5aVqQlBWgk3ik5rodUKRvCwle3tmAlY7uC9YzF8+nNR82FwRCXBL8CZ6Javd3fTuXxETsveMRCB
	6vJ0dwmmc/GjILxbTpM22ilrHtupE2eBjCYp8D2MziZdbPrhiMYBw591168ISppcvPrXBZ53xhv
	4XyNsVsPclvXkkDVMuJ/IOYKjwWx82Kgybu8kpJCtgXHW/MR+PSEeuUdJ5pXFz8TMEuhUoP0Yfj
	d6f8VuqimnaAdcuEAqf8+GEfrQUBO5Tg6D7cEWQiPjDQLv6qobra/9oFE3p3hyrgJNDsSZsouqy
	ubZZPGGAPgcwSL+q2/Yn4yRK1KXy+56kZaqmwmkiK4LkD/CB2xdqWaHqOuw==
X-Google-Smtp-Source: AGHT+IEtBpemjMlzkscWb7LegaY55jvRB8e3UcFOaQKUcEeSiywKzbE5iW366LOBbHh0ZlVzn+OfoQ==
X-Received: by 2002:a05:6512:2381:b0:54a:cc73:1460 with SMTP id 2adb3069b0e04-54fb95edd94mr3095592e87.1.1746722671843;
        Thu, 08 May 2025 09:44:31 -0700 (PDT)
Received: from Lappari.v6.elisa-laajakaista.fi (nzckegfeyybu021f2us-1.v6.elisa-laajakaista.fi. [2001:99a:20b9:a000:e167:89b0:e98:2534])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc64b6ee3sm14645e87.126.2025.05.08.09.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 09:44:31 -0700 (PDT)
Date: Thu, 8 May 2025 19:44:30 +0300
From: Heikki Huttu <heissendo88@gmail.com>
To: abbotti@mev.co.uk, hsweeten@visionengravers.com,
	linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org
Subject: [PATCH v2] comedi: drivers: adl_pci9118.c: Edit file so that
 checkpatch.pl has 0 typo errors
Message-ID: <aBzfbvF6YdaYDDYk@Lappari.v6.elisa-laajakaista.fi>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Fix errors produced by checkpath.pl about typos.

Signed-off-by: Heikki Huttu <heissendo88@gmail.com>
Reviewed-by: Ian Abbott <abbotti@mev.co.uk>
---
 drivers/comedi/drivers/adl_pci9118.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/comedi/drivers/adl_pci9118.c b/drivers/comedi/drivers/adl_pci9118.c
index a76e2666d583..67c663892e48 100644
--- a/drivers/comedi/drivers/adl_pci9118.c
+++ b/drivers/comedi/drivers/adl_pci9118.c
@@ -32,7 +32,7 @@
  * ranges).
  *
  * There are some hardware limitations:
- * a) You cann't use mixture of unipolar/bipoar ranges or differencial/single
+ * a) You can't use mixture of unipolar/bipolar ranges or differential/single
  *  ended inputs.
  * b) DMA transfers must have the length aligned to two samples (32 bit),
  *  so there is some problems if cmd->chanlist_len is odd. This driver tries
@@ -227,7 +227,7 @@ struct pci9118_private {
 	struct pci9118_dmabuf dmabuf[2];
 	int softsshdelay;		/*
 					 * >0 use software S&H,
-					 * numer is requested delay in ns
+					 * number is requested delay in ns
 					 */
 	unsigned char softsshsample;	/*
 					 * polarity of S&H signal
-- 
2.47.2

