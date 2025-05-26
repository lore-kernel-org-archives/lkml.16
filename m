Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E2138FA3
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 13:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748265263; cv=none; b=MVXl2DuP1w/6jS9DcBYf9a8mR8lQdFHhSXNADyGknXgybPQeIw3OASCli2pxY2UQry0sdQT8W8WFfYYT3xTHbg0n+RaueiVIx7yRi0PG/Psuglqz5RRBPcp3H3PT6ZSNDjYaysZ6jDYJCe2ViEsdwNNGZeXAwdxnHa4HIRuzon8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748265263; c=relaxed/simple;
	bh=bO/0Xaesh46tkH/6EtZkwZJC/Ke1U0YJEB9UHrN+Dm8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D1q7IltMLS0f3kuYc6tpElYQVS+mnkmvvgBsbokJKT3dLgpq7Xa+iMYpelEFZkAyJMrxd8Lime78lYqaxOXEWaAACuM3pEirHmQsXN2GW2cu6zbrRNEmwrCEzEy/az1W5BQAc7SQmVbuSSp3PWYi/hZLCNv+dR0loKCGvL7y5I0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QKuRH+LY; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QKuRH+LY"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-601dfef6a8dso3703373a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 06:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748265260; x=1748870060; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w4+k+Nu4YkKy6LiE5cuySMYYEE0NwgP2DNr9A1G8YXc=;
        b=QKuRH+LY1NOE1YAGOwll4HD0duTKyGYI7G/DN1kwjJmzGywhQiyqqv4gt9aM3LEVaa
         EZ/IFOBh0HiDNQuVnVCdcejuu4xqnQ0U0E0iF17vdsE5oroGskHVbv1dbPGY0NIKqAvW
         vdN5KzkSbLCDxkGXTIRu7lm0YXkJL8lSDFzOWqtz4WJX8azVWzWKaRssutWvtzkuYbvc
         bAxOjrIW+Jz3v4fHI4HaFr5IFm9T8MAcYJPs9TsSmu9YeI5LQZXqHw6OYdnDNNIxd5o4
         8AdlL9DNGEY0Q+iGYiYTpObkMIyswm7kjZLGfKU1Pu/GLqmjqC/h9NNAD4FSOTptBrJd
         ISUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748265260; x=1748870060;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w4+k+Nu4YkKy6LiE5cuySMYYEE0NwgP2DNr9A1G8YXc=;
        b=j0Ul8Usnefv8ON1M9bpCvJ7pwiGuAyCoRT9SiKikQIXxl6v5GrWO46glFllNHzh3Ax
         chJpAvZcrvb9Mv9f06g6e9i06+Y+kgmQx2iT45UH8cSnb2v18Alaa4K4CXzu1qYVNj/9
         T2TX0S1wTcnHTVa7HH44Wz96SsUjjnb55NNvIOyiBk77uxS3fuiI+IGW+9qowu1SZrBS
         JQHNTAco5lOhq4AMBkmImZ2picb0b6BPATyMrEQD1alhmTKTo49p5jSJ5mt+i6RiazkA
         qy4XevbS4Npty3qUX+Wr/tIGz/1rMXKAurxUeYdqKL62uuwJfR0wOnYdNQnW7zs8JfVu
         qEQA==
X-Forwarded-Encrypted: i=1; AJvYcCVvV6WqIZi0atKz0MQmjuPjUe3Rdc1uHxbFl35i+80ER0/9CS/ApIqQKCXIPWlmyTIh/EL13BXl4oQOgOQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxU5uXljxqvxgKXTr4auhl0aEEg04OfZvxuQ453DzK8IT6yVPib
	cESFro+OyDpmD+4F9cD7NS6SM96m/+f2CdOwCFcRTQbY5XJjHCsERBYSFqySaA/uQ4k1hOOCvpT
	B0Z2Xdj8vRGbvq0h8e4Brsq6borQHC/RM+qCPQtUy
X-Gm-Gg: ASbGncuC+0nBeFz5ixwpQt6EQfDm7zjKq5ZbXd52ik5bwEI32qzH65MEbOXNiwxvEym
	sz2aZnHhfcezXsM8GKKVGBPjAI3oqISM1UYnmvqRu2mHRFCFzl41HQA43du5DQSHJ9mIh1sF+x5
	gOBW3CbPNkUseWczxfsduwfWcJytBp7l2wdAK6Dse/i2JzPxhIcsPocIe1Dt7Dgp75BKJ2EthrE
	aBTg3BaJyTT
X-Google-Smtp-Source: AGHT+IGSDYm4oUBrMvAWr4qV6JEwgtkxAoXA09ViNidu+7oqcKIQevQbpQyCq8UT33Rf3UPLw9iojM9JPNyO0bGNSiY=
X-Received: by 2002:a05:6402:5cb:b0:5f8:36b2:dc1a with SMTP id
 4fb4d7f45d1cf-602d9dfb022mr6373984a12.16.1748265259311; Mon, 26 May 2025
 06:14:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1747349530.git.babu.moger@amd.com> <e7e8f489ef148a4dcd5837d71c83efad47b5b7c3.1747349530.git.babu.moger@amd.com>
 <dd195d60-3e40-42be-88e5-7f3bbbba63ce@intel.com> <SJ1PR11MB6083C5179F98E3873CA34C35FC99A@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <aDDjs4PZxeouNJr0@agluck-desk3>
In-Reply-To: <aDDjs4PZxeouNJr0@agluck-desk3>
From: Peter Newman <peternewman@google.com>
Date: Mon, 26 May 2025 15:14:08 +0200
X-Gm-Features: AX0GCFs_DCKZgy9xuJ0w8LNwHoWYFzGA3d96dNjxjpA4WAsm7kDE__eyTTN92UE
Message-ID: <CALPaoCj7FBv_vfDp+4tgqo4p8T7Eov_Ys+CQRoAX6u43a4OTDQ@mail.gmail.com>
Subject: Re: [PATCH v13 11/27] x86/resctrl: Implement resctrl_arch_config_cntr()
 to assign a counter with ABMC
To: "Luck, Tony" <tony.luck@intel.com>
Cc: "Chatre, Reinette" <reinette.chatre@intel.com>, Babu Moger <babu.moger@amd.com>, 
	"corbet@lwn.net" <corbet@lwn.net>, "tglx@linutronix.de" <tglx@linutronix.de>, 
	"mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>, 
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

Hi Tony,

On Fri, May 23, 2025 at 11:08=E2=80=AFPM Luck, Tony <tony.luck@intel.com> w=
rote:
>
> On Thu, May 22, 2025 at 10:16:16PM +0000, Luck, Tony wrote:
> > > It looks to me as though there are a couple of changes in the telemet=
ry work
> > > that would benefit this work. https://lore.kernel.org/lkml/2025052122=
5049.132551-2-tony.luck@intel.com/
> > > switches the monitor events to be maintained in an array indexed by e=
vent ID, eliminating the
> > > need for searching the evt_list that this work does in a couple of pl=
aces. Also note the handy
> > > new for_each_mbm_event() helper (https://lore.kernel.org/lkml/2025052=
1225049.132551-5-tony.luck@intel.com/).
> >
> > Yesterday I ran through the exercise of rebasing my AET patches on top =
of these
> > ABMC patches in order to check whether the ABMC patches painted resctrl
> > into some corner that would be hard to get back out of.
> >
> > Good news: they don't.
> >
> > There was a bunch of manual patching to make the first four patches fit=
 on top
> > of the ABMC code, but I also noticed a few places where things were sim=
pler
> > after combining the two series.
> >
> > Maybe a good path forward would be to take those first four patches fro=
m
> > my AET series and then build ABMC on top of those.
>
> As an encouragement to try this direction, I took my four patches
> on top of tip x86/cache and then applied Babu's ABMC series.

I did the same thing last week, except in the other order, so I
switched to your changes to test.

>
> Changes to Babu's code:
> 1) Adapt where needed for removal of evt_list. Use event array instead.
> 2) Use for_each_mbm_event() [Maybe didn't get all places?]
> 3) Bring the s/evt_val/evt_cfg/ fix into patch 20 from 21
> 4) Fix fir tree declaration for resctrl_process_assign()
>
> I don't have an AMD system to check if the ABMC parts still work. But
> it does pass the resctrl self tests, so legacy isn't broken.
>
> Patches in the "my_mbm_plus_babu_abmc" branch of my kernel.org
> repo: git://git.kernel.org/pub/scm/linux/kernel/git/aegl/linux.git

Thanks for applying my suggestion[1] about the array entry sizes, but
you needed one more dereference:

diff --git a/arch/x86/kernel/cpu/resctrl/core.c
b/arch/x86/kernel/cpu/resctrl/core.c
index 1db6a61e27746..0c27e0a5a7b96 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -399,7 +399,7 @@ static int domain_setup_ctrlval(struct
rdt_resource *r, struct rdt_ctrl_domain *
  */
 static int arch_domain_mbm_alloc(u32 num_rmid, struct
rdt_hw_mon_domain *hw_dom)
 {
-       size_t tsize =3D sizeof(hw_dom->arch_mbm_states[0]);
+       size_t tsize =3D sizeof(*hw_dom->arch_mbm_states[0]);
        enum resctrl_event_id evt;
        int idx;

diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 098ff002d2232..44ec33cb165f7 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -4819,7 +4823,7 @@ void resctrl_offline_mon_domain(struct
rdt_resource *r, struct rdt_mon_domain *d
 static int domain_setup_mon_state(struct rdt_resource *r, struct
rdt_mon_domain *d)
 {
        u32 idx_limit =3D resctrl_arch_system_num_rmid_idx();
-       size_t tsize =3D sizeof(d->mbm_states[0]);
+       size_t tsize =3D sizeof(*d->mbm_states[0]);
        enum resctrl_event_id evt;
        int idx;


You should be able to repro an array overrun without ABMC, and a page
fault is likely if the system implements a lot of RMIDs. The AMD EPYC
9B45 I tested on implements 4096 RMIDs.

Thanks,
-Peter


[1] https://lore.kernel.org/lkml/CALPaoCj8yfzJ=3D5CkxTPQXc0-WRWpu0xKRX8v4FA=
WFGQKtXtMUw@mail.gmail.com/
