Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5306427FD68
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 12:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744721250; cv=none; b=Jg8nSu+qAVJUhwBbsbA23DyUfzLiRNCNeJDSJIq9YPhF2sl1teuHtuIhW8kJoI+ZlQh41SFCM6vLtN6oCwAYynkWOCAztBrUiUR3I9kA2j2TiM3LeXGdmUgbJjp45giCARBN2e/7mRLAK8iGiKI3HJ2BcJvn7Z5N9qIAy1cvbwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744721250; c=relaxed/simple;
	bh=wS+MdNRuRoe6jEEASsA+cyWJOMUFzLf+Ev/6RIWCLg0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FYbJqTKKUAJclexW5Xt9O1FWWgelDIR+7NKW303HDUmWdn8cuPj7jfl1tdx7qKF2rFNuc7VC3XOb5knYmZOT4b5HmxM/32F64fKXzY2RODD+LJx/mkoir6QKQSJegM84crGXBz2tn1+kkq1TYZKKn63bI9vE5JDAFUHh2A46uWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IgN7TsKq; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IgN7TsKq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744721247;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=xnvL/RzrZbvMsU8LLxk8J6aVRTg+wYgjgOPs3GeZ1OI=;
	b=IgN7TsKqggbzEBjj6f/DuK7KZBg+xgGous3B1YkaCnD80so476V/2lUzeohgkjYA7ErBhJ
	M3ufGEch9P29x8Ne8vNELpRdpVdhshseUlEy9WuM5dlorsUkhto+m5LNseFynQMGb7IaSt
	+K0VvDcu5FWeMGo8GeQDJAKZzi3NHHM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-166-mhqE6GSBNl-CVwGYJXDOeg-1; Tue, 15 Apr 2025 08:47:25 -0400
X-MC-Unique: mhqE6GSBNl-CVwGYJXDOeg-1
X-Mimecast-MFC-AGG-ID: mhqE6GSBNl-CVwGYJXDOeg_1744721245
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-39c2da64df9so3170374f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 05:47:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744721244; x=1745326044;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xnvL/RzrZbvMsU8LLxk8J6aVRTg+wYgjgOPs3GeZ1OI=;
        b=vkGVpGuMn0SE+wBC+Dh7Jhd8fcGh6P4l0JCUhH90DYZ4FtuT9DLIrNow6GYYC/r7tO
         5Lf+jVbj1nNSHoiU0hPVmXMfRAvHdVI+G9FS/i5T5Cf13vZLmzqCJPO2UxDSj9+JEJkh
         QlfOir39Gmm/W9EDtEW1vrldKcljvT/n+nEiFrhSLhk0ggu8Atj36Xlp6h3117ARVDPZ
         6eIuq9y988enw4KzI8sDPYt8Dh+a8IgQNuX13xanfKWm0n4i6AlnHi2hX+k3ph7dk8SW
         IBs3r4TTCbrpbz2assLVsxqw85AwnxwjL6KBw0f4fL8k18kvaHzkJ/ji2KmxzxmHq8bD
         I55g==
X-Forwarded-Encrypted: i=1; AJvYcCV56fPSz5bu562h7FojxumyUM+u44iuYdJ5ffG4egrOKz/sFMPT9MeDavzRHuJ8TTdJPwS1xDR1hRJ0jRI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvgPlZh8XZCf9COZVBsCx0XSfK9IxExzkdNIlZ1FoYUw8bXcYi
	YpTcCnypxHPPOMlK6S37X5hwikM/2fMRxpcD1yvE0GoKYRIRFkSvgsxfp3kvm1Xtng9Z2pgIvPU
	KlzFhzNzgyDUAQbL0i/2B2K1GlKZKbNVXxYL5UNnCRu7YBdwxKSlyijZa/wUKfQ==
X-Gm-Gg: ASbGnctJZRHto+2teE4JYno3S9TCU9LjLCdZubEeO4Pf6wsiZnz9XfFbiR+oRPU6XTI
	DhRdgNl8it8kFaH+6XwikKT0zpOF4/NQEvOaoPRyAJThcWzBzxuPwuuVEOOWbwL9hCaWBToNuRw
	ZO1g36EUmQtiyIMmI7qEWQdOVFSZJnWQ1Aqy3YyY9HK+pm/cuRZ6MggerptKz2x/XN3Gwq3MDcZ
	3Y8pjv7YddWbZyPS+773srembE9/szV0vistMMgpOGbZnsqKcsaiw+dDGzKkdkmRL+pBhXXuHpi
	mTNKWg+QKqdWCxeImm0cMLFmNGnnHvJtRelL2a8=
X-Received: by 2002:a05:6000:40cb:b0:39e:dbec:aaee with SMTP id ffacd0b85a97d-39edbecab22mr2873541f8f.58.1744721244543;
        Tue, 15 Apr 2025 05:47:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFXUPk+FI5lntzdi59X0ntV/dg2Dh/FHAzlX7wLgVi/RsI8JfnVsjgzuQyhk0RPvQ5MlNQflQ==
X-Received: by 2002:a05:6000:40cb:b0:39e:dbec:aaee with SMTP id ffacd0b85a97d-39edbecab22mr2873509f8f.58.1744721244204;
        Tue, 15 Apr 2025 05:47:24 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([195.174.134.30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf43d053sm14314316f8f.68.2025.04.15.05.47.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 05:47:23 -0700 (PDT)
Message-ID: <241fb4fa91f8e57d2bcc992b6a4fb3fffc9c87fc.camel@redhat.com>
Subject: Re: [PATCH v2 19/22] rv: Add rtapp_pagefault monitor
From: Gabriele Monaco <gmonaco@redhat.com>
To: Nam Cao <namcao@linutronix.de>
Cc: Steven Rostedt <rostedt@goodmis.org>,
 linux-trace-kernel@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 john.ogness@linutronix.de, Catalin Marinas	 <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, Paul Walmsley	 <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou	 <aou@eecs.berkeley.edu>, Alexandre
 Ghiti <alex@ghiti.fr>, Thomas Gleixner	 <tglx@linutronix.de>, Ingo Molnar
 <mingo@redhat.com>, Borislav Petkov	 <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, x86@kernel.org, "H . Peter Anvin"	
 <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra	
 <peterz@infradead.org>, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org
Date: Tue, 15 Apr 2025 14:47:21 +0200
In-Reply-To: <20250415123807.2MahJd60@linutronix.de>
References: <cover.1744355018.git.namcao@linutronix.de>
	 <f57547af5e8c836f5c548f624e61f3e0002ce0b4.1744355018.git.namcao@linutronix.de>
	 <4d5dd1b919aada32ddf4dbce895f19e558343ee9.camel@redhat.com>
	 <20250415123807.2MahJd60@linutronix.de>
Autocrypt: addr=gmonaco@redhat.com; prefer-encrypt=mutual;
 keydata=mDMEZuK5YxYJKwYBBAHaRw8BAQdAmJ3dM9Sz6/Hodu33Qrf8QH2bNeNbOikqYtxWFLVm0
 1a0JEdhYnJpZWxlIE1vbmFjbyA8Z21vbmFjb0ByZWRoYXQuY29tPoiZBBMWCgBBFiEEysoR+AuB3R
 Zwp6j270psSVh4TfIFAmbiuWMCGwMFCQWjmoAFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgk
 Q70psSVh4TfJzZgD/TXjnqCyqaZH/Y2w+YVbvm93WX2eqBqiVZ6VEjTuGNs8A/iPrKbzdWC7AicnK
 xyhmqeUWOzFx5P43S1E1dhsrLWgP
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0



On Tue, 2025-04-15 at 14:38 +0200, Nam Cao wrote:
> On Tue, Apr 15, 2025 at 02:31:43PM +0200, Gabriele Monaco wrote:
> > On Fri, 2025-04-11 at 09:37 +0200, Nam Cao wrote:
> > > +static int __init register_pagefault(void)
> > > +{
> > > +	rv_register_monitor(&rv_pagefault, &rv_rtapp);
> > > +	return 0;
> >=20
> > Any reason why you aren't returning the error value from the
> > monitor
> > registration?
>=20
> Copy-paste from dot2k :P

Mmh, you're right! All other monitors are broken in this sense..

>=20
> > Other than that, the monitor seems neat and reasonably easy to
> > generate.
> >=20
> > May not be necessary in this series, but try to keep compatibility
> > with
> > the userspace RV tool as well, you need to have some special case
> > in
> > its tracing components because fields are not matching:
> > =C2=A0# rv mon sleep -t
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rcuc/11-108=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 [011] event <CANT FIND FIELD
> > final_state>=C2=A0=C2=A0=20
> > (null) x (null)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -> (null)=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 Y
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rcuc/11-108=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 [011] event <CANT FIND FIELD
> > final_state>=C2=A0=C2=A0=20
> > (null) x (null)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -> (null)=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 Y
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ktimers/11-109=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 [011] event <CANT FIND FIELD
> > final_state>=C2=A0=C2=A0=20
> > (null) x (null)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -> (null)=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 Y
>=20
> I have this userspace RV tool in my "later" TODO list, if that's
> okay.
>=20
> Honestly, I haven't looked at what it does yet. perf already does
> what I
> need.

Yeah, no rush, the tool is mostly for enabling the monitor and reactors
in a single command, the rest (tracing) you can already do with perf,
trace-cmd and friends, after enabling the monitor manually, of course.

We may even consider integrating RV in other tools instead of
maintaining a separate one, but that's for another day.

Thanks,
Gabriele

