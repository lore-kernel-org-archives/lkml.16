Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB21328643D
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 10:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750760531; cv=none; b=U1DqcJJjaZdTG9HV2s9WGsa7cwwqD44b8qvCxeLSOYp/TZUyn4U3YZ3mTWJmqWoTAn/7SJzZOcYTI/mCISgGNqdHtdEinxSfJo8+496VHZQ3mZ1LBWrQOT3mbm8vUvQlmrjerGA/LLEX67VvLeaRTJTKX9ERFD4SBlz08ZSCrN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750760531; c=relaxed/simple;
	bh=EAplqW2ugJAkvDa+aOJIODUp0iAnSPiEybzJg50wrII=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kg23fQ0XUhqti5h9f7WiWERxmFj41iXi3CV4Yc+lDJmL2od2GJ/Q+/VrGv70G3tMJnBYcanys9/0HAwv1y+1HY3I7FYxnBxbP+55u4EOSxcB4Szdrf/2x9fjFI7vbcRCunV0EJX5tHuumoVLS8LPFFCU813P3fm2HdyqVuvamgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ht9+kCU/; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ht9+kCU/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750760528;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LBSg8EY7sp1BX+AXcNCVD/E1en0mg8rYiqbGQhd2mHE=;
	b=ht9+kCU/TnJPD5agk2ZyZrHPVFM7ysb93WKE3bVa5uFZmPCMewDQyCnpnaZg9NcoaauYvZ
	9Ttgi5DofF3c7u7gG3RTYCz1NeqSVBkc+aBWg8PgTTatYc9K0mbZn4/1Mt603GE0kb6QgI
	aEIUG9aFSxHPb7v2tGWFgdd6Eduuyro=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-135-jrYxJhiYNVa_w2NTc71tOg-1; Tue, 24 Jun 2025 06:22:07 -0400
X-MC-Unique: jrYxJhiYNVa_w2NTc71tOg-1
X-Mimecast-MFC-AGG-ID: jrYxJhiYNVa_w2NTc71tOg_1750760526
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-ade6db50b9cso30104566b.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 03:22:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750760526; x=1751365326;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LBSg8EY7sp1BX+AXcNCVD/E1en0mg8rYiqbGQhd2mHE=;
        b=AtnQLLpSPfqNn2o1Jnf31EVV1sqXvFNbMyMNB01bOaAzxx1BON8dtjBMqkGtTlAR27
         Gkc34dMj7BWcsl87f1RtOhu0/6GC5kzkKKzVfhR8niRA0wyv1qtVKL7IdVJBai0K47BU
         kyRMTZMavw0YJrpJnQli3lHSJTJW+/fUDfCZZipqz8fOWp1D+z++p9c3JazmOHdq1r0s
         p/Z55V/L9HN1DCM4Na5LMqk0c+LJ4mtYLrOM3OGExctAOCrujV0r+1FHt1NVBXzK92Rq
         DeCddJaNLAJJvqORoHUptHXayXu88dgjKGkLnWGgCLqNVFVdamqglnmGfzMR6Oud0xFZ
         OGbQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfg53sEmljnz2b20SRohB1A/sMn44ffyPtLBuiufQxYZh2HSKIH6V0mRx+SROj8V8jUtTeJz+z2OfHEE4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKYBV+I6pVSoXT2sIvpZjO8fh2D4PMSi1rEt3lKioEDST/3/uG
	x4ttc83wSwFgxad5sRwgFBcEpuUmrICd+HmxDNSQCHTMSml7o3manxPxEllz1Ny7NVD74uNS9TS
	BYAar5me6gXUEMO/aIKhg/w98nNXZIdYDjSr8VwV9GS6RW3RgkfiqVYV92/Raj/GsbyvI40/bu5
	0hWSJZdyEtpLwCqwgSHXJMcJqIfgXB/5HG6hQpdf5m
X-Gm-Gg: ASbGnctt3W/unO7htG2Io64Mc87RGy06jnnFy+pZVWs53ULTMhR8sXmjMeXyRsGbwPb
	LtWRBUPaqwMu8u6j7XmgIcwdEz7BCoPktA4/+iTzW7iqpUEDPVHJYwtWI+rwIKWvgKfmkSOs0pO
	8gwHB+
X-Received: by 2002:a17:906:8924:b0:ae0:ad5c:4185 with SMTP id a640c23a62f3a-ae0ad5c4bb6mr127042066b.57.1750760525918;
        Tue, 24 Jun 2025 03:22:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFK7idR9ddwSthjp78IPlVH980PF43V9ofMCipwNRyRw+Vq3cABVYLahb6LovHNST8gpasNwDNrhBfNArPnPZc=
X-Received: by 2002:a17:906:8924:b0:ae0:ad5c:4185 with SMTP id
 a640c23a62f3a-ae0ad5c4bb6mr127039766b.57.1750760525506; Tue, 24 Jun 2025
 03:22:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250617001838.114457-1-linux@treblig.org> <CAJaqyWfD1xy+Y=fn1x8uXTMQuq8ewVV9MsttzCxLACJJZg2A2Q@mail.gmail.com>
In-Reply-To: <CAJaqyWfD1xy+Y=fn1x8uXTMQuq8ewVV9MsttzCxLACJJZg2A2Q@mail.gmail.com>
From: Lei Yang <leiyang@redhat.com>
Date: Tue, 24 Jun 2025 18:21:28 +0800
X-Gm-Features: Ac12FXzfQeWK8ouZps9YTtPNR42ROlRbSB3jIfmuYcflJDxiz6fBrlpSiur_mHY
Message-ID: <CAPpAL=xgBK3qqNdaiR=OwbiMaA_5VpouE4YfaEyYghkHxJ0CtQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] vringh small unused functions
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: linux@treblig.org, mst@redhat.com, horms@kernel.org, jasowang@redhat.com, 
	xuanzhuo@linux.alibaba.com, kvm@vger.kernel.org, 
	virtualization@lists.linux.dev, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Tested this series of patches with virtio-net regression tests,
everything works fine.

Tested-by: Lei Yang <leiyang@redhat.com>

On Tue, Jun 17, 2025 at 8:31=E2=80=AFPM Eugenio Perez Martin
<eperezma@redhat.com> wrote:
>
> On Tue, Jun 17, 2025 at 2:18=E2=80=AFAM <linux@treblig.org> wrote:
> >
> > From: "Dr. David Alan Gilbert" <linux@treblig.org>
> >
> > Hi,
> >   The following pair of patches remove a bunch of small functions
> > that have been unused for a long time.
> >
>
> Acked-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
>
> Thanks!
>
>

