Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E11B21ADAE
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 11:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744110529; cv=none; b=oco0eKpnMsgoiWArYyhaTS6fu2lYVMetMm+fX8at8Dz2ILSZR6ONbozhGzoF5P2qvtzZ58SIDyvaSnLIsbryDMl237CbWApbMLGkrxnsUcKLdPA7xyGPjM2wmOLejwgPMCAZSggjCtv3IvRAyTPXIUIZJvfARm8ZTuCUNgmXgMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744110529; c=relaxed/simple;
	bh=pNXa2XEAZKwmP0PbFXg1zjrzFXFnWgnsxFsJ8P7Mpk4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uafBs84k+c60oMKOu8E4PHPmJ1xPbtWpPb872O6aVie41Wr0WChjPerznyxdT/iA0HCOZ6Eullf/Tu93QiSmlafkieDm3TlsOffaxelSxhYa6S8wDc/2QioNsxNCPf6XO3cQZmlIJG92Q5tAJbxmdsEdIKelKrzWVnuuC/hGMNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=At/ucYRj; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="At/ucYRj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744110526;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CiWKsYWjlXVdW0Vl66KeGe+yfVSaUjilRJLGAs2qAqY=;
	b=At/ucYRj3Xyod35WMmis9NIQT+J74tl41NMkmwq2Zjub1u4VGlegE3UrkdvT8pF0LCNqUz
	n/OoqMjeOy1ExlGC1oxpuGIVKXb8poAcEJgZ3QNINYI4/5hgYbrtBkROPQMzuy7QF7KGYq
	6UoEjB7v/NVjqGqhYV4X/J89niW3BME=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-494-0YuvXZFjNSqtUu2-wTahsA-1; Tue, 08 Apr 2025 07:08:43 -0400
X-MC-Unique: 0YuvXZFjNSqtUu2-wTahsA-1
X-Mimecast-MFC-AGG-ID: 0YuvXZFjNSqtUu2-wTahsA_1744110522
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43d007b2c79so41024685e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 04:08:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744110522; x=1744715322;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CiWKsYWjlXVdW0Vl66KeGe+yfVSaUjilRJLGAs2qAqY=;
        b=KFMWYY8AP7wKGvlU0/pW7N+d1ekZdMqEfcjSjl2HYYO72CBC/dcWx4SStFl26xuJEN
         4skmhuHRZ78Q6nv1/XH3tQbmEWz0qnz/B9P7nnvDJwuAdkstMQM2qb9R81yIhBKwC6HY
         Ay6nQGgDAhn9Dw5iWgiJu96AbWgBcuybhdr/L2S4BSGxmvOgh9hLtTqPD3GUWPGLLDtV
         ngXlgjDCNPAhEgDPVNGdsW19d7hFChZhk9CbCOVD0JSoYbgEgy21xn/9lrhafzAGgSv8
         2e5MYeXaNZ7ZUC4tpdnEdr3A3I34nvT2vOHNarO+yb/vAomtB1ly0rwjBh1oJkHy/pQ4
         U3Ew==
X-Forwarded-Encrypted: i=1; AJvYcCU8B/BPo8vc2Znuq85GPSaX8udFvq6LYhsxgrSpaykYSz/KFb7rErGgYow0riiT8jE7sWF0GVLwMIwIOsk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhaVjgBPgbqIv5qk/cf/MvqXXdszWKPNY/89v/lEpEzzP211+q
	k7sQZCDoQTrttxb6sOlwvKyUOkYTbucxXg3NR7StI+bNeuSbGjZxdkR0t3sr6wjFJplMJd0ajVc
	kks00jBm7x9KLiP2say12qm9WGNYn2Fj8vz1mNU8ssipGYpp/8e41+q4Jgo1Pdg==
X-Gm-Gg: ASbGncvDr4lV4x+aXq1uEjrtJeokKB4gQ+YyQzjF9KBGXYPxQHZVfViagg31e6SiLz+
	fXdgo5DLUDlVWrfASY/rnr642EUT8QHtHGn+ot4ooS2qZk89cT1G92b6UIj1HjQkAuHvFfBxhlq
	2tED81OvY+NfNskKpzq/oM+DeXwCWQGhRtTFVHvOQeUU+mcUFJIz0t1xCe+D3gsjMcEsMOIYe79
	wBbuddngowJSNa+PxgXGyOz0U4eRIQgoez9DDCwwstttVRpekXuzBeMBW6Mi/oBu5eJexmGJigw
	YN7p6u9vn0dzS/DspMLqGuSo/PY4dQ70xxJyjHde30ByqOk2z2uZeq2XRsVxbKtF
X-Received: by 2002:a05:600c:1c17:b0:43c:f64c:44a4 with SMTP id 5b1f17b1804b1-43ee063fbc7mr118525055e9.8.1744110522181;
        Tue, 08 Apr 2025 04:08:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGWienIwYQBLsRDfxpLTrW6mxw6sjcpGYF27rjIKiWUTsuRHwg0Muagv8RixgT6kwQsR+HJNg==
X-Received: by 2002:a05:600c:1c17:b0:43c:f64c:44a4 with SMTP id 5b1f17b1804b1-43ee063fbc7mr118524765e9.8.1744110521621;
        Tue, 08 Apr 2025 04:08:41 -0700 (PDT)
Received: from sgarzare-redhat (host-79-53-30-213.retail.telecomitalia.it. [79.53.30.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec1f27a55sm160617895e9.2.2025.04.08.04.08.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 04:08:40 -0700 (PDT)
Date: Tue, 8 Apr 2025 13:08:36 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Jarkko Sakkinen <jarkko@kernel.org>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Peter Huewe <peterhuewe@gmx.de>, Jason Gunthorpe <jgg@ziepe.ca>, 
	"H. Peter Anvin" <hpa@zytor.com>, linux-coco@lists.linux.dev, linux-integrity@vger.kernel.org, 
	Ingo Molnar <mingo@redhat.com>, x86@kernel.org, Tom Lendacky <thomas.lendacky@amd.com>, 
	Joerg Roedel <jroedel@suse.de>, Dionna Glaze <dionnaglaze@google.com>, 
	Claudio Carvalho <cclaudio@linux.ibm.com>, James Bottomley <James.Bottomley@hansenpartnership.com>, 
	linux-kernel@vger.kernel.org, Dov Murik <dovmurik@linux.ibm.com>, 
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v6 4/4] x86/sev: register tpm-svsm platform device
Message-ID: <eqtiiphs6rtjo7nirkw7zcicew75wnl4ydenrt5vl6jdpqdgj6@2brjlyjbqhoq>
References: <20250403100943.120738-1-sgarzare@redhat.com>
 <20250403100943.120738-5-sgarzare@redhat.com>
 <20250408110012.GFZ_UBvOcEfEcIM4mI@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20250408110012.GFZ_UBvOcEfEcIM4mI@fat_crate.local>

On Tue, Apr 08, 2025 at 01:00:12PM +0200, Borislav Petkov wrote:
>On Thu, Apr 03, 2025 at 12:09:42PM +0200, Stefano Garzarella wrote:
>> @@ -2697,6 +2702,9 @@ static int __init snp_init_platform_device(void)
>>  	if (platform_device_register(&sev_guest_device))
>>  		return -ENODEV;
>>
>> +	if (platform_device_register(&tpm_svsm_device))
>> +		return -ENODEV;
>
>So I don't understand the design here:
>
>You've exported the probe function - snp_svsm_vtpm_probe() - and you're
>calling it in tpm_svsm_probe().
>
>So why aren't you registering the platform device there too but are doing this
>unconditional strange thing here?

We discussed a bit on v3, but I'm open to change it:
https://lore.kernel.org/linux-integrity/nrn4ur66lz2ocbkkjl2bgiex3xbp552szerfhalsaefunqxf7p@ki7xf66zrf6u/

  I tried to keep the logic of whether or not the driver is needed all in 
  the tpm_svsm_probe()/snp_svsm_vtpm_probe() (where I check for SVSM).
  If you prefer to move some pieces here, though, I'm open.

Thanks,
Stefano

