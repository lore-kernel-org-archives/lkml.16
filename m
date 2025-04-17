Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF1742A97;
	Thu, 17 Apr 2025 02:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744858294; cv=none; b=cNtOQDYBVn9V6YGUVJZzn1+8aT7XhTeNgjGZTbuVKzw4lVG+yQAg/hEImAMMnxMMLv/WGjC6AGeiPaumiW+Nd+F/sIsuU+Hzes8ySzz95Gov2uKkqckJG0nAUco2raM5SARw+eAwNAJzlvUce/yvHwgvfetIjI4b1PN8ze74ff4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744858294; c=relaxed/simple;
	bh=Jeaywli96hv/EbWucT4fOWHO6iJyomoHYw2JzjAf4/Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J8puTH178IgQ/g0Jd6r9azR54X7taTP3IgVL03L3K7LwVqb3PIfYSsrJbHOIODgrtHzvoT+2xDVq7+YYAMKZWJEPZ5gMFo+c1RFVa+CxIF+S8BZLcYXGdfBeHvcVr59InimchlUVYZw64AgBG6x4UobpSXo2yQEIHhQc4kniOIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WKm+0GLr; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WKm+0GLr"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3105ef2a071so3374571fa.1;
        Wed, 16 Apr 2025 19:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744858290; x=1745463090; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IxlW381mFl1gcMmWQlg2/YJ47n7wnlOLEuu/f/VFJUk=;
        b=WKm+0GLr/1w4CpJhlprMNNq5heecbeXXWfYnbdgkM+qRoao+EZjMimnOswvYuatmO7
         6hsQUyYHlZhnfGRF9FSQ0g9gF5MxLjzm3mSQ0av22SKZWMPso/bUnanJK9ccHnvLJK2g
         VB4yR/j/qZPK6RlA2vB5E2Prg7rVwrYjlw36ihaessdnxZMAdGlbEUz0MHGdGieJ/T+P
         Y0+oVT7IvVLzcPg63BjBzu9zNPyekBbZx1CC2YBN76XIPHgFDj4hdLpAQW4x7+kOh4lj
         Ze5sQrPGCFtZtLlFL25Xq9rrg+/2uaFzxUakiHlMxgKNv1rGG51a9iyWy2MTghs7pMMa
         Z+fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744858290; x=1745463090;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IxlW381mFl1gcMmWQlg2/YJ47n7wnlOLEuu/f/VFJUk=;
        b=HC2tDsbKSgBN5oQihImWnjBo3k1wiQuyE3GbU5T3i+q0ggUEcLa02X1a9Uqw+Fnxvw
         cBvLrQET396bOjP90TbTr82r9+2PSEnc3RCOgaaZi6wmrCo4RuBiTVr94cfVeAbM7H+K
         WSGWqpAInVtXZjTZNZFaB1PGryj3rq/eTQCEoHULqE8SCliyf0KUG+Fh01zDmcsUEouB
         gEl+5MkEHf41Si9Ym+6aW5wBj4ann5LXeUNXYMu3l6yyJ/6tLxyO4SOYrIe4MAPjSm9m
         LP4H5fhzTepbycNEZBHFiI51LXmPGVC4YjlOWZ4bB8msNa1zNnOD2SytQjTdP80q2maz
         3uMA==
X-Forwarded-Encrypted: i=1; AJvYcCWkFZnHWTcBghOLXhJ9nY3lmpj13d3ICI7rQPJsQuW3USQ6DXFRMj5mt0+3tqA0g6PnM+4TobUAI7stnnA=@vger.kernel.org, AJvYcCXe6g1BMgAONZenr/EiC47705x5nCjYCZQWC1wbP0Dx/dsuGEdQdYTpLXyau0xaIezttKo0R6MZZWiB8uhLYBEDXXrlYA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyTMhPIOKcUjviFWwDO69cXDQANbI89k584sTZWIpHfLQtBy/2f
	bP3NA3NRuc8PCpSrPx73TLIhA7pWAbaDKjWx90fnS8gYtM9zOCKGPyAgzWM6qCBpdj/0RQ2kwhw
	4y4L0fKf+PECMlLc9dkK1UlitIxXLN4K3d+K3nEO5Pa4=
X-Gm-Gg: ASbGncsBOpMT2sTq/5xyRJLrYAjYNN4agkzf8ms+bD+TYt9zOKPT1+qi9lN4vpsahAv
	tMc8p5bRk3V3cphbIRacx9cdT3jcizVyq5CByURrAX1p28FQSq4VyaAq1Id/osuwlUbexDyJgUW
	U4rLrlyYvHSKJBHLcoeaqN0Q==
X-Google-Smtp-Source: AGHT+IFlzCZEIobw7iTvuOvepzEy1mIFBOVGDJk83j4517Ybo39jCA2Zb3rliOfCx5vXazI1n9tzq62SE8IQgb5tDK4=
X-Received: by 2002:a2e:a58e:0:b0:30b:8f84:49c5 with SMTP id
 38308e7fff4ca-3107f719c34mr14775481fa.28.1744858289936; Wed, 16 Apr 2025
 19:51:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250416033842.67394-1-shouyeliu@gmail.com> <da00e02b7ae32331794314b4d877987a6f2b1cf2.camel@linux.intel.com>
In-Reply-To: <da00e02b7ae32331794314b4d877987a6f2b1cf2.camel@linux.intel.com>
From: liu shouye <shouyeliu@gmail.com>
Date: Thu, 17 Apr 2025 10:51:18 +0800
X-Gm-Features: ATxdqUFBqpeOZENFsEPA_DUcUMGmzUIyn5IPMTxK2NmPF_7qfceFnSaIDy7guvg
Message-ID: <CAAscG3UOKirX9OjKy3SR8ZfNDG2axjk9RzEKCrRrSmjUZJRT2Q@mail.gmail.com>
Subject: Re: [PATCH v2] platform/x86/intel-uncore-freq: Fix missing uncore
 sysfs during CPU hotplug
To: srinivas pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Shouye Liu <shouyeliu@tencent.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

srinivas pandruvada <srinivas.pandruvada@linux.intel.com> =E4=BA=8E2025=E5=
=B9=B44=E6=9C=8817=E6=97=A5=E5=91=A8=E5=9B=9B 04:40=E5=86=99=E9=81=93=EF=BC=
=9A
>
> On Wed, 2025-04-16 at 11:38 +0800, shouyeliu wrote:
> > From: Shouye Liu <shouyeliu@tencent.com>
> >
> > In certain situations, the sysfs for uncore may not be present when
> > all
> > CPUs in a package are offlined and then brought back online after
> > boot.
> >
> > This issue can occur if there is an error in adding the sysfs entry
> > due
> > to a memory allocation failure. Retrying to bring the CPUs online
> > will
> > not resolve the issue, as the uncore_cpu_mask is already set for the
> > package before the failure condition occurs.
> >
> > This issue does not occur if the failure happens during module
> > initialization, as the module will fail to load in the event of any
> > error.
> >
> > To address this, ensure that the uncore_cpu_mask is not set until the
> > successful return of uncore_freq_add_entry().
> >
> Fixes: dbce412a7733 ("platform/x86/intel-uncore-freq: Split common and
> enumeration part")
>
> > Signed-off-by: Shouye Liu <shouyeliu@tencent.com>
> Cc: stable@vger.kernel.org
>
> Thanks,
> Srinivas

Got it, I will update it in v3 version
Thanks,
Shouye

>
> > ---
> >  .../x86/intel/uncore-frequency/uncore-frequency.c   | 13 +++++++++--
> > --
> >  1 file changed, 9 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/platform/x86/intel/uncore-frequency/uncore-
> > frequency.c b/drivers/platform/x86/intel/uncore-frequency/uncore-
> > frequency.c
> > index 40bbf8e45fa4..bdee5d00f30b 100644
> > --- a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency.c
> > +++ b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency.c
> > @@ -146,15 +146,13 @@ static int uncore_event_cpu_online(unsigned int
> > cpu)
> >  {
> >       struct uncore_data *data;
> >       int target;
> > +     int ret;
> >
> >       /* Check if there is an online cpu in the package for uncore
> > MSR */
> >       target =3D cpumask_any_and(&uncore_cpu_mask,
> > topology_die_cpumask(cpu));
> >       if (target < nr_cpu_ids)
> >               return 0;
> >
> > -     /* Use this CPU on this die as a control CPU */
> > -     cpumask_set_cpu(cpu, &uncore_cpu_mask);
> > -
> >       data =3D uncore_get_instance(cpu);
> >       if (!data)
> >               return 0;
> > @@ -163,7 +161,14 @@ static int uncore_event_cpu_online(unsigned int
> > cpu)
> >       data->die_id =3D topology_die_id(cpu);
> >       data->domain_id =3D UNCORE_DOMAIN_ID_INVALID;
> >
> > -     return uncore_freq_add_entry(data, cpu);
> > +     ret =3D uncore_freq_add_entry(data, cpu);
> > +     if (ret)
> > +             return ret;
> > +
> > +     /* Use this CPU on this die as a control CPU */
> > +     cpumask_set_cpu(cpu, &uncore_cpu_mask);
> > +
> > +     return 0;
> >  }
> >
> >  static int uncore_event_cpu_offline(unsigned int cpu)
>
