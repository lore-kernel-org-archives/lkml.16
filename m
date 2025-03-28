Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95A9D17A2F2
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 05:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743140895; cv=none; b=azkEqQrzyqi7pSr+b6fTpaUhnT1fxVruwHyLRUmpST5RLmkEvtrg8ifJ9PLV+CvsEBC7V0QEwHe6CUia6nbLPFnypGXEAu7spdojfj65j2KC2bzU6adkD6iZJWhGkDKDKDehUmqpPt0gn25PDQ1Vq+L3AS5JiZHuLW71ZiGS+fA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743140895; c=relaxed/simple;
	bh=xzcyd/4tACV1vdkZnBnWWvBGExY6+i1HYokMa9uBOqU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PLMPAix7QxLriGv/cwEhb/7NfS76yfIMMPaSdIRqkNcmtq8cAZ8teh2bRQmWty2at1c6rvrupJF6ctLRS2s5w/UAxN31ndAH3vTBrauHnx9lobMGbJ03cONYrC1Wc5ewGcRIGU9nmaiie96DVKGLp1sY7tLQ9WTkLYvWvwFI3I8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=g8A+tpfm; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="g8A+tpfm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743140892;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qTKh94tdwNg9q3c5LOM370VR1+uTKQc5L4EVszLLHWU=;
	b=g8A+tpfmwxObFA6K8gTCR1ZadwABpMxNEESpc/RK/kRwWJOGhm+TEBAU/U9u+bFxiFUyZf
	Xw0yHS9RQcdKUziO5sJ3wnqPz5+alFeSK+4Bl86Ho11YwL4CELt9q5yJVhIFCMZPZyPFGf
	PWHhMp1ZRytlR2YT+Hl0e8GIbM/w9sk=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-19-xG7oqhclP6-Vo5tFQ7ADpg-1; Fri, 28 Mar 2025 01:48:10 -0400
X-MC-Unique: xG7oqhclP6-Vo5tFQ7ADpg-1
X-Mimecast-MFC-AGG-ID: xG7oqhclP6-Vo5tFQ7ADpg_1743140889
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-ac3dca41591so156156466b.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 22:48:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743140889; x=1743745689;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qTKh94tdwNg9q3c5LOM370VR1+uTKQc5L4EVszLLHWU=;
        b=WftLmuVNAlBu1yvT3RmzwjaD7CaEzSCN6Jk+yjggNWPtdxNavHwK/ZmCQwTmLyDKJG
         X3FJUFVjgjLrDPmEY+XWB6bOjfwd7/Bd/Fuf55kuRwwl2lnSr0uQvK5HRx7A8H+IZMS7
         HF6dtIkcfUNsCg0YkKDXqaWX7MeH6zavSVWiDhTht6CmkWXCa8WOiiBiXXQoMAggVe4e
         zmVefmno5cYrxHZy/s1jCl51wNuGZaMPopCUCugwSopB5m/xvddzWulaK24BIcvLMA6v
         WTjlfUA2fEc+NNRIsq1NRNQhpIX+6DEw45iFbuIK3mt5EtPup64flOc33v+Q8VJQ4dGL
         nXGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBOrzB2Vp90rHYVuIozwxU1PSuzK8hE23MkU9a55RmNQPAqrxZiv/8PQKxV1J2zqFFANaJSyoCrCGzyJI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQxcC7Pa1tux2OHc5r1BqdnyvNRMd/aL8Amh4UTHWg6+mYHLBl
	GeN5sjkWIQKF4JZv2T99AzFUxwuigb4xEGKkNby50lKG7V9vds68jef7HAILo2JkIDnLjuEuJYs
	KCXxkudIbPcNz76QpTNwj43FOD8Pl/FuCPjesiTWJb3t2iXZDnC6mwGDbTp1vezA5LRhkzdgyfg
	q7MN6rWCc0ksASi5LbeO7TSKGk/9/Nd69NPhF3z9eFQ51E
X-Gm-Gg: ASbGncvhDWvMbMf6l/k4ITDJAuck8TTLcQo8BMD8RjJ6K4zWw5FOHjnD0GSGe2Pit+a
	Z6FURm4j9eejfzlNpJAnSMR9LcYqZ5XzUzjkoAcZKvSNVHV4FiNHl7dzH/cEWxkfY6y8Jej0tDA
	==
X-Received: by 2002:a17:907:608d:b0:ac1:fb27:d3a2 with SMTP id a640c23a62f3a-ac6fae43107mr572829866b.5.1743140888719;
        Thu, 27 Mar 2025 22:48:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGAxFnUp1kopqJ87Yu6gx3aXwUHDTW6oUEiLodlLZhwNh8981qQjsS2iXuR+w9T4KcHv8JjuXB4mL4fMR7n4KQ=
X-Received: by 2002:a17:907:608d:b0:ac1:fb27:d3a2 with SMTP id
 a640c23a62f3a-ac6fae43107mr572828066b.5.1743140888321; Thu, 27 Mar 2025
 22:48:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250302143259.1221569-1-lulu@redhat.com> <20250302143259.1221569-9-lulu@redhat.com>
 <CACGkMEv7WdOds0D+QtfMSW86TNMAbjcdKvO1x623sLANkE5jig@mail.gmail.com> <svi5ui3ea55mor5cav7jirrttd6lkv4xkjnjj57tnjdyiwmr5c@p2hhfwuokyv5>
In-Reply-To: <svi5ui3ea55mor5cav7jirrttd6lkv4xkjnjj57tnjdyiwmr5c@p2hhfwuokyv5>
From: Cindy Lu <lulu@redhat.com>
Date: Fri, 28 Mar 2025 13:47:30 +0800
X-Gm-Features: AQ5f1Jq14v0a610in7Y1BoeO9ekSPxC1BG3Mk0b8VDIHn8AMhS-ZlF3OlrBypI8
Message-ID: <CACLfguVActMtC-_2fSS7GMWSgmSjaHFcXr-7H72Co301ZbXC6w@mail.gmail.com>
Subject: Re: [PATCH v7 8/8] vhost: Add a KConfig knob to enable IOCTL VHOST_FORK_FROM_OWNER
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>, mst@redhat.com, michael.christie@oracle.com, 
	linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 3, 2025 at 5:12=E2=80=AFPM Stefano Garzarella <sgarzare@redhat.=
com> wrote:
>
> On Mon, Mar 03, 2025 at 01:52:06PM +0800, Jason Wang wrote:
> >On Sun, Mar 2, 2025 at 10:34=E2=80=AFPM Cindy Lu <lulu@redhat.com> wrote=
:
> >>
> >> Introduce a new config knob `CONFIG_VHOST_ENABLE_FORK_OWNER_IOCTL`,
> >> to control the availability of the `VHOST_FORK_FROM_OWNER` ioctl.
> >> When CONFIG_VHOST_ENABLE_FORK_OWNER_IOCTL is set to n, the ioctl
> >> is disabled, and any attempt to use it will result in failure.
> >>
> >> Signed-off-by: Cindy Lu <lulu@redhat.com>
> >> ---
> >>  drivers/vhost/Kconfig | 15 +++++++++++++++
> >>  drivers/vhost/vhost.c | 11 +++++++++++
> >>  2 files changed, 26 insertions(+)
> >>
> >> diff --git a/drivers/vhost/Kconfig b/drivers/vhost/Kconfig
> >> index b455d9ab6f3d..e5b9dcbf31b6 100644
> >> --- a/drivers/vhost/Kconfig
> >> +++ b/drivers/vhost/Kconfig
> >> @@ -95,3 +95,18 @@ config VHOST_CROSS_ENDIAN_LEGACY
> >>           If unsure, say "N".
> >>
> >>  endif
> >> +
> >> +config VHOST_ENABLE_FORK_OWNER_IOCTL
> >> +       bool "Enable IOCTL VHOST_FORK_FROM_OWNER"
> >> +       default n
> >> +       help
> >> +         This option enables the IOCTL VHOST_FORK_FROM_OWNER, which a=
llows
> >> +         userspace applications to modify the thread mode for vhost d=
evices.
> >> +
> >> +          By default, `CONFIG_VHOST_ENABLE_FORK_OWNER_IOCTL` is set t=
o `n`,
> >> +          meaning the ioctl is disabled and any operation using this =
ioctl
> >> +          will fail.
> >> +          When the configuration is enabled (y), the ioctl becomes
> >> +          available, allowing users to set the mode if needed.
> >> +
> >> +         If unsure, say "N".
> >> diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
> >> index fb0c7fb43f78..09e5e44dc516 100644
> >> --- a/drivers/vhost/vhost.c
> >> +++ b/drivers/vhost/vhost.c
> >> @@ -2294,6 +2294,8 @@ long vhost_dev_ioctl(struct vhost_dev *d, unsign=
ed int ioctl, void __user *argp)
> >>                 r =3D vhost_dev_set_owner(d);
> >>                 goto done;
> >>         }
> >> +
> >> +#ifdef CONFIG_VHOST_ENABLE_FORK_OWNER_IOCTL
> >>         if (ioctl =3D=3D VHOST_FORK_FROM_OWNER) {
> >>                 u8 inherit_owner;
> >>                 /*inherit_owner can only be modified before owner is s=
et*/
> >> @@ -2313,6 +2315,15 @@ long vhost_dev_ioctl(struct vhost_dev *d, unsig=
ned int ioctl, void __user *argp)
> >>                 r =3D 0;
> >>                 goto done;
> >>         }
> >> +
>
> nit: this empyt line is not needed
>
sure , will fix this
Thanks
Cindy
> >> +#else
> >> +       if (ioctl =3D=3D VHOST_FORK_FROM_OWNER) {
> >> +               /* When CONFIG_VHOST_ENABLE_FORK_OWNER_IOCTL is 'n', r=
eturn error */
> >> +               r =3D -ENOTTY;
> >> +               goto done;
> >> +       }
> >> +#endif
> >> +
> >>         /* You must be the owner to do anything else */
> >>         r =3D vhost_dev_check_owner(d);
> >>         if (r)
> >> --
> >> 2.45.0
> >
> >Do we need to change the default value of the inhert_owner? For example:
> >
> >#ifdef CONFIG_VHOST_ENABLE_FORK_OWNER_IOCTL
> >inherit_owner =3D false;
> >#else
> >inherit_onwer =3D true;
> >#endif
> >
> >?
>
> I'm not sure about this honestly, the user space has no way to figure
> out the default value and still has to do the IOCTL.
> So IMHO better to have a default value that is independent of the kernel
> configuration and consistent with the current behavior.
>
> Thanks,
> Stefano
>
> >
> >Other patches look good to me.
> >
> >Thanks
> >
> >>
> >
>

