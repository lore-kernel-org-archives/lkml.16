Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B6F23C516
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 12:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746190558; cv=none; b=bf3J7k+3KjTHrzi1x4holkAsT1pb4sAMORr8ml3IlmxXDdJUCGVm4oCuQzUnD/mBp7lLBkJGRdiQuRisiQKQQn878R01lPYCb+vseLA7RoVv0dNV3h9c5HiutbwLHklgAKpuV5c8NDe8HUayvOFOlLgRsFVevhcGHLaqMuJyAB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746190558; c=relaxed/simple;
	bh=k7m5wfThSJzAnnocD4T0hTHkgEoH66cKQUimB1PY/ww=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LJNVexEcpgZU7HEQRQ+5VB+ycmZsjSPebXHKEqGm7ZTI++orhabcDu45SI7+5uewFlwm8ZsnIlPe+GclBAeNJ8/b8XI15OXLXjT+yLPXpFGNXHfOS9l0xzgrTqOTY605OXYwYQ3nR+ROBYkWh3Jr5OyKevc+EJt5L57FDmV5e54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Kbv7RLxB; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Kbv7RLxB"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ac2963dc379so300535066b.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 05:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1746190554; x=1746795354; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vTtxRFIdDHANvRLEITN1xhjB2nGwxMHbp+zrOw808ds=;
        b=Kbv7RLxBzhu0uZOphH5ecNmcPLf5QVjhthJBy8j8S71AL6CmCA69/WzkW0pta7ryfY
         F8aKgFd2fnhl/RvbQl126PnB6YagI1naW3ncPa/b+qBQqrNcawarUxjqTn+kOxATBmjY
         xE1a6q4w28BTzqCO90zmxt9i8kZYQW/a2tYbuLBz54DXA67cKglFHrmoNXc6cfNNMi8d
         EZZWhKpAzSCm9YGrZeoXYUF8F8iNQkW3YjkF80k5262vnLt8zJ8XsOhhYr+lrocR0Huy
         HSUa3GUHeHFAGey6loPAYAZrmct45key+vSNNolaP2bKoXTD2jmiEFVNFY1TtJjitSZ9
         S90Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746190554; x=1746795354;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vTtxRFIdDHANvRLEITN1xhjB2nGwxMHbp+zrOw808ds=;
        b=gspnGNsN2fIB3YYwKeS322sp7tScDbtvQ0SUNtp/5T/XYuPZ4lTKFc/62ywkGrBUdy
         4XOcMdkUSjvkMKTJ/0Y1qOWNkSObbsKwKBhqKxy+IkdcEZQ4aGkEKlF0NSa803G5ooT+
         pLYkW6r3fLR6gj2cePEEmKWhsLF7lW1lgoeHfK7bKxHDwOEiQMz53yqH1aQ7ddY1mxWA
         aa6FKlV7sV7HOJMQR+Ph9DobvRB6eNaMyOI7cUXewUXF2z7s7OMmWUQCeYdjCN4V+9Lt
         gm+ptrJUrBEO2PsG7MRKx6jLWy2lp4Pc2j/MLLAbd4A0XL0BudfBpyW6G2RIMYJL133z
         OWKA==
X-Forwarded-Encrypted: i=1; AJvYcCVnGMeB30zCLQJsrzA40GfqCbwnn6o24sdIWCVH60hYXdhgLilmuV4wA8lai/D+fJm6XoyHw6W8+KX8cmk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxzkd0c8EZvjYRw3FkNEKjkYLpji0xs4hVla9kCdTNPXZvAN6vg
	yTSGsRnLC9JOWp8HJcH8ZZHQJ8HNfW7vKliE6nVoqrfrI8aQYh3TGQoa+oP1q7WtayJf4Wh7iWM
	e
X-Gm-Gg: ASbGncvajdqK6s1tUyLParRWl8cQuhikubTc5br+uUCptKdkUi2MlERcVyK59C2Nwni
	X8ar5m6GLaYXWKCiun1BvSBbqH6/kjtDCCWAy+fQ2j+IRqMpIelqbLiYGJi5GAmAkSECraTuGFj
	yJSJ2TSLpM4L8qpyj3oTwPATw4E2cG0d6IVHc2U/LVAAluGZU6SJ4RfmmC+jhixtRTS+MgMSxpr
	ikmH8pI/lOzn+GKD5gy+WNGLNtYEU/bU4B0FgevoRW1rV2Lqp6SV98jH1BW7RoPK6ak1gBjX3WC
	8DGnOvQ+wZuIfMZ80irEkBDeQbx3/rsixlSK4IeOipo=
X-Google-Smtp-Source: AGHT+IECspaJdwgNmehtHNmLcWXQRGlb35Xt5cxYK3SWshB5tpDmTMfOT2XlBnI+I/l7AOfra9OxPA==
X-Received: by 2002:a17:907:3f8f:b0:ace:8398:b772 with SMTP id a640c23a62f3a-ad17ad7d68amr249115666b.14.1746190554024;
        Fri, 02 May 2025 05:55:54 -0700 (PDT)
Received: from blackdock.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1891a68a6sm46841166b.71.2025.05.02.05.55.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 05:55:53 -0700 (PDT)
Date: Fri, 2 May 2025 14:55:51 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Max Kellermann <max.kellermann@ionos.com>
Cc: tj@kernel.org, hannes@cmpxchg.org, cgroups@vger.kernel.org.com, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kernel/cgroup/pids: add "pids.forks" counter
Message-ID: <bbublxzpnqrzjq5rmmbp772w2darjoahlewqky7caanaknglbx@6wuy5nidsnu3>
References: <20250502121930.4008251-1-max.kellermann@ionos.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zswwkexc5vsnudsv"
Content-Disposition: inline
In-Reply-To: <20250502121930.4008251-1-max.kellermann@ionos.com>


--zswwkexc5vsnudsv
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH] kernel/cgroup/pids: add "pids.forks" counter
MIME-Version: 1.0

Hello Max.

On Fri, May 02, 2025 at 02:19:30PM +0200, Max Kellermann <max.kellermann@ionos.com> wrote:
> Counts the number of fork()/clone() calls, similar to the "processes"
> row in /proc/stat, but per cgroup.

> This helps with analyzing who was responsible for peaks in the global
> "processes" counter.

bpftrace <<EOD
kprobe:copy_process
{
        @forks[cgroup] = count();
}
END {
        for ($kv : @forks) {
                printf("%s\t%d\n", cgroup_path($kv.0), (int64)$kv.1);
        }
        clear(@forks);
}
EOD

> diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
...
> +  pids.forks
> +	A read-only single value file which exists on non-root cgroups.
> +
> +	The number of fork()/clone() calls (whether successful or not).
> +

It would conceptually fit better as a pids.stat:forks (but there's no
pids.stat unlike other controllers')

But I don't know this new field justifies introductions of a cgroup
attribute and (yet) another atomic operation on the forking path.

Does the value have long-term or broad use?


Thanks,
Michal

--zswwkexc5vsnudsv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTd6mfF2PbEZnpdoAkt3Wney77BSQUCaBTAuwAKCRAt3Wney77B
SRsQAQDXLaN1zLsyLBL2ikS2bGJHSeMHpyGNSE7RN9r0mxXn2gD+IJW8JRCQxMZw
c09gMoHZi+qhX9QC5reIDjNkOpV9pQg=
=PBfx
-----END PGP SIGNATURE-----

--zswwkexc5vsnudsv--
