Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03FEA290098
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 10:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750154457; cv=none; b=N5NPdGmiPhC8lthu5m54/BHvbICziy0VWq3Ai7FT3pV6dPEdP0uND6srQNjLBBYOUkSmClZr91OXlFUuhZ58QKPRAxGtC7c7WyT3ttEDmgY9SIE0FkRScoJBqcX6+Gfc0151XyA8az4nNeH4cM18k3Aw3WQoAV4kcZH92JhH/ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750154457; c=relaxed/simple;
	bh=63f0TqEe7ZSJlAEEDh5c6QP7qrLi0rXRzYggtZFz3+4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tMQo5yU+p3usFWmGwj1PkeRXjmQJ3554QFzKGfAnXyySh/JCKM/5Y3YxqI8TXrc5rfQIYzRtahLoVJjoTsjrzUuA3N51divJ9aI754XnOk/8Eohq9ZT62yNxc6rkgDHGBkQHHrCwihaju/wI9dHqp43vgmAgzM7nHigWPI5/azU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=M9y/17Fl; arc=none smtp.client-ip=209.85.128.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="M9y/17Fl"
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-450ce671a08so34207405e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 03:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750154454; x=1750759254; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=63f0TqEe7ZSJlAEEDh5c6QP7qrLi0rXRzYggtZFz3+4=;
        b=M9y/17FltwGlz8qGvW0VfLPvgROy3Cwj0iSS7zg7mGAt9wUMg9cp+gcTDhQVg9m8h9
         NnP0HpiGgrvzx+TnZIvJi3xDTeoL5Jwo3lvsHfOt6rJqk7lbRDNtIUeeyAM1p3YggVJc
         1NfKJTA9s3OllJtghobnHSgd/CxTiZ5YXhdaLw9F5CqR2pkNCxNT5ON8y2WrTm50RNr5
         aOVU/+kA5QqxtOZMnkqkguxzvT+RcHmgfv6rjudSnQmwH4/J+U74/5MFI1Y6u9Ykqfy6
         2f/p7fraNBehpSRCLDuPreXkPUAwVp3ms12F7fXNlmj5SVVt/HYryvhkPZfIDp6OUg3W
         ioog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750154454; x=1750759254;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=63f0TqEe7ZSJlAEEDh5c6QP7qrLi0rXRzYggtZFz3+4=;
        b=OrQ1CRV8XggXSqO4/l+om7tpVZyu0JDVtN3kvwrPG/IUSA9mzj9TbN8Ki45YG6VDXn
         LZN536Gti1yPX851qUpJhB/vO3ODo0gVopDDEo40Ee8FkDgs+SGJFf80NcqUzdafrZqq
         HD7mpsA5Vh5KNzaFkEbJXLCGJd+WI3W/xtDF2BiUdhoNV6n13Ta3wWvPLj6qEi2muwle
         sFsQNdLegYeAqBD6iZDwhRsKvzTgii+NpSuG8gDZX142xJM+XPZWgSFM2wjhKAsl9/dP
         qBHK6o+TgK9ZQGCrEWyCm3jE24mvsnVamf4byGIqavABd3/U2p5GHLks2Vb2whgTek+y
         HIUw==
X-Forwarded-Encrypted: i=1; AJvYcCVrmcSogTzkG0tjyb3IdbRbtAEGvLDdHIG2f6kZILLQ2WERtSXrXJKFcom6DoKLPIDACclwNH8btyA8Y30=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/GSaRqhxjpcgazWjqJuflcnbqLvPpaxW+JQq61KamEYUB8z7G
	e2ZlV4+XKNkvFnXObfQc7I1Z37u/vjb17Msb3DU2g+Rc39h2ijKc5DdxFYwodv3qMwg=
X-Gm-Gg: ASbGncvlBiFLxgSCH+RDm8ckCLGQ2XHPDA7vyg4vSbbKLJrw0L7pN7HSWRCxXIvgnea
	HowFpt9VDShrqrJlrwGtEIG+P65mRm1KRIk++GH9R45ezLsbq+430QdWElqH15AV9LEXZL4rtfG
	wBF3liPdzrjrFiEDQYnx55Hy0ZRBjaXSsDTgwhlVWyOJPi9tnPjXakBvkkOFjg8i++VxesgFGTI
	nOa/oSr17WeCQIJfe5Nm+dbdjVAEt52+xVdL7lYFs4GUPdAZ5YQhN6p4Ab1YSbfDPzroPxi1LNT
	FECQor5qLiuqImt9ZmwsKp8jvkHCmzZwcQv6cVnXc+mL1MLkbfJKoT0g0Has8WV6
X-Google-Smtp-Source: AGHT+IFOY4uMo1XQEX4RuwIHAMfgibmwRB22iBO5mpSJQ1+dfkCUk/eEmOPDTUbzxCn/VYVxqmedIA==
X-Received: by 2002:a05:600d:10f:b0:452:fdfa:3b3b with SMTP id 5b1f17b1804b1-4533cadf885mr65921715e9.5.1750154454019;
        Tue, 17 Jun 2025 03:00:54 -0700 (PDT)
Received: from blackdock.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e195768sm171790845e9.0.2025.06.17.03.00.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 03:00:53 -0700 (PDT)
Date: Tue, 17 Jun 2025 12:00:51 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: syzbot <syzbot+31eb4d4e7d9bc1fc1312@syzkaller.appspotmail.com>, 
	inwardvessel@gmail.com
Cc: akpm@linux-foundation.org, andrii@kernel.org, ast@kernel.org, 
	axboe@kernel.dk, bpf@vger.kernel.org, cgroups@vger.kernel.org, 
	daniel@iogearbox.net, eddyz87@gmail.com, hannes@cmpxchg.org, haoluo@google.com, 
	hawk@kernel.org, john.fastabend@gmail.com, jolsa@kernel.org, josef@toxicpanda.com, 
	kpsingh@kernel.org, linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, martin.lau@linux.dev, mhocko@kernel.org, 
	muchun.song@linux.dev, mykolal@fb.com, netdev@vger.kernel.org, roman.gushchin@linux.dev, 
	sdf@fomichev.me, shakeel.butt@linux.dev, shuah@kernel.org, song@kernel.org, 
	syzkaller-bugs@googlegroups.com, tj@kernel.org, yonghong.song@linux.dev
Subject: Re: [syzbot] [cgroups?] general protection fault in
 __cgroup_rstat_lock
Message-ID: <qzzfped7jds7kcr466zahbrcw2eg5n6ke7drzxm6btexv36ca2@mici3xiuajuz>
References: <6751e769.050a0220.b4160.01df.GAE@google.com>
 <683c7dee.a00a0220.d8eae.0032.GAE@google.com>
 <p32ytuin2hmxacacroykhtfxf6l5l7sji33dt4xknnojqm4xh2@hrldb5d6fgfj>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="krlwbo2bq63d5qwa"
Content-Disposition: inline
In-Reply-To: <p32ytuin2hmxacacroykhtfxf6l5l7sji33dt4xknnojqm4xh2@hrldb5d6fgfj>


--krlwbo2bq63d5qwa
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [syzbot] [cgroups?] general protection fault in
 __cgroup_rstat_lock
MIME-Version: 1.0

On Mon, Jun 02, 2025 at 04:15:56PM +0200, Michal Koutn=FD <mkoutny@suse.com=
> wrote:
> I'd say this might be relevant (although I don't see the possibly
> incorrect error handlnig path) but it doesn't mean this commit fixes it,
> it'd rather require the reproducer to adjust the N on this path.

Hm, possibly syzbot caught up here [1]:

-mkdir(&(0x7f0000000000)=3D'./cgroup/file0\x00', 0xd0939199c36b4d28) (fail_=
nth: 8)
+mkdirat$cgroup_root(0xffffffffffffff9c, &(0x7f00000005c0)=3D'./cgroup.net/=
syz0\x00', 0x1ff) (fail_nth: 23)

So there's something fishy in the error handling.

HTH,
Michal

[1] https://lore.kernel.org/lkml/68403875.a00a0220.d4325.000a.GAE@google.co=
m/

--krlwbo2bq63d5qwa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCaFE80QAKCRB+PQLnlNv4
CFc5AQDFUQDIxN7rZwIY/4HwJm40c4uz7Kwbk8e3RX9sQwVOOQEA0j9JsDa/0bOB
mCi/pTl0V4lRqubAZXTV4nhvtAtknwY=
=+ozi
-----END PGP SIGNATURE-----

--krlwbo2bq63d5qwa--
