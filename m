Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBF052BD59D
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 10:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745924162; cv=none; b=Hupyb5+393kfkYS1fbOct5GWEC8f+mTRKkIO7CMaDt+ZVlGQ3RqORrmw3b3RsZG4R1BVQronjevqCIuKuq1/BdmnzMQtGJqaxSKu5ufltWWl4WgUj6K/nPPyzVfZ2armznfyuopVChZkmntREJBSn3F727Ur2lhhERtfPRo0wf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745924162; c=relaxed/simple;
	bh=2XOsrJ9QxJ2xmMD7aI3JwMzLwhIcEOOkFjqywzEOBXk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ewKZMHwn/HqiB0nIilI7LB00fnXH9MzX6lq6tYdSoJ5qFC37xhyooB0IMswvLqHg324LkQ26unPNKFWxAx7cRx42rQwQRsVhY91p/xdTrVj4aQVkI8yslQScfzIeZ4MFfbzSaYvOyVOC3tsHy/cJ7fYXsXnqUraFkTFqNC7ueOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CFmEnN0t; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CFmEnN0t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745924159;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=19RTGAYgSCXwR1/QnePt6pjSqRpqNVt5Z/wpug3TfME=;
	b=CFmEnN0tx48xOF29CTLyNjnpLmCOW+ztzbOGM5ICNbzkTVok9q1VCtBIKox4lK+BmzgPUb
	BvxTI73tRli4dnnAqTnbRApJy122VvXss7HUMJiEVpnw7093G1DYyQ0QzEktBmWumgOU41
	gZy3OpUeISetbUItPCqskN0VA0iazMs=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-94-Vkpxu_RmOH-hQt83GeXvuA-1; Tue, 29 Apr 2025 06:55:58 -0400
X-MC-Unique: Vkpxu_RmOH-hQt83GeXvuA-1
X-Mimecast-MFC-AGG-ID: Vkpxu_RmOH-hQt83GeXvuA_1745924157
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43efa869b0aso35329975e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 03:55:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745924157; x=1746528957;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=19RTGAYgSCXwR1/QnePt6pjSqRpqNVt5Z/wpug3TfME=;
        b=TAVis2uTQ0e5XwhvwfTYLGL7spasJnMcfD77h/J5zDdl1hpTvAzR+0c/Poli9Zxqco
         H/QMVbby29IupSQrYmH1V8vikAodl7lLAoHEZbcGeDYcabsQb9/aABGGm96MeSPD2gsZ
         TfR0vLx/lRK7F3uOUbhRIdNhfYO7Cx17/tYDS3jOaHKxXykgU3QkzyqGPi0Ve5KBRoEX
         SEdV4GYjMqoiXrSBe6FzsXRFNN0E5Jkp1ah3X5ycetd0fYcYQqShYIs4Fb25f+BRnGn2
         eU39WLG+rP+qrOnbW+bclENUSttoAkXEMdXlLxmMFu02YndUqIyNZor9rxOzSfiyPddy
         XeQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGtaqaXjsy0RFugPKwx17PB2LNLCyDNwQoivSvvBVnCEM/VqHPVlz8y3iWKvOQswudSTJX014ReNEdMCU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yym08hhfTrBkTXN9nAPb7/90xuPgXJDlfO5Haxn14hItgHUm1vV
	9JM6xly6XEKsoiZ/l1pbrK+TXp3PYcmsYWG2Ugv6h+pz5KOCQ5CwmlumE5nvYj5m1e+Y+rK1eDO
	kVI7RLDIE+JZgkrm4YOQIRIeWluvDFCFbDaad+RKi/wDLSKrREDgo7bH0gFGexA==
X-Gm-Gg: ASbGnctQVgt11+oS9xT/0caeCVUJD+5cRPxFKNCQUdintEMiSx0vNqzZLu1ABnc+8aA
	jeY69xWm9KlZY9U2mRz+zi8DxaRdxGR3kibak5kdrPDxUa9/M+759aj2j4CJvwZ5WSXcYRjawRX
	znKkfJlngT2zuNTHvlJxnGYvPV8sohQ8Y/ibyfXwLQO5T4Mn1XRGdTNO7ZlqHFomDup2Hv7UaUP
	IEeQE8DfP6WPhGWfS46J5TWReZwAVA2iykqk+FzWEVlM90q2hr8kfkEKIysnAl9iVB/DJnmMwfR
	3YUruQ==
X-Received: by 2002:a05:600c:384a:b0:43d:160:cd9e with SMTP id 5b1f17b1804b1-441ac85cfffmr30415235e9.17.1745924156962;
        Tue, 29 Apr 2025 03:55:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGNHhPyQF+kfEhHY8Rir1hFUnKPAus/tT9SNHKVUQOtQwHP4Id2+yIhepQRoyIXOCX/07G8ZQ==
X-Received: by 2002:a05:600c:384a:b0:43d:160:cd9e with SMTP id 5b1f17b1804b1-441ac85cfffmr30414975e9.17.1745924156638;
        Tue, 29 Apr 2025 03:55:56 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a536a1ddsm154027115e9.30.2025.04.29.03.55.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 03:55:55 -0700 (PDT)
Date: Tue, 29 Apr 2025 06:55:53 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: Cindy Lu <lulu@redhat.com>, michael.christie@oracle.com,
	sgarzare@redhat.com, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, netdev@vger.kernel.org
Subject: Re: [PATCH v9 4/4] vhost: Add a KConfig knob to enable IOCTL
 VHOST_FORK_FROM_OWNER
Message-ID: <20250429065044-mutt-send-email-mst@kernel.org>
References: <20250421024457.112163-1-lulu@redhat.com>
 <20250421024457.112163-5-lulu@redhat.com>
 <CACGkMEt-ewTqeHDMq847WDEGiW+x-TEPG6GTDDUbayVmuiVvzg@mail.gmail.com>
 <CACGkMEte6Lobr+tFM9ZmrDWYOpMtN6Xy=rzvTy=YxSPkHaVdPA@mail.gmail.com>
 <CACGkMEstbCKdHahYE6cXXu1kvFxiVGoBw3sr4aGs4=MiDE4azg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACGkMEstbCKdHahYE6cXXu1kvFxiVGoBw3sr4aGs4=MiDE4azg@mail.gmail.com>

On Tue, Apr 29, 2025 at 11:39:37AM +0800, Jason Wang wrote:
> On Mon, Apr 21, 2025 at 11:46 AM Jason Wang <jasowang@redhat.com> wrote:
> >
> > On Mon, Apr 21, 2025 at 11:45 AM Jason Wang <jasowang@redhat.com> wrote:
> > >
> > > On Mon, Apr 21, 2025 at 10:45 AM Cindy Lu <lulu@redhat.com> wrote:
> > > >
> > > > Introduce a new config knob `CONFIG_VHOST_ENABLE_FORK_OWNER_IOCTL`,
> > > > to control the availability of the `VHOST_FORK_FROM_OWNER` ioctl.
> > > > When CONFIG_VHOST_ENABLE_FORK_OWNER_IOCTL is set to n, the ioctl
> > > > is disabled, and any attempt to use it will result in failure.
> > >
> > > I think we need to describe why the default value was chosen to be false.
> > >
> > > What's more, should we document the implications here?
> > >
> > > inherit_owner was set to false: this means "legacy" userspace may
> >
> > I meant "true" actually.
> 
> MIchael, I'd expect inherit_owner to be false. Otherwise legacy
> applications need to be modified in order to get the behaviour
> recovered which is an impossible taks.
> 
> Any idea on this?
> 
> Thanks

At this point, as we changed the behaviour, we have two types of legacy applications
- ones expecting inherit_owner false
- ones expecting inherit_owner true

Whatever we do, some of these will have to be changed.
Given current
kernel has it as true, and given it is a cleaner behaviour that will
keep working when we disable CONFIG_VHOST_ENABLE_FORK_OWNER_IOCTL in 10
years, I think it's the better default.
If you want to change it transparently, look for ways to
distinguish between the two types.

The application in question is qemu, is it not?
I do not see how sticking an ioctl call into its source is such
a big deal, if this is what we want to do.
A bit of short term pain but we get clear maintainable semantics.

-- 
MST

