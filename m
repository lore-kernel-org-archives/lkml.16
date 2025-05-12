Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC61924DFF1
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 22:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747087312; cv=none; b=C3TE4wjHZ8nMKnBfTT2V70S045lgDSP8M9msuzD5seTHEXjOK6O9KQke8zStTBnBj8BIpnMIvu+3VxSttwyoTGFgg0szxM+j/uiS+pReFNjy3Nlbb6QNO399JIKzl3XJXmJFmxqKN4rCWoTNKZ7vPsA0U3/fCOYHpeO7YL9NQLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747087312; c=relaxed/simple;
	bh=rHfSaTbnyI9XoypCkJo/iUq/Y4OjgIW4d0dEWEOb4WQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qKOa0pCEgu+aAUm0TPbgdFJJv/5OYkxd/3zoWusrrq4rXgCF6S4Q/paFtiJXPXPca/gOWdeNyH/Upx0+G52OL2OfamUXH34pcLEwmjR7H+xjkJaMWFCa1ULiyB52gCJBtv00pMTvfVWZ57496Dp9c5D4PLiK3Lwc8fZaQOaCVA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=ZtEZgBw0; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="ZtEZgBw0"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-70a338b1ce5so45981487b3.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 15:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1747087309; x=1747692109; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XKie0IlRkp83iNNzrci+462IuBHk3Z5i8ViXJGbM2zI=;
        b=ZtEZgBw0GmHrKBzqkZyUxP7mkbD8/w0vn//14mhD4T1atH4bDu2pDSP46+cDLmfAPY
         ZI4MJ//OPOZlf9nwd4wVP5Xe8Y9DrKnmsgUmO1y68MZIRWaHL1OsGOFzAfK40sz+4giL
         mgJU2jOZvRFhkXm2qSi4InNudvUCgsLge5YbBhD5zVY37468STGiJOe5PMmBfPgs3FxW
         qmFU9FgvEhJSaasZbRMKjy7OW7qhraSdnYTu7f9vZWpqHvYGfQNyovl5kZLGZCp4+Y/l
         Whx9hGFvjrUamAFiJYOBG/YNAlg4LRwGaGoUS9nVHsQ2aBtWZu8rv3q3DhcsN+Cpb7uK
         IpZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747087309; x=1747692109;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XKie0IlRkp83iNNzrci+462IuBHk3Z5i8ViXJGbM2zI=;
        b=bsZYKeUXVWF9ZrXquSymir1HZB7nRF/PvHvHbs4mxC4mvFpQcrg/idkttfCzhONIOt
         O+1/tynYfgx9nG/jRYFw1352HtUNIFG4r43EV13gfsTmWuAYs8b4RWqlkO1GB2/ReQ/K
         00AQl5sdQrzD/xcgqWnGkdJyv6Bq0eDTpkVd8hHRdcAPzoPzr75XEONVuhkcmT9jnnwT
         05skKogMFqFd34MvI+9naKOMWnwPThWCpE5LPF5sJz0xjVGb26IaYDFTH/Qm8MtP3muQ
         FQ1VWRGG3dZUrG50WPWxAzTF8O+C6aYeiOlVHSlf9QJK/8Tk+6DKHLCPxmHatWQC8Vbm
         yYsw==
X-Forwarded-Encrypted: i=1; AJvYcCXhXwMhnP1j82mx09BVAg139sMfrY3mUoTUdDzYQT6NLaBArmTNopcs945gBawW6xMTPWLsAOacfIEmP9U=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjnJCwL1Ox6Mtno0+iQfeESRZBjUVrJrcULMLnAJbX6zy6zxd6
	B/Z1Lp4tNWwSB9AIJBe5wGUFJBpWt/bfXHo670+GTv5fFx1/CgC9NJAAibBKmz4BhjVOmfWT4GG
	2l4hizBl3PmxkoAtA+42gbJg120cIyGOPt2yHx3F/dinwT7U=
X-Gm-Gg: ASbGncuylygz5IvKsrGYuLS1p+zQcd7R4XA/AnmvAP6jLOKIBgO0ltZwKSG6TPfwaRg
	FPJ+U/c8dSpWMlC/GMxKrV3+ZNtE86ir4505Ao/dNgXmaNzZiOKEoKhDsOTbdmmynsyiltEsEzA
	MGzzRqpQygOHx9Ida+xSllifrBp6x+V9H4
X-Google-Smtp-Source: AGHT+IFOMIsPRB6N77R/jqBwaSjy0jmjto+6IHP1IR9XhbZIQXfDLlpLMX4TWO85MDI4QzsKiGldRFQrkRYAnblk9Us=
X-Received: by 2002:a05:690c:4b0f:b0:706:ac56:825f with SMTP id
 00721157ae682-70a3f9ec8e0mr191260187b3.5.1747087309387; Mon, 12 May 2025
 15:01:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250321102422.640271-1-nik.borisov@suse.com> <CAHC9VhSpgzde_xRiu9FApg59w6sR1FUWW-Pf7Ya6XG9eFHwTqQ@mail.gmail.com>
 <67f69600ed221_71fe2946f@dwillia2-xfh.jf.intel.com.notmuch> <68226ad551afd_29032945b@dwillia2-xfh.jf.intel.com.notmuch>
In-Reply-To: <68226ad551afd_29032945b@dwillia2-xfh.jf.intel.com.notmuch>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 12 May 2025 18:01:38 -0400
X-Gm-Features: AX0GCFtgJv-4_VcLPYA2b-6hwyHqoFeVQTahFrJ-tcQAIU0sDVq-uYd-lD9xr08
Message-ID: <CAHC9VhSyz2MqMjnHFbTiMqYvhAFZf162ZabnSsyyCQEZj-V9=g@mail.gmail.com>
Subject: Re: [PATCH 0/2] Allow individual features to be locked down
To: Dan Williams <dan.j.williams@intel.com>
Cc: Nikolay Borisov <nik.borisov@suse.com>, linux-security-module@vger.kernel.org, 
	serge@hallyn.com, kees@kernel.org, linux-kernel@vger.kernel.org, 
	kirill.shutemov@linux.intel.com, linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 12, 2025 at 5:41=E2=80=AFPM Dan Williams <dan.j.williams@intel.=
com> wrote:
> Dan Williams wrote:
> > Paul Moore wrote:
> > > On Fri, Mar 21, 2025 at 6:24=E2=80=AFAM Nikolay Borisov <nik.borisov@=
suse.com> wrote:
> > > >
> > > > This simple change allows usecases where someone might want to  loc=
k only specific
> > > > feature at a finer granularity than integrity/confidentiality level=
s allows.
> > > > The first likely user of this is the CoCo subsystem where certain f=
eatures will be
> > > > disabled.
> > > >
> > > > Nikolay Borisov (2):
> > > >   lockdown: Switch implementation to using bitmap
> > > >   lockdown/kunit: Introduce kunit tests
> > >
> > > Hi Nikolay,
> > >
> > > Thanks for the patches!  With the merge window opening in a few days,
> > > it is too late to consider this for the upcoming merge window so
> > > realistically this patchset is two weeks out and I'm hopeful we'll
> > > have a dedicated Lockdown maintainer by then so I'm going to defer th=
e
> > > ultimate decision on acceptance to them.
> >
> > The patches in this thread proposed to selectively disable /dev/mem
> > independent of all the other lockdown mitigations. That goal can be
> > achieved with more precision with this proposed patch:
> >
> > http://lore.kernel.org/67f5b75c37143_71fe2949b@dwillia2-xfh.jf.intel.co=
m.notmuch
>
> Just wanted to circle back here and repair the damage I caused to the
> momentum of this "lockdown feature bitmap" proposal. It turns out that
> devmem maintainers are not looking to add yet more arch-specific hacks
> [1].
>
>     "Restricting /dev/mem further is a good idea, but it would be nice
>      if that could be done without adding yet another special case."
>
> security_locked_down() is already plumbed into all the places that
> confidential VMs may need to manage userspace access to confidential /
> private memory.
>
> I considered registering a new "coco-LSM" to hook
> security_locked_down(), but that immediately raises the next question of
> how does userspace discover what is currently locked_down. So just teach
> the native lockdown LSM how to be more fine-grained rather than
> complicate the situation with a new LSM.

Historically Linus has bristled at LSMs with alternative
security_locked_down() implementations/security-models, therefore I'd
probably give a nod to refining the existing Lockdown approach over a
new LSM.

Related update, there are new Lockdown maintainers coming, there is
just an issue of sorting out some email addresses first.  Hopefully
we'll see something on-list soon.

--=20
paul-moore.com
