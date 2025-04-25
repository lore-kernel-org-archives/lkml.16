Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C71425258
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 01:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745542830; cv=none; b=JALAkzwe6WnqZJQnb555VnLcTic7aBuNsb/zaM2snVmPEqF/e99uRFTYBKy/KPEO1qqLktrA46RHIzMsAOIyfjIxSpZL7GgupoA/IX3bCYRs4VYmSsayhKPkTNgHb7XwwWtPIaGvQMKREJBCyJG4kBC9j5No/wdvaN00CUc2wj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745542830; c=relaxed/simple;
	bh=+110KUY/xR4mN9EPy2VveR/SqdtfMuUoBJeg1u4C3tI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B+tfiN+TUkNCTuxKTVRPDIEsfcURCR6z6amSCh07XBfc2h+Up3dm5GjY6kB+gI1R0kes/K2g4erj67AOI6ycqbayx3rokb5KibSdgtAQ9mQurz2G4xPIRfBOFvid0/4YmFafwaThsMTiH1Opuf/2O3jmZfs/Vz/AG250fYmU9wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=GD/V85Ai; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="GD/V85Ai"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-224172f32b3so3473475ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 18:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1745542828; x=1746147628; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VgVKQefSPO6v/paTmlYFEPshSYpszOpPFJZJH+sNyKc=;
        b=GD/V85AiTR+POsbB2qW2YQ3H6l5tbRnMJgt1XhMjrb2owEiXdr4WxWPfr0i0DqZeVf
         9V9dIAFm0CFjPbsc41O7AmSEipxShdwATrN1+WKiEgwicIRSHrPFXTHGrEEB4d10jWNI
         33KZQjh8Gv4doz0edPUPF+K64kNkVoXhDVS2phAhsuZ+xgz6v0KWNi1N/IxyP080wTq7
         81FtQuL7M9xRFy9nNFQMG5+wBJTQHsDrBvrwEx4npe9LL5NuQG2Gror6p30ktvLMq8Nb
         pq+Tlj/pwZ7VH07KaVZM4tu6AiCb9GLTV3wDNY1kJM2uCcwCL4lIhorOVAGkLXPMYdhN
         K+nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745542828; x=1746147628;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VgVKQefSPO6v/paTmlYFEPshSYpszOpPFJZJH+sNyKc=;
        b=fSd+Hgcn7QtfgZq3oyba2aRTSpOMxR8lQoXk/ztsPs/7XLh7Q6V3H5cQOePtPJ8kgJ
         3zoF7D/w5uTiKt3npNOTt7CIUQtH3xSWRyIc0LhjDD88PJwpNubFtqgCKzwc20EuDrqx
         8IloL9fU4nMkh5UEuhC3c5w1rG6jsMOoIJR7Mk7+DUhHF39u1j9gvk50xWj/uvwGAn0t
         OWQ2uWB3jc0fVvWr3GSgaLbMAztwkVj61Or5FFDXn566hmzdhgdihNvK0PPRc9MGiQwg
         ywVbt74OyV39qFGpRHUV+5+jhE9k2MCMvkYZsFpxVnTNVG+7Dg50HEzGmf2qu/P9w/GS
         LFEg==
X-Forwarded-Encrypted: i=1; AJvYcCUmIff/WTudGoHWGtsbBedjRzqwMyl/Qj1Z0vquRPQtLhqLOs0QGWA2LXNq0vl5vuvzrop2cUOdDtG3G5M=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsH7n5IyVuLuJ1Lr0BRkgY7Q59FxxifiuEJYPZcsZ7NTCV5VxC
	WUHNYqH2wgi3O30wpNZCvYtu9qwU+f709jDEfMezmx613aiYyxlO4e9deAslR4knSo7/g7R078K
	85I2XCBUdcvMBS+Q20QA0Qs66TC/Wrle7o8JyeQ==
X-Gm-Gg: ASbGncuyrv3qBvLNqrsJAvwTONhn3UXRVkuklrlZrMSARudAVEpPwLqmHAO440Bg4Tb
	3HxqwHsm2CCADMbYzD6fwftndvnBn9BBa3QZsMr8svdw0w9d7D4TME8fISCgllH3w/j53ifOHsB
	ocOl/LxJk7lU6k8LqaycHR
X-Google-Smtp-Source: AGHT+IGCb4UYqBB8ozaTmvNC2LbrKC8acJbrLTqjrzO9z4hNn35hiWgqpQh7i/O7NLqRTJ/YYJh3Itk7bz6cJYtrTBc=
X-Received: by 2002:a17:902:d483:b0:224:e0e:e08b with SMTP id
 d9443c01a7336-22dbf155e64mr2476255ad.0.1745542827993; Thu, 24 Apr 2025
 18:00:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250423205127.2976981-1-csander@purestorage.com>
 <20250423205127.2976981-4-csander@purestorage.com> <aAoiq1AsoD-k_kp3@infradead.org>
In-Reply-To: <aAoiq1AsoD-k_kp3@infradead.org>
From: Caleb Sander Mateos <csander@purestorage.com>
Date: Thu, 24 Apr 2025 18:00:16 -0700
X-Gm-Features: ATxdqUF2Kg7I4OqvugG6rzIUHrQVccl2R2M4E_rPalYCcq-E9ht0LATbrfNqQKQ
Message-ID: <CADUfDZpDg5hXeShhd9GX70uVbqv7RU+u-grf7S8j2qdgFXDxYw@mail.gmail.com>
Subject: Re: [PATCH 3/3] block: avoid hctx spinlock for plug with multiple queues
To: Christoph Hellwig <hch@infradead.org>
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 24, 2025 at 4:38=E2=80=AFAM Christoph Hellwig <hch@infradead.or=
g> wrote:
>
> > +static void blk_mq_extract_queue_requests(struct rq_list *rqs,
> > +                                       struct rq_list *queue_rqs,
> > +                                       unsigned *queue_depth)
> > +{
> > +     struct rq_list matched_rqs =3D {}, unmatched_rqs =3D {};
> > +     struct request *rq =3D rq_list_pop(rqs);
> > +     struct request_queue *this_q =3D rq->q;
> > +     unsigned depth =3D 1;
> > +
> > +     rq_list_add_tail(&matched_rqs, rq);
> > +     while ((rq =3D rq_list_pop(rqs))) {
> > +             if (rq->q =3D=3D this_q) {
> > +                     rq_list_add_tail(&matched_rqs, rq);
> > +                     depth++;
> > +             } else {
> > +                     rq_list_add_tail(&unmatched_rqs, rq);
> > +             }
>
> This might be moe efficient if you keep an extra iterator and never
> mode the request for another queue.

Sure, will do.

>
> > +     }
> > +
> > +     *queue_rqs =3D matched_rqs;
> > +     *rqs =3D unmatched_rqs;
> > +     *queue_depth =3D depth;
>
> .. and I'd return the queue depth here instead of making it another
> output argument.

Okay.

>
> > +static void blk_mq_dispatch_multiple_queue_requests(struct rq_list *rq=
s)
> > +{
> > +     do {
> > +             struct rq_list queue_rqs;
> > +             unsigned depth;
> > +
> > +             blk_mq_extract_queue_requests(rqs, &queue_rqs, &depth);
> > +             blk_mq_dispatch_queue_requests(&queue_rqs, depth);
> > +             while (!rq_list_empty(&queue_rqs)) {
> > +                     blk_mq_dispatch_list(&queue_rqs, false);
> > +             }
>
> No need for the braces in the inner while loop here.

Old habits die hard :)

>
> The other caller of blk_mq_dispatch_list loops until the list is empty,
> why don't we need that here?

This loop does continue calling blk_mq_dispatch_list() until queue_rqs
is empty. And the outer loop keeps repopulating queue_rqs until the
entire rqs list is empty. Am I misunderstanding you?

Thanks for the review,
Caleb
