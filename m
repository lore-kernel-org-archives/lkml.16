Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EEFE2686BE
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 18:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744396582; cv=none; b=gLVYyg6N46AzASs9qhZKNbyxQgw42VVKA0cHyJZyHy8Or6ueeKxv944Y2znxoFciQDqqBnPNzSehMYLZMute2/gMb4TDXAzqpiY4JyHFjP84YHF/ZDSGvhuI3xVAC8iUFFxmSKHJRniS0J4rHqZ75nvs4K9SioBURHy+YWZwDvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744396582; c=relaxed/simple;
	bh=QJrJtIHq5MgqYP90HGhYDY8VuDfeMAoXcaiZ1h3hsOM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xi5qrkfTrQESM8vxOdNZJgdTDLTbM4tpMzicttzqjpzuR4JLVEHduONw/S2NAc8pEUdHh5I0NMRu9TjhW4gOIHoen6AMq5x6cJ/0ZqOd4SODRtyrIY8pHX+SxnrsfqCd2+0RUjGsJ2KSMTSlWt6Sgg0dN3yKi+Dw5QjqhD+f3Jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=YrldGmle; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="YrldGmle"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2260202c2a1so2854195ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 11:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1744396580; x=1745001380; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pf4U/s3nrzYWQj940TchtZxgSy/bJE6FrQcB/mDG+go=;
        b=YrldGmleywo/aSmNHSe/KL0KrjO+r+54Q/lONP+7al1OAy3Mf9gdnBjJPGsM28z2l0
         eQiumFe9W+bZPJZBfqfC8AEmUVZK8s8kk57pPXKRrKzx/hmHATTw86wUb2QrPSJcoDHN
         F2XnKcRHFMeg0p+0OH1vdm3RuFE24hL9oE8S+SGuD6GP8aeQExYqaLyhL0Fdb+EHLaOa
         IwlEvapofwr+ksO5MAiKPWRgvPDutTrspfpESfvzv1IsNPP/Nn9Trt40HZJ3ckGPCB6V
         47tkDv1B6ooyPzV00eHonFjtF16lPUwn8fdjW13ruIGvWzNWPqDxLRdn3KwoVjRM3RG2
         ZAvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744396580; x=1745001380;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pf4U/s3nrzYWQj940TchtZxgSy/bJE6FrQcB/mDG+go=;
        b=AL3WdgfL0d78+6UzxLDPRgWOfrtuW0Bna/FVacxyVHZ+vTdY8VRuE5ezA58QwErPne
         wp/CrzKCUlOJ0RH4m4+vl+yucMJ+oIPlnnpMSlKj94Kik46tE8ySWeeOdWgn/R85cjY4
         y5cUyn6jKNatkc83krnV4VAZ/a2Nwv9Y/VbNRrv8McgWQo5JMBrhIiI59nNXmQFwQD0v
         QtZRxByOcRUMYBgDS5rVaoK5Q/uYCSlyfqRuZX0XYxt2Qo6rBxj2ayxSHYnfXrwt58g8
         kFQGZ9PUKYNtuYoGEmPTWmifDSWD5eBQXrrA7/gsyTuhMlQM6Ph6PXv3hMGvFMzLqXec
         +9nw==
X-Forwarded-Encrypted: i=1; AJvYcCWGN5S7dEXijp8c0z0rHNoet0iVspPWu0XmfN87bOA7DLB7QXUy2o/SpLNmDKCQXDfprr3hfICorRd76YM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxOlJX8ibPkdznB7L6RVGFX2jyPf9EirN/sXGC1umvXeTQfYpJ
	pJ3DPMNPmeV8UHSo3avrMf2Lh6yX/8Y6ZSy//F88oDUAoHwy6fiWfr5EDt91jIEHgCSOAMa5F9u
	KTi+K3DnfDlw5Z7UDhIOHiZFAIMvdzIJffuzq4g==
X-Gm-Gg: ASbGnctUdEYJiWynxeZzeF/2x34x4MoGNU5gTrhhGllMHdeI9P0jLTpVZ69Zd/hzDvZ
	JU+Vb+lW0SMQTatvHNEVHmU4r4JQcvll3ka4FFXHJGUP5kV08sIHNpPB434yaA34AwUC1Ylzw3F
	wLk47sJxgoJxabuRnI505wRm1Nr33kQ2E=
X-Google-Smtp-Source: AGHT+IG3/t9DcvV7/nV+zi+y2xeV+055KSQcHp97R2aOD6RcEBSVyNJvLjVkxXItYXUgJ7YQzx3wzUDbt6HDkGWjzec=
X-Received: by 2002:a17:902:f684:b0:220:e1e6:446e with SMTP id
 d9443c01a7336-22bea4a1d32mr19857785ad.1.1744396579809; Fri, 11 Apr 2025
 11:36:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250409024955.3626275-1-csander@purestorage.com>
 <Z_eOX-8QHxsq21Rz@infradead.org> <a76ac487-564e-4b6e-89fb-9c848a398c43@kernel.dk>
In-Reply-To: <a76ac487-564e-4b6e-89fb-9c848a398c43@kernel.dk>
From: Caleb Sander Mateos <csander@purestorage.com>
Date: Fri, 11 Apr 2025 11:36:08 -0700
X-Gm-Features: ATxdqUGbj0ogZUsZOWd3AucjbewLfXyhpCwyAno3yxHM2NIkhvx7JebiSC7_ePE
Message-ID: <CADUfDZruQch9Nd9dQ2tNzFUFMPmqTrVvKK_uHrwEQ1+4oL6YZw@mail.gmail.com>
Subject: Re: [PATCH] ublk: skip blk_mq_tag_to_rq() bounds check
To: Jens Axboe <axboe@kernel.dk>
Cc: Christoph Hellwig <hch@infradead.org>, Ming Lei <ming.lei@redhat.com>, linux-block@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 10, 2025 at 6:13=E2=80=AFAM Jens Axboe <axboe@kernel.dk> wrote:
>
> On 4/10/25 3:24 AM, Christoph Hellwig wrote:
> > On Tue, Apr 08, 2025 at 08:49:54PM -0600, Caleb Sander Mateos wrote:
> >> The ublk driver calls blk_mq_tag_to_rq() in several places.
> >> blk_mq_tag_to_rq() tolerates an invalid tag for the tagset, checking i=
t
> >> against the number of tags and returning NULL if it is out of bounds.
> >> But all the calls from the ublk driver have already verified the tag
> >> against the ublk queue's queue depth. In ublk_commit_completion(),
> >> ublk_handle_need_get_data(), and case UBLK_IO_COMMIT_AND_FETCH_REQ, th=
e
> >> tag has already been checked in __ublk_ch_uring_cmd(). In
> >> ublk_abort_queue(), the loop bounds the tag by the queue depth. In
> >> __ublk_check_and_get_req(), the tag has already been checked in
> >> __ublk_ch_uring_cmd(), in the case of ublk_register_io_buf(), or in
> >> ublk_check_and_get_req().
> >>
> >> So just index the tagset's rqs array directly in the ublk driver.
> >> Convert the tags to unsigned, as blk_mq_tag_to_rq() does.
> >
> > Poking directly into block layer internals feels like a really bad
> > idea.  If this is important enough we'll need a non-checking helper
> > in the core code, but as with all these kinds of micro-optimizations
> > it better have a really good justification.
>
> FWIW, I agree, and I also have a hard time imagining this making much of
> a measurable difference. Caleb, was this based "well this seems
> pointless" or was it something you noticed in profiling/testing?

That's true, the nr_tags check doesn't show up super prominently in a
CPU profile. The atomic reference counting in
__ublk_check_and_get_req() or ublk_commit_completion() is
significantly more expensive. Still, it seems like unnecessary work.
nr_tags is in a different cache line from rqs, so there is the
potential for a cache miss. And the prefetch() is another unnecessary
cache miss in the cases where ublk doesn't access any of struct
request's fields.
I am happy to add a "blk_mq_tag_to_rq_unchecked()" helper to avoid
accessing the blk-mq internals.

Best,
Caleb
