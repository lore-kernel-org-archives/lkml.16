Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BDB323C8CB
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 19:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738957534; cv=none; b=Z54iasZWIid6patB19B58YXQhvRkZklg3sIXl8UNjqtAD+4SkIfyrWSUMredefI3XPmsVlzqX3ibEcAuw7yt1flvusmKUwiIzYVoAStDgOz9DXl5S53gDGkRp9lwNQE0o1My4M1o2gF+w6hqXqceAu7USTR1RtoDpj/Kn3f3vsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738957534; c=relaxed/simple;
	bh=IjeKMSBBJD9koKjRi7MsUk+uV50uG+IpoD6V1cSt+Ik=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E0rl9TRwQxZs9xQEEGf7SscnoJsAx9uhIqqJgF1FiwswpmHCERy6UlgkDj7tzCIqXJ+xUwxwILgbQNtF8aW3LatTfynKsGW6hy0SwM6TS+FhZ8SaQhDhO9uYWJA2QuAhTih+WW2VBVxTJt000ociOgHAQq2equkIiZ0lq/namGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f123uI2W; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f123uI2W"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5de51a735acso1242373a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 11:45:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738957531; x=1739562331; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dl+o0D2PPAJNSWAMlZvIeA5j8rLr9zSA+Ym2y6pe7mo=;
        b=f123uI2W3/LcWpp+uh/n8+PDqAQeWRIz3TegeEXUJKqsPZEZE2nCUtGShwAoUCDTGY
         e9kbgDJX479a6WXKI6KJA8G7mAS0favuzUiOhOULv8wBqWCgv7Z8bHFRjXTHpniVx6KV
         mlH36tet74ZPib/LbiW/Yfg/4refvfsij/qvWVkdiTUctTsgE0b27yOSo7ka/96dJG87
         Q0hfWKYJw1iqrnEGTVAjTpYBKy0xH8mDCaquNVrWtjg/gSOYQvBEVHqooEZHdMBDgG4w
         XNQjDc/RU2toGEQT+q56SuSw+edp4xFF0XV4hib4t3abvmiBcsvMddY6iifH3zpQzDrU
         JO+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738957531; x=1739562331;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dl+o0D2PPAJNSWAMlZvIeA5j8rLr9zSA+Ym2y6pe7mo=;
        b=Wu+WyIynHR/IF8f6XUMSTi3SAYNqRwzo1MBXuOd+lu2zT1E9tY+YJdjIrHE5vEMC8Z
         mcDBzFC8vr9EDn7Pw9AKRl3i8gjWBorOmUCzT1aZrGFAnO1mICrgsANA7aU+ka62P/O4
         nrH1uuyvizga0ooTOBRVviaybk0eAUDYFeB1q3ZfnLRV2ykSprUix9MLCPFdUchvIAbA
         mzaD6jILsY03MVD+6TKJk4qwUAcdXVo9HX0+ncbL0dwY31a/iE0ZNxNNwwD5nHtjPJqL
         1kbZ9b1VuEkNn9Bu9ckcPasRcp22OklbYZz6ITzKTh/rq7TokrmcksBWnfW60vvWOeCg
         DEjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHAb0l+lBt/UTfDxmsDhVRn6iOv+Ocn0NEU4eH2ETQ+buNmeJcLYYIutklQXS3LGEIrWXg5EqjB5KfN9A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9oi0RTLxndNIzpUO9+MtZeJOEpAEcGECOmtd8Dei6VYYSoxNQ
	gSH4FLA9lzCJeNqeGziHlmu9D/6StLEN75V9nzx9KzikINqkpETCmsuDytjy5Ej5hh/xHkkUOmZ
	L3UYlw7Qpim7Ksw343+GK+adsHBE=
X-Gm-Gg: ASbGncsMFThTiyLgl2ZTZJxfnLQ7/17ZqrO1lwwxwNqmzS5jQ9Bi+4+of6+CRVWGCrI
	dCTLiIDbsIsiOOk1HdApDWD4+I2gZE3/8uidDKwVmI70O5Ge6mehfYtXERSZUGXhu3SrIhm3+
X-Google-Smtp-Source: AGHT+IGuvBL/HjmUagbLIPO90yptaPxRPD4VPEF+pqH2y9a3gQRqckD0bwL6fdbznTHex/lq/1WQ2djPRMHuVuaCdPE=
X-Received: by 2002:a05:6402:13c5:b0:5db:e7eb:1b4a with SMTP id
 4fb4d7f45d1cf-5de45005a3bmr5409817a12.10.1738957530567; Fri, 07 Feb 2025
 11:45:30 -0800 (PST)
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
Date: Fri, 7 Feb 2025 20:45:18 +0100
X-Gm-Features: AWEUYZnp44jxQbuZ3GApkGfY582alad7VLfkZ6hcruNUjjq172_UjAeCGAYHqP0
Message-ID: <CAGudoHEfhxJmJQ688CE_2rR92BtoU7JRzr78cEcx4r02POCk6w@mail.gmail.com>
Subject: Re: [PATCH v5 4/5] pid: perform free_pid() calls outside of tasklist_lock
To: Mark Brown <broonie@kernel.org>
Cc: ebiederm@xmission.com, oleg@redhat.com, brauner@kernel.org, 
	akpm@linux-foundation.org, Liam.Howlett@oracle.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Aishwarya.TCV@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

thanks for the report, i'll prod it over the weekend

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
