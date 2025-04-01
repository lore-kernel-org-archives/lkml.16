Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56FE21EC019
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 08:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743497942; cv=none; b=mU17z2J5xs61e30sYU/yRruwqnlzvZO0se0o0xa85c/L+cK0EBN7DORdqQ2TpqTg5UtcSag/EdvdAcYex9rgxDWUC49eKjRH6zSD8joPUmC/ouNoEui5Db8fBMmI0xSBwMejQd/0YX8pCvbTArarDSsjGUMDmOb3O024lci6yg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743497942; c=relaxed/simple;
	bh=Cbpy21Pj/PV3ox21YZxNBKmn0C1URS9/DxwZPfFmLPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CqlMVsqM6JRVLtZPqzCJZM1iXUJ5EjReLTagO18UrTf5XduHK4ZopDgarq39iH4HKRjoJY8WeCm8D3SDhvutJbrJxac7TO7Cb0HApLDF8enmnKoDyoYl1GqJeB6rq82zkibBb5pLOTwkp5ZCtLVhoJdk1cfjt5ILJ0BWUWKHMfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EH+xlJuY; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EH+xlJuY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743497936;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UIf9d4LKwWJlU65MePabyEnw5zIkoOcPcSvDhqLnyRI=;
	b=EH+xlJuYOtkzmhVBfZvOQ/Q8U9fMPRP5voh0Nn+W6McnRijWJdPCac/fiBo2sS2XSxjoh2
	976eGeJr5I8i652KNLYp7HVfC2yAKLNfPnGo1leb3ipwrnp1mF1iqLoM+Y9d8CDL3mFv6G
	rwi+c9pp+GFxuWYanfF3RMoMfQD/otA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-74-SZlKvxjVNOa4D4dnmLO3Pw-1; Tue, 01 Apr 2025 04:58:55 -0400
X-MC-Unique: SZlKvxjVNOa4D4dnmLO3Pw-1
X-Mimecast-MFC-AGG-ID: SZlKvxjVNOa4D4dnmLO3Pw_1743497931
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43947a0919aso42835395e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 01:58:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743497931; x=1744102731;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UIf9d4LKwWJlU65MePabyEnw5zIkoOcPcSvDhqLnyRI=;
        b=m3ROznH7777qWzEeVnNl4KzOYfzwUCO3wzPGdnun8VVwA0igbXUKKXsUOpft0PFe3G
         h0o6kCBqsGQAcS8iadhvc5/3BP7eeONigQrNSaWQ7NETO8a4zEb7C0dtMnU9zlV+diKC
         I9itFx2HPOChmJlAeux5uW5rPNpEHwnRCRc3SCfGp+YKShUeY+MORfpJUi7rP/IXiBNy
         0ZbZVgsZXwCy5428ZAQrzu3SGRtzdS8bx1MDijVMY075sBDYqKomScg3SQsc9qlqRO3X
         O91B2m4RrEbJWfBCfJMmX4lvP0IsU0WWT8aRCnWvWyMobw+P68lIfe6w9q5Lutataceg
         qwEw==
X-Forwarded-Encrypted: i=1; AJvYcCUNtu0VA4yZpKIhrsuo4GdT2CuESGotHBjDZHudotCX/Fe/eXCjZJZgDIhXK8/wz8cxjK8Z2Ef61t+vFZ8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbjbbIvvjfGUlkBR+OBXetVm7AcPUgp0Yw1GGxRHO5UN4Uff/l
	6bSGg2LKp74JP1laJ+mmq3QMOHpq/k6fDAmVLfUqMd3b9AlMtWFGwqzGaE2664693Wcy8mceo/m
	iodAMicrO8CaCH/fu4MjPumRh48I+N9UnMIY1wKojiEaJkourwgMEzIsItqHl8w==
X-Gm-Gg: ASbGncvLVHNHX8Bc+Y1OSKVq43+dOYPT3q6Bbmtwe7l5/DPdDE0506bMWPOclSvuf9M
	5RdyACkov0H1QIU9f9e69lfB4IpvvpIL2+vWBNil+8azvr29GoTJmH6UoL8cI9d0X3OuxC63aM4
	O3zuRo18wH/RHLg1By4ImS4vipFx6MD/Uu2w3WZgXNEmUuqeQ2Lk10I1sqYJKSk5nCAlzUcnZ7P
	WzLEv+GXKiBiX2pega1No57NeCqfyU0EFodFl+LVbuNtbsx+B6FFO51gT0Jnc8rnHROe8usFtGt
	uzrOGeicHCrGpUWOcaEf04yv4gFQEteEh36DIqh0xUwFVs2V0G664ycjNhA=
X-Received: by 2002:a05:6000:2b03:b0:38c:2745:2df3 with SMTP id ffacd0b85a97d-39c12118f9fmr6752846f8f.37.1743497931565;
        Tue, 01 Apr 2025 01:58:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFWnEs6xzLDc1YxYeDtY269xDpZqA1RPcUk8inouSBTPsWMS3grkQL5iiqBKXY3nyZb9YG6vg==
X-Received: by 2002:a05:6000:2b03:b0:38c:2745:2df3 with SMTP id ffacd0b85a97d-39c12118f9fmr6752823f8f.37.1743497931082;
        Tue, 01 Apr 2025 01:58:51 -0700 (PDT)
Received: from sgarzare-redhat (host-87-11-6-59.retail.telecomitalia.it. [87.11.6.59])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b79e097sm13323779f8f.80.2025.04.01.01.58.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 01:58:50 -0700 (PDT)
Date: Tue, 1 Apr 2025 10:58:41 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Dionna Amalie Glaze <dionnaglaze@google.com>
Cc: Jarkko Sakkinen <jarkko@kernel.org>, linux-kernel@vger.kernel.org, 
	Jason Gunthorpe <jgg@ziepe.ca>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Borislav Petkov <bp@alien8.de>, linux-integrity@vger.kernel.org, Peter Huewe <peterhuewe@gmx.de>, 
	Ingo Molnar <mingo@redhat.com>, linux-coco@lists.linux.dev, Dov Murik <dovmurik@linux.ibm.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Joerg Roedel <jroedel@suse.de>, x86@kernel.org, 
	Tom Lendacky <thomas.lendacky@amd.com>, Claudio Carvalho <cclaudio@linux.ibm.com>, 
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH v5 3/4] tpm: add SNP SVSM vTPM driver
Message-ID: <CAGxU2F5WtVZWEgJNwzoWUX0gcq8fe6evnU026R1hHXqCfG2v9w@mail.gmail.com>
References: <20250331103900.92701-1-sgarzare@redhat.com>
 <20250331103900.92701-4-sgarzare@redhat.com>
 <Z-rSMi2uCvShLbLS@kernel.org>
 <CAAH4kHY-Orjr_+rcYNemuWrAOOtyrCMD5s6KsOrkX740AARXiA@mail.gmail.com>
 <02190762dd82104070ff1a2942a7be703f4ff53d.camel@HansenPartnership.com>
 <CAAH4kHYwDgnYsMhJ8zZWn1uU4tqqnSXOLKEJNMb-3OCNrM7Z9A@mail.gmail.com>
 <e2db0cef00e9ad6061af8256c71d0198b15a5ddc.camel@HansenPartnership.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e2db0cef00e9ad6061af8256c71d0198b15a5ddc.camel@HansenPartnership.com>

On Tue, 1 Apr 2025 at 00:59, James Bottomley <James.Bottomley@hansenpartnership.com> wrote:
>
> On Mon, 2025-03-31 at 15:23 -0700, Dionna Amalie Glaze wrote:
> > On Mon, Mar 31, 2025 at 2:26 PM James Bottomley
> > <James.Bottomley@hansenpartnership.com> wrote:
> > >
> > > On Mon, 2025-03-31 at 13:56 -0700, Dionna Amalie Glaze wrote:
> > > [...]
> > > > I might be unclear on how I should be testing this, but I do see
> > > > /dev/tpm0 and /dev/tpmrm0 when I build with CONFIG_TCG_SVSM=y,
> > > > but I don't see the event log in securityfs. What am I missing?
> > >
> > > The vtpm driver for EDK2/OVMF I suspect ... without that the UEFI
> > > won't lay down and event log for the kernel to pick up.
> >
> > This test is with Oliver's PR
> > https://github.com/tianocore/edk2/pull/6527
>
> Well, since the event log is searched for in tpm_chip_register(), I
> really don't think it can be the kernel driver.  Best guess is there's
> something wrong with that patch set (or the vTPM didn't activate in
> OVMF for some reason).

Yep, I also think it should be something in edk2.

I'm using edk2 from https://github.com/coconut-svsm/edk2/pull/62 which 
should contain the commits from that PR + a fix not yet merged upstream.

I'm building it with:
build -a X64 -b DEBUG -t GCC5 -DTPM2_ENABLE \
  --pcd PcdUninstallMemAttrProtocol=TRUE -p OvmfPkg/OvmfPkgX64.dsc

And in Linux I see the devices and the event log:

# ls /dev/tpm*
/dev/tpm0  /dev/tpmrm0

# ls /sys/kernel/security/tpm0/
binary_bios_measurements

# tpm2_eventlog /sys/kernel/security/tpm0/binary_bios_measurements
---
version: 1
events:
- EventNum: 0
  PCRIndex: 0
  EventType: EV_NO_ACTION
  Digest: "0000000000000000000000000000000000000000"
  EventSize: 37
...

If I remove `-DTPM2_ENABLE` when building edk2, I can still see the 
/dev/tpm* devices (of course), but I can't see the event log anymore.
And also most PCRs are 0 (unlike when I have tpm driver enabled in 
edk2).

Thanks,
Stefano

