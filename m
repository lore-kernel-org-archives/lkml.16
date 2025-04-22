Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A5D27CB1F
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 12:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745323897; cv=none; b=eWa2yx1ohOAmIGVlWEqg83gcq5u4ISO3OArtKC39qQNVaRsXNQ6dqLiAh7oajlKJU0gEYcGXD3da4bookXs5BMwgfjHTF4IR+B5OPQlZWcp5NfUsh/oWnv3KBEGqMeOGlMHPOCC3T3iIFSEf/zIBUHgP/FwQJxS8J4nW2FSm4gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745323897; c=relaxed/simple;
	bh=Q/0eQ4z6xF/rZSS6yNW+QOVGiNYbzpf0j7hh9npWX94=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XR1EcwCrmuAj1IrB+ytXCTcELggvP8LUoyIjCelE425qDSml2N5TQPwDJUvnsirzSkCThojpp2XgGVj8xW9zoNi/2wj450Qs11EB0fqkj5DeVfVMCUkzf4qP/irCrl6oVhPJMF9nnT96dCxdRwIcw+YKoqiKMwK8532vlAtd2mM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=KH1OViQG; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="KH1OViQG"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5f435c9f2f9so7764424a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 05:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745323894; x=1745928694; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KT1JxRWSPsmY8fesz3r5b2lILhpBpQyPhmAe3rmQpu8=;
        b=KH1OViQGN/9Izj1jLQ6iOqU8f1rpU4HpLRSKlHxG+hpwZ0RTgkdnUlnydB/Je2YhMN
         AUYbcyFbCMFK/aq6y+GMjpWunX/jJ+sYUpULEXUvbh9QIWZSJmXd9oN2AvmD+z45kJnm
         KLOtqrODJ+Q6PBRgq34JwMSttRarvpTO41Bzjf/FnLJiGNSDhVGu0XEJ51gRi2F7X/kT
         yvSg27sjlI8t0dT2ixjAgyQVPeloMRLtsqpU4PGzcVXl2f0yeWX+DohxBfLbTE/WMI0R
         Y97tCfDVKys4eelK/2fCfefHNBjjxc25LN+fJ7WCXXfqSDYRMvkSqNXWWW41Lo9dzPGn
         Yy1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745323894; x=1745928694;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KT1JxRWSPsmY8fesz3r5b2lILhpBpQyPhmAe3rmQpu8=;
        b=qV7Hng0cx+0/h0HW8hB+CMW1Wx50ox3z5McdtgmlKdhCZmtVdG+OIylBH/DX3xwIJM
         DZTuJP690EVJFIwQjLIL4EEsW7FLG2SWQPf/lcm7DAbv3GB2wKi89rU10ZqPyuNY5h6g
         ZCHWSsaxA0NjfvGjuNSDN/znzeoyHDAMXu8bVeZxYeN6dGSUYuxQ9yrxFpM7+6wCyLwB
         7wp7rwQ/NNIVrgImBIii8oKL1B24mwCrPYHw1NH744AEg8GJqQhBT/5qD4siHAJP519r
         atvPuo3fcnX2kPUfp7fJjeGtzsWNAYynO2UavkQWafF1CzK+U6+bWSaovSKuKZ9XkL6F
         kMrg==
X-Forwarded-Encrypted: i=1; AJvYcCUMHGaUm/WqesFUUDetqJc5yfSierzr5ilvjeLizcDeBSiNWxatjDDOIsvyawepy+hKcWQS/vKvYUb5wKY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCzHWeR9x4serqAVTaKCPlIHr9DSgEazRo03uGAfyZMzFAcNyy
	VdYrVTNiS2V4d4ZQUo6bFp9ePYRngjgVyyyhSB+/0fHL2q0KCi7jJeJQnOsk7yQ=
X-Gm-Gg: ASbGncvNEMqdjyZeZvnDD1qpt0arqC+w1Ye2VxBZjE49uwD89E7b1fej3JOiVXRktm5
	VJQOrs0B2MhPOUKlgq/OmDWVg+NKemVUuaj1pNVPFIwfL5bOH4zmo37tE+FzWFO3cG9rKF6+4pA
	OjWex+ie1HAxFnawPqqGFV2Pn9DZcPO7cquybi/YViD1Lt0qZX8YuiZWZFpfQPskg6EHvyKI+0x
	flDMUi+tHvubvGyymwEA4eu94kl9NvvccxqSmBvwJV4IvNR3DKL7TypsDlbG4W/OQVIIHDSzDH+
	BH1gN3oeEtW6ue17+LskUicGXnlZ/jwXS+OPB2ufDNU=
X-Google-Smtp-Source: AGHT+IFyYmcZlvcAITMghOEvilutpzLwoU5xPOnInSRoTQAJsg2jq3a94IEVeo4CoWvMA1NEnQNxKw==
X-Received: by 2002:a17:907:96a4:b0:abf:19ac:771 with SMTP id a640c23a62f3a-acb74adabfdmr1382972966b.2.1745323893733;
        Tue, 22 Apr 2025 05:11:33 -0700 (PDT)
Received: from blackdock.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ef4ac41sm644389366b.152.2025.04.22.05.11.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 05:11:33 -0700 (PDT)
Date: Tue, 22 Apr 2025 14:11:16 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Waiman Long <llong@redhat.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Muchun Song <muchun.song@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	Tejun Heo <tj@kernel.org>, Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org, 
	cgroups@vger.kernel.org, linux-mm@kvack.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v7 1/2] selftests: memcg: Allow low event with no
 memory.low and memory_recursiveprot on
Message-ID: <h64z4wl6mw3qxfwmqsvlddsie62ehkoag47lm2in3nda7dhloq@rjxpkggawqem>
References: <20250415210415.13414-1-longman@redhat.com>
 <20250415210415.13414-2-longman@redhat.com>
 <psbduszek3llnvsykbm3qld22crppq4z24hyhsp66ax3r2jji5@xhklroqn2254>
 <0033f39f-ff47-4645-9b1e-f19ff39233e7@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sq3j7fc2pogean7z"
Content-Disposition: inline
In-Reply-To: <0033f39f-ff47-4645-9b1e-f19ff39233e7@redhat.com>


--sq3j7fc2pogean7z
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v7 1/2] selftests: memcg: Allow low event with no
 memory.low and memory_recursiveprot on
MIME-Version: 1.0

On Sun, Apr 20, 2025 at 05:48:15PM -0400, Waiman Long <llong@redhat.com> wrote:
> I was referring to the suggestion that the setting of memory_recursiveprot
> mount option has a material impact of the child 2 test result. Roman
> probably didn't have memory_recursiveprot set when developing this selftest.

The patch in its v7 form is effectively a revert of
	1d09069f5313f ("selftests: memcg: expect no low events in unprotected sibling")

i.e. this would be going in circles (that commit is also a revert) hence
I suggested to exempt looking at memory.events:low entirely with
memory_recursiveprot (and check for 0 when !memory_recursiveprot) --
which is something new (and hopefully universally better :-)

Michal

--sq3j7fc2pogean7z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTd6mfF2PbEZnpdoAkt3Wney77BSQUCaAeHYgAKCRAt3Wney77B
STU8AQDtPchwdDd7GvYG9/lftHphnD62oj3o0m0hpo2aWJjY4gEAjv+IF2GZLFKQ
73DPixoPDX77bf3ZdvlqpW53y0lI8wo=
=3Mvf
-----END PGP SIGNATURE-----

--sq3j7fc2pogean7z--
