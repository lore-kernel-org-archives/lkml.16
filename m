Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0477E23CE
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 02:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750387863; cv=none; b=Kqu2ibwbivPEvbDWB/l+Anh2Rs6VUQ1Lsm+A82qPcT4pkocpw3wCCgGIGbz7bOvtTZ9HO7tL5vTbsfIOSOWovYVJurdCeaipkafholXI0JkGgZ2MD39JtTWfnOwJMIH1sVEAelHTN3FHnEuqYUacUDiPzgXs+vr+3ebuaguK/fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750387863; c=relaxed/simple;
	bh=/QKDlRcwhqIDqN1ZyOADY7Kn32bkkQMXiTnisdbzINo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sBMAWZGf0TOFAAtgwsoRghRL6wvYSA/sfLBjFWUq6sI1ExoV3gnH7PfaZkWwaeuD//JOizd642ABnWeRxGHYtdloanWYWc279wOhyK7vOsoP+K5h8s8LqgiKGf3M1tgWjTFGeo9RCoczMYyyxb7Db+037OXJ3HMLzQAcVg+WyAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=a69Il1lX; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="a69Il1lX"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-32b5226e6beso13559031fa.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 19:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750387858; x=1750992658; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Tx2CbH4A/3SzNrGWHEPoaDpuPtPaErEYy8KTPvOJ9E=;
        b=a69Il1lXynoX9hlTwfZFz3xpXNoUER1T+d+lc+rBQa8xQJKtzEVVDqlwiGHHMBhCWX
         fOeRAJjtKhSQnjk6/vg0dZKj25Dl8j8ipHl1CojUzvbblmnXTGNORjKrK4JkuwgrcPgp
         EObWpgSNWQyRRjOlZNUjl5g3dE18AR+8CBKiw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750387858; x=1750992658;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Tx2CbH4A/3SzNrGWHEPoaDpuPtPaErEYy8KTPvOJ9E=;
        b=i6Ak1PA7uDmXocoz7KJGz37xMR7ldq0xzMILJUeND8+erU5PEBZ+Fgr+cMJb6yhq0L
         +vj8NUGEXDQe4+vKiZxtxBIZBggHN/cn8ROOmLMFmrJgfwSV7pmvkK5jV68ZqCLK7Jpt
         lY3rdyfhyVBNzoHQcj1xPOgIQ3XWia7JsWpau3dCCFzndQa9yZH7zjMbhfIY+xN6b5/+
         mSNP0uF6qAJNc2pL+BQM2nAJ+Pkg/FrVHcLRL2HIcU9oTZmCW0xgbCfnCjY26ec7Y/mf
         neNklJcIFuFC54M43WClnvxqS/3Pv4VCvM2kC1bVk6sym0s1bKFOizVQ2W4hZPi1wVzO
         xbWg==
X-Forwarded-Encrypted: i=1; AJvYcCXaVX8iWnfch9KW+WaXuuWfScGtCuiEMcF9uEz7c5Pf2Dunx5MNQ9558PWuPN0Nb+EjVB7IYBSPonMM/II=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYlIt4MdiZrM02sn8dk0l4Ju16r0iJKqxv84Oxtt7YPU0QUa8/
	xtgEW37bmYp8NsseYfeo0Kfj8c7zWayGa/Zjc7bRJwW2edO3pwnhvB4AeDbVraw04pfl0PbpN6E
	mVEV0tyULItMel3uW9r2yi7wGmt7FN9qjocVLJJ/k
X-Gm-Gg: ASbGncsmLvcdPE1rZLsrAp8o5CrFW0TNbbGV2EdcWNm79OH7wC9QxPswA5Pc/gyjwVP
	of2+SPl9XgHftK2SqIK+Q8ZPkO10AFPy8Dd3McqmL4GrHRjQpL9uaP9WyEnF0Ds3thT4VuNTKfN
	976fGiup+7Kt5pKueXPXbXibg6807GNFJUlGLz2WgXQE6uhQYh6pYuZwgHCli9KNi3JBol4rMbu
	A==
X-Google-Smtp-Source: AGHT+IEpFd0jknn6dJ7uHw9T9Pf5V4mOpm5v3zlNZwNkWSElZnOusIQCIAw38tA7L/6endmHtCrfM0YwX0tD4KBIaVU=
X-Received: by 2002:a2e:bc05:0:b0:32b:9c54:4ca1 with SMTP id
 38308e7fff4ca-32b9c544dfcmr1378961fa.39.1750387858055; Thu, 19 Jun 2025
 19:50:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250610050458.4014083-1-naoyatezuka@chromium.org> <aEhK9knE1Fu_e_Sv@tzungbi-laptop>
In-Reply-To: <aEhK9knE1Fu_e_Sv@tzungbi-laptop>
From: Naoya Tezuka <naoyatezuka@chromium.org>
Date: Fri, 20 Jun 2025 11:50:46 +0900
X-Gm-Features: AX0GCFvTeEJqMqZJLqsl51gLxelWMSzurbKwmLCMjIMUg2mxZgtwpD35rT1g5Ho
Message-ID: <CAFe8q1Xp3c-o7DdNcmdwRDcntnEjD5sqVQEj06ouugLK6KO66A@mail.gmail.com>
Subject: Re: [PATCH v2] platform/chrome: chromeos_pstore: Add ecc_size module parameter
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, Kees Cook <kees@kernel.org>, 
	Tony Luck <tony.luck@intel.com>, "Guilherme G . Piccoli" <gpiccoli@igalia.com>, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Tzung-Bi and others,

Thank you so much for taking time and valuable feedback on my patch.

On Wed, Jun 11, 2025 at 12:10=E2=80=AFAM Tzung-Bi Shih <tzungbi@kernel.org>=
 wrote:
> The doc [1] suggests to describe changes in imperative mood. If you have
> chance to send next version, please fix it.  Otherwise, it doesn't really
> bother me.

Thank you for pointing out the convention. I'll fix the commit message to f=
ollow
this in the next version (v3).

> > @@ -9,6 +9,10 @@
> >  #include <linux/platform_device.h>
> >  #include <linux/pstore_ram.h>
> >
> > +static int ecc_size;
> > +module_param(ecc_size, int, 0444);
>
> Does it need to be world-readable? How about 0400?

Good point, there is no need for it to be world-readable. I'll change
the permission
to 0400 as you suggested in the next version.


> > @@ -117,6 +121,9 @@ static int __init chromeos_pstore_init(void)
> >  {
> >       bool acpi_dev_found;
> >
> > +     if (ecc_size > 0)
> > +             chromeos_ramoops_data.ecc_info.ecc_size =3D ecc_size;
>
> It seems `ecc_size` doesn't have an upper bound.  Wondering what would
> be happened if it is a somehow large value.

I have investigated this, and you are right to be concerned. Providing a la=
rge
value for `ecc_size` can indeed lead to a kernel panic.
The panic occurs within the Reed-Solomon library, specifically from a BUG_O=
N
check in `decode_rs()` [1] when the ECC parameters are invalid. Here
is the crash
log I observed (edited for simplicity):

[    2.395351] kernel BUG at lib/reed_solomon/decode_rs.c:43!
[    2.395355] invalid opcode: 0000 [#1] PREEMPT SMP NOPTI
[    2.395358] CPU: 3 PID: 1 Comm: swapper/0 Tainted: G        W
  5.15.178-24446-gf4364e2b1c85-dirty #1
f18df54893409d10705efc03f3f58f5431f53e8b
[    2.395361] Hardware name: Google Kindred/Kindred, BIOS
Google_Kindred.12672.534.0 01/19/2023
[    2.395362] RIP: 0010:decode_rs8+0xee0/0xef0
[    2.395378] Call Trace:
[    2.395379]  <TASK>
[    2.395380]  ? __die_body+0xac/0xb0
[    2.395383]  ? die+0x2f/0x50
[    2.395385]  ? do_trap+0x9e/0x170
[    2.395386]  ? decode_rs8+0xee0/0xef0
[    2.395388]  ? decode_rs8+0xee0/0xef0
[    2.395390]  ? handle_invalid_op+0x69/0x80
[    2.395391]  ? decode_rs8+0xee0/0xef0
[    2.395392]  ? exc_invalid_op+0x3b/0x50
[    2.395395]  ? asm_exc_invalid_op+0x16/0x20
[    2.395397]  ? decode_rs8+0xee0/0xef0
[    2.395399]  ? down_trylock+0x27/0x40
[    2.395401]  ? console_trylock+0x46/0xd0
[    2.395404]  persistent_ram_save_old+0xfd/0x1b0
[    2.395407]  persistent_ram_new+0x385/0x720
[    2.395410]  ramoops_init_prz+0x8e/0x120
[    2.395412]  ramoops_probe+0x25e/0x460
[    2.395414]  ? acpi_dev_pm_attach+0x27/0x110
[    2.395416]  platform_probe+0x6b/0xa0
[    2.395419]  really_probe+0xd5/0x340
[    2.395421]  __driver_probe_device+0x78/0xc0
[    2.395423]  driver_probe_device+0x28/0x180
[    2.395425]  __device_attach_driver+0x11b/0x130
[    2.395427]  ? deferred_probe_work_func+0xc0/0xc0
[    2.395429]  bus_for_each_drv+0x9d/0xe0
[    2.395430]  __device_attach+0xec/0x1a0
[    2.395432]  bus_probe_device+0x32/0xa0
[    2.395434]  device_add+0x281/0x3b0
[    2.395436]  platform_device_add+0x15e/0x200
[    2.395438]  ? chromeos_privacy_screen_driver_init+0x20/0x20
[    2.395441]  do_one_initcall+0x10e/0x2d0
[    2.395445]  ? strlen+0x10/0x20
[    2.395447]  ? parse_args+0x11f/0x3a0
[    2.395450]  do_initcall_level+0x80/0xe0
[    2.395453]  do_initcalls+0x50/0x80
[    2.395455]  kernel_init_freeable+0xee/0x160
[    2.395456]  ? rest_init+0xd0/0xd0
[    2.395458]  kernel_init+0x1a/0x110
[    2.395460]  ret_from_fork+0x1f/0x30
[    2.395463]  </TASK>
[    2.395463] Modules linked in:
[    2.396278] gsmi: Log Shutdown Reason 0x03
[    2.397390] ---[ end trace 52a9249d98b7a130 ]---

Since this validation issue exists in the pstore/ram core rather than
being specific to this driver, I believe the best approach is to address
it in a separate, new patch. My proposed fix is to add a check in
`ram_set_ecc_info()` [2] to validate the ECC parameters against the
requirements of the Reed-Solomon library, and return -EINVAL if the check
fails.
I will prepare and send this new patch for review, and add you to CC.

Thank you again for your guidance.

Best,
Naoya Tezuka


[1] https://elixir.bootlin.com/linux/v6.15.1/source/lib/reed_solomon/decode=
_rs.c#L43
[2] https://elixir.bootlin.com/linux/v6.15/source/fs/pstore/ram_core.c#L188
