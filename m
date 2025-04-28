Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com [95.215.58.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD005D530
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 08:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745829038; cv=none; b=u9Lh3mPpcCUaSaYxkw3+rKFQw+BOgO4MSRHGSmUHHnBkFSRWgmfJ9i7N4meP7BWMNihauUdoXWZf9Epc2ZPeytwrGktIKmltq7suIHieMM7K3f0KDcvU6XVqPje4sd7izbwkAV48HmF4B4vX+q5oVGLzgr5ndLhr7wuC0xjTl6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745829038; c=relaxed/simple;
	bh=XnizB9100UNA68Nhrc/NPH0GHRaRUl3WPQShtsDYwHI=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc:
	 In-Reply-To:References; b=FGDq8ze7HZ18dHHqyWboHZMu4hYuQW6VAn4sQoyjM2KWwd3288AsKq/yOCs4NwkGr6V3qZDTfCaWNhKPCanLJtYO1uBaYytTyhJYh2d7kwkT3FQPRV1BcfzJUeBay2lfeOwZ1gDLBqRq0hEG5z5PycNtgTY4odh+Vr/v4OkfdKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=q/87Crtp; arc=none smtp.client-ip=95.215.58.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="q/87Crtp"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1745829034;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OfSbmzDs/o0LQ7Atw6SIKmR3v4ivn9bHhtZs1yGAZZA=;
	b=q/87CrtpsyJ8M2YC/zH4KQ/bpMf4u2N4OXQdJCZQ68guxuzAhOq+mymE1jGMGPn1dCgYoA
	C8HpXLjVkQjixc5ZqNPmJ+B7Eaog6h98GW1ISN0ZX8hOpQmVk8K3AhgFwSW9gcnSfRAUB3
	VvF89ZUwE3hxL8M+/drxRQTIOZ2lEg4=
Date: Mon, 28 Apr 2025 08:30:24 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Jiayuan Chen" <jiayuan.chen@linux.dev>
Message-ID: <7adb633683ed40587a379260857c7a48ce69638c@linux.dev>
TLS-Required: No
Subject: Re: [PATCH v2] pid: annotate data-races around pid_ns->pid_allocated
To: "=?utf-8?B?TWljaGFsIEtvdXRuw70=?=" <mkoutny@suse.com>
Cc: linux-kernel@vger.kernel.org, mrpre@163.com,
 syzbot+adcaa842b762a1762e7d@syzkaller.appspotmail.com,
 syzbot+fab52e3459fa2f95df57@syzkaller.appspotmail.com,
 syzbot+0718f65353d72efaac1e@syzkaller.appspotmail.com, "Andrew Morton"
 <akpm@linux-foundation.org>, "Christian Brauner" <brauner@kernel.org>,
 "Lorenzo Stoakes" <lorenzo.stoakes@oracle.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, "Suren Baghdasaryan" <surenb@google.com>, "Wei
 Yang" <richard.weiyang@gmail.com>, "David Hildenbrand"
 <david@redhat.com>, "Al Viro" <viro@zeniv.linux.org.uk>, "Mateusz Guzik"
 <mjguzik@gmail.com>, "Oleg Nesterov" <oleg@redhat.com>, "Joel Granados"
 <joel.granados@kernel.org>, "Bill O'Donnell" <bodonnel@redhat.com>,
 "Darrick J. Wong" <djwong@kernel.org>, "Frederic Weisbecker"
 <frederic@kernel.org>
In-Reply-To: <fo436hdqzkevk7jqszyprjjwehqge7rrqxz6gqbmgoqqsqwdxl@efe2r5jeouwl>
References: <20250425055824.6930-1-jiayuan.chen@linux.dev>
 <fo436hdqzkevk7jqszyprjjwehqge7rrqxz6gqbmgoqqsqwdxl@efe2r5jeouwl>
X-Migadu-Flow: FLOW_OUT

April 25, 2025 at 17:25, "Michal Koutn=C3=BD" <mkoutny@suse.com> wrote:

>=20
>=20On Fri, Apr 25, 2025 at 01:58:14PM +0800, Jiayuan Chen <jiayuan.chen@=
linux.dev> wrote:
>=20
>=20>=20
>=20> Suppress syzbot reports by annotating these accesses using data_rac=
e().
> >=20
>=20
> Thanks for trying this approach.
>=20
>=20scripts/checkpatch.pl has quite some remarks about the current form :=
-)
>=20
>=20I mean, the data_race annotation should document why the race is
>=20
>=20harmless. I only glanced over this so I can't tell myself whether it'=
s a
>=20
>=20bug or OK.
>=20
>=20>=20
>=20> Reported-by: syzbot+adcaa842b762a1762e7d@syzkaller.appspotmail.com
> >=20
>=20>  Reported-by: syzbot+fab52e3459fa2f95df57@syzkaller.appspotmail.com
> >=20
>=20>  Reported-by: syzbot+0718f65353d72efaac1e@syzkaller.appspotmail.com
> >=20
>=20
> How can I get to see full syzbot reports? (Stacktrace would be helpful,
>=20
>=20I cannot resolve those as message-ids on (LK)ML.)
>=20
>=20Thanks,
>=20
>=20Michal
>

Hi Michal,

We can find such reports at https://syzkaller.appspot.com/upstream/s/kern=
el
