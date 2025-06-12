Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F09AE1F2361
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 06:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749708819; cv=none; b=Aqeq3e5mTyxp7EoZztcSOfDbcJuWCkxwxf6yfCKsKZnbP9YDTotwcY6UZiIn63a+6uJqe1mTlregITw5OL6gLgRUMvjGMMaq6kBMy8dc8y1DP5YlG0612o4Y3nV5OmH+v8vpFUxp2uN/PDs4UzN4OXpo8UxNQrOreP2KVCiy8cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749708819; c=relaxed/simple;
	bh=howSff6VWPDUG/8EwAo2gdsK+umwDc6lyF7pREy9114=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UEBR2KMwn9rnkWMXYyV0TDq/Pi17ZDj9cjnmIFPIIu2TnO9tCYT50SbFYR2EA7Ozz/Z/QnfEgL7JxlKYqi8VCwN8tgFVn2K6klMS/hqcjnUKWv/LjuZB9Pt8bu2fAlvjEB5O3e2r2Zt/GrTUOYwqmwyLD0Ekr0gfadrFPu9BemI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=W9OwK7FF; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="W9OwK7FF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749708816;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P/EyBBdquzcHxre0zmx4LK4Tl/qvbbDBPGbd2Tyb9e0=;
	b=W9OwK7FF5pIOZNuGJ6Wi+gDFofvyj+LuyIBViXF+B+AKfO8RU6udjymw0YX9nFhCVwvFdU
	ve+rJI6eRDoAaTs5lN8D2cYTTSSBJhPZIdYn3slGC6IBhg5MkWt2ima5DjMRaG9bjR+6Ed
	oSl3NrNlf7uA0tSQ01FA16N1K2jIZ1g=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-61-feOsE_liNTWnR7fKqB06Dg-1; Thu, 12 Jun 2025 02:13:34 -0400
X-MC-Unique: feOsE_liNTWnR7fKqB06Dg-1
X-Mimecast-MFC-AGG-ID: feOsE_liNTWnR7fKqB06Dg_1749708813
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-311ef4fb5fdso551857a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 23:13:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749708813; x=1750313613;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P/EyBBdquzcHxre0zmx4LK4Tl/qvbbDBPGbd2Tyb9e0=;
        b=c+ygLWBUxYbWc5SOpIdJaZ6WNHFptgMtHYSFGZpYw6kcXPiePSm/T21EZuzcZh353c
         EOcr6PrRSoOX4+mIhdmWlpF8hZmH23poToTk4K1EiMlPTLQnfb/8E5sHJ2S7eAPUiZa7
         SvzQ1EOk6spJgLKpU2p6PVirUW9W2AqX8OcLs/BzEBqyWWt3mHv++vDyWWtQqflK2Ohz
         5y5tGcuzFIBg+KTkqLxISj87/nuRBw74Ow8fIyDCpFEYVCqy3FPLmcymu/DMH7LBZs5G
         JLp52uIuOYc0EPY1Y0ElAQJUBdGTWumpOU4Z7ZrX20DjO41utNCvPbZzr6QrmTkIDrru
         Ge4g==
X-Forwarded-Encrypted: i=1; AJvYcCUGzXJpjFyBt8RwAoLgQtomSfg3RPmEsDSu+e7VXHWUzdKkvdLkZSmc4xbpz2ALHZEyI9VsuS/aIrJWeNE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzcwZgjfjNxrDI3yxYvWWljDNd3zezlajo9QbYQVACn5w2lfEm+
	N7MLJP5RDsHhT2HHE169LytdxflySNbfXKsINi7FSaAMMeFzSoxCqaAAQSc3ql/pYf3sNSbFLxN
	EMRzPkB4iuk9jkzgufbV9f05YShjD5QL81ivhrohS5EvVrBMccUtXVzfqZh0jPuNLc0cUac/B06
	FheAR5N50qn/yBrFdRI0LXal4xuafQr9TiRiXmUI+x
X-Gm-Gg: ASbGncuj8GbjbuxTE5RTUVZ/q3BFXUTZi41861Unbo+nWBbkeCBoLpQDyspvptF+V+M
	NIb8uNStjWFAYP9Ef6J03FV1Z4/t2p/DITuGfa2DunOpwi/d/KPq7Fpj/1ZKzgYmBu9dajlWeHH
	7Nh0T6
X-Received: by 2002:a17:90b:4a85:b0:311:f30b:c18 with SMTP id 98e67ed59e1d1-313af0f8588mr8593831a91.4.1749708813290;
        Wed, 11 Jun 2025 23:13:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRSfn+DFX99Kt8GYBgrMAVtWhiGSmX+yj9Fd1EztN/3C7R1B2uqWnhW/ZwV2Dfc16GV/gaDsxvGQ2v4NwVoR4=
X-Received: by 2002:a17:90b:4a85:b0:311:f30b:c18 with SMTP id
 98e67ed59e1d1-313af0f8588mr8593813a91.4.1749708812881; Wed, 11 Jun 2025
 23:13:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250609073430.442159-1-lulu@redhat.com> <20250609073430.442159-4-lulu@redhat.com>
In-Reply-To: <20250609073430.442159-4-lulu@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 12 Jun 2025 14:13:19 +0800
X-Gm-Features: AX0GCFtAQ6KdmUMQlRn5ycdH_MpDkwuSBIM378dLZRqlkkpE6VbNRTu4Uei-gEI
Message-ID: <CACGkMEtB_8PRt1Ag0mXV7ycTv1KG_c2PT283hnYukRJrG6h2YQ@mail.gmail.com>
Subject: Re: [PATCH v11 3/3] vhost: Add configuration controls for vhost
 worker's mode
To: Cindy Lu <lulu@redhat.com>
Cc: mst@redhat.com, michael.christie@oracle.com, sgarzare@redhat.com, 
	linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 9, 2025 at 3:34=E2=80=AFPM Cindy Lu <lulu@redhat.com> wrote:
>
> This patch introduces functionality to control the vhost worker mode:
>
> - Add two new IOCTLs:
>   * VHOST_SET_FORK_FROM_OWNER: Allows userspace to select between
>     task mode (fork_owner=3D1) and kthread mode (fork_owner=3D0)
>   * VHOST_GET_FORK_FROM_OWNER: Retrieves the current thread mode
>     setting
>
> - Expose module parameter 'fork_from_owner_default' to allow system
>   administrators to configure the default mode for vhost workers
>
> - Add KConfig option CONFIG_VHOST_ENABLE_FORK_OWNER_CONTROL to
>   control the availability of these IOCTLs and parameter, allowing
>   distributions to disable them if not needed
>
> - The VHOST_NEW_WORKER functionality requires fork_owner to be set
>   to true, with validation added to ensure proper configuration
>
> Signed-off-by: Cindy Lu <lulu@redhat.com>

Acked-by: Jason Wang <jasowang@redhat.com>

Thanks

