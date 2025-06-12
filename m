Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 221651D7999
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 06:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749708799; cv=none; b=aEQcuQc6JP5LuZGIirpeY/jb+sJ9kaarrj+J+oGBC5Ijn+caj+3OjbP4VKgrYH6WGt6hJOpeZWe/Zq9UyDksBOMMHbT0CEJqyKmw++D/rlVTFTFwC5FbNwdbQHg3T+RKYN0nB6XfqmS7eQqaKdkeUr1JGqKJIxa++6wjbfbJ+tI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749708799; c=relaxed/simple;
	bh=EJKWY9PXO9AEb/f1L2N3iMJtGt3gECQJ/G5K4KX8CuU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IWBtyC1sKlIxXIOFwElyI2VpnFplNE97JTQatk+ApzAiNSPxKSLvC+V8vjbLBmQMru4gzZFkN+uMsiIWNdHDZdvPdb0olacX12pj79H59j1kE5fWVK7/AxW8Cgtxmi6/LeYUxUTjLKeh+4JnbVC2oOi+I08Umwm9oPuqt5zgUPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=I/hKtq33; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="I/hKtq33"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749708796;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=In8v1EfpVjcg2E248nCE4I3xXAAON+cdnDkylyyJFH8=;
	b=I/hKtq33tqeRJciOT7PkDckL4+FUPoeNpsmDwdBY8nv+FrKeFtLBWnLF4aQ1QCe08Bq1WH
	wfe7ZaFYpKmgVplylJLvOFjZlbW7Lgse4QoW+PBEg+CqFhE61y724qTLwwEtgdeBCUaetq
	vSdU+x3fvgglP2n4M7zh7UBh6hbVN+M=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-551-G0DVnRZLM8mxaoi4B5MVpw-1; Thu, 12 Jun 2025 02:13:14 -0400
X-MC-Unique: G0DVnRZLM8mxaoi4B5MVpw-1
X-Mimecast-MFC-AGG-ID: G0DVnRZLM8mxaoi4B5MVpw_1749708794
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-74847a38e5eso431563b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 23:13:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749708793; x=1750313593;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=In8v1EfpVjcg2E248nCE4I3xXAAON+cdnDkylyyJFH8=;
        b=E4D/wEXAxHwSmmUvMQ7noQdAXVGE7EWh+trqwkQ19Pm2tebJiSIQTSEgcq97Bizyur
         KPgarsUtQk/9NAjA3g5HGyoCL6IIFO1YlxHAlZ7A5Hu1sLZAJj5wKCM0hdxIJw+AMjMv
         inyaUmsk5LsNQGWf0z/CdFjeepeCTrSSCrgR7U0JxkLIcm4yFxjHsLeH7CopgMyQMb1L
         UWyRIXT12dC0qVC/pvmayt17RXOS7877xW6ClNJ92v5L+C89QI7+qONR/UgHpngRCVU8
         cECbGJp3tnK1vU01ORF/7JfS+hBoiQElNby1khfM/Gd+j2NRTx1Jop+yyA3UHYP4RHYD
         9Oeg==
X-Forwarded-Encrypted: i=1; AJvYcCVD4yGGNu1Ey7gF3gbyxQPJG2jZX6UU/9PGqw2f935v0EDc3zggTClaNhHnK8zoDyGRfpqAHGZq9Kec8wk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBiufMp01r22cd3Mr7L3TPpGxL/qmuj6gPby8bSrie74Wr91I8
	ZXu2h8FPynz39YmIorfbQ/2DBvh3z+fYLGJ3bbUA32BkB8rX9+WP/vZHfG3QAI7js+vWgszNzxr
	jWPra1v77++RoFborio+1ZXxkvQmRo5EDdjGs6o8GZA1bkOeUWIarD87nK+OcRjAA/yXtITKT60
	6PSmc6TVEVg9oaizPIQt2RbmVUpc3x/bqWywFxJjsc
X-Gm-Gg: ASbGnctG6cWR3OetyWFX6RgZdyY8AMDgRt70217d0fYXmbyrvaG4bKu52nJ7a9zR/yh
	LjhK8LkXqPJd/vjAGbrzWohPFoTP/HtOrvtu2jLIfBiNrPLPC0+pPYuAehKERWeXQn/ohwaso0l
	ynGBXq
X-Received: by 2002:a05:6a00:189b:b0:736:450c:fa54 with SMTP id d2e1a72fcca58-7487e10153dmr2269234b3a.6.1749708793576;
        Wed, 11 Jun 2025 23:13:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG6GGvfSmuAQ9kMEV18/KRIrYuFrvcTgJ6zriYOViLm9mz7ikKRvCvtL51y/UBgyEUqoyUT9U0TXEnim8kM7c4=
X-Received: by 2002:a05:6a00:189b:b0:736:450c:fa54 with SMTP id
 d2e1a72fcca58-7487e10153dmr2269210b3a.6.1749708793175; Wed, 11 Jun 2025
 23:13:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250609073430.442159-1-lulu@redhat.com> <20250609073430.442159-3-lulu@redhat.com>
In-Reply-To: <20250609073430.442159-3-lulu@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 12 Jun 2025 14:13:00 +0800
X-Gm-Features: AX0GCFvcFRxL8oSigntqa1RjBnlkRGKNKVefC9UxsmF9GK_By08eLAA_95tszrM
Message-ID: <CACGkMEvargUzv3DpAYZ+wS1fi_kNVmXppcX0Qtmy85F22z=OLw@mail.gmail.com>
Subject: Re: [PATCH v11 2/3] vhost: Reintroduce kthread mode support in vhost
To: Cindy Lu <lulu@redhat.com>
Cc: mst@redhat.com, michael.christie@oracle.com, sgarzare@redhat.com, 
	linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 9, 2025 at 3:34=E2=80=AFPM Cindy Lu <lulu@redhat.com> wrote:
>
> This patch reintroduces kthread mode support in vhost,
> It also introduces struct vhost_worker_ops to abstract
> worker create/stop/wakeup operations.
>
> * Bring back the original vhost_worker() implementation,
>   and renamed to vhost_run_work_kthread_list().
>
> * Add cgroup support for the kthread
>
> * Introduce struct vhost_worker_ops:
>   - Encapsulates create / stop / wake=E2=80=91up callbacks.
>   - vhost_worker_create() selects the proper ops according to
>     inherit_owner.
>
> This partially reverts or improves upon:
> commit 6e890c5d5021 ("vhost: use vhost_tasks for worker threads")
> commit 1cdaafa1b8b4 ("vhost: replace single worker pointer with xarray")
>
> Signed-off-by: Cindy Lu <lulu@redhat.com>

Acked-by: Jason Wang <jasowang@redhat.com>

Thanks

