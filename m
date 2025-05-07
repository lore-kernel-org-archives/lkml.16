Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AAA11B87D5;
	Wed,  7 May 2025 17:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746637598; cv=none; b=MEu9ygFFkVZX5wdeaij0z5CPa1FUHiYs4VFqeOZafUZc8ZBqpL6XVCVlqH0ilamkUUVqSd/ikmD8zt34M3+aNz95PV9eJUuTp+YMKiCOBO8ijtyteuBJl6COphcMALUiCzGaahRlVTvnfyldiJ3mbYetdoBCMbL/18C/PHLKYQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746637598; c=relaxed/simple;
	bh=CYqO+dkKg43a45cgIc3FZGhSagD537RYSkVi2u+8Kl0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VEyOTRP9a0QtdRUwFZg9/ddq/2ni+W1eY8INh1JOFYKJ5Lz5B9J3H4/wpyxTrHDRVFOQILgqvendKBvQ0SQ2tTf28tTcwr5mMwO9lZ5rM3uhyI3oq/X5u47gQFLLkBmwblTm4c0HxHjDqyki36r48F37cCZ2XL9dXM9eHhyu53A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tavianator.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tavianator.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-54c090fc7adso102964e87.2;
        Wed, 07 May 2025 10:06:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746637594; x=1747242394;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4IhxJaE1QLnYFJOpqUtyhSF4WwltjzszaJzfq/xCyEA=;
        b=TRVBSCeIS0EpZ942qiSF+3s3dmGlhmUSIQEbDP8JTDgZ9C2hnjs2P0STXzciY05sKf
         IDi1y2RK0yniEN9qPKMaSTxUpIukuSeMz2cn/5VMnaRVVUGrvtxlRu6ZOSWfMM+f7YZF
         o2juxuwwKUbqcVyA5AnFz2qgawUpKGWkPTpQcyLM9Fd+A1LLfp/BbzRbyUY7w42+GNgx
         A2dos9uu3VlC5FCkcgviCqvRCGQGIEFTi/H2HW0JZafWjnWt/4DFMZD+RQ1NG7POyQQB
         8qb1zKPVsk5B9A0YWQ8nTbd1B5RWH2q4nrnpWpMMF+6qLYu6G2KQBJPeCpJxPPw3w9Pm
         4Tew==
X-Forwarded-Encrypted: i=1; AJvYcCVWue7AcX6cFCmCemx8MENVt9wUlv/VuAW7spKu5hzMJJkRpsmChK8652T6Ir1A74b0Re7/KUWD78Wflvo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzcMiJ+bJy2p80njxx4orSOGKBnCtuxlLwCvstoE0Dd0C/PZRsA
	gBHnBVyBX4Zi6E1HshDE+nUS8wr11JvBSAGeaJy5gJwmwrSZHmEiQoJHKGVn/mk=
X-Gm-Gg: ASbGncvbv3QzVIvH8Mdg8qx//yD1vXSz0ohcluZNjXOuEY0XIccyvhKiWpMg+nyq3CN
	oYDdhu+6510zCknPhBF/Pz2TXpsbyhU6Tk3ylkocCxEsWeBbMtlA5dbp0+E6ZYmBI72s+yt/nBQ
	HQK5wAJ9aBfIbAeph1wP3D92PaTgtzNcwUOVvieh1CSr4SUKzJ692t6qA9vdVQYT+NSRNFhqW8+
	Rch92lP+ZFlc6JjE63uEEM997HebJ4FTncodwM1ihmxBdtEHyl/IaJbjm+L2OD5Jd1Jex9Bfl5D
	kFFI+Oz7sSZXmSXJJRs3w/5o6npqYPUfBncm9Pk/5euj0t2DfFR6ZGkIprwlV608Ol/QTZXyNMG
	4i68KhEELPzE6CJSxxBOJ
X-Google-Smtp-Source: AGHT+IHqOyvF3+XV8EveZ9GIogWW0LG9a14wbYtZQU8TbYU+prHVasoTqKkfymppgEiC5dHjfTpa3Q==
X-Received: by 2002:a17:907:7f1f:b0:ac6:ff34:d046 with SMTP id a640c23a62f3a-ad1e8bd1fe4mr466112966b.2.1746637582579;
        Wed, 07 May 2025 10:06:22 -0700 (PDT)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com. [209.85.208.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad189147403sm944005566b.13.2025.05.07.10.06.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 May 2025 10:06:21 -0700 (PDT)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5f624291db6so51773a12.3;
        Wed, 07 May 2025 10:06:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVeB1wDR0MLKTJZJ3idNWoQKUhvR32BTWbKeGMsOacGB1keVcsKBdYmOY2XIMMIaQk4iJUHbQwi7VxqNOs=@vger.kernel.org
X-Received: by 2002:a05:6402:84f:b0:5f4:d60f:93f0 with SMTP id
 4fb4d7f45d1cf-5fc35e2efd2mr241226a12.31.1746637580943; Wed, 07 May 2025
 10:06:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <fb47a18bdea9e9f86d6fccf1d881434cda3cd5f0.1746627007.git.tavianator@tavianator.com>
 <40ac692b-2a97-4b4c-a9f5-47601571f6f3@linux.intel.com>
In-Reply-To: <40ac692b-2a97-4b4c-a9f5-47601571f6f3@linux.intel.com>
From: Tavian Barnes <tavianator@tavianator.com>
Date: Wed, 7 May 2025 13:06:09 -0400
X-Gmail-Original-Message-ID: <CABg4E-moQf62Mm+Dv62yLwQaHfKHcrH54Gud1vj6bn6D7mvKJw@mail.gmail.com>
X-Gm-Features: ATxdqUFmiVNM3BmSygrJ_5MgaOHXR3vDS8R-IBrkr2YIPGCwxHNvLN0-R7Ch-Bs
Message-ID: <CABg4E-moQf62Mm+Dv62yLwQaHfKHcrH54Gud1vj6bn6D7mvKJw@mail.gmail.com>
Subject: Re: [PATCH v3] ASoC: SOF: Intel: hda: Fix UAF when reloading module
To: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
Cc: linux-sound@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, 
	Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Peter Zijlstra <peterz@infradead.org>, 
	sound-open-firmware@alsa-project.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 7, 2025 at 11:28=E2=80=AFAM P=C3=A9ter Ujfalusi
<peter.ujfalusi@linux.intel.com> wrote:
>
> Hi,
>
> On 07/05/2025 18:10, Tavian Barnes wrote:
> > hda_generic_machine_select() appends -idisp to the tplg filename by
> > allocating a new string with devm_kasprintf(), then stores the string
> > right back into the global variable snd_soc_acpi_intel_hda_machines.
> > When the module is unloaded, this memory is freed, resulting in a globa=
l
> > variable pointing to freed memory.  Reloading the module then triggers
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
> > Fix it by copying the machine with devm_kmemdup() before we modify it.
> >
> > Fixes: 5458411d7594 ("ASoC: SOF: Intel: hda: refactoring topology name =
fixup for HDA mach")
> > Suggested-by: P=C3=A9ter Ujfalusi" <peter.ujfalusi@linux.intel.com>
> > Signed-off-by: Tavian Barnes <tavianator@tavianator.com>
> > ---
> > v3: Copy the whole machine struct instead so we can safely modify it
> >     (instead of storing the name in pdata->tplg_filename, breaking othe=
r
> >     fixups).  The problem with v2 was pointed out by Bard Liao, with th=
e
> >     alternative fix suggested by P=C3=A9ter Ujfalusi.
> >
> >  sound/soc/sof/intel/hda.c | 8 +++++++-
> >  1 file changed, 7 insertions(+), 1 deletion(-)
> >
> > diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
> > index b34e5fdf10f1..cbf96b342005 100644
> > --- a/sound/soc/sof/intel/hda.c
> > +++ b/sound/soc/sof/intel/hda.c
> > @@ -1049,7 +1049,13 @@ static void hda_generic_machine_select(struct sn=
d_sof_dev *sdev,
> >               if (!*mach && codec_num <=3D 2) {
> >                       bool tplg_fixup =3D false;
> >
> > -                     hda_mach =3D snd_soc_acpi_intel_hda_machines;
> > +                     /* make a copy so we can modify it below */
> > +                     hda_mach =3D devm_kmemdup(sdev->dev,
> > +                                             snd_soc_acpi_intel_hda_ma=
chines,
> > +                                             sizeof(*hda_mach),
> > +                                             GFP_KERNEL);
>
> We need to copy 2x the size as the snd_soc_acpi_intel_hda_machines[] has
> two entries, the second is the sentinel (all 0).

Do we?  I recognize that snd_soc_acpi_intel_hda_machines is an array,
but I don't see anywhere that hda_mach or *mach are used as an array,
at least in hda.c.

I'm no expert though, if we need the sentinel I can send a v4.  Thanks
for the review!
