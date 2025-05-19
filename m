Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F24321B9F0
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 21:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747689897; cv=none; b=WallQd5CVpg9GWY/AOIM4ceDJs7UsICJM6BuiO43Dx4ZyMpEmXOpw4oiJa6Gjkxg/VGV/s3ZNWGy61Q939zvu04mrAzrloxTqXuRkZHB1CEMGd6xSMmJCIVjY9gX6lmOJD3A3pHDbsfSvz7BTT3nsbGgRs3wUe/z6xVrNS5kp5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747689897; c=relaxed/simple;
	bh=KrJYF/8iAZAz6eieIlvrsorYC8ZuhwgjORMuJk5Vcng=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F0DgnM9zeb6SGwyCLJFyhHscb5hDPFQ/LMJ+Lv6GAs17n1Pzu14mQ9wWR5IeniP1pbgjh/L4FGmykggvbS0e0rV1SVLx/9O6zcOBOmS8kjvnze+Ul4JDJBHY8tbnGbXQae2OSysMndUQLUeNQnq3KyVe6gQo2JcOBVpwmVRUo+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DjSgCwsa; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DjSgCwsa"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-231f37e114eso531595ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 14:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747689895; x=1748294695; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jwr2UogZmg2vxMmFxh7M3ZUqGzc1B04mt9jo7F27B84=;
        b=DjSgCwsar9Ue/Qr2tQh2ztjLU274k6nmGL5YV6jqCN8WY4qV5hOHnIYcf584L+w3qd
         gwxF969ASztj9dPbZjgWpQYUCdiLScEux3MKIHlVxGsgHwvnORpPm5YrCzDTClFfpJGF
         kLXTNDfuEKtIQQKEoqkmi2flV3bHzgwCzCbVr/MugkrrhtS7CgH58ZCvR4/b3WAHF/Rv
         FSOnl5fJCh/Y+V+anBPkrL/PP1ouzgZI60n15JD6dW3f/iVQwJMGHDiGx+eGvyzn2L3M
         taOAfnvPgVYco/KgdxKHUSHNCsceOm5w8HteRsc2gvgRDHl/8OrO4hTbgC1+PWFAWA6u
         wKTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747689895; x=1748294695;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jwr2UogZmg2vxMmFxh7M3ZUqGzc1B04mt9jo7F27B84=;
        b=tOyApatQSqH37ngi0N9b/PpaaBVFrQz9oLXaNtV9NoCSAu5Oivn4P90ix0CpSx3bzP
         6PIC2ZH3X9chkAGxXGoeBxNk74+GHmONNV4aR+MT9s26s6Dk+j10y/IuiWUsTWXUbSR1
         fq55Wz12+8kAG2MOOGjnCO4RhoepVvrVXZLprz4u1AURB0evO8+8wOrBxVbOpOprA+v1
         8D1n1g+r7dJodl8JsyoU3wX+EFrAGEptawv3bLB4CU3RDYXLOXYOOsBtllZL+1WInu1q
         kcHfF1HOKM8nQPjeEPvj4PPaTy7woV92UVGD/dURsQrHYhRfmdDNbyAczAcR8DRCP7di
         gXkA==
X-Forwarded-Encrypted: i=1; AJvYcCVApBfkhZa3aqxjO/xnYlM4Fgsz0Ta0cBddjeyPSkcBtb6TLASF8rxP0j8UI2wdb0nzulRh2X1dHo7sXZo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy983sYulZ6CR1KVNFe6xd1G12C2v7pOKATbelTzU3Ud98zcM7i
	GU1ZZGhcmgUVKg3+gGtx/yLJuzE/XIWDQIZ5I1vxiUUZIv9xnJ3fIwHIFao8Vw3M8l1IpTtTPED
	GNnS6WM/y8W/aESND6NgnAM5tOsZZrjEXkPIIIPdQ
X-Gm-Gg: ASbGncuvrcqnXvXyJYqhkx4gv/7QqE88iCgo9n1JrfDcYY1mP41qoznKbChGjGodmO3
	b60xhKg6iQn0KcfLKoPIigdqx1/o9tHA03Ix4bzPGyW4LB0+pGTCje8sNNhbA7ftnOIpBfZOvCx
	ld5GaYv4eYlRUCrdhhui7fHWLdGGvyc7CwAd+bY0e2c3Z802wJbuZossC78R4=
X-Google-Smtp-Source: AGHT+IHZl20CThZazmHRrMzF0aowGtpRTo4hj8YBed0NBKl5Jgl1WKHtg5swYnZ0pDOCIVlVWLY5qNR7gScCJ/npWcE=
X-Received: by 2002:a17:902:cccb:b0:22c:3cda:df11 with SMTP id
 d9443c01a7336-231ffd1b02dmr5984095ad.10.1747689894886; Mon, 19 May 2025
 14:24:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250519131151.988900-1-chenridong@huaweicloud.com>
 <CAG48ez2bFhYYj2qkJk3j5t=3VwYUH4sSMuohyC=MfrRw-bv22g@mail.gmail.com> <aCucJ9731YzaZI5b@example.org>
In-Reply-To: <aCucJ9731YzaZI5b@example.org>
From: Jann Horn <jannh@google.com>
Date: Mon, 19 May 2025 23:24:16 +0200
X-Gm-Features: AX0GCFskDhKj6EKh6Dgpb4RDwoGMnYtP53lzDT7-l2M_PC7fwkDAzd65ZS5_Flc
Message-ID: <CAG48ez01rRTsB0PcxsrzcbMeVnr2bPjigc15GpFCoKQmdzmGrg@mail.gmail.com>
Subject: Re: [RFC next v2 0/2] ucounts: turn the atomic rlimit to percpu_counter
To: Alexey Gladkov <legion@kernel.org>
Cc: Chen Ridong <chenridong@huaweicloud.com>, akpm@linux-foundation.org, 
	Liam.Howlett@oracle.com, lorenzo.stoakes@oracle.com, vbabka@suse.cz, 
	pfalcato@suse.de, bigeasy@linutronix.de, paulmck@kernel.org, 
	chenridong@huawei.com, roman.gushchin@linux.dev, brauner@kernel.org, 
	pmladek@suse.com, geert@linux-m68k.org, mingo@kernel.org, 
	rrangel@chromium.org, francesco@valla.it, kpsingh@kernel.org, 
	guoweikang.kernel@gmail.com, link@vivo.com, viro@zeniv.linux.org.uk, 
	neil@brown.name, nichen@iscas.ac.cn, tglx@linutronix.de, frederic@kernel.org, 
	peterz@infradead.org, oleg@redhat.com, joel.granados@kernel.org, 
	linux@weissschuh.net, avagin@google.com, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, lujialin4@huawei.com, 
	"Serge E. Hallyn" <serge@hallyn.com>, David Howells <dhowells@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 19, 2025 at 11:01=E2=80=AFPM Alexey Gladkov <legion@kernel.org>=
 wrote:
> On Mon, May 19, 2025 at 09:32:17PM +0200, Jann Horn wrote:
> > On Mon, May 19, 2025 at 3:25=E2=80=AFPM Chen Ridong <chenridong@huaweic=
loud.com> wrote:
> > > From: Chen Ridong <chenridong@huawei.com>
> > >
> > > The will-it-scale test case signal1 [1] has been observed. and the te=
st
> > > results reveal that the signal sending system call lacks linearity.
> > > To further investigate this issue, we initiated a series of tests by
> > > launching varying numbers of dockers and closely monitored the throug=
hput
> > > of each individual docker. The detailed test outcomes are presented a=
s
> > > follows:
> > >
> > >         | Dockers     |1      |4      |8      |16     |32     |64    =
 |
> > >         | Throughput  |380068 |353204 |308948 |306453 |180659 |129152=
 |
> > >
> > > The data clearly demonstrates a discernible trend: as the quantity of
> > > dockers increases, the throughput per container progressively decline=
s.
> >
> > But is that actually a problem? Do you have real workloads that
> > concurrently send so many signals, or create inotify watches so
> > quickly, that this is has an actual performance impact?
> >
> > > In-depth analysis has identified the root cause of this performance
> > > degradation. The ucouts module conducts statistics on rlimit, which
> > > involves a significant number of atomic operations. These atomic
> > > operations, when acting on the same variable, trigger a substantial n=
umber
> > > of cache misses or remote accesses, ultimately resulting in a drop in
> > > performance.
> >
> > You're probably running into the namespace-associated ucounts here? So
> > the issue is probably that Docker creates all your containers with the
> > same owner UID (EUID at namespace creation), causing them all to
> > account towards a single ucount, while normally outside of containers,
> > each RUID has its own ucount instance?
> >
> > Sharing of rlimits between containers is probably normally undesirable
> > even without the cacheline bouncing, because it means that too much
> > resource usage in one container can cause resource allocations in
> > another container to fail... so I think the real problem here is at a
> > higher level, in the namespace setup code. Maybe root should be able
> > to create a namespace that doesn't inherit ucount limits of its owner
> > UID, or something like that...
>
> If we allow rlimits not to be inherited in the userns being created, the
> user will be able to bypass their rlimits by running a fork bomb inside
> the new userns.
>
> Or I missed your point ?

You're right, I guess it would actually still be necessary to have one
shared limit across the entire container, so rather than not having a
namespace-level ucount, maybe it would make more sense to have a
private ucount instance for a container...

(But to be clear I'm not invested in this suggestion at all, I just
looked at that patch and was wondering about alternatives if that is
actually a real performance problem...)
