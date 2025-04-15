Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E19DF186295
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 08:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744706522; cv=none; b=QlBnN9nuNFnIuVeyuLE+SVwQez9Zs3o2r1m3nHXe9KZgWm+if7qgQskHGWyBtXeGWtApmaJQtNI+CjNMCjOQ39wjjv2njb5FWZ7oVrKc1HJF92PHkuZbX5pzVndlC09DKZnznlUxz2pPxpokjMuD/7lHkBOW2Fd+YcmDcmdga7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744706522; c=relaxed/simple;
	bh=MHKkf2eTQKJSDUVgrB+fzpXdXVMv5f/0cBZlNz363RY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hKmf82JIufvxfyx1r3Zs8qLckUqhlRUDAGPlbb0THnEG71sRnoY/a6okXmKccs8NAbAJ/oKnvkrMK1Q8eLghHq71yZw6L+wmI2mvX3QkHwwZWLzAfjCGVNtGOCZ9VE4ABdax3QosjTuAycV6xiiGwk3FkSFjAtYd+7k4GqHZXBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=b4NPZIYV; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="b4NPZIYV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744706519;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rQgMM1c/L1dY1ZPWx+Tr6nBOMEoSGXdQFR50SH8ffA8=;
	b=b4NPZIYVPZ10zhOb/l54eSZOPvh8AXeq/JxjeBLijqRkyLGWdwegeJ/QwcrVZmr1OulqqA
	W2VYL1LAEvCdcCXH/rKNaKa6A7xr2x2lN6e6caiN2FhBTLYv644iw2z8FxQZagQh/MFFtd
	gWsEInnCpaPNpmvLwsH+Oy1oXMKuSHw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-457-T7KBvU2hOa6hGLdjVeqlwA-1; Tue, 15 Apr 2025 04:41:58 -0400
X-MC-Unique: T7KBvU2hOa6hGLdjVeqlwA-1
X-Mimecast-MFC-AGG-ID: T7KBvU2hOa6hGLdjVeqlwA_1744706517
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43efa869b19so36520115e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 01:41:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744706517; x=1745311317;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rQgMM1c/L1dY1ZPWx+Tr6nBOMEoSGXdQFR50SH8ffA8=;
        b=MVgsoFgooP4APOPRHRfDnk/hAXKW+/DUiuVtYAN0jcEqZExgedprhKDiBlJswbedKA
         kBBUIgZZPbgAXKpx4o7l2Ip/wig3dqrOTeN040AozfRWF1dGw+eWCkZPDjo09Ju4An8m
         JlIdyRIasO/mxYliF9s0jXICV4680XMf02lmmgCWh/+PFv7hkWAsftX/qvhu9DZ36R7w
         dWnomPpBv8Vdw3ytl0VV8gG0/e8rB7JHRzejUldT9f4R/1fcyRu6FxSLDfPXN89si7/z
         e0veIMbQcDEjTQOCQx4/8jIdDvGZU53rC9us0wzJMHD7bgCdxkPrzsODieVa9H7YR2tv
         m7cQ==
X-Forwarded-Encrypted: i=1; AJvYcCXb8+Zm7vjiQebkGN6PBHjblv6LP+T0M4Gv+kfQx3aGsd9WusaSHILPdgUeo3hHKBEpW9UgTCxDXd+4/RU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXtTAzXeRUFlCJB8E6J32vdE65AJzmzaiLd991gxbIbAy0yz3E
	EGKJT2vCUsU+TmV70sZXgaN8tUe+Qzs0kdv/4pmcttgM1KVcLWEKwQJydg/QME7aRojg8hEXCRN
	Rqy6nWONiWr2I8US4EpbbEAmn7jt+mVLE74Pbz1GsvAHB1LzxJHOs/ncg74qj7M6D4TrBgQ==
X-Gm-Gg: ASbGncupTLRaatMFP/VD1j61rPVbj6gEvR3FLC1++K+0cLIWm+9770UyWmR+RqoyOsg
	94OFVkW0Sk4iiEeSx8XrIOFnFh8XcMbMpd+QZwoAIYof4qrGNJ0WvdUCukCirkhvkbVhFn4ZVzw
	e+mGpKBywnuCdGzV8EWidFx+5Mx2YYHd+zirhZirtnrHyK02MLp+80hvnPHx8puM6yxoqIGiAwE
	B/owx2NgT23veHBhDJyOtS/8WspvHPregdVA0Eq+X8GVtzBIAeq1i8wqBsLiIUhk8T38wGnWpK2
	ieeqld2twSWl92m+jw==
X-Received: by 2002:a05:600c:1d08:b0:43c:fe9f:ab90 with SMTP id 5b1f17b1804b1-43f3a9aefc4mr100464865e9.28.1744706516962;
        Tue, 15 Apr 2025 01:41:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF/OMyHwno+9Cfn8yM66f8zcKW4KPSM63TW50jawT4VK4YHrLWm5KRsF4/mSRxZf7hHDZfrvA==
X-Received: by 2002:a05:600c:1d08:b0:43c:fe9f:ab90 with SMTP id 5b1f17b1804b1-43f3a9aefc4mr100464635e9.28.1744706516527;
        Tue, 15 Apr 2025 01:41:56 -0700 (PDT)
Received: from sgarzare-redhat ([193.207.162.137])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf43cdfdsm13750153f8f.61.2025.04.15.01.41.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 01:41:55 -0700 (PDT)
Date: Tue, 15 Apr 2025 10:41:49 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: peterhuewe@gmx.de, jarkko@kernel.org, jgg@ziepe.ca, 
	sudeep.holla@arm.com, stuart.yoder@arm.com, linux-integrity@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] tpm_crb_ffa: use dev_xx() macro to print log
Message-ID: <yglnqdykvvof7iwviaacqnmmoanhhoefgmaulw7nrlf6zotbgj@obuqtycczzm7>
References: <20250415075712.2157073-1-yeoreum.yun@arm.com>
 <20250415075712.2157073-3-yeoreum.yun@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20250415075712.2157073-3-yeoreum.yun@arm.com>

On Tue, Apr 15, 2025 at 08:57:12AM +0100, Yeoreum Yun wrote:
>Instread of pr_xxx() macro, use dev_xxx() to print log.
>
>Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
>---
> drivers/char/tpm/tpm_crb_ffa.c | 8 ++++----
> 1 file changed, 4 insertions(+), 4 deletions(-)
>
>diff --git a/drivers/char/tpm/tpm_crb_ffa.c b/drivers/char/tpm/tpm_crb_ffa.c
>index fed775cf53ab..0bb8098e93ae 100644
>--- a/drivers/char/tpm/tpm_crb_ffa.c
>+++ b/drivers/char/tpm/tpm_crb_ffa.c
>@@ -303,7 +303,7 @@ static int tpm_crb_ffa_probe(struct ffa_device *ffa_dev)
>
> 	if (!ffa_partition_supports_direct_recv(ffa_dev) &&
> 	    !ffa_partition_supports_direct_req2_recv(ffa_dev)) {
>-		pr_err("TPM partition doesn't support direct message receive.\n");
>+		dev_warn(&ffa_dev->dev, "partition doesn't support direct message receive.\n");

It's pre-existent, but since we are here, should we put \n also in the 
other messages besides this one?

That said, maybe I'd mention in the commit message that we changed some 
errors to warnings and why.

Thanks,
Stefano

> 		return -EINVAL;
> 	}
>
>@@ -324,17 +324,17 @@ static int tpm_crb_ffa_probe(struct ffa_device *ffa_dev)
> 	rc = tpm_crb_ffa_get_interface_version(&tpm_crb_ffa->major_version,
> 					       &tpm_crb_ffa->minor_version);
> 	if (rc) {
>-		pr_err("failed to get crb interface version. rc:%d", rc);
>+		dev_err(&ffa_dev->dev, "failed to get crb interface version. rc:%d", rc);
> 		goto out;
> 	}
>
>-	pr_info("ABI version %u.%u", tpm_crb_ffa->major_version,
>+	dev_info(&ffa_dev->dev, "ABI version %u.%u", tpm_crb_ffa->major_version,
> 		tpm_crb_ffa->minor_version);
>
> 	if (tpm_crb_ffa->major_version != CRB_FFA_VERSION_MAJOR ||
> 	    (tpm_crb_ffa->minor_version > 0 &&
> 	    tpm_crb_ffa->minor_version < CRB_FFA_VERSION_MINOR)) {
>-		pr_err("Incompatible ABI version");
>+		dev_warn(&ffa_dev->dev, "Incompatible ABI version");
> 		goto out;
> 	}
>
>-- 
>LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}
>

