Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D443328EC
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 19:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743103881; cv=none; b=FxjwL7NY9Kkku+1OgRNYHP/lzfOjeGcV/PxiJmGSbXwMWu3lZBkwvXJlvK10cj46jhmXkD5WXZrLCvVnK8DPQeH/1ukDSyC8g4bCjew/QMgajjWbK5E2gHVv7foxUpgiaReNPUQ1O6PUqCaQreatv6LL293uv8LoBsiZveN8d+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743103881; c=relaxed/simple;
	bh=Uo3Y4wwMyV3y+DSOMke8R1D7DBAWK/vp0DGAudzMYeg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q9divEyke2ticqfnNTUWRBth4ldbD4i7XX28ZgQJDsu0YWLoAIXlTQjS1evHCM7GwwltACXqze+qqLgufNSPOcnjNiOUhlwbSgXcdDmHcum3Zo+HmF62tueq3g1ObkcseFvVa1MFUuFdtfu11ogssbPDiJHLdirceFvfAcxJBdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=jwTKEtkW; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="jwTKEtkW"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-47692b9d059so19177921cf.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 12:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1743103879; x=1743708679; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fOWvcEa0sbfZjABPw9Te+y/65mWJI8Lsb95Ek+V1dlo=;
        b=jwTKEtkWQuP40eSVJnCqMGKUXDv7LRvL4ATsKdf26B6bkeYXlFq8KKuqmzIyt4knjZ
         MVQoW1+bDJCD25GGSq9yonzk7H99jWi/UHjDSapc0O31BGxwDmJxW0sbvY5oh+k5aAlb
         K/k2TDm3plK4XIzx9VetIdQc3jU/p8MHtFAfCz3DkSYuhpsZcwlA2Tzd2XVLBuwJrbPA
         3JQMAHQ1KVQ2qsR+fwzxNMMxG8r+cmdliX3ofJZb8ijDXjehqMzT1E5bYv7bw8sx8tz6
         x9hW4yp8f3PXcJkcSHCiUYbEdcNu22T07KtczXKlaS60xWmapq6OyM4hsTXpYoebOUEV
         H3TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743103879; x=1743708679;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fOWvcEa0sbfZjABPw9Te+y/65mWJI8Lsb95Ek+V1dlo=;
        b=o4q1UHLSR48dOgYhiyKd6RqnVEWQYOkXO2Y5Qaur4Dua7XLY98RA7B0wZC/MlAvV4i
         q3FIdQTTvXzEg5Z730ebUwoWlKpgmJ+M/DbyS8PTE8c/2RReEhx6dT2R8OErh7AD2ibm
         jc2S8qfWVgjx6SCrHmJRBIKYXllbsma2sVQX+qGWV0SRnhfQlk0bb6DFmayCIwszksaT
         OvHx7nlN9cEtWOag+QA0ffFdK1beV7yu7qof++NO7uDwdCBJB1ZTNepx+YIT8GI0+2Hb
         tc0dzGWdlxV7SV87AICUdxuebsqZlIjJxKB9TBbfVMHkHJlV1zbAafge87dOuuxPpOBz
         1ieg==
X-Forwarded-Encrypted: i=1; AJvYcCVaNuAFCfigRCcGCKrPNvOAwNKCX43JiPOMKaCcgMCJ94gDUrA0mHq5TfynV8ReT/axlC0cdyKZ/XVtXpg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1UJB9KUyFJgOmW2rrbeieJkGZ8FsjZieYtb9yyyca+7gQCGOq
	aR8hVJsN5G/TIHq5TNHVSMDt7bNLR0mcfyu1uaMjfrkeMMFxrlaEFSTne86krA==
X-Gm-Gg: ASbGnctmuPZNevu+DM5OVdYdRWYhI+XEZ5OWgyy33LwXlM0o3EF1lJLtqMJWAf38OPD
	q3lbT71tQQ43ns+ERQ4JwFrpjw4xxZYpPC/QTxI3yT6NaGFPlDzEUoT1OjE9/Z8+81z8b+NKvKw
	1U1Ydo2rxne+7QM7wItecMhJ1ALP7PHWM0EozS0NBONdq08rpRJ8OIFbqrDg5PV2MwZQw1AT2oH
	EXeGZVUUiBNPj2EovQNTNbH1xtVmLbFKAS+f1Gd9+o3XQQHfYNCQHzL6Fozz+zXnIR0CY48c+VC
	mG0Xw7P/dty8U0VisvZ+RnqmN5Qdkft8moM00EewPwpXgc3ZOcwu2lyYLAp4kVPMUBubiFuQyuQ
	c7hSWooNjs0gwwrpGjuPTZG9daFNGj5mihlJtvA==
X-Google-Smtp-Source: AGHT+IHhYGeHC6Cc7v+fL0j0iHE1UuzcR8DR3uKdtY7qHAlgm3C/YNf4p1yl1SUxogG0H29UbqzJ+g==
X-Received: by 2002:a05:622a:58c6:b0:477:4df:9a58 with SMTP id d75a77b69052e-4776e0d1714mr88924621cf.18.1743103878520;
        Thu, 27 Mar 2025 12:31:18 -0700 (PDT)
Received: from rowland.harvard.edu (nat-65-112-8-24.harvard-secure.wrls.harvard.edu. [65.112.8.24])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47782a1070csm1526041cf.9.2025.03.27.12.31.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 12:31:17 -0700 (PDT)
Date: Thu, 27 Mar 2025 15:31:15 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH] usb: ehci-fsl: Fix use of private data to avoid
 -Wflex-array-member-not-at-end warning
Message-ID: <8139e4cc-4e5c-40e2-9c4b-717ad3215868@rowland.harvard.edu>
References: <Z-R9BcnSzrRv5FX_@kspp>
 <1e82761e-8554-4168-8feb-561abbe49f7e@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1e82761e-8554-4168-8feb-561abbe49f7e@rowland.harvard.edu>

In the course of fixing up the usages of flexible arrays, Gustavo
submitted a patch updating the ehci-fsl driver.  However, the patch
was wrong because the driver was using the .priv member of the
ehci_hcd structure incorrectly.  The private data is not supposed to
be a wrapper containing the ehci_hcd structure; it is supposed to be a
sub-structure stored in the .priv member.

Fix the problem by replacing the ehci_fsl structure with
ehci_fsl_priv, containing only the private data, along with a suitable
conversion macro for accessing it.  This removes the problem of having
data follow a flexible array member.

Reported-by: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
Link: https://lore.kernel.org/linux-usb/Z-R9BcnSzrRv5FX_@kspp/

---

 drivers/usb/host/ehci-fsl.c |   25 ++++++++-----------------
 1 file changed, 8 insertions(+), 17 deletions(-)

Index: usb-devel/drivers/usb/host/ehci-fsl.c
===================================================================
--- usb-devel.orig/drivers/usb/host/ehci-fsl.c
+++ usb-devel/drivers/usb/host/ehci-fsl.c
@@ -410,15 +410,13 @@ static int ehci_fsl_setup(struct usb_hcd
 	return retval;
 }
 
-struct ehci_fsl {
-	struct ehci_hcd	ehci;
-
-#ifdef CONFIG_PM
+struct ehci_fsl_priv {
 	/* Saved USB PHY settings, need to restore after deep sleep. */
 	u32 usb_ctrl;
-#endif
 };
 
+#define hcd_to_ehci_fsl_priv(h) ((struct ehci_fsl_priv *) hcd_to_ehci(h)->priv)
+
 #ifdef CONFIG_PM
 
 #ifdef CONFIG_PPC_MPC512x
@@ -566,17 +564,10 @@ static inline int ehci_fsl_mpc512x_drv_r
 }
 #endif /* CONFIG_PPC_MPC512x */
 
-static struct ehci_fsl *hcd_to_ehci_fsl(struct usb_hcd *hcd)
-{
-	struct ehci_hcd *ehci = hcd_to_ehci(hcd);
-
-	return container_of(ehci, struct ehci_fsl, ehci);
-}
-
 static int ehci_fsl_drv_suspend(struct device *dev)
 {
 	struct usb_hcd *hcd = dev_get_drvdata(dev);
-	struct ehci_fsl *ehci_fsl = hcd_to_ehci_fsl(hcd);
+	struct ehci_fsl_priv *priv = hcd_to_ehci_fsl_priv(hcd);
 	void __iomem *non_ehci = hcd->regs;
 
 	if (of_device_is_compatible(dev->parent->of_node,
@@ -589,14 +580,14 @@ static int ehci_fsl_drv_suspend(struct d
 	if (!fsl_deep_sleep())
 		return 0;
 
-	ehci_fsl->usb_ctrl = ioread32be(non_ehci + FSL_SOC_USB_CTRL);
+	priv->usb_ctrl = ioread32be(non_ehci + FSL_SOC_USB_CTRL);
 	return 0;
 }
 
 static int ehci_fsl_drv_resume(struct device *dev)
 {
 	struct usb_hcd *hcd = dev_get_drvdata(dev);
-	struct ehci_fsl *ehci_fsl = hcd_to_ehci_fsl(hcd);
+	struct ehci_fsl_priv *priv = hcd_to_ehci_fsl_priv(hcd);
 	struct ehci_hcd *ehci = hcd_to_ehci(hcd);
 	void __iomem *non_ehci = hcd->regs;
 
@@ -612,7 +603,7 @@ static int ehci_fsl_drv_resume(struct de
 	usb_root_hub_lost_power(hcd->self.root_hub);
 
 	/* Restore USB PHY settings and enable the controller. */
-	iowrite32be(ehci_fsl->usb_ctrl, non_ehci + FSL_SOC_USB_CTRL);
+	iowrite32be(priv->usb_ctrl, non_ehci + FSL_SOC_USB_CTRL);
 
 	ehci_reset(ehci);
 	ehci_fsl_reinit(ehci);
@@ -671,7 +662,7 @@ static int ehci_start_port_reset(struct
 #endif /* CONFIG_USB_OTG */
 
 static const struct ehci_driver_overrides ehci_fsl_overrides __initconst = {
-	.extra_priv_size = sizeof(struct ehci_fsl),
+	.extra_priv_size = sizeof(struct ehci_fsl_priv),
 	.reset = ehci_fsl_setup,
 };
 
