Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69AD923497B
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 09:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744794530; cv=none; b=lF7yqJGjnK+gjiYITEptFsKmBL+15rdnF3YOC1t1NZW+k0lAo8rINRmRSqRAV63WXBK6WUa6qqqJKbffQMK2chbfB2QfQWdglh8xdk75lQ4KUW5c1FmBP669nVo8WYSpwRv+loV2kKaWEe7tE2ty9Flza34IRPaaFTi3T4lfKG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744794530; c=relaxed/simple;
	bh=g8jueIBgcTn+FYC4lrbEtVTxxGmm6Nd0Tmk/DQVTIpA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rtUPf6Wv1lLSoHi8Ew4mdYBpAMI7ox/UIbWItzV2xMTAOs3/r0FBVg02tqIMH6+n63X/dzLtksQB+fPN/36xv7fZPH292qxoE9XOhBAyGydQsBv5i7e9Jxp1UuPfg8ONMaysEyqeUebwCw7c1g6nd2mNnimby+XNirrwoG8ymD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Juvb7dzF; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Juvb7dzF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744794527;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YIOfu8RrFqeGGuM6flhzjgQUceI7NT+dd2DxCzt2hy4=;
	b=Juvb7dzF+3Pjq42zpr6hnQTFH+jhIL1RkVI/yCJZvWjiSOlpFU6tFkJRqDsE7TVX7xkNST
	fnXzlygXVPg7DeajcQPh1eY94gIjJ+X+adgJwgqQc1QMikoAy9+sbVDYudK9FDGWkNCqQV
	wBm/4pO5PbmpdIvYt+sFkAmW5A1+BXE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-418-HEYCR9IaOqysP8k4Tf68sw-1; Wed, 16 Apr 2025 05:08:45 -0400
X-MC-Unique: HEYCR9IaOqysP8k4Tf68sw-1
X-Mimecast-MFC-AGG-ID: HEYCR9IaOqysP8k4Tf68sw_1744794524
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-39c30f26e31so4360841f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 02:08:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744794524; x=1745399324;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YIOfu8RrFqeGGuM6flhzjgQUceI7NT+dd2DxCzt2hy4=;
        b=qoRHdLwaJsOYp46wNGGqk9sxWAHr6kS1UyoIPePNvrriMoS1P1y/97RHwjBbieDnQr
         PgpYxVyyDHYHAyaDqd7IiU+w+xcBBu9LR7JjjSJmYTjVn0432QVOpY/n3TA/D3kZA34P
         kX/2EfKxJ+4xe4LPtxjhMhB7DgHhFXeVCVzjxHwH/J9oN2EC8H+nWiZlMuCDL/d5smCr
         VDEIkh8YSpy0P3BTRakEJbUaazU1EwEu5Z6ISoHmD0RmlqJ1VS69XXx2fHZ64Z9zx+aO
         WPXhBX8x5gElgrHvwh4h4w42ObSKkplbs9grsBv9me206VRLxxAWFOAHlqSFG0ECyb9A
         Ksuw==
X-Forwarded-Encrypted: i=1; AJvYcCUNqaxFygsNPGwshWFN0Ty5Dt2gk1abWrabzWHY1teQHs6ZZiwmDtFlHzZTlTrVKEtLW2H0FF8s2u2UQAE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyADzmZ4GYvSAav5Fj2zXemv2AGsEGkEFGThK2D1UgJdNpMRTWo
	3xoNleMBr5V/jbLvKXZ5M90UGksi9lDaZ9dcydofQWacFjlvbSQ+YGC6VaScZvCEMhtD1iHv3qw
	cN1TOQ+yY8HZLNtbalbEP07HizGnaJmxiL27l4SKNUZGyjUmt/2xzSLwFdWMLTAR0l1IQQQ==
X-Gm-Gg: ASbGncuSEvbztgP/kz6c9yvwjZ+9HNVSZOaRMhgVmK6TlD+vOuoUmQx4B25O+qq8mN4
	EhtTDs/021nJB7yOGGQ0iTB8xdHhxjmVYqY2D/d0KcqFknwCtm5WLoa9HIYuehhr+EmI8i4Ahkd
	5id7lkST5evWxSjd8Oa3s/OxN68H/WS+ahllhcbBUgAH0I4MNkkWGL0IZ0wYsquRUdasSi30cM9
	D98Z0SD6aAepzsPOGJFfqpydBgE3GXsm2h4Pl+vqLDQcGLi7c2i8ZNU7H15LCrrcZCtyHEXdMVA
	JDo1wj9OPHQzwFd4EQ==
X-Received: by 2002:a5d:5f90:0:b0:38f:3e1c:211d with SMTP id ffacd0b85a97d-39ee5b18357mr957289f8f.14.1744794523788;
        Wed, 16 Apr 2025 02:08:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEBsN4+oh5QxQ8vbKn116QSLShSvGFPIX2Be2WSdAd0ELx306bEqsJC2ErLqnEdyZGudqNVhw==
X-Received: by 2002:a5d:5f90:0:b0:38f:3e1c:211d with SMTP id ffacd0b85a97d-39ee5b18357mr957262f8f.14.1744794523366;
        Wed, 16 Apr 2025 02:08:43 -0700 (PDT)
Received: from sgarzare-redhat ([193.207.148.176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf43d38fsm16568008f8f.71.2025.04.16.02.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 02:08:42 -0700 (PDT)
Date: Wed, 16 Apr 2025 11:08:36 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: peterhuewe@gmx.de, jarkko@kernel.org, jgg@ziepe.ca, 
	sudeep.holla@arm.com, stuart.yoder@arm.com, linux-integrity@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/2] tpm_crb_ffa: use dev_xx() macro to print log
Message-ID: <ss6mjfgbiq4z324uaamqfn7idcvv3hjjsictqqzfjvhftduexz@rvwrb6xsuy4j>
References: <20250415185013.2387369-1-yeoreum.yun@arm.com>
 <20250415185013.2387369-3-yeoreum.yun@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20250415185013.2387369-3-yeoreum.yun@arm.com>

On Tue, Apr 15, 2025 at 07:50:13PM +0100, Yeoreum Yun wrote:
>Instead of pr_xxx() macro, use dev_xxx() to print log.
>This patch changes some error log level to warn log level when
>the tpm_crb_ffa secure partition doesn't support properly but
>system can run without it.
>(i.e) unsupport of direct message ABI or unsupported ABI version
>
>Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
>---
> drivers/char/tpm/tpm_crb_ffa.c | 8 ++++----
> 1 file changed, 4 insertions(+), 4 deletions(-)

LGTM!

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

>
>diff --git a/drivers/char/tpm/tpm_crb_ffa.c b/drivers/char/tpm/tpm_crb_ffa.c
>index fed775cf53ab..66b38b2cbdd5 100644
>--- a/drivers/char/tpm/tpm_crb_ffa.c
>+++ b/drivers/char/tpm/tpm_crb_ffa.c
>@@ -303,7 +303,7 @@ static int tpm_crb_ffa_probe(struct ffa_device *ffa_dev)
>
> 	if (!ffa_partition_supports_direct_recv(ffa_dev) &&
> 	    !ffa_partition_supports_direct_req2_recv(ffa_dev)) {
>-		pr_err("TPM partition doesn't support direct message receive.\n");
>+		dev_warn(&ffa_dev->dev, "partition doesn't support direct message receive.\n");
> 		return -EINVAL;
> 	}
>
>@@ -324,17 +324,17 @@ static int tpm_crb_ffa_probe(struct ffa_device *ffa_dev)
> 	rc = tpm_crb_ffa_get_interface_version(&tpm_crb_ffa->major_version,
> 					       &tpm_crb_ffa->minor_version);
> 	if (rc) {
>-		pr_err("failed to get crb interface version. rc:%d", rc);
>+		dev_err(&ffa_dev->dev, "failed to get crb interface version. rc:%d\n", rc);
> 		goto out;
> 	}
>
>-	pr_info("ABI version %u.%u", tpm_crb_ffa->major_version,
>+	dev_info(&ffa_dev->dev, "ABI version %u.%u\n", tpm_crb_ffa->major_version,
> 		tpm_crb_ffa->minor_version);
>
> 	if (tpm_crb_ffa->major_version != CRB_FFA_VERSION_MAJOR ||
> 	    (tpm_crb_ffa->minor_version > 0 &&
> 	    tpm_crb_ffa->minor_version < CRB_FFA_VERSION_MINOR)) {
>-		pr_err("Incompatible ABI version");
>+		dev_warn(&ffa_dev->dev, "Incompatible ABI version\n");
> 		goto out;
> 	}
>
>-- 
>LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}
>

