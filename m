Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 580E120D4E1
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 09:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743069563; cv=none; b=UbONq9PE2Ue5j3sPVpHuGnXXGP/Hp7tKnz2ZPmkgBoJc3KHDxMu3ujgn510vMjgs7gw3GT9kOSaxfrlZCIF7VFkkjPQ/Ih5LGl/P1kLuIGJi1NiXCO2LciLv1W5FBPpaVWxZvtl8zT5gKLSROvsYwby3zERRQLJxxM/XXk2IiKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743069563; c=relaxed/simple;
	bh=l3nwYaEaO212Dqr7b/G1zMWZhDuSrY2tb+zYAHR5WSo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xj7EFdR8Jk5VVDtDoiSojOhLUMYpn+1BrxxHAWyMUxx62rvYOsHaMLY/7ww16uRI+ReQzb5qFtQkW4flU4HRkBelyGsK4Lc1Qt7VoJ+QWahw91jF0StsWzMnlCei3z9cW3dibHDW/GGbNbj5SA1TRT8K2jygauhWXCdruufk/4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TGt8vepn; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TGt8vepn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743069561;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y1atydGWypLGxkGi9UJome0AeqMybAMTlOfrYdhNTlw=;
	b=TGt8vepnOnE3a6ymx6s1phkWXZ7N9G09diOGNp60bwoxjsGELStg1G3vkasf/PeIecRzO2
	CI5kC4b9NuXbk7MiqSsPSDl3Ul92pqcRb2OWAVk+9FDJhmlO3Qx37+zWwH3HB2KPygjHL2
	n0Qk0Lq4/A5wUDQcA44Ijt0DQrpAcjc=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-28-0TDR0yHfMiCMfi06SofLqA-1; Thu, 27 Mar 2025 05:59:19 -0400
X-MC-Unique: 0TDR0yHfMiCMfi06SofLqA-1
X-Mimecast-MFC-AGG-ID: 0TDR0yHfMiCMfi06SofLqA_1743069558
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-ac21697a8ebso67779666b.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 02:59:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743069558; x=1743674358;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y1atydGWypLGxkGi9UJome0AeqMybAMTlOfrYdhNTlw=;
        b=o8M1h1L7+ArIvRWOem1Kol4wU9hEKwOlaRgOr/ayVUPQZ0sdqOGPAMaLR64AKrIo2j
         hOHAIKzeix3aUqs1cyksly9sw2iENKkapAax2m2v4lVjoxb8xIslVwqyF9TixIjCGFoB
         6bkzPc3VM0nAPuGFTHMT10nbFVZTSifyBzckGC0oGGLdKBUNyOt6iYD2bnOHS7qIi302
         ZqzK0gAYtXEe/fDoaKauId+UFSFamnLaGXDwG2XcooJXc7a6MQ5xr15yBXkL5ON5JQgA
         KWilBPp1c3l/sU3HM7ARUBR3INyt9ShOGmaDRGHL0xJFCNawYhaJSzBYoJ+cu9Q8VMeb
         QjJQ==
X-Forwarded-Encrypted: i=1; AJvYcCX/3kHfoyYx4C9LWAo9IcCWQnqZYWktQeWtTnbfBr1kn/51HdSrprF8C3AVTmcauExvsGwR6/vPPQXQdH4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUu/bQC9VywLv64xcfzKfWOKmcOErUj8UHGyCouX4jpb0P0Ajd
	FKoeHPCjLzm/Zy7v4JLcgIn4O25CcrUC/VUacQwxnyelK9SclizEIlajcpg/5+AlDzlzYvQ/hBM
	OWzpUkDWM/IfrVPKLpuYxy1SFTDf6PA9DXguf46etXGSN9OLkiD1KOSuMecimDQ==
X-Gm-Gg: ASbGnctFKgx6uwZkmKCua1xkI0n+yOF95/n2oUGw5raaDGsJFSVsECW4yTAiaTet9jJ
	dK9XtxxbvJVp5nYhEmIvQPPo/c9p0v6l/DrJGRxDpH+tE+bFR8dq0bE1YPUnueBdC2dz1rEyDQm
	H4aOf/UrnEEDka1D1RQEeE707tTKQilmv2p3LAUUk33zpEoFfmF7SBLYr4gie8Y2s9y+ec8yjpt
	MO4LSxjWMU85xkn4/7h9TUILAwh1ADj0Lltq7bNCHccQ9RmJNZG7PdvDzbCl6ZPXuprAdXMZdzh
	Fs7wOjcyiSV59oizUUlkogtzZUDt0ZJI+OGkidCjOs7rKk/IryqPsvURVIBV1dSP
X-Received: by 2002:a17:907:3d8a:b0:ac2:e748:9f1c with SMTP id a640c23a62f3a-ac6faf0b7fbmr262932266b.33.1743069557974;
        Thu, 27 Mar 2025 02:59:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFUKjdTLCJLmo6uqG8v1v1iNdg55k+0mfWXro32NiNebAJWfrKrcokV/yRGZMpHe+i3IvNEEg==
X-Received: by 2002:a17:907:3d8a:b0:ac2:e748:9f1c with SMTP id a640c23a62f3a-ac6faf0b7fbmr262926966b.33.1743069557325;
        Thu, 27 Mar 2025 02:59:17 -0700 (PDT)
Received: from sgarzare-redhat (host-87-12-25-55.business.telecomitalia.it. [87.12.25.55])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac6ed4a6370sm243158066b.49.2025.03.27.02.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 02:59:16 -0700 (PDT)
Date: Thu, 27 Mar 2025 10:59:12 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Dionna Amalie Glaze <dionnaglaze@google.com>, 
	Joerg Roedel <jroedel@suse.de>, Ingo Molnar <mingo@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Peter Huewe <peterhuewe@gmx.de>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Thomas Gleixner <tglx@linutronix.de>, x86@kernel.org, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, linux-kernel@vger.kernel.org, Borislav Petkov <bp@alien8.de>, 
	Jason Gunthorpe <jgg@ziepe.ca>, "H. Peter Anvin" <hpa@zytor.com>, linux-coco@lists.linux.dev, 
	Claudio Carvalho <cclaudio@linux.ibm.com>, Dov Murik <dovmurik@linux.ibm.com>, 
	linux-integrity@vger.kernel.org
Subject: Re: [PATCH v4 1/4] x86/sev: add SVSM vTPM probe/send_command
 functions
Message-ID: <4euvodfh537v3hiiotkmugdknhpy3oxpy7kq5zcxilbpbdop6q@qgwwm557czjv>
References: <20250324104653.138663-1-sgarzare@redhat.com>
 <20250324104653.138663-2-sgarzare@redhat.com>
 <CAAH4kHYuaQEkvftWuX+UmGDiAgV5i1uHx8=rjmhJ0Y=inQFw-Q@mail.gmail.com>
 <dou3uniecwqapl7kmsxa2776v6pdy7c4zdvcrdky6wz62ohyao@u3vlgaao4sb7>
 <Z-Q17iAvJCgJy5pf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z-Q17iAvJCgJy5pf@kernel.org>

On Wed, Mar 26, 2025 at 07:14:22PM +0200, Jarkko Sakkinen wrote:
>On Tue, Mar 25, 2025 at 06:20:48PM +0100, Stefano Garzarella wrote:
>> On Tue, Mar 25, 2025 at 09:56:53AM -0700, Dionna Amalie Glaze wrote:
>> > On Mon, Mar 24, 2025 at 3:47 AM Stefano Garzarella <sgarzare@redhat.com> wrote:
>> > >
>> > > From: Stefano Garzarella <sgarzare@redhat.com>
>> > >
>> > > Add two new functions to probe and send commands to the SVSM vTPM.
>> > > They leverage the two calls defined by the AMD SVSM specification [1]
>> > > for the vTPM protocol: SVSM_VTPM_QUERY and SVSM_VTPM_CMD.
>> > >
>> > > Expose these functions to be used by other modules such as a tpm
>> > > driver.
>> > >
>> > > [1] "Secure VM Service Module for SEV-SNP Guests"
>> > >     Publication # 58019 Revision: 1.00
>> > >
>> > > Co-developed-by: James Bottomley <James.Bottomley@HansenPartnership.com>
>> > > Signed-off-by: James Bottomley <James.Bottomley@HansenPartnership.com>
>> > > Co-developed-by: Claudio Carvalho <cclaudio@linux.ibm.com>
>> > > Signed-off-by: Claudio Carvalho <cclaudio@linux.ibm.com>
>> > > Reviewed-by: Tom Lendacky <thomas.lendacky@amd.com>
>> > > Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
>> > > ---
>> > > v4:
>> > > - added Tom's R-b
>> > > - added functions documentation [Jarkko]
>> > > - simplified TPM_SEND_COMMAND check [Tom/Jarkko]
>> > > v3:
>> > > - removed link to the spec because those URLs are unstable [Borislav]
>> > > - squashed "x86/sev: add SVSM call macros for the vTPM protocol" patch
>> > >   in this one [Borislav]
>> > > - slimmed down snp_svsm_vtpm_probe() [Borislav]
>> > > - removed features check and any print related [Tom]
>> > > ---
>> > >  arch/x86/include/asm/sev.h |  7 +++++
>> > >  arch/x86/coco/sev/core.c   | 59 ++++++++++++++++++++++++++++++++++++++
>> > >  2 files changed, 66 insertions(+)
>> > >
>> > > diff --git a/arch/x86/include/asm/sev.h b/arch/x86/include/asm/sev.h
>> > > index ba7999f66abe..09471d058ce5 100644
>> > > --- a/arch/x86/include/asm/sev.h
>> > > +++ b/arch/x86/include/asm/sev.h
>> > > @@ -384,6 +384,10 @@ struct svsm_call {
>> > >  #define SVSM_ATTEST_SERVICES           0
>> > >  #define SVSM_ATTEST_SINGLE_SERVICE     1
>> > >
>> > > +#define SVSM_VTPM_CALL(x)              ((2ULL << 32) | (x))
>> > > +#define SVSM_VTPM_QUERY                        0
>> > > +#define SVSM_VTPM_CMD                  1
>> > > +
>> > >  #ifdef CONFIG_AMD_MEM_ENCRYPT
>> > >
>> > >  extern u8 snp_vmpl;
>> > > @@ -481,6 +485,9 @@ void snp_msg_free(struct snp_msg_desc *mdesc);
>> > >  int snp_send_guest_request(struct snp_msg_desc *mdesc, struct snp_guest_req *req,
>> > >                            struct snp_guest_request_ioctl *rio);
>> > >
>> > > +bool snp_svsm_vtpm_probe(void);
>> > > +int snp_svsm_vtpm_send_command(u8 *buffer);
>> > > +
>> >
>> > These should be defined static inline with trivial definitions in the
>> > #else case, yes?
>>
>> For now the only user of those is the tpm_svsm driver which is build only if
>> CONFIG_AMD_MEM_ENCRYPT is defined, so there should be no problem, but you
>> are right, better to follow the other functions and define the stubs
>>
>> I'll fix in v5, good catch!
>
>Only denoting here that you can keep my reviewed-by in the v5 for
>this despite the minor change.

Thanks for pointing that out!
Stefano

