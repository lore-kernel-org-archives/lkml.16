Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8DBD28937C
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 13:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746626083; cv=none; b=DsCA0Ad1UwEQL6uWW6hnVPg6hQwrAlkSdqZEpO9qoojiNlfSkPLflFQVWq1/+/9+m0E7WqPUvaZQ/Ml2eijMr8iXUbynlCdSUp4heopg0N8U9iNSmrYXzkiIhU2mPxIOrZ5op4pG7/vinHhirwoOe3qpv4xmHuneQuiMj9LOKqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746626083; c=relaxed/simple;
	bh=gDezvb+lG+PJ+vyrdK/H0gkWDsWOcy2gDnIeDCkdU3w=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VsEv2WwsWz8k2xYsD3uLmpuJKeniFzY4RqtFqSRRCgB2oA7RBUpTb8s8s0OpqYC0hzgHIinNiMfLIu4obRwd4s8q2EKpoQ3UQ0xduYj/gI4ACtcHbyhrqOu1ioJSPbQlntI0C86n6SLpgLNu1OQHXbmcnyTtQrip+G2sL61CVoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IHCdpcgs; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IHCdpcgs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746626080;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=gDezvb+lG+PJ+vyrdK/H0gkWDsWOcy2gDnIeDCkdU3w=;
	b=IHCdpcgscnMQpBcpYQzMw/kTL8Ix7oyef46TVUHJgzullwG0IKiJhCbQgWVaUs/K1lYXhk
	eaCyKLf1Z+ADzwc7tyTuKPuGwf97H/lHqYO0kF7nH0K8wJHwrKnF6kC1cVjSfD0Ha2w0Ji
	05cZqZAgJk1/qRkupcfVvVT77qe0TAI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-90-QyMav7CTPVyYGo2Y8rnolg-1; Wed, 07 May 2025 09:54:36 -0400
X-MC-Unique: QyMav7CTPVyYGo2Y8rnolg-1
X-Mimecast-MFC-AGG-ID: QyMav7CTPVyYGo2Y8rnolg_1746626075
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a064c45f03so537662f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 06:54:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746626075; x=1747230875;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gDezvb+lG+PJ+vyrdK/H0gkWDsWOcy2gDnIeDCkdU3w=;
        b=xS5IqSx48IVJXZoHPmpnJP1kGeGE9/es1tMHFXq+Kg1lwNELfC27Mjw2UsZI0hufBF
         rEuCpeHIVXCwuJJTb8WSOQ0zrO/S8kL4AEwtAcbVsjhpg3JQN5WC5RBPuxm6KR53Ckzo
         W3GEwqP9EDOa7QvZXi5LH8i+3XZzYsIAK7p88T4mmteTOsde53VgQCtjQbYivtD5gALw
         8UesHWTKTByCapytM/CWAIhO2lamVvEEO27cjvijQtWcZgzJ0P9zduCLZrNsFmb77xlB
         ZxXT4619yfqoLWXY2MTg/h7gz2rV2szefxqq1dN1mZ/GWUXaeJL5FmbaHU4o0j7qg4JB
         Y6+Q==
X-Gm-Message-State: AOJu0YyzI1V3iFU+t3fpMQuw88SbAwJt+uxcmNQm7GRm+igTTmSvXgw1
	chuVbVChRbQF6av5j/c/ucPOTp2pAcwlO/1dyKKfF+RGcR6FIsxlc0rz6hg8Qqbkl+hBkwVq7lg
	NvQb+cAXXPvSAs1i5ZuAA3CiP1HnUp82BkZ1EgVG7HcaRrQW3RbIV4g0SaQ7eEHzeNXaf51Aq
X-Gm-Gg: ASbGncs9vf7spdrlbI3hXrt4GKDDPGxk1OsMi39jI+fikcQ3HawPyMmJJj/7/K3qJDv
	PqU+tV3f2lIEa7nM8eGNivUI2uOThZCLmeF3pA/XfF5eMl8T43iVVPMlCCMetPoKOAaccKyF+i/
	fONaVkGesbLeJaeRWjNbNhvA26kNwFf2C7Jres15fQyCCfWlo3yYdGjCXXQZdkvs1ufEU4te6F5
	6+9213TofXQca8kZrhKY44avlzA4khigUzH/tNwRVzOqQMILX8AxSKVbaf611lqlBJei82Zr7mC
	gUs1VQX/FguYvj30l9mITZNFs868w9XzM4otXg==
X-Received: by 2002:adf:f28a:0:b0:3a0:b56a:c256 with SMTP id ffacd0b85a97d-3a0b56ac2aamr1938319f8f.28.1746626074989;
        Wed, 07 May 2025 06:54:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHdqBYBd1i9XRqKE/sahoAtiebVaCz1MPuXCrb6x28xleKAlXNlXKxmlbs2cjQNDNk3pszYpg==
X-Received: by 2002:adf:f28a:0:b0:3a0:b56a:c256 with SMTP id ffacd0b85a97d-3a0b56ac2aamr1938311f8f.28.1746626074626;
        Wed, 07 May 2025 06:54:34 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([185.107.56.40])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099ae0d15sm17362729f8f.13.2025.05.07.06.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 06:54:34 -0700 (PDT)
Message-ID: <dfb2721b2619130a3b3ed45c3e6d18916faf5ccb.camel@redhat.com>
Subject: Re: [PATCH v4 2/5] timers: Add the available mask in timer migration
From: Gabriele Monaco <gmonaco@redhat.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, 
 Waiman Long <longman@redhat.com>
Date: Wed, 07 May 2025 15:54:32 +0200
In-Reply-To: <aBtix0VHFCRI_Y-c@localhost.localdomain>
References: <20250506091534.42117-7-gmonaco@redhat.com>
	 <20250506091534.42117-9-gmonaco@redhat.com>
	 <aBozrJ0C6yzW7oB_@localhost.localdomain>
	 <3f54534266f4405fc3c6943599edd9be88becd57.camel@redhat.com>
	 <aBtRSSCxyHcypo4b@localhost.localdomain>
	 <9b96acdb43b80f067a34b83c5fe9fc3e79f1e3a4.camel@redhat.com>
	 <aBtix0VHFCRI_Y-c@localhost.localdomain>
Autocrypt: addr=gmonaco@redhat.com; prefer-encrypt=mutual;
 keydata=mDMEZuK5YxYJKwYBBAHaRw8BAQdAmJ3dM9Sz6/Hodu33Qrf8QH2bNeNbOikqYtxWFLVm0
 1a0JEdhYnJpZWxlIE1vbmFjbyA8Z21vbmFjb0ByZWRoYXQuY29tPoiZBBMWCgBBFiEEysoR+AuB3R
 Zwp6j270psSVh4TfIFAmbiuWMCGwMFCQWjmoAFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgk
 Q70psSVh4TfJzZgD/TXjnqCyqaZH/Y2w+YVbvm93WX2eqBqiVZ6VEjTuGNs8A/iPrKbzdWC7AicnK
 xyhmqeUWOzFx5P43S1E1dhsrLWgP
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 (3.56.1-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0



On Wed, 2025-05-07 at 15:40 +0200, Frederic Weisbecker wrote:
> Le Wed, May 07, 2025 at 02:46:39PM +0200, Gabriele Monaco a =C3=A9crit :
> >=20
> > I'm not so sure about this one though.
> > As far as I understand [1], is preventing the user from setting
> > different CPUs while doing isolcpus=3Dnohz, and nohz_full=3D (which is
> > now
> > equivalent). But I seem to be able to do isolcpus=3D0-3 and
> > nohz_full=3D4-7
> > without any problem and I believe I'd hit the issue you're
> > mentioning.
>=20
> Duh!
>=20
> > (The same would work if I swap the masks as 0 cannot be nohz_full).
>=20
> Unfortunately 0 can be nohz_full...

Well, I haven't found what enforces it, but I wasn't able to set 0 as
nohz_full, no matter what I tried on x86 and arm64. Not sure if 0 was
just by chance in this case (I'm guessing it has something to do with
tick_do_timer_cpu, I'm not quite familiar with this code).

I was trying to see if we can make some assumption in the tmigr but
what you propose (enforce fully housekeeping CPUs everywhere) seems
much neater.

>=20
> >=20
> > =C2=A0 # vng -a isolcpus=3D0-7 -a nohz_full=3D8-15 head
> > /sys/devices/system/cpu/{isolated,nohz_full}
> >=20
> > =C2=A0 =3D=3D> /sys/devices/system/cpu/isolated <=3D=3D
> > =C2=A0 0-7
> >=20
> > =C2=A0 =3D=3D> /sys/devices/system/cpu/nohz_full <=3D=3D
> > =C2=A0 8-15
> >=20
> > (where probably some CPUs are set up to do housekeeping stuff
> > anyway,
> > but if we just look at the masks, we won't notice)
> >=20
> > Then I assume this should not be allowed either, should it?
> > Or am I missing something here?
>=20
> Exactly then. housekeeping_setup() already handles cases when
> there is no housekeeping left. I guess that section could be
> made aware of nohz_full + isolcpus not leaving any housekeeping left.
>=20
> >=20
> > >=20
> > > But if nohz_full=3D is passed on boot and cpusets later create an
> > > isolated
> > > partition which spans the housekeeping set, then the isolated
> > > partition must
> > > be rejected.
> >=20
> > Mmh, that would make things easier actually.
> > I assume there's no real use case for that kind of hybrid setup
> > with
> > half CPUs nohz_full and half domain isolated..
>=20
> I guess we can accept nohz_full + isolated partition as long as a
> housekeeping
> CPU remains.

Yeah makes sense, I'll explore that.

Thanks,
Gabriele

