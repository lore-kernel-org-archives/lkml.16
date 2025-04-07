Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE0F0610D
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 03:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743995775; cv=none; b=YuGYPWXRib3F2YDG+qcTuLkaU2gN1yUBD6vFVNat5xsyQpnWcH9HhmyGULgdUl+mncqgHxFcwJ1gmRZdz1npVCnSE+VVvxM32ZT1pAsnStZkuMORkTlaI+SIBVC1sTOtMH40RdcrhyJk4Q7Jr7eGSh32Sm6Pm2WWboX+XU7u3dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743995775; c=relaxed/simple;
	bh=2Psv4XKwzaxxk54Wxm2NMdJLhP46x/zOj5VLe1kQqFs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gd6Xr6dMJBVT/a5FkKCzNBfUFGYb1H+1EdSa6T/VxeaDMUqs0ckR5JH1kCrd2TjdL/4l+8SR8J18HVqFFII8DYXcB2gIsWDwHZlEMlrq+neRroJtAQwWJHnvfRigJU6hhmbWwRE0PuYLgmFh6HqLLa1v71CylU5iRR+L+5giM5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AFK2SNTP; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AFK2SNTP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743995772;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2ByT4VM0mlsPMFV1CM9t8/TNYyL/tLm0jIu9vYemq9w=;
	b=AFK2SNTPMRZ/BfbI78/RbV1glk6BQag68dPA7M7oZ6vciguY3MgfzcNmqaqp4+1Ck92HR6
	o89maK4SuzbWIeObWFnnTEuR7J1+zkkDZ/mU6/fGHYY5ZjTAwNwGaFWoV5byZjErQQ0KLq
	RbMrNJhwrGAIbZIv4Vg4UxEiqrzRYC0=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-290-BTXoyWAWPoiETyT9DiK4GA-1; Sun, 06 Apr 2025 23:16:11 -0400
X-MC-Unique: BTXoyWAWPoiETyT9DiK4GA-1
X-Mimecast-MFC-AGG-ID: BTXoyWAWPoiETyT9DiK4GA_1743995770
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-ac3df3f1193so299524366b.2
        for <linux-kernel@vger.kernel.org>; Sun, 06 Apr 2025 20:16:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743995770; x=1744600570;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2ByT4VM0mlsPMFV1CM9t8/TNYyL/tLm0jIu9vYemq9w=;
        b=trbKOKad+dBzjGV2AJxrJHRj/wTkVFpT1+9vQmj7DXqZqDIcqwvno9+xkTpU+pLWtv
         AiwbQGnRTz4EvNYPVr5+eSLxVcVWHPdM7JdbKupkt0zNybjh9xrhxm2ww68JrTAEaamM
         f9NmmIDwuYwErdz3eM2c+zruvyWrwfntxmsL+4x3Vz4AWXl5W8Npi+UG9PUleX7kRC44
         KfmsESOnTV2qZ/wFz71iiovUwdOyrI4jC7AdY2iqWJFrR7cJTSlQWaVHMSG23K8YcKrd
         119XHwqVv4ThzTz9u/V8QctpEcbriqQBuTshfQXNFCmg2/Z2qFyhzTYta4F5cf19jgJ2
         h2Cg==
X-Forwarded-Encrypted: i=1; AJvYcCWf0Mj5mTq09aLwWOzNMoHmDUCIZ+bxi5jusIBLwh666V7ldcBZkEZII0IyMWrIgxfj74j9xg5d3atPxdw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKXfhpVM5Yt3vODVOorRbRnbH8rHLXI7IQShzxR82+Fx/P5iaJ
	288gIEnjc71sjMSZrohz+oZQdubFiEuLyKHXSaiKaM/D072XL6SekcqxhIAID9doyQgO+9OOSGS
	7ypmF9GAeclfI1hAk7HmmBFVKLii0K33v4dp1R0EyPgi8phBWPZ9G6cxiZLTKCasVKpcYyp/hGu
	wTCCaNd4LdhFJK2ltA3iJeZcGlJwOO8NyipK1l
X-Gm-Gg: ASbGnctlT4xa8YxVeNWOmUp6Gn01l0StuouoIE+pxNvuzri6jkiql/aeda/uk6hsjIS
	hq4cjDpVx+Ia4GuAfY8Zv+jYZJoqLNFJG8VO2wGrfsaWI4tr5rc7lTh27WtmleiWVRdTyx9NQPg
	==
X-Received: by 2002:a17:907:7ea6:b0:ac2:a5c7:7fc9 with SMTP id a640c23a62f3a-ac7d6e93599mr994473466b.51.1743995770475;
        Sun, 06 Apr 2025 20:16:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMJnXbAYIz1U9EXfhPLXDao58wG6UnY/kQ+tnR0/5Lpt/9hn9DGVTkSTF2KUQRBQfoiF3etXQ5fFZKr+LUKAs=
X-Received: by 2002:a17:907:7ea6:b0:ac2:a5c7:7fc9 with SMTP id
 a640c23a62f3a-ac7d6e93599mr994472366b.51.1743995770124; Sun, 06 Apr 2025
 20:16:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250328100359.1306072-1-lulu@redhat.com> <20250328100359.1306072-8-lulu@redhat.com>
 <d35istatjtnr42x4gwpwlgx627pl3ntqua3kde7fymtotl676i@jxxxkrii6rue>
In-Reply-To: <d35istatjtnr42x4gwpwlgx627pl3ntqua3kde7fymtotl676i@jxxxkrii6rue>
From: Cindy Lu <lulu@redhat.com>
Date: Mon, 7 Apr 2025 11:15:33 +0800
X-Gm-Features: ATxdqUHJ6Q-Ip5ecSwCjJr9VIgAypATzgnh9U_7r0L81kSaqxYSAPR91ELbFrEQ
Message-ID: <CACLfguXFeV6aRL+rW9ULWh=gyF8u5vLncMFJhsOrfMWe7PhvTA@mail.gmail.com>
Subject: Re: [PATCH v8 7/8] vhost: Add check for inherit_owner status
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: jasowang@redhat.com, mst@redhat.com, michael.christie@oracle.com, 
	linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 1, 2025 at 9:59=E2=80=AFPM Stefano Garzarella <sgarzare@redhat.=
com> wrote:
>
> On Fri, Mar 28, 2025 at 06:02:51PM +0800, Cindy Lu wrote:
> >The VHOST_NEW_WORKER requires the inherit_owner
> >setting to be true. So we need to add a check for this.
> >
> >Signed-off-by: Cindy Lu <lulu@redhat.com>
> >---
> > drivers/vhost/vhost.c | 7 +++++++
> > 1 file changed, 7 insertions(+)
>
> IMHO we should squash this patch also with the previous one, or do this
> before allowing the user to change inherit_owner, otherwise bisection
> can be broken.
>
> Thanks,
> Stefano
>
Sure, will do
Thanks
Cindy
> >
> >diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
> >index ff930c2e5b78..fb0c7fb43f78 100644
> >--- a/drivers/vhost/vhost.c
> >+++ b/drivers/vhost/vhost.c
> >@@ -1018,6 +1018,13 @@ long vhost_worker_ioctl(struct vhost_dev *dev, un=
signed int ioctl,
> >       switch (ioctl) {
> >       /* dev worker ioctls */
> >       case VHOST_NEW_WORKER:
> >+              /*
> >+               * vhost_tasks will account for worker threads under the =
parent's
> >+               * NPROC value but kthreads do not. To avoid userspace ov=
erflowing
> >+               * the system with worker threads inherit_owner must be t=
rue.
> >+               */
> >+              if (!dev->inherit_owner)
> >+                      return -EFAULT;
> >               ret =3D vhost_new_worker(dev, &state);
> >               if (!ret && copy_to_user(argp, &state, sizeof(state)))
> >                       ret =3D -EFAULT;
> >--
> >2.45.0
> >
>

