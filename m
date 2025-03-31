Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE78382866
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 03:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743391366; cv=none; b=nCW23SXLeW0JjkSxOxgGSazo4feFwp/xvjcVqfNXF3O0SoJhbmSLFciox/Cbh0zTEgMvRwyUZv/bnJkGOz5lbXZLsYtp7iXvO552Dh49pq+mRJ0KdYOpm9hNBZLh02BDIra5OsTY0ZHfLag7Dt2vLer/ULd84IGJkn2Xs+Qp1dM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743391366; c=relaxed/simple;
	bh=jo4kV8v/aENUv2W2HZOl8ofUDDJdnNKMztdocm2n5PI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ngZFZOf9mriKTDzVY+Vfh8Y+a9tfkxJtvEc15TqRHBSXuovy4h7Lj3vcozgOcRR71EL1kn+6lbpIzRfojhx8uCAC/EjilqrLVf4InloLNm5p4EC8YMmLaKmXrdUOx9KDUxuBmOZHpt8Y7CgyiFIaVY/OMWOYriut64Ya33V+h3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DQd+mwpf; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DQd+mwpf"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5e677f59438so6060950a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 20:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743391363; x=1743996163; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KRYx+m4X6QsBHhtE2dap7sXTHHBthKX/PSqlJw68O60=;
        b=DQd+mwpfwNFPhunBKXyEn8Wzt/FCaJVfwVpH4wbK/9sEf2CQiKghQjn3OSd936IUIK
         rxjBf4cnbIilpCYxCTqQem7O4zEOVzF8H2ImkUxUkTXDhkv4pE4C8UnLQ4393uXfxB5I
         MkyxjVs1CB6u0qkVitODQ2F2HrHSfEqqjaIQEqxQLh00vGJgpap+uYBN5f6zxLvQ1lc2
         EVViEVrJcOU2S/XUGdDZRYycwm6yOrKJcZrhzKvt8Dj1fA7POQ7pLe6x115DWF4fjwfE
         uYcp04mwDmou1Pbk/WyCbDt4hyNsz/srrGd5tmVkaWuVs9ZqfcMaBbFt8PJU7CZiN7Xy
         1fVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743391363; x=1743996163;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KRYx+m4X6QsBHhtE2dap7sXTHHBthKX/PSqlJw68O60=;
        b=lvq5WCbU+d09PaCmrbVhAmjlxrDvCRHCD7phfSbjkmOs13Q1HVrDggfZwoiQ3ojSyb
         wzx6ySsxEgF4mwtuzNlveAV2Fvhr5urf+RUd9gfeG+LxOlAjkWQhozb2tytnigxobAJs
         ++aUnZhmNnfgGj3zN8+tz25bgKkiZvgsPXpH56NDYhrQipHtIxUmV5NlXPrfEzj0HjWr
         sOh2ceI09ryZDW5bhFY9DO3OrDG4ZmrzL5nzsT/knkNOmrX85LNrzUTHQLt7MIGe9Kmq
         3Ss4CtR1FvG9TtSPh+qE+bjHP27ch+T0YtffHAXjcWhHSDssqRb3oPXkjmC6pvriUmsZ
         vc8w==
X-Forwarded-Encrypted: i=1; AJvYcCUOdeK7V+sroru+FwaeYM0L+EXt2uct36O13UaKuAtnbwEr2rhbwsHRgQXNTzfrWM/Ki3uWd+54xTyCPp4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5zMep79+rC+GB/0YeMPA49D3Ngm8IrXL3zU50wghhilwhCSyH
	fUwuwsmFAwaSTvjgI8JBsRDup68SaabAfhALTlRPHgkNiglCjpL6K2Tu2f5ezIuOCBvXd4k07fY
	mVPjBG8hE1iAiqW6lIyP7GPxc03X51g==
X-Gm-Gg: ASbGncv/dj14j21QJwYYhJy4h3hMNxxZB9O8xhnGMcj+QxYmP7owcnXcQDQfNxHKvBM
	4r4P06OABsVM70UvOI1t2HqYFQI+DPUjdNCTWhfeGF/I8NY3rJPln/6wtgIE6jCiMyhmWTi9lZA
	E8m5fru1tpbV1B2nQkl1ftB9JV
X-Google-Smtp-Source: AGHT+IFr03gYElReDkk2cft2Hu8/w0ithkNgrI6pJXTx0/Gv+zCKyM2ZCp0EfTISo4aCXfbHX4/0AFMA14nNrWM0nc4=
X-Received: by 2002:a05:6402:26c8:b0:5e7:8d40:8d80 with SMTP id
 4fb4d7f45d1cf-5edfcc07956mr6599143a12.4.1743391362815; Sun, 30 Mar 2025
 20:22:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202503311019.7d50fa1b-lkp@intel.com>
In-Reply-To: <202503311019.7d50fa1b-lkp@intel.com>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Mon, 31 Mar 2025 05:22:30 +0200
X-Gm-Features: AQ5f1JoWcqxwg2zWq2o5ZUVnPL-mJCZQ7LgCYfRaRjTccAHD-5GwEsJgJz1-FdE
Message-ID: <CAGudoHFpQyxOx7SU4O5XMSK--JCtkOFc_He13UdtCYQLLwGu8w@mail.gmail.com>
Subject: Re: [linus:master] [wait] 84654c7f47: reaim.jobs_per_min 3.0% regression
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org, 
	Christian Brauner <brauner@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 31, 2025 at 4:58=E2=80=AFAM kernel test robot <oliver.sang@inte=
l.com> wrote:
>
>
>
> Hello,
>
> kernel test robot noticed a 3.0% regression of reaim.jobs_per_min on:
>
>
> commit: 84654c7f47307692d47ea914d01287c8c54b3532 ("wait: avoid spurious c=
alls to prepare_to_wait_event() in ___wait_event()")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
>
> [still regression on linus/master      1a9239bb4253f9076b5b4b2a1a4e8d7def=
d77a95]
> [still regreasion on linux-next/master db8da9da41bced445077925f8a886c776a=
47440c]
>
> testcase: reaim
> config: x86_64-rhel-9.4
> compiler: gcc-12
> test machine: 192 threads 2 sockets Intel(R) Xeon(R) Platinum 8468V  CPU =
@ 2.4GHz (Sapphire Rapids) with 384G memory
> parameters:
>
[snip]
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/cpufreq_governor/disk/fs/kconfig/nr_task/rootfs/runtime/tbox_gro=
up/test/testcase:
>   gcc-12/performance/1SSD/ext4/x86_64-rhel-9.4/100%/debian-12-x86_64-2024=
0206.cgz/300s/igk-spr-2sp4/disk/reaim
>
> commit:
>   46af8e2406 ("pipe: cache 2 pages instead of 1")
>   84654c7f47 ("wait: avoid spurious calls to prepare_to_wait_event() in _=
__wait_event()")
>
> 46af8e2406c27cc2 84654c7f47307692d47ea914d01
> ---------------- ---------------------------
>          %stddev     %change         %stddev
>              \          |                \
[snip]
>      75.63            +4.3%      78.87        iostat.cpu.idle
>       2.05            -2.9%       1.99        iostat.cpu.iowait
>      21.28 =C4=85  2%     -14.8%      18.12        iostat.cpu.system
>       1.04            -2.7%       1.01        iostat.cpu.user
[snip]

So this test spends most of the time off CPU and with my change there
was some drop in system time, which most likely affected timings
elsewhere and there is *more* idle.

The actual perf problem is the locks and this is not a real regression
in the sense there would be a clear speed up if it was not for those.

I don't remember the details now, but there was something funky on
last dequeue from adaptive spinning, where threads would refuse to
spin when they *could*. I suspect this is part of the problem here
(the fact that there is contention aside ofc). Maybe I'll get around
to writing a proper writeup about that, but could not bring myself to
seriously dig into it.

In the meantime I don't believe this report warrants any action
concerning the patch at hand.

--=20
Mateusz Guzik <mjguzik gmail.com>
