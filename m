Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA3E4B1E7A;
	Tue,  6 May 2025 19:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746560776; cv=none; b=ZSMdaM6cMEuN5J9ujbfZbnDkZgE/5P+gCTmo7ZrOV9s+7EhUhPM0lJxZvjV5VEZeKyF9sRi6NbHQiPdlkc67zBmOuli0iRh7ai67F0aAQ3uSF4YPdoOOHxNuDzgjrgsl6HjYKJ0ZcajyrbrpQNEvONI1A1OVjx6oPpJrCph34+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746560776; c=relaxed/simple;
	bh=EfrCHtKQ2RkR4JNDWg2D6SqkrXrN0NxL1Y1ls1PhtwE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kC4sxsLlCzV1q2uzL5wfFllu8SsSZgqT+0lP159D7BDe7mDLuJ3mwpd+EE1Sb1tOmned4Z9tdyJFK62aZFfWWmionu2KeJoAvxiN8bNVTC8AR/P5XSK+JjRSq9L6rd8+KpoHY5uglK6zSdAnx2ppzKCBTMo71K7DLvPjqL3itoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QqkwP8pi; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QqkwP8pi"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ace94273f0dso390240966b.3;
        Tue, 06 May 2025 12:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746560773; x=1747165573; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6A3LKXcKbQRzOmieF/B3aokjKJXQ0R9uCqIUYyekQaA=;
        b=QqkwP8piCwKoNXkfDAyR9ykayLTrosoTL7PShV08uhwL9y70+9lO/NQ8GDJelMbOYJ
         bEATzD1OlBj2+5zFErwgPpdGKGbkHNipy6zbeH12ZX/f9rtSwBrmh3k36JemJDuuu4Xg
         hLwu2gZWLB9w0g1L4SfuwxBOAzCt2MMZL+Gay2ddf+kI+PhpXeTywmDilx4nwnMeFVkc
         6Z2VTLKb4IpA3T+epB/7xBt60NQLT2XWiuHgf34EEn55M6DUAdwSdxb//QKZtNAD9Srd
         Mx8zl+WgR1G8H8DEpbmR/s5Km4FQslDM9giWl4+G4xjounG3Im42RFf8cMkhYPmI2Rt+
         4Cxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746560773; x=1747165573;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6A3LKXcKbQRzOmieF/B3aokjKJXQ0R9uCqIUYyekQaA=;
        b=BSq/QNdfCnOQHca7GisQgI5WLxrevdSlVm0LDWwQvTainIMgtgjpQ4mEM08/78Jedu
         qsO/F3YZaUKdHMGiGZ+j5JXBq650KcHFzPYLyGa0Grwxv1qc5rZyIy9hN1uNNkJmjeP6
         pFNWh6ro8u8fD8l9+4BpfI39FXNcoyk13M2evbtNDsFPf9BrvOuH+HlG8axq39fYLJsC
         xoRgQCDr73GYbDvVEEMTUgXciBI+VWZR88waC9GpdzDBUU5/NB6ESfW1Ky/oMVkMIbEQ
         6jeST3T4dU8VLICuvx2BDhmpaVs7XFKYDNQVB914PpCA+ck6y0a6g7uZd95u9BviQsY+
         6y9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUEnbdt/ibbXU08uXXfDM41uZR8ZkuLKNlbJKxIpVE/7R+b97IoyKvhSKxl00Cdkv+e+Cw0Qhoroh9Xpg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzmJf2pPFYmNUz77/axSKkOAsd682wRZSfLP17cyOYBH7s87OKI
	tfScSPqUgudsCNVQLjjf/dLdWnhDXarwLKoZgD5sucM8YB9E1OPGBy5RRpCJGbXc30fEv0KS6H/
	p8mI8vBo0nXFNAEgesXgq6zpliQo=
X-Gm-Gg: ASbGncumEiE/PLtXGNwsZX3p/qSC+x5vwC1Zp408tXE5nRmvCMjVJGWjK2GhliJglMr
	zDsT8jv6CIfj4LluL27A7USfweMraOM4Zb2Vvl6ia3MLqGSa+W+zl/7Smb5on3Pr9ldDZR9DkI/
	1mPYj5AVXv8QRKCtSpXEnMyiE=
X-Google-Smtp-Source: AGHT+IH+DCQfnj+qWC+qZV6cPXJm9upBQAEspihuVpc5dbc1zorkI9URLgKeaple2qN2bMjFVkNmBm+gQ9ZSeVWAhlI=
X-Received: by 2002:a17:906:ba90:b0:acb:ba01:4a4 with SMTP id
 a640c23a62f3a-ad1e8b91708mr81253666b.3.1746560772980; Tue, 06 May 2025
 12:46:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250423194958.30715-1-linmag7@gmail.com> <202505051339.kc4bhqlt-lkp@intel.com>
In-Reply-To: <202505051339.kc4bhqlt-lkp@intel.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Tue, 6 May 2025 21:46:02 +0200
X-Gm-Features: ATxdqUFA64GmO5svmNDpACVB3gWIvGC2bl8EQg4prGGJLCyBoJH_JupI6HfaaOU
Message-ID: <CA+=Fv5SBcjqE=Xdjb8_YQrs1K3f4-vnY0PQ2KNg-Zetw01f_zw@mail.gmail.com>
Subject: Re: [PATCH v2] alpha: machine check handler for tsunami
To: kernel test robot <lkp@intel.com>
Cc: linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, 
	oe-kbuild-all@lists.linux.dev, richard.henderson@linaro.org, 
	mattst88@gmail.com, arnd@arndb.de, paulmck@kernel.org, 
	glaubitz@physik.fu-berlin.de, macro@redhat.com, mcree@orcon.net.nz, 
	ink@unseen.parts
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,


Sorry , my bad, thanks for the feedback. I'll fix this and send it out
as a v3 for this patch.


Regards

Magnus

On Mon, May 5, 2025 at 7:37=E2=80=AFAM kernel test robot <lkp@intel.com> wr=
ote:
>
> Hi Magnus,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on mattst88-alpha/for-linus]
> [also build test ERROR on linus/master v6.15-rc4 next-20250502]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Magnus-Lindholm/al=
pha-machine-check-handler-for-tsunami/20250424-035141
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/mattst88/alpha.gi=
t for-linus
> patch link:    https://lore.kernel.org/r/20250423194958.30715-1-linmag7%4=
0gmail.com
> patch subject: [PATCH v2] alpha: machine check handler for tsunami
> config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/202505=
05/202505051339.kc4bhqlt-lkp@intel.com/config)
> compiler: alpha-linux-gcc (GCC) 14.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20250505/202505051339.kc4bhqlt-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202505051339.kc4bhqlt-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> alpha-linux-ld: arch/alpha/kernel/sys_eiger.o:(.init.data+0x118): unde=
fined reference to `tsunami_machine_check'
>    alpha-linux-ld: arch/alpha/kernel/sys_dp264.o: in function `clipper_in=
it_pci':
> >> (.init.text+0x394): undefined reference to `tsunami_register_error_han=
dlers'
> >> alpha-linux-ld: (.init.text+0x3a0): undefined reference to `tsunami_re=
gister_error_handlers'
> >> alpha-linux-ld: arch/alpha/kernel/sys_dp264.o:(.init.data+0x118): unde=
fined reference to `tsunami_machine_check'
>    alpha-linux-ld: arch/alpha/kernel/sys_dp264.o:(.init.data+0x298): unde=
fined reference to `tsunami_machine_check'
>    alpha-linux-ld: arch/alpha/kernel/sys_dp264.o:(.init.data+0x418): unde=
fined reference to `tsunami_machine_check'
>    alpha-linux-ld: arch/alpha/kernel/sys_dp264.o:(.init.data+0x598): unde=
fined reference to `tsunami_machine_check'
>    alpha-linux-ld: arch/alpha/kernel/sys_dp264.o:(.init.data+0x718): unde=
fined reference to `tsunami_machine_check'
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
