Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877392D78A
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 01:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744767984; cv=none; b=CkXEk6TSsCa7whk2w1T0LhlVCl49QRLpI740B8pqniLhttd8PYnr5eY3OnxygZVsHcE4fq7HnXjzjbxl8vnT8x4sOH204TDjnzwiWVcqntHEx9VbS1SdUGdpmEMmsd1xUOB8OD9PSHrZACbcRazJlm0d9BFVW+5RTEzR6MjQf6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744767984; c=relaxed/simple;
	bh=slMNd8V2GysT0NTYZWzzGoLITlsJBv2wSc+G3gFEgqk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xvtdb9Zz88hpyQaDm7A2wjuOuN/85obtCIlkbKGqUMBYSSn6haBrztPyFfPZV6TNDMAVH0fxABdyiRryjZTsbkaKIA2HE/L5dhW9/i/DchBKvNozyvraExLLvDuNP3gylT6bbbvCZCvtM6DfR4Tsm7SUwTlSQKmRJoX4QknuLsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YCcpgkhx; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YCcpgkhx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744767981;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bAux2x29rzru79GAnli/9y6p/hjt91wz4YpqymUDDzs=;
	b=YCcpgkhxRY5AFzBwsw2pzXg/FvjkkUDF+3bvmecmDNEKEB1zpV1sCSYWDSXK8zrPMi5GSe
	5d2IBVZnUeqDnc62ytwFSYJUvzjgyww7Hrs00a7gDIxnnvHQ/2IQzE9/e1Jz6qf7t5ocZr
	sY3OjOVAsk7tHJr3rG+KAHTfspVUuo0=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-665-goTQQhlmPx6TbM4fcjSIDw-1; Tue, 15 Apr 2025 21:46:20 -0400
X-MC-Unique: goTQQhlmPx6TbM4fcjSIDw-1
X-Mimecast-MFC-AGG-ID: goTQQhlmPx6TbM4fcjSIDw_1744767979
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-af2f03fcc95so6246435a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 18:46:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744767979; x=1745372779;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bAux2x29rzru79GAnli/9y6p/hjt91wz4YpqymUDDzs=;
        b=ng+UnmeKWiDkoBBM2rnhOPoIDZ6hnfRThBPZaxb8EjRI9Hzy6LgDESjqMmQdhWSF0K
         VYa8SE+QBa2PiaGUy/WNwcXmNb9CnUBplXQfQymp1gDDf8bvpr68BQygXl3oM5DEEQGj
         RN1QheuAycsZnvGgEn7e2cCJWtZvqLIUPMUq2BnavWz/n88Z4mdo5ae/Yug2mFvM8QPE
         la1eKAdWcRyBPRLRMwyIIHhpb8DDZ24Xb+vSigNnGgeV4n+B4+TyJfCvuFFTLuLDHJ3j
         qR9uP86b1fG8UiOosowxMCF3rPXknHEXgG4FvwGSxfjWZhPiUQVJZIFae74eKZi0pJ7Q
         70sg==
X-Gm-Message-State: AOJu0Yw73ivnDBvU39PHZrIKPv/+rn16vV1oA9oAbjE/rzI+EyYuCyvn
	bTUrBc3lQt6Z5mW5QzzAdf7j3K9KgmnUr6k5iafp2fhCxsVcVab3wGEGs+r5HMSNyNEjpCAbAnq
	5oCmUIZ17aTWDSx6wKcfKIPFJYP+FPdvTLhuJ2qvXGHgWsPpqQzyKK23j43+JrfkCA2pYgygnRB
	O9foRPSNYBON9atMyXuFDI4uH6vAZFDoUVnlryrPTKZC8d
X-Gm-Gg: ASbGnctLxtYnM/h26hYQa3/kvfaYs/7B5P9/TVOvzXgvsDMo9OcRXwNZEZbvQSTqTeT
	onXMnXl9L2e7J1DURN4LrqlDeIAdy4LF5FDJfj5jQB6KSNIKHB0fPyEi6QVrUVkADDXI=
X-Received: by 2002:a17:90b:264d:b0:2ee:aed6:9ec2 with SMTP id 98e67ed59e1d1-3085eeb4675mr2220916a91.14.1744767978880;
        Tue, 15 Apr 2025 18:46:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGVAUDYX1fc9zo3gyEt8qqe/RuhMfN8ThzDds91F5a1f+kZ++CgF1OWTJE4cpzcWzli2Hyns3BIdFo4trIBp14=
X-Received: by 2002:a17:90b:264d:b0:2ee:aed6:9ec2 with SMTP id
 98e67ed59e1d1-3085eeb4675mr2220892a91.14.1744767978471; Tue, 15 Apr 2025
 18:46:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Z/anHRAx3SQWr+h8@animx.eu.org> <Z/2pzDAplsZz8AVd@animx.eu.org>
In-Reply-To: <Z/2pzDAplsZz8AVd@animx.eu.org>
From: David Airlie <airlied@redhat.com>
Date: Wed, 16 Apr 2025 11:46:06 +1000
X-Gm-Features: ATxdqUGaR9ylaT4IMINZhWP69BAL6dWZUQv6Kz0vm82yhI7-yxIZA-d8PtCceR0
Message-ID: <CAMwc25rKPKooaSp85zDq2eh-9q4UPZD=RqSDBRp1fAagDnmRmA@mail.gmail.com>
Subject: Re: MGA G200 issue in 6.12 and up
To: Wakko Warner <wakko@animx.eu.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	dri-devel <dri-devel@lists.freedesktop.org>
Cc: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

adding some people

On Tue, Apr 15, 2025 at 10:35=E2=80=AFAM Wakko Warner <wakko@animx.eu.org> =
wrote:
>
> I found the fix that works for me.  See below.
>
> Wakko Warner wrote:
> > I decided to upgrade to 6.14 on a system with a Matrox G200 onboard vga
> > (supermicro X9SCL).
> >
> > I use this system via the BMC.  When the mgag200 driver loads, the bmc
> > screen flashes between no signal and the screen.  The rate seems to be =
about
> > 1 second no signal and 1 second with signal.
> >
> > 6.12 and 6.13 both have this problem.
> >
> > 6.11 does not have this problem.
> >
> > I have a monitor plugged into the vga port and it doesn't have this pro=
blem
> > on any of the kernels I've tried.  Only the remote connection through t=
he bmc
> > has this problem.  I have booted the system with and with out the monit=
or
> > plugged in, it does not appear to make a difference.
>
> I found a thread on arch linux forums
> (https://bbs.archlinux.org/viewtopic.php?id=3D303819) where the op has th=
e
> same issue.  He bisected and came up with the bad commit.
> That commit is
> d6460bd52c27fde97d6a73e3d9c7a8d747fbaa3e drm/mgag200: Add dedicated varia=
bles
> for blanking fields
>
> I searched this commit and manually reverted it from my vanilla 6.14 and =
it
> works fine.  No blinking in the BMC remote console and the external VGA
> works fine as well.
>
> --
>  Microsoft has beaten Volkswagen's world record.  Volkswagen only created=
 22
>  million bugs.
>

