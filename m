Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 311D8256C7E
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 03:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745204908; cv=none; b=COlEvD2fr0wXqe25rP7fWgUIgDMfwGStBF4s3kUg0V6+AbD05m/P3odvlqVKtokG30CfPFGMX8yeW3ih166SCIcuE5skrhGg/YBT3/opu28gvvAzk4Uwrb7LBuPNiZqzGfwi3GkQzgesDsqIxDWYRmwo7nW9g7gWPwDWLAzIrlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745204908; c=relaxed/simple;
	bh=8hivAmNLcvTNx0c/bREHx35jQBHl8GSDmzWxh1wjb3U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l5Jtu5uPKt0lRwrxSZZl9S9NOaAOxGZkseW1dA/J7bGiQhey3d6nlXuwIZlpSWOfEy5vX0FSIqGRUfCHosjQ5gFRkXJXq3SZT84bVPe+kbOqbimJKi7Y8ETy/mcwlyy27o9tGnVh1F6a7+plWXxgUOi7D7boNIjPY4la9LpUnmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UW6GV+fw; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UW6GV+fw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745204906;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8hivAmNLcvTNx0c/bREHx35jQBHl8GSDmzWxh1wjb3U=;
	b=UW6GV+fwZZhTr7QodkMg1SIyfGOrtej31lBc7bqQ3qAsPFZaWxnELj998hgMVufpcSP5Up
	f+IyIV0//noJhAVV8vgbcvgZ/H104XvG+WYn6YevcjiuoJ+TxtaDJAmtSvvdHltqRIS+dE
	Dj8SKS7mCiSdSRNNWHqRXppAal8+JOw=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-316-hDsaeY42PhKJFEoGq-AaBg-1; Sun, 20 Apr 2025 23:08:24 -0400
X-MC-Unique: hDsaeY42PhKJFEoGq-AaBg-1
X-Mimecast-MFC-AGG-ID: hDsaeY42PhKJFEoGq-AaBg_1745204904
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3055f2e1486so5317768a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 20 Apr 2025 20:08:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745204903; x=1745809703;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8hivAmNLcvTNx0c/bREHx35jQBHl8GSDmzWxh1wjb3U=;
        b=BE9LXoGn23VOO2Cd/4XznxK7dX98r0EuIcZHZdCBSYiRPL9YX2AGIkOgRqJii4PK2Z
         n1IXCg43UFWnsz2PFc127J2daLKqdaMWg0nA8JqKrAuPDM1E/e5BTW9fSo4nXAfog1Bp
         K/R+xDuBnIqrV7AAwNP8c3ydUX8DXsdSb/Yfxw2JqOY9qAezkEeBYeXbHqNQKyFiCx0D
         0lLR13iadtTwnSl/RaiXCUTbCFl7KbqXrD/+hzlyzVEKwXj/IilhDJftJ83RrrQ5cH6N
         hYMD/jwKsb2I6kSl4fwbtpNO7rcNiI71horm5XvKnvjfruVimXWINvT7GWzM+f7W7oj8
         bz5A==
X-Forwarded-Encrypted: i=1; AJvYcCXcYDyj1jRV25r9Kv9hT2xG/24qN1fe20O4oFFfivVULZ+JDGWxIigMaqfq3cvGhHmRSbJJdHv7hdHtMoc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDxOTNPs8g/mwo2Y9oV7gYv7S4owD1wgGKFl0OaGvFXpTB8KXa
	dYvzbysqnHXW7B3wqTseKeYxnC5+gOcJmVDJR+tsmfhnLQbvxRE3pItj7bHel6Q7xaybUDIFpPo
	e2C5qh/3c7xU4Jak6f93KzIyhgkUzs+vv23fHa1+nhlrd+zDGKGDye1hDtEXrhMza1gFvPkCBlW
	SXt9sWnABE59rYhTZaEWnOuD541ShmJFOCkNmWq8Bm35ti+/4=
X-Gm-Gg: ASbGnctQQVzvmDqlxOvYBcDjsihcMyAhNNAx948H68LDKpiQzpAWF/JF9GrSm6Xmc5B
	ET6RcpKitOTRFxfrhwGMorkYAZ5khG/hsriyNmrwfawqWG72j9veeAQzBZt9QOgpnnu9Usw==
X-Received: by 2002:a17:90b:2ec3:b0:2ff:4f04:4261 with SMTP id 98e67ed59e1d1-3087bbc9485mr12662283a91.34.1745204902901;
        Sun, 20 Apr 2025 20:08:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHsGZidodHER7DPx6AJsb5qX7z5X9GlyzJiQZloe3T04D2Jm+L8lzs+jE/AE1c2bmOaTmkFYJEYHB7563A5Hac=
X-Received: by 2002:a17:90b:2ec3:b0:2ff:4f04:4261 with SMTP id
 98e67ed59e1d1-3087bbc9485mr12662267a91.34.1745204902583; Sun, 20 Apr 2025
 20:08:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250403063028.16045-1-dongli.zhang@oracle.com> <20250403063028.16045-5-dongli.zhang@oracle.com>
In-Reply-To: <20250403063028.16045-5-dongli.zhang@oracle.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 21 Apr 2025 11:08:10 +0800
X-Gm-Features: ATxdqUFK2T-i_sGgdtK1QZ96gsa3IRjAzlkSfDUbg2Xu7DWrfBlUunqWMett7BA
Message-ID: <CACGkMEsU2nnTD7akj8im+UBYMjbyyUSAq7U9+uVS8_USAK81eQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/9] vhost: modify vhost_log_write() for broader users
To: Dongli Zhang <dongli.zhang@oracle.com>
Cc: virtualization@lists.linux.dev, kvm@vger.kernel.org, 
	netdev@vger.kernel.org, mst@redhat.com, michael.christie@oracle.com, 
	pbonzini@redhat.com, stefanha@redhat.com, eperezma@redhat.com, 
	joao.m.martins@oracle.com, joe.jin@oracle.com, si-wei.liu@oracle.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 3, 2025 at 2:32=E2=80=AFPM Dongli Zhang <dongli.zhang@oracle.co=
m> wrote:
>
> Currently, the only user of vhost_log_write() is vhost-net. The 'len'
> argument prevents logging of pages that are not tainted by the RX path.
>
> Adjustments are needed since more drivers (i.e. vhost-scsi) begin using
> vhost_log_write(). So far vhost-net RX path may only partially use pages
> shared via the last vring descriptor. Unlike vhost-net, vhost-scsi always
> logs all pages shared via vring descriptors. To accommodate this,
> use (len =3D=3D U64_MAX) to indicate whether the driver would log all pag=
es of
> vring descriptors, or only pages that are tainted by the driver.
>
> In addition, removes BUG().
>
> Suggested-by: Joao Martins <joao.m.martins@oracle.com>
> Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>

Acked-by: Jason Wang <jasowang@redhat.com>

Thanks

