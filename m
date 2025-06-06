Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E80A23A98D
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 23:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749251071; cv=none; b=l+VB2eof837aYrMrUY5VsoFS6ShIIEIEqAuTDArnXezdCq3rbev07bLOK23Dm/m0lxRjrzgte2yGTPqwlky1YCwsz6ZKpuJKAh8IihTJC3ZSf9D6x7gyv55Xcc3DHEz6FQkz7BsxwfrpT2VRd74zOyKld++5qCP6QS2uFW3PYAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749251071; c=relaxed/simple;
	bh=4X7+R7jwq77/ubtkj7/N31xao0hfvdEgbePF/+mSQrg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rHIDhMm6tcTW4ZEh3Uo38q7tZPgEoT0+pu9XG+e/l9WY7EDAvAAo1sWsKF/BDYK1h6+eSDCZ7dv7Xao8sZ2YINU68jBfjyCmQljQr5Qrf4WQKJQAb3VF+8w8Z1p51E5vGkbjqgeb7oWtOVywNFfMUf9nc0R4EDPTrkxDV/pmmW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dubeyko.com; spf=pass smtp.mailfrom=dubeyko.com; dkim=pass (2048-bit key) header.d=dubeyko-com.20230601.gappssmtp.com header.i=@dubeyko-com.20230601.gappssmtp.com header.b=q1ildbes; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dubeyko-com.20230601.gappssmtp.com header.i=@dubeyko-com.20230601.gappssmtp.com header.b="q1ildbes"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-235f9ea8d08so19186185ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 16:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dubeyko-com.20230601.gappssmtp.com; s=20230601; t=1749251069; x=1749855869; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=++XM+L+lyfF5/P8LN+hWODPGqYMWkpCaCgDaYnM3pxo=;
        b=q1ildbesg99UFLeQeGMNKqs3NUUJQWbAjvzy1zJUTQEKb1d7zndX61MqCmWFGawRSi
         4k5RzofvVL1tHGiUqH60gBD+xwRd+9KhR2WikeWmnH6GMCK/FsLOhcnEDuwevUUmyRSD
         /fGO2X603KwmRWZRWXZbvK7LVwNqhfSyglvk9F9/tHS43CHTXMq+h0Z4589TjiI4lhH+
         6ihgUQ3SfEjX8ML7pqrHqzgitt81IVpYpdR981pmDb7Fv+MhumjVSDoGJDhON6y9AWdo
         QKIiWfNaUIHgoqXx8VyZKnXoCDgX2vojshWDiLm2gIeb8DfPjSmgwRF0igjj3O7VRq/h
         vRkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749251069; x=1749855869;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=++XM+L+lyfF5/P8LN+hWODPGqYMWkpCaCgDaYnM3pxo=;
        b=ckmC9ncDAWN7uoTpZVIa8t5xB5jEUXREHJxE7tRi+I3LlRJK3/vh4R2lBmo/AJ15dp
         cfC2YYIhw1XKpClbTp2/6FIGOCbT9YxMJniZwT85EmZQXe94ihsRkl4rU876v9Znc0I9
         YQue9/3FzOMR0+u6LpU3J0jUxHKBNpkFcdtBr8t2rRcLr9y1zmFG9FfXaRFEWH41vg0B
         d5XNFZCxlhUEM+20AIdAN4L/ghooVIjNklAzyzhR14H3mT7Jejsc1+rK3syG12D5RZNA
         GXiykKSoSfAq3fBLehsRFYF+WpLYniE3pF4VjMTmxYBU3V+4LkrZ+MqzsgGT7xrcXiWm
         +GYA==
X-Forwarded-Encrypted: i=1; AJvYcCVtZF8Gn4a+1JGNH5ChBvvjKmQf3IJoLkXHr7GSJYpUvC9yQzDa5Vh/N72T+ECio3Pf9g693cNf7wi6NDY=@vger.kernel.org
X-Gm-Message-State: AOJu0YysAeciRGhlFD6Ym9hhUeFvUUrY3HK78Ero6xAkM+3YkS8FNlPK
	3FB50ZvlLrT/XiRUF/T+t9EESkEtz4aMO16+OZ0yRaAHvOyKpPvZKiVy3dlw5gYU7xs=
X-Gm-Gg: ASbGncvHZm+S7T5ad0Fi+ZQyD8BbHqmoOHvxL+i8iQo0969V0rO/AqhYFg5w95XG4PB
	S6iOL3lFPl21EQdjHJHooxwBk7krXIf2i0Rt34L3fOXj23hNEenGA1MItbmIBYnYbXjaVKTOuOn
	Hm+HKFT+GETw1Q0RJE0s05DEA84QBngms1wlEPHQq7T8TTDRtXCI2pmpGr0ICmxulgpl/bDEtr3
	geNzVCjXo4t4oA269hfKudDMPhHIXfq9+TByoPyOh+Nvk0mtgFsdzPAoWdGscr2zIG+VXkvyPMK
	w2D38E0eL2YFA547KNfHMNoNoE8W472iKtFsFh5j+oGZi0W8qr4GuBTRhIe2aZ+hxaQJegfwVpQ
	t/ee8TTgEps5JqC5xOHh1fu5rcf4aY4SKqnIOqNbbpQ==
X-Google-Smtp-Source: AGHT+IErrEOX3SQ4qNWG/f8KC6Mxs0KmkBlsimkRf9M34lhQh/x1x3Q9dDuaUnHkI2JzMeKaRWL8Ww==
X-Received: by 2002:a17:902:f54a:b0:234:d679:72e3 with SMTP id d9443c01a7336-23601ec4b8bmr62952805ad.42.1749251068694;
        Fri, 06 Jun 2025 16:04:28 -0700 (PDT)
Received: from ?IPv6:2600:1700:6476:1430:77a3:4e60:32de:3fd? ([2600:1700:6476:1430:77a3:4e60:32de:3fd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603078941sm17573635ad.7.2025.06.06.16.04.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 16:04:28 -0700 (PDT)
Message-ID: <f0cd74e12a678b80b8920ebc2fe7226f40c43cd8.camel@dubeyko.com>
Subject: Re:  [PATCH v2] hfsplus: remove mutex_lock check in
 hfsplus_free_extents
From: Viacheslav Dubeyko <slava@dubeyko.com>
To: Christian Brauner <brauner@kernel.org>
Cc: "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org"	 <linux-kernel@vger.kernel.org>, 
 "syzbot+8c0bc9f818702ff75b76@syzkaller.appspotmail.com"	
 <syzbot+8c0bc9f818702ff75b76@syzkaller.appspotmail.com>, Viacheslav Dubeyko
	 <Slava.Dubeyko@ibm.com>, "frank.li@vivo.com" <frank.li@vivo.com>, 
 "glaubitz@physik.fu-berlin.de"	 <glaubitz@physik.fu-berlin.de>,
 "ernesto.mnd.fernandez@gmail.com"	 <ernesto.mnd.fernandez@gmail.com>,
 "akpm@linux-foundation.org"	 <akpm@linux-foundation.org>
Date: Fri, 06 Jun 2025 16:04:27 -0700
In-Reply-To: <2f17f8d98232dec938bc9e7085a73921444cdb33.camel@ibm.com>
References: <20250529061807.2213498-1-frank.li@vivo.com>
	 <2f17f8d98232dec938bc9e7085a73921444cdb33.camel@ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 (by Flathub.org) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Christian,

Could you please pick up the patch?

Thanks,
Slava.

On Thu, 2025-05-29 at 18:34 +0000, Viacheslav Dubeyko wrote:
> On Thu, 2025-05-29 at 00:18 -0600, Yangtao Li wrote:
> > Syzbot reported an issue in hfsplus filesystem:
> >=20
> > ------------[ cut here ]------------
> > WARNING: CPU: 0 PID: 4400 at fs/hfsplus/extents.c:346
> > 	hfsplus_free_extents+0x700/0xad0
> > Call Trace:
> > <TASK>
> > hfsplus_file_truncate+0x768/0xbb0 fs/hfsplus/extents.c:606
> > hfsplus_write_begin+0xc2/0xd0 fs/hfsplus/inode.c:56
> > cont_expand_zero fs/buffer.c:2383 [inline]
> > cont_write_begin+0x2cf/0x860 fs/buffer.c:2446
> > hfsplus_write_begin+0x86/0xd0 fs/hfsplus/inode.c:52
> > generic_cont_expand_simple+0x151/0x250 fs/buffer.c:2347
> > hfsplus_setattr+0x168/0x280 fs/hfsplus/inode.c:263
> > notify_change+0xe38/0x10f0 fs/attr.c:420
> > do_truncate+0x1fb/0x2e0 fs/open.c:65
> > do_sys_ftruncate+0x2eb/0x380 fs/open.c:193
> > do_syscall_x64 arch/x86/entry/common.c:50 [inline]
> > do_syscall_64+0x3d/0xb0 arch/x86/entry/common.c:80
> > entry_SYSCALL_64_after_hwframe+0x63/0xcd
> >=20
> > To avoid deadlock, Commit 31651c607151 ("hfsplus: avoid deadlock
> > on file truncation") unlock extree before hfsplus_free_extents(),
> > and add check wheather extree is locked in hfsplus_free_extents().
> >=20
> > However, when operations such as hfsplus_file_release,
> > hfsplus_setattr, hfsplus_unlink, and hfsplus_get_block are executed
> > concurrently in different files, it is very likely to trigger the
> > WARN_ON, which will lead syzbot and xfstest to consider it as an
> > abnormality.
> >=20
> > The comment above this warning also describes one of the easy
> > triggering situations, which can easily trigger and cause
> > xfstest&syzbot to report errors.
> >=20
> > [task A]			[task B]
> > ->hfsplus_file_release
> > =C2=A0 ->hfsplus_file_truncate
> > =C2=A0=C2=A0=C2=A0 ->hfs_find_init
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ->mutex_lock
> > =C2=A0=C2=A0=C2=A0 ->mutex_unlock
> > 				->hfsplus_write_begin
> > 				=C2=A0 ->hfsplus_get_block
> > 				=C2=A0=C2=A0=C2=A0 ->hfsplus_file_extend
> > 				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ->hfsplus_ext_read_extent
> > 				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ->hfs_find_init
> > 					=C2=A0 ->mutex_lock
> > =C2=A0=C2=A0=C2=A0 ->hfsplus_free_extents
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 WARN_ON(mutex_is_locked) !!!
> >=20
> > Several threads could try to lock the shared extents tree.
> > And warning can be triggered in one thread when another thread
> > has locked the tree. This is the wrong behavior of the code and
> > we need to remove the warning.
> >=20
> > Fixes: 31651c607151f ("hfsplus: avoid deadlock on file truncation")
> > Reported-by: syzbot+8c0bc9f818702ff75b76@syzkaller.appspotmail.com
> > Closes:
> > https://lore.kernel.org/all/00000000000057fa4605ef101c4c@google.com/
> > =C2=A0
> > Signed-off-by: Yangtao Li <frank.li@vivo.com>
> > ---
> > =C2=A0fs/hfsplus/extents.c | 3 ---
> > =C2=A01 file changed, 3 deletions(-)
> >=20
> > diff --git a/fs/hfsplus/extents.c b/fs/hfsplus/extents.c
> > index a6d61685ae79..b1699b3c246a 100644
> > --- a/fs/hfsplus/extents.c
> > +++ b/fs/hfsplus/extents.c
> > @@ -342,9 +342,6 @@ static int hfsplus_free_extents(struct
> > super_block *sb,
> > =C2=A0	int i;
> > =C2=A0	int err =3D 0;
> > =C2=A0
> > -	/* Mapping the allocation file may lock the extent tree */
> > -	WARN_ON(mutex_is_locked(&HFSPLUS_SB(sb)->ext_tree-
> > >tree_lock));
> > -
>=20
> Makes sense to me. Looks good.
>=20
> But I really like your mentioning of reproducing the issue in
> generic/013 and
> really nice analysis of the issue there. Sadly, we haven't it in the
> comment. :)
>=20
> Reviewed-by: Viacheslav Dubeyko <slava@dubeyko.com>
>=20
> Thanks,
> Slava.
>=20
> > =C2=A0	hfsplus_dump_extent(extent);
> > =C2=A0	for (i =3D 0; i < 8; extent++, i++) {
> > =C2=A0		count =3D be32_to_cpu(extent->block_count);
