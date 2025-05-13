Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D388C1A5BBC
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 04:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747109350; cv=none; b=rU7iSBlSH5F4yyegP77Eq3Hm5YIHUxc3RjaBEUb2DnVDzYrT0gq8I8xbo3vWqz4DjioUG3OkKeUfChpA4nOXVyiTLvnpAHjnKIKSnzJYxscNXpPLqauO9upMZomY/3EcJCKMHKBgcdh1bQQ0Ut74EhT8YTYyCHUjziTJUSgksNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747109350; c=relaxed/simple;
	bh=/7PexB5fSgQlaIRo7HZc5/n/QHKjEqlW3Nl3Mba+2fU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WP/IWGDxDXpDu9YryVndfr5O32elCcuQ5dUht4SR8WFBXablrJrqDpTbD0lybLZdSTgGqZtb7gg+2gixBw9ytipt8PqCFzd+FX+y2kw2frs/1cnCIgD7D46hR0YWBcCea0Wu9upj5/Icwh2g37uXbQ9wcdaBigzfzGfIhv5Jivc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QNr4BmSQ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QNr4BmSQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747109347;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/7PexB5fSgQlaIRo7HZc5/n/QHKjEqlW3Nl3Mba+2fU=;
	b=QNr4BmSQpsrEwE2hGqiXcd2JTeSUmu0Z7V+d1ZDKMF/uBYDyiKW8CgcCb0qHNqygPx6D4J
	CV248sQf5NS+wA2NGHHHx7hOYotD6MsxNU+Fl9F+7IuWqjcEO+/ZWlIE0TBkWRhLsqDi8B
	xYUnS38Dp1dhwoWXLEAn/bJ00ZaivBU=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-573-MGdkzoY3M72weMnQOHpACQ-1; Tue, 13 May 2025 00:09:04 -0400
X-MC-Unique: MGdkzoY3M72weMnQOHpACQ-1
X-Mimecast-MFC-AGG-ID: MGdkzoY3M72weMnQOHpACQ_1747109343
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-30ac9855e35so6600501a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 21:09:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747109343; x=1747714143;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/7PexB5fSgQlaIRo7HZc5/n/QHKjEqlW3Nl3Mba+2fU=;
        b=M0yZF9K6e1OPVbW7ywqYu6vio162kUXaC2FtsxEo8OUUu6uQrQLRWQ3Z98Hi2URh+Y
         Ip9k9h77WF46UKRcvRIShomwtmPSD7mwd2o1YztkFnM+Cac27sl4YlnRixDusgxBXhOY
         XciBNzx58if6MFo6vPzKfVkJbTBfCOwD6uZfS/Czg4IWpGyEccTcFOcACp34hpN4OoJS
         wb5dvKjk+B48MHv/mz1xxl8drB0avKmAQPkShJYgw1Iot9A6TFsp7suvuFjsIK2wL/lW
         W0bdrgsSeKlvhqh9nYW3jjaMq4XY0xtI1zclE2Wdbxqa++ZfKqT1hnuj9a1CpS8ELkNT
         TTUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpw+OTriB5v1s7XKKU7d5ycw4vDKQRvg3JInvJlgZPugb/SzA/TWUjL6RLhsk4SRu7MH4/aghjya+7KiE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjzqFihECqBaiCmysi+FY2j9BVOOcANC6SEfrVjZX7N/8r0COD
	ug+odzyfW7CJCBIxdEIx0oo55hcdUfPurutf+zsokUG5JZfJNSrfVu4kKeIsKMw3Hi5He7F5yKa
	PHJZiYDNLsCUhWj9UljjiI4PxU1b9+qboVDcPKcQYL+8XyaJ08SPcBwlBEs6nHu3Wnp6CJoGzwX
	xT8t1XxyxSRRzdpcZfHn8Q82Bx7CBCt/kHS4xG
X-Gm-Gg: ASbGncux9lCf77z+RsxSlGCzGv8VPQaGh5u/J0CNHzw+dQt07ZkVNrGaXpHyTcQJN/w
	DPXURIOG+6XcedAmztD6Z4tnc1b0rNRe2qklmIm22tII+/4uERO2O9VgCtA8meOLNEw==
X-Received: by 2002:a17:90a:d605:b0:2fe:ba82:ca5 with SMTP id 98e67ed59e1d1-30c3ce0470bmr26232822a91.11.1747109343289;
        Mon, 12 May 2025 21:09:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHyBWgHCft3k//tAxwx54BhvxIyBUdAIfMV5MOII1cMr/aB5z20Oh2o8khSRERHIdevOIlxT4LnUgaV8ZRyza0=
X-Received: by 2002:a17:90a:d605:b0:2fe:ba82:ca5 with SMTP id
 98e67ed59e1d1-30c3ce0470bmr26232784a91.11.1747109342873; Mon, 12 May 2025
 21:09:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250421024457.112163-1-lulu@redhat.com> <20250421024457.112163-5-lulu@redhat.com>
 <CACGkMEt-ewTqeHDMq847WDEGiW+x-TEPG6GTDDUbayVmuiVvzg@mail.gmail.com>
 <CACGkMEte6Lobr+tFM9ZmrDWYOpMtN6Xy=rzvTy=YxSPkHaVdPA@mail.gmail.com>
 <CACGkMEstbCKdHahYE6cXXu1kvFxiVGoBw3sr4aGs4=MiDE4azg@mail.gmail.com>
 <20250429065044-mutt-send-email-mst@kernel.org> <CACGkMEteBReoezvqp0za98z7W3k_gHOeSpALBxRMhjvj_oXcOw@mail.gmail.com>
 <20250430052424-mutt-send-email-mst@kernel.org>
In-Reply-To: <20250430052424-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 13 May 2025 12:08:51 +0800
X-Gm-Features: AX0GCFv7w4A3XPsR5LhhGFMy4lH1n0jPjulwvckB7Zf4ezIel8xqf6nhTotZRJ0
Message-ID: <CACGkMEub28qBCe4Mw13Q5r-VX4771tBZ1zG=YVuty0VBi2UeWg@mail.gmail.com>
Subject: Re: [PATCH v9 4/4] vhost: Add a KConfig knob to enable IOCTL VHOST_FORK_FROM_OWNER
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Cindy Lu <lulu@redhat.com>, michael.christie@oracle.com, sgarzare@redhat.com, 
	linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 30, 2025 at 5:27=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com>=
 wrote:
>
> On Wed, Apr 30, 2025 at 11:34:49AM +0800, Jason Wang wrote:
> > On Tue, Apr 29, 2025 at 6:56=E2=80=AFPM Michael S. Tsirkin <mst@redhat.=
com> wrote:
> > >
> > > On Tue, Apr 29, 2025 at 11:39:37AM +0800, Jason Wang wrote:
> > > > On Mon, Apr 21, 2025 at 11:46=E2=80=AFAM Jason Wang <jasowang@redha=
t.com> wrote:
> > > > >
> > > > > On Mon, Apr 21, 2025 at 11:45=E2=80=AFAM Jason Wang <jasowang@red=
hat.com> wrote:
> > > > > >
> > > > > > On Mon, Apr 21, 2025 at 10:45=E2=80=AFAM Cindy Lu <lulu@redhat.=
com> wrote:
> > > > > > >
> > > > > > > Introduce a new config knob `CONFIG_VHOST_ENABLE_FORK_OWNER_I=
OCTL`,
> > > > > > > to control the availability of the `VHOST_FORK_FROM_OWNER` io=
ctl.
> > > > > > > When CONFIG_VHOST_ENABLE_FORK_OWNER_IOCTL is set to n, the io=
ctl
> > > > > > > is disabled, and any attempt to use it will result in failure=
.
> > > > > >
> > > > > > I think we need to describe why the default value was chosen to=
 be false.
> > > > > >
> > > > > > What's more, should we document the implications here?
> > > > > >
> > > > > > inherit_owner was set to false: this means "legacy" userspace m=
ay
> > > > >
> > > > > I meant "true" actually.
> > > >
> > > > MIchael, I'd expect inherit_owner to be false. Otherwise legacy
> > > > applications need to be modified in order to get the behaviour
> > > > recovered which is an impossible taks.
> > > >
> > > > Any idea on this?
> > > >
> > > > Thanks
>
> So, let's say we had a modparam? Enough for this customer?
> WDYT?

Just to make sure I understand the proposal.

Did you mean a module parameter like "inherit_owner_by_default"? I
think it would be fine if we make it false by default.

Thanks

>
> --
> MST
>

