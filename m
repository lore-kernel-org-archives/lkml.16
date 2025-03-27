Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 141ED1494DF
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 15:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743089630; cv=none; b=JWKyB784WwMN72J4ECPO1m9e8ohyxV7ygEwmqfl/KZCVnjPHJSs42LV8uIZkunN4+25siZ7eZMOBsXo4gGh0HiWMdQxDGxZrHhIDbZswYGWpn0YCu115TfZ34fiPFey1AttfJxES4C30bPjI+fnI7lngdTAkcJjrL7RUtjObvr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743089630; c=relaxed/simple;
	bh=HQ0Ef72EnhxykKElz27nhTsC4zNkLX6xKFDXcXCafbc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kbFsAtDbWGMM+DypedAmqohj3IG2J5KLvsue3p9Hm+9dL0j4pR+Oqcu6vEHJUm3omI4Gz6qAgRbQ7wOAd6znoRJL3Ek7SL8r5aS3th17dEWfKO94R00vo79R7klitAFZr3O4ge5gG+JK3elqLUJaI/wao+Jb+GPA7hh5i64t40M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=M9917aAO; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="M9917aAO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743089626;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=n2vfWjdPjd1igi+HrBJvoMOSZHPLNEOz1XXFk58tFSs=;
	b=M9917aAOhf/zkFowWBQk+pfCxpGQIdo17YDIiCmN9qcwiB+HyqzXum5C6Fqylxl2JCXLdK
	hdPUsh78iYvaFP88R/2Lsi2SMwzEylnOzjJ8xPNMiKtH/UbOoWxnIqdUGz9koaM+ctkEcr
	Omb2gkAxsnEmBc+U50wr/N0476tZFIk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-584-zw4Zy353OiCgrJiFxLrTSw-1; Thu, 27 Mar 2025 11:33:45 -0400
X-MC-Unique: zw4Zy353OiCgrJiFxLrTSw-1
X-Mimecast-MFC-AGG-ID: zw4Zy353OiCgrJiFxLrTSw_1743089624
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3912539665cso1079027f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 08:33:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743089624; x=1743694424;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n2vfWjdPjd1igi+HrBJvoMOSZHPLNEOz1XXFk58tFSs=;
        b=bDP/8xLlRBLDMEAKUQnzUPG3MgKMkaUNJ3ZyQ0EppNRLemCKahxBbkfv8gFnL135/R
         tnCMmdAEMHRCzVRXfbVwL7bgPPbLqyDr6nK5oAk1HJEdkCncEPH0H3OCJwbVDDHkE1X2
         Iud+wywS2lG1aF3JCc2uD+dicKeLMVIyFOs8I+N4VDcnXf0RLrWM9nm2P+X08cPMyu6H
         sp7ghBqR9Gaf+Jg4XN2LoEC867vvouPLVOWb1PN1ypMGl4DUvn0kD/mIzQLcJE0evzyy
         SmPOxxhcv/WhRa4LAQfaPhLSafx52PIfWJRjJ/jqjffQRZT7K5g7QcnEv9v5QCIsjcvO
         zz3w==
X-Forwarded-Encrypted: i=1; AJvYcCWSzXzOlaL1BlxA66f0/CsupCtXEXwBNFD8oxwycRjp0SWhA8Rgdwmx/cFD7HOrd1+fuNHZPKhqHdt3jJs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxes+AWqdy9AHYZpcvAQtsfkS3D954NPOPWgVBkCXd/KSvVj5Fm
	/2s56VGQ3otLsNCab3JvSPkVLJemkV6PS/Saq3xLowOBlInd4rECy9Hf7lFLk5tgDhUmg11M7Ps
	F7qpTGFJhV/4ZMn0SdvwbzG2+/biWiD26aO3x01rNRWEmPtKBMfb8SPCbl29sfQ==
X-Gm-Gg: ASbGncsXKTUIWVQwSHZfuqc3NYCbnvWT/HwOU2SpW2+wLWwNurpVqal0Xe5abE+GNki
	/tFQLC7Nf8Lwn3Ebh89pVve/o8JGLoUKFO98I5OLjKzKzG1VXqKNLhW8g2SwFN2aKyKJOXLBT25
	iNeRzrNhCc+AOy/Dt/J+2XiUaRMSOlnJzX0F8VVP5Pe/9ECxlGqX0TsCohwvEUBJjyp3fbHu75d
	D99rfPhzXMtv0oJDWB3EnI7dpimaOwMW0PXcBwkwrZ4rp7BQ0UODeyxHmEJDBYUrs6GEkKeydBl
	s75tU/Qc4x4Ww/z6R9R5irl7vdG6xwIPwySXZ3gR2G8D/VE1ZTt3WyFC0BURoEjD
X-Received: by 2002:a05:6000:2ab:b0:39a:c9ae:a198 with SMTP id ffacd0b85a97d-39c0999ce73mr930204f8f.1.1743089624177;
        Thu, 27 Mar 2025 08:33:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEbW6gDJheuO35EEv4q38v+8yZH1/WUMW1a7B/qNPyI6GOHHawUBbYyx6/8xdWkIjzghJsuoA==
X-Received: by 2002:a05:6000:2ab:b0:39a:c9ae:a198 with SMTP id ffacd0b85a97d-39c0999ce73mr930152f8f.1.1743089623522;
        Thu, 27 Mar 2025 08:33:43 -0700 (PDT)
Received: from sgarzare-redhat (host-87-12-25-55.business.telecomitalia.it. [87.12.25.55])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d82e835fesm41649215e9.10.2025.03.27.08.33.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 08:33:42 -0700 (PDT)
Date: Thu, 27 Mar 2025 16:33:37 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: linux-integrity@vger.kernel.org, Sumit Garg <sumit.garg@kernel.org>, 
	Jens Wiklander <jens.wiklander@linaro.org>, James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Jarkko Sakkinen <jarkko.sakkinen@opinsys.com>, Peter Huewe <peterhuewe@gmx.de>, Jason Gunthorpe <jgg@ziepe.ca>, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] tpm: Make chip->{status,cancel,req_canceled} opt
Message-ID: <gknnbjutmstexcitncmpyapwu6eo2qarvjkknkpzdurc4dffxw@onqqs5x2raug>
References: <20250326161838.123606-1-jarkko@kernel.org>
 <exzxzomw7wcobjuoje37x6i2ta54xzx5ho74t3atd7g74xltlb@ymw2pn3yo27b>
 <Z-VRWy8jLkA0cpow@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <Z-VRWy8jLkA0cpow@kernel.org>

On Thu, Mar 27, 2025 at 03:23:39PM +0200, Jarkko Sakkinen wrote:
>On Thu, Mar 27, 2025 at 10:58:00AM +0100, Stefano Garzarella wrote:
>> On Wed, Mar 26, 2025 at 06:18:38PM +0200, Jarkko Sakkinen wrote:
>> > From: Jarkko Sakkinen <jarkko.sakkinen@opinsys.com>
>> >
>> > tpm_ftpm_tee does not require chip->status, chip->cancel and
>> > chip->req_canceled. Make them optional.
>> >
>> > Signed-off-by: Jarkko Sakkinen <jarkko.sakkinen@opinsys.com>
>> > ---
>> > drivers/char/tpm/tpm-interface.c | 31 ++++++++++++++++++++++++++++---
>> > drivers/char/tpm/tpm_ftpm_tee.c  | 20 --------------------
>> > 2 files changed, 28 insertions(+), 23 deletions(-)
>> >
>> > diff --git a/drivers/char/tpm/tpm-interface.c b/drivers/char/tpm/tpm-interface.c
>> > index f62f7871edbd..10ba47a882d8 100644
>> > --- a/drivers/char/tpm/tpm-interface.c
>> > +++ b/drivers/char/tpm/tpm-interface.c
>> > @@ -58,6 +58,30 @@ unsigned long tpm_calc_ordinal_duration(struct tpm_chip *chip, u32 ordinal)
>> > }
>> > EXPORT_SYMBOL_GPL(tpm_calc_ordinal_duration);
>> >
>> > +static void tpm_chip_cancel(struct tpm_chip *chip)
>> > +{
>> > +	if (!chip->ops->cancel)
>> > +		return;
>> > +
>> > +	chip->ops->cancel(chip);
>> > +}
>> > +
>> > +static u8 tpm_chip_status(struct tpm_chip *chip)
>> > +{
>> > +	if (!chip->ops->status)
>> > +		return 0;
>> > +
>> > +	return chip->ops->status(chip);
>> > +}
>> > +
>> > +static bool tpm_chip_req_canceled(struct tpm_chip *chip, u8 status)
>> > +{
>> > +	if (!chip->ops->req_canceled)
>> > +		return false;
>> > +
>> > +	return chip->ops->req_canceled(chip, status);
>> > +}
>> > +
>> > static ssize_t tpm_try_transmit(struct tpm_chip *chip, void *buf, size_t bufsiz)
>> > {
>> > 	struct tpm_header *header = buf;
>> > @@ -65,6 +89,7 @@ static ssize_t tpm_try_transmit(struct tpm_chip *chip, void *buf, size_t bufsiz)
>> > 	ssize_t len = 0;
>> > 	u32 count, ordinal;
>> > 	unsigned long stop;
>> > +	u8 status;
>>
>> Why move `status` out of the do/while block?
>
>I'm not a huge fan of stack allocations inside blocks, unless there is
>a particular reason to do so.
>
>
>>
>> >
>> > 	if (bufsiz < TPM_HEADER_SIZE)
>> > 		return -EINVAL;
>> > @@ -104,12 +129,12 @@ static ssize_t tpm_try_transmit(struct tpm_chip *chip, void *buf, size_t bufsiz)
>> >
>>
>> What about doing an early return avoiding also calling
>> tpm_calc_ordinal_duration()?
>>
>> I mean something like this:
>>
>>                 rc = 0;
>>         }
>>
>> -       if (chip->flags & TPM_CHIP_FLAG_IRQ)
>> +       if (!chip->ops->status || chip->flags & TPM_CHIP_FLAG_IRQ)
>>                 goto out_recv;
>>
>>
>> Anyway, those are small things, the patch LGTM and it's a great cleanup
>> for ftpm and the svsm driver I'm developing!
>
>If you refined send() and had that the sync flag, this would become:
>
>	if (chip->flags & (TPM_CHIP_FLAG_IRQ | TPM_CHIP_FLAG_SYNC))
>		goto out_recv;

Yep, good point!

>
>>
>>
>> Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
>
>Thank you.

You're welcome!
Stefano

