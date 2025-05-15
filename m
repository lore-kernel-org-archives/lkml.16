Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF8E225A2C;
	Thu, 15 May 2025 12:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747311562; cv=none; b=CriRNTAIiyw6NbgaXm/7x8+/HznMepwKz7n5EEIsDRTtgAsq+VpFo60ztY60w4CalBHX4NfUYT8INE8BJn2iPckKDiLRxXDfzTtRJcuD8q6X/gDEdccYCeOGfw7ZyJGrrCmw9Hf+g0n6Qg5I/dzMqsXaCdirzjc+C88OVrtPsSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747311562; c=relaxed/simple;
	bh=RtTnO+IV4Fv6Kejv0DsZEHYE7n8C1TTg0adGEMtO4S4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sqg0ZPpBSll8h5ZekwC2yu2xEuNkiAITCptvK48cFAT14Uk9taqvNKMct6gn7JsP/7tOLv+Y+dXlbTJyCltEW3/1g6geN62DJWT8gqAsrPmPXhhv1CQIAghKYG+t7vBhctB6EDrijq57fBerp8+1ANL4uhzLi+gt/S1OaTT8+rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tavianator.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tavianator.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ad21a5466f6so392446966b.1;
        Thu, 15 May 2025 05:19:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747311559; x=1747916359;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Loekc1W19SB4FJ/b1cga3vjlsDJhQwmt/FwlxRhI2KA=;
        b=GETUItKR+kpP0+EQmrEihOe3UV7ETDRntxvvbP+GJqvDa/o0Zar0fsESWX7DU0/r6y
         iC7mOmSRQySujN6QqNjEXcAabY1JYEMHooXAGIk70e5LNXbjv9qaLwQrHbD985lSeahK
         3IKZMFqbKRWX89//euzRiAR0gvSiBp7BRkQLPjL9vBGudjQeG3siUguRuCxw4fjSUXkI
         vfmLPVGl3YaKk0M1dk//Mbo3X3FYHksrlcu9k5jvDZzVqeTaCvW2STYGd32NOhQHWHrl
         lmPhN9a5jtuB/D0NmA57L6G2+jCc4hX5T9jQ6cjGAjx4XEyMVEUZDBmvy8suxzddWJR6
         aCHg==
X-Forwarded-Encrypted: i=1; AJvYcCXA2ugNEttmeHxlWR9OfF/8JvdQBAhWi3Anp9KVxvSmdJT2mR16F3OSSlHPxSlL6avlQNpWY5h3tXo9p1Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmmZC9HSvpPZLcbHKnEOZKSnEh29UJVOELasulPFRxO5g8xovo
	yIEMFZmwAt5I3+f3ipenxsvIBp/teJbSkThpTQjiYIhVJvcg4zIltLY+WqhhSgeOsOA=
X-Gm-Gg: ASbGncuLWP1MCBSDi16aXvblGpMXEwVbGOdk5pXH56j/0vydAFWi6QQy5e053vHULBR
	R97gZswYGwM/6Th7axcr+Nl1kuQc9lDuCbrnApcfvAU0xlRP7GKtSnScIBykuY+3mTc0RzwGgwF
	roAVrgU2ginFSpUcS9C2IfaL2/kXSxfqt9jF/lfcGTbrgoI4nkncslk82Hpe8O/HXMMKWjMg7I1
	dvLjlXwZz2jxIxJ0jhLhrjOsM4gWjyVyYeWbDXioTG8EBDz5Uoy/ygUe+qjnLJCFS7jnfXGTEdR
	H6uMxukCok8TXA6dLH3/E9R32r5hR9Ezfb1v15ftdBWfwUikG9OGNESul+AnwlNr9cMxmh/vFst
	TIK7UxU/8kglipaBxonEk
X-Google-Smtp-Source: AGHT+IEVZNcmANhkXCTxi5n1uhgJ0qzrHE2ZHwnIQIRAYe4t3MeAmjhbXJS4XTM8+UOoOw/TCiqomw==
X-Received: by 2002:a17:907:94ca:b0:abf:48df:bf07 with SMTP id a640c23a62f3a-ad50f6beecdmr329000566b.15.1747311558541;
        Thu, 15 May 2025 05:19:18 -0700 (PDT)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com. [209.85.218.48])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ffe7493037sm802334a12.16.2025.05.15.05.19.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 05:19:17 -0700 (PDT)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-acacb8743a7so153054266b.1;
        Thu, 15 May 2025 05:19:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUvwBIeuOy42upUo90po4jAA+UZeLfzQbTegi5ziV8XLhnuqgbxGRZelqiB74V2Lj/nTGkVyZjKvyMV6Ns=@vger.kernel.org
X-Received: by 2002:a17:907:6d06:b0:ad2:5212:5e87 with SMTP id
 a640c23a62f3a-ad50f6beee8mr281366666b.16.1747311557733; Thu, 15 May 2025
 05:19:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <5aaee9fdfe8437ef2566b200bea45e4baaba3fcb.1745426811.git.tavianator@tavianator.com>
 <69a5dcdd-fa1f-41a8-ad6f-4c2f2c97128d@linux.intel.com>
In-Reply-To: <69a5dcdd-fa1f-41a8-ad6f-4c2f2c97128d@linux.intel.com>
From: Tavian Barnes <tavianator@tavianator.com>
Date: Thu, 15 May 2025 08:19:06 -0400
X-Gmail-Original-Message-ID: <CABg4E-kqVYX+VXM1Dt-GK2JwxEtcn_SEFnf73JaX+Rddni88CA@mail.gmail.com>
X-Gm-Features: AX0GCFtt0KfgCWJiNHWtvAWITSLV7fbj7kpII4imodJ0urDyLvn-IS__XRa9FoA
Message-ID: <CABg4E-kqVYX+VXM1Dt-GK2JwxEtcn_SEFnf73JaX+Rddni88CA@mail.gmail.com>
Subject: Re: [PATCH RESEND v2] ASoC: SOF: Intel: hda: Fix UAF when reloading module
To: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
Cc: linux-sound@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, 
	Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Brent Lu <brent.lu@intel.com>, 
	Peter Zijlstra <peterz@infradead.org>, sound-open-firmware@alsa-project.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 15, 2025 at 4:04=E2=80=AFAM P=C3=A9ter Ujfalusi
<peter.ujfalusi@linux.intel.com> wrote:
> On 06/05/2025 18:12, Tavian Barnes wrote:
> > hda_generic_machine_select() appends -idisp to the tplg filename by
> > allocating a new string with devm_kasprintf(), then stores the string
> > right back into the global variable snd_soc_acpi_intel_hda_machines.
> > When the module is unloaded, this memory is freed, resulting in a globa=
l
> > variable pointing to freed memory.  Reloading the modules then triggers
> > a use-after-free:
> >
> > BUG: KFENCE: use-after-free read in string+0x48/0xe0
> >
> > Use-after-free read at 0x00000000967e0109 (in kfence-#99):
> >  string+0x48/0xe0
> >  vsnprintf+0x329/0x6e0
> >  devm_kvasprintf+0x54/0xb0
> >  devm_kasprintf+0x58/0x80
> >  hda_machine_select.cold+0x198/0x17a2 [snd_sof_intel_hda_generic]
> >  sof_probe_work+0x7f/0x600 [snd_sof]
> >  process_one_work+0x17b/0x330
> >  worker_thread+0x2ce/0x3f0
> >  kthread+0xcf/0x100
> >  ret_from_fork+0x31/0x50
> >  ret_from_fork_asm+0x1a/0x30
> >
> > kfence-#99: 0x00000000198a940f-0x00000000ace47d9d, size=3D64, cache=3Dk=
malloc-64
> >
> > allocated by task 333 on cpu 8 at 17.798069s (130.453553s ago):
> >  devm_kmalloc+0x52/0x120
> >  devm_kvasprintf+0x66/0xb0
> >  devm_kasprintf+0x58/0x80
> >  hda_machine_select.cold+0x198/0x17a2 [snd_sof_intel_hda_generic]
> >  sof_probe_work+0x7f/0x600 [snd_sof]
> >  process_one_work+0x17b/0x330
> >  worker_thread+0x2ce/0x3f0
> >  kthread+0xcf/0x100
> >  ret_from_fork+0x31/0x50
> >  ret_from_fork_asm+0x1a/0x30
> >
> > freed by task 1543 on cpu 4 at 141.586686s (6.665010s ago):
> >  release_nodes+0x43/0xb0
> >  devres_release_all+0x90/0xf0
> >  device_unbind_cleanup+0xe/0x70
> >  device_release_driver_internal+0x1c1/0x200
> >  driver_detach+0x48/0x90
> >  bus_remove_driver+0x6d/0xf0
> >  pci_unregister_driver+0x42/0xb0
> >  __do_sys_delete_module+0x1d1/0x310
> >  do_syscall_64+0x82/0x190
> >  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> >
> > Fix it by saving the filename in pdata->tplg_filename instead, just lik=
e
> > every other code path that appends to the tplg filename.
> >
> > Fixes: 5458411d7594 ("ASoC: SOF: Intel: hda: refactoring topology name =
fixup for HDA mach")
> > Signed-off-by: Tavian Barnes <tavianator@tavianator.com>
> > ---
> > v2: Fix typo
> >
> >  sound/soc/sof/intel/hda.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
> > index b34e5fdf10f1..1767977e7cff 100644
> > --- a/sound/soc/sof/intel/hda.c
> > +++ b/sound/soc/sof/intel/hda.c
> > @@ -1069,7 +1069,7 @@ static void hda_generic_machine_select(struct snd=
_sof_dev *sdev,
> >                               if (!tplg_filename)
> >                                       return;
> >
> > -                             hda_mach->sof_tplg_filename =3D tplg_file=
name;
> > +                             pdata->tplg_filename =3D tplg_filename;
>
> Did you sent this as a mistake? The v5 patch looks to be the correct
> one, this is not.

No?  I sent the above patch 8 days ago, v5 I sent yesterday.
