Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 113E01A0BCA
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 05:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743140679; cv=none; b=cwWWWL9CpwMKJTW1BHKHWkNsPiSyTL7kkXPaRELlt1m/KsyA/2xCpGqa8dF16WJdwHdrpPz6p9QV8niwQN0x0/gHiuC6IXDotVUG/kx79YsLKlVelHfSh09q1yXarfSeB6FG6+aJqZ/XbUzaGxlmGi9/y1ZOEDf7jDz2Nc+dFnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743140679; c=relaxed/simple;
	bh=XQtprkEDEsNATdaVZNN4W5lGHi2fIAWaW+Dfp7jzqhk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HBmHOcf2zk+kB1h6uIAIuhbgsoT+GUG5Q/3Yjveger8jL0Au3jzjIlvIr1T5q4S6Lg/AnRCZMccVkidx2nPLbaWntHlIJo7pD2XfNY8/ia4sgCrkMOAPc1z/3rY3gOiAyK6rlCF79dO+keu+gXy6tKKH0BbdWaQuzxC44scOp0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aJlHGnQZ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aJlHGnQZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743140677;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QutikAf8CzdrkFZy4fbFiEuK2llYIXRXcPk92xeA3Cs=;
	b=aJlHGnQZmji+Ak5NQNbo7FHFnkPLuR8fqGbfPhvttz8pqnZKhndwtaWNLrv/UPK9KmfYEN
	aVEZjKyFu0EQ8OkoXvQEYND3cpb/5vhx3nWHTiUtaV6oL63OjmLPkobRQB9eOG/v++Bcc7
	NrMxySoeGjqUdmCcxz0kgmQVJYcUt+Q=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-370-xVd-9kq5PMCfwT4RnFR4Lg-1; Fri, 28 Mar 2025 01:44:34 -0400
X-MC-Unique: xVd-9kq5PMCfwT4RnFR4Lg-1
X-Mimecast-MFC-AGG-ID: xVd-9kq5PMCfwT4RnFR4Lg_1743140673
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-ac3e0c13278so135975866b.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 22:44:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743140673; x=1743745473;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QutikAf8CzdrkFZy4fbFiEuK2llYIXRXcPk92xeA3Cs=;
        b=uTo0PHuD3Lj4/oXWilhwrg19BFsRnnQfSYFbT5ugrC3C5yW44RWQu0CX2NKv+7ERlN
         omvwSEZp/HWaCOYocK28wKVdihen+/njVK7s1Z7HMViUge8rEPXkyJTtuqVCeABrk//u
         k1k/7t0zRwU13BEZwV3gT6CcH16XviCQYQmeNVLAih4c43UEEBAJZqpmwdY3J3SIzIcS
         FSBv1uxWCZPG+SAWiMfXozBPcjmuPvJZBx4UjMqyX5I7HWAK4GZuwYb3UjWQadsP7GNm
         8/iMtAi63YLLKodPE634iRcct0Vv/rK2YiQiR6YIdb+WE3LupuK2zCcCIZxBH9lTmSaQ
         LltA==
X-Forwarded-Encrypted: i=1; AJvYcCUVLR4YDEAKaiAdz8qeyhIcQdLWoup4+NoAjdNOIsYGygSGCrCDLnFuSBmLQytCy7DtKf2FKcKYl1e7SmY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxk1Kx5BZ+/BAK0dJrASKZ7yyEK5rV8PlwSUSKd1Lj33CRSNpc9
	ngrnQGcBmS4TtalgZPCv5MPX/65Jb81HEWQ3QZBem6lFebr0wnU4qgGUEQAc9r7Y2W3afTXjMIx
	Ugs0f4PVdgZX4sQdJUtf/Rw7Nq0UzjCKqttBCfY1R/mWCv/J20FQOBvma+g3X1UyTkpLTsYm2fC
	bh1bbKmOCD3qQAJJph6zpFkqEk3CQPocFNzIWP
X-Gm-Gg: ASbGnctrlbAQZluo8Ltn/SGh2BXsocUhH60YMBkZQuWPhdZi493ey7ZNeXG0Iw+zUQ0
	HEnA+e52LlgvpWiu91QZaBqO1tBCQlza3oGNJR1tGCkeQC+oZ9WVoG6DyUYMu3YWuSEVWT97xVQ
	==
X-Received: by 2002:a17:907:97d3:b0:ac2:842c:8d04 with SMTP id a640c23a62f3a-ac6faefc2demr579369666b.17.1743140673123;
        Thu, 27 Mar 2025 22:44:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJb11SZdo5gIc5Cpkf/Foi1hoNnZtutCCOu5oz1dTbJqGdShPR2w9s/elEfvXF2PGDrqfGoK9Uujk0qNWiQVc=
X-Received: by 2002:a17:907:97d3:b0:ac2:842c:8d04 with SMTP id
 a640c23a62f3a-ac6faefc2demr579367866b.17.1743140672665; Thu, 27 Mar 2025
 22:44:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250302143259.1221569-1-lulu@redhat.com> <20250302143259.1221569-7-lulu@redhat.com>
 <4rcrc4prhmca5xnmgmyumxj6oh7buewyx5a2iap7rztvuy32z6@c6v63ysjxctx>
In-Reply-To: <4rcrc4prhmca5xnmgmyumxj6oh7buewyx5a2iap7rztvuy32z6@c6v63ysjxctx>
From: Cindy Lu <lulu@redhat.com>
Date: Fri, 28 Mar 2025 13:43:56 +0800
X-Gm-Features: AQ5f1JoqnO2FywuK703ia-cevncP3vP4nSex8V3LYpufvkKolFtpzyEbcR13XLU
Message-ID: <CACLfguXUUwpsyRV2L+wM4cFZ3qSbBNEht8J-JG4ppaLY-_9Sow@mail.gmail.com>
Subject: Re: [PATCH v7 6/8] vhost: uapi to control task mode (owner vs kthread)
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: jasowang@redhat.com, mst@redhat.com, michael.christie@oracle.com, 
	linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 3, 2025 at 4:58=E2=80=AFPM Stefano Garzarella <sgarzare@redhat.=
com> wrote:
>
> On Sun, Mar 02, 2025 at 10:32:08PM +0800, Cindy Lu wrote:
> >Add a new UAPI to configure the vhost device to use the kthread mode
> >The userspace application can use IOCTL VHOST_FORK_FROM_OWNER
> >to choose between owner and kthread mode if necessary
> >This setting must be applied before VHOST_SET_OWNER, as the worker
> >will be created in the VHOST_SET_OWNER function
> >
> >Signed-off-by: Cindy Lu <lulu@redhat.com>
> >---
> > drivers/vhost/vhost.c      | 22 ++++++++++++++++++++--
> > include/uapi/linux/vhost.h | 15 +++++++++++++++
> > 2 files changed, 35 insertions(+), 2 deletions(-)
> >
> >diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
> >index be97028a8baf..ff930c2e5b78 100644
> >--- a/drivers/vhost/vhost.c
> >+++ b/drivers/vhost/vhost.c
> >@@ -1134,7 +1134,7 @@ void vhost_dev_reset_owner(struct vhost_dev *dev, =
struct vhost_iotlb *umem)
> >       int i;
> >
> >       vhost_dev_cleanup(dev);
> >-
> >+      dev->inherit_owner =3D true;
> >       dev->umem =3D umem;
> >       /* We don't need VQ locks below since vhost_dev_cleanup makes sur=
e
> >        * VQs aren't running.
> >@@ -2287,7 +2287,25 @@ long vhost_dev_ioctl(struct vhost_dev *d, unsigne=
d int ioctl, void __user *argp)
> >               r =3D vhost_dev_set_owner(d);
> >               goto done;
> >       }
> >-
> >+      if (ioctl =3D=3D VHOST_FORK_FROM_OWNER) {
> >+              u8 inherit_owner;
> >+              /*inherit_owner can only be modified before owner is set*=
/
> >+              if (vhost_dev_has_owner(d)) {
> >+                      r =3D -EBUSY;
> >+                      goto done;
> >+              }
> >+              if (copy_from_user(&inherit_owner, argp, sizeof(u8))) {
> >+                      r =3D -EFAULT;
> >+                      goto done;
> >+              }
> >+              if (inherit_owner > 1) {
> >+                      r =3D -EINVAL;
> >+                      goto done;
> >+              }
> >+              d->inherit_owner =3D (bool)inherit_owner;
> >+              r =3D 0;
> >+              goto done;
> >+      }
> >       /* You must be the owner to do anything else */
> >       r =3D vhost_dev_check_owner(d);
> >       if (r)
> >diff --git a/include/uapi/linux/vhost.h b/include/uapi/linux/vhost.h
> >index b95dd84eef2d..547b4fa4c3bd 100644
> >--- a/include/uapi/linux/vhost.h
> >+++ b/include/uapi/linux/vhost.h
> >@@ -235,4 +235,19 @@
> >  */
> > #define VHOST_VDPA_GET_VRING_SIZE     _IOWR(VHOST_VIRTIO, 0x82,       \
> >                                             struct vhost_vring_state)
> >+
> >+/**
> >+ * VHOST_FORK_FROM_OWNER - Set the inherit_owner flag for the vhost dev=
ice
>
> Should we mention that this IOCTL must be called before VHOST_SET_OWNER?
>
> >+ *
> >+ * @param inherit_owner: An 8-bit value that determines the vhost threa=
d mode
> >+ *
> >+ * When inherit_owner is set to 1(default value):
> >+ *   - Vhost will create tasks similar to processes forked from the own=
er,
> >+ *     inheriting all of the owner's attributes..
>                                                    ^
> nit: there 2 points here
>
Thanks Stefano, I will change this
Thanks
cindy
> >+ *
> >+ * When inherit_owner is set to 0:
> >+ *   - Vhost will create tasks as kernel thread
> >+ */
> >+#define VHOST_FORK_FROM_OWNER _IOW(VHOST_VIRTIO, 0x83, __u8)
> >+
> > #endif
> >--
> >2.45.0
> >
>

