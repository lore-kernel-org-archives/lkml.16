Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com [95.215.58.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B35B1A08A6
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 14:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745418827; cv=none; b=hfA1A6Th+y/ZUa3JUwzzWPLtVA4Tcq0G1TQXooW+7gISHdEiEAB+oqdElPlZ6Neplw6d5BEsczt5qLxRYEzshCfJRYCZ4tfQIHfGb+KVJwQ6fJzV7+lyStEDL234Zi6JFlfeFNr3OwX32U3mKySTG04UndEIkC3hpeaQjV20MB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745418827; c=relaxed/simple;
	bh=VWzDmQfDjmNuHosOsuI+sYmac9/sp/eY8ADrNc5j/7A=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc:
	 In-Reply-To:References; b=dpYlbFDvoJFccVEto0nXMOXC4a2h3IjBqXD98916VinfLsRyPFMGNQqIvfia2co5utrAWlYWs3mt9P4eqtJXtsCbOYsYtPnoBkH3n8J0aQC82n4lJCk6WgpsZ+jOmyDXFR3aF+AlIHElLl7jiudO5/HMUnS4C5AV/fwsHYcx3pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=kVaPNwGP; arc=none smtp.client-ip=95.215.58.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="kVaPNwGP"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1745418821;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xykOVv1TcngA9kOcdv/u1zueQQzoqln1oIzC7czVqfI=;
	b=kVaPNwGPgKBDLuHusWUpBqNTgLqGQTq4b7N4nQTO0S23fV/FfS5/gkV1CSO/nLUpaDbRhP
	0qS9+aElPEF+m375HKzn76YqN4Pa8gEDWJ9ZEMckv1VOhtmiG34ctfkrqXenqguwhmpmZs
	jeXyf7YwM5C1A8M27bS+us+ZmjET3JY=
Date: Wed, 23 Apr 2025 14:33:37 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Jiayuan Chen" <jiayuan.chen@linux.dev>
Message-ID: <25a402bb9ddfecba22b5b24684d950494fc7410d@linux.dev>
TLS-Required: No
Subject: Re: [PATCH v1] pid: annotate data-races around pid_ns->pid_allocated
To: "Oleg Nesterov" <oleg@redhat.com>
Cc: linux-kernel@vger.kernel.org, mrpre@163.com, mkoutny@suse.com,
 syzbot+adcaa842b762a1762e7d@syzkaller.appspotmail.com,
 syzbot+fab52e3459fa2f95df57@syzkaller.appspotmail.com,
 syzbot+0718f65353d72efaac1e@syzkaller.appspotmail.com, "Andrew Morton"
 <akpm@linux-foundation.org>, "Christian Brauner" <brauner@kernel.org>,
 "Lorenzo Stoakes" <lorenzo.stoakes@oracle.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, "Suren Baghdasaryan" <surenb@google.com>, "Wei
 Yang" <richard.weiyang@gmail.com>, "David Hildenbrand"
 <david@redhat.com>, "Al Viro" <viro@zeniv.linux.org.uk>, "Mateusz Guzik"
 <mjguzik@gmail.com>, "Joel Granados" <joel.granados@kernel.org>, "Jens
 Axboe" <axboe@kernel.dk>, "Wei Liu" <wei.liu@kernel.org>, "Frederic
 Weisbecker" <frederic@kernel.org>
In-Reply-To: <20250423135101.GA28646@redhat.com>
References: <20250423115542.7081-1-jiayuan.chen@linux.dev>
 <20250423135101.GA28646@redhat.com>
X-Migadu-Flow: FLOW_OUT

April 23, 2025 at 21:51, "Oleg Nesterov" <oleg@redhat.com> wrote:



>=20
>=20On 04/23, Jiayuan Chen wrote:
>=20
>=20>=20
>=20> Suppress syzbot reports by annotating these accesses using
> >=20
>=20>  READ_ONCE() / WRITE_ONCE().
> >=20
>=20
> ...
>=20
>=20>=20
>=20> --- a/kernel/pid.c
> >=20
>=20>  +++ b/kernel/pid.c
> >=20
>=20>  @@ -122,7 +122,8 @@ void free_pid(struct pid *pid)
> >=20
>=20>  for (i =3D 0; i <=3D pid->level; i++) {
> >=20
>=20>  struct upid *upid =3D pid->numbers + i;
> >=20
>=20>  struct pid_namespace *ns =3D upid->ns;
> >=20
>=20>  - switch (--ns->pid_allocated) {
> >=20
>=20>  + WRITE_ONCE(ns->pid_allocated, READ_ONCE(ns->pid_allocated) - 1);
> >=20
>=20>  + switch (READ_ONCE(ns->pid_allocated)) {
> >=20
>=20
> I keep forgetting how kcsan works, but we don't need
>=20
>=20READ_ONCE(ns->pid_allocated) under pidmap_lock?
>=20
>=20Same for other functions which read/modify ->pid_allocated with
>=20
>=20this lock held.
>=20
>=20Oleg.
>

However, not all places that read/write pid_allocated are locked,
for example:
https://web.git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/t=
ree/kernel/pid_namespace.c#n271
https://web.git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/t=
ree/kernel/fork.c#n2602

So, in fact, the pidmap_lock is not effective. And if we were to add lock=
s
to all these places, it would be too heavy.

There's no actual impact on usage without locks, so I think it might be m=
ore
suitable to add these macros, KASAN can recognize READ_ONCE and WRITE_ONC=
E
and suppress warnings.

Thanks.
