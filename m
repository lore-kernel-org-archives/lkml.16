Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FFD1266EFA
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 06:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749449462; cv=none; b=ORXsWBytXa2FVDL/IKWIc2UT6wthrm1dxCCnZed6CxevNsltAUaOccmdAJUJ9HQmC6vhEFMLoF3Q+oaGWs9mkUthKu+o2YFs/vJXtnmgdYVLm4oa4QFxIenaHGx4s8Iz5KdBUM9K1Uxf9yxC+E8Zehp7HbEUJ+LrjwoZAocYpIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749449462; c=relaxed/simple;
	bh=6B//4am4kf0/sPk4mJgCJJwvxYd2J+xNJ7hXmBZcR0k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Sp8y917ojeFd38fYuJ4XokmIbw9aYdtQE3xP9pyg22PcKPtzr64sKBJr+l3vjMdrnwCx3Cvr8oFA9b8omaoZHhBYa8kQXmry0uCoMsutn5/YjbUsXgh/audUDd4KVDJnDvIwBducaWpui33oQmRkqqfP97SYcX7znAHsTeaQC+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NwP97CWY; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NwP97CWY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749449459;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8fAHnSUgbK0T/Jvj5lZ7rfRDImFhPiFzgFqOeLLWznI=;
	b=NwP97CWYXVxlEIETOV0qPtvl7p1Jkf96AEsk5cDgmkxUIfKWmLUUU/v3BgiFZmxskJ4DVn
	6Q0zJ7/kQ5mbyAfjZNay9R4bcXZUZq2iokBc5EvLLCog/URfswP2BpIywmBmZCUwow8iEB
	UYTOAc6w6EOaVVFbDnrpmx1qRNJ7UU0=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-324-hpKgFyZEMF2I80vcnW9IbQ-1; Mon, 09 Jun 2025 02:10:56 -0400
X-MC-Unique: hpKgFyZEMF2I80vcnW9IbQ-1
X-Mimecast-MFC-AGG-ID: hpKgFyZEMF2I80vcnW9IbQ_1749449455
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b2c3e576201so3796283a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Jun 2025 23:10:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749449455; x=1750054255;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8fAHnSUgbK0T/Jvj5lZ7rfRDImFhPiFzgFqOeLLWznI=;
        b=AnXAw7ffijgaLLcBniXbtSw3JalRYZp+MRAS2lHsul6f1R9l0wFy2Pc3eU+w+Z5ow2
         aEW2wvpmOWBaCvp43hmWfu851L4i1UpSrVCPzRw1WeRHYnnGytG1c/lm7UTQ1RBXu0ax
         epnyP4pjeSmsrRDvxrc203wIw6Z5X/kzJv3gEeZtZD2MQQVnNaJo4y3IOIutVCyDTFaX
         waHSH14IqkScd5ZNn3CkydIexuqwV7hoQ0li7qvnB58s4M36R3xjBfvT1vD1bIWFFwfO
         ro1zymOHFb8cDjfRIxesrZ6ZsbWbJxvt9uO/ZwvDFS0RS6eNuyeK4jEPU11kl7nYlaiO
         HO5A==
X-Forwarded-Encrypted: i=1; AJvYcCVLIdBK4LfaJIPxxb8z1DorgubBY8eRPbr/E+yM4TSXaINN3wxpKaPNVQkprLMe1E9rqRQ63Esu8a0WBdU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdEvSJ/sU788arKffu7TeiV4KwdCZ31EOkCGVlCoL/f4TjaYoL
	cidLKYip5o2jcpm2zi0532EF9ngYPOYBuzluSdcVuNNWfjErJZy2rtHjtgm7Z0K+TigeeL24wKy
	u7VoivaCmAGMvTBogJsqIATsU7+T2DF71kDWbgCmy7Ls4DMLs/7qHjfAflS1EeFRgvj7vMLP5r2
	52q5ullSy96dAMBEpDcbZvLB074/AgDIEa+knJ5xdW
X-Gm-Gg: ASbGncu+UeeXAmj4M375LeYcJ6o+2LVPp8Pu5jU6NoaLgpbAaCUGye67eBqQ9Bli7O3
	jss7N4DK8v7BqGCRI4EBkNqT2r1bqwBOsBhit5LCZlDpY0p7dXX5NG89hmE/byfQs0P0=
X-Received: by 2002:a17:90b:2802:b0:310:8d4a:4a97 with SMTP id 98e67ed59e1d1-313666b18d2mr10246574a91.15.1749449455520;
        Sun, 08 Jun 2025 23:10:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE6/2UHn7/Uo8w2el5l2Rn8LGz769MNneYKHjrmdgTaipoeImVc5NlpqZY+cvQ12Vc/NyTuf6CIGXI035ffYfA=
X-Received: by 2002:a17:90b:2802:b0:310:8d4a:4a97 with SMTP id
 98e67ed59e1d1-313666b18d2mr10246553a91.15.1749449455207; Sun, 08 Jun 2025
 23:10:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250606115012.1331551-1-eperezma@redhat.com> <20250606115012.1331551-2-eperezma@redhat.com>
 <CACGkMEsw2taXgW11na2CFK6W03c=x=wMn3iwNZPypgPkeSU06Q@mail.gmail.com> <CACGkMEvinV7Zd+xddnxcerFbw_c+RZypkeD5HaN8=g6+peZvMQ@mail.gmail.com>
In-Reply-To: <CACGkMEvinV7Zd+xddnxcerFbw_c+RZypkeD5HaN8=g6+peZvMQ@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Mon, 9 Jun 2025 08:10:19 +0200
X-Gm-Features: AX0GCFunBg0u2F00zqo-pilSrjGR2wWnYVAnlGyKdS6mvzmpjVUJMCnjdbab8LA
Message-ID: <CAJaqyWeetDsdoDzVrN-n0+jr97MBPeHdTxeM3ttmNUeLK702VA@mail.gmail.com>
Subject: Re: [RFC 1/6] vduse: add v1 API definition
To: Jason Wang <jasowang@redhat.com>
Cc: Yongji Xie <xieyongji@bytedance.com>, Cindy Lu <lulu@redhat.com>, 
	linux-kernel@vger.kernel.org, Stefano Garzarella <sgarzare@redhat.com>, 
	Stefan Hajnoczi <stefanha@redhat.com>, Maxime Coquelin <mcoqueli@redhat.com>, 
	"Michael S. Tsirkin" <mst@redhat.com>, virtualization@lists.linux.dev, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Laurent Vivier <lvivier@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 9, 2025 at 3:50=E2=80=AFAM Jason Wang <jasowang@redhat.com> wro=
te:
>
> On Mon, Jun 9, 2025 at 9:41=E2=80=AFAM Jason Wang <jasowang@redhat.com> w=
rote:
> >
> > On Fri, Jun 6, 2025 at 7:50=E2=80=AFPM Eugenio P=C3=A9rez <eperezma@red=
hat.com> wrote:
> > >
> > > This allows to define all functions checking the API version set by t=
he
> > > userland device.
> > >
> > > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> >
> > It might be worth clarifying how it works.
> >
> > For example,
> >
> > 1) would VDUSE behave differently or if it's just some new ioctls

I'd like to test more in-depth, but a device can just bump the version
ID and then implement the replies to the vduse messages. No need to
implement new ioctls. If the VDUSE device sets 0 in either number of
ASID or vq groups, the kernel assumes 1.

But you have a very good point here, I think it is wise to evaluate
the shortcut of these messages in the VDUSE kernel module. If a VDUSE
device only has one vq group and one ASID, it can always return group
0 and asid 0 for everything, and fail every try to ser asid !=3D 0. This
way, the update is transparent for the VDUSE device, and future
devices do not need to implement the reply of these. What do you
think?

> > 2) If VDUSE behave differently, do we need a ioctl to set the API
> > version for backward compatibility?
>
> Speak too fast, there's a VDUSE_SET_API_VERSION actually.
>
> I think we need to think if it complicates the migration compatibility or=
 not.
>

Do you mean migration as "increase the VDUSE version number", not "VM
live migration from vduse version 0 to vduse version 1", isn't it? The
second should not have any problem but I haven't tested it.

> > 3) If it means a brunch of new ioctls, could userspace just probe the
> > new ioctls instead?
> >
> > Thanks
>
> Thanks
>
> >
> > > ---
> > >  include/uapi/linux/vduse.h | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > >
> > > diff --git a/include/uapi/linux/vduse.h b/include/uapi/linux/vduse.h
> > > index 68a627d04afa..9a56d0416bfe 100644
> > > --- a/include/uapi/linux/vduse.h
> > > +++ b/include/uapi/linux/vduse.h
> > > @@ -10,6 +10,10 @@
> > >
> > >  #define VDUSE_API_VERSION      0
> > >
> > > +/* VQ groups and ASID support */
> > > +
> > > +#define VDUSE_API_VERSION_1    1
> > > +
> > >  /*
> > >   * Get the version of VDUSE API that kernel supported (VDUSE_API_VER=
SION).
> > >   * This is used for future extension.
> > > --
> > > 2.49.0
> > >
>

