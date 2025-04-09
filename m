Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A25A18B46E
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 08:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744187908; cv=none; b=P/IaAbGIJZUZ1OvVmYQE2QSPDW6OlCum96iLph1GbFhb67DtzANbTfSbKIui/5qeMfGON8dI/PrMHmngzFbDG1Lnd+dEBN8NnZiMdP9qQMHARMqW3lyxtmkWE/7NMb1AVVfA/QUtKtWdBUQ1UHUbhllWf9957VPszoRP2ufmO24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744187908; c=relaxed/simple;
	bh=61PW9y7PDNWOcIblSehzngap5jGtPaiZoqUtTkIf7Q4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hHN3khf9oZhP36XbFy1qo5MO37TwnSYgQiYUsbhmMGGjfCGAmyX1lDTzixGZRJARmIPTc4Vj6NsEUryScarGNQvq1ztcLcrgKwFHWdIoia6E9ygGErkseJ96Xyq2dEWc+s+qc12jiGqSgJAzPvpTirxppbh/yRlRyOE37Zhflio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OFEdu7e3; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OFEdu7e3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744187906;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Db2JSRrytLkXPNCk2u9oY2iCWyl++39LNyoKOlHjxS4=;
	b=OFEdu7e3KseD8lEDMuqJt8V9r5XBHvchE/CUQnNjblhD9gXMklWjDn4UXQE9NSovjIi5Mf
	x1bsjclVNweM3HUFVWGsjRMMbZvMhEUljEpozZCu+UPfAw1bjxM9NBsvQ/pImgRFmZo2V4
	IDg164qgCwmpSbF57cgrQ/aYN+I0TeE=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-688-DqozgsoOPzWegsmNVpu0oQ-1; Wed, 09 Apr 2025 04:38:24 -0400
X-MC-Unique: DqozgsoOPzWegsmNVpu0oQ-1
X-Mimecast-MFC-AGG-ID: DqozgsoOPzWegsmNVpu0oQ_1744187904
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-ac3d3cd9accso576880766b.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 01:38:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744187903; x=1744792703;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Db2JSRrytLkXPNCk2u9oY2iCWyl++39LNyoKOlHjxS4=;
        b=tKfTweRBvTt7XNqyj9RzXoFqIl73vBm+PeFV9AspgLl0ZAKDig+5DzsdfxTHuSjtpY
         SAM+ocOcMpQJK3bKN8b3ndfq6BJQkS2YSz3wacFBESvN6Lf+BJSZHU4S9739vaVsM6re
         it/69GbAPu7f1Hu6nU6oJEqbNoINypEaX7DURKD8U2lI0XrSs6AqyoTpUH3fwU1EPe7M
         HU/A+liZ7DtuWn0GY8oRJ+C+xS2khWb8vaHhRQ39Xy/JhndGZawqeh6hzJwCfIMNx27C
         pMDPfIuXnaXYayvB2iU2aL1KI7lm3lgo0O9m+t47unovLheJG6BMPAcrbf0mqso8WGOv
         xQHg==
X-Forwarded-Encrypted: i=1; AJvYcCU9Z5/9AYR1j1HtLy4TRKZ3P7SARzvpWIKGvJJIldU3TcjzDpoqOgKktvtO1PzyN7fWpT05x11vb9//0Fk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxw7gIGJ3givwl/hJBukD//1Q6BJrj/Bg+lT1e2TP1PYP3/zYTR
	MqRpyaW6j2qGJ27SotLVUZoeBTzsrgvoiOD7f6GMN9RvWO04ABJlFGgBGQdKNfAOfUaJHdv7D/Y
	lz5XJzv/Mdtjf9OJBdxE9V6K7fqw5zQ6gyqlYoYvRf+Ct/v08Pa1xqyV5oQIhDtPksRiDjRfVSE
	nX68rUqbhsAP1AR+XOwUXeArbxteAHp6x2KhgQR5BTHv2H
X-Gm-Gg: ASbGncsVp60sgm9QvzMtVzlrovfKF71jHGIN2dlJs7UrlIcKy06PwA7FEUCwajJW3eu
	VrmUyH4MwyNuG6042CLhBj6O89m4D5gwyNnWRQ7SVgBrW4Yym0Lb0t1Cyv3va1/L9R8DMaA==
X-Received: by 2002:a17:907:d22:b0:ac7:e5c7:d235 with SMTP id a640c23a62f3a-aca9d5f2efbmr173777066b.17.1744187902791;
        Wed, 09 Apr 2025 01:38:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFfsT/n2l3DnTQQWDgOLT9XB9DPUTgcUViU2G8XrGBhEdFOH5XIrY6JzqMwM3FJqCj1qI/dn6iOuo9AsFhQy0g=
X-Received: by 2002:a17:907:d22:b0:ac7:e5c7:d235 with SMTP id
 a640c23a62f3a-aca9d5f2efbmr173774366b.17.1744187902343; Wed, 09 Apr 2025
 01:38:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250328100359.1306072-1-lulu@redhat.com> <20250328100359.1306072-9-lulu@redhat.com>
 <20250408075426-mutt-send-email-mst@kernel.org>
In-Reply-To: <20250408075426-mutt-send-email-mst@kernel.org>
From: Cindy Lu <lulu@redhat.com>
Date: Wed, 9 Apr 2025 16:37:44 +0800
X-Gm-Features: ATxdqUHSwziP5tEY_Ach5syGN9Prz3P9ZHSrioqnJKFuE86H3ZVl_NFlZH6Hdgk
Message-ID: <CACLfguXTYy2BfmB3wLnVdANu6jvxjP4G8a3h2XHO-iw5RE1CnA@mail.gmail.com>
Subject: Re: [PATCH v8 8/8] vhost: Add a KConfig knob to enable IOCTL VHOST_FORK_FROM_OWNER
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: jasowang@redhat.com, michael.christie@oracle.com, sgarzare@redhat.com, 
	linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 8, 2025 at 7:56=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com> =
wrote:
>
> On Fri, Mar 28, 2025 at 06:02:52PM +0800, Cindy Lu wrote:
> > Introduce a new config knob `CONFIG_VHOST_ENABLE_FORK_OWNER_IOCTL`,
> > to control the availability of the `VHOST_FORK_FROM_OWNER` ioctl.
> > When CONFIG_VHOST_ENABLE_FORK_OWNER_IOCTL is set to n, the ioctl
> > is disabled, and any attempt to use it will result in failure.
> >
> > Signed-off-by: Cindy Lu <lulu@redhat.com>
> > ---
> >  drivers/vhost/Kconfig | 15 +++++++++++++++
> >  drivers/vhost/vhost.c |  3 +++
> >  2 files changed, 18 insertions(+)
> >
> > diff --git a/drivers/vhost/Kconfig b/drivers/vhost/Kconfig
> > index b455d9ab6f3d..e5b9dcbf31b6 100644
> > --- a/drivers/vhost/Kconfig
> > +++ b/drivers/vhost/Kconfig
> > @@ -95,3 +95,18 @@ config VHOST_CROSS_ENDIAN_LEGACY
> >         If unsure, say "N".
> >
> >  endif
> > +
> > +config VHOST_ENABLE_FORK_OWNER_IOCTL
> > +     bool "Enable IOCTL VHOST_FORK_FROM_OWNER"
> > +     default n
> > +     help
> > +       This option enables the IOCTL VHOST_FORK_FROM_OWNER, which allo=
ws
> > +       userspace applications to modify the thread mode for vhost devi=
ces.
>
> ok
>
> > +          By default, `CONFIG_VHOST_ENABLE_FORK_OWNER_IOCTL` is set to=
 `n`,
> > +          meaning the ioctl is disabled and any operation using this i=
octl
> > +          will fail.
> > +          When the configuration is enabled (y), the ioctl becomes
> > +          available, allowing users to set the mode if needed.
>
> no need to be so verbose - the disabled beavious belongs in commit log
> not here.
>
> Also either ioctl or IOCTL but not both.
>
sure, will change this
Thanks
cindy
> > +
> > +       If unsure, say "N".
> > diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
> > index fb0c7fb43f78..568e43cb54a9 100644
> > --- a/drivers/vhost/vhost.c
> > +++ b/drivers/vhost/vhost.c
> > @@ -2294,6 +2294,8 @@ long vhost_dev_ioctl(struct vhost_dev *d, unsigne=
d int ioctl, void __user *argp)
> >               r =3D vhost_dev_set_owner(d);
> >               goto done;
> >       }
> > +
> > +#ifdef CONFIG_VHOST_ENABLE_FORK_OWNER_IOCTL
> >       if (ioctl =3D=3D VHOST_FORK_FROM_OWNER) {
> >               u8 inherit_owner;
> >               /*inherit_owner can only be modified before owner is set*=
/
> > @@ -2313,6 +2315,7 @@ long vhost_dev_ioctl(struct vhost_dev *d, unsigne=
d int ioctl, void __user *argp)
> >               r =3D 0;
> >               goto done;
> >       }
> > +#endif
> >       /* You must be the owner to do anything else */
> >       r =3D vhost_dev_check_owner(d);
> >       if (r)
> > --
> > 2.45.0
>

