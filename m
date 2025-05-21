Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43CEA23D285
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 09:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747819146; cv=none; b=DyWRUBeuB2TpD3+GySiJgIOuNligp90r9WS8MoheMNJoYtpbMeaByyab2s7Ia0NPqqjOkYTOaW5MfFJYyvvZeKlyekO5I+1OsSt2lkvQPSnjSoEGvEpCMBnbLxiKazGOXbLDoifkD9JTPKut86gTi0uord5G+I9kkZnLTEKj6AY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747819146; c=relaxed/simple;
	bh=TGJZe2hADz53s7Skz8ypv8Bu8bz+ehqEub2mIKZwff4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IlLjXvv/gv/u9WBwob/X4LcUXe9muwsLzlPHfVg3Ni1HQwXf1P3fILQA0L7FGFLZFmJYfOjGkxaUgnkzHABY25RmD4aTaTEFxs3YDag5M0OnAA04p8g3zc9JdxZ1pzh7ADtpQGdegJSAQWWZeOWd6PDqYlTtZ/irNBSkjc2z6RU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3zEhHnMq; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3zEhHnMq"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-600210e4219so10193961a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 02:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747819142; x=1748423942; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TGJZe2hADz53s7Skz8ypv8Bu8bz+ehqEub2mIKZwff4=;
        b=3zEhHnMqrj9iq852phk/0npUnMMjkr/UwFIKdix7mjUf8RVIQrwO4eqZXdS6hxw7Dz
         k4FNybin1mBso4nRyR65C8SeC3Biz6qiJSW0clx13Ab2Uh3X3Kk+54fBaMTJ4MpzuNij
         tuvv37NN6FqXQtGp0E5vUMy1+Dz/vqKLLSLS38lO38rpLBswi5rVW3yLwREtRsEjSLtw
         NVR4+Xv03SAg8D60oIDt8yQAVrVm1irbj1GrTAxW5fCh8kzCZcecqJM7xF0j2FWbdLur
         zHxj/HhRXxTvXgEoXYwJnwsfAneOuuggLbCgkSQJ6uiW7StgMJ8Eb8Z5CVdG56aSsjZn
         cAaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747819142; x=1748423942;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TGJZe2hADz53s7Skz8ypv8Bu8bz+ehqEub2mIKZwff4=;
        b=H2E9ybpEHCyC+K1TOEtEEY1yAuaLjtz/KnkXk3dbKvIh4R07OcOeOFQxtH1IzCW/Mv
         ZznHWyV4uFNPhfn2n9zAIv9lXAMVO0J240qlHLIj1kUunxXi++tF0ms2ftsYrTPdXUEX
         P/sW4nqnQ4bW+zHMZDpICXnRvECM2Uk7RECAr2XLObkdOEiotMwZzbSlHwKGaW1PDhRJ
         Djh2d9udrLxOYrLaBC342zg8nbgw7GQRI92d/ntGI2FjAAb7IZOBwpcVlx7q6PWqywja
         lPxS8tYi7CedGK1DvnBgtLoWXB0fcIxeWfMdZybAsokKsgPDPIEIkigUauyCt0+0ZJtA
         rYbw==
X-Forwarded-Encrypted: i=1; AJvYcCV0Bp+lH4WNYXNER/ysWZr74xJVquKU7zUT+UEDZM1l/dg9bemQ3EfCkIxvDx+79Wmo6UeiaSOzEMIIbNg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4ivJt1SYPgILluu13U+E8yRZkQx/x3IHMh8J9Lf8SOjldsGeP
	ROf8DQwbZPqBoql6prjiNkCM81ZvrifsP9lai0kMg5rvrXBznY7SHqyGnCS2sfpjhT3sCpti8r1
	B67uf/OIBlxxQQE68nOtgW7+IacopGO2Jy5No0t3X
X-Gm-Gg: ASbGncuMqXL47ubXnTmwG9ReqKWOWD1YYPG9xOS64XBhvfVZ2Wa7Nw6Pckoh9PaXCDF
	PDBZQFq7wAtnTTDR+5qMr9zLv1CkpD/uCplfgZ+657yV/BrAW+op2z9Oc2lGlSLqocPR6qbeCVu
	tLx/C1vxpN7M+Q2N1dMshOHK2jhNJtuy+scuhtAfaeFMfoOMcyUjnP6vt1++FPO83pCfji57E5M
	dpgOHK3GWx2
X-Google-Smtp-Source: AGHT+IGmzCCy6OjzmNxLo5QdkmHLYIuxkB7QJ1oH0jls8zqR52SthXRQfAiW+6WIKuVMB893qU0KG07gLhApmR1xq9c=
X-Received: by 2002:a17:907:8dc3:b0:acb:37ae:619c with SMTP id
 a640c23a62f3a-ad52f8ac2ccmr1674496266b.15.1747819142210; Wed, 21 May 2025
 02:19:02 -0700 (PDT)
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
Date: Wed, 21 May 2025 11:18:51 +0200
X-Gm-Features: AX0GCFttPDhQ0or8oVTQeTMZRPPCUAhMm7SYvYK6LJpIiQPETDwHbV25FkcQJQ8
Message-ID: <CALPaoCjTwySGX9i7uAtCWLKQpmELKP55xDLJhHmUve8ptsfFTw@mail.gmail.com>
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

Hi Babu/Reinette,

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

I would call it a hardware-defined limit that can be probed by software.

The main question is whether this file returns the exact number of
RMIDs hardware can track or double that number (mbm_total_bytes +
mbm_local_bytes) so that the value is always measured in events.

There's also the mongroup-RMID overcommit use case I described
above[1]. On Intel we can safely assume that there are counters to
back all RMIDs, so num_mbm_cntrs would be calculated directly from
num_rmids.

I realized this use case is more difficult to implement on MPAM,
because a PARTID is effectively a CLOSID+RMID, so deferring assigning
a unique PARTID to a group also results in it being in a different
allocation group. It will work if the unmonitored groups could find a
way to share PARTIDs, but this has consequences on allocation - but
hopefully no worse than sharing CLOSIDs on x86.

There's a lot of interest in monitoring ID overcommit in Google, so I
think it's worth it for me to investigate the additional structural
changes needed in resctrl (i.e., breaking the FS-level association
between mongroups and HW monitoring IDs). Such a framework could be a
better fit for soft-ABMC. For example, if overcommit is allowed, we
would just report the number of simultaneous RMIDs we were able to
probe as num_rmids. I would want the same shared assignment scheduler
to be able to work with RMIDs and counters, though.

Thanks,
-Peter

[1] https://lore.kernel.org/lkml/CALPaoChSzzU5mzMZsdT6CeyEn0WD1qdT9fKCoNW_t=
y4tojtrkw@mail.gmail.com/
