Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D21BC214216
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 20:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738789107; cv=none; b=WlPjAULSXusMsDWz9E5tQSGMGlX0Z2RYhMMr95gX7fhtebsTL9iun/OdPRinVHaEvM/R/7TtHuxsRMi7FWr9wuUeiaMOcvXPkwbOxAMh0P5Wmcn8+fHsqQ7OkDZcSQOTwFbkTmbC6qDRiNXurf4HgxbQN9YPPO3R70+fIykxZJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738789107; c=relaxed/simple;
	bh=zIGOlPe7UaMVUZRe697ETxPeGQtM2sHOvKFWpCKuHBk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=CL+IBR0UfZ3fJbi2ZNhTK+VNcsQ81JNxxXtM0YvFpLNWu7S0x9ebry1Z4qPiasixDHv/SwNJ5RinvIPoSbn1nEgk6/mtHOwq2taASauyzAW1yW4Qf9RRlmvZYnnegJGhihKDhIo/Mze2arc3g0yX+07dBxq4JjTWJfy7c/2HKVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nSC+qw4g; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nSC+qw4g"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5d9837f201aso2634018a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 12:58:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738789104; x=1739393904; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LFtFpiQi45n5NJYuVtm21fvpqTM5ytcVeKgjnkRWfq4=;
        b=nSC+qw4g2e/Te7xmMBe/OBiYn3A1VXDH661M4EUVMB8qqAFD8twES8EOxIogltRyEr
         F0Aw3LZVzqJyeKmNwhIUemEM8tS3ruNiU/3wdVgIFVmGM7ljzKvDOEdOfeneCKJta23T
         PYl1I20OumSuZ9yM5RwxURqXyAus4Ahw0nY92i0qygEA1dQsReNR6OseS5dEZ7IZFcl/
         3zhhayE7uy8J/mCC0FuQhwHcHi+3EylH4phbHpfVCMb4Gmy/Ej6bGx+ok1LFYdaDMXv/
         WN5qnYqlHPNAtwSfvIGqh5jG5LKmGOD0I+xXxSRr2pKnwKSnc15K9BdO9A66drR7+wvS
         9N3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738789104; x=1739393904;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LFtFpiQi45n5NJYuVtm21fvpqTM5ytcVeKgjnkRWfq4=;
        b=E+MWmB0gIe5Nse+S36ofz+KMGQNP9ZC7jIPVSkVzHHTbC4QEkefl2oNzRFEJHRTsQm
         O7E0WBC9P9otHGLlxevaj7NEWqxfLHEdM53Mv+ifc/+NDe3nFuXANUrsitsmGpR5e5uK
         a9DO1HOz/855ZVVZSZ+j/1owKresJsloHnAwuySoFWHB+a1jm8JxpVlGQu8B6EM6Cy68
         xTcrYWPpM2iRRyqpgk5MBzHqSN1EVEB25YGoiTdfnki09G58gkaUxcQLUPY8LXvjlf7I
         i2eqbr1t0N1GTgZ+dd33AfsQgrxEc7Fo4rhAinw/QK5EM5UjnAhIaRwDTB07h6+/+OFq
         gcBA==
X-Forwarded-Encrypted: i=1; AJvYcCUYyjf+vI4gaKCqAqnMxjvGjlnA4gd8BeCiCoM16KDR0Ah+BP1YAawzHhkNHgIqeuaOkcFIECyFhBBgDkU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvXSExt0yVUE5E8vvPF5thahmiiDGoOMkDwCKmTPVwf/bSd3hc
	AspDSV3Xy3xRza9wB44COVi1jwyOmux3LN/oC57v2W60WcW5S6xfZkvvBWO4wLhswauyVb9fT93
	7RmNendxKTONqCGpiw1dEGinkAX0=
X-Gm-Gg: ASbGncsoVtLK7nun5+ia9SNU7C71btT4UJGcu+OVepEIRXmELIJjC78NcxyYACLfVPU
	hUrgG/N7gYp/ZbdROeXm2VViHsv/7yQ772T2jO/swIJ9bUTq4W+dv8dn39b9drknQWOuNCq8=
X-Google-Smtp-Source: AGHT+IHaJtIkCbhRnM7T0U9sFzys6SSEzNFeiS4vor7SeytR0GDNyDvvBJEV8yXc9k6XtQmUPqjVxsUvc/jUeTHme08=
X-Received: by 2002:a05:6402:3807:b0:5dc:eb2:570d with SMTP id
 4fb4d7f45d1cf-5dcecc4ee72mr841059a12.2.1738789104002; Wed, 05 Feb 2025
 12:58:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250205193221.402150-1-mjguzik@gmail.com> <20250205193221.402150-4-mjguzik@gmail.com>
 <wzbq4zk7uln5pzjkho4olu3hku2xv2taxymv3ien437tjxivlm@sz5kxj5oohsq>
 <CAGudoHGPAQYwVUEYgxMYZ808=wAO3RteLsqNgG21pvE8Gfs_eQ@mail.gmail.com> <jamcxevfeuzsqhsj7b5o7jt2avfqpqmcahwadiwnayj6cwqpvf@psksqzyktksg>
In-Reply-To: <jamcxevfeuzsqhsj7b5o7jt2avfqpqmcahwadiwnayj6cwqpvf@psksqzyktksg>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Wed, 5 Feb 2025 21:58:11 +0100
X-Gm-Features: AWEUYZmPPYI00--ydo7whk6-VBzU1Q0LQcOBF2Pq12KpaQsF6sdK5giJAb9EVuU
Message-ID: <CAGudoHGUvBCJaY=hnCXLo8r=GFs9wMiM4qf=0_8-rBXqexFqDg@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] pid: sprinkle tasklist_lock asserts
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, Mateusz Guzik <mjguzik@gmail.com>, ebiederm@xmission.com, 
	oleg@redhat.com, brauner@kernel.org, akpm@linux-foundation.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 5, 2025 at 9:42=E2=80=AFPM Liam R. Howlett <Liam.Howlett@oracle=
.com> wrote:
>
> * Mateusz Guzik <mjguzik@gmail.com> [250205 15:34]:
> > For this specific case I don't know what can be written in the body
> > given the really self-explanatory nature of the change, other than to
> > spell it out(?).
>
> You could say why you added it?  Is this something that was seen
> happening?
>

I guess this is a cultural discrepancy, if you will.

I spent most of my time in a codebase which is very assert-heavy and
if anything you would need to justify *not* adding some, let alone for
locking.

Plugging a gap of the sort would not require any explanation.

The kernel has numerous examples of mere comments stating that a given
lock is required or no information whatsoever, which one can only
infer from context. I'm assuming this predates lockdep. Given that
lockdep asserts are nops on production kernels there is no legitimate
reason to continue like that (or *avoid* asserting on lock state) that
I can see.

I'm going to sleep on it, type up a sentence or two, maybe reword
other commit messages and resend.

--=20
Mateusz Guzik <mjguzik gmail.com>
