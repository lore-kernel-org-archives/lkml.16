Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57DF525CC49
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 12:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750853981; cv=none; b=TJLKqu9TPn2U6ElXueLNKP0nEQd9RRWKGYHtPOlpLchcXN8HEYfBFLQ2E/Rc5JwQL/69kpzqL7lnZeaoJXxD17+zv5DnHlLRUtZk6wH1iRU+puj1QfRX3alsx3y3c83HREJ1EZK/NKdvrud32u+EAu08+HswDyPHJn4MSHOKJrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750853981; c=relaxed/simple;
	bh=XRVu8I1TW50eEO7yMqUltjODw6rALvnLW/kAKL0wlng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OdNJzRMSBYgyzkLQkMYkRHtSLk9ScA71q8OV0qkmtM9/+0/TuAsRg8xoI5GNP5wQytBM+Ve0ndWKDN2qRIEdoREGw7gYJrNyxEwiNNffq8XnLQPBQoLJSL7LxxzYNCTojooKW53J2LBkM7y+Q6Iysht5dPNX12jlnsvYLsjQoQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=K/gCwCFk; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="K/gCwCFk"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-451d7b50815so52312095e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 05:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750853977; x=1751458777; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XRVu8I1TW50eEO7yMqUltjODw6rALvnLW/kAKL0wlng=;
        b=K/gCwCFk09WX0H0oWIXqs2wjgQli14b25T0WLHKCUyiWLMs/ywCJ2Xt/IXJIfskPYY
         MzCP/P2BH5j4uav3CpM5H1YjNsFSuKltV/62YVnZA31GDuO9LnHmeQK9283KWtm7o2oL
         cveGVKjk6nvnSy6ARfJHyHa7aNTHh4J39udXRrkqicXb3x2/QWvoA5NtCjX8Iq24DIe2
         MZZp96OLryDmicqZHfgCNXdhOP8q5sh8YJbCEwbfLl4qsYfVTC3Q3kUqo8mA9lJu6Dcu
         P8Lmhj2AcYBE30z58yZZ2gIXJBBbknPouGx7vO/LLWbvTtzbj2B95k31m+JSm22G8hXg
         +Txw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750853977; x=1751458777;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XRVu8I1TW50eEO7yMqUltjODw6rALvnLW/kAKL0wlng=;
        b=qZBLG0B+84/s0KfEKHvRyqhN/TBdcUJIoYMT6wpflGkP8vwTwSYj3+k2vcmI1SiSi2
         VK9+4fWBGp511h0SonTdDRQMKKLJVYgpV97Rtbc5kuUCDnueXw1+drxs7ViAE0dCaGSL
         5THmr8hwRUzgtYCONCmcM6Z6Mx5TWDa777CCcdSrEnMkNovYhlBtKeFFlquWJaTq4wdJ
         NTRNgyO5urDBZx1GmWDZt3D6w1MVL8DowptwvyXATkqfEAlKKUbIzbWeems8MnLX5pnN
         M8bU2GvrKYi73ZJZCaUWwpXa408M2dNUBthQ6Xx2XZtHm35Y67PBFnGwMbZnBUnGMXo/
         huZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYtwiGFbDCy0N3ew9dEhsZbT0j9Tob50ZWLjFB7GAYF8kMeLE9vaFSHvtzCMeAt4hPVSVstJWzKZc7mvk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyH3K2C5vG2r7TjPJ4CCnu1eetspbh6y0AHK2N1ECfklHLN3Xb7
	tUS/FlZDi9mmdmgMzZlKMP9L5UxewugG9c32NbQAju6CvSssYxD1KCW2NXOt1qJ+J18=
X-Gm-Gg: ASbGncsrd/feD95bdEt7xJawiUkIyypL0wekruA7xi0eU7EBPXPGxByXepKH1m6ZeQV
	wiOfLAUVrP/1qHYARzmLkKR/DY3myIb9xsTmL3JkQDapIzSouhhvyQrt+KvCSz11Eed8PMevRGd
	O1950U8+TJONJ+31UEvTOcywnY2xn1OmWIOJ3WJk65LGTj9ht0GsQ0xXS9GvkzfGEptocfhAB3S
	SGc+rUK0WVWeKs/nO3PB0Jc3YCOFHbBJRhSSMbyLXWrxUX5UNn/vCGFmuMyl8Ep9EO5an93gI6L
	HqRocB3z9Z89JcANDSzS3iFuOLRHtC7P9vCshSDa1fhGrET6jWueYzAvLrZnTcAi
X-Google-Smtp-Source: AGHT+IFenLT6lFTGDmYC2ik7lE03eZEeBOn7sNQj0UmfMjCUA6i2rdTwHxLvkI7uVFxXLFUNIq0hTQ==
X-Received: by 2002:a5d:5c0b:0:b0:3a4:ee3f:8e1e with SMTP id ffacd0b85a97d-3a6ed652736mr2376381f8f.39.1750853977443;
        Wed, 25 Jun 2025 05:19:37 -0700 (PDT)
Received: from blackdock.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e80ff561sm4581365f8f.68.2025.06.25.05.19.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 05:19:37 -0700 (PDT)
Date: Wed, 25 Jun 2025 14:19:35 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Chen Yu <yu.c.chen@intel.com>
Cc: Jonathan Corbet <corbet@lwn.net>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Juri Lelli <juri.lelli@redhat.com>, 
	Ben Segall <bsegall@google.com>, Libo Chen <libo.chen@oracle.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Phil Auld <pauld@redhat.com>, Tejun Heo <tj@kernel.org>, 
	Daniel Jordan <daniel.m.jordan@oracle.com>, Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, 
	Aubrey Li <aubrey.li@intel.com>, Tim Chen <tim.c.chen@intel.com>, 
	"Huang, Ying" <ying.huang@linux.alibaba.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org
Subject: Re: [PATCH v2] sched/numa: Introduce per cgroup numa balance control
Message-ID: <ldyynnd3ngxnu3bie7ezuavewshgfepro5kjids6cuxy4imzy5@nt5id7nj5kt7>
References: <20250625102337.3128193-1-yu.c.chen@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="taxhvss7yhmjcw3c"
Content-Disposition: inline
In-Reply-To: <20250625102337.3128193-1-yu.c.chen@intel.com>


--taxhvss7yhmjcw3c
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2] sched/numa: Introduce per cgroup numa balance control
MIME-Version: 1.0

On Wed, Jun 25, 2025 at 06:23:37PM +0800, Chen Yu <yu.c.chen@intel.com> wro=
te:
> [Problem Statement]
> Currently, NUMA balancing is configured system-wide.
> However, in some production environments, different
> cgroups may have varying requirements for NUMA balancing.
> Some cgroups are CPU-intensive, while others are
> memory-intensive. Some do not benefit from NUMA balancing
> due to the overhead associated with VMA scanning, while
> others prefer NUMA balancing as it helps improve memory
> locality. In this case, system-wide NUMA balancing is
> usually disabled to avoid causing regressions.
>=20
> [Proposal]
> Introduce a per-cgroup interface to enable NUMA balancing
> for specific cgroups.

The balancing works with task granularity already and this new attribute
is not much of a resource to control.
Have you considered a per-task attribute? (sched_setattr(), prctl() or
similar) That one could be inherited and respective cgroups would be
seeded with a process with intended values. And cpuset could be
traditionally used to restrict the scope of balancing of such tasks.

WDYT?

> This interface is associated with the CPU subsystem, which
> does not support threaded subtrees, and close to CPU bandwidth
> control.
 (??) does support

> The system administrator needs to set the NUMA balancing mode to
> NUMA_BALANCING_CGROUP=3D4 to enable this feature. When the system is in
> NUMA_BALANCING_CGROUP mode, NUMA balancing for all cgroups is disabled
> by default. After the administrator enables this feature for a
> specific cgroup, NUMA balancing for that cgroup is enabled.

How much dynamic do you such changes to be? In relation to given
cgroup's/process's lifecycle.

Thanks,
Michal

--taxhvss7yhmjcw3c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCaFvpVAAKCRB+PQLnlNv4
CKYLAP40v6E11draiFGguEeqd7Lo4UR4CFcKxIm+6hw1tSGtPQEA4pB22MPLn2Lb
ThLQgnota7Zcd4S/rZoMXEwsCHHU/Qs=
=BfMT
-----END PGP SIGNATURE-----

--taxhvss7yhmjcw3c--
