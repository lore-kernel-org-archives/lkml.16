Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC05F2376E4
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 19:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750362640; cv=none; b=Zmqf9Guo99kHrD1qGC8L3za3MZBesoxn5khqwLJ7wQ8XjRYnQk27f22p/HMgOlFuoJQDpPOb7fxUieFxfzoavsMPY8cXtt543YVDOkxeH2zL06nXSkyuPXDy1+idO7ZJhZSU/vMfhbHJpcr/r06nd+zyLpCtU5tS6LkWifVTiMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750362640; c=relaxed/simple;
	bh=u6fU0wkban8cgA6TIBNGibUvihvY6/CDKN1BsBFONmI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EnXvvsJHeqKYRfSSF4fx2pRnSSBhkuH83Rf3wmDBXGuPoDzNKBOzyrzd3XhrKRzXNI8CxXfhcoStztf9Avt5eSQ0BKz6q1bGDFcBuGlcD/vK/zswus0kln1DbgR3bWBmlJJYVNAM+ibcgVXZLXdcJcfj5wtCCRJXBL9eIu/oMp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=k9/mlCmt; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="k9/mlCmt"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6fadd3ad18eso12147146d6.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 12:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750362637; x=1750967437; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=u6fU0wkban8cgA6TIBNGibUvihvY6/CDKN1BsBFONmI=;
        b=k9/mlCmt1X4e/QbtHx5261GOQ29Nxl3rFdv2vTguHaI9pKPyUh3Wwr6FEOmbQrpet4
         dWeJyhBwq/tj7c6dT8JrThhZtMCD9iaAei9iRNOLGs4RPK+czQ6EqFx0XeFfajlQysco
         /zKFv0175aGNY26MPYP2ykPXDTblh9ymkIDl5iCz1xEcRvGTZsoo7wN3uKG0we/+NoB0
         qtSZWgPEAzuNY7JgbSzFkYWnc8O1FouMeemAWRJpDNFgoJM4wyKo3h/JNNL5NzmbKNSi
         cQ6rw/9bJvtufgwmzRcU6NYtiwtx2eWuHZJIsClh97VvU4vF4qrxKn7Nn1dmluYdV3Al
         wlOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750362637; x=1750967437;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u6fU0wkban8cgA6TIBNGibUvihvY6/CDKN1BsBFONmI=;
        b=lXtFK4lGVtMwJHa+FYs+93WPEQ42P9YkocxjP7tt/w41PJJryiZ0VMfCY/QKPjRAvF
         4ZCckAN7QpN8WBojA33tduClUgf6Uj9iX4n2Jx81V+A3A7Vzqn2G8mVxdApRJiN/3Kks
         IRM/EL33a7bpMFMS0MZ0wE+ROJljmR+DlzWTDOUMUrMKBx1INXXqQnJ3YW69E/0XQztS
         yMkHYaoKbSETslP4mzAYSxqaZ9iyy18r/deI00ThRk4h0+M2PCc99UBhkN2ThktObJGT
         1bFhVxvlD+IngLaOCvaw2LTCoDkLO3g3wIT87WN7PX0UO+SrThY6edgBvlunGyW/302p
         a4Cw==
X-Forwarded-Encrypted: i=1; AJvYcCX6eEpBR4Ak622drl5roB3U4Q5CrfoLQDitFHdc0oqaiOaXHpJSvVq74Rg20Da+ZmC2YBjfGji7IXCszc8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBu9Eg3H5pPC31WWUE9OdKu9VRMs1rINmElCmEh1MT39etp2eZ
	zBsM23eUH8M4uQJqMl401TUuMfuYcvrugwdQU1S4nCNgzvpyxfN1DFetN3x52IWHcKqsKIDV8h9
	adHnOJ2nWzXhc+lMDavcCNC8eYHBjfHxJn1M3KFzh
X-Gm-Gg: ASbGncsE7I9acjiI10dgQHjyhowjPF3mxLuIOiQheck4xxPQjd8mNXL2PKuGbH5AFUG
	LKhppzB/H89NNCBBrgwom+PMFrkZuzz2yyzc2tHnY8MSNUGkg1mA4TSKzhiHuNchPdtUqatEAVq
	5Pdsp3vPJlCTjBXNMze287EvQJXq+5fGMQCH4qvRd+72BuRVMy2HEjKmqq9xMcdAHtKZimJb5b6
	GyCJU1Y76zt
X-Google-Smtp-Source: AGHT+IHE26LvRT3IO+Dxq1WOGpRw9xwlz4WIqDkIYFQhiqHa13y0vAtaMtNRXgya+a5H4Ntw2scaAI9cGMoZTnfEKFc=
X-Received: by 2002:ad4:5bee:0:b0:6f9:201a:c05d with SMTP id
 6a1803df08f44-6fd0a53b861mr7133776d6.33.1750362637225; Thu, 19 Jun 2025
 12:50:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250617221456.888231-1-paullawrence@google.com> <CAOQ4uxgaxkJexvUFOFDEAbm+vW4A1qkmvqZJEYkZGR5Mp=gtrg@mail.gmail.com>
In-Reply-To: <CAOQ4uxgaxkJexvUFOFDEAbm+vW4A1qkmvqZJEYkZGR5Mp=gtrg@mail.gmail.com>
From: Paul Lawrence <paullawrence@google.com>
Date: Thu, 19 Jun 2025 12:50:26 -0700
X-Gm-Features: Ac12FXwfl68qCDHrJbziX8qTOPC7H2Im2uXQfIh8FjRJJeTT5dXjEv4aeNDCOi4
Message-ID: <CAL=UVf707OokQUuhzbvrweFziLVmiDD3TFs_WG2hRY0-snw7Wg@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] RFC: Extend fuse-passthrough to directories
To: Amir Goldstein <amir73il@gmail.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, Bernd Schubert <bernd.schubert@fastmail.fm>
Content-Type: text/plain; charset="UTF-8"

Hi Amir,

Thank you for your detailed reply. My intent with this patch was to see if there
was interest (a definite yes) and to see what path would best get us
to our common
goal.

I'm thinking the best approach is to start with your ops_mask API. In
fact, that solves
the biggest single problem with my future patch set, which was that it
was going to be
huge and not realistically divisible, since you need everything for
directory passthrough
to work without the mask. Your way allows us to proceed in nice
logical steps, which is
much, much better. Thank you for that suggestion.

So my follow-up question is: What can I do to help get the
foundational patches you
wrote upstreamed?

In the meantime, a few thoughts on your comments. (Note that one of
the beauties of
your suggestion is that we don't need to agree on any of this to get
started - we can
discuss them in detail when we get to the specific ops that require them.)

1) Yes, let's use backing_id. I won't mention that again.

2) The backing path per dentry comes from the way dentry_open works.
If we are going to
attach a file to a lookup, we have to put something into the
fuse_dentry or the fuse_inode.
This makes more sense once you see points 3 & 4 below - without them,
we have an open
file, so why not just use it?

3) A cute idea that we had that seems to work is to allow negative
dentries as backing
dentries. It appears to work well - for instance, a create first looks
up the (negative) dentry
then creates the file into that dentry. If the lookup puts a negative
dentry as the backing
file, we can now just use vfs_create to create the backing file.

This means that only FUSE_LOOKUP and (I think) FUSE_READDIRPLUS need to have
the ability to accept backing_ids. I think is is both more elegant
conceptually, simpler to
code in the kernel *and* simpler to use in the daemon.

4) Having to open a file for it to be passed into a lookup is
problematic. Imagine
readdirplus on a large folder. We would need to open every single
backing file, and it
would stay open until the dentry was removed from the cache.

Both of these suggest that rather than just passing a backing_id to FUSE_LOOKUP
and FUSE_READDIRPLUS we should be able to pass a backing_id and a relative path.
This is where the idea of putting the backing path into the fuse
dentry comes from.

I don't *think* this creates any security issues, so long as the
relative path is traversed
in the context of the daemon. (We might want to ban '..' and traverses
over file systems.)
Again, these are details we can debate when the patches are ready for
discussion.

But again, let's start with your patch set. What are the next steps in
taking it upstream?
And which are the next ops you would like to see implemented? I would
be happy to take
a stab at one or two.

Paul
