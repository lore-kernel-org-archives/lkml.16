Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD56231A4D
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 06:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743575137; cv=none; b=f5Ejew1bXFyaNke4ZVzzAwjR9WAeryIfsftHt4JRnMiP7/qHEAUIzi1UNij0gZXub+pysqBPnXSmv4e5SBOTKUbUMlLMTCisTMEmevFE8HLJqfjY/yGANmfz7FKFRXpVqBZ1RbSs2m1AkKul3el5HnBA6kwOc/1BccVGj+DhL7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743575137; c=relaxed/simple;
	bh=qS3MmvHjHM/2z7mJFDfcVaA3rQ3uy+yCmL+TOACiy9o=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Y/QW6yc5NvKv6jr/rQXCdhNFV7X3S+Vq1JSZO/LubFY3+lSCbY6GQYxaW3Pi2r7cZt7WnsyB16ymUmYpqAraX1P+LXkVN7y9tj+jeZi3Lc8PipTV9xz2eYKuVlRhAVCrcquVXlhrkd4LemUBIVXGJHRh/yjcPan5qtrQFry4yzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=i41yHRyo; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="i41yHRyo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743575134;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qvV1YhVY5dvLsPQdy2Zi4rEWCEocbwVNJGT6HPwCUqY=;
	b=i41yHRyoeV3javT4V1B3j9nrMsdNrXzhi8CFI9v9bSnjwVHycMZ8TkmK9wiQyR8zhGyvKS
	x5vw4KQJ77IS/EghN9q4IPGHH1ULPEvrJE8M5tl5/JvvNWCfzfKh5J/BLM/TqmYqt8Q59i
	PJFD7yiX0uUyJ7Fz7amBYCw3CxeyN1E=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-115-RL686TkSN8ai9_xtCmp0RA-1; Wed, 02 Apr 2025 02:25:32 -0400
X-MC-Unique: RL686TkSN8ai9_xtCmp0RA-1
X-Mimecast-MFC-AGG-ID: RL686TkSN8ai9_xtCmp0RA_1743575131
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43941ad86d4so32578195e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 23:25:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743575131; x=1744179931;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qvV1YhVY5dvLsPQdy2Zi4rEWCEocbwVNJGT6HPwCUqY=;
        b=AuOiw3qaBIHgcm/gc64V4EH0KggT7LqYhXBB2XmsHqEbBigzIhR5FsqhKUoCH3ZBXD
         Tx/WfqVMYj5RAkEXh5egeoF5rvJJZ5BfoSRaz6DxSb29auH0HO/W6g2wi/ccUNPzc5+R
         1pcQ510+oOiC5/aUj8++BcLHMDkjE2ylRy0Fk+j9jzmRBpm7iOLSXno9AtpMLpVYQX5b
         uqNsoZTN4PpFMfbETJjBbr7yGGOPToG44G68Cp7mEpUxiQE5Zz2rKqWcfe0GIBMONwBj
         qJEYhGhGKG+29rxyiyVvko5gt87Z95XHZqrkvTJIetIvOpiWcUiA9uBuOthas1mmq4oH
         t4kg==
X-Forwarded-Encrypted: i=1; AJvYcCXlKgKP+X7g/43QYhiyCl7cCnHWlCfhtHMvqAFMQ+eNY57ejy9SqpdkO4SKvo4U8wWXjyl7IxUiUvHTZcw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSCmG40mZxpyk3+4l3MTCpDHpvLb1XLXUJH58RMciuEPUDv4MJ
	sxQP6EAxrAoupYmA5hUPj2WybzqOPC/UX3TJnQE9FmCULonjc2Me0RI9XFlNrQim7Lqvp7YuDjD
	Fg3ODmqEdjcbZrB4HEjlWgoUkes2HzHKk4OWO3Isqk+1e1BqIgzJOZefwPVtj+w==
X-Gm-Gg: ASbGncszaWQW8ST7FER4EvxE6SAEd2yFP7EGfvLCBnKuKXRPKwEPn0CBlHXb6NpykD+
	h+CO8dz+E4YmxoYkGLu5cITHMeCVf0obTPClu7+V533Ji279X1ngr207C6mHCcmKvkI3XyKp2pe
	a8rTXo7Hdl7I7GN+vN245YNVKUebG3UGLLhsEqD8rGiGBdmLrB1sRi0uvXZ5nNVgGifjBewawZJ
	lo0ajPY+uFJuItetWPg2uGv9BSNFaMxk90th/SUhc7PIST9gu80yICWq40NZrq8vasmdMr6yIZq
	Xrscfdgu5p9q0nq5oy6JZqQ0LGrYZd1newZNsKMiDg==
X-Received: by 2002:a05:600c:1e21:b0:43c:ec28:d301 with SMTP id 5b1f17b1804b1-43eb5c70cc3mr10367335e9.26.1743575131359;
        Tue, 01 Apr 2025 23:25:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEPAzxHdlEpnGzGgTqA+vZ1NUCwpIrUUVvSWK/I6PRmRH3CslgeHNanASjsRfkoY169xiAy8Q==
X-Received: by 2002:a05:600c:1e21:b0:43c:ec28:d301 with SMTP id 5b1f17b1804b1-43eb5c70cc3mr10367185e9.26.1743575130954;
        Tue, 01 Apr 2025 23:25:30 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([185.107.56.30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b79e31csm16248786f8f.68.2025.04.01.23.25.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 23:25:30 -0700 (PDT)
Message-ID: <b728fb6ae53531e23ed068c5572b70041abb51dd.camel@redhat.com>
Subject: Re: kernel/trace/rv/rv.c:812:2-8: preceding lock on line 790 (fwd)
From: Gabriele Monaco <gmonaco@redhat.com>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: "Steven Rostedt (Google)" <rostedt@goodmis.org>, 
	linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Date: Wed, 02 Apr 2025 08:25:28 +0200
In-Reply-To: <alpine.DEB.2.22.394.2503302037080.23941@hadrien>
References: <alpine.DEB.2.22.394.2503302037080.23941@hadrien>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sun, 2025-03-30 at 20:37 +0200, Julia Lawall wrote:
> Please check on whether line 812 needs an unlock.
>=20

Hi,

thanks for reporting!
Indeed that needs an unlock, I missed it after moving some code around,
preparing the fix.

Gabriele


> julia
>=20
> ---------- Forwarded message ----------
> Date: Mon, 31 Mar 2025 02:25:17 +0800
> From: kernel test robot <lkp@intel.com>
> To: oe-kbuild@lists.linux.dev
> Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
> Subject: kernel/trace/rv/rv.c:812:2-8: preceding lock on line 790
>=20
> BCC: lkp@intel.com
> CC: oe-kbuild-all@lists.linux.dev
> CC: linux-kernel@vger.kernel.org
> TO: Gabriele Monaco <gmonaco@redhat.com>
> CC: "Steven Rostedt (Google)" <rostedt@goodmis.org>
>=20
> tree:=C2=A0=C2=A0
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git=C2=A0m=
a
> ster
> head:=C2=A0=C2=A0 7f2ff7b6261742ed52aa973ccdf99151b7cc3a50
> commit: cb85c660fcd4b3a03ed993affa0b2d1a8af2f06b rv: Add option for
> nested monitors and include sched
> date:=C2=A0=C2=A0 6 days ago
> :::::: branch date: 17 hours ago
> :::::: commit date: 6 days ago
> config: loongarch-randconfig-r061-20250330
> (https://download.01.org/0day-ci/archive/20250331/202503310200.UBXGit
> B4-lkp@intel.com/config)
> compiler: loongarch64-linux-gcc (GCC) 14.2.0
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new
> version of
> the same patch/commit), kindly add following tags
> > Reported-by: kernel test robot <lkp@intel.com>
> > Reported-by: Julia Lawall <julia.lawall@inria.fr>
> > Closes:
> > https://lore.kernel.org/r/202503310200.UBXGitB4-lkp@intel.com/
>=20
> cocci warnings: (new ones prefixed by >>)
> > > kernel/trace/rv/rv.c:812:2-8: preceding lock on line 790
>=20
> vim +812 kernel/trace/rv/rv.c
>=20
> 102227b970a1525 Daniel Bristot de Oliveira 2022-07-29=C2=A0 771
> 102227b970a1525 Daniel Bristot de Oliveira 2022-07-29=C2=A0 772=C2=A0 /**
> 102227b970a1525 Daniel Bristot de Oliveira 2022-07-29=C2=A0 773=C2=A0=C2=
=A0 *
> rv_register_monitor - register a rv monitor.
> 102227b970a1525 Daniel Bristot de Oliveira 2022-07-29=C2=A0 774=C2=A0=C2=
=A0 *
> @monitor:=C2=A0=C2=A0=C2=A0 The rv_monitor to be registered.
> cb85c660fcd4b3a Gabriele Monaco=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 2025-03-05=C2=A0 775=C2=A0=C2=A0 *
> @parent:=C2=A0=C2=A0=C2=A0=C2=A0 The parent of the monitor to be register=
ed, NULL if not
> nested.
> 102227b970a1525 Daniel Bristot de Oliveira 2022-07-29=C2=A0 776=C2=A0=C2=
=A0 *
> 102227b970a1525 Daniel Bristot de Oliveira 2022-07-29=C2=A0 777=C2=A0=C2=
=A0 *
> Returns 0 if successful, error otherwise.
> 102227b970a1525 Daniel Bristot de Oliveira 2022-07-29=C2=A0 778=C2=A0=C2=
=A0 */
> cb85c660fcd4b3a Gabriele Monaco=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 2025-03-05=C2=A0 779=C2=A0 int
> rv_register_monitor(struct rv_monitor *monitor, struct rv_monitor
> *parent)
> 102227b970a1525 Daniel Bristot de Oliveira 2022-07-29=C2=A0 780=C2=A0 {
> cb85c660fcd4b3a Gabriele Monaco=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 2025-03-05=C2=A0
> 781=C2=A0=C2=A0	struct rv_monitor_def *r, *p =3D NULL;
> 102227b970a1525 Daniel Bristot de Oliveira 2022-07-29=C2=A0 782=C2=A0=C2=
=A0	int
> retval =3D 0;
> 102227b970a1525 Daniel Bristot de Oliveira 2022-07-29=C2=A0 783
> 102227b970a1525 Daniel Bristot de Oliveira 2022-07-29=C2=A0 784=C2=A0=C2=
=A0	if
> (strlen(monitor->name) >=3D MAX_RV_MONITOR_NAME_SIZE) {
> 102227b970a1525 Daniel Bristot de Oliveira 2022-07-29=C2=A0
> 785=C2=A0=C2=A0		pr_info("Monitor %s has a name longer than %d\n", monito=
r->name,
> 102227b970a1525 Daniel Bristot de Oliveira 2022-07-29=C2=A0
> 786=C2=A0=C2=A0			MAX_RV_MONITOR_NAME_SIZE);
> cb85c660fcd4b3a Gabriele Monaco=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 2025-03-05=C2=A0
> 787=C2=A0=C2=A0		return -EINVAL;
> 102227b970a1525 Daniel Bristot de Oliveira 2022-07-29=C2=A0 788=C2=A0=C2=
=A0	}
> 102227b970a1525 Daniel Bristot de Oliveira 2022-07-29=C2=A0 789
> 102227b970a1525 Daniel Bristot de Oliveira 2022-07-29
> @790=C2=A0=C2=A0	mutex_lock(&rv_interface_lock);
> 102227b970a1525 Daniel Bristot de Oliveira 2022-07-29=C2=A0 791
> 102227b970a1525 Daniel Bristot de Oliveira 2022-07-29=C2=A0
> 792=C2=A0=C2=A0	list_for_each_entry(r, &rv_monitors_list, list) {
> 102227b970a1525 Daniel Bristot de Oliveira 2022-07-29=C2=A0
> 793=C2=A0=C2=A0		if (strcmp(monitor->name, r->monitor->name) =3D=3D 0) {
> 102227b970a1525 Daniel Bristot de Oliveira 2022-07-29=C2=A0
> 794=C2=A0=C2=A0			pr_info("Monitor %s is already registered\n", monitor->=
name);
> cb85c660fcd4b3a Gabriele Monaco=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 2025-03-05=C2=A0
> 795=C2=A0=C2=A0			retval =3D -EEXIST;
> 102227b970a1525 Daniel Bristot de Oliveira 2022-07-29=C2=A0
> 796=C2=A0=C2=A0			goto out_unlock;
> 102227b970a1525 Daniel Bristot de Oliveira 2022-07-29=C2=A0
> 797=C2=A0=C2=A0		}
> 102227b970a1525 Daniel Bristot de Oliveira 2022-07-29=C2=A0 798=C2=A0=C2=
=A0	}
> 102227b970a1525 Daniel Bristot de Oliveira 2022-07-29=C2=A0 799
> cb85c660fcd4b3a Gabriele Monaco=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 2025-03-05=C2=A0 800=C2=A0=C2=A0	if
> (parent) {
> cb85c660fcd4b3a Gabriele Monaco=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 2025-03-05=C2=A0
> 801=C2=A0=C2=A0		list_for_each_entry(r, &rv_monitors_list, list) {
> cb85c660fcd4b3a Gabriele Monaco=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 2025-03-05=C2=A0
> 802=C2=A0=C2=A0			if (strcmp(parent->name, r->monitor->name) =3D=3D 0) {
> cb85c660fcd4b3a Gabriele Monaco=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 2025-03-05=C2=A0
> 803=C2=A0=C2=A0				p =3D r;
> cb85c660fcd4b3a Gabriele Monaco=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 2025-03-05=C2=A0
> 804=C2=A0=C2=A0				break;
> cb85c660fcd4b3a Gabriele Monaco=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 2025-03-05=C2=A0
> 805=C2=A0=C2=A0			}
> cb85c660fcd4b3a Gabriele Monaco=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 2025-03-05=C2=A0
> 806=C2=A0=C2=A0		}
> cb85c660fcd4b3a Gabriele Monaco=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 2025-03-05=C2=A0 807=C2=A0=C2=A0	}
> cb85c660fcd4b3a Gabriele Monaco=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 2025-03-05=C2=A0 808
> cb85c660fcd4b3a Gabriele Monaco=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 2025-03-05=C2=A0 809=C2=A0=C2=A0	if
> (p && rv_is_nested_monitor(p)) {
> cb85c660fcd4b3a Gabriele Monaco=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 2025-03-05=C2=A0
> 810=C2=A0=C2=A0		pr_info("Parent monitor %s is already nested, cannot nes=
t further\n",
> cb85c660fcd4b3a Gabriele Monaco=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 2025-03-05=C2=A0
> 811=C2=A0=C2=A0			parent->name);
> cb85c660fcd4b3a Gabriele Monaco=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 2025-03-05
> @812=C2=A0=C2=A0		return -EINVAL;
> cb85c660fcd4b3a Gabriele Monaco=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 2025-03-05=C2=A0 813=C2=A0=C2=A0	}
> cb85c660fcd4b3a Gabriele Monaco=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 2025-03-05=C2=A0 814
> 102227b970a1525 Daniel Bristot de Oliveira 2022-07-29=C2=A0 815=C2=A0=C2=
=A0	r =3D
> kzalloc(sizeof(struct rv_monitor_def), GFP_KERNEL);
> 102227b970a1525 Daniel Bristot de Oliveira 2022-07-29=C2=A0 816=C2=A0=C2=
=A0	if
> (!r) {
> 102227b970a1525 Daniel Bristot de Oliveira 2022-07-29=C2=A0
> 817=C2=A0=C2=A0		retval =3D -ENOMEM;
> 102227b970a1525 Daniel Bristot de Oliveira 2022-07-29=C2=A0
> 818=C2=A0=C2=A0		goto out_unlock;
> 102227b970a1525 Daniel Bristot de Oliveira 2022-07-29=C2=A0 819=C2=A0=C2=
=A0	}
> 102227b970a1525 Daniel Bristot de Oliveira 2022-07-29=C2=A0 820
> 102227b970a1525 Daniel Bristot de Oliveira 2022-07-29=C2=A0 821=C2=A0=C2=
=A0	r-
> >monitor =3D monitor;
> cb85c660fcd4b3a Gabriele Monaco=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 2025-03-05=C2=A0 822=C2=A0=C2=A0	r-
> >parent =3D parent;
> 102227b970a1525 Daniel Bristot de Oliveira 2022-07-29=C2=A0 823
> cb85c660fcd4b3a Gabriele Monaco=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 2025-03-05=C2=A0
> 824=C2=A0=C2=A0	retval =3D create_monitor_dir(r, p);
> 102227b970a1525 Daniel Bristot de Oliveira 2022-07-29=C2=A0 825=C2=A0=C2=
=A0	if
> (retval) {
> 102227b970a1525 Daniel Bristot de Oliveira 2022-07-29=C2=A0
> 826=C2=A0=C2=A0		kfree(r);
> 102227b970a1525 Daniel Bristot de Oliveira 2022-07-29=C2=A0
> 827=C2=A0=C2=A0		goto out_unlock;
> 102227b970a1525 Daniel Bristot de Oliveira 2022-07-29=C2=A0 828=C2=A0=C2=
=A0	}
> 102227b970a1525 Daniel Bristot de Oliveira 2022-07-29=C2=A0 829
> cb85c660fcd4b3a Gabriele Monaco=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 2025-03-05=C2=A0 830=C2=A0=C2=A0	/*
> keep children close to the parent for easier visualisation */
> cb85c660fcd4b3a Gabriele Monaco=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 2025-03-05=C2=A0 831=C2=A0=C2=A0	if
> (p)
> cb85c660fcd4b3a Gabriele Monaco=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 2025-03-05=C2=A0
> 832=C2=A0=C2=A0		list_add(&r->list, &p->list);
> cb85c660fcd4b3a Gabriele Monaco=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 2025-03-05=C2=A0 833=C2=A0=C2=A0	else
> 102227b970a1525 Daniel Bristot de Oliveira 2022-07-29=C2=A0
> 834=C2=A0=C2=A0		list_add_tail(&r->list, &rv_monitors_list);
> 102227b970a1525 Daniel Bristot de Oliveira 2022-07-29=C2=A0 835
> 102227b970a1525 Daniel Bristot de Oliveira 2022-07-29=C2=A0 836=C2=A0
> out_unlock:
> 102227b970a1525 Daniel Bristot de Oliveira 2022-07-29=C2=A0
> 837=C2=A0=C2=A0	mutex_unlock(&rv_interface_lock);
> 102227b970a1525 Daniel Bristot de Oliveira 2022-07-29=C2=A0
> 838=C2=A0=C2=A0	return retval;
> 102227b970a1525 Daniel Bristot de Oliveira 2022-07-29=C2=A0 839=C2=A0 }
> 102227b970a1525 Daniel Bristot de Oliveira 2022-07-29=C2=A0 840
>=20

