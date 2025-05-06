Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 102E7139E
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 23:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746572582; cv=none; b=B0x3K28hT86Bd1tonj31nHQqNQTeONM9j2IuozUqOBh+h7IF6FPxAK8Nk5SeTZd3KJjyTHS71qUivjENLpd9el+Y3toc9nGQ/IC8lC2Kv1bgh1qViCZlTb0AEmCIGqRuOFdkD9fUX+VO8sV4yTve//lGz1GK8sZF6D16Z+HABLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746572582; c=relaxed/simple;
	bh=FGbQDwSMdwehg0vo+WziIzs6qAb86oKHc9AoOEeCwRY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XnrS3cAed75/AOWeYWCtpWUB75l08IOgc6n3daAAlvoChNkYop9SON2FICQASHqLq7FlWGV8VI9IJ0/moKCCRkfLeYO8Yo790OOAxqQ33NOCCgsM+/xVOePq6pCAga+TJyv9F8JAo3t/EsdCe1k5DH8W+cIo71X0trBL1fYdSj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=m6DrCi0V; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="m6DrCi0V"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ac2a81e41e3so1163912766b.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 16:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746572579; x=1747177379; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sPF1HHimx0iwlaJma09DLD4bF+ZsfFO0Z26KdaLYRwk=;
        b=m6DrCi0VARD44d93ldBn6MsoottA66ph+eyrkVgnHSeCHlo9wMhGYpqy2ms2/j3HyX
         UHtrIR/iQWV+mQQHBalQSKwZ1LRVJ40V5cafEwMggCiPTFmHAeAKsMq3JFfGXUTBOR31
         A/Fy5kZtzcnToQB2oHh47GZ9uOmNie3kTIgmjbzglhPoR4yuR/l3XGbsW8y76FDwOMkt
         GF/Czkl0G4Xj7BSj7OA7Loeu0RyybXFAShacYUnxZOxh/i1o0EpOBrG44RS3i5IxQGvb
         PwDDC54+ngKqhT4d9YGlcBIYE5C7xryggd1DzaNjc2n9kVbC6J+q9Ss+UIQS28xwtJ/l
         nXwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746572579; x=1747177379;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sPF1HHimx0iwlaJma09DLD4bF+ZsfFO0Z26KdaLYRwk=;
        b=MAPDyR4/2PZtLXCxAHZFyFEo+6s0oIHLMi/rgqt/SGr9Fz0WCnlJkykmCsH6gtMdAh
         FmGJEkwp/3ZHJG0+ZA74TGHgQZDNAL6TB1l7cvbdP+ZtqwXDC1IF0XfLpMBKmdnnf84W
         uwLqLVfQcxNgUtUPhqyNgTag3IHujNzg4XcdwxrVh63mwWp0HpZFycXgALn6m4PSvwKD
         xOFZJMOyFcUbimBH9NEEnOlCRX4zRZsMYCVaFaG8c0Cz40dVWyCjGoX0dtubWZ2FS/wM
         N4nVGDL5hfX5KdteK5l+yJjRhCLAtmntgDKKq3hqVfftO3kTs3Fs3FEq/DCZtMglSXqe
         HyyQ==
X-Forwarded-Encrypted: i=1; AJvYcCWaGdDE7+QhgYA2DTM6vExiwI5kEGNcHbZmjo4QllexV85gIe6LKUtvjz3/l+xucK5ySmPljnLRIH6XWm8=@vger.kernel.org
X-Gm-Message-State: AOJu0YycfER65Xxgx/0PnY90aKP5JARPhh7Hv64f8VWSm6tB4ERAhLG/
	3Nxt8BJ3NaE7GzypUpyWChHzPOvE5+PM/c6lJuxjg11S3WAyKrxGq6VKSBpfBo0oRvHLb1XLnku
	dhmVWLBIONlzUYrpyBzyf1ZBvui9vrRL1Xyhf
X-Gm-Gg: ASbGncu+Eh/n4IYQmOu3tCTz98Pgit7VjHvVXo1xJVdjR15oVub1TUy/GU+rQ8/37Xr
	rGefGiNgiOO+k2BplQyLfRAJRNBx8huy8sXYsXVCS7RiWchtfBc/8B6FLKMyYLwCOz073wVEGDj
	h5aX/YnVHuos57zoFqb2hUJDXiieFekRUpdr++TuKGNqulzMwXbfPNf5BYhMQtEcM=
X-Google-Smtp-Source: AGHT+IGlfnGNn8hDgkOu8o/NgFGH1pqyHUQqxoxq5+kiAqPyoRN9Wb6Hw8UoV84uLHR6ovC7vq8IKwPsB/ICeiIrMVY=
X-Received: by 2002:a17:907:868c:b0:abf:4ca9:55ff with SMTP id
 a640c23a62f3a-ad1e8c4bf54mr115077466b.32.1746572579146; Tue, 06 May 2025
 16:02:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250501183003.1125531-1-dhavale@google.com> <8de6a220-45a3-4885-890f-0538522e620c@linux.alibaba.com>
In-Reply-To: <8de6a220-45a3-4885-890f-0538522e620c@linux.alibaba.com>
From: Sandeep Dhavale <dhavale@google.com>
Date: Tue, 6 May 2025 16:02:47 -0700
X-Gm-Features: ATxdqUEDJEVgJ1EMBd53IsNa00CsNwfMNSebym8JlkwrHb3JPWhns_xk2akXl5s
Message-ID: <CAB=BE-S6S4m-uk9r=eQdM1foi+3HpZrEh0WYD5S9Q-aaP19G9g@mail.gmail.com>
Subject: Re: [PATCH v5] erofs: lazily initialize per-CPU workers and CPU
 hotplug hooks
To: Gao Xiang <hsiangkao@linux.alibaba.com>
Cc: linux-erofs@lists.ozlabs.org, Gao Xiang <xiang@kernel.org>, 
	Chao Yu <chao@kernel.org>, Yue Hu <zbestahu@gmail.com>, 
	Jeffle Xu <jefflexu@linux.alibaba.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Gao,
> >   #ifdef CONFIG_EROFS_FS_PCPU_KTHREAD
> >   static struct kthread_worker __rcu **z_erofs_pcpu_workers;
> > +static atomic_t erofs_percpu_workers_initialized = ATOMIC_INIT(0);
> > +static int erofs_cpu_hotplug_init(void);
> > +static void erofs_cpu_hotplug_destroy(void);
>
> We could move downwards to avoid those forward declarations;
>
Sure, I ended up moving the CONFIG_HOTPLUG_CPU block inside
CONFIG_EROFS_FS_PCPU_KTHREAD. That gets rid of forward declaration and
also much readable.
> >
> >   static void erofs_destroy_percpu_workers(void)
> >   {
> > @@ -336,9 +339,45 @@ static int erofs_init_percpu_workers(void)
> >       }
> >       return 0;
> >   }
> > +
> > +static int z_erofs_init_pcpu_workers(void)
>
> How about passing in `struct super_block *` here?
> Since print messages are introduced, it's much better to
> know which instance caused the error/info.
>
Sounds good. Log message now looks like this

[    8.724634] erofs (device loop0): initialized per-cpu workers successfully.
[    8.726133] erofs (device loop0): mounted with root inode @ nid 40.

Thanks for the review.
v6 addressing this is available at:
https://lore.kernel.org/linux-erofs/20250506225743.308517-1-dhavale@google.com/

Thanks,
Sandeep.

> > +{
> > +     int err;
> > +
> > +     if (atomic_xchg(&erofs_percpu_workers_initialized, 1))
> > +             return 0;
> > +
> > +     err = erofs_init_percpu_workers();
> > +     if (err) {
> > +             erofs_err(NULL, "per-cpu workers: failed to allocate.");
> > +             goto err_init_percpu_workers;
> > +     }
> > +
> > +     err = erofs_cpu_hotplug_init();
> > +     if (err < 0) {
> > +             erofs_err(NULL, "per-cpu workers: failed CPU hotplug init.");
> > +             goto err_cpuhp_init;
> > +     }
> > +     erofs_info(NULL, "initialized per-cpu workers successfully.");
>
>
> Otherwise it looks good to me know.
>
> Thanks,
> Gao Xiang
