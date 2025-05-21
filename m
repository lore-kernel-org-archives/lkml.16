Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6DB717E
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 14:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747837657; cv=none; b=iP/HXhLBbf+KHuxoBHWJGM9OK1qEnxms++BVNpLLFnCCBpDvbKxUllzSsLIiQQQADsJtSFthTh9ReADz8vSVAzu2/0hpZjRyugENFc4YTMI/ccn834lLMJsF1VEmuEGMz7d+/kri74gs1MjemtlusjGoNmbdICFscax3lqIov98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747837657; c=relaxed/simple;
	bh=25OiMrHTnmN8O0Pud42IS80U7rOWLOusJf6uPPxMmWw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tvatsjpIwZBKfJ9TyTqxZ4tZHLU8qfkibxCG5HZPpIweh5LFAGI9BTwUFraUIN9dpCqn2zEPPJRI7vzUZnDLuWyL4J3d95NNS2agRdeMU/vyvQ1409RtUPaaDeX68C8z+O7qZncV8hCqKiI3xtHgo2Zpvu2AoTIytJuooP3PR2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1Xak7+dh; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1Xak7+dh"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-acacb8743a7so1156591266b.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 07:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747837654; x=1748442454; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=25OiMrHTnmN8O0Pud42IS80U7rOWLOusJf6uPPxMmWw=;
        b=1Xak7+dhcuNY2L2HK9Os0aixz1IN0otKPh0BPL853QnNJajpl6xtNs5rvjtqHp6wbD
         3jNCDi1V/3ThWVJQ4XAAB6yFDw6K3xuW/0mMQ/stT/R14zxBhCJPVmORHK9glS27EHc+
         s99EiXafKB7CmcDs3+gV70K+8hfcZVLU+dZsIaun9Lv5xlKK+L4O0G8+0PzhWGwy9C2q
         BDENidYpV4J9QjtBr+eNvq7crPguB/IvYBaYOsLyRL9sScRGwK/nX6u3kgK5/lUS6gjf
         alHe16lN7yj1y7UQYu69HBkGGeTSlcHN6mRvxRNXqLJZZYGo0GwAm51fzb8c+EF0DwpG
         WvLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747837654; x=1748442454;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=25OiMrHTnmN8O0Pud42IS80U7rOWLOusJf6uPPxMmWw=;
        b=HLc1Rx+e+T9nUYkKygPZLeYVGyUrPtVeKbW5mS//WpbjEjF+Ufivl6wwn4dkxGbkNA
         IJU6WPDwjcDYX0xfv+7iawhGb+BYPR2cetGwvevz7xQt/3GNfYFE7/GP9a3uQDuUf49Q
         1uHEx8uEyv4UuJBnr36vKWlIVy7NdDtoZVT0+2bmb/iLiPo1ky4RGl4sif+avx9xSoKF
         6SLGe5at5V/OBRAaXfgV5ZSBLTUy76aQ1356pzuklbONPUczL4ZTncbK3A77io3FEM4l
         7YFQfodXLxFOIQfMjpJjvQfPvLB/l/8Kfa/orZiQ56kAuSKhViFVjFaImc1hD6wuPYrm
         3kQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNBkO0YXO42O4xX9CrP5KCMNpPo5iTH3ce/Zhkq6KD/4Q57Rj4+wqznc1fiJxnQi034QtTA6PGtGnZqUU=@vger.kernel.org
X-Gm-Message-State: AOJu0YydPQiySHuTJb3YVPs6hWV282/Yz3h3I7HlxBz8hdi2sSyrnn59
	n7rMMgFZYMdE5+FWzSJ4fngBU8q4MU+9597HTD5cSwg04Mm+oqNPEQWNlkE7UAcJLkvhfKXVfJ6
	qsE07DrpquG6uy2LwaPdP+yp6mTTaLgjmg9ipsYlh8HMApgFjlBqKJgSFvgX1yA==
X-Gm-Gg: ASbGncuG/q1HIZKYBTW/x/alN7SpIfptec/6EiOSAhgMVECmjwJVbI+izmjBS7P10yw
	qRF0adlwFVlMEgadwkECc96edmfQ+D3hQq+S8SmkHLHHbrHsjN4AFhdTEh5k+WCf+w7/8DH71Vd
	QZ1r7VRiNDjJXEBpfsHoGJWGYoHY5lkhNMSTw3udrp369YMNsdSDD323RTGnPX81FawcxVmsRaU
	Oq4DIz4HmpD
X-Google-Smtp-Source: AGHT+IFrVEL9vM+PK/PFMCGm5hhZiCJYxcWpaRZrgM05TsUrUUXxjj8nsmh7GYTXQ3QblzfDm36MnMKMGiQolJ7NV3M=
X-Received: by 2002:a17:907:7f23:b0:ad5:6622:114e with SMTP id
 a640c23a62f3a-ad56622283emr1372999366b.30.1747837640170; Wed, 21 May 2025
 07:27:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1747349530.git.babu.moger@amd.com> <CALPaoChSzzU5mzMZsdT6CeyEn0WD1qdT9fKCoNW_ty4tojtrkw@mail.gmail.com>
 <4dbcea13-382e-4af2-960d-0e66652cc2f5@amd.com> <8dd6e3a0-b2e1-48a7-8fa4-62e78b1407ae@intel.com>
 <6c77b065-a54e-4b9c-a4cf-8b81676f2ab2@amd.com> <f4178258-f7ad-4db2-9284-3f28e8ee8d00@intel.com>
 <92bcab75-72c6-46d4-97a2-119e7124c90c@amd.com> <11465976-f030-4c1b-88c6-3eebf0c8f13b@intel.com>
In-Reply-To: <11465976-f030-4c1b-88c6-3eebf0c8f13b@intel.com>
From: Peter Newman <peternewman@google.com>
Date: Wed, 21 May 2025 16:27:08 +0200
X-Gm-Features: AX0GCFvI_VqOz7HBCiWvX7WLMV1GSF9dYUPgJjYBds9AdJ2n5AmEAKL_72IWPfc
Message-ID: <CALPaoCgtcz6tZnmeH8v4r2=HRVh7qEDZgraLU+Euhq3qLkRZhA@mail.gmail.com>
Subject: Re: [PATCH v13 00/27] x86/resctrl : Support AMD Assignable Bandwidth
 Monitoring Counters (ABMC)
To: Reinette Chatre <reinette.chatre@intel.com>
Cc: "Moger, Babu" <bmoger@amd.com>, babu.moger@amd.com, corbet@lwn.net, tony.luck@intel.com, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, james.morse@arm.com, dave.martin@arm.com, 
	fenghuay@nvidia.com, x86@kernel.org, hpa@zytor.com, paulmck@kernel.org, 
	akpm@linux-foundation.org, thuth@redhat.com, rostedt@goodmis.org, 
	ardb@kernel.org, gregkh@linuxfoundation.org, daniel.sneddon@linux.intel.com, 
	jpoimboe@kernel.org, alexandre.chartre@oracle.com, 
	pawan.kumar.gupta@linux.intel.com, thomas.lendacky@amd.com, 
	perry.yuan@amd.com, seanjc@google.com, kai.huang@intel.com, 
	xiaoyao.li@intel.com, kan.liang@linux.intel.com, xin3.li@intel.com, 
	ebiggers@google.com, xin@zytor.com, sohil.mehta@intel.com, 
	andrew.cooper3@citrix.com, mario.limonciello@amd.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	maciej.wieczor-retman@intel.com, eranian@google.com, Xiaojian.Du@amd.com, 
	gautham.shenoy@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Reinette,

On Wed, May 21, 2025 at 1:44=E2=80=AFAM Reinette Chatre
<reinette.chatre@intel.com> wrote:
>
> Hi Babu,
>
> On 5/20/25 4:25 PM, Moger, Babu wrote:
> > Hi Reinette,
> >
> > On 5/20/2025 1:23 PM, Reinette Chatre wrote:
> >> Hi Babu,
> >>
> >> On 5/20/25 10:51 AM, Moger, Babu wrote:
> >>> Hi Reinette,
> >>>
> >>> On 5/20/25 11:06, Reinette Chatre wrote:
> >>>> Hi Babu,
> >>>>
> >>>> On 5/20/25 8:28 AM, Moger, Babu wrote:
> >>>>> On 5/19/25 10:59, Peter Newman wrote:
> >>>>>> On Fri, May 16, 2025 at 12:52=E2=80=AFAM Babu Moger <babu.moger@am=
d.com> wrote:
> >>>>
> >>>> ...
> >>>>
> >>>>>>> /sys/fs/resctrl/info/L3_MON/num_mbm_cntrs: Reports the number of =
monitoring
> >>>>>>> counters available for assignment.
> >>>>>>
> >>>>>> Earlier I discussed with Reinette[1] what num_mbm_cntrs should
> >>>>>> represent in a "soft-ABMC" implementation where assignment is
> >>>>>> implemented by assigning an RMID, which would result in all events
> >>>>>> being assigned at once.
> >>>>>>
> >>>>>> My main concern is how many "counters" you can assign by assigning
> >>>>>> RMIDs. I recall Reinette proposed reporting the number of groups w=
hich
> >>>>>> can be assigned separately from counters which can be assigned.
> >>>>>
> >>>>> More context may be needed here. Currently, num_mbm_cntrs indicates=
 the
> >>>>> number of counters available per domain, which is 32.
> >>>>>
> >>>>> At the moment, we can assign 2 counters to each group, meaning each=
 RMID
> >>>>> can be associated with 2 hardware counters. In theory, it's possibl=
e to
> >>>>> assign all 32 hardware counters to a group=E2=80=94allowing one RMI=
D to be linked
> >>>>> with up to 32 counters. However, we currently lack the interface to
> >>>>> support that level of assignment.
> >>>>>
> >>>>> For now, the plan is to support basic assignment and expand functio=
nality
> >>>>> later once we have the necessary data structure and requirements.
> >>>>
> >>>> Looks like some requirements did not make it into this implementatio=
n.
> >>>> Do you recall the discussion that resulted in you writing [2]? Looks=
 like
> >>>> there is a question to Peter in there on how to determine how many "=
counters"
> >>>> are available in soft-ABMC. I interpreted [3] at that time to mean t=
hat this
> >>>> information would be available in a future AMD publication.
> >>>
> >>> We already have a method to determine the number of counters in soft-=
ABMC
> >>> mode, which Peter has addressed [4].
> >>>
> >>> [4]
> >>> https://lore.kernel.org/lkml/20250203132642.2746754-1-peternewman@goo=
gle.com/
> >>>
> >>> This appears to be more of a workaround, and I doubt it will be inclu=
ded
> >>> in any official AMD documentation. Additionally, the long-term direct=
ion
> >>> is moving towards ABMC.
> >>>
> >>> I don=E2=80=99t believe this workaround needs to be part of the curre=
nt series. It
> >>> can be added later when soft-ABMC is implemented.
> >>
> >> Agreed. What about the plans described in [2]? (Thanks to Peter for
> >> catching this!).
> >>
> >> It is important to keep track of requirements while working on a featu=
re to
> >> ensure that the implementation supports the planned use cases. Re-read=
ing that
> >> thread it is not clear to me how soft-ABMC's per-group assignment woul=
d look.
> >> Could you please share how you see it progress from this implementatio=
n?
> >> This includes the single event vs. multiple event assignment. I would =
like to
> >> highlight that this is not a request for this to be supported in this =
implementation
> >> but there needs to be a plan for how this can be supported on top of i=
nterfaces
> >> established by this work.
> >>
> >
> > Here=E2=80=99s my current understanding of soft-ABMC. Peter may have a =
more in-depth perspective on this.
> >
> > Soft-ABMC:
> > a. num_mbm_cntrs: This is a software-defined limit based on the number =
of active RMIDs that can be supported. The value can be obtained using the =
code referenced in [4].
> >
> > b. Assignments: No hardware configuration is required. We simply need t=
o ensure that no more than num_mbm_cntrs RMIDs are active at any given time=
.
> >
> > c. Configuration: Controlled via /info/L3_MON/mbm_total_bytes_config an=
d mbm_local_bytes_config.
> >
> > d. Events: Only two events can be assigned(local and total).
> >
> > ABMC:
> > a. num_mbm_cntrs: This is defined by the hardware.
> > b. Assignments: Requires special MSR writes to assign counters.
> > c. Configuration: Comes from /info/L3_MON/counter_configs/.
> > d. Events: More than two events can be assigned to a group (currently u=
p to 2).
> >
> > Commonalities:
> > a. Assignments can be either exclusive or shared in both these modes.
> >
> > Given these, I believe we can easily accommodate soft-ABMC in this inte=
rface.
>
> This is not so obvious to me. It looks to me as though the user is forced=
 to interpret
> the content of resctrl files differently based on soft-ABMC vs ABMC makin=
g the interface
> inconsistent and user thus needing to know details of implementations. Th=
is is what the previous
> discussion I linked to aimed to address. It sounds to me as though you be=
lieve that this is no longer
> an issue. Could you please show examples of what a user can expect from t=
he interfaces and how a user
> will interact with the interfaces on both a non-ABMC and ABMC system?

At the interface level, I think mbm_L3_assignments on a non-ABMC
system would only need to contain a single line:

0=3Ds;1=3Ds;...;31=3Ds

But maybe for consistency we would synthesize a single, unmodifiable
counter configuration to reflect that allocating an RMID in a domain
results in assignment to all events and deallocating the RMID
unassigns all events. We could call it "group" to say it's assigning
at the group level, or perhaps just '*':

*:0=3Ds;1=3Ds;...;31=3Ds

I'm not sure about allowing a '*' on ABMC hardware, because it could
be interpreted as allocating a lot of counters when a large number of
event configurations exist.

*:0=3Ds;1=3Ds;...;31=3Ds

-Peter


>
> Thank you
>
> Reinette
>
> >
> >>>>
> >>>> [2] https://lore.kernel.org/lkml/afb99efe-0de2-f7ad-d0b8-f2a0ea998ef=
d@amd.com/
> >>>> [3] https://lore.kernel.org/lkml/CALPaoCg3KpF94g2MEmfP_Ro2mQZYFA8sKV=
kmb+7isotKNgdY9A@mail.gmail.com/
> >>>
> >>
> >>
> >
>
