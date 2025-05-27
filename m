Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A01F27A465
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 15:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748360030; cv=none; b=nkwqAsgPBuUekNmBdz2WVsInMw30HqRpXfxH5uSDwk4yd1NEbsUZSRBM3hIcn6AajXVIlNp70cZHarGS+ErV0ODIz/OV08E6d/BLLdBmQjYwIQHW3M7PXs0pjOqveTQcRGVkkXyUMQYMbaGN5mjbMSIOYem+z+ch2d4e/GHxKAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748360030; c=relaxed/simple;
	bh=pUd7DfZzmlqHN0NNB09mUP7BK8SoXY62nzf1vSE3s7E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NPX7augtBIsqLGztgVIrNLm2TtIHhBogu+vurXyhOPLocD8cwNI0YX7/0gQvMQfxcHZBTt90nHC2V8lHuuVOYFNTMJ3HlbxiyUqQqW9nluHPEADl1Irw12Y2XrKbPOIwMk+VRtFptI6Y8hemwwF6f9FSR/dnpYUFk/BJ4am71dA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=GvRqbso0; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="GvRqbso0"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so32893255e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 08:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748360024; x=1748964824; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LmlgXGqpqrIy7tTyI3mQkrX7T4nI/G4uqQ549KHgJZo=;
        b=GvRqbso0x+6Dlocg7g5EkuYAXJDMjekjalk6b8/g0NyQol9QOovXGSzvDYacs408NW
         ZH8XIYinFyuNWKZMHzOQvLItsEsFpMzTlcVffKQUjF++o2rgrneJBvOVrhpv37PP7tv5
         7AryA5drGgRvuAIwmJjLlIFmP3tpYgikwpvIXgryZvdFB74ituuKDdz1qE03rRYN4pNU
         sdWMNup6yGMWP4va/cCCeio8GnwNxcEsvqLDVoMJniAp2iZ9czg8l4iwT2YtUUrBsEr/
         t2sKGhEUQYCaXiBd5jH5I68+PzHAkk/D5FJddS7LeCdDRW1RB9rpiK02iBlBaYetSkS7
         ClZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748360024; x=1748964824;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LmlgXGqpqrIy7tTyI3mQkrX7T4nI/G4uqQ549KHgJZo=;
        b=Yvq+4mt5GOnQZqAcC06m/haINmN06n3Za8Zl3hCwWjtqnjRGFU+Uvl3Xrsb5QVYoQD
         a0LoJymO9SGrqRVQoxfDQ0jyqk/ETwjqCPEg8HGdGwgTzYTcdXwCAKLQn2ud8axpbl5t
         Tnom/QPQlop8TN3Ui0gwJ4DkCVGP31J6qVZi+2THSmtMK0L3CC2GSGDU6iD2jA31v8Wl
         KE+VPmo3ZEZ6yDSJf1YyZ8RdLO+hBhq5V3YCuubJrOA7j1Dgs0mmMsW6dZhahgPolJw1
         tCfMK9s6rFwAL6T4jC20K9gkqPZ4gGoe5dbLQymXmWbEXm2IPCq+v2xE0ZMw7Cx9F2xa
         sQ7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXVGF/wNUsp76749CohKENYsfG8qUVSrYSa12sdzKVLEUVFIFMJyRFPfCTiUdXe/JaZhgANEPsA9N0I8Wk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwuRY2E+l/I9XWg93S0onMMXdqkPA2jVjPEeMlPWD8/jJA6+Ehu
	zDJyLw0S9aftfU9pLJFmv+otoqmlaEirNwiPEqcp4n+lg/hQpoYb17jxsQy1XlTTxqI=
X-Gm-Gg: ASbGncvfkfaYVCmdITM3DYh18fJULQzcVDNTj/upoWet+xW7SYmAPhubZTmbK7dm3XD
	47JK8VGZuhabLe5BqdUWYDeRfuWXvld6bBL69bMP7FO1Z5lymHcAX8ArA5hncqU8sX2+LC9hr5/
	6MbH8Dc4v7WDvnxRPRjSUunfLC7oYQo8wi8HAdQIb+22wXo+5sn6KdO41zyoh8j0YrSnClAwi7I
	2BNgXrBGsdbmH7/egDseJLIID/31PF0DJYuhg/crSqvkDIYkzhOOeRAHWnc4U5U0m3YCwcSdZuu
	uyyHz4GMVgec5xdhvyCZCWeH6zJWFObSLv+jyZV+8kvrlcdZ4ZPjlA==
X-Google-Smtp-Source: AGHT+IHKt0NOBvMYJgn6APIMF3kkfWRU8+vp/QiBb8il1/ZsaeQquMYRM6ObbZc3yInz5iWX8R8EdQ==
X-Received: by 2002:a05:600c:4f52:b0:43c:f44c:72b7 with SMTP id 5b1f17b1804b1-44c919e1684mr126409765e9.14.1748360024322;
        Tue, 27 May 2025 08:33:44 -0700 (PDT)
Received: from blackdock.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f3ce483bsm269521165e9.33.2025.05.27.08.33.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 08:33:43 -0700 (PDT)
Date: Tue, 27 May 2025 17:33:41 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Yafang Shao <laoar.shao@gmail.com>
Cc: mingo@redhat.com, peterz@infradead.org, hannes@cmpxchg.org, 
	juri.lelli@redhat.com, vincent.guittot@linaro.org, dietmar.eggemann@arm.com, 
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, 
	surenb@google.com, linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, 
	lkp@intel.com
Subject: Re: [PATCH v9 1/2] sched: Fix cgroup irq time for
 CONFIG_IRQ_TIME_ACCOUNTING
Message-ID: <2e3mby62lswkw454sq4b4wnjmcr6etoug5bazafutb6dbbpozl@juhpci6ebev2>
References: <20250511030800.1900-1-laoar.shao@gmail.com>
 <20250511030800.1900-2-laoar.shao@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qczqavuaridlle2y"
Content-Disposition: inline
In-Reply-To: <20250511030800.1900-2-laoar.shao@gmail.com>


--qczqavuaridlle2y
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v9 1/2] sched: Fix cgroup irq time for
 CONFIG_IRQ_TIME_ACCOUNTING
MIME-Version: 1.0

Hello.

On Sun, May 11, 2025 at 11:07:59AM +0800, Yafang Shao <laoar.shao@gmail.com=
> wrote:
> The CPU usage of the cgroup is relatively low at around 55%, but this usa=
ge
> doesn't increase, even with more netperf tasks. The reason is that CPU0 is
> at 100% utilization, as confirmed by mpstat:
>=20
>   02:56:22 PM  CPU    %usr   %nice    %sys %iowait    %irq   %soft  %stea=
l  %guest  %gnice   %idle
>   02:56:23 PM    0    0.99    0.00   55.45    0.00    0.99   42.57    0.0=
0    0.00    0.00    0.00
>=20
>   02:56:23 PM  CPU    %usr   %nice    %sys %iowait    %irq   %soft  %stea=
l  %guest  %gnice   %idle
>   02:56:24 PM    0    2.00    0.00   55.00    0.00    0.00   43.00    0.0=
0    0.00    0.00    0.00
>=20
> It is clear that the %soft is excluded in the cgroup of the interrupted
> task. This behavior is unexpected. We should include IRQ time in the
> cgroup to reflect the pressure the group is under.

I think this would go against intention of CONFIG_IRQ_TIME_ACCOUNTING
(someony more familiar may chime in).

> After a thorough analysis, I discovered that this change in behavior is d=
ue
> to commit 305e6835e055 ("sched: Do not account irq time to current task"),
> which altered whether IRQ time should be charged to the interrupted task.
> While I agree that a task should not be penalized by random interrupts, t=
he
> task itself cannot progress while interrupted. Therefore, the interrupted
> time should be reported to the user.
>=20
> The system metric in cpuacct.stat is crucial in indicating whether a
> container is under heavy system pressure, including IRQ/softirq activity.
> Hence, IRQ/softirq time should be included in the cpuacct system usage,
> which also applies to cgroup2=E2=80=99s rstat.

So I guess, it'd be better to add a separate entry in cpu.stat with
irq_usec (instead of bundling it into system_usec in spite of
CONFIG_IRQ_TIME_ACCOUNTING).

I admit, I'd be happier if irq.pressure values could be used for
that. Maybe not the PSI ratio itself but irq.pressure:total should be
that amount. WDYT?

Michal

--qczqavuaridlle2y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTd6mfF2PbEZnpdoAkt3Wney77BSQUCaDXbUwAKCRAt3Wney77B
SdzHAQDggVjCe20domlKiUmD2zm7RMq02l4V9ewnZN0a3RRyUwD9EIJAccLt8s9B
2+VlWSHXZZ5ndBYAPS6hmNHv8XbiIwM=
=dMqM
-----END PGP SIGNATURE-----

--qczqavuaridlle2y--
