Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E5542A9B
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 17:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746467202; cv=none; b=VDJKDIuUKOmOywaVVxTJ8mjCaCUCZbm3B1OV2k4O55ErXM0jh0dkKhu9C1Iabp3WvyNJPxRX4W+tNpCLsdu+wv9GNbPjhqDSTNDN+nyORRNnRSPma94ALQkExX7z5h/UpHf1mXXUzeJNOik6HIe0zd1iQdoOQT6GxowQAcw6MwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746467202; c=relaxed/simple;
	bh=flx8Ljw5SKcwo6d908KI2oJJPOswRDybxWbQ0sBwqXg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mej4aGffqRuefRO4oZcP5DXrbG+P7vfcL8uw7PV89CNUv/ahAQIIcS/CFZx0cbJN+mlnA0gYPFFYX9gGlA5LKlJ1cJ96m5P51K2TcdITNlCAhm/vGw7Q0NHF9frg2mWngbGE7lJEyN3CXjLkEazHWZv7i8J3usYMj8NciT9RNqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=WfoQlf4j; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="WfoQlf4j"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ac2af2f15d1so648135766b.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 10:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1746467198; x=1747071998; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=43yWpaDFlvzQdOUfoFXBeY0L6VRPaAC57++Wqp89Ras=;
        b=WfoQlf4jXViXBpXOQLTbOnWIO5RZV2Gq/6MNcaBBHXu4feRPDHYy+ZYqykb+pQRd5e
         ktyZeAyaWz+4rvU6rZPnty17yBJGLz+r7LUq+655ZcDoreE+kmU3nMD1bVYO+hEYMz6m
         rsYoH5SU0KL8yErHMcDDDAfWSDcAt5fiAR2wSZJ1gfwWUXuaL27PrUoQ8bsoYa9OyBuf
         CKMoIFo071qwd0s46F9KJQVu9wXgj3FxQgjNdxy3anU+x2N+X6RX6DS/qXBoRGLfQcfE
         J6jTTChziU+sYdXTGraI/Hi4c/nIqeCg7ACy1FRDNJvDuMJEBFnqH9GYw0CaNf3dRZrL
         0NPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746467198; x=1747071998;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=43yWpaDFlvzQdOUfoFXBeY0L6VRPaAC57++Wqp89Ras=;
        b=udEBEugmfZFJYJEiIkCtBNiKRgwKD2odiR9ltkV7q/BhD6iHph3ubuUEvryMWM0yvd
         /ustMbt545s+LSYz9ugeJFcT46J28xTnVBfICWbVAtQNB44O/HpV4Y+8Agk4wF6CNGMg
         +7QNJONA9pcX88SNvtgDwZN5yHT0h+/qtIOtvugHBMHOjIgntgnP2zJ1Gs/rcuCIe9b5
         h3qcI5ysp0WHQRHMCuIvwVfAPl5yAIGllB6r8g6UTsZReIajEdd7a/+EQnQiSa29D259
         CZLnfGeC3VOsBti91ibNPoa45bZ5CZtV0hgisMLStOgYhStdxM09OkDuV0u9mhWB+MVa
         aTBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmCDMDocA4lRyqg5gHe/0vr926D/6KKRE3rfUHsREKrkokf9hxJrarlFLtPbsC9ZCTBt294XNfVnsbMf4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwL/onAGgQofa8I2SKXQjCQpn3hRnGDIl/PhP768ey2aW+4mCrb
	SEtIQWH+dq7GgS7OVM5V6+1VoXPJVmxeIbbMC+/VvjIKTUxTQBO07ZSwuI2QnUg=
X-Gm-Gg: ASbGncuNxVx0CnuVRt4CeuemZIfo1ptyIYtEqJG/eB1wOkESNzA8pSTmtoqpo6wK//F
	+/z8r1ah5OTFZUC6AQLOjtiGcip/jH+InHwOhA0i5QWaWjePpUlqbZU0AoiwCMpx52+2YrkCab5
	jEF65G6k2k3tAF2c2LCz6m8Yi6niluyvoFBa5Ucu3sziUzb2L+A8np1FIc+35aU5FVqum1/FMaX
	aEqP3yEc4cn6730N618TfvwpF9JHvxfbICCm+wTooSsumfC/Dfz01BmSl0PZvMQh2u5z1Lzz5eN
	sNU6BmqdRpeL09ddLzgQQBQcNE+0rGyINz1FSyiDcsE=
X-Google-Smtp-Source: AGHT+IHZlXsEPKMLo2zRS60G2WHXFj+ckZOv4p4jkB4sqgQ0nGSrOlorMH5olM9T7Zhs5WwmEyP8Cg==
X-Received: by 2002:a17:906:bf48:b0:ace:4197:9ac5 with SMTP id a640c23a62f3a-ad1906a9acdmr985756166b.27.1746467198490;
        Mon, 05 May 2025 10:46:38 -0700 (PDT)
Received: from blackdock.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1891a311bsm532577666b.54.2025.05.05.10.46.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 10:46:38 -0700 (PDT)
Date: Mon, 5 May 2025 19:46:36 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: "Chen, Yu C" <yu.c.chen@intel.com>
Cc: "Jain, Ayush" <ayushjai@amd.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Ingo Molnar <mingo@redhat.com>, Tejun Heo <tj@kernel.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Jonathan Corbet <corbet@lwn.net>, 
	Mel Gorman <mgormanmgorman@suse.de>, Michal Hocko <mhocko@kernel.org>, 
	Muchun Song <muchun.song@linux.dev>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, "Chen, Tim C" <tim.c.chen@intel.com>, 
	Aubrey Li <aubrey.li@intel.com>, Libo Chen <libo.chen@oracle.com>, cgroups@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	K Prateek Nayak <kprateek.nayak@amd.com>, Madadi Vineeth Reddy <vineethr@linux.ibm.com>, 
	Neeraj.Upadhyay@amd.com, Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH v3] sched/numa: add statistics of numa balance task
 migration
Message-ID: <tkfh4h5ntl42jc2tnwyj6dhiqouf6mowin7euvrnbs2tyiqlay@bpzdptv3plsf>
References: <20250430103623.3349842-1-yu.c.chen@intel.com>
 <8b248ff3-43ae-4e40-9fa4-ba4a04f3c18b@amd.com>
 <bd936eba-e536-4825-ae64-d1bd23c6eb4c@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="22qdon36iehurhxm"
Content-Disposition: inline
In-Reply-To: <bd936eba-e536-4825-ae64-d1bd23c6eb4c@intel.com>


--22qdon36iehurhxm
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3] sched/numa: add statistics of numa balance task
 migration
MIME-Version: 1.0

On Mon, May 05, 2025 at 11:03:10PM +0800, "Chen, Yu C" <yu.c.chen@intel.com=
> wrote:
> According to this address,
>    4c 8b af 50 09 00 00    mov    0x950(%rdi),%r13  <--- r13 =3D p->mm;
>    49 8b bd 98 04 00 00    mov    0x498(%r13),%rdi  <--- p->mm->owner
> It seems that this task to be swapped has NULL mm_struct.

So it's likely a kernel thread. Does it make sense to NUMA balance
those? (I na=EFvely think it doesn't, please correct me.) ...

>  static void __migrate_swap_task(struct task_struct *p, int cpu)
>  {
>         __schedstat_inc(p->stats.numa_task_swapped);
> -       count_memcg_event_mm(p->mm, NUMA_TASK_SWAP);
> +       if (p->mm)
> +               count_memcg_event_mm(p->mm, NUMA_TASK_SWAP);

=2E.. proper fix should likely guard this earlier, like the guard in
task_numa_fault() but for the other swapped task.

Michal

--22qdon36iehurhxm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTd6mfF2PbEZnpdoAkt3Wney77BSQUCaBj5egAKCRAt3Wney77B
SanGAPwNhmE23Z/0QW0JWDF2KTaNoo6f1GDl48W1opF0LxB1lQD+MNowOWLQ/L5v
tgd+J+GBmSPm7cJPRvC8MFMHKdQZTQE=
=EAuC
-----END PGP SIGNATURE-----

--22qdon36iehurhxm--
