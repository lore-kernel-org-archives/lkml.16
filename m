Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E776211A0D;
	Fri, 13 Jun 2025 16:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749833198; cv=none; b=buiYjLYY651Hgta+VMUWdkKxA/u9YjO+/GrikIBZIhevV64FhDUULnmiPxaCc8/bHaeKgSjrYX8cWLtjaXNRDOngRekJEdetkz7AabMTJCZbp3ovvLE2t8vbyQTSSsbPT0EPted6AndHXPFaXeMhUbLjKSnD8VvEimp8F9TVTLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749833198; c=relaxed/simple;
	bh=qy48ViaN3if55ls8Ik4eE788CPNqNwEPM2Qlx4wnVvY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=neBh4qwgr+zHOKI3dysJDlwJ3ftSaKVLCWiMWeZJu964Y3pLmIVEA0UhyrPW8lvpKCtm7OTTkDdkDWPew31Gib8InidTEjGL6C85q2+wzA3Egwzp0bS0zikQeRe+JRLxvTWpuL6lnd3XrAtn+K6dGuxo5VCFpb7gVtoA7q4pd2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O6XRuoG0; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O6XRuoG0"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ade30256175so430252866b.1;
        Fri, 13 Jun 2025 09:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749833194; x=1750437994; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8b+XF1R6IDkuZBmPOk+AjM7WkGgjUBKP1V8hx4ecgO8=;
        b=O6XRuoG0S7GW9Gz9SODxB0VwuVfUtey9vBSipW8LeIEqZU/hKAARJ6ur5PmCLHmkDb
         tERq0lEDMQUftSGqc5Q2OEFrt0vVVjJ9votWY84sVWNPGge3BF1VgIeVLuonDTPwuJ3G
         X6dUZGxpSzN0tbGqiwjAKJjNf7u7WC2wPRSaHpg/RZNa+Qv92pFeP31Tn+UFybOldqCi
         wIkYT65kYXAomxPdJRxCJ5RDxS+NjCL/g48VhSSAFMjIVTOv2RKv51+y3DGX3sxEvdeI
         qSYVi1KqOg0iYwqvNMq3yd0ARzQ464mgUxjWvZDJB5kygyoQetyBtrHkyMQsSrEP4qIc
         EStA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749833194; x=1750437994;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8b+XF1R6IDkuZBmPOk+AjM7WkGgjUBKP1V8hx4ecgO8=;
        b=l3AdxyUktiFjbBpkBBvf3QfJ1kV/MNSqcoq54iN65f3OKiKjc9h4Jev+LLD4djNCGA
         NOKVR7NLi7B9gMMngVkFDqz3GGoeE4/aZ42I3PRslX8ILKOTtDSDOLCxrRr+n+P0gpwf
         sRijcFyRPr1fy7W2xFBnkvWIq4XzRDvtgpAFc9R9j5b0ZsZ7f8P+Ig0ZcEl9TpTPdvN7
         SCX6JsXg6avmaIvFJIQ1kKjqE04QEZ7LwI0Eeexv9hoof9PjqJh4sqDieVSSHLkqgqzf
         HUUarWpvsSZC876Cip1DcTMwwukOmZk4iIa13qmzlD+9rZyChYgC+FAaqTY+kZWSFxzh
         +Gew==
X-Forwarded-Encrypted: i=1; AJvYcCUtN1SqN+LW+yyFJJSZBiVtJbamvqXQMRZSQnUfKeatZBJgKqD8Nn7OSc7g2nKRExLGTnwFq2Jw+IlvsD6h@vger.kernel.org, AJvYcCW/pEfyyLebHxz3QGuabroUXvRuF3Z3xhcRKU/lEcaqw63qt4QmN5lbyU1s+ZJ+RCz69JFRTqeTqJw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhzoW968tQ5rWlkdkEiebDD0FOcCXRssfWsaP+aKEGw30c9qyJ
	gdwSENqnqM2ukXqxb/YsnitjANTjuSAP9T3i+aDoY5LfpLsgrO9HJuPg4xEFsJoz32JHwfL8Cdl
	FEriytkroqwNLtLojSRCQNrzKmLwwHZk=
X-Gm-Gg: ASbGnct5ydv6NEjsrIr4ZSQYYxBgCzIwP38XmeJJQ8CCoOZM0RwBjL8fpYZ5YKz+lOL
	923J/TmCXhDDQAaYglmHSCcKM6rSM4DsAKpTQLAUWJdW/UFnxhORl8INH/F9ySpvcJqSVhBKsxv
	4MV68EnFg2pofLeCEYBVwEVvNYusCmUpZp7ibmYcYZBEZFMDwd4B784iBKYQB8mNmlZd2Hl3Vel
	9wl
X-Google-Smtp-Source: AGHT+IFAM+0ARMBkOl378yE7TD1p2iruVPP2VsDOQczbz9maxLgWC1Hy5JyiV73B37TmNy5naByi7YIX04Dwzauu6Js=
X-Received: by 2002:a17:907:971e:b0:ade:32fa:739e with SMTP id
 a640c23a62f3a-adec54dac66mr411183266b.2.1749833194107; Fri, 13 Jun 2025
 09:46:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250612181330.31236-1-bijan311@gmail.com> <20250613152517.225529-1-joshua.hahnjy@gmail.com>
In-Reply-To: <20250613152517.225529-1-joshua.hahnjy@gmail.com>
From: Bijan Tabatabai <bijan311@gmail.com>
Date: Fri, 13 Jun 2025 11:46:22 -0500
X-Gm-Features: AX0GCFsgz60G6jm7BUq-axwbbcXxdq8WAFNMq5rp79wrCHhDW3-XBuJijPYHKiw
Message-ID: <CAMvvPS4COqinefth9rEB4etJF2erjQa3xfcOGQMtZ-LCUQnwFw@mail.gmail.com>
Subject: Re: [RFC PATCH 0/4] mm/damon: Add DAMOS action to interleave data
 across nodes
To: Joshua Hahn <joshua.hahnjy@gmail.com>
Cc: linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, sj@kernel.org, akpm@linux-foundation.org, 
	corbet@lwn.net, david@redhat.com, ziy@nvidia.com, matthew.brost@intel.com, 
	rakie.kim@sk.com, byungchul@sk.com, gourry@gourry.net, 
	ying.huang@linux.alibaba.com, apopple@nvidia.com, bijantabatab@micron.com, 
	venkataravis@micron.com, emirakhur@micron.com, ajayjoshi@micron.com, 
	vtavarespetr@micron.com, damon@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Joshua,

On Fri, Jun 13, 2025 at 10:25=E2=80=AFAM Joshua Hahn <joshua.hahnjy@gmail.c=
om> wrote:
>
> On Thu, 12 Jun 2025 13:13:26 -0500 Bijan Tabatabai <bijan311@gmail.com> w=
rote:
>
> > From: Bijan Tabatabai <bijantabatab@micron.com>
> >
> > A recent patch set automatically set the interleave weight for each nod=
e
> > according to the node's maximum bandwidth [1]. In another thread, the p=
atch
> > set's author, Joshua Hahn, wondered if/how these weights should be chan=
ged
> > if the bandwidth utilization of the system changes [2].
>
> Hi Bijan,
>
> Thank you for this patchset, and thank you for finding interest in my
> question!
>
> > This patch set adds the mechanism for dynamically changing how applicat=
ion
> > data is interleaved across nodes while leaving the policy of what the
> > interleave weights should be to userspace. It does this by adding a new
> > DAMOS action: DAMOS_INTERLEAVE. We implement DAMOS_INTERLEAVE with both
> > paddr and vaddr operations sets. Using the paddr version is useful for
> > managing page placement globally. Using the vaddr version limits tracki=
ng
> > to one process per kdamond instance, but the va based tracking better
> > captures spacial locality.
> >
> > DAMOS_INTERLEAVE interleaves pages within a region across nodes using t=
he
> > interleave weights at /sys/kernel/mm/mempolicy/weighted_interleave/node=
<N>
> > and the page placement algorithm in weighted_interleave_nid via
> > policy_nodemask. We chose to reuse the mempolicy weighted interleave
> > infrastructure to avoid reimplementing code. However, this has the awkw=
ard
> > side effect that only pages that are mapped to processes using
> > MPOL_WEIGHTED_INTERLEAVE will be migrated according to new interleave
> > weights. This might be fine because workloads that want their data to b=
e
> > dynamically interleaved will want their newly allocated data to be
> > interleaved at the same ratio.
>
> I think this is generally true. Maybe until a user says that they have a
> usecase where they would like to have a non-weighted-interleave policy
> to allocate pages, but would like to place them according to a set weight=
,
> we can leave support for other mempolicies out for now.
>
> > If exposing policy_nodemask is undesirable, we have two alternative met=
hods
> > for having DAMON access the interleave weights it should use. We would
> > appreciate feedback on which method is preferred.
> > 1. Use mpol_misplaced instead
> >   pros: mpol_misplaced is already exposed publically
> >   cons: Would require refactoring mpol_misplaced to take a struct vm_ar=
ea
> >   instead of a struct vm_fault, and require refactoring mpol_misplaced =
and
> >   get_vma_policy to take in a struct task_struct rather than just using
> >   current. Also requires processes to use MPOL_WEIGHTED_INTERLEAVE.
> > 2. Add a new field to struct damos, similar to target_nid for the
> > MIGRATE_HOT/COLD schemes.
> >   pros: Keeps changes contained inside DAMON. Would not require process=
es
> >   to use MPOL_WEIGHTED_INTERLEAVE.
> >   cons: Duplicates page placement code. Requires discussion on the sysf=
s
> >   interface to use for users to pass in the interleave weights.
>
> Here I agree with SJ's sentiment -- I think mpol_misplaced runs with the
> context of working with current / fault contexts, like you pointed out.
> Perhaps it is best to keep the scope of the changes as local as possible =
: -)
> As for duplicating page placement code, I think that is something we can
> refine over iterations of this patchset, and maybe SJ will have some grea=
t
> ideas on how this can best be done as well.

David Hildenbrand responded to this and proposed adding a new function that
just returns the nid a folio should go on based on its mempolicy. I think t=
hat's
probably the best way to go for now. I think the common case would want
the weights used by this and mempolicy to be the same. However, if there is
a use case where different weights are desired, I don't mind coming back an=
d
adding that functionality.

> > This patchset was tested on an AMD machine with a NUMA node with CPUs
> > attached to DDR memory and a cpu-less NUMA node attached to CXL memory.
> > However, this patch set should generalize to other architectures and nu=
mber
> > of NUMA nodes.
>
> I think moving the test results to the cover letter will help reviewers
> better understand the intent of the work. Also, I think it will also be
> very helpful to include some potential use-cases in here as well. That is=
,
> what workloads would benefit from placing pages according to a set ratio,
> rather than using existing migration policies that adjust this based on
> hotness / coldness?

Noted. I will be sure to include that in the next revision.

> One such use case that I can think of is using this patchset + weighted
> interleave auto-tuning, which would help alleviate bandwidth limitations
> by ensuring that past the allocation stage, pages are being accessed
> in a way that maximizes the bandwidth usage of the system (at the cost of
> latency, which may or may not even be true based on how bandwidth-bound
> the workload is).

This was the exact use case I envisioned for this patch. I talk about it in=
 more
detail in my reply to SeongJae.

> Thank you again for the amazing patchset! Have a great day : -)
> Joshua

I appreciate you taking the time to respond,
Bijan
