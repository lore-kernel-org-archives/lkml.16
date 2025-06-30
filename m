Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13A801E2858
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 08:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751271930; cv=none; b=Uvs71Z4pvLz58bWybxkvYUNbql/snWrIxAMv8wGa6EZS97W6InQmMVLCGLqDEYoAbjo+oezetm2cZKnerV41eEFsX3dsLujOtdfydFBVBLVv0yPzq82OsV9XCaryzRozE5ls0pM7kfbtT3a17X+e8tFOxuQEXRL7P490c0sRciA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751271930; c=relaxed/simple;
	bh=3i7exFRMw/cozc31u51qSuQ6FVkvdtk5t2I0S/5G5wk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bS/57IUAuoSRxsERyL06kfOXlxhx2hew4Es7EAGsnB/aveIESoshBrS+V0rs1+8kOdP7jU6ZuNAn8vluCpEBfJ4WGEbWRjo5s9Qcwd1z7ee1Wz82kePuuhVU+KbuCW3bS6Zzu2vJfAXikw1/vutit3B6TqoI9ovj15ehpwFZnN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BjHZ9nH9; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BjHZ9nH9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751271928;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3i7exFRMw/cozc31u51qSuQ6FVkvdtk5t2I0S/5G5wk=;
	b=BjHZ9nH9L8eeg9R104QTxpi5vlPqV3l0IR7KV4JkfErNcIa21gm+IaVHnvD7oTKcUbYaH2
	Z0/carFcObcN6Or4fI5MXhTxWk4CcGgumiHxEYNtwK+cs0fyKX5MUjZucBghwtDR1097QY
	wI9zraXGfqW0ItoZwMRGUjgBJPEDdYY=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-103-qoAoqJkTNza8_GMSJ-dlFQ-1; Mon, 30 Jun 2025 04:25:22 -0400
X-MC-Unique: qoAoqJkTNza8_GMSJ-dlFQ-1
X-Mimecast-MFC-AGG-ID: qoAoqJkTNza8_GMSJ-dlFQ_1751271921
Received: by mail-lj1-f198.google.com with SMTP id 38308e7fff4ca-32b4a06b780so16133561fa.0
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 01:25:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751271921; x=1751876721;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3i7exFRMw/cozc31u51qSuQ6FVkvdtk5t2I0S/5G5wk=;
        b=aVNZ8qU8H7Mxs7JUDqaMWIN8zIcFMas6D36Y3D7uobUq9ldTcQO8QGUMkttxUXCWyF
         w9CQ8lD/iPVQ251Xv6yoUervjQ7QUgqyMObZamM1FC0rsi52OObSgmiDVyPP+hSz1ZKl
         zV+2XRdcI2Ag7odQ8vAYDgCWuHkrvyz0/NlP74O+odnH2dU1nDvhkHkwp4hYZ5gkrS4R
         ixk6JSX3t4a1sBIp1fdlUN5b0pnH2SL6Yv083mcXusSX+T8agMnsBSW522KGt9rgsAzA
         BeKeWB6h9/wYKvvHpznQC6nEak4BwzyGAQ37a32zubr6WO3Z/X+AkeX9ik5rmtuas1a+
         ETOg==
X-Forwarded-Encrypted: i=1; AJvYcCX7SeZKyIkS+aKb3pWDxSOIT6ubw+yHHGoH7M/2JfYyacXwsIw/XZCdEPexMQR58cLABOhwaj86pA78Xzs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsGqcfiKJ/XJI/qB61BwTd036DdWEmj8ibWvq+h75kN3HjxFid
	8WeEdjGZOZwbRNCfstXIgiPYCl+B2sffbPqERSz02Hlgogg5y76orYcoI1Q9qIEYvh+dxuGvHx6
	m41KKdWlyauxyCurI1EZbaA1WaVhwfTPkLdLZvWv7iPpDf+XTzjk4leoIBi0EyRdrL9cb7y+Hjo
	bCWSinWYvdvkulAtJtvHt/RWRRbDD3MP/Mm+e70TZz
X-Gm-Gg: ASbGncteNjCkPcXDu1dIEgOhB8pAfIiZp5Wbp8cSIGD/STKyykHxJOSCfguD2J1w33E
	FHMXa2Nf6bZarLUc7YOClOjesB0+yVBn04939d/4rPT/LUXex3eTexzM80kuSigIdjVOFpGzC/I
	2Bdorl
X-Received: by 2002:a05:651c:4117:b0:32b:755e:6cd3 with SMTP id 38308e7fff4ca-32cdc532c2cmr22541661fa.41.1751271920835;
        Mon, 30 Jun 2025 01:25:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGOD7CVZuRKH0gNSW9nJZzyhf8E2LUvK9KnuDXKhGnQuR+p0oOC4yON8e9NAf5N+eFAGQxCUQo8KCHTCYXupAo=
X-Received: by 2002:a05:651c:4117:b0:32b:755e:6cd3 with SMTP id
 38308e7fff4ca-32cdc532c2cmr22541551fa.41.1751271920400; Mon, 30 Jun 2025
 01:25:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250524061320.370630-1-yukuai1@huaweicloud.com>
 <20250524061320.370630-17-yukuai1@huaweicloud.com> <c76f44c0-fc61-41da-a16b-5a3510141487@redhat.com>
 <cf6d7be1-af73-216c-b2ab-b34a8890450d@huaweicloud.com>
In-Reply-To: <cf6d7be1-af73-216c-b2ab-b34a8890450d@huaweicloud.com>
From: Xiao Ni <xni@redhat.com>
Date: Mon, 30 Jun 2025 16:25:07 +0800
X-Gm-Features: Ac12FXxrOjnQjLYtYr_oMWC178CsZXqR9oTQxnqBCt1WFfve1EisfYIBhUPGmic
Message-ID: <CALTww2-RT64+twHo3=Djpuj81jArmePQShGynDrRtYab3c1i2w@mail.gmail.com>
Subject: Re: [PATCH 16/23] md/md-llbitmap: implement bit state machine
To: Yu Kuai <yukuai1@huaweicloud.com>
Cc: hch@lst.de, colyli@kernel.org, song@kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-raid@vger.kernel.org, yi.zhang@huawei.com, 
	yangerkun@huawei.com, johnny.chenyi@huawei.com, 
	"yukuai (C)" <yukuai3@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 30, 2025 at 10:25=E2=80=AFAM Yu Kuai <yukuai1@huaweicloud.com> =
wrote:
>
> Hi,
>
> =E5=9C=A8 2025/06/30 10:14, Xiao Ni =E5=86=99=E9=81=93:
> > For reload action, it runs continue here.
>
> No one can concurent with reload.
>
> >
> > And doesn't it need a lock when reading the state?
>
> Notice that from IO path, all concurrent context are doing the same
> thing, it doesn't matter if old state or new state are read. If old
> state is read, it will write new state in memory again; if new state is
> read, it just do nothing.

Hi Kuai

This is the last place that I don't understand well. Is it the reason
that it only changes one byte at a time and the system can guarantee
the atomic when updating one byte?

If so, it only needs to concern the old and new data you mentioned
above. For example:
raid1 is created without --assume-clean, so all bits are BitUnwritten.
And a write bio comes, the bit changes to dirty. Then a discard is
submitted in another cpu context and it reads the old status
unwritten. From the status change table, the discard doesn't do
anything. In fact, discard should update dirty to unwritten. Can such
a case happen?

Regards
Xiao
>
> Thanks,
> Kuai
>

