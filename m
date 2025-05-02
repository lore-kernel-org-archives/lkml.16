Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD012566E1
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 14:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746196802; cv=none; b=k0jgom9Vz5EJkgJigU8DdzFBxqHHsBBdjCRQbvfv5eQOpunNNVyvL/CJHmvaKKfNbhSm5ASTLP7l2Fj9at44vV1ipGOCAy/I6VoAfR9EzUzZDqVfho1WfWC/ht9YJdSSegopLorjcIlASJKxhnnZvkZB48g+GTtN9QSrRz9ca8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746196802; c=relaxed/simple;
	bh=kYqKcRH6fB4ETHEgD1rPpMflF3bCZXf/I4lKuOxxHWo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gla7u5vMCWOMS22DoQX3kN1TRq/rnuEY9ylvPq6Dm4LezmKS3Q0qvHeoaJ/rjaYzPYFCW1zogCxMTWewZIFoCPxD+w2GFQRTOfMgwwMnO0qOIT6CIP4/vQGnByrBQIlwsWUyCxPvyLyw8hM+zP22BNeDFS+XZBOxu6iG4BRZR0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=KKmWpXcS; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KKmWpXcS"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-af908bb32fdso1960052a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 07:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1746196799; x=1746801599; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1vZF3B9IYrXQbmQQ8MxFmSjJPr92HC1Q2NCx1VrCKwk=;
        b=KKmWpXcSyG7hXCKTTBSWYK6euQO2Ehjze8IoyKnV8ulD6GcJxVzHypOHjx4ZmbSkgg
         CgJUpDIEX8QGA9IdyusmFI8tOOKZykU0WAFJR9n5DtzrXMh475JtLmANnhmZZtcuYHhJ
         4AgcZW81HDDv2+h+aP2T/adenCoRSFy0dV5dE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746196799; x=1746801599;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1vZF3B9IYrXQbmQQ8MxFmSjJPr92HC1Q2NCx1VrCKwk=;
        b=WRhYsxrkzEQ0OJ52qZjiTklfj7/jC3GSFOGlw7nJwZC3zbtzsKjhYLEAjkWWTJPeN7
         SpzSizb5oIPDbsxPsC+7yzKQcraUnQV49GEFWsCTcw/58knstkhzkvzdWyx2iNjut3CS
         x+YkTjlOR6/MZ+z1Ymuedek1IpVF1XIGmdgEvVR9huDFWOjfSr7/93ENboZxYbADmNqI
         rpKgQ1fU2chsb4p4CuSS3W2Gup6c+5s80qr+qZ7e29QnT51lG7XMrND4FUcFZHCTqok4
         pMOdNGvTuQ+L6M2GLYxPong3ZQMwyhFSwXJroX5UnAvQo/BoSo5pr/VlAqVhYjnAom1q
         Edsg==
X-Forwarded-Encrypted: i=1; AJvYcCVjFiZd4pH2fkwvoubZn8BfeKnlWrqWTruL1oY0VZPl9qDSAH417U4PplkKH4HmwS/QhKFN+kMYD/OLGC0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZ/xgx4JZ7S05P3w2QUqyzpqd3rlCQZdB4riOHlCi6E7NsoNjw
	Stkzz1PzdfX+XKwcXO4hqihoXH8oFs3CUehTCtFC6Z/LZTFHM4z2VY382J/YzJO8b5i2+fIYUv8
	=
X-Gm-Gg: ASbGncvvZaDHd2wlp/b3k1MjDa+emr9ayIFNokJIXdoVCV7KlDAw1vTQy/fDOc79odg
	VrSSKNlQYB0gp086iDNBAfe+2x79B+n8hNNdZLieVsYvLuTnGxioJFABQeGWufBqwXlf3OvQ8pr
	1Mp0KQsf81d8WCDoBbbaf0Sp0j74ibNutwmC/zUx1jdgtgpRoVdH1lXLbsf+DmuIA4ycI1IqnFU
	GLNdRr+49sF9af6AQY+TStYbX0m2aelNi2ff8B8URGF9QMH9Mj2DXqAcdhdE9Du6C0owKxNYF9h
	80xDI5C3szzt35QZBptiS5+FsYrVTKkjwc5gCoOCIy01JP+m2VqjokP3A9cjJFeCzfR0QLf7/Jm
	a3YvlRLi/ftJNkrKFxRM=
X-Google-Smtp-Source: AGHT+IGJTmQhk+zWcGPglNU0vmLIctrcrJhT8c2JCbLa1PT8qxuZ1YI6kXBnX2joxoz1IENkJAQwWg==
X-Received: by 2002:a05:6a20:c91b:b0:1ee:5f21:6720 with SMTP id adf61e73a8af0-20bd86450e0mr9776096637.16.1746196799384;
        Fri, 02 May 2025 07:39:59 -0700 (PDT)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com. [209.85.215.179])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fb3924df3sm722148a12.3.2025.05.02.07.39.58
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 May 2025 07:39:58 -0700 (PDT)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-af908bb32fdso1959974a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 07:39:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXtBicZWgnb2e5RrwJx2p7XcgKjwgDFIJgtlAVNuo7zM2Lfezv0RoMPzrWDRvCdMU3RpeBR2yFYxT+Yi6Q=@vger.kernel.org
X-Received: by 2002:a17:90b:5247:b0:30a:204e:fe47 with SMTP id
 98e67ed59e1d1-30a4e238283mr5274952a91.16.1746196797472; Fri, 02 May 2025
 07:39:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250502103905.3995477-1-max.kellermann@ionos.com>
In-Reply-To: <20250502103905.3995477-1-max.kellermann@ionos.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 2 May 2025 07:39:44 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Udm8M2HnMWzzY-cyr7UCVf-0O8uSe-yOAfJ+27YBOTdQ@mail.gmail.com>
X-Gm-Features: ATxdqUH3pEZ-iVBIoKyH9R01WQyAmPtK0ORDT1kr3BWCBtOxmXaa6s2ZMKtwLNg
Message-ID: <CAD=FV=Udm8M2HnMWzzY-cyr7UCVf-0O8uSe-yOAfJ+27YBOTdQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] kernel/watchdog: add /sys/kernel/{hard,soft}lockup_count
To: Max Kellermann <max.kellermann@ionos.com>
Cc: akpm@linux-foundation.org, song@kernel.org, joel.granados@kernel.org, 
	cminyard@mvista.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, May 2, 2025 at 3:39=E2=80=AFAM Max Kellermann <max.kellermann@ionos=
.com> wrote:
>
> There is /proc/sys/kernel/hung_task_detect_count,
> /sys/kernel/warn_count and /sys/kernel/oops_count but there is no
> userspace-accessible counter for hard/soft lockups.  Having this is
> useful for monitoring tools.

Hmmm. I suspect this has more to do with the fact that both hard and
soft lockups nearly always end up being fatal. ...but I guess
technically they could be recovered from and the kernel can be
configured not to panic, so I guess it would be OK to add something
like this.

It feels like there would be a better place for these to go than
straight in `/sys/kernel`, though I don't really know it. Maybe
someone else on this thread has opinions? Any chance they could go in
"debugfs"?


> Signed-off-by: Max Kellermann <max.kellermann@ionos.com>
> ---
>  kernel/watchdog.c | 53 +++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 53 insertions(+)
>
> diff --git a/kernel/watchdog.c b/kernel/watchdog.c
> index 9fa2af9dbf2c..09994bfb47af 100644
> --- a/kernel/watchdog.c
> +++ b/kernel/watchdog.c
> @@ -63,6 +63,29 @@ int __read_mostly sysctl_hardlockup_all_cpu_backtrace;
>   */
>  unsigned int __read_mostly hardlockup_panic =3D
>                         IS_ENABLED(CONFIG_BOOTPARAM_HARDLOCKUP_PANIC);
> +
> +#ifdef CONFIG_SYSFS
> +
> +static unsigned int hardlockup_count;
> +
> +static ssize_t hardlockup_count_show(struct kobject *kobj, struct kobj_a=
ttribute *attr,
> +                                    char *page)
> +{
> +       return sysfs_emit(page, "%u\n", hardlockup_count);
> +}
> +
> +static struct kobj_attribute hardlockup_count_attr =3D __ATTR_RO(hardloc=
kup_count);
> +
> +static __init int kernel_hardlockup_sysfs_init(void)
> +{
> +       sysfs_add_file_to_group(kernel_kobj, &hardlockup_count_attr.attr,=
 NULL);
> +       return 0;
> +}
> +
> +late_initcall(kernel_hardlockup_sysfs_init);
> +
> +#endif // CONFIG_SYSFS
> +
>  /*
>   * We may not want to enable hard lockup detection by default in all cas=
es,
>   * for example when running the kernel as a guest on a hypervisor. In th=
ese
> @@ -169,6 +192,10 @@ void watchdog_hardlockup_check(unsigned int cpu, str=
uct pt_regs *regs)
>                 unsigned int this_cpu =3D smp_processor_id();
>                 unsigned long flags;
>
> +#ifdef CONFIG_SYSFS
> +               ++hardlockup_count;
> +#endif

Please no embedded ifdefs like this. I personally wouldn't hate it if
the "unsigned int" was simply always defined, but if we want to keep
it only defined for sysfs then please use a function to increment this
that's declared as a static inline noop in the case that sysfs is off.

-Doug
