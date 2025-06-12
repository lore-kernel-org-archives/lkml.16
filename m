Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDD7C149C4D
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 14:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749736908; cv=none; b=bKasnPdy66JEFiOW32ay8hg3qkmdqI1r13ojhPFdNvJ9X/dn7mtKRjOXVay8J1aowjwC4/4MVR9Vc2F/rl6lqPsEOh7HIbZ9jkUNZ1QBZugSNgRjIORpTdmUtZod/B+nBEINeFKuPU40ziTmWYadSH+o0Wur20FaX80jMDe1Bd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749736908; c=relaxed/simple;
	bh=ZZ43kS8ldodA8ytEGpODD/ELIeuFK1PLrhz2Ds+7Vv0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NEHJ6cpQ95i8i9jWNQfC/Oo7doUkndvCuBuAG+PytUsUigJttDwgPY/J+/tb/vCWknKLrjC+/ofT4ZN7MIt/LAD3x8SZk/DZCECDBq6yNg8K4gDnuV1+XXqzQiwvcO141f+O1ua0V5Kjw2//P/QAlIe1K+9GdS3L6C1RgeU+XO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20230601.gappssmtp.com header.i=@dama-to.20230601.gappssmtp.com header.b=G1MOtfez; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20230601.gappssmtp.com header.i=@dama-to.20230601.gappssmtp.com header.b="G1MOtfez"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-442f4a3a4d6so5629075e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 07:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20230601.gappssmtp.com; s=20230601; t=1749736903; x=1750341703; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qcnu5fvN7W4+2bj6XO77hAeu2WjhdtIOX66M3CMmvLU=;
        b=G1MOtfezASpfIf0qX8HQJCQ6GQ++sMFBGcJgtT6OflK7xN5KWPGfjIju3JGZkHbIgl
         wX6yAC21ZwNbx+x5poBr7636Ewmca1fVlBOl5dC9UPGafqDFPvT7U7myLrL01Bzdlc2k
         r5QGXmbaSdSDWqABUid8M3dP2n43MGpMBlg5CkNJJD3fbqzs/jCF8A4gOespsWUzbmTZ
         KTbBgK4RrAIG0jYptiNmw1M/YQCxn94Ncuu5qEegxDrfxttJ1jaeP6cJYS8n6ig7ROOU
         i04QJanD1EBFdD/Idh72GArj3I5IaXmHdjnhFbQWg/dbrVK416d2tlG1/LhkJC9E2cPN
         AKgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749736903; x=1750341703;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qcnu5fvN7W4+2bj6XO77hAeu2WjhdtIOX66M3CMmvLU=;
        b=aDddbRa/ExrN+A3dUh3RNqV7fdRiVDsCNkj1qSn+H/HW5mDQELl0f7Zsqlg/6XedH/
         82dOWbN6ZHULkNv08tMLcWP0PBDgtUR6PdUiOhsbm4PJtDTwqvtHz9t4/PqbOuLhmsWK
         pyxGVgM590nq3ek0iESPRksGaFIYypGiKCQvKTSdwLpjudz9Gb6MTF+9z2LiXiCnrt21
         63ypE8CSywFjMCa3mKhA1lWziQPay5c60d2Ae9ETdmUZbPyCgR4AmSFXE5HkdgDT24b6
         0rbaYtsBhH/F8bbJ+RdiQ52fOxQg2zLT8y6UJjRMthEBzp3wuEYd0HGk2n2N4q7+oUrG
         UjNg==
X-Forwarded-Encrypted: i=1; AJvYcCU+CWKLzJkzpsXXzmhfmt68sn/jQXgLNZKpltPnnQ8i/AOnw9Ud9ZF+LwTOPdJzANVL5vTJSxSt/vAxF4k=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRuEfpHBspBy1abbY4rguCQUMLNAbRLWMnF+nBFflQIzTGRLyM
	MsRU5wCVB1xEz8pWC2RoEZVEMhIUDpIPc+BpY2rjKqN4qL9F9YljIQRRG2dwzvSST4TlQ7dIHlI
	NXdC16OY=
X-Gm-Gg: ASbGnctwSCyCw1+qTpeo4dw1iVAXLCXA6Zbk5zCkrBQ+qoRhRc1o4Lxo/9j/qJ1z+Sc
	JVuMNuV19bONClIVMR5AVKmyDhF3DJpM08LygRY9GDWFM5Jr7yUt5B2AAV9Ooi6Q3ZCzcfKPA9t
	rkxg6mD+P9m4HwFoK4jDTUEyzh99qVtW7zLE3mgUr1XbHGr/qlqf0c429VrsXox0HXYLmEF0y11
	RujtfkNDuz+uKz2SeNHahG5aKLFrSicsfow+L5PCjXTy8V2Whs7mJ79EMxQGglDoX93qJQn0u0V
	wIGG1rMtpMUf8xHL9SHBtvsAc3xI+1ccpwhGU5LqTKfY0gOUROCTetiscXRh2E57sH7FHlQX9uI
	WDQ==
X-Google-Smtp-Source: AGHT+IF9vG727gdXjZJJB2mJs18JTWpDw9L1lyEsGwm5J9cJLF4nYoR1uT6I1BXoR1zcBSJ/THuMnA==
X-Received: by 2002:a05:600c:5809:b0:453:9b3:5b58 with SMTP id 5b1f17b1804b1-4532c2a48cbmr22424125e9.4.1749736902805;
        Thu, 12 Jun 2025 07:01:42 -0700 (PDT)
Received: from MacBook-Air.local ([5.100.243.24])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e25f207sm21571515e9.35.2025.06.12.07.01.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 07:01:42 -0700 (PDT)
Date: Thu, 12 Jun 2025 17:01:39 +0300
From: Joe Damato <joe@dama.to>
To: Shannon Nelson <shannon.nelson@amd.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, brett.creeley@amd.com
Subject: Re: [PATCH net-next 3/3] ionic: cancel delayed work earlier in remove
Message-ID: <aErdwwvIHq8L7WBM@MacBook-Air.local>
Mail-Followup-To: Joe Damato <joe@dama.to>,
	Shannon Nelson <shannon.nelson@amd.com>, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, brett.creeley@amd.com
References: <20250609214644.64851-1-shannon.nelson@amd.com>
 <20250609214644.64851-4-shannon.nelson@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609214644.64851-4-shannon.nelson@amd.com>

On Mon, Jun 09, 2025 at 02:46:44PM -0700, Shannon Nelson wrote:
> Cancel any entries on the delayed work queue before starting
> to tear down the lif to be sure there is no race with any
> other events.
> 
> Signed-off-by: Shannon Nelson <shannon.nelson@amd.com>
> ---
>  drivers/net/ethernet/pensando/ionic/ionic_bus_pci.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/net/ethernet/pensando/ionic/ionic_bus_pci.c b/drivers/net/ethernet/pensando/ionic/ionic_bus_pci.c
> index 4c377bdc62c8..136bfa3516d0 100644
> --- a/drivers/net/ethernet/pensando/ionic/ionic_bus_pci.c
> +++ b/drivers/net/ethernet/pensando/ionic/ionic_bus_pci.c
> @@ -409,6 +409,7 @@ static void ionic_remove(struct pci_dev *pdev)
>  	timer_shutdown_sync(&ionic->watchdog_timer);
>  
>  	if (ionic->lif) {
> +		cancel_work_sync(&ionic->lif->deferred.work);
>  		/* prevent adminq cmds if already known as down */
>  		if (test_and_clear_bit(IONIC_LIF_F_FW_RESET, ionic->lif->state))
>  			set_bit(IONIC_LIF_F_FW_STOPPING, ionic->lif->state);

Wanted to note that it seems this could be called twice in this path?

Once above and then a second time in ionic_lif_deinit, although
ionic_lif_deinit seems to be called from other paths (like fw down?), so
that's probably OK.

Reviewed-by: Joe Damato <joe@dama.to>
