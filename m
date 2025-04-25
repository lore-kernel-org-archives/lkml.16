Received: from out-180.mta1.migadu.com (out-180.mta1.migadu.com [95.215.58.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF28522A1C0
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 05:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745559484; cv=none; b=F+rm1pyyAnowR9nNqKL1mrNqopmfaJtus4lcjVNXZItof5O76mR/siWg93QavMKiTypbFmg5kOZX2IdMKgGlzgOUPHnGPcnucXpcwwZcD4iRBFkm726TA4NRAYMUgJvJP8BjeZQ5vd8NnBi8nToeZy8Iq6qWOd/uV0zM943qvLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745559484; c=relaxed/simple;
	bh=GBPkj2xK3AiAIP7oDF3EyCT0WrZ+H0+ZMNoMsXKMX2s=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc:
	 In-Reply-To:References; b=q4iyERZ/Lb8UJjRmzTsytafO3s0jymeDsBCb8Cgf0Qs2ksKodDVBnD0sis4Rc6fXKxDTtUoyYXB8gyJ/otFVhHMVJ6dZs4HR8Cz2TZxotYB+A5X5jmyPXNkbLemXLQsb2Y2fYFtN51PT4a0CZb+7Qkv5ZYllcEQXYnfzBVDhElk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=tgfCCpYT; arc=none smtp.client-ip=95.215.58.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="tgfCCpYT"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1745559479;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hmYoQUllEpDs/DBE9p4ecsGy5pEbBWSRLl921VTQ5m0=;
	b=tgfCCpYTLjIAa3rS43Q0EyQaHJ6Q+CO9B3mvgkMYqqKHlT4rHBSr4k3G29n7r2KNFEc4SW
	3MapI0YAiqDgpeIUeoPSzrSSDZkspMpwNqs+ikkoYGg/lbV2VE4sRIVeJiCeGl0GhFuJmz
	2nXuftn/GbvWxpTdmosZC2H22dtBhuU=
Date: Fri, 25 Apr 2025 05:37:54 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Jiayuan Chen" <jiayuan.chen@linux.dev>
Message-ID: <ad4137be8f8b14f932e6590355d59618c3fbfc9c@linux.dev>
TLS-Required: No
Subject: Re: [PATCH v1] pid: annotate data-races around pid_ns->pid_allocated
To: "Christian Brauner" <brauner@kernel.org>, "Oleg Nesterov"
 <oleg@redhat.com>
Cc: linux-kernel@vger.kernel.org, mrpre@163.com, mkoutny@suse.com,
 syzbot+adcaa842b762a1762e7d@syzkaller.appspotmail.com,
 syzbot+fab52e3459fa2f95df57@syzkaller.appspotmail.com,
 syzbot+0718f65353d72efaac1e@syzkaller.appspotmail.com, "Andrew Morton"
 <akpm@linux-foundation.org>, "Lorenzo Stoakes"
 <lorenzo.stoakes@oracle.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, "Suren Baghdasaryan" <surenb@google.com>, "Wei
 Yang" <richard.weiyang@gmail.com>, "David Hildenbrand"
 <david@redhat.com>, "Al Viro" <viro@zeniv.linux.org.uk>, "Mateusz Guzik"
 <mjguzik@gmail.com>, "Joel Granados" <joel.granados@kernel.org>, "Jens
 Axboe" <axboe@kernel.dk>, "Wei Liu" <wei.liu@kernel.org>, "Frederic
 Weisbecker" <frederic@kernel.org>
In-Reply-To: <20250424-marsch-radio-fb7bf6484c05@brauner>
References: <20250423115542.7081-1-jiayuan.chen@linux.dev>
 <20250423135101.GA28646@redhat.com>
 <25a402bb9ddfecba22b5b24684d950494fc7410d@linux.dev>
 <20250423163818.GB28646@redhat.com>
 <20250424-marsch-radio-fb7bf6484c05@brauner>
X-Migadu-Flow: FLOW_OUT

April 24, 2025 at 17:38, "Christian Brauner" <brauner@kernel.org> wrote:

>=20
>=20On Wed, Apr 23, 2025 at 06:38:18PM +0200, Oleg Nesterov wrote:
>=20
>=20>=20
>=20> On 04/23, Jiayuan Chen wrote:
> >=20
>=20>  April 23, 2025 at 21:51, "Oleg Nesterov" <oleg@redhat.com> wrote:
> >=20
>=20>  >
> >=20
>=20>  > On 04/23, Jiayuan Chen wrote:
> >=20
>=20>  >
> >=20
>=20>  > >
> >=20
>=20>  > > Suppress syzbot reports by annotating these accesses using
> >=20
>=20>  > >
> >=20
>=20>  > > READ_ONCE() / WRITE_ONCE().
> >=20
>=20>  > >
> >=20
>=20>  >
> >=20
>=20>  > ...
> >=20
>=20>  >
> >=20
>=20>  > >
> >=20
>=20>  > > --- a/kernel/pid.c
> >=20
>=20>  > >
> >=20
>=20>  > > +++ b/kernel/pid.c
> >=20
>=20>  > >
> >=20
>=20>  > > @@ -122,7 +122,8 @@ void free_pid(struct pid *pid)
> >=20
>=20>  > >
> >=20
>=20>  > > for (i =3D 0; i <=3D pid->level; i++) {
> >=20
>=20>  > >
> >=20
>=20>  > > struct upid *upid =3D pid->numbers + i;
> >=20
>=20>  > >
> >=20
>=20>  > > struct pid_namespace *ns =3D upid->ns;
> >=20
>=20>  > >
> >=20
>=20>  > > - switch (--ns->pid_allocated) {
> >=20
>=20>  > >
> >=20
>=20>  > > + WRITE_ONCE(ns->pid_allocated, READ_ONCE(ns->pid_allocated) -=
 1);
> >=20
>=20>  > >
> >=20
>=20>  > > + switch (READ_ONCE(ns->pid_allocated)) {
> >=20
>=20>  > >
> >=20
>=20>  >
> >=20
>=20>  > I keep forgetting how kcsan works, but we don't need
> >=20
>=20>  >
> >=20
>=20>  > READ_ONCE(ns->pid_allocated) under pidmap_lock?
> >=20
>=20>  >
> >=20
>=20>  > Same for other functions which read/modify ->pid_allocated with
> >=20
>=20>  >
> >=20
>=20>  > this lock held.
> >=20
>=20>  >
> >=20
>=20>  > Oleg.
> >=20
>=20>  >
> >=20
>=20>  However, not all places that read/write pid_allocated are locked,
> >=20
>=20>  for example:
> >=20
>=20>  https://web.git.kernel.org/pub/scm/linux/kernel/git/next/linux-nex=
t.git/tree/kernel/pid_namespace.c#n271
> >=20
>=20>  https://web.git.kernel.org/pub/scm/linux/kernel/git/next/linux-nex=
t.git/tree/kernel/fork.c#n2602
> >=20
>=20>  So, in fact, the pidmap_lock is not effective. And if we were to a=
dd locks
> >=20
>=20>  to all these places, it would be too heavy.
> >=20
>=20>=20=20
>=20>=20
>=20>  It seems you misunderstood me. I didn't argue with the lockless RE=
AD_ONCE()s
> >=20
>=20>  outside of pidmap_lock.
> >=20
>=20
> Agreed. We should only add those annotations where they're really
>=20
>=20needed (someone once taught me ;).
>

Thank you for your suggestion, it make sense to me.
