Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D31E21B0F29
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 09:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738229174; cv=none; b=nYN9E+SuCP5nP/oEqdsbXWR2f9ORG1stz+JkRCWotLPHNVq9xV1QXhLr6OlPnY5b3GnjO2M+3l6FKTWDClcpk3UE/zynNlayrNiaBhbEw3sbjJfaRP2HHAD/j/2FJYGDfO1P0ODSyKh8lk9dRRWvmL/CThjz/Ern5rT9N2OSLq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738229174; c=relaxed/simple;
	bh=Ss6TAehgDwdSBX0Jn2SHJGPzwEuTlGrwn+sRf6KBoNw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZmupvvXBlKI5ITKZpski0GtRs2hq44T243eNeSykCNw0dmSn8wLcRkau7v3/yXzuy4/lAmaP5K+tkph1f2PAmIi4fHrkSja6LKOIppRvAfz5f8I/c/vCTSNDQOeNx/tlTZauO9b3Kb2JVB6G0eLCqxxpJD5t5+i8Ln8IJLxRqjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=JMPeESts; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="JMPeESts"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43618283d48so3746605e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 01:26:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738229171; x=1738833971; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ss6TAehgDwdSBX0Jn2SHJGPzwEuTlGrwn+sRf6KBoNw=;
        b=JMPeEStsaYzSVxdqKQh3WH2lGXj00DMgvaxwH6rqyOgBpbfw6JAEjaANjkKd+fYiuh
         IyvK8yEu8mBvLVR0XMRUs0Rc2Qh5dF5lYlNepHxd9cpH5pqbRhnqWfkj1f5vlnjcQXFd
         czFpYhH0WUQe0PS2fPC2xcNezt5zPa5X+fSUejogtNN/K6+LBZIcptsV46oHtTTxcVq2
         d10+CbT2Upd+z4bvej9eydizNJeeaUYcmCG/WXJlGTKpNmn+wejm6cOXOPioB9Z474JH
         4FDvDPcOnSVxa5mLDNyxqJPyZksfMCs4/6ZuDLFBIkhETpI0ogR49fQJsES9DYxI/rQa
         XJDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738229171; x=1738833971;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ss6TAehgDwdSBX0Jn2SHJGPzwEuTlGrwn+sRf6KBoNw=;
        b=l/K26DHVvWALtyqzCQGKnI+TqGPXw6DXCPaOzhOT/66KNqzd69l8ciHQMovY+Hk7t+
         lkkDcHkprmhz83D/5zR8J1pRWjkHlMIRnw11ik5BrynNaZ0ZCX0FbrX2vwLUhRft/eF/
         AmI6spJaqTpAZUsK7+/MBiJALbdmjRG3c0X+zs+qXbCYxNUbB3B+PmkP82lCg6A6UenH
         +0bfQvX/M41Jy6Fo6HtrCHuqbaEvjdmodMW8WLOeAkWMEh6uYkQye5i3avXnJsrmGk7P
         ochA6mqI+t1fhGRLremDoZIFD3T2rE5UCgatXXyyPcI6N4pBj5EAxvYWLBPQP7K5RxkS
         TYpw==
X-Forwarded-Encrypted: i=1; AJvYcCX4UX2qy2k1/NsD8U2IfAo9BdZe4ZSzq8dtIMyDH/F0GN9KhBdeur6aDHvW6vGWgb8AG6QyQzJOi6ERDCk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDq/mD5ii+jTKO1DaBpmlfDlXi0MQKQRSj0N7pRQfJh5cqEXPe
	DwVMe8+rXaBkknZyHTeGL5Q2bQOjYF1+UOy7IxhqWMti/pBWoN6WpD9Ja5XrwTs=
X-Gm-Gg: ASbGnctnbnYNIBSWXO2lzL+qDcIxUZeYTZkXua8X0PuOSANlppsfmXMMdbETVC6PWPm
	zkk0nXA6J2qSn4QezM7CLxaprYdfHIEsq+hIvZGpEzQf+PHKJNQshTeiKvYQYBmADCsGOD/kQlA
	pQ3VkCRxbXH47aYyhdfF1xrYgO2NDkuA4LHC2CQoovUCCKBiBY4hVj8fYYmgly4WjFJdbwj2ZZQ
	1ZQMBEWTDoJAc50ip5Bs/MD8PNfM/zVgbOpOy41gRuqXf8c8Nd0JRepoIT3IFXZReSK+p5q3smi
	AgJNjgceAaYkNBF2xg==
X-Google-Smtp-Source: AGHT+IHkDqyCG+kARtwYDnl8ujpUjmLNSstCP8Zea/ZsGKNuiwMSzYTLb4UWS5GXeWVnDZ5EjKjEjw==
X-Received: by 2002:a05:600c:34c9:b0:434:f0df:9f6 with SMTP id 5b1f17b1804b1-438dc3aa58amr53861425e9.3.1738229171114;
        Thu, 30 Jan 2025 01:26:11 -0800 (PST)
Received: from blackdock.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438dcc81d74sm52205955e9.37.2025.01.30.01.26.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 01:26:10 -0800 (PST)
Date: Thu, 30 Jan 2025 10:26:08 +0100
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Shakeel Butt <shakeel.butt@linux.dev>
Cc: Tejun Heo <tj@kernel.org>, Christian Brauner <brauner@kernel.org>, 
	linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, Joshua Hahn <joshua.hahnjy@gmail.com>
Subject: Re: Maybe a race window in cgroup.kill?
Message-ID: <wj3tqes2kd3tjsxpj62kqb6u56lht2pko3qnkjzulyqqoel2nj@apym47ae33gl>
References: <Z5QHE2Qn-QZ6M-KW@slm.duckdns.org>
 <lelekt53th2kq7dpz6r7gkifpnxwyk6hwhdko4elshj5qqik3e@cjlyam5ttaoe>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="766tojqhh27mn5bf"
Content-Disposition: inline
In-Reply-To: <lelekt53th2kq7dpz6r7gkifpnxwyk6hwhdko4elshj5qqik3e@cjlyam5ttaoe>


--766tojqhh27mn5bf
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: Maybe a race window in cgroup.kill?
MIME-Version: 1.0

On Wed, Jan 29, 2025 at 11:08:41AM -0800, Shakeel Butt <shakeel.butt@linux.dev> wrote:
> I think this is indeed the race though small. One way to fix this is by
> taking cgroup_threadgroup_rwsem in write mode in __cgroup_kill() as the
> fork side takes it in read mode from cgroup_can_fork() to
> cgroup_post_fork().

I don't see that cgroup_mutex and css_set_lock alone ensure the ordering
neither. cgroup_threadgroup_rwsem would be certain but heavy as you
write.

As I'm looking at it now, freezing is similar but shouldn't allow such a
child escape if k3' came before c6 since the CGRP_FREEZE (or
~CGRP_FREEZE) is permanent (until next operation).
That is IIUC basis for Shakeel's sequence approach too.
(CLONE_INTO_CGROUP should be fine thanks to cgroup_mutex.)

Thanks,
Michal

--766tojqhh27mn5bf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTd6mfF2PbEZnpdoAkt3Wney77BSQUCZ5tFrQAKCRAt3Wney77B
STYxAP4pSOBEcIT/PLNVDzaXwXF7D4T6JswOno6zSWfRL+zvGQD/cBVXyFiU7JQf
ry7jys6TH7VPhm7YQdzya9pF3XM5kQo=
=fM0O
-----END PGP SIGNATURE-----

--766tojqhh27mn5bf--
