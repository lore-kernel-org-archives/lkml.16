Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09B88238159
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 11:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743593729; cv=none; b=bISQThvUvR7oOfaeTMI/whGXdMAYO6oX/aomuZIj6IVj0u93pOv6xRmsyRNO7PYy6Vja3BE/zdeUdp401knVeUh9b4htBTgXbSDfOYaL2DqeRIykzeG98hIyhAjkXtz2jN3Bp2LVnQb11Xx5+zndiRZYxq/ggzhqUR+pAyfiuQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743593729; c=relaxed/simple;
	bh=60qC1uhCK9Nbd1nOdHDQDK0Brva/Xpk35wH1eUqSpLA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dHuvKswV8/bUSxEJcey5LEuY9ygMB+JWhy1T3cukJ4iY9iDWzDRETwzgOboyUGn18EjiGJo6M0chS4NAGFDsVVTIKj7f7RUw1H7a/x30SSIow2EMob6MpauMnX9AI7ZX7QtEaU/ae41qIuGOXhD+AGfj2OAgaZTA0YMDroDB96M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=fwfSZcgv; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="fwfSZcgv"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4775ccf3e56so7938791cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 04:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1743593727; x=1744198527; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AyTTWqWEm2Q3eGwJYvgDbaOrso7z8MzQ/iUvGLgLy44=;
        b=fwfSZcgvnodCviIEq11IERTio8ZvhmY3eJYccgGRtVaxNNztK/Pn9A2EFqhcD8nnmd
         vDlYwGqxAbvloIdhV/y/AIH63Fd0q98fOV8hjq/fIh4sH+22qL0ceh4CTpCgH0r9Kv4u
         Tnf6mz4t1siNh+d0k2MujbqHPXbOqzdjO4O5I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743593727; x=1744198527;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AyTTWqWEm2Q3eGwJYvgDbaOrso7z8MzQ/iUvGLgLy44=;
        b=t/O/9UDvCc4H5chZ5xPQPBtThguqM10KVm4f+tNG865OpQk6uU92NmO8CN9EV1gz5L
         OuLf2QEsOj/Gua0RNRw/a0jGO7F2XnT8y7LhqaBzdwAyNh3TpA2ourqqUDwGoaclU9Ln
         oTRuR0tQvvFmr9/X+bjndZ3RSK1kuwBedLfW8L9qhdYh64Ik4lwGh6aQH7ZX2VmCmSOV
         uj0NRsvSF+LO5hPoDgfM3YG3B2+Uvi3cubhB8LKKmoJiTgVhAOkqwNF8JcydQOwci7Pl
         085OH0d/CqLBAG81R6kB4aQTsImG8igNzle4p4sPQ6O9nqktKA+O6mCp/ohVGCjTAfpR
         fJBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJdk7cTL/zIboUMj1Dj7nai69jRb4s/wPg1zRV0sOTKXPJeGUzGrECtH3LpqTX7lB9tdgHfkqMBHFkNrY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5WkvJ9JhaMeFNeS44e1qw1/TNN7YRrsSZcL8zKlqUWTsxRctT
	AsJ4iA0KnbLn4UB9RPPD4kFzyRW5A9FJakeT5LzH10+phSARBV1/sZeWn98A7/ZUBiBdRY36YQn
	5yS4Fx39Yn0r+P0d35X/83i94TD2l/z5LP/mbEQ==
X-Gm-Gg: ASbGncsis9+3vqjzSsN8VPyFHaGWXdDEf7kUkhnyOVW187sBytw6fJG+eIxf0OP6nV9
	fifcJVEx8QkpDkesblsImA6EuB/rDSElV3UTsWy/5yWWbER3CEvAbafKmM3Pci0zNlHL2ow0rZn
	LZrvEY1ZNtZCUo6IoT+Umjy75daY/XSgeyYIVO
X-Google-Smtp-Source: AGHT+IHRMp3oRX4nr5ObbPYstrqf4EpD/PfBTU7jIBurT79tsvYpJoTuU01kLSBMxAxMKvB5S5LeLrZLsUOhnrSMZo8=
X-Received: by 2002:a05:622a:19a6:b0:477:1dd0:6d15 with SMTP id
 d75a77b69052e-4790ba8bf24mr25947861cf.5.1743593726924; Wed, 02 Apr 2025
 04:35:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250314221701.12509-1-jaco@uls.co.za> <20250401142831.25699-1-jaco@uls.co.za>
 <20250401142831.25699-3-jaco@uls.co.za> <CAJfpegtOGWz_r=7dbQiCh2wqjKh59BqzqJ0ruhtYtsYBB+GG2Q@mail.gmail.com>
 <19df312f-06a2-4e71-960a-32bc952b0ed2@uls.co.za> <CAJfpegseKMRLpu3-yS6PeU2aTmh_qKyAvJUWud_SLz1aCHY_tw@mail.gmail.com>
 <3f71532b-4fed-458a-a951-f631155c0107@uls.co.za> <CAJfpegtutvpYYzkW91SscwULcLt_xHeqCGLPmUHKAjozPAQQ8A@mail.gmail.com>
 <0cf44936-57ef-42f2-a484-7f69b87b2520@uls.co.za> <0b0a6adf-348e-425d-b375-23da3d6668d0@fastmail.fm>
 <f22c14e1-43d9-4976-b13e-a664f5195233@uls.co.za>
In-Reply-To: <f22c14e1-43d9-4976-b13e-a664f5195233@uls.co.za>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Wed, 2 Apr 2025 13:35:16 +0200
X-Gm-Features: AQ5f1JrS8cWmbkOF3unbLqAV0Dyuf3Q1FEluVIjHYGJx7V9tExYQkyrVWPLZrcI
Message-ID: <CAJfpegsx=_wbBtVG1wQj6ZWzEfwknJvqfLXnDONPrdUwJRVPEg@mail.gmail.com>
Subject: Re: [PATCH 2/2] fuse: Adjust readdir() buffer to requesting buffer size.
To: Jaco Kroon <jaco@uls.co.za>
Cc: Bernd Schubert <bernd.schubert@fastmail.fm>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, christophe.jaillet@wanadoo.fr, 
	joannelkoong@gmail.com, rdunlap@infradead.org, trapexit@spawn.link, 
	david.laight.linux@gmail.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 2 Apr 2025 at 13:13, Jaco Kroon <jaco@uls.co.za> wrote:

> How do I go about confirming?  Can that behaviour be stopped so that in
> the case where it would block we can return an EAGAIN or EWOULDBLOCK
> error code instead?  Is that even desired?

All allocations except GFP_ATOMIC may block (that applies to
folio_alloc() and kmalloc() too).  This shouldn't be a worry in the
readdir path.  Freeing can safely be done in an atomic context.

Thanks,
Miklos
