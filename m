Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1666E28CF72;
	Wed,  7 May 2025 14:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746626712; cv=none; b=XKiHWnEwfHGAe+WTnfDlXImCojmGl+qaFe2nEaDVVe31wxhjnRh1ieHRs1/1AJ2XgMkh9TY7KPs+nVn67sVC4KwI+UAdbfwUaWZJd1IidNIhqjI0+olTpWoHEgRvG/u5dayd5c92EcX2U81gclNGTOAf2mJRReKORKI5gc3YHbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746626712; c=relaxed/simple;
	bh=VZeY2x/zH0DHAE9y8NcR51lGy2rQ5ssZLOF2RKorHLk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tqP0sUlLFYnQhgl5zAFRSyzQF86derCSL1cO7DQwO6AT6nahu8ClN99wOmqFxQrgczGBec0StmkPm52rXtdFD2nc5FpRnU5Z6E9TqtMcI9MNRxCrEfPKH86qZLXEZ/pXBznAwWLwe3XlAX3gvNLAMpJD6tN+YT9U7Npq485oUvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tavianator.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tavianator.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5fbeadf2275so1742657a12.2;
        Wed, 07 May 2025 07:05:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746626708; x=1747231508;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dy47WfspidijBe6S4QRWQIIMIPDG64IjZcCZJzTilW8=;
        b=HBhtMazo9wF10qa+5V4DGOhbDF5CgghlXxk5tnoWeT1ozmol4sNzlOU74i1mUZw+cJ
         WbCJWhit0MQVKEboce0k6t6zKem8zvcI36FG+YbCrCbjMCMNv+YbiBF7xckMW9NAVV8q
         ajIfGWEQ+SEJ06anbpOpNTA8hw5v7YkIrHQ4PZg2DGH/KdzBfF6oLdR03wgYbf5a6GV2
         l1y5UvZmLSmirIYx7SPtX5pIYmlkxsrSgBH0HMzskJ44CbSIQhxiLqJxpB9/C2RKsnb9
         ZZ3QXoQpaX5jqCeR4L6N3RxpmaiC+yoIQWIlyRZbHdEms24SRadipRzQTLS4eog6v1ki
         ExVw==
X-Forwarded-Encrypted: i=1; AJvYcCWiJttwRUiAfvkyfz7qc5uBw1fI6HYlcwx247jwun6qvT/Z1SxKkyYVV8S872wO4LvlcE/Vp7Q101LoRRE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSy3mHbjNi16VzBrGffaAex7rSJx47+JwcwVIxlTkdtUR+3rwt
	5UIaKtbwwRn882u4J7OjzIAiX565Cg8F+bhRycTVxMMpHisNO/0XnNM1L5knrtU=
X-Gm-Gg: ASbGnct5svMgdloNeox0HWWmh+SSxdxiTOGuh5uaQjOwKIVccBFovnrrpEjQLSSS2kY
	uTVAfSWucm/YfW83+g+bn8xNczu1gqazt0DkZbvKffnL42XJibwSLN2Ixw5o8se+CLgsQq5vpfW
	aV9pxQJQcX4xkCVIz4rFX+ignnqRoPRdWMGusDJ12CSOduSWDjWhHTvMQ8viUaZc33b/MqAJt0q
	Pk9jMoyRkCPdWeojXki+/Oe0z1xPykxADHJM2tuvrvzjymNVXYpXxBQe0Gku25VcT8FJPxLCNYa
	G9s0HXqi/b9wodG77Qxn9dG0sAu4OR9Doe9JoKc8L6R7khZT8krhoTg93afEVUJzI1Bbq4AZqjt
	S/00Cr1YYCw==
X-Google-Smtp-Source: AGHT+IE7JkO6fL/7y3ZqFeN6XA6T/g/QwIAVyjDJ/PQOb6/nAxPkHJUjrPjOpWQCaTvyKgLjW5tDfQ==
X-Received: by 2002:a05:6402:2695:b0:5fb:2105:c62c with SMTP id 4fb4d7f45d1cf-5fbe9d8c5f3mr2980172a12.3.1746626698434;
        Wed, 07 May 2025 07:04:58 -0700 (PDT)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com. [209.85.208.42])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5faa42f65dfsm8428388a12.38.2025.05.07.07.04.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 May 2025 07:04:57 -0700 (PDT)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5fbeadf2275so1742263a12.2;
        Wed, 07 May 2025 07:04:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV3d6s3A4Qi9mBOj4x75Y2K81CGLYL7y+xgf2Hvow0IZvXu9yrqDejtWzgCMh9k23qzGBdwDYNXEr8uVes=@vger.kernel.org
X-Received: by 2002:a05:6402:5cd:b0:5f6:4a5b:9305 with SMTP id
 4fb4d7f45d1cf-5fbe9fb1978mr3174944a12.33.1746626696797; Wed, 07 May 2025
 07:04:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <5aaee9fdfe8437ef2566b200bea45e4baaba3fcb.1745426811.git.tavianator@tavianator.com>
 <7637e816-8c63-4e95-98fc-aea6a4843391@linux.intel.com>
In-Reply-To: <7637e816-8c63-4e95-98fc-aea6a4843391@linux.intel.com>
From: Tavian Barnes <tavianator@tavianator.com>
Date: Wed, 7 May 2025 10:04:45 -0400
X-Gmail-Original-Message-ID: <CABg4E-=MSxLMJJyQtCyoy=E7MU5Od0MFUiOJn+F8qL7AXe-Ouw@mail.gmail.com>
X-Gm-Features: ATxdqUHa2kHKbT2_ZiQFNSHYsfs7FlZFoQ9vR_gdXWUXMmzjvHh-4X7vQfxzjP4
Message-ID: <CABg4E-=MSxLMJJyQtCyoy=E7MU5Od0MFUiOJn+F8qL7AXe-Ouw@mail.gmail.com>
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

On Wed, May 7, 2025 at 3:32=E2=80=AFAM P=C3=A9ter Ujfalusi
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
> >                       }
> >
> >                       if (codec_num =3D=3D 2 ||
>
> I think the correct way would be to make a local copy of the
> snd_soc_acpi_intel_hda_machines array as we might be modifying it:
>
>
> /*
>  * make a local copy of the match array since we might
>  * be modifying it
>  */
> hda_mach =3D devm_kmemdup_array(sdev->dev,
>                 snd_soc_acpi_intel_hda_machines,
>                 2 /* we have one entry + sentinel in the array */,
>                 sizeof(snd_soc_acpi_intel_hda_machines[0]),
>                 GFP_KERNEL);
> if (!hda_mach) {
>         dev_err(bus->dev,
>                 "%s: Failed to duplicate the HDA match table\n",
>                 __func__);
>         return;
> }
>
> or if the "2" is not satisfactory (we _know_ that the array size is 2
> for this and will not change):
> include/sound/soc-acpi-intel-match.h
> +extern size_t snd_soc_acpi_num_intel_hda_machines;
>
> sound/soc/intel/common/soc-acpi-intel-hda-match.c
> +size_t snd_soc_acpi_num_intel_hda_machines =3D
> ARRAY_SIZE(snd_soc_acpi_intel_hda_machines);
> +EXPORT_SYMBOL_GPL(snd_soc_acpi_num_intel_hda_machines);
>
> and:
> /*
>  * make a local copy of the match array since we might
>  * be modifying it
>  */
> hda_mach =3D devm_kmemdup_array(sdev->dev,
>                 snd_soc_acpi_intel_hda_machines,
>                 snd_soc_acpi_num_intel_hda_machines,
>                 sizeof(snd_soc_acpi_intel_hda_machines[0]),
>                 GFP_KERNEL);
> if (!hda_mach) {
>         dev_err(bus->dev,
>                 "%s: Failed to duplicate the HDA match table\n",
>                 __func__);
>         return;
> }

I don't think anything is relying on hda_mach being an array (correct
me if I'm wrong!).  So maybe just devm_kmemdup() is fine?  I'll test
it now.
