Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE70F233707
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 09:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745575052; cv=none; b=nvDe4HzVxRoWCtuOHF+9MCxB0YUSXuwohOdy+wqUHJ1iTpwVJByg1VZzR8inUEX7nYNdTfG+N6NW0WW329k4XZ28i5o6euScXV+v0gRkpsDH/Xn41kSedTFIwD+zksz/40+0u89Ce1wc98cTllWPh3vnbcNnX5ReK1TN71ITSiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745575052; c=relaxed/simple;
	bh=koJmUEiWE6fqAjEJwa/k5DcYQrznO4aQL9O+hYBe8+M=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=e0vpwf/KcSxul8ShehHecxfi5JknnD+vFJbsZBYIgPiyvnDebt4J57ymZWs5a/7AjVgMsRR1VJEzR6cgoX/Z2ot1pkijOMZRDhz7QhNuXhy0o4Lrbl4LbFUJvnaSSRqhL5xio2ZhqTs51Qxd+sAly7wriuD5YKr9PRS3yZ/uMBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=lc6wir0s; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="lc6wir0s"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4ZkStn0sppz9sNv;
	Fri, 25 Apr 2025 11:57:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1745575041; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cXIEFtQ52fKXo6R0hZKFeHaB5fiZSBox6IEBfViD5is=;
	b=lc6wir0sb5hpNXp4VGvYZg1ioXx0/3S8A5QRHV/6Wm+cGiUFdixrDrQ7AAcrN4XqxzWR7y
	fHlqPnQx5Tgp6kCKANiSgDxVp3/9OgeCp9Lv1fvnDKSNcW2J5tWqOzIowHDBXIhSwZ8gz7
	X2zG+ht+WCyNOjkZYAzoRWdZRn6/mY4AF/te9AbE2If+n9CvlWlXKd9JGZ8HGT48CzqT6I
	mpL6ik+RoSImuj+JOW8vJxpuN3AFIaJA2UPB0bfoUYA9m4TiEq/LBtLe9G//bw1JPN3k8y
	bjGorQ3ilTkQyUzlN0W9MlJ9MDmT6oowso5lWPjUtPZrbUxIHv/Nhlx4Fru7CQ==
Message-ID: <6b6267872fcc5e75883144f241c79c93c03fcead.camel@mailbox.org>
Subject: Re: [PATCH] workqueue: flush all pending jobs in destroy_workqueue()
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Alice Ryhl <aliceryhl@google.com>, Tejun Heo <tj@kernel.org>
Cc: Lai Jiangshan <jiangshanlai@gmail.com>, Danilo Krummrich
 <dakr@kernel.org>,  linux-kernel@vger.kernel.org
Date: Fri, 25 Apr 2025 11:57:18 +0200
In-Reply-To: <aAtXApA8ggJa6sQg@google.com>
References: <20250423-destroy-workqueue-flush-v1-1-3d74820780a5@google.com>
	 <aAqXw3t9UVU8pF8_@slm.duckdns.org> <aAtXApA8ggJa6sQg@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-META: kw16xfbxxwo5s5ptz8o9npmyb9wumhs1
X-MBO-RS-ID: 6236fa34f97b4b98029

On Fri, 2025-04-25 at 09:33 +0000, Alice Ryhl wrote:
> On Thu, Apr 24, 2025 at 09:57:55AM -1000, Tejun Heo wrote:
> > Hello, Alice.
> >=20
> > On Wed, Apr 23, 2025 at 05:51:27PM +0000, Alice Ryhl wrote:
> > ...
> > > @@ -367,6 +367,8 @@ struct workqueue_struct {
> > > =C2=A0	struct lockdep_map	__lockdep_map;
> > > =C2=A0	struct lockdep_map	*lockdep_map;
> > > =C2=A0#endif
> > > +	raw_spinlock_t		delayed_lock;	/* protects
> > > pending_list */
> > > +	struct list_head	delayed_list;	/* list of
> > > pending delayed jobs */
> >=20
> > I think we'll have to make this per-CPU or per-pwq. There can be a
> > lot of
> > delayed work items being queued on, e.g., system_wq. Imagine that
> > happening
> > on a multi-socket NUMA system. That cacheline is going to be
> > bounced around
> > pretty hard.
>=20
> Hmm. I think we would need to add a new field to delayed_work to keep
> track of which list it has been added to.
>=20
> Another option could be to add a boolean that disables the list.
> After
> all, we never call destroy_workqueue() on system_wq so we don't need
> the
> list for that workqueue.
>=20
> Thoughts?

I for my part was astonished that I actually found this half-bug in the
WQ implementation, because WQs are a) very important and b) very
intensively used, so I had expected that the bug *must* be on my side.
The fact that it wasn't is a hint for me that there are not that many
parties in the kernel that tear down with non-canceled DW.

You also have to race a bit to run into the problem.

I'm not sure how relevant that is for the synchronization overhead
Tejun describes; but take it for what it's worth.


P.

>=20
> Alice

