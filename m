Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E4A265CD3
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 09:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744105609; cv=none; b=skVQu4/7GxT/13rUFq92N4/oZ4tpd5HVWvHWqMyIDOaEGrs2hB6UK3ICBBEHxpxjS/x418V/if0N0O/KVIwSoxz3fJX2kwto8lgoxqJ0t7QmHXy/V56Q8GHOY7ljL34A/JpgRowSuPSAC9pznmEmS1l6mTARRJUKlgjI4CtrJx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744105609; c=relaxed/simple;
	bh=kFJHApLzkjjQTZd748UbOGNjaj3R6uugruxTfXbZkHU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mnb+2bGUr+owAbPgNqIjdD0MQVaLR6O6HHYAROKWeLBvpBk63hwEvXaPJCtFtOOR+sL+j9m4L0tpNiLqzTvDbJRhsPuXb8VdeoF6LIU8rTwGrQ+2rJjLXM8Uox1QOyLIdBofUXDWtGW8rHWf6H+p60Ds6BkFb60MP35uvnt1rfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PkA6KqER; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PkA6KqER"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744105606;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kFJHApLzkjjQTZd748UbOGNjaj3R6uugruxTfXbZkHU=;
	b=PkA6KqER8YJkXNODKomHLkiuSyNXmuuEhloqMqqb9n18Hd6LQoXUEW0nqzn2m5RBzj6ZPl
	frrhwOIZRTtQiML9ZngGhmPLoBWiehrSPIrb9n3QByp9pXQE6xtKGCI2S78R0NixYRXXCy
	LZfT/eZQalOyzYNF8K/yOnGVPm50Rgg=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-355-804mxMOkNtS5pcph1npMqg-1; Tue, 08 Apr 2025 05:46:45 -0400
X-MC-Unique: 804mxMOkNtS5pcph1npMqg-1
X-Mimecast-MFC-AGG-ID: 804mxMOkNtS5pcph1npMqg_1744105604
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4767348e239so105368571cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 02:46:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744105604; x=1744710404;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kFJHApLzkjjQTZd748UbOGNjaj3R6uugruxTfXbZkHU=;
        b=p0H92cmyQ68v20JqcR5C4rjXuil5wLhmPSWbRQi7Qw9F9HwnlsPdQ/lIKTJpbnEdwF
         ZUkJj8xsm9OMseMvHUBIdVntn/gYANySd8E/FOxQdtL1zIUB9CQrx9uS/9NNqxCrjQLf
         bCHpYDixuK6HK7rHX9vNuf3JvNjbVo6aiCIXZopxPskI7cp/VWqRDb2Vb9H7/TUF2MFI
         BNCSHn86fEWJs7duBtT64PMnfc7xpZ7KkKoc1JwToYXuBmD/OjYw60XP91c65JXeleB0
         fps5Y7+yvEZsKVF5rsZoROdIHPgF3oC7zhAQkhgrmz0RDnWVcZqtN+Eksnnqf6TNFtK0
         CUKw==
X-Forwarded-Encrypted: i=1; AJvYcCWqljdygnAorj5NGdN7c5CBTduLriA70cZYgJUF+0mS8DFw8CCSx/q0I8Cm2s59dTc0w+jWDe64vOmIvH8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmbwlN5y0u/NaE2bN2aWTQw0qMHskV+2rpRrdrFG0bnHTl9EQJ
	luYjLvGWYpIwfwcO2D7S/x1qsbd3/1/fniKopRTtX7uDHfzUHdbPXZYSh/YCERQkccdk6YyPaC3
	fkC02guxJKToehgFWSPAam3nRQGxwAXN1KT/66HNiB+Km3UFRaS+6lZIsB64QCr0InPRETgzhcx
	jVgUloa9YmCfltnwr9oM9PCIU2N89lcUBJF0CX
X-Gm-Gg: ASbGnctIWa+cgyUyKKIxRzuPPiDV293aW/tp3m/3ZsY4iq1mzJLoJxDczcJoGAZMCtx
	acLR+NDtUvRXz39HwGJ9qjj+H6/xAlgOyIMGzcPj7oWXtape8qx3tXV3iHR4FIdUeGfFtIJwmCw
	==
X-Received: by 2002:ac8:5987:0:b0:477:4224:9607 with SMTP id d75a77b69052e-47930f92246mr194565681cf.12.1744105604577;
        Tue, 08 Apr 2025 02:46:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHUGe1WMgdw3266Ixamciimi7c04VwM13sorCvBAziX4GsTGnRMZpS8YF7Y0r3w9ErgRv4v1FDTdG6BwI33w3U=
X-Received: by 2002:ac8:5987:0:b0:477:4224:9607 with SMTP id
 d75a77b69052e-47930f92246mr194565531cf.12.1744105604319; Tue, 08 Apr 2025
 02:46:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250328100359.1306072-1-lulu@redhat.com> <20250328100359.1306072-5-lulu@redhat.com>
 <20250407041540-mutt-send-email-mst@kernel.org> <76a7e782-6a7c-4704-b7c1-2459254c1362@oracle.com>
In-Reply-To: <76a7e782-6a7c-4704-b7c1-2459254c1362@oracle.com>
From: Cindy Lu <lulu@redhat.com>
Date: Tue, 8 Apr 2025 17:45:58 +0800
X-Gm-Features: ATxdqUEdI-_9frRvmATT_TQ83vcEeyygOtNToq3q3kw5ZPITDti5dWdb32chlc4
Message-ID: <CACLfguXfRvLLiCF7ysidPLcn7GftU1Jyuem2Q9xr_SMGnP_16A@mail.gmail.com>
Subject: Re: [PATCH v8 4/8] vhost: Introduce vhost_worker_ops in vhost_worker
To: Mike Christie <michael.christie@oracle.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, jasowang@redhat.com, sgarzare@redhat.com, 
	linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 8, 2025 at 12:06=E2=80=AFAM Mike Christie
<michael.christie@oracle.com> wrote:
>
> On 4/7/25 3:17 AM, Michael S. Tsirkin wrote:
> > On Fri, Mar 28, 2025 at 06:02:48PM +0800, Cindy Lu wrote:
> >> Abstract vhost worker operations (create/stop/wakeup) into an ops
> >> structure to prepare for kthread mode support.
> >>
> >> Signed-off-by: Cindy Lu <lulu@redhat.com>
> >
> > I worry about the overhead of indirect calls here.
> >
> > We have the wrappers, and only two options,
> > why did you decide to add it like this,
> > with ops?
> >
> That was from my review comment. Originally, I thought we
> could share more code. For example I thought
> vhost_run_work_kthread_list from patch 2 in this thread and
> kernel/vhost_task.c:vhost_task_fn could be merged.
>
Hi Mike
I guess you mean function vhost_run_work_list and vhost_run_work_kthread_li=
st?
sure, I will try to merge these two functions in next version
Thanks
Cindy

