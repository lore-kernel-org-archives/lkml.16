Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF6E721B9FC
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 08:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744272945; cv=none; b=eqBlC3qeHtH32LMCGlEkC6BQjaeXxp5O+E1fMbawIFS6NSg3UA+KptEjxX6ci6tMMLlMoaTkzcxAa67HqXfUkUZetOqzXbXAwTjL5BspRUFVecZbgIdD6Vr4WNiBUGo0ohDNftv2NL0tn9U4vX3pci+Bfu7/pWcsw0qYAyc7kDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744272945; c=relaxed/simple;
	bh=mg9TTr2igANmwpfSP2Bjaog3EnCruAP6eGH7IneMLUs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZeZ1PA1SCaVgt/D0JPmhjMbPxzvzC7ByqcK3EzjXWUqDlVAfdFVRI7OdoRFf5yW2gXbI7GmTYTQ9+Er4b+8vYDAmN92e0DbmMghsXxnKtkX4SeLCoqXLNBk7KDOYwOQbhtVr9c16O+QV5lULqmoIVSgiXxviB6IPXSBplesajFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NR2Je7n2; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NR2Je7n2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744272942;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pWDzicHLsBgJ4w8qzf+KZj6VBuv5e32hgZSRqmxhhdU=;
	b=NR2Je7n2sKtwebk9PPMyJW29yrS/aQOzt3TmDL3Iqe+JQBjINt5tv6h3YrHQD35/uD5Lc2
	mdb9Cwo1oXQD1G/+LDMHmbcUg3tidg4QRZChkqNJw/dtldfRZPOjGeeuqsEH+KT/G31ez4
	DPm4WDqi33bTlCkHTgL4Z+gHDATPY9Q=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-576-oWSpsSCKOP6K1xONIW31RA-1; Thu, 10 Apr 2025 04:15:41 -0400
X-MC-Unique: oWSpsSCKOP6K1xONIW31RA-1
X-Mimecast-MFC-AGG-ID: oWSpsSCKOP6K1xONIW31RA_1744272940
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-ac2bb3ac7edso54824366b.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 01:15:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744272940; x=1744877740;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pWDzicHLsBgJ4w8qzf+KZj6VBuv5e32hgZSRqmxhhdU=;
        b=q8jxEz+/op6j7w3bZ4QDssODW5G0Uc1F0RSoy2avH/4x+LLEWgMl1vTFJ/5s88FnXE
         5bzp4wIE86HOHHcIa8SJkGsKfXZEOvYGPXc3o9VfOJ0sTIf1CpZ5GuS6hk0XOKrLJBhw
         U5gZWzOJwWG1hgJ5tPRAD4k0e8zVw80Gw/pepAKYJV6ZD4sEoAYgvdid0/345gDmTf6o
         N8Snf08vxgn6IjFO13sRDKe4qgR2N/BP7f9tcVCmgh5dtY8MNY0bFhLYVc25K2kq4Vzo
         fGdaUn62AqVDYvcOOGR+X2k8lx4SwYNGi15VBd4nDdX7s1khbycvcbHH0zDtljX/1nRM
         p6Ww==
X-Forwarded-Encrypted: i=1; AJvYcCWRzFC6RHQqB2PPkpN0VOQxFeU9P/tX5YZA7TVH8CGwSA15+0jnJdmFImCNwJbtigFq85c0kX9aJQXgvPQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyl+AK3KQsTX16wmr6MfGOk1j4OANvkves43SKuNBKj/rxFRFOl
	Q3cHtSVpSAgRo3waFp0BFD1scs4PkqX8DQwFJj9pSCCdQgh42N92l97gbI/w4q/rPeoXYSCj/Bb
	K+QG3ORZ+S0XDLTS9sHIq2SB4Kt93PcuQQYY70/hqJk4EjYZXNtMpFWGtDEszcQ==
X-Gm-Gg: ASbGncue7XmZRLZUEQW4NNPPQPF3S3Adewd21EaeDgZdpGzCC9JteJc33nNejLwbsR8
	aawk0jpPNTJg+/TIvM+YyC+temap+8GBUirNlSG/5PBLAZuq0LmLYxijR0EgV/FuqIGWuoG83zi
	4JeUnfyAdFuLcvnufChmShLrAeSTJYr0mgusl/Vt+84aNTIqF4HaWUbyJrNdv2Jm1qyE9N6KOd2
	1+6oAFOPV7NARRO0EQKklTXljuYOIcCej3h8rfy8GdFl8gwUnHnJAsX0rfkRSIuHnBx/tkhhNSX
	x6ndih60sOW9CBmUg7H1xnO1EU8AgfWoW9j44BxMQJ7K7cpMp7ustMK2H9J5
X-Received: by 2002:a17:907:e989:b0:ac3:d54:d825 with SMTP id a640c23a62f3a-acabd3d802cmr206596766b.56.1744272939754;
        Thu, 10 Apr 2025 01:15:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHKuq1jrLQYQCt2MWuX/DTVpWgnqHWa2JwTl4MRzpVmRvMRnfirH5uXIuSine+27SzbE/Kw2Q==
X-Received: by 2002:a17:907:e989:b0:ac3:d54:d825 with SMTP id a640c23a62f3a-acabd3d802cmr206591166b.56.1744272939208;
        Thu, 10 Apr 2025 01:15:39 -0700 (PDT)
Received: from sgarzare-redhat (host-79-53-30-213.retail.telecomitalia.it. [79.53.30.213])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1cb4142sm229097166b.101.2025.04.10.01.15.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 01:15:37 -0700 (PDT)
Date: Thu, 10 Apr 2025 10:15:31 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Tom Lendacky <thomas.lendacky@amd.com>
Cc: Borislav Petkov <bp@alien8.de>, Jarkko Sakkinen <jarkko@kernel.org>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Peter Huewe <peterhuewe@gmx.de>, Jason Gunthorpe <jgg@ziepe.ca>, 
	"H. Peter Anvin" <hpa@zytor.com>, linux-coco@lists.linux.dev, linux-integrity@vger.kernel.org, 
	Ingo Molnar <mingo@redhat.com>, x86@kernel.org, Joerg Roedel <jroedel@suse.de>, 
	Dionna Glaze <dionnaglaze@google.com>, Claudio Carvalho <cclaudio@linux.ibm.com>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, linux-kernel@vger.kernel.org, Dov Murik <dovmurik@linux.ibm.com>, 
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v6 4/4] x86/sev: register tpm-svsm platform device
Message-ID: <xfwwxtkphwlkrpemprdyju6zahwh43tijdlbzivtokqtcfvvxw@a4ujdfs744tm>
References: <20250408110012.GFZ_UBvOcEfEcIM4mI@fat_crate.local>
 <eqtiiphs6rtjo7nirkw7zcicew75wnl4ydenrt5vl6jdpqdgj6@2brjlyjbqhoq>
 <20250408112820.GBZ_UIVPp-LuIiVrIV@fat_crate.local>
 <o2u7p3wb64lcc4sziunr274hyubkgmspzdjcvihbpzkw6mkvpo@sjq3vi4y2qfl>
 <20250409102120.GCZ_ZKIJw9WkXpTz4u@fat_crate.local>
 <CAGxU2F7r_fWgr2YRmCvh2iQ1vPg30f-+W6FXyuidbakZkwhw2w@mail.gmail.com>
 <20250409113154.GGZ_ZaqgfRrrMij_Zm@fat_crate.local>
 <6e5bf479-ee95-a996-5845-1f76730e2488@amd.com>
 <20250409184507.GLZ_bAM8LCPXKn9xU1@fat_crate.local>
 <bf8b7522-f34b-f7bf-11a5-5f6a223129eb@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <bf8b7522-f34b-f7bf-11a5-5f6a223129eb@amd.com>

On Wed, Apr 09, 2025 at 02:16:40PM -0500, Tom Lendacky wrote:
>On 4/9/25 13:45, Borislav Petkov wrote:
>> On Wed, Apr 09, 2025 at 11:07:49AM -0500, Tom Lendacky wrote:
>>> So the vTPM driver wouldn't change, just snp_init_platform_device():
>>>
>>> 	if (snp_vmpl && platform_device_register(&tpm_svsm_device))
>>
>> So this basically says that the SVSM is always sporting a vTPM emulation. But
>> you can build the cocont-svsm thing without it AFAICT.
>>
>> So I'm guessing Stefano's suggestion here might make more sense:
>>
>> https://lore.kernel.org/r/o2u7p3wb64lcc4sziunr274hyubkgmspzdjcvihbpzkw6mkvpo@sjq3vi4y2qfl
>>
>> considering it all...
>
>That way works for me, too.

Okay, it looks like we have an agreement! I'll apply that and send v7.

Thanks,
Stefano

