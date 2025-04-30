Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0F20235054
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 09:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746005246; cv=none; b=DBSgfDlhchrzRv+8NCO7ShdsD0xzP/telzF688ZeUjxyvJT9atnoZEi3ZWm113fxhpAhW4cki4G2PXkkUINrF3saFC3KmKnHsGAWyfHpWJYlSb2JoRS6OTU2pgmxnTgXJnYrx9TPRu/0gFMkHnU4LCUX+OrpE6u+7/Rb52rVp7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746005246; c=relaxed/simple;
	bh=BwKXXL3PYQFTRZW+aG7URAo/jaI2DLZtA1xxXzSK0Ks=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iOwZsOYg+2NCzkuAFtv+t4tMVcIURx10aV+w+K1O9K9Kxzh7ATQLoDxQK+FOU+eAF/8kDBVa+vHBzUMoWWBqrWByU5hfChdowHzftTEQ0w7sI9EJ6ORBE9FS9D4XhO8cWq6f9n4EV+DjX27rpnHTj4wPKy/+tTbQPhDQX/Msj98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Af1zBx5q; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Af1zBx5q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746005243;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+/eUi8mcDR2dtcgh0sHngZgam7Zp8nuaOnXZ0TH4FZE=;
	b=Af1zBx5qFy4XzxnBfpls9GBJzq84EG7M0/B+Q00ikKrNIP7rHaLrvSbQKNvYq9hrc0pNRg
	JFfwFOYrmaqZDbb92aaHCTwU6U3WwWJLFUc4t21xqHSfUVQDCZeUTI255qUpwZAeJSQKwY
	ysGWX1aMfoKw+FNbH+rBjnWLldcmdj8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-669-DDwPX_ruOhONvX2tZ4UPmA-1; Wed, 30 Apr 2025 05:27:21 -0400
X-MC-Unique: DDwPX_ruOhONvX2tZ4UPmA-1
X-Mimecast-MFC-AGG-ID: DDwPX_ruOhONvX2tZ4UPmA_1746005240
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43efa869b19so41315005e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 02:27:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746005240; x=1746610040;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+/eUi8mcDR2dtcgh0sHngZgam7Zp8nuaOnXZ0TH4FZE=;
        b=udUpQ3qicEMmXDET2XEW458t7CfOLHJK1SnzDeSsa24hnJjyHAv6NdjZdoUx2zwk5b
         ZR0ylfc7cPcnhRAGnUuxJIbhyvo1XJGZPnya19h5qYYqyQKFb/ujOWUf8RadGKG0u8Db
         PB3qs05Tu10k7+Co0jorwNggmF5jJZUmLHOO+MSEPAZz+/vpbOD4KWc+fMXlCzM6peZg
         BiEzVSBs7AOeINlMrRjIjtCnuShdMfUrVdWD2vZvoy5eHjB7yJIO5GXiXWGUxyxWNpeQ
         Rc/mQdf5Iq3XmOYO/Z3EUhPFlaVa8s4iJiUO2IaxGcthggkZ5oQfb5FVjFvraxh/AVpT
         wZGA==
X-Forwarded-Encrypted: i=1; AJvYcCV9LL8ib0UWgWw/k/G7OyEPl0IIpEbIh1hUl5zSuzzD5M7WwNoiwPlen7FvAWy1Ror0c5C29wTFONUw2uw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwF0kK+YwVB6MER5qQJsUDjP5cPsoQg37pEwUtP5cCwAm9kWMg8
	Y+sEBggiulEBpnsyuyA/rcV3oJbDKem9TeL7mRoy/XHihrd++ShhsCKfjgF39eNW3uh7NlS2AfU
	IRyi4Pw87rnUV1zS2302ABzEdfpTUmaaHKRwTN+Gh9JfhqP5GSNpb52nL3WvQww==
X-Gm-Gg: ASbGncs4jxtypMhw+lfdySt8ZcFO+9UlJXJTqSNBfY5c8mrTWitzthxZxiRqXEYfTbq
	5SW1Idgilh9Js3Jwmb+D7uE5Cw7ZYDN7SUHA90Bp/yn/7BVKDj3Me7Ay1LoL9eavd9tf3tzzBCv
	GJuBrwIulQrDBidnLU1xsrXcp8/4uKzVLwxstNCUZUPiwixj/1YTeJZRMvUsox7sKfkFhVT5N5i
	TlRlXGAqwpd3IOTv2yUB+loJhWC292gIMRSrndwN7i43+pprHYQca7CSzoe66TF6hmnIBQ6mFkp
	2jrvdQ==
X-Received: by 2002:a05:600c:1d82:b0:43c:efed:732d with SMTP id 5b1f17b1804b1-441b265a216mr24126245e9.16.1746005240413;
        Wed, 30 Apr 2025 02:27:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGZ0vZyPaRC1RprvkAzVN5EJdqn5u6WSue/8vY8l9DR5pd+MaYPUw+ILcM4tYuviqNUNWk6TA==
X-Received: by 2002:a05:600c:1d82:b0:43c:efed:732d with SMTP id 5b1f17b1804b1-441b265a216mr24125915e9.16.1746005240038;
        Wed, 30 Apr 2025 02:27:20 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441ae3ee26fsm40134145e9.1.2025.04.30.02.27.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 02:27:19 -0700 (PDT)
Date: Wed, 30 Apr 2025 05:27:15 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: Cindy Lu <lulu@redhat.com>, michael.christie@oracle.com,
	sgarzare@redhat.com, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, netdev@vger.kernel.org
Subject: Re: [PATCH v9 4/4] vhost: Add a KConfig knob to enable IOCTL
 VHOST_FORK_FROM_OWNER
Message-ID: <20250430052424-mutt-send-email-mst@kernel.org>
References: <20250421024457.112163-1-lulu@redhat.com>
 <20250421024457.112163-5-lulu@redhat.com>
 <CACGkMEt-ewTqeHDMq847WDEGiW+x-TEPG6GTDDUbayVmuiVvzg@mail.gmail.com>
 <CACGkMEte6Lobr+tFM9ZmrDWYOpMtN6Xy=rzvTy=YxSPkHaVdPA@mail.gmail.com>
 <CACGkMEstbCKdHahYE6cXXu1kvFxiVGoBw3sr4aGs4=MiDE4azg@mail.gmail.com>
 <20250429065044-mutt-send-email-mst@kernel.org>
 <CACGkMEteBReoezvqp0za98z7W3k_gHOeSpALBxRMhjvj_oXcOw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACGkMEteBReoezvqp0za98z7W3k_gHOeSpALBxRMhjvj_oXcOw@mail.gmail.com>

On Wed, Apr 30, 2025 at 11:34:49AM +0800, Jason Wang wrote:
> On Tue, Apr 29, 2025 at 6:56 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Tue, Apr 29, 2025 at 11:39:37AM +0800, Jason Wang wrote:
> > > On Mon, Apr 21, 2025 at 11:46 AM Jason Wang <jasowang@redhat.com> wrote:
> > > >
> > > > On Mon, Apr 21, 2025 at 11:45 AM Jason Wang <jasowang@redhat.com> wrote:
> > > > >
> > > > > On Mon, Apr 21, 2025 at 10:45 AM Cindy Lu <lulu@redhat.com> wrote:
> > > > > >
> > > > > > Introduce a new config knob `CONFIG_VHOST_ENABLE_FORK_OWNER_IOCTL`,
> > > > > > to control the availability of the `VHOST_FORK_FROM_OWNER` ioctl.
> > > > > > When CONFIG_VHOST_ENABLE_FORK_OWNER_IOCTL is set to n, the ioctl
> > > > > > is disabled, and any attempt to use it will result in failure.
> > > > >
> > > > > I think we need to describe why the default value was chosen to be false.
> > > > >
> > > > > What's more, should we document the implications here?
> > > > >
> > > > > inherit_owner was set to false: this means "legacy" userspace may
> > > >
> > > > I meant "true" actually.
> > >
> > > MIchael, I'd expect inherit_owner to be false. Otherwise legacy
> > > applications need to be modified in order to get the behaviour
> > > recovered which is an impossible taks.
> > >
> > > Any idea on this?
> > >
> > > Thanks

So, let's say we had a modparam? Enough for this customer?
WDYT?

-- 
MST

