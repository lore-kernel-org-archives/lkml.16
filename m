Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CBA31FECCD
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 07:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749108976; cv=none; b=dA8U5936bRpJliyl+WwZqPqMpahp24rQXpuDcmK8LGx9eCT/Vz0Jfhar1VtITEKMt2OIo4lJNpg1m86YhlhUMKYz9Ab2IIAOYW8TocST2SqWQs9Ffd5v8Xu2EZcUjVx1J9rkT2Z8qeLIk447LF5VVPp+fFLGvYRER00YdIg3cLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749108976; c=relaxed/simple;
	bh=sbqnBmXp4Y55lx0p4/uF+T2QN9aG6Xvg1aq1aLpduzg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V7jRcEEYMprGgH/woDPLJeO8XX1hLEeX7lFMlYAEXUuErO6xDiibfdQMTOEiFxjFqZgiIFXZZ3dFQvyuaUmObB8lpEEGRu4ycmwL4JHBmuVAYMugdeU0IxnaalZ5DFNgVaamU164wnzUg6OcV46JJ8ZqPHW6QGYBZ8bNp/hviC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Hk0ptOS9; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Hk0ptOS9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749108974;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9UEFyEH5OwZcCtsgCpmVtI26aMMlVVtISZXT0NgO0q8=;
	b=Hk0ptOS9mdcCjvb/qcTiS6M75nE9TUO1HyhNkzfgqw3O/LiRh6ec9ZQHgCXGrZTTFPknsR
	/if8cqGovZ8URN/RJAwJv8fNBsyBXDvC0Bk70x9mPG4mfcxXS5DZiNauQ3Ce7MdZ/jx5mZ
	EAEjBgyxAKwGjDVrJwdDocjBKBjk1Fk=
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-171-OZ0Su8sIObeF6XjzmCUkng-1; Thu, 05 Jun 2025 03:36:12 -0400
X-MC-Unique: OZ0Su8sIObeF6XjzmCUkng-1
X-Mimecast-MFC-AGG-ID: OZ0Su8sIObeF6XjzmCUkng_1749108971
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-4e59628a333so113847137.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 00:36:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749108971; x=1749713771;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9UEFyEH5OwZcCtsgCpmVtI26aMMlVVtISZXT0NgO0q8=;
        b=KD48qWXw5eYAQRjtqbLpiMaf/RYXitdtDjCUHSVcNGDkPamFgD2/3ox55hnIGRRl/1
         We66Tvl0nCSVj8MxqVFhQqq4LCs9EKUwYS74aJwccGjicyIpAzwrE4ByafPEtKGbaNV1
         69+XAlqIgNbE2YXbVLaXE7mVUTZ1YaqBM+U7fhsKUOia0gCvTlnv3g/OaBzR0KiNdYzB
         LM24sH+CjU+nmUzrZ5ponXwOiEGflxNOf2buMzHIeeYZjZ1Q//xgwoWffV5qoyAGSszh
         Pc42yzbg2goW3VhqMckQQgLwjd3B6OyqSyciSYisoRjb7Bg7lgBo1SOHmNLeCpU46s1c
         9ryw==
X-Forwarded-Encrypted: i=1; AJvYcCWun7EAP9I8i8PHrHn1v8Hfs1jOizZfwz9L96cmVCyXuM5o6d0noJKbtUZsDtveCKThnemM6ZYAsLBfQtw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+VaZjJxFQqUoj2BDZ5kALwUExVX7usKI0O4dUMT489LU0q6eZ
	jjpQbsYCfk1yCUPB1QTpZFzFu4ijWPrboPkHwi50y8ds/cGnMMU6g9JrYLqiwjNM5kKyy5I4yYW
	0NvL6SRKyjh3UN5jO1M6Dy6lQ2JV/YY+tWgyoXuBOwj1EWIlh4YmfENlBImdonBrpeDM9AhSIvs
	uhCkvhFEQOZBdjCpbiL92we3nI//WF8DxJLphYsgKR
X-Gm-Gg: ASbGncv5Lbb9XQzy+mWAycHad6FvATwdkvzozMKTscXvDxYVmBQ3w1E8apCIaz1as4V
	KbDejrF3nJBC+VZQOVoavLT7VtrkBOFfUGoH0G0/bHcWCKAvGMtJS95OmXr592QpJ3Uj06w==
X-Received: by 2002:a05:6102:4192:b0:4c3:64bd:93ba with SMTP id ada2fe7eead31-4e746d2f409mr5002982137.11.1749108971349;
        Thu, 05 Jun 2025 00:36:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFhmZvNcFSJRPa1f5R1qRbR6ezlxjfGxuvM5sbmFEDudxzciE5vcVcY/k1vcxfX+gPEARM47nbeOoiyidVDKrY=
X-Received: by 2002:a05:6102:4192:b0:4c3:64bd:93ba with SMTP id
 ada2fe7eead31-4e746d2f409mr5002971137.11.1749108971045; Thu, 05 Jun 2025
 00:36:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250531095800.160043-1-lulu@redhat.com> <20250531095800.160043-2-lulu@redhat.com>
 <20250603073423.GX1484967@horms.kernel.org>
In-Reply-To: <20250603073423.GX1484967@horms.kernel.org>
From: Cindy Lu <lulu@redhat.com>
Date: Thu, 5 Jun 2025 15:35:34 +0800
X-Gm-Features: AX0GCFvt-W8mHusNUhum5I6p4CStc_YDVayaIlpCDLj8gPpi1rBVSY1KA3nbyKQ
Message-ID: <CACLfguV_2Mhy-kxha5nK-GRRge1UZKYJ+21DWOhUFQ5cigeVSw@mail.gmail.com>
Subject: Re: [PATCH RESEND v10 1/3] vhost: Add a new modparam to allow
 userspace select kthread
To: Simon Horman <horms@kernel.org>
Cc: jasowang@redhat.com, mst@redhat.com, michael.christie@oracle.com, 
	sgarzare@redhat.com, linux-kernel@vger.kernel.org, 
	virtualization@lists.linux-foundation.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 3, 2025 at 3:34=E2=80=AFPM Simon Horman <horms@kernel.org> wrot=
e:
>
> On Sat, May 31, 2025 at 05:57:26PM +0800, Cindy Lu wrote:
> > The vhost now uses vhost_task and workers as a child of the owner threa=
d.
> > While this aligns with containerization principles, it confuses some
> > legacy userspace applications, therefore, we are reintroducing kthread
> > API support.
> >
> > Add a new module parameter to allow userspace to select behavior
> > between using kthread and task.
> >
> > By default, this parameter is set to true (task mode). This means the
> > default behavior remains unchanged by this patch.
> >
> > Signed-off-by: Cindy Lu <lulu@redhat.com>
> > ---
> >  drivers/vhost/vhost.c |  5 +++++
> >  drivers/vhost/vhost.h | 10 ++++++++++
> >  2 files changed, 15 insertions(+)
> >
> > diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
> > index 3a5ebb973dba..240ba78b1e3f 100644
> > --- a/drivers/vhost/vhost.c
> > +++ b/drivers/vhost/vhost.c
> > @@ -41,6 +41,10 @@ static int max_iotlb_entries =3D 2048;
> >  module_param(max_iotlb_entries, int, 0444);
> >  MODULE_PARM_DESC(max_iotlb_entries,
> >       "Maximum number of iotlb entries. (default: 2048)");
> > +bool inherit_owner_default =3D true;
>
> Hi Cindy,
>
> I don't mean to block progress of this patchset.
> But it looks like inherit_owner_default can be static.
>
> Flagged by Sparse.
>
sure, will fix this
Thanks
cindy
> > +module_param(inherit_owner_default, bool, 0444);
> > +MODULE_PARM_DESC(inherit_owner_default,
> > +              "Set task mode as the default(default: Y)");
>
> ...
>

