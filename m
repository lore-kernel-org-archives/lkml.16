Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AD442CCC0
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 16:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744994794; cv=none; b=NosSKEqPHmbpH7ozaQZJICwI/QnhU7SsyHbw/fVoGTLpXZmkW+n6/VpZJum7SBGDAhkMSfj09Mm3ICuuQM2WMfR8c9XExait1Qo6w2uM944nZMgktl0SmOKEUrp0kNsd74FaNCNz2eNvvMEb20BThZfObcNu/i684xC3ifwIOMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744994794; c=relaxed/simple;
	bh=B2O/Gspz1Le8Dpdt/hJq1P6tX6Y+3COZWoh3DyLF374=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EX0V50UsWUadkqHB7u5Cu1h+fskAOSPTknDFiqZdTCi2s3gzGByzrp3HiA2yfSNtjwen5Xmvo1EFvY74b2EMM8oYaa3GQzFeFgrnZw+KYY1SrBpWO1Zxj5t3L6ZdLTxO1Aab89CCGOteVLvUKFavNMqZCBO0naCjDLw4R8A992Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TG/qPubz; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TG/qPubz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744994791;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sXISLttdp4Stt1jgFUlPHh5G81JdIsLDJqti/qjxK3U=;
	b=TG/qPubzhfkOSE6D9IplUwkk+2FdibVlKSO3Dd9qPlfK/LB924L3aoEHXfNVWGs9VjHjvR
	ied2WrgtQWLXyXQI86sZDMQTXNGKLMetC/x+zAg6OKjgkH9x1IkmXpdnnpZ9BggKJ4ZZ5V
	fsI6oxfDYl7EfLBHYPlKB9675y/b/Uc=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-631-sypO2Oq8MAyucxau6TQfgA-1; Fri, 18 Apr 2025 12:46:29 -0400
X-MC-Unique: sypO2Oq8MAyucxau6TQfgA-1
X-Mimecast-MFC-AGG-ID: sypO2Oq8MAyucxau6TQfgA_1744994788
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-30bf9ed6da1so11823351fa.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 09:46:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744994788; x=1745599588;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sXISLttdp4Stt1jgFUlPHh5G81JdIsLDJqti/qjxK3U=;
        b=T6sTQM33EisAoVi5QCTVn0vyhqmYg5UqOasfV41pdFk5JXEiSeoEELT7apbcCo4FKU
         YF6lrLxqUj4sxecOEEFGjQbnlXrowhKCxzpDSmkWcHYfIazWaxE2D8yX/upfmzMvw1yE
         Eld/E3b6jwEh+92IBleemFChsBwDwg7jPQiC3aTdDmIht+S+JXx4czkYLCnj3qHAJmI0
         WkrECI5b3m9WboGXiFbuoieFfyJz4zgOR6ktdoACBVpv2MpsbJxgAI3LgiqOdikbowvb
         DhOw4sCAv+xne7Al854E/VKvdm0hJeXP7NscvvdU7VPfrbZfQ8hNjhXakR+B9VHs/4bp
         nrbg==
X-Forwarded-Encrypted: i=1; AJvYcCXS2LgZQbW/QJA4TkStNToZn9h1gGJG36yJXhMLLMAZ4tMhZXQLQou68MbKMeuSwD7ANNN8WMn6nWXYjUk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1KDGXQ5p5fpQAPJyer9IO1ZeW5/Q5wZAqDfr+KDp02mg5F0+N
	UO+098wg+nBGzfkRIIgfaiIXUrnzlPhu3zmUZ7ag40vrc1zZk8Unwkpqyp781xwzzGJBrsJxtJW
	6jOICKEK/DUkd0YzNyz1WKJQAKYSQzhNsizWfgiiU5hlIJH4VGCuVxsmnmDBfg2kVCJo9C2npNs
	m9iawDq3NKB5ZdPfg1dnmlzQD1AzA8MOsiHCKu
X-Gm-Gg: ASbGncvoFuyVUKGurL007CZyx0XXqoyKxIF7pWQYfg/uvwAitoF5X1KghoGEb5Gcw6S
	VUI07COOE9aHYRSgG3SMFXopP4v4iU2r0AZkkkBxhXk8T2luu6NYkakNOnq6p+VRujcmOs/UjHs
	JYVlPJug0gLmjRDNBbOLIzewxQsw==
X-Received: by 2002:a05:651c:884:b0:30c:518e:452 with SMTP id 38308e7fff4ca-310904dafe3mr11403551fa.13.1744994788111;
        Fri, 18 Apr 2025 09:46:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFC8XRPOnxIuvHQdgVNgUalUWGkmYje20l8oa3eP/0kCqW28Zy4fKraow99TA0b7uAR33mRN5OeXt86kGaQflc=
X-Received: by 2002:a05:651c:884:b0:30c:518e:452 with SMTP id
 38308e7fff4ca-310904dafe3mr11403491fa.13.1744994787751; Fri, 18 Apr 2025
 09:46:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250418000834.672343-1-herton@redhat.com> <aAGZe_mDBZ7DcG2o@bombadil.infradead.org>
In-Reply-To: <aAGZe_mDBZ7DcG2o@bombadil.infradead.org>
From: Herton Krzesinski <hkrzesin@redhat.com>
Date: Fri, 18 Apr 2025 13:46:15 -0300
X-Gm-Features: ATxdqUEZOONVcWteu9JX-s24qC2ILTT1BAu4NXZrhJH4HWLz_YH7IazkwItI_Do
Message-ID: <CAJmZWFFhqGv+gu2BmZZRKxELDoOLyjXdn-UQuU6CAZ_JZP7UHg@mail.gmail.com>
Subject: Re: [PATCH] lib/test_kmod: do not hardcode/depend on any filesystem
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org, 
	akpm@linux-foundation.org, petr.pavlu@suse.com, samitolvanen@google.com, 
	da.gomez@samsung.com, Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 17, 2025 at 9:14=E2=80=AFPM Luis Chamberlain <mcgrof@kernel.org=
> wrote:
>
> On Thu, Apr 17, 2025 at 09:08:34PM -0300, Herton R. Krzesinski wrote:
> > Right now test_kmod has hardcoded dependencies on btrfs/xfs. That
> > is not optimal since you end up needing to select/build them, but it
> > is not really required since other fs could be selected for the testing=
.
> > Also, we can't change the default/driver module used for testing on
> > initialization.
> >
> > Thus make it more generic: introduce two module parameters (start_drive=
r
> > and start_test_fs), which allow to select which modules/fs to use for
> > the testing on test_kmod initialization. Then it's up to the user to
> > select which modules/fs to use for testing based on his config. However=
,
> > keep test_module as required default.
> >
> > This way, config/modules becomes selectable as when the testing is done
> > from selftests (userspace).
> >
> > While at it, also change trigger_config_run_type, since at module
> > initialization we already set the defaults at __kmod_config_init and
> > should not need to do it again in test_kmod_init(), thus we can
> > avoid to again set test_driver/test_fs.
> >
> > Signed-off-by: Herton R. Krzesinski <herton@redhat.com>
> > ---
> >  lib/Kconfig.debug |  6 -----
> >  lib/test_kmod.c   | 64 +++++++++++++++++++++++++----------------------
> >  2 files changed, 34 insertions(+), 36 deletions(-)
> >
> > diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> > index 9fe4d8dfe578..1e0f8cbf0365 100644
> > --- a/lib/Kconfig.debug
> > +++ b/lib/Kconfig.debug
> > @@ -2983,13 +2983,7 @@ config TEST_DYNAMIC_DEBUG
> >  config TEST_KMOD
> >       tristate "kmod stress tester"
> >       depends on m
> > -     depends on NETDEVICES && NET_CORE && INET # for TUN
> > -     depends on BLOCK
> > -     depends on PAGE_SIZE_LESS_THAN_256KB # for BTRFS
>
> Please read the commit log that added PAGE_SIZE_LESS_THAN_256KB, what
> do we want to do about those complaining about that? Maybe Cc the
> author of that patch.

afaik that problem only happens because of selecting BTRFS. Since I'm remov=
ing
selection of BTRFS now it shouldn't be a problem.

>
> Other than that, it looks good to me. Did you run the selftest?

Yes, I did both load the module with force_init_test and without, and
run the kmod.sh selftest and arbitrarily chose vfat module for fs test
(in my config
xfs is loaded/used and ext4 is builtin).

But now I noticed that I forgot to update
tools/testing/selftests/kmod/config, I'll
send a v2 shortly.

>
> Reviewed-by: Luis Chamberlain <mcgrof@kernel.org>
>
>   Luis
>

