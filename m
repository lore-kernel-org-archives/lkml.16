Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95BC2216605
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 07:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744098922; cv=none; b=f+PbG96DobQy4OGabJ/dNlYStHAtu1dpYOqu+rsrhgfSf6NAkUwG8HJ5i757oS7Pm80S3F00Mx54oe+cMC/x8D+k2p+a0XMoA/I8P33tB9Aldxwi8A0GeAfQNfn7rzomNCZyOoUHT0FHa/z9wHR1pdBvoWsq58A0CwxfPUMmrB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744098922; c=relaxed/simple;
	bh=A8OsWXAueBE0PuEQC4ic4IQiibJGAlkVcpHSS3VZ8iE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QgPA5tkF1NYxytZycUZQJ5Kw/bFOACSHRVVFlR9ZwuICtq9YmKFpfrROdmSIFgUBuAFD19D7F+G39vx+/D1VJkL/SAdhVW0elmmdDaJfaZjRqFjr4ZzqNrfpr464rk883gMstg8mFl1u4YGVSurix6Xj77Q+LGFMH273YzvoDOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Z0rQnJuF; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Z0rQnJuF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744098919;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x79QHpIfsA+l7691cd5z+VO+/jgiyth1028qKXbzGKk=;
	b=Z0rQnJuFphvtXmoGngJgvbsRcLH90ZkUew5biWjqFf5XXxpKLyba3UsM+ufRLgWotF7q6r
	DgbMqCqwqeLOv7r3WBFfQTuAQ/Y5Gw6HhRfRskIaONWeqyRfMSvjU7/SUYuzLijj2ALg1q
	7pY55fap6OlgXXftmY4gTsDV9ju0aC8=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-441-M4smaJV9N4qyQiDibetfTQ-1; Tue, 08 Apr 2025 03:55:18 -0400
X-MC-Unique: M4smaJV9N4qyQiDibetfTQ-1
X-Mimecast-MFC-AGG-ID: M4smaJV9N4qyQiDibetfTQ_1744098917
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-ac3e0c13278so501905466b.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 00:55:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744098917; x=1744703717;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x79QHpIfsA+l7691cd5z+VO+/jgiyth1028qKXbzGKk=;
        b=lVlDtGZJ2S493YJEXR2au4IV8aWMAbxan3ZgXW9udpbnH3PKXm+uHOhuBRQLZWqqEF
         HxlQiQLEXRFYrG77qIXzi6TwSUwLe+AQV87AYM+ncoL+9wFMQTouZdtiX71WrO0Sepvu
         45PEFCQX52bN63rqJKNd8aNNAx+bmSszGETkSjZhPj2VkspY4HIjbETm9Fl5+AZe6NIf
         k2e0kPIpUWMWYHV2Oo4E9WjZT/PdcHIFCwM8W012gaK1XT/qrDLUf6DpljS3rDyxI6yh
         LFb7NEZVnUtLJ05QvwjBuWcTD9uVDRXjZkAa9K4pQvPMtU/uTAVRA7F0Xwe5D60z32K5
         Rqrw==
X-Forwarded-Encrypted: i=1; AJvYcCWHV0t3/hWkA5KRdhMV3UuniCJuJcdd3lFvalgMKUP+al/9dOTb+irdLWdQdwArxV0LGeWduZzZpuMV1xw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxzJKLm9NtsXGDuA4Ru0Bm2ISnTDvtkvLJhrAbjIFR7zHCy/uiq
	Ts5aY+vEW2ClpuTZTjjzvww030leqhGV63Wm37wR6v63sX6AhEnnEHIqIDpFJrLK7eX7FsEJ95U
	I4ml2N5tDXPlKuThk9BCJSHfDH3xjKkyPqjNAWOEpCNeoSC6z1GzP+LPiJeEQCfVCJ+h+gwgmrV
	xAaNv6dytPiT72bQ5zORgvQEbmh71C7xyLXdS/
X-Gm-Gg: ASbGncv+EuVfr94RDiHt5YxjNYBG9JGRMKK9EzOj6DF0IJrZXweoiEyTg1xdJXgNu1M
	WtpfS28Wqd6cENAAYqjuEemxeN7jxRPPAqp6tlpSxhWuaaUum7nXTIQ0YvZw3WXIfwELa3/Gw/g
	==
X-Received: by 2002:a17:907:970b:b0:ac6:edd3:e466 with SMTP id a640c23a62f3a-ac7d6d03dc7mr1243224566b.19.1744098916910;
        Tue, 08 Apr 2025 00:55:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHsrjWeGBerTieJ+ttyB1gK4msQNk0ahMdt0piWop09SNP4zpG8Otx87xRRHmyaRFy0Bq4LVDJzBGSQoM5E+Po=
X-Received: by 2002:a17:907:970b:b0:ac6:edd3:e466 with SMTP id
 a640c23a62f3a-ac7d6d03dc7mr1243221566b.19.1744098916535; Tue, 08 Apr 2025
 00:55:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250328100359.1306072-1-lulu@redhat.com> <20250328100359.1306072-6-lulu@redhat.com>
 <8c87752e-bffe-4cc0-b838-cb6486b6261d@oracle.com>
In-Reply-To: <8c87752e-bffe-4cc0-b838-cb6486b6261d@oracle.com>
From: Cindy Lu <lulu@redhat.com>
Date: Tue, 8 Apr 2025 15:54:39 +0800
X-Gm-Features: ATxdqUFbbN4Q5UKXqEkcU4pBHlwr8BYd3yOQUAtnTFpNUfmJCvAF1MhDr_dM47Y
Message-ID: <CACLfguWQD5yMBOQLhMh1rt5FoqdfJtmBiHaC3y9g7p1f5q9zRw@mail.gmail.com>
Subject: Re: [PATCH v8 5/8] vhost: Reintroduce kthread mode support in vhost
To: Mike Christie <michael.christie@oracle.com>
Cc: jasowang@redhat.com, mst@redhat.com, sgarzare@redhat.com, 
	linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 8, 2025 at 12:04=E2=80=AFAM Mike Christie
<michael.christie@oracle.com> wrote:
>
> On 3/28/25 5:02 AM, Cindy Lu wrote:
> > +static int vhost_kthread_worker_create(struct vhost_worker *worker,
> > +                                    struct vhost_dev *dev, const char =
*name)
> > +{
> > +     struct task_struct *task;
> > +     u32 id;
> > +     int ret;
> > +
> > +     task =3D kthread_create(vhost_run_work_kthread_list, worker, "%s"=
, name);
> > +     if (IS_ERR(task))
> > +             return PTR_ERR(task);
> > +
> > +     worker->kthread_task =3D task;
> > +     wake_up_process(task);
> > +     ret =3D xa_alloc(&dev->worker_xa, &id, worker, xa_limit_32b, GFP_=
KERNEL);
> > +     if (ret < 0)
> > +             goto stop_worker;
> > +
> > +     ret =3D vhost_attach_task_to_cgroups(worker);
> > +     if (ret)
>
> If you go to stop_worker here, it will leave the worker in the xa above. =
I
> think you need another goto to unwind that.
>
sure, will fix this
Thanks
Cindy
> > +             goto stop_worker;
> > +
> > +     worker->id =3D id;
> > +     return 0;
> > +
> > +stop_worker:
> > +     vhost_kthread_do_stop(worker);
> > +     return ret;
> > +}
> > +
>

