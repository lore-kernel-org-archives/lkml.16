Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA33221F17
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 06:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751609521; cv=none; b=dU+X/fmcn3mgu7B+Q0sG8Ijn/5JSraU7stpLs7pmKQZOsqBuOkaY6b7253dkIupeA+VXot5YItDscYyVzigEmP/8LmhdODl7HjaS5JprMQXDpvw3nw83/Z96Uy4Lf/dHuC9VQIZBsF6F0uP1HY00qjuWi2zLkOOV426rbGn9U3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751609521; c=relaxed/simple;
	bh=hMc+aIJ7kLoH+UQ/kXDlMN+l4/xBGX0Li+n3wuxBfzo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vy4Zt+VckcYp1uWrsjj35Chf2chq1lME45FVd5CcvDb+MSIx563DDoVHKEO2H1iA5BA98mARcgkp4U4zdmTK3VUK5yh1tbU2slzC+f31pWz6sIeaQi57/YrrbCq01k+9eqPIF0wjk9PHAZ7hty76UlzO0XFFR8Nnta4T2DrK9rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=altmTaNn; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="altmTaNn"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4a5ac8fae12so780411cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 23:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751609518; x=1752214318; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hMc+aIJ7kLoH+UQ/kXDlMN+l4/xBGX0Li+n3wuxBfzo=;
        b=altmTaNnbkjooZ1sQaftpnXOhxjh6Mxez/rhzOAwQTfYfzEW46eEV5ebvpZ8gJtfSI
         MloRb/8dmwLzQyjwds02vC5hGjDUkOwBwNBWuvxiO7N86QsYx54BLxhMNG++n94hWGc8
         SBIooZOXGCXGORr8PLwREEU1mF81ai9GGfbHmEnt+RPUr8ha5+uogTHA/2IBVwBOF40q
         yqK5eeIrh5U3VM5y4ruBPMubWumfXgbaxhhDe1NujajKWSuiJf2o5hZIkosUJaQ0fulX
         VL+auRxav6NVMHE/V1zrIEolI5oHTeDuOeXM/a2QjthXGpVDAzf8pNbfDkBZWCrhEP7H
         xl/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751609518; x=1752214318;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hMc+aIJ7kLoH+UQ/kXDlMN+l4/xBGX0Li+n3wuxBfzo=;
        b=uvUQ8tq2gtZOA6YBv9S+JMwzMUgxequVt99zgAg9p32krEasxXs1E4rMHWPGLRPIp2
         q5reHZNjQ9EgYZqiOWVeOBYH4mO5b7vhLCXpiYT2vS7IudifQnsqrMnnx97JroSCDeMO
         22XKBefh/PkWDoArKlDj6ivDFlKjCUFdQcOFkGrTDcrVeBvFsqmSp6jIxrKFLp4v4TXd
         +rbQrSmS3PDGzx7tAvB32GBRJp+/Aj1ZXZidlhjgD5nudNOrV3516TPe8N7CYwUs3fiD
         W+Acx6d7e9ESeuBuEiPFgpGvfwyhc3yCpW25mNCV/LDh5ba5l0Ng9iGKLBopgjGjb8N0
         FT6g==
X-Forwarded-Encrypted: i=1; AJvYcCXFCOpZytndd7mSnXbX2A/cpcove2rrTuz7rbGJ/isZTv/BISVKJoUEiR55z41p3OxfNpzahsW3Z61lHTU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJlLDDh2XzTWfrClydWCpKqhShyTt5ngLvLNs1BlUMsduzyp6J
	6co6RsGizETZ66H5/IENJHHshlFwERKdlhgBwgZhMeyEP76XHzwMCoPfBi0y7IbhgB8cjHFAGHW
	6wqktRmgQrGXyVg/oXoVwzpKvAGbqojLCWL5Nyy8Z
X-Gm-Gg: ASbGnctZjr6RIgh0bCyallNVktaFSWIBmT7tJtD7IbOk3hpw0Vgm/ZuN8EMaGhheEVX
	F73pMj8J4+ycEEY1HhH+e0mdcXs41f/nxicqbmSaUmNrvwPDQCXWww6kK94eBqi/c7lb/qdsWJp
	iFY2xCCIU+JNeJ8hlN76wRCDQjgjrvsb+PnZz7wfzpyY/Msn/P08xrMTW23jIr0GMKM2PP/WAsS
	A==
X-Google-Smtp-Source: AGHT+IGGsgK5UrMb+CWNMeCqfh35qQjYAaPkxgrs/2huKaQcGjOWFhk54xqRPjFJ34czRDh4/7okGhbn4if4HaXCIQ4=
X-Received: by 2002:a05:622a:7291:b0:4a9:95a6:3a69 with SMTP id
 d75a77b69052e-4a995b57f4amr836381cf.8.1751609517865; Thu, 03 Jul 2025
 23:11:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250702135332.291866-1-aha310510@gmail.com> <693725d9-a293-414f-a706-f77446e335b1@redhat.com>
 <CAJuCfpHrJGrYcfchz93t53gQjhu4nCrcBYK44LTG1DxWywu5Vw@mail.gmail.com>
In-Reply-To: <CAJuCfpHrJGrYcfchz93t53gQjhu4nCrcBYK44LTG1DxWywu5Vw@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 3 Jul 2025 23:11:47 -0700
X-Gm-Features: Ac12FXx8vIiJs7EF8OTIFy6KyUzCKGVn2oXdl2K2lmYzi7o71AH39rIWUEsNO5A
Message-ID: <CAJuCfpHi_Stt4H1DFSgjEJ=pduYbR3keZqAozLcxBReHjjHiNw@mail.gmail.com>
Subject: Re: [PATCH next] mm/maps: move kmalloc() call location in
 do_procmap_query() out of RCU critical section
To: David Hildenbrand <david@redhat.com>
Cc: Jeongjun Park <aha310510@gmail.com>, akpm@linux-foundation.org, andrii@kernel.org, 
	osalvador@suse.de, Liam.Howlett@oracle.com, christophe.leroy@csgroup.eu, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	syzbot+6246a83e7bd9f8a3e239@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 2, 2025 at 4:34=E2=80=AFPM Suren Baghdasaryan <surenb@google.co=
m> wrote:
>
> On Wed, Jul 2, 2025 at 7:44=E2=80=AFAM David Hildenbrand <david@redhat.co=
m> wrote:
> >
> > On 02.07.25 15:53, Jeongjun Park wrote:
> > > In do_procmap_query(), we are allocating name_buf as much as name_buf=
_sz
> > > with kmalloc().
> > >
> > > However, due to the previous commit eff061546ca5
> > > ("mm/maps: execute PROCMAP_QUERY ioctl under per-vma locks"),
> > > the location of kmalloc() is located inside the RCU critical section.
> > >
> > > This causes might_sleep_if() to be called inside the RCU critical sec=
tion,
> > > so we need to move the call location of kmalloc() outside the RCU cri=
tical
> > > section to prevent this.
> > >
> > > Reported-by: syzbot+6246a83e7bd9f8a3e239@syzkaller.appspotmail.com
> > > Closes: https://syzkaller.appspot.com/bug?extid=3D6246a83e7bd9f8a3e23=
9
> > > Fixes: eff061546ca5 ("mm/maps: execute PROCMAP_QUERY ioctl under per-=
vma locks")
> >
> > That commit is not upstream yet (and the commit id is not stable), so i=
t
> > should be squashed into the problematic commit.
> >
> > As a side note: the patch subject of this and the original patch should
> > start with "fs/proc/task_mmu", not "mm/maps".
>
> Thanks for the fix Jeongjun and thanks for the note David.
> I'm preparing the next version of my patchset and there is a much
> simpler fix for this issue which I'll implement there. Planning to
> post it tomorrow.

v6 of my patchset is posted at
https://lore.kernel.org/all/20250704060727.724817-1-surenb@google.com/
I reworked the last patch to address this issue by narrowing down the
rcu read section to query_vma_find_by_addr() only. That should fix the
original issue.

> Thanks,
> Suren.
>
> >
> > --
> > Cheers,
> >
> > David / dhildenb
> >
