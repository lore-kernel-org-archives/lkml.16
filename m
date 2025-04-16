Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC7A422E41D
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 09:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744795565; cv=none; b=BJixvx2xxGSKAG/XxM2Yr2qIb95lGxqxiWo7DUmckENsPu6K1GR6RcYkYtgNrLTv9sFVRWOnnPfantEsdWHJLjSZWXXjIkt9Ps5oj6aM7Akvh5cJrErcb7jZBkUXDnKlZZOyGWZvVT7gy84ZsVQ/Te6F7R1z7YHgOKoCaY1fFMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744795565; c=relaxed/simple;
	bh=3ScT62wBFyj0bxCBuOyqKPS+JD3Y2QDmSfgdrnlRSmI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=juC9tZyg4YBkW7ofozm1IKecccUOiFAQZQ+wl7VGwbBTseceLorhINh6XwabOY0PhIA+tESsAJ9Pgcmz130O6WAlsblV64t3w2kWfsBXxXQ0tHBUJR/LW4j4fsJ4BbmMUfNeN5NipLv3qnI32qwZkfaGw0PYHcfrfbJArrnFbKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=J+HjLMTG; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="J+HjLMTG"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-39ee57c0b8cso326967f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 02:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744795561; x=1745400361; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8ri2FPsioeyOMpww0lEYWXKz/xcfTIJFn+R/QcNtid0=;
        b=J+HjLMTGMLPutOeqwSk7RUOcEEzYwnwfUvSfwaeGtvh/QZr/CE+Y2BydrRNni4B9Cm
         ujxAlNi5idBHR/A+W7YI1SKZ/gTSSRCGWBx04/TGkVoiyB4pMZQa9Uf2VXFTMIIsCH4J
         37Ps59SeKK7I8zOHhT3I9aI31lJ+YahGq1UcXg2Pdwy1Gzx8ZKKQSV3YiEU+R4ZzFzmW
         J5pwWZaJdVdj+w2dy8+cUL3NNr13P6u8Cl7EfwNJMquKtRj1cOotf1o20gqYDR5CBebg
         xwZHzAKoaOr+kJgWBi31/DP1M0SFhGXnWcIOeN+PtRjebmxZYGZ81L3/e1mzo9bbWJ2M
         jZXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744795561; x=1745400361;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ri2FPsioeyOMpww0lEYWXKz/xcfTIJFn+R/QcNtid0=;
        b=Cp77Gw9fMbKEOZFSy97fTQm7XBlBzCSbo9IfgdBfI2wL7ppQaTVcC4+gGq3b3G6NUS
         v6oD9eZ4qusacR4fe+2P47ZTEK6aW2KwqAvOjG0DUpXKGmxl/n2OssAG+AJ48ub4aSlH
         Vjo/qNTCAESr0aOeM09GhLDwmXrFkYBez824eYxZvcf/y1Yi0OJQ7uZcEIExRZFi1/0v
         p2DZOxooFuLUhOQ5pFQTEfCtnmAfLCKk7ADpSe2DI3e+5V/PXqWz6x0SWKklQBVcbvMg
         z3WFQqpZ2Ku2NnL3xxnlbJ1o6K+IlcdNbVH+0vIjd2DYPPGxZCX2S2B7hexehEcyEpNw
         7xmQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQvxJ442gfQwi969xrQmfXdUEaEfZ7+3dA9k4rpjCLt8Tchq5AitN2Eq3HfL9JT32JEkiVA506ReCAX7E=@vger.kernel.org
X-Gm-Message-State: AOJu0YySG5Xhq8xXAvu5r7SI9a2cjA+tW6GiF04PClwUSg6qKQsk/zca
	ELuD1d363NscPMAbFmxvri4JPuXE4CDVWeJhOyjhh4+Aq+aQLI4BAUTyjePTkmzM96BJlgpUEIh
	F
X-Gm-Gg: ASbGncuWhhX1gKWpQEbUhElo7XHQWO0FoAIjyGpC76S7M8S3piY96x5ZFBSGqK/muIT
	3sKdYAu0PsA9eZyd+YWiVddJ1z0r7tsD2/DKZapeowPbfOBYa7F8Nj+mTuAMjVvmsfVBLaSK1+A
	ecnLpWztPJcNx5r1Gk3yBA8X1au0pfPk7blRcQpik5/7gLLNc31U4DCDSMudOc06kfOOoR861Eo
	0ma1xUCnvmNx6h6o6Yvat2siikIxe7qKWXlO/7iOEY85HYS9dejr+3fJnzZ3cHFba4xyJ84DFXw
	TIRk6Frhmyq0sv6zap5HZDq2y52qjOrMo3a8ZxcedZk=
X-Google-Smtp-Source: AGHT+IG+DNt53Y1tj1r/NgZyeW/D6nAONrAJfUbDPzr4B6m4A9eSNWJlFy6wubzxu2mVoR+YMUc51A==
X-Received: by 2002:a5d:6dac:0:b0:39c:268e:ae04 with SMTP id ffacd0b85a97d-39ee5add7admr1016490f8f.0.1744795560990;
        Wed, 16 Apr 2025 02:26:00 -0700 (PDT)
Received: from blackdock.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf43cf42sm16763741f8f.64.2025.04.16.02.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 02:26:00 -0700 (PDT)
Date: Wed, 16 Apr 2025 11:25:58 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Waiman Long <longman@redhat.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Muchun Song <muchun.song@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	Tejun Heo <tj@kernel.org>, Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org, 
	cgroups@vger.kernel.org, linux-mm@kvack.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v7 1/2] selftests: memcg: Allow low event with no
 memory.low and memory_recursiveprot on
Message-ID: <psbduszek3llnvsykbm3qld22crppq4z24hyhsp66ax3r2jji5@xhklroqn2254>
References: <20250415210415.13414-1-longman@redhat.com>
 <20250415210415.13414-2-longman@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="w3npzfkwfjuaenbx"
Content-Disposition: inline
In-Reply-To: <20250415210415.13414-2-longman@redhat.com>


--w3npzfkwfjuaenbx
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v7 1/2] selftests: memcg: Allow low event with no
 memory.low and memory_recursiveprot on
MIME-Version: 1.0

On Tue, Apr 15, 2025 at 05:04:14PM -0400, Waiman Long <longman@redhat.com> =
wrote:
> +	/*
> +	 * Child 2 has memory.low=3D0, but some low protection is still being
> +	 * distributed down from its parent with memory.low=3D50M if cgroup2
> +	 * memory_recursiveprot mount option is enabled. So the low event
> +	 * count will be non-zero in this case.

I say: Child 2 should have zero effective low value in this test case.
Johannes says (IIUC): One cannot argue whether there is or isn't
effective low for Child 2, it depends on siblings.
(I also say that low events should only be counted for nominal low
breaches but that's not so important here.)

But together this means no value of memory.events:low is valid or
invalid in this testcase. Hence I suggested ignoring Child 2's value in
checks.

> +	 */
>  	for (i =3D 0; i < ARRAY_SIZE(children); i++) {
> -		int no_low_events_index =3D 1;
> +		int no_low_events_index =3D has_recursiveprot ? 2 : 1;
>  		long low, oom;
> =20
>  		oom =3D cg_read_key_long(children[i], "memory.events", "oom ");

But this is not what I Suggested-by: [1]

Michal

[1] https://lore.kernel.org/r/awgbdn6gwnj4kfaezsorvopgsdyoty3yahdeanqvoxstz=
2w2ke@xc3sv43elkz5

--w3npzfkwfjuaenbx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTd6mfF2PbEZnpdoAkt3Wney77BSQUCZ/93nQAKCRAt3Wney77B
SVIuAP96NW0fIlvRAMGyp434RzkvtOGnIESFYbQyryMjDaf0FAD/SnK/QY73TkA1
aZVm14O+UjCgolPl/9j9t4ba0I+3fgM=
=2iXD
-----END PGP SIGNATURE-----

--w3npzfkwfjuaenbx--
