Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B1520E003
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 09:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743069491; cv=none; b=SFjMgiQfoAHKOWtU4aGKl44DCIO8AN+FXy11Wt4icNHMsJRchHYxlFX5tsNq8OGu/VFaW39Hm8SWbafrKW6fNCyT+MxD2k8YHVJKWDj8s3KZ3FI1r5Hi3QlWtqxeBMfg+T5kD6R8AGldy9lLWV3e4Fqlzfx64X/ieBwlGPA5nok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743069491; c=relaxed/simple;
	bh=vWFcy9MqBkU3MS0rkYQfag+265Y0WSAQStIYd8p8iC4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZOKwe3/KNbOx4ulWajin5qXmEbGAzjlKw339XbsU5W1arhrw/bT+Mmb50mgbIBaoXDxnI9/Pa8uSyP35OR+rOSKhfPpwAnyGWv3ultXp1kIvqgYqz1LX5R6ok5NMtsyxzhxxOIgLLFT+6W/b2nhAvPsnUF+zsZt6NZnbbVCBpvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fvYIFBXb; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fvYIFBXb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743069488;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=o5WRdT56UXd0npVrp/2U96P0CSz3ps8f9h79oyQ+jKU=;
	b=fvYIFBXbceGgFWsQS337Nb7sN8ixc4P5cX3Ih9mYKrk43IJ7fm64mTLD1Ve120VQ/fL5yU
	GEOsXtw3pN3ABmdFHD7EguF+JGRPAWGyyWE/QkX6ypupw5jq1Mxy3XDqd4R3Ape7C7zsoy
	7IqF+GuuDt92pJF22PPfiEmfxsGFLS8=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-657-3xvBKBHONw-ReK7hkmgBmg-1; Thu, 27 Mar 2025 05:58:06 -0400
X-MC-Unique: 3xvBKBHONw-ReK7hkmgBmg-1
X-Mimecast-MFC-AGG-ID: 3xvBKBHONw-ReK7hkmgBmg_1743069486
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-ac6ef2d1b7dso70205666b.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 02:58:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743069485; x=1743674285;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o5WRdT56UXd0npVrp/2U96P0CSz3ps8f9h79oyQ+jKU=;
        b=upPYB1OqoOADuBpMk0ir1IL0NXGdu9F7n7So7UrjwAa/veQHAnX/N5zpmnL6kh5sA0
         UMUjuEOYsM8t8n9dfhTU3dU8yZMhUQ9TFQqy8hm0eLjtU2/OD2g/XhwCP4XYF/I/ntVJ
         Fq3ccfRycGuG0baCpoar9RsZhuN0gAitVZBV5hECR3qNG3GWLEQlG5jfroGZiqlKQpSP
         HMFkmhdKnzCyjZLhiVKDrdeGL2slioHPv7c02AkWDiZimWrffxw5slWwfyuQeb8LzFkW
         FVPIyDeSoQaEwAkc14z7UJZhL21PNMbBfAsX2W1G/vMsFkkxz1aY4WgG6Z4eSsFC44rZ
         wcuQ==
X-Forwarded-Encrypted: i=1; AJvYcCXlReBF+7PJOlRnBJXB6zvSFjDdo+ZE4GUAbhNijEgkKApWUBIEvyNsEjyyS15f0nJzIEWRPhUEQ+42sEk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8jn4kz95EaUuxoaiYzRk71MdiITI1Pit038j0XewDu477pI2L
	81ItNDLRwBCsi1WvkKAAUdY748t5hzhNH3Ut03deSIeoSBFBKN2Bf1bt65FXE4YPN0TCWRP1Ofb
	YSflXfvwI45W2+JsYPd2VRBFVgjfsj/qvTO6rKBQOnlZJrQmi6Vs7raJ4UvT/xA==
X-Gm-Gg: ASbGncvg00V5xF+YZ31o1QtkiXXlMpQqysrH/tm2AxXlUhKqp6raS3kbubP4nU8Ww00
	VF0cWJF2HHwcmjtsfAXXdqo8LWe8WJyPZixDrDY8n7JjRc8khrpK3A95IwKdqhHny/EBk9+ypZe
	RNT4F94kZ/3iruCn+O+MV3m0rnkKqQtzYfWNb+/wcAppTAs92CveYlez5aIBXvqcqUz5kSfRxtN
	s7R3Fr+W5iAOoDFKohcHglQkTMUp2F79YLB09nWh3JMICz7Hp2RMcyDkysPsXxPn9yvaqXAysY7
	Ng8gngbjzlAmJe+kRnqC2YTFxMkKdq6q2AUW/A9MdipMWyQ/8aFbGCVNpwX9Oq1g
X-Received: by 2002:a17:907:1c27:b0:ac2:cf0b:b809 with SMTP id a640c23a62f3a-ac6faefb3c6mr235704566b.31.1743069485404;
        Thu, 27 Mar 2025 02:58:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGFF/kF/t3t8RCCYix4B11GQ276Qy+zARToPx5UPq3eGAAcl4NqTpfSAcxFafRrGcMJ2i/Eg==
X-Received: by 2002:a17:907:1c27:b0:ac2:cf0b:b809 with SMTP id a640c23a62f3a-ac6faefb3c6mr235701966b.31.1743069484718;
        Thu, 27 Mar 2025 02:58:04 -0700 (PDT)
Received: from sgarzare-redhat (host-87-12-25-55.business.telecomitalia.it. [87.12.25.55])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef86e56dsm1184197466b.37.2025.03.27.02.58.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 02:58:03 -0700 (PDT)
Date: Thu, 27 Mar 2025 10:58:00 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: linux-integrity@vger.kernel.org, Sumit Garg <sumit.garg@kernel.org>, 
	Jens Wiklander <jens.wiklander@linaro.org>, James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Jarkko Sakkinen <jarkko.sakkinen@opinsys.com>, Peter Huewe <peterhuewe@gmx.de>, Jason Gunthorpe <jgg@ziepe.ca>, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] tpm: Make chip->{status,cancel,req_canceled} opt
Message-ID: <exzxzomw7wcobjuoje37x6i2ta54xzx5ho74t3atd7g74xltlb@ymw2pn3yo27b>
References: <20250326161838.123606-1-jarkko@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20250326161838.123606-1-jarkko@kernel.org>

On Wed, Mar 26, 2025 at 06:18:38PM +0200, Jarkko Sakkinen wrote:
>From: Jarkko Sakkinen <jarkko.sakkinen@opinsys.com>
>
>tpm_ftpm_tee does not require chip->status, chip->cancel and
>chip->req_canceled. Make them optional.
>
>Signed-off-by: Jarkko Sakkinen <jarkko.sakkinen@opinsys.com>
>---
> drivers/char/tpm/tpm-interface.c | 31 ++++++++++++++++++++++++++++---
> drivers/char/tpm/tpm_ftpm_tee.c  | 20 --------------------
> 2 files changed, 28 insertions(+), 23 deletions(-)
>
>diff --git a/drivers/char/tpm/tpm-interface.c b/drivers/char/tpm/tpm-interface.c
>index f62f7871edbd..10ba47a882d8 100644
>--- a/drivers/char/tpm/tpm-interface.c
>+++ b/drivers/char/tpm/tpm-interface.c
>@@ -58,6 +58,30 @@ unsigned long tpm_calc_ordinal_duration(struct tpm_chip *chip, u32 ordinal)
> }
> EXPORT_SYMBOL_GPL(tpm_calc_ordinal_duration);
>
>+static void tpm_chip_cancel(struct tpm_chip *chip)
>+{
>+	if (!chip->ops->cancel)
>+		return;
>+
>+	chip->ops->cancel(chip);
>+}
>+
>+static u8 tpm_chip_status(struct tpm_chip *chip)
>+{
>+	if (!chip->ops->status)
>+		return 0;
>+
>+	return chip->ops->status(chip);
>+}
>+
>+static bool tpm_chip_req_canceled(struct tpm_chip *chip, u8 status)
>+{
>+	if (!chip->ops->req_canceled)
>+		return false;
>+
>+	return chip->ops->req_canceled(chip, status);
>+}
>+
> static ssize_t tpm_try_transmit(struct tpm_chip *chip, void *buf, size_t bufsiz)
> {
> 	struct tpm_header *header = buf;
>@@ -65,6 +89,7 @@ static ssize_t tpm_try_transmit(struct tpm_chip *chip, void *buf, size_t bufsiz)
> 	ssize_t len = 0;
> 	u32 count, ordinal;
> 	unsigned long stop;
>+	u8 status;

Why move `status` out of the do/while block?

>
> 	if (bufsiz < TPM_HEADER_SIZE)
> 		return -EINVAL;
>@@ -104,12 +129,12 @@ static ssize_t tpm_try_transmit(struct tpm_chip *chip, void *buf, size_t bufsiz)
>

What about doing an early return avoiding also calling
tpm_calc_ordinal_duration()?

I mean something like this:

                 rc = 0;
         }

-       if (chip->flags & TPM_CHIP_FLAG_IRQ)
+       if (!chip->ops->status || chip->flags & TPM_CHIP_FLAG_IRQ)
                 goto out_recv;


Anyway, those are small things, the patch LGTM and it's a great cleanup
for ftpm and the svsm driver I'm developing!


Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>


> 	stop = jiffies + tpm_calc_ordinal_duration(chip, ordinal);
> 	do {
>-		u8 status = chip->ops->status(chip);
>+		status = tpm_chip_status(chip);
> 		if ((status & chip->ops->req_complete_mask) ==
> 		    chip->ops->req_complete_val)
> 			goto out_recv;
>
>-		if (chip->ops->req_canceled(chip, status)) {
>+		if (tpm_chip_req_canceled(chip, status)) {
> 			dev_err(&chip->dev, "Operation Canceled\n");
> 			return -ECANCELED;
> 		}
>@@ -118,7 +143,7 @@ static ssize_t tpm_try_transmit(struct tpm_chip *chip, void *buf, size_t bufsiz)
> 		rmb();
> 	} while (time_before(jiffies, stop));
>
>-	chip->ops->cancel(chip);
>+	tpm_chip_cancel(chip);
> 	dev_err(&chip->dev, "Operation Timed out\n");
> 	return -ETIME;
>
>diff --git a/drivers/char/tpm/tpm_ftpm_tee.c b/drivers/char/tpm/tpm_ftpm_tee.c
>index 8d9209dfc384..53ba28ccd5d3 100644
>--- a/drivers/char/tpm/tpm_ftpm_tee.c
>+++ b/drivers/char/tpm/tpm_ftpm_tee.c
>@@ -164,30 +164,10 @@ static int ftpm_tee_tpm_op_send(struct tpm_chip *chip, u8 *buf, size_t len)
> 	return 0;
> }
>
>-static void ftpm_tee_tpm_op_cancel(struct tpm_chip *chip)
>-{
>-	/* not supported */
>-}
>-
>-static u8 ftpm_tee_tpm_op_status(struct tpm_chip *chip)
>-{
>-	return 0;
>-}
>-
>-static bool ftpm_tee_tpm_req_canceled(struct tpm_chip *chip, u8 status)
>-{
>-	return false;
>-}
>-
> static const struct tpm_class_ops ftpm_tee_tpm_ops = {
> 	.flags = TPM_OPS_AUTO_STARTUP,
> 	.recv = ftpm_tee_tpm_op_recv,
> 	.send = ftpm_tee_tpm_op_send,
>-	.cancel = ftpm_tee_tpm_op_cancel,
>-	.status = ftpm_tee_tpm_op_status,
>-	.req_complete_mask = 0,
>-	.req_complete_val = 0,
>-	.req_canceled = ftpm_tee_tpm_req_canceled,
> };
>
> /*
>-- 
>2.39.5
>

