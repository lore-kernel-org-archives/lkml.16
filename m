Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07DE41A3155
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 05:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748236315; cv=none; b=NQ5uPOt7ryrYqnaDTL8m7sPVcCvZ5rTDyRi9bQTsXdJ5u6wHcuFZF+uSi4cv91jvf3tPRBh/T9RJIccRXCQ2prUsFSpY7LIMHYV6Dbh/TG/hw7/t33DtQL3VkRsjw64yt1BJJcd1uaZ+sX/hGCm/ul3A234bhPb4u5AWPV7x2hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748236315; c=relaxed/simple;
	bh=4DpoN7sYp3PTjm74hIgwij9fHOMm5aACDaenmUmgJOU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S6TeAHyFFAu+ryUVqc6Qb8P0NO8mqIbgu8yR06gZSdcGmtJm0Mu7SLCRXy6y4ESQK2V7OdkoeAfg5NnaEZElhVlQ2PjVjBWCc5yySZwtIM5tDEZS62dr/u68vPN67xcyy/HFO3T/pkWWn33YBqrrPH0nGiIFei059lRM8MSuUVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SCPpDUix; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SCPpDUix"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748236312;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hm8EFX3oBVzLtQdjE7Y+rPduhLbN0QlZeaN+4xj0avM=;
	b=SCPpDUixNVHKFLx+1fGe+mIDJyrb99SimEFwH+PwAEdZUb3XjMVtylXdSQPF64QdW4rzju
	PibFKwhBzpQ3wSFRTHA3HpudJbilNSrn6gXcVAQXY7czFzeqmmhL+zhgmahDRhvrTha9CC
	txPpGvPE5ZbLWXJk8L9zbSLnWejHPk0=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-583-oDE87cg8POCXu53ucwYJWQ-1; Mon, 26 May 2025 01:11:50 -0400
X-MC-Unique: oDE87cg8POCXu53ucwYJWQ-1
X-Mimecast-MFC-AGG-ID: oDE87cg8POCXu53ucwYJWQ_1748236309
Received: by mail-lj1-f198.google.com with SMTP id 38308e7fff4ca-32804a710b5so6106251fa.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 22:11:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748236309; x=1748841109;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hm8EFX3oBVzLtQdjE7Y+rPduhLbN0QlZeaN+4xj0avM=;
        b=Q1W0iAERbZNE2fYXa5YhDUkjTfXxTHs7/3sxNFDM9aiyiAfTaIZvNe1f8Wkw9IEc3W
         W09ifp26Mh7rbec9UC/tr0+H3D6zavikcZjjl72pKlTUeZuJ8dZeKzWmHTDoNv+dvBtS
         aPRU/a6En9jNz6FnaUS8doW0xAiAx74WZfucGjufEu1FY5xdOPmN6ygKoj/KJOwXEFNn
         sJT3wRgLAY33KqJ1ZYB2GJN00ppRRYJDC6s5poIHcGFu7cMyV76fyV/rYx7FVvkw9yKh
         I/5tENYV2eaPuDCXuPKgpeKxjfwMfiAEbJ2r5YY3tv+sk7r47xqHeZ3bzuV3HGC5WA4b
         Cqiw==
X-Forwarded-Encrypted: i=1; AJvYcCXQz0rDJJXqKiYDH/g/k8N3HXpNohUa2BxXA+wfwhr/d7odQcF7jl1+Q11y5xEJfKXzvwuA8AJgWJiNh1c=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPLzredB98QQcNE3stzZUPtZ2BKAsplRA2NVEPSDyZkVq5El3E
	OcODRbIQXrvVBdpavEgSw6iWv9uzzo27fcq9oNidwQjX6LvtFrhTSGJkHq0FeKbi64+clIEuRJG
	bnlZLyVAr3/3yMm+y2Csvy6/btlEqL19gEj2+t3HFxQkAVUdBRAtAovWIlCmGJWQB/g1z9bwwx3
	rnKCLjNYS5SDCu75G3tFu43uw9i2zYtZF44KzCm1pY
X-Gm-Gg: ASbGncvm+2cQ7lU8jvi2VyuwzUk3EcQn9JI2CCdlkjqzodyh55cY0G1We7+3H9Dim1+
	wBwiC8fFzgwc60gmAiBmjUXCfkNjn3DZrcnJrh6YhH434TM1QyRw72BpLD6dCzlumRV3KSQ==
X-Received: by 2002:a2e:a9a8:0:b0:30b:f775:bae0 with SMTP id 38308e7fff4ca-3295bb08af9mr20214791fa.36.1748236309198;
        Sun, 25 May 2025 22:11:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGkeoBBm0s8wnRag407w6g6VTzBbfotg1uM2hr4L9oZ5LkaVUSvEpg2AFicZaEQ2mVAlRAqBoEJbWU/D7JUBZA=
X-Received: by 2002:a2e:a9a8:0:b0:30b:f775:bae0 with SMTP id
 38308e7fff4ca-3295bb08af9mr20214621fa.36.1748236308703; Sun, 25 May 2025
 22:11:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250524061320.370630-1-yukuai1@huaweicloud.com>
 <20250524061320.370630-7-yukuai1@huaweicloud.com> <CALTww2_sxkU83=F+BqBJB29-gada2=sF-cZR98e5UiARJQuNjg@mail.gmail.com>
 <0e527b24-3980-2126-67f0-0958f2bc3789@huaweicloud.com>
In-Reply-To: <0e527b24-3980-2126-67f0-0958f2bc3789@huaweicloud.com>
From: Xiao Ni <xni@redhat.com>
Date: Mon, 26 May 2025 13:11:36 +0800
X-Gm-Features: AX0GCFv3eQO4frkeDpWCH9Sa5P5LFU16Bs3flExBAX3Dd3osDvI28iA3t2cmcC8
Message-ID: <CALTww2_wuO+uf2rf=VWvUChY1-zOdkoXPRT7dSLr69Nfkkoz8g@mail.gmail.com>
Subject: Re: [PATCH 06/23] md/md-bitmap: add a new sysfs api bitmap_type
To: Yu Kuai <yukuai1@huaweicloud.com>
Cc: hch@lst.de, colyli@kernel.org, song@kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-raid@vger.kernel.org, yi.zhang@huawei.com, 
	yangerkun@huawei.com, johnny.chenyi@huawei.com, 
	"yukuai (C)" <yukuai3@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 26, 2025 at 9:14=E2=80=AFAM Yu Kuai <yukuai1@huaweicloud.com> w=
rote:
>
> Hi,
>
> =E5=9C=A8 2025/05/26 0:32, Xiao Ni =E5=86=99=E9=81=93:
> >> The api will be used by mdadm to set bitmap_ops while creating new arr=
ay
> > Hi Kuai
> >
> > Maybe you want to say "set bitmap type" here? And can you explain more
> > here, why does it need this sys file while creating a new array? The
> > reason I ask is that it doesn't use a sys file when creating an array
> > with bitmap.
>
> I do mean mddev->bitmap_ops here, this is the same as mddev->pers and
> the md/level api. The mdadm patch will write the new helper before
> running array.

+ if (s->btype =3D=3D BitmapLockless &&
+    sysfs_set_str(&info, NULL, "bitmap_type", "llbitmap") < 0)
+ goto abort_locked;

The three lines of code are in the Create function. From an intuitive
perspective, it's used to set bitmap type to llbitmap rather than
bitmap ops. And in this patch, it adds the bitmap_type sysfs api to
set mddev->bitmap_id. After adding some debug logs, I understand you.
It's better to describe here more. Because the sysfs file api is used
to set bitmap type. Then it can be used to choose the bitmap ops when
creating array in md_create_bitmap


> >
> > And if it really needs this, can this be gotten by superblock?
>
> Theoretically, I can, however, the bitmap superblock is read by
> bitmap_ops->create method, and we need to set the bitmap_ops
> first. And changing the framwork will be much complex.

After adding some debug logs, I understand you. Now the default bitmap
is "bitmap", so it can set bitmap ops in md_run->md_bitmap_create. If
it wants to use llbitmap, it needs to set bitmap type first. Then it
can set bitmap ops in md_run->md_bitmap_create.

And it's better to explain why it's a better choice to use bitmap_type
sys rather than reading from superblock. So in future, developers can
understand the design easily.

Regards
Xiao
>
> Thanks,
> Kuai
>
>

