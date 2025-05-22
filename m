Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08F0A283147
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 08:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747903643; cv=none; b=Q5MWydTNugJ0ukU/APQApong4RngKlTvP6D28eUsNNH1CxA0UnX2MoHDCNyGgnbW2uEI2KVFKVYqlKMlDbU0DRyzAC8MmUhbo4Vfa/9gMCxU0HE/QhoVmx1rl/gtK1zsjBJozdhofngc2GoBuKUNCWqfbmhj9dt14non9F01eIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747903643; c=relaxed/simple;
	bh=U+OG+d8hfbvDmx6UAkB0xp/yTFEsXXxzx5uEKuDitx0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sQAvtP8wiOAmpsvk7K0L9OwhCawu5RZY2/uJfj/CfEvYI2dOR/SCrFDSC29bIzvh3mZwIgcMHApqMc0SQmkB8Dbg2439d87HkymS0VF8aSceHj6RALMc8ohN1xStm7F2iAErHeyYl3C/24OO2eRSMhKPmdaF4zwakzQ9uThUdcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tGl8jzIA; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tGl8jzIA"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ad574992fcaso774591266b.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 01:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747903639; x=1748508439; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oS/IyWoxphzadKMNL528mkjgxZl+WM6LE8gdVJhwq9M=;
        b=tGl8jzIAXGP8jQrpoyyYSzS3E0Z9xsSOUiJwxlbrFZRBZbLTYuDRucvBQjoZHU1n0f
         qrWDqxV1qN0kD4OnnxMZk6Y0MBYYE6EiiUGv4YQv5aXtdh8oYURnoe4Qa3J5WgtiibtB
         t6DcNt8wYdG1K7YhxoR8WbY9KZtnNUxM5lkUslm6LyuEzWBLb5H78NlSB5qTUrMuQpkm
         YVowJiEhIz5rRlIURv0D9mD26gqD9OtXwvFoK2UCk2SKl7Keptzf98P6Oq+snMj73tSA
         uKVKU5wXkcTAJ5nnqjPMtYM6mPIYO0cyHV0GTCIjnk230BozxPFtRxDJmPAgGFIySI6Q
         umCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747903639; x=1748508439;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oS/IyWoxphzadKMNL528mkjgxZl+WM6LE8gdVJhwq9M=;
        b=P7QK7GKWXKOCRl0Kcte8cyXXr+1XsOkrNVKqW5yAAI/4bbLVA4r53WdyV6rFlWX7ee
         6totSVri605uv3SGXg6a2W+nMmUSxVnvb5XG9d6XyjMJU0bb1lwt+dsP2APLgfS05Nat
         6VlCPUnqTNciYompt/irlb/wVCp6xWRc3SIuaxmE4T9ZKor2WzLOaXAfxK4GUyPfEga+
         3VJYH40T5AmXWoy+6r9X1AAnFO+96qDlmv7LUr7SqdMp/L9tpSifXq5k//niwdv60M2h
         Ez7gyy/Q+lN5feWVPbE/0uFa9qlHuZRPyaym1L7UjWWiuLE6PWUjjqktN4QrNo9CW7Lx
         kGYw==
X-Forwarded-Encrypted: i=1; AJvYcCUUWMMANoZ/HL+swnqj7Kl/5p7ZB15VP5XnQy8Ycr285lOdZMEjSPwW06JZ63H7FIazJt+7P2PRX2VNMM8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyi+W8r36/T1M/g6t5gBIcm+0rGkwNBVO9vxCGOwB6arC53UD1U
	+0Apvdu2muPQyqntIfHZbint7JbUCGS9ZLsfo9A7lQN/NRekivm9MDrqsa98VXM21t+eis26z07
	8Hy0qUgjem0aF3fX7s7rRHIK2kqXT72ZSMgWkjP4N
X-Gm-Gg: ASbGncseGlHHz78oV3JSxQtuT0ZGMTMLpNt49fFEMXXWp0neEJd9ReC6SelAHE7fpod
	PA01OMLpGmJpmkqeckFWgBXoJ4e3HlOH5q8SOBynu52nEmefw8QFFK1CH3xlweE0MQk/0RUNpCC
	CM2OoijI+TP1VmZeofnO09FNMEl7bP9VO81cVLGx8x+Kh7YBnBkdaBMw09VKxajTRzkVhGHt/d0
	Q==
X-Google-Smtp-Source: AGHT+IGeAg1FS5B957kESwNOhWbrhXwRf3wUtm+gPXXt8nbTePldZrjWHzjSiP9EyuW/zL2m5UDSODG2jnkgkuOoADI=
X-Received: by 2002:a17:906:9fc6:b0:ac6:ff34:d046 with SMTP id
 a640c23a62f3a-ad52d468b54mr2375897166b.2.1747903639073; Thu, 22 May 2025
 01:47:19 -0700 (PDT)
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
 <CALPaoCjTwySGX9i7uAtCWLKQpmELKP55xDLJhHmUve8ptsfFTw@mail.gmail.com>
 <7f10fa69-d1fe-4748-b10c-fa0c9b60bd66@intel.com> <aC5lL_qY00vd8qp4@agluck-desk3>
 <a131e8ed-88b2-4fed-983b-5deea955a9a5@intel.com> <SJ1PR11MB6083B627895846B8663B4805FC99A@SJ1PR11MB6083.namprd11.prod.outlook.com>
In-Reply-To: <SJ1PR11MB6083B627895846B8663B4805FC99A@SJ1PR11MB6083.namprd11.prod.outlook.com>
From: Peter Newman <peternewman@google.com>
Date: Thu, 22 May 2025 10:47:08 +0200
X-Gm-Features: AX0GCFvn_pniYEQ4ayGp21nJqPmU30VsCiLX7_tjgWkuAxOIR_cGH5liC51ZY9o
Message-ID: <CALPaoCjh_NXQLtNBqei=7a6Jsr17fEnPO+kqMaNq4xNu2UPDJA@mail.gmail.com>
Subject: Re: [PATCH v13 00/27] x86/resctrl : Support AMD Assignable Bandwidth
 Monitoring Counters (ABMC)
To: "Luck, Tony" <tony.luck@intel.com>
Cc: "Chatre, Reinette" <reinette.chatre@intel.com>, "Moger, Babu" <bmoger@amd.com>, 
	"babu.moger@amd.com" <babu.moger@amd.com>, "corbet@lwn.net" <corbet@lwn.net>, 
	"tglx@linutronix.de" <tglx@linutronix.de>, "mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "james.morse@arm.com" <james.morse@arm.com>, 
	"dave.martin@arm.com" <dave.martin@arm.com>, "fenghuay@nvidia.com" <fenghuay@nvidia.com>, 
	"x86@kernel.org" <x86@kernel.org>, "hpa@zytor.com" <hpa@zytor.com>, 
	"paulmck@kernel.org" <paulmck@kernel.org>, 
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>, "thuth@redhat.com" <thuth@redhat.com>, 
	"rostedt@goodmis.org" <rostedt@goodmis.org>, "ardb@kernel.org" <ardb@kernel.org>, 
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, 
	"daniel.sneddon@linux.intel.com" <daniel.sneddon@linux.intel.com>, 
	"jpoimboe@kernel.org" <jpoimboe@kernel.org>, 
	"alexandre.chartre@oracle.com" <alexandre.chartre@oracle.com>, 
	"pawan.kumar.gupta@linux.intel.com" <pawan.kumar.gupta@linux.intel.com>, 
	"thomas.lendacky@amd.com" <thomas.lendacky@amd.com>, "perry.yuan@amd.com" <perry.yuan@amd.com>, 
	"seanjc@google.com" <seanjc@google.com>, "Huang, Kai" <kai.huang@intel.com>, 
	"Li, Xiaoyao" <xiaoyao.li@intel.com>, 
	"kan.liang@linux.intel.com" <kan.liang@linux.intel.com>, "Li, Xin3" <xin3.li@intel.com>, 
	"ebiggers@google.com" <ebiggers@google.com>, "xin@zytor.com" <xin@zytor.com>, 
	"Mehta, Sohil" <sohil.mehta@intel.com>, 
	"andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, 
	"mario.limonciello@amd.com" <mario.limonciello@amd.com>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"Wieczor-Retman, Maciej" <maciej.wieczor-retman@intel.com>, "Eranian, Stephane" <eranian@google.com>, 
	"Xiaojian.Du@amd.com" <Xiaojian.Du@amd.com>, "gautham.shenoy@amd.com" <gautham.shenoy@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Tony, Reinette,

On Thu, May 22, 2025 at 2:21=E2=80=AFAM Luck, Tony <tony.luck@intel.com> wr=
ote:
>
> > >>> There's also the mongroup-RMID overcommit use case I described
> > >>> above[1]. On Intel we can safely assume that there are counters to
> > >>> back all RMIDs, so num_mbm_cntrs would be calculated directly from
> > >>> num_rmids.
> > >>
> > >> This is about the:
> > >>    There's now more interest in Google for allowing explicit control=
 of
> > >>    where RMIDs are assigned on Intel platforms. Even though the numb=
er of
> > >>    RMIDs implemented by hardware tends to be roughly the number of
> > >>    containers they want to support, they often still need to create
> > >>    containers when all RMIDs have already been allocated, which is n=
ot
> > >>    currently allowed. Once the container has been created and starts
> > >>    running, it's no longer possible to move its threads into a monit=
oring
> > >>    group whenever RMIDs should become available again, so it's impor=
tant
> > >>    for resctrl to maintain an accurate task list for a container eve=
n
> > >>    when RMIDs are not available.
> > >>
> > >> I see a monitor group as a collection of tasks that need to be monit=
ored together.
> > >> The "task list" is the group of tasks that share a monitoring ID tha=
t
> > >> is required to be a valid ID since when any of the tasks are schedul=
ed that ID is
> > >> written to the hardware. I intentionally tried to not use RMID since=
 I believe
> > >> this is required for all archs.
> > >> I thus do not understand how a task can start running when it does n=
ot have
> > >> a valid monitoring ID. The idea of "deferred assignment" is not clea=
r to me,
> > >> there can never be "unmonitored tasks", no? I think I am missing som=
ething here.

You are correct. I did forget to mention something...

> > >
> > > In the AMD/RMID implemenentation this might be achieved with somethin=
g
> > > extra in the task structure to denote whether a task is in a monitore=
d
> > > group or not. E.g. We add "task->rmid_valid" as well as "task->rmid".
> > > Tasks in an unmonitored group retain their "task->rmid" (that's what
> > > identifies them as a member of a group) but have task->rmid_valid set
> > > to false.  Context switch code would be updated to load "0" into the
> > > IA32_PQR_ASSOC.RMID field for tasks without a valid RMID. So they
> > > would still be monitored, but activity would be bundled with all
> > > tasks in the default resctrl group.
> > >
> > > Presumably something analogous could be done for ARM/MPAM.
> > >
> >
> > I do not interpret this as an unmonitored task but instead a task that
> > belongs to the default resource group. Specifically, any data accumulat=
ed by
> > such a task is attributed to the default resource group. Having tasks
> > in a separate group but their monitoring data accumulating in/contribut=
ed to
> > the default resource group (that has its own set of tasks) sounds wrong=
 to me.
> > Such an implementation makes any monitoring data of default resource gr=
oup
> > invalid, and by extension impossible to use default resource group to m=
anage
> > an allocation for a group of monitor groups if user space needs insight
> > in monitoring data across all these monitor groups. User space will nee=
d to
> > interact with resctrl differently and individually query monitor groups=
 instead
> > of CTRL_MON group once.
>
> Maybe assign one of the limited supply of RMIDs for these "unmonitored"
> tasks. Populate a resctrl group named "unmonitored" that lists all the
> unmonitored tasks in a (read-only) "tasks" file. And supply all the count=
s
> for these tasks in normal looking "mon_data" directory.

I needed to switch to an rdtgroup struct pointer rather than hardware
IDs in the task structure to indicate group membership[1], otherwise
it's not possible to determine which tasks are in a group when it
doesn't have a unique HW ID value.

Also this is required for shared assignment so that changing a group's
IDs in a domain only requires updating running tasks rather than
needing to search the entire task list, which would lead to the same
problem we encountered in mongroup rename[2].

-Peter

[1] https://lore.kernel.org/lkml/20240325172707.73966-5-peternewman@google.=
com/
[2] https://lore.kernel.org/lkml/CALPaoCh0SbG1+VbbgcxjubE7Cc2Pb6QqhG3NH6X=
=3DWwsNfqNjtA@mail.gmail.com/
