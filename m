Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A3A1D5CDE
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 22:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751409105; cv=none; b=cWb15Ppj7dLhnteqab6siX/peZoYeXdeuaiaFhao3x15D6PO06wUMUWE+KCKr9e1nboe3+pnOZ08vJdqdlqSJ706VTOIxo3+fsCjFqL3/gp5qUZZzShG13dtOKRF4cI8R/w8IPl1B9rL/f4O7IM3MeYA+yb106H8+4SYYBohyXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751409105; c=relaxed/simple;
	bh=Y38NyVKnZ82iZGpTSGed9LlVmfbMXnVz10ETj3CqMPk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GmO7bdJ6GEiklIG3RpiMhwO4+R9NBy46AEDcKhVG+76x1EncRssZCVYokAYfxhT6mKSSq3bNoXrsgNlp3T3KVM2uedPcEB2TRFjvtnrj7xrsc/JzCyMXVelVGwzzqwatJN2dwjXlkFPkSpaZusEy/YDpty9UZKX9kE8GL7pJiZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kj1y5Plc; arc=none smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kj1y5Plc"
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-2ef493de975so2405935fac.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 15:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751409102; x=1752013902; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g+APmr3mcxG70O2Gf3NLRFLfhkFazHT+YEHSsydc6Nw=;
        b=kj1y5PlcxzfBzqjp9yr8loT+juWB7r8INMsofwd8QC6Y7b98u33Q3AxfAF4d2g6CSA
         /CVBEU3/xeliL93K2KQyOQjVRay3xmTVRtFBA9mepks6vm5Wx+alMulLlwFd0XFhI003
         Rz1zvGQaLX8x+EYp5B5F11brux4O3QSykY+I0TmKfP+2tdvr/VkFAS0BdsXQCObiXI/Y
         irqr79atlNC6apnQiyLcmifgcAEVrUk1G6envMDiGPbUWn8SnYhwii6H/u1Hhf125ioP
         HNVs0KIpTTOywVXXD6837FwBo8I/LTBSvIc707sUi2y0PzUsR5urXcV31YUMB3GBuNNo
         oEXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751409102; x=1752013902;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g+APmr3mcxG70O2Gf3NLRFLfhkFazHT+YEHSsydc6Nw=;
        b=j/YTjnnZ3TCX/kQ2y8BRVJ7c057xw9TNS1JglJAy3wRFxkP8X4z4jPR3cXHvi08wfV
         wOhRoBnrL2wRvZV4Qig/kv2AAkKqj+Gmn0EfX59GYpokwHtBsmCaSDXfA+9L6gdZAQel
         DFzT8Y6KC0OM8M0oGzD0b2ZdbnNBYrAeTt0mYuoz7TrtcDkK9UtAcS9DxDipkcfy1nBD
         m2av55vP6XNq2kV0W5bPr9jclcjwi6F0L0OTG2It1sypHzvkSv1qWQ8+uw+Iy8ly/5vq
         BqlZF2q4FdPA30Ussv/oZpJpTacs5U1S3yLc5dd+VcCnsku2bWf8XU47BiuY09lezCrt
         vEMA==
X-Forwarded-Encrypted: i=1; AJvYcCUT/JYaEdWuyegrxVDvfK5ud6Rh3mFtMGjmlckfXkBYRf4hN7+YcuCUv3SHrTe4mE8dmfIz0974ACyJws8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxp03HsCYeq/cCTjquGe2uEy0DqmhioGykpSiG1deY1cMBYkfbg
	YygOj1SdWv1Id1OdFYz5fem6YDZwAsXdYsZ2meYXx040s81G3EM/pehEz3CABrXPsyc=
X-Gm-Gg: ASbGncvNM+TSifu5NZISXvCTP8O16J/9UAZGZvV9AbTXEzUZdFHWdt0lP6G3CfVU3L9
	5dhs/TNyIF1CXCAEZlxWKpnMbpS3SXW46F3h5qRZxRMJ9aXljUDXKASiq3g1DUFseyGqeYnQ2S1
	q3gPmkyB3Pnlx9eTbf+IDz1QWo3b66NSBhNjuDhDtg9q9R9fbMzMPHqXdGWY/LqM1B4Nyv7N6eF
	6KmLKLcgZTiA2Be7BxwPLadn8j3m3Z/K69CHCuSu/jqHWpMj/0davOYdoUeQBegXMblDkU4utA2
	shu0IyAdJgAH1QUBFNXHkYMMeKRvoS3OIUKs+vihd3nijSQMMXtp4c/PTWSigPUXD1PzWA==
X-Google-Smtp-Source: AGHT+IEsUQPOhLWTesKKtP8Y6vrAjQiXU7OxciWMUsj0112kKHLpaSXzrVlr3Y2T3n6p/TQSmzEMbg==
X-Received: by 2002:a05:687c:820:b0:2bc:716c:4622 with SMTP id 586e51a60fabf-2f5c7de279fmr396814fac.38.1751409101828;
        Tue, 01 Jul 2025 15:31:41 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:d663:8de8:cafb:14e3])
        by smtp.gmail.com with UTF8SMTPSA id 46e09a7af769-73afb10088esm2275056a34.50.2025.07.01.15.31.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 15:31:41 -0700 (PDT)
Date: Tue, 1 Jul 2025 17:31:40 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
Cc: Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] dmaengine: nbpfaxi: Fix memory corruption in probe()
Message-ID: <b13c5225-7eff-448c-badc-a2c98e9bcaca@sabinyo.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The nbpf->chan[] array is allocated earlier in the nbpf_probe() function
and it has "num_channels" elements.  These three loops iterate one
element farther than they should and corrupt memory.

The changes to the second loop are more involved.  In this case, we're
copying data from the irqbuf[] array into the nbpf->chan[] array.  If
the data in irqbuf[i] is the error IRQ then we skip it, so the iterators
are not in sync.  I added a check to ensure that we don't go beyond the
end of the irqbuf[] array.  I'm pretty sure this can't happen, but it
seemed harmless to add a check.

On the other hand, after the loop has ended there is a check to ensure
that the "chan" iterator is where we expect it to be.  In the original
code we went one element beyond the end of the array so the iterator
wasn't in the correct place and it would always return -EINVAL.  However,
now it will always be in the correct place.  I deleted the check since
we know the result.

Cc: stable@vger.kernel.org
Fixes: b45b262cefd5 ("dmaengine: add a driver for AMBA AXI NBPF DMAC IP cores")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
From static analysis.  Not tested.

 drivers/dma/nbpfaxi.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/nbpfaxi.c b/drivers/dma/nbpfaxi.c
index 0d6324c4e2be..7a2488a0d6a3 100644
--- a/drivers/dma/nbpfaxi.c
+++ b/drivers/dma/nbpfaxi.c
@@ -1351,7 +1351,7 @@ static int nbpf_probe(struct platform_device *pdev)
 	if (irqs == 1) {
 		eirq = irqbuf[0];
 
-		for (i = 0; i <= num_channels; i++)
+		for (i = 0; i < num_channels; i++)
 			nbpf->chan[i].irq = irqbuf[0];
 	} else {
 		eirq = platform_get_irq_byname(pdev, "error");
@@ -1361,16 +1361,15 @@ static int nbpf_probe(struct platform_device *pdev)
 		if (irqs == num_channels + 1) {
 			struct nbpf_channel *chan;
 
-			for (i = 0, chan = nbpf->chan; i <= num_channels;
+			for (i = 0, chan = nbpf->chan; i < num_channels;
 			     i++, chan++) {
 				/* Skip the error IRQ */
 				if (irqbuf[i] == eirq)
 					i++;
+				if (i >= ARRAY_SIZE(irqbuf))
+					return -EINVAL;
 				chan->irq = irqbuf[i];
 			}
-
-			if (chan != nbpf->chan + num_channels)
-				return -EINVAL;
 		} else {
 			/* 2 IRQs and more than one channel */
 			if (irqbuf[0] == eirq)
@@ -1378,7 +1377,7 @@ static int nbpf_probe(struct platform_device *pdev)
 			else
 				irq = irqbuf[0];
 
-			for (i = 0; i <= num_channels; i++)
+			for (i = 0; i < num_channels; i++)
 				nbpf->chan[i].irq = irq;
 		}
 	}
-- 
2.47.2

