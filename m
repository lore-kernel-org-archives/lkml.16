Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 959E3198823
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 19:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738957928; cv=none; b=qHkIsZ3O1iQc2pT1MjZ1D62+CaEkcfDIs6Hv11rH1zAQVt6/O5qjZA3W+eaj4GeutaGGFHeaTyjGaSVYSSGucjfwQTYbCspyiNjQTEEPqcHwMkU61f8EZq+8DB8QuzV0f6oT+8Bge7uBgXql77hQMh/ut6Ra605I369hkZ/CQGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738957928; c=relaxed/simple;
	bh=uj+w+qweNen5vdOG/acsALXoJZFxNGoGcPpblwN8/vc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=duTOoD2GXPdr4IoO9x03rdIk9UbA/cEAb5h2Wmk2FUIGXhy3e4D3xODOvRoHa0W07v57KbtRbaACGsqOeVG/gVNALNyO9OKaPLaFGZgMRD8H77p2HPX8HOyD0/qLhE1uYRgWaiF6FmNeq6pC6cz3zMOmM3ZpgaiHdNg9IYh2Mwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ibJ6YFCI; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ibJ6YFCI"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ab7917fc0c2so130224466b.0
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 11:52:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738957925; x=1739562725; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=keLo2wpOh9lWmNzWyPyJnra8Q4vBk1oRCRMn1xCXayc=;
        b=ibJ6YFCIi6fRWoP30+4Pau06tD4535/fEZNqVEr7iJ1/xSTSLmT9z2hywB4CCsMfGJ
         Ds+7M7+rP10dMWnT7IU007gkPj61RFvJzedDITnDRb+b9iEFguQeGGS1xH8wdohL2+qE
         2OWhmOu1ZDz+VnnPJ8brh/eLR8OgTnfaRI5F57Q402ujFtXWlkN7Dq4Y5IuVO8z8D32X
         q3724M2Txt0R0W/UoOYWgwWjZenoHmMrFx8PSp5QK18V43ICfiB05QIqVe6grxtkwJHp
         OcCjDKQDOrVQf8EU352sbYpTPovV+tJ33H40HYZlz+ALccBWhkbmoCHQB/PSpqXad8kJ
         BmKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738957925; x=1739562725;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=keLo2wpOh9lWmNzWyPyJnra8Q4vBk1oRCRMn1xCXayc=;
        b=NZiBP3zeuD2pT23c+rVqRTTznVJaUbYH+ZOdMaCVOuMoUzINwB+kxC7C6toBoWUPvy
         0mokYNwfNbuiZunCloe19ir6O3HzrkCooCvl/Ga2NsszPaZ/8sjftI1Z/hOCSH1V3oGN
         qvvxH+W8JL5xB3nIYKdmKZcrkakRDNwKsn9lyT4GpqwVWYixZvbLLev+LxdfguOtY9+6
         Mst78jxXV/mMY+w6RRtFk5OgRtLeN7FyEZNKEVEZaR/cyRU4Oyi22RJehIzHt1aU4ZX/
         4ldXonPg+xQ83VlO2GxtrFIbPYTgh2WyD0sD8Cs5SOFEcRGwLRJJBeWsJq1foSze2/pt
         jE0w==
X-Forwarded-Encrypted: i=1; AJvYcCVU1vgd2zYKLeJimGnvQddUZXIBGLg6M/ixc+Rar0hnslB+/w0iYpMhJmEEcWzDIfJJCDibIC7hAftIqWk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRKQgPEr4YGfaND27qheMVeHj8HVV6XOIse5RLv8TMa4KMoUlD
	1isgHuCvAEMlO6rAZ593p+8Em2BWipbcKaqFgkKMB/qKLoLC8tBun8tT0J4W5NOcpla3iwnlXEo
	YiuFKJeBugwgSWYeCcHxawy9C7X4=
X-Gm-Gg: ASbGncszousk9tzW/FG5y2FDKVFPBtmTdo8LnUbD1sSg5qntIpitvOZmf0SCdTbN/34
	0+cuYK4T9uHZjvcxcM+t+heGBMzeOQCpWgm6hyDjxeIm1YnUki/H8bNxi5dMUFF+PlVHL7k3L
X-Google-Smtp-Source: AGHT+IHpzaRddZ+PPABkNWGPjSsZrZcy6igoVBIF7a/dq6b6n1q4tSl39D8rGI4lx0V+a4VBriFpa48cj1CCp6kpWx8=
X-Received: by 2002:a17:907:7b81:b0:ab6:8537:60d6 with SMTP id
 a640c23a62f3a-ab789b29dfamr448250466b.7.1738957922992; Fri, 07 Feb 2025
 11:52:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250205200929.406568-1-mjguzik@gmail.com> <20250205200929.406568-5-mjguzik@gmail.com>
 <dfdae203-d057-41b1-a437-ba7c31961059@sirena.org.uk>
In-Reply-To: <dfdae203-d057-41b1-a437-ba7c31961059@sirena.org.uk>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Fri, 7 Feb 2025 20:51:51 +0100
X-Gm-Features: AWEUYZlELocH-db9u8RuxRqcHGIJr3xu2ynXdCf_9Sg4jXl-VQqQx-qeZUiz5BM
Message-ID: <CAGudoHEspz6Xj+E5up62xbi_1272nF8V2dCzrYLJMw5QC-T2ug@mail.gmail.com>
Subject: Re: [PATCH v5 4/5] pid: perform free_pid() calls outside of tasklist_lock
To: Mark Brown <broonie@kernel.org>
Cc: ebiederm@xmission.com, oleg@redhat.com, brauner@kernel.org, 
	akpm@linux-foundation.org, Liam.Howlett@oracle.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Aishwarya.TCV@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

... and found

next-20250207 is somehow missing a call to free_pids() in release_task().

There was some fat-fingering in v5 and maybe previous versions which
made the call land in the wrong commit, I presume there was further
crappery elsewhere which concluded in the call not being present to
begin with.

I just confirmed the version is is intended to land has the call in
the right place:
https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git/commit/?h=3Dker=
nel-6.15.tasklist_lock&id=3D7903f907a226058ed99f86e9924e082aea57fc45

As in this chunk fell out in -next:
diff --git a/kernel/exit.c b/kernel/exit.c
index b4fc3cc96ea4..0d6df671c8a8 100644
--- a/kernel/exit.c
+++ b/kernel/exit.c
@@ -289,6 +289,7 @@ void release_task(struct task_struct *p)
        put_pid(thread_pid);
        add_device_randomness(&p->se.sum_exec_runtime,
                              sizeof(p->se.sum_exec_runtime));
+       free_pids(post.pids);
        release_thread(p);
        put_task_struct_rcu_user(p);

On Fri, Feb 7, 2025 at 7:31=E2=80=AFPM Mark Brown <broonie@kernel.org> wrot=
e:
>
> On Wed, Feb 05, 2025 at 09:09:28PM +0100, Mateusz Guzik wrote:
> > As the clone side already executes pid allocation with only pidmap_lock
> > held, issuing free_pid() while still holding tasklist_lock exacerbates
> > total hold time of the latter.
> >
> > The pid array is smuggled through newly added release_task_post struct
> > so that any extra things want to get moved out have means to do it.
>
> We are seeing failures in -next with the clone3 clone3_set_tid selftest
> on at least arm and arm64 systems which have been bisected to this
> commit, in -next as 88dec855ce117f52bcf88748ddcbb25b10f4f2fc (same
> bisect for both):
>
> For arm64 we're seeing a bunch of new failures including:
>
> # # [389] Trying clone3() with CLONE_SET_TID to 391 and 0x0
> # # File exists - Failed to create new process
> # # [389] clone3() with CLONE_SET_TID 391 says: -17 - expected 0
> # not ok 19 reallocate child TID with 1 TIDs and flags 0x0
>
> # # [389] Trying clone3() with CLONE_SET_TID to 1 and 0x20000000
> # # File exists - Failed to create new process
> # # [389] clone3() with CLONE_SET_TID 1 says: -17 - expected 0
> # not ok 21 create PID 1 in new NS with 2 TIDs and flags 0x20000000
>
> # # [1] Trying clone3() with CLONE_SET_TID to 43 and 0x0
> # # File exists - Failed to create new process
> # # [1] clone3() with CLONE_SET_TID 43 says: -17 - expected 0
> # not ok 24 check leak on invalid specific TID with 2 TIDs and flags 0x0
>
> but there's more, 32 bit only seems to see one new failure (at least on
> Beaglebone Black which is where I have that test running).
>
> Full log for a run on arm64:
>
>    https://lava.sirena.org.uk/scheduler/job/1102114
>
> and arm:
>
>    https://lava.sirena.org.uk/scheduler/job/1102088
>
> Bisect log, the start is my tooling feeding in test results it already
> has to hand in the commit range to seed the bisect:
>
> # bad: [ed58d103e6da15a442ff87567898768dc3a66987] Add linux-next specific=
 files for 20250207
> # good: [653cd79f296fc6fa592cb9fa2f7b8494d5573a43] Merge branch 'for-linu=
x-next-fixes' of https://gitlab.freedesktop.org/drm/misc/kernel.git
> # good: [4c7518062d638837cea915e0ffe30f846780639a] ASoC: SOF: ipc4: Add s=
upport for split firmware releases
> # good: [0a7c85b516830c0bb088b0bdb2f2c50c76fc531a] regulator: ad5398: Fix=
 incorrect power down bit mask
> # good: [215705db51eb23052c73126d2efb6acbc2db0424] spi: Replace custom fs=
leep() implementation
> # good: [6603c5133daadbb3277fbd93be0d0d5b8ec928e8] ASoC: dt-bindings: atm=
el,at91-ssc: Convert to YAML format
> # good: [25fac20edd09b60651eabcc57c187b1277f43d08] spi: gpio: Support a s=
ingle always-selected device
> # good: [652ffad172d089acb1a20e5fde1b66e687832b06] spi: fsi: Batch TX ope=
rations
> # good: [6eab7034579917f207ca6d8e3f4e11e85e0ab7d5] ASoC: soc-core: Stop u=
sing of_property_read_bool() for non-boolean properties
> # good: [f5aab0438ef17f01c5ecd25e61ae6a03f82a4586] regulator: pca9450: Fi=
x enable register for LDO5
> # good: [c1ac98492d1584d31f335d233a5cd7a4d4116e5a] spi: realtek-rtl-snand=
: Drop unneeded assignment for cache_type
> # good: [5a6a461079decea452fdcae955bccecf92e07e97] regulator: ad5398: Add=
 device tree support
> # good: [995cf0e014b0144edf1125668a97c252c5ab775e] regmap: Reorder 'struc=
t regmap'
> # good: [89785306453ce6d949e783f6936821a0b7649ee2] spi: zynqmp-gqspi: Alw=
ays acknowledge interrupts
> # good: [0e11f2076e7fa3efa3e0a694bc4d30ef185f0f7d] Merge branch 'for-5.19=
/cleanup' into for-next
> git bisect start 'ed58d103e6da15a442ff87567898768dc3a66987' '653cd79f296f=
c6fa592cb9fa2f7b8494d5573a43' '4c7518062d638837cea915e0ffe30f846780639a' '0=
a7c85b516830c0bb088b0bdb2f2c50c76fc531a' '215705db51eb23052c73126d2efb6acbc=
2db0424' '6603c5133daadbb3277fbd93be0d0d5b8ec928e8' '25fac20edd09b60651eabc=
c57c187b1277f43d08' '652ffad172d089acb1a20e5fde1b66e687832b06' '6eab7034579=
917f207ca6d8e3f4e11e85e0ab7d5' 'f5aab0438ef17f01c5ecd25e61ae6a03f82a4586' '=
c1ac98492d1584d31f335d233a5cd7a4d4116e5a' '5a6a461079decea452fdcae955bccecf=
92e07e97' '995cf0e014b0144edf1125668a97c252c5ab775e' '89785306453ce6d949e78=
3f6936821a0b7649ee2' '0e11f2076e7fa3efa3e0a694bc4d30ef185f0f7d'
> # bad: [ed58d103e6da15a442ff87567898768dc3a66987] Add linux-next specific=
 files for 20250207
> git bisect bad ed58d103e6da15a442ff87567898768dc3a66987
> # bad: [5a44f71c6ba5b0a7623c25047ac61ed852afbd84] Merge branch 'for-linux=
-next' of git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.=
git
> git bisect bad 5a44f71c6ba5b0a7623c25047ac61ed852afbd84
> # bad: [953e43d94b2048d260774e9ddbfd3f378aa2c256] Merge branch 'fs-next' =
of linux-next
> git bisect bad 953e43d94b2048d260774e9ddbfd3f378aa2c256
> # good: [2ab7baf7ebddff9faff6846648fd0753e5ee58c1] Merge branch 'for-next=
' of git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git
> git bisect good 2ab7baf7ebddff9faff6846648fd0753e5ee58c1
> # good: [09c7fd0d4465df7fd6cda5668bd32267884b6cbf] Merge branch '9p-next'=
 of git://github.com/martinetd/linux
> git bisect good 09c7fd0d4465df7fd6cda5668bd32267884b6cbf
> # bad: [7a1f00b09c09aadbf33660a31f3f3d8ee6302c45] Merge branch 'vfs-6.15.=
iomap' into vfs.all
> git bisect bad 7a1f00b09c09aadbf33660a31f3f3d8ee6302c45
> # good: [9bc19073026d0dce6b7d17d22e74643c80283f8f] Merge branch 'vfs-6.15=
.mount' into vfs.all
> git bisect good 9bc19073026d0dce6b7d17d22e74643c80283f8f
> # bad: [ba734a751d30f59e3b10d6792a1e1b50e7b1fc0c] Merge branch 'kernel-6.=
15.tasklist_lock' into vfs.all
> git bisect bad ba734a751d30f59e3b10d6792a1e1b50e7b1fc0c
> # good: [d7c340391cb0f0882bc8d5d9798ef32b577a89bc] Merge branch 'vfs-6.15=
.pipe' into vfs.all
> git bisect good d7c340391cb0f0882bc8d5d9798ef32b577a89bc
> # good: [e88fed94388f62a28acfef4954348abe79557d19] pid: sprinkle tasklist=
_lock asserts
> git bisect good e88fed94388f62a28acfef4954348abe79557d19
> # bad: [5ca27e0557d722dd648f949dde6e4997f6255f18] pid: drop irq disableme=
nt around pidmap_lock
> git bisect bad 5ca27e0557d722dd648f949dde6e4997f6255f18
> # bad: [88dec855ce117f52bcf88748ddcbb25b10f4f2fc] pid: perform free_pid()=
 calls outside of tasklist_lock
> git bisect bad 88dec855ce117f52bcf88748ddcbb25b10f4f2fc
> # first bad commit: [88dec855ce117f52bcf88748ddcbb25b10f4f2fc] pid: perfo=
rm free_pid() calls outside of tasklist_lock



--=20
Mateusz Guzik <mjguzik gmail.com>
