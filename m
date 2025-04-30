Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A14B2DC779
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 03:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745984112; cv=none; b=pS0rKRthEnpvXhAD9tDXW+9hu3L1YDKEzPBhx8/BRcQfwfx3SxTJQgIU7TmMuaMNnb4xO95tma6iLg7fanrFtywEJAvpprCjze8Ne6ioK8EfkPZPTEatPC5mMG/g5tOZQxahg/C4/CnKCKvnrt/AHO3MUQ2evM2XTIjYcB6TVoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745984112; c=relaxed/simple;
	bh=8CP1/l95AAIu2RBu8lBb5i+OSNRKCka5XvJ9McWKyls=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QowAZf7S2//BNNRG6T/HA6OGPpH4rZ69YYKq0qYrHGS6DMr815HN9DmRg3nXBY09Lo2Yrb9I64Vxd9cA4Y8veKZIMs+qYVLnKIm4jqOhCDZ2lVsazH1YD2rP4wQc1xjeFkE/0o5C4M7dfrC7ZMuBA/XzumwnofdTCngalU25tGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QJGh35hq; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QJGh35hq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745984107;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8CP1/l95AAIu2RBu8lBb5i+OSNRKCka5XvJ9McWKyls=;
	b=QJGh35hqh3ayVa0aG1AbnLRUh+M1b+J537MrxsHEovsrWfQSEi6HR8XlApJM7DO+p/o8C1
	0Vewqu1KOyLGa7pcQXpz6MbdE4pI7dEqSuvi4EBPsfW8XOIoyBnF+stShfH1iVL0iwQHhe
	sZE2ZgntfOmqUJ6XUfAGK+7P3uBRNKw=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-212-sYXckXxJNim_x8FlgHxAHA-1; Tue, 29 Apr 2025 23:35:03 -0400
X-MC-Unique: sYXckXxJNim_x8FlgHxAHA-1
X-Mimecast-MFC-AGG-ID: sYXckXxJNim_x8FlgHxAHA_1745984101
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-30a2b6c8ff2so1097016a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 20:35:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745984101; x=1746588901;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8CP1/l95AAIu2RBu8lBb5i+OSNRKCka5XvJ9McWKyls=;
        b=A9u0CP92qgCNqiZ7P4YeqFhCgodbP9/5vF0b8w/Iv4VcI/rMWWAAa5/9uybMmwao0O
         G223AF7QxHkeED1Cufr5DP9nvM2c6A5+7YYewahSAdRrbbLqRBEtoFG+Hg7FrU6Yt52J
         17SwVoUHSLqzkhNzI2fH+qSNI3Hl3gNXIdX5FudZ1JEYFgLgbJnMV84Uh1P6IYbCL25a
         xGWI483XWp0mm4+bPO4Z7qFOS1N9yjVg03p++iYoTq6zNDvkwPzC5R3fHAn7jPO/9JuY
         HhV9y5Gc+WG6zeuQqssZ7EjIdcqeL1xZd5nwIDkZFQVr1oNQWQW/TcsBUpXQLHkiMLEx
         g7mg==
X-Forwarded-Encrypted: i=1; AJvYcCX64Cd2VIhdvLYltyVWnDUTrpkOevEpWbAOhNUegys5hu8fiFeW6Ycy18UWvzTKLp0bg7Lm4oaaRTbnX4E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/xrpUNNHVq9khLy1zq3EJEl0bnmWMZXQG+K9jWG6I95qRq6mS
	O01C4nqu/8X0OFg4/JslApnfJpe+fF//i6cEkMCkX5nx2aBuuHjG05ueEoH1q2e12F3Kl9wrvq7
	jrFP4ZiuF6fhMrIkwIZdwoSf8DNRu3cPCZQF1Q0+55iHzxhEgJ+LBemBvjVk3cBxV54UHPEVakX
	R9hSjj3zsbWoK2kkkLOXXid5b0woeit5dMAIUk
X-Gm-Gg: ASbGncs/1sBoOoDTp+/yboZKQrvUH1gy1An+/K9aFQOEbNqoOj7+bspNITs48YHNs4K
	3G8B+bWtVdMWOzx0Dbml75JV5JfbiZAfWqi+Y375UuVAISfH3B65twLMUUpsi2ktkQ4y6
X-Received: by 2002:a17:90a:d883:b0:2ee:b4bf:2d06 with SMTP id 98e67ed59e1d1-30a3331ef58mr1953080a91.19.1745984101058;
        Tue, 29 Apr 2025 20:35:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSS7dOdgP7A+HNpiMxiMx5KPQzzq0FQebByqw2CgDOWtoUxx+JmBHparnOyVfe7iSSZKWz7P4f0WwnDi967iI=
X-Received: by 2002:a17:90a:d883:b0:2ee:b4bf:2d06 with SMTP id
 98e67ed59e1d1-30a3331ef58mr1953058a91.19.1745984100613; Tue, 29 Apr 2025
 20:35:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250421024457.112163-1-lulu@redhat.com> <20250421024457.112163-5-lulu@redhat.com>
 <CACGkMEt-ewTqeHDMq847WDEGiW+x-TEPG6GTDDUbayVmuiVvzg@mail.gmail.com>
 <CACGkMEte6Lobr+tFM9ZmrDWYOpMtN6Xy=rzvTy=YxSPkHaVdPA@mail.gmail.com>
 <CACGkMEstbCKdHahYE6cXXu1kvFxiVGoBw3sr4aGs4=MiDE4azg@mail.gmail.com> <20250429065044-mutt-send-email-mst@kernel.org>
In-Reply-To: <20250429065044-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 30 Apr 2025 11:34:49 +0800
X-Gm-Features: ATxdqUHqfIZKZZ7USbEVYrV7yi8BrNiRLgIgSnFckLR6vC0VClLgTNwjOGLKeT4
Message-ID: <CACGkMEteBReoezvqp0za98z7W3k_gHOeSpALBxRMhjvj_oXcOw@mail.gmail.com>
Subject: Re: [PATCH v9 4/4] vhost: Add a KConfig knob to enable IOCTL VHOST_FORK_FROM_OWNER
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Cindy Lu <lulu@redhat.com>, michael.christie@oracle.com, sgarzare@redhat.com, 
	linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 29, 2025 at 6:56=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com>=
 wrote:
>
> On Tue, Apr 29, 2025 at 11:39:37AM +0800, Jason Wang wrote:
> > On Mon, Apr 21, 2025 at 11:46=E2=80=AFAM Jason Wang <jasowang@redhat.co=
m> wrote:
> > >
> > > On Mon, Apr 21, 2025 at 11:45=E2=80=AFAM Jason Wang <jasowang@redhat.=
com> wrote:
> > > >
> > > > On Mon, Apr 21, 2025 at 10:45=E2=80=AFAM Cindy Lu <lulu@redhat.com>=
 wrote:
> > > > >
> > > > > Introduce a new config knob `CONFIG_VHOST_ENABLE_FORK_OWNER_IOCTL=
`,
> > > > > to control the availability of the `VHOST_FORK_FROM_OWNER` ioctl.
> > > > > When CONFIG_VHOST_ENABLE_FORK_OWNER_IOCTL is set to n, the ioctl
> > > > > is disabled, and any attempt to use it will result in failure.
> > > >
> > > > I think we need to describe why the default value was chosen to be =
false.
> > > >
> > > > What's more, should we document the implications here?
> > > >
> > > > inherit_owner was set to false: this means "legacy" userspace may
> > >
> > > I meant "true" actually.
> >
> > MIchael, I'd expect inherit_owner to be false. Otherwise legacy
> > applications need to be modified in order to get the behaviour
> > recovered which is an impossible taks.
> >
> > Any idea on this?
> >
> > Thanks
>
> At this point, as we changed the behaviour, we have two types of legacy a=
pplications
> - ones expecting inherit_owner false
> - ones expecting inherit_owner true

Considering vhost has been used for more than a decade, I would expect
more will expect inhert_owner to be false.

>
> Whatever we do, some of these will have to be changed.

If we must choose one to break, I'd expect to break less.

> Given current
> kernel has it as true, and given it is a cleaner behaviour that will
> keep working when we disable CONFIG_VHOST_ENABLE_FORK_OWNER_IOCTL in 10
> years, I think it's the better default.

The problem is, if we set it to true and only an ioctl will bring the
old behavior back. Who will use this ioctl? We can't modify all legacy
applications.

> If you want to change it transparently, look for ways to
> distinguish between the two types.
>
> The application in question is qemu, is it not?

Looks not, it's the application or management layer that tries to set
the affinity to the owner of the vhost.

For example, if I start a testpmd + vhost_net and pinn testpmd runs on
cpu0. I will get half of the performance since vhost will contend with
cpu with testpmd.

> I do not see how sticking an ioctl call into its source is such
> a big deal, if this is what we want to do.
> A bit of short term pain but we get clear maintainable semantics.

What's more important, the way that introduces new fork behaviors
without a new uAPI is a bug. We need to fix that by introducing new
uAPI for the behaviour. This seems to be the short term pain instead
of introducing new uAPI for the old behaviour.

Thanks

>
> --
> MST
>

