Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5FCD1D7E41
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 10:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746700859; cv=none; b=RoNSRP74GLYX9oPinQ6qjxYzgM/09fmDyFcpP3Sty9EQviqpLr60C6aeg/WLSV9I/PjdOPvX8/vA5fdDK/gJhIjkwHBdvEU4uzjSbjq1pgdYBAvFDnD4aTBqRAylEbptVg/h35QtAOSTalMYRp1jov6iPfkDVvpRv5AmUHY6Bvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746700859; c=relaxed/simple;
	bh=1wgs5Kdb/eUSSTmT42GEKh8LfDiVMir/H2yVj0DbsRQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aekWaUrPAJOvF+spqa/635orxPTJ0IDJYFCnm9zW6p9vdJKPdjassebNgWu7XgaLnWp8QUsbtwrIk+W92ZNU68XSgYaSjH3qK8KCCjRV+YK5y3H78EUbcUnFmiHTmrYXKS5ac1Us31/t6CgcEvvhyNgObNRVz9oB3tlfWJkm2ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=K9me+CsC; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="K9me+CsC"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4ZtTDw2Q9xz9tQ8;
	Thu,  8 May 2025 12:40:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1746700848; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RcY7UNZ863fAI1DAceMqq/Ux3gY5/KTXwjNxLnDdOx0=;
	b=K9me+CsClIMma79a4SFSgeymnK9XSRplIO9sOg4X8SE5mPkhUR94ax+/+JLPB8ouPl1AWr
	rtB/foRTsePvYny0IalWVgpaSfO58WWLMp1225PcZUtILuEt/4Bi21WUFn9pnIWLUGLeuS
	C5xEk6ef+hd7T8E2rQ5Yx5gqv/JDv0E5zcISEr/aEqYVW3zdQdc/Dwm/mj/pG91VSg7EOh
	9f8Ufh7kP5wMXe02eDKG/lvDAITe16NRwuy40kV14KpQgyDiAYtScwRrqOvs9VxnXcI4PZ
	DhLzz5spz+hju+wCyt8xhbhrvlQ/i4X2qcpZAteSwlCpjehmyEiGM4EbYyclCQ==
Message-ID: <e40cf04283e281e2d4a912ff75bce3c6cb8bcf97.camel@mailbox.org>
Subject: Re: [PATCH v2] drm/vmgfx: Use non-hybrid PCI devres API
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Philipp Stanner <phasta@kernel.org>, Zack Rusin
 <zack.rusin@broadcom.com>,  Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Thu, 08 May 2025 12:40:44 +0200
In-Reply-To: <20250423120643.66814-2-phasta@kernel.org>
References: <20250423120643.66814-2-phasta@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-ID: c800cff8993c19b84be
X-MBO-RS-META: yf6fpgmpz8b8udcdjoapmonspck7gj3w

On Wed, 2025-04-23 at 14:06 +0200, Philipp Stanner wrote:
> vmgfx enables its PCI device with pcim_enable_device(). This,
> implicitly, switches the function pci_request_regions() into managed
> mode, where it becomes a devres function.
>=20
> The PCI subsystem wants to remove this hybrid nature from its
> interfaces. To do so, users of the aforementioned combination of
> functions must be ported to non-hybrid functions.
>=20
> Moreover, since both functions are already managed in this driver,
> the
> calls to pci_release_regions() are unnecessary.
>=20
> Remove the calls to pci_release_regions().
>=20
> Replace the call to sometimes-managed pci_request_regions() with one
> to
> the always-managed pcim_request_all_regions().
>=20
> Signed-off-by: Philipp Stanner <phasta@kernel.org>

*PING*

> ---
> Changes in v2:
> =C2=A0 - Fix unused variable error.
> ---
> =C2=A0drivers/gpu/drm/vmwgfx/vmwgfx_drv.c | 14 +++-----------
> =C2=A01 file changed, 3 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> index 0f32471c8533..1e3ebace32ae 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> @@ -733,7 +733,7 @@ static int vmw_setup_pci_resources(struct
> vmw_private *dev,
> =C2=A0
> =C2=A0	pci_set_master(pdev);
> =C2=A0
> -	ret =3D pci_request_regions(pdev, "vmwgfx probe");
> +	ret =3D pcim_request_all_regions(pdev, "vmwgfx probe");
> =C2=A0	if (ret)
> =C2=A0		return ret;
> =C2=A0
> @@ -753,7 +753,6 @@ static int vmw_setup_pci_resources(struct
> vmw_private *dev,
> =C2=A0		if (!dev->rmmio) {
> =C2=A0			drm_err(&dev->drm,
> =C2=A0				"Failed mapping registers mmio
> memory.\n");
> -			pci_release_regions(pdev);
> =C2=A0			return -ENOMEM;
> =C2=A0		}
> =C2=A0	} else if (pci_id =3D=3D VMWGFX_PCI_ID_SVGA2) {
> @@ -774,11 +773,9 @@ static int vmw_setup_pci_resources(struct
> vmw_private *dev,
> =C2=A0		if (IS_ERR(dev->fifo_mem)) {
> =C2=A0			drm_err(&dev->drm,
> =C2=A0				=C2=A0 "Failed mapping FIFO memory.\n");
> -			pci_release_regions(pdev);
> =C2=A0			return PTR_ERR(dev->fifo_mem);
> =C2=A0		}
> =C2=A0	} else {
> -		pci_release_regions(pdev);
> =C2=A0		return -EINVAL;
> =C2=A0	}
> =C2=A0
> @@ -856,7 +853,6 @@ static int vmw_driver_load(struct vmw_private
> *dev_priv, u32 pci_id)
> =C2=A0	int ret;
> =C2=A0	enum vmw_res_type i;
> =C2=A0	bool refuse_dma =3D false;
> -	struct pci_dev *pdev =3D to_pci_dev(dev_priv->drm.dev);
> =C2=A0
> =C2=A0	vmw_sw_context_init(dev_priv);
> =C2=A0
> @@ -872,7 +868,7 @@ static int vmw_driver_load(struct vmw_private
> *dev_priv, u32 pci_id)
> =C2=A0		return ret;
> =C2=A0	ret =3D vmw_detect_version(dev_priv);
> =C2=A0	if (ret)
> -		goto out_no_pci_or_version;
> +		return ret;
> =C2=A0
> =C2=A0
> =C2=A0	for (i =3D vmw_res_context; i < vmw_res_max; ++i) {
> @@ -1172,15 +1168,13 @@ static int vmw_driver_load(struct vmw_private
> *dev_priv, u32 pci_id)
> =C2=A0
> =C2=A0	if (dev_priv->ctx.staged_bindings)
> =C2=A0		vmw_binding_state_free(dev_priv-
> >ctx.staged_bindings);
> -out_no_pci_or_version:
> -	pci_release_regions(pdev);
> +
> =C2=A0	return ret;
> =C2=A0}
> =C2=A0
> =C2=A0static void vmw_driver_unload(struct drm_device *dev)
> =C2=A0{
> =C2=A0	struct vmw_private *dev_priv =3D vmw_priv(dev);
> -	struct pci_dev *pdev =3D to_pci_dev(dev->dev);
> =C2=A0	enum vmw_res_type i;
> =C2=A0
> =C2=A0	unregister_pm_notifier(&dev_priv->pm_nb);
> @@ -1216,8 +1210,6 @@ static void vmw_driver_unload(struct drm_device
> *dev)
> =C2=A0		idr_destroy(&dev_priv->res_idr[i]);
> =C2=A0
> =C2=A0	vmw_mksstat_remove_all(dev_priv);
> -
> -	pci_release_regions(pdev);
> =C2=A0}
> =C2=A0
> =C2=A0static void vmw_postclose(struct drm_device *dev,

