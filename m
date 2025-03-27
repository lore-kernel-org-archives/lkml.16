Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E5B21767A
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 14:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743084670; cv=none; b=Rc0pJM36AklkjnaTbeySvh8lpQpdUYtOyEJnQSzThRGWoJIVSOIA+3dGR1q8PqNltYyOJcxN4rHWiHEsr5rY+lUbmhTq9R+Vd4+XTAN4SunRa/fJzsro3MGhkms0k+CEz+LGSzMf6INyeWd8yTb9M7P7u+wdsu+WiP0ewm5sYZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743084670; c=relaxed/simple;
	bh=B7vCfx3k3GGrVgJmcqjs9B8k5ffO9HgiTB4iz81gIcI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HYRy7ndXQvwjNvcucT8g6lvWAxWUv7z2zKj44wmHoPA5L0nW0yy0fVGF66jbNesTaOYJWt2j2s2VS7F1hra0AhBShg5v16F0iOeQfiqQFKUB59a+OesQ1aijxOXwMQ9CgrCbtQ5vb8qQ3TQI6tT2UshF0TemswYQfpL9KKahidE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BtiPq5k7; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BtiPq5k7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743084668;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Hi0A6scfyHr5zE+wPaQeLFGm0aUxJknUTOgLYjwIz9w=;
	b=BtiPq5k7ds1DWxWDG68ltd8vYn1/mMb3/WIotBxws5we8jwNVcIo+31YuzBInaAr3G6+5y
	keixqkSU2koROQnf2snEVpUvDEswo8fy5NKgQUOB8DajRTlZIJIf8ndH9KFGoy0ZibmgWu
	exGGG+c5ppEJlz92TovuGfTpMXw6JuA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-124-0OjuSLB-MjGee72y6trr4Q-1; Thu, 27 Mar 2025 10:11:06 -0400
X-MC-Unique: 0OjuSLB-MjGee72y6trr4Q-1
X-Mimecast-MFC-AGG-ID: 0OjuSLB-MjGee72y6trr4Q_1743084665
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43d51bd9b45so6655125e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 07:11:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743084665; x=1743689465;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hi0A6scfyHr5zE+wPaQeLFGm0aUxJknUTOgLYjwIz9w=;
        b=xFPkgg5N71vt8H4RKxIXAyY27hH/FE0Z8+qd0pWqPBUVyd+DVql7FganqbucVe2cUK
         u81Ia26+ibistIh71Wtjv+GxniJePEr+gwNGz1uTOBiyismeSUa5jTOxbEP2NRj0Q2Lf
         lyv5jTA6pDFeu4ipqIkaG9kleTMtLvbLGsij+qXubaICtTTjxp9DIYfgG5S8NjtZ3X3N
         job/lzYz+7Lio34UcUeiNg+UgSfcwcJTViJwKWoLLqtwK1D+JDoanbDhBDZsYC/XRtbM
         VexfIdse0+IfwfLHVYnZH5j8GZiKxSmlTmCRBZdJ8PM7mS+hg9AcXZeYc1qJzCflVVEU
         emFg==
X-Forwarded-Encrypted: i=1; AJvYcCVW/wpohwGFRrarfpCdy7WG0RPGUP+M/2FyT6lDmsHtAoYgilh5R1QfDEbtrd5JWEKhkG9PY5M44bfmYzo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyotKg2QxM1BAjYCqMc75OdvcP31dIN5TJezFkIHgJCl+QNdGlc
	0LtyoQQHd82qZrha/LWOOcjLpJZdBYCSCDybEgn8O/ZZDnEOjVuthRsjcHfAShD8CFM8yuebNph
	3vW7R23nNI5XQ7whHZKQHAbiK5hTY0ZYcdfVj+CIaCO9UI3GwbKz+aOUERpWd8g==
X-Gm-Gg: ASbGnctC1W2E3M8MhaBsHPIV92pLrSCQwOqZpQpVWSIzze/33UovR8/vkmpjn3wnMM+
	xaTLLoakl3ij/ixxB3hC/PQsGQcd4u0ayjVuLse40b9DeWiI/m3XvgM0bYXhTpy6LEfMEImJpQp
	0QvgHHfX2OTbXO5yei+JcTvIA9cX6jiIh5/M2FpBMYwtyRi0UimN23X+CQR+CLzRcUrbV+AUI9N
	VBZ4yONIZHdbtipwBT1v6g/Y5onZcyfULLmY2Xy3iB3qxX1zRFJI0IYO1+oTTo1HhniRENG8Y2t
	yWgPeGoGBBDjXwhblaqB/yhZp9AoOKr7mkbTY1IiBiCQGFAQDri6ZM2h9HBSijty
X-Received: by 2002:a05:600c:1d05:b0:43c:fa0e:4713 with SMTP id 5b1f17b1804b1-43d84f5f482mr38225385e9.2.1743084664707;
        Thu, 27 Mar 2025 07:11:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFqwervicR8HJyW32dDEpFNwFDZuw43Crvb82jmCEiLUmWRbpF+tRkohYrusgDBir4muwY2dA==
X-Received: by 2002:a05:600c:1d05:b0:43c:fa0e:4713 with SMTP id 5b1f17b1804b1-43d84f5f482mr38224505e9.2.1743084664134;
        Thu, 27 Mar 2025 07:11:04 -0700 (PDT)
Received: from sgarzare-redhat (host-87-12-25-55.business.telecomitalia.it. [87.12.25.55])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f995a10sm19848348f8f.6.2025.03.27.07.11.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 07:11:03 -0700 (PDT)
Date: Thu, 27 Mar 2025 15:10:58 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Joerg Roedel <jroedel@suse.de>, Ingo Molnar <mingo@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Peter Huewe <peterhuewe@gmx.de>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Thomas Gleixner <tglx@linutronix.de>, x86@kernel.org, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, linux-kernel@vger.kernel.org, Borislav Petkov <bp@alien8.de>, 
	Jason Gunthorpe <jgg@ziepe.ca>, "H. Peter Anvin" <hpa@zytor.com>, linux-coco@lists.linux.dev, 
	Claudio Carvalho <cclaudio@linux.ibm.com>, Dov Murik <dovmurik@linux.ibm.com>, 
	Dionna Glaze <dionnaglaze@google.com>, linux-integrity@vger.kernel.org
Subject: Re: [PATCH v4 3/4] tpm: add SNP SVSM vTPM driver
Message-ID: <setj52yumlcd43q5hnsfntig5mv7uxhh6n32puahkmwg75wtlc@ft3xk3vybpwn>
References: <20250324104653.138663-1-sgarzare@redhat.com>
 <20250324104653.138663-4-sgarzare@redhat.com>
 <Z-RV7T7Bwt3Auopx@kernel.org>
 <x3nkctmpbwkldm5aawfpqrw3b5lej5kxuxam7gb2w6nhgzy7kr@gd3mfnigyg6q>
 <Z-U8UxEdt9Jit9GA@kernel.org>
 <Z-U9KxQYA6vj1DZT@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <Z-U9KxQYA6vj1DZT@kernel.org>

On Thu, Mar 27, 2025 at 01:57:31PM +0200, Jarkko Sakkinen wrote:
>On Thu, Mar 27, 2025 at 01:53:59PM +0200, Jarkko Sakkinen wrote:
>> On Thu, Mar 27, 2025 at 11:03:07AM +0100, Stefano Garzarella wrote:
>> > On Wed, Mar 26, 2025 at 09:30:53PM +0200, Jarkko Sakkinen wrote:
>> > > On Mon, Mar 24, 2025 at 11:46:48AM +0100, Stefano Garzarella wrote:

[...]

>> > > > +
>> > > > +static struct tpm_class_ops tpm_chip_ops = {
>> > > > +	.flags = TPM_OPS_AUTO_STARTUP,
>> > > > +	.recv = tpm_svsm_recv,
>> > > > +	.send = tpm_svsm_send,
>> > > > +	.cancel = tpm_svsm_cancel,
>> > > > +	.status = tpm_svsm_status,
>> > > > +	.req_complete_mask = 0,
>> > > > +	.req_complete_val = 0,
>> > > > +	.req_canceled = tpm_svsm_req_canceled,
>> > >
>> > > If this was bundled with the patch set, this would short a lot:
>> > >
>> > > https://lore.kernel.org/linux-integrity/20250326161838.123606-1-jarkko@kernel.org/T/#u
>> > >
>> > > So maybe for v5? Including this patch does not take send_recv()
>> > > out of consideration, it is just smart thing to do in all cases.
>> > >
>> > > It would be probably easiest to roll out my patch together with
>> > > rest of the patch set.
>> >
>> > Yeah, I agree. I'll include it in this series and adapt this patch on top of
>> > it.
>>
>> Yeah, and you could simplify to goal in the other patch set: it's about
>> avoiding double-copy of a buffer.

Yep, agree!

>>
>> It's a totally legit argument that we can measure. So in the end this
>> will help out landing that too because it takes away the extra cruft
>> and streamlines the goal.
>
>... IMHO there is this unwritten law for upstreaming kernel features
>that goes something like "further the goals are from white papers,
>closer they are to mainline" ;-)

:-D I'll make a note of it!

Thanks,
Stefano

