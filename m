Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E091B3929
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 16:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744648819; cv=none; b=nfQ1WMZfgAysXgxpcw6zbbq/tdG3UFqYPfNMTuqZvxdm4oEFoo7Qb32Ox/QjkvhQMp8hGafFGNMkmlpbZ1sOiIG6lFIJ2XDqfNiTnFhnIgOoKWHs+r8TNdU8Krpl4GfHu2LHjE2ywGksJQbSEw+6sVCvkrSN6si94N9lHPfSoIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744648819; c=relaxed/simple;
	bh=m75HaPFiKIYPfUfjID1f6sX7VYwIkyrap18FkA2hZCk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mwxkd+wamcZKy+6vQiLl0jTlp2X7xGI0o+Aj1Ryoi16j67mOyZ8AxRpqMhohOhAHN4S+mr6oRGEvo+EGbkISha3JmHwF4GXLYwaX2WWw65g0Uoeg0gnGCYcwPwsWwooT2TroshX4HZvOXfkEcOYKavGS7ZqOvS3mx1Ly5sZVtIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5946FC4CEE2;
	Mon, 14 Apr 2025 16:40:18 +0000 (UTC)
Date: Mon, 14 Apr 2025 12:41:49 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Prakash Sangappa <prakash.sangappa@oracle.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "peterz@infradead.org" <peterz@infradead.org>,
 "mathieu.desnoyers@efficios.com" <mathieu.desnoyers@efficios.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>, Sebastian Andrzej Siewior
 <bigeasy@linutronix.de>
Subject: Re: [PATCH 0/2] Scheduler time extension
Message-ID: <20250414124149.2543d6c0@gandalf.local.home>
In-Reply-To: <1142C71C-32B8-4C34-BA3F-4D061BA25620@oracle.com>
References: <20250215005414.224409-1-prakash.sangappa@oracle.com>
	<20250217120000.5ae1201a@gandalf.local.home>
	<821926D8-ABED-4B66-9E2D-39594DB82FA1@oracle.com>
	<20250322061422.2b24f021@batman.local.home>
	<1142C71C-32B8-4C34-BA3F-4D061BA25620@oracle.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 11 Apr 2025 20:54:14 +0000
Prakash Sangappa <prakash.sangappa@oracle.com> wrote:

> > On Mar 22, 2025, at 3:14=E2=80=AFAM, Steven Rostedt <rostedt@goodmis.or=
g> wrote:
> >=20
> > On Tue, 18 Mar 2025 16:10:09 +0000
> > Prakash Sangappa <prakash.sangappa@oracle.com> wrote:
> >  =20
> >> How do we proceed on this feature?=20
> >> Are we leaning towards enabling this feature for SCHED_OTHER only unde=
r PREEMPT_LAZY? =20
> >=20
> > The merge window is about to open and I'm way behind in what needs to g=
o in.
> >=20
> > Let's continue this discussion after rc1 comes out. =20
>=20
> Can the API be finalized? We have an use case which will benefit from it.=
 So like to see this feature
> merged.=20

I'm still not for SCHED_OTHER tasks being allowed to delay RT or deadline
tasks, even for 5us. But if that's what Peter wants, I'm not going to nack
it.

Just keep it configurable so that it can be easily disabled, as I have no
intentions of using it.

-- Steve
