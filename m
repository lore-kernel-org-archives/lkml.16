Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD69E28FFCD
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 19:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744312820; cv=none; b=jCI1rCyreNVu5JhFicXVqf4fY0PfMo+mqGLc61bcj+fl7uSg5RBZfzw2Ef0U8mzFZohuIpBjKbg4qBMDj+6/AlPvFzKGL9qK26uJQ9YOaM1Fn6WIUFn1BoCKAWOhO6tpLWYij3bhVZXDRFDLFPHjpOqEJYxVn8flUZGyD8yqccE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744312820; c=relaxed/simple;
	bh=BUp6dVA/9/DIHAm8btLSsebQGLRoM6QqRKm/vQlyaG8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FLyrJfad4iBruifm5RXvEZ/ApFh9t7DgBbGFXyK3rxocSW/Y1kLiSQtzaNnjCV5q4fQRCu9+N2LNzux9fd1yEE8tFCRlmHFo4xRcDhE6Kdcn/HdFjF0bPeYgdSpKcGvK4fd6CR1ydE5ieIKqXbJQbX3NwVB4fMG0fF+NoBxXYz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AKl0sbvL; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AKl0sbvL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744312817;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7qyuCy71sNM096ptCCI9TtV8xzN/TLmJLvM6k58//nE=;
	b=AKl0sbvLTqSfaHiwBrGFiZXPzgz6TrDW4jFZVydZQfNXV2qFOwbnZnk3NqxSWL0QbzHzZ5
	x2YKKyE1jQ2MFR1BQypEqMb08hseDTX/xilnT4vfaLbF5ZlLIpPXSTbcttGfr2tQ9EobS9
	3Q8PYtYhSF5RtHgXByyTZ/l6n/6U0DU=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-375-m2lzVZa4Mr6XbYstJxfubQ-1; Thu, 10 Apr 2025 15:20:16 -0400
X-MC-Unique: m2lzVZa4Mr6XbYstJxfubQ-1
X-Mimecast-MFC-AGG-ID: m2lzVZa4Mr6XbYstJxfubQ_1744312815
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-22403329f9eso10052005ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 12:20:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744312815; x=1744917615;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7qyuCy71sNM096ptCCI9TtV8xzN/TLmJLvM6k58//nE=;
        b=Ijab1h5GcAV/HuahEm+XUNwebF9XXoercbA10WGEl8TF96rgqQWJ0XAZ15tdpaZ+cu
         MN0FBLEjgrDgM8aDWpvVFGfHzs4wzzI7S+AmTkw/fiSj3bZqoAmyHMAYcBIxVbov/PPY
         +/g/+ELI97TOWlzIjH/Pb0yjMocFHYhC7hIx3x8En018VL00/dvjZb7SEhZeNl1rkp4w
         obMh+WQtdGWgX7nbHQAvIsKXh0I4DYvOthe1Jh35oMrHOowynoIxKkK9Kpm8mqlY11Jy
         k3ARP4O3vYpDgV6xf3XWNWqKJr/cqfOo5/BV6UVf6PBjN9jkUSM+bP0p2hit/xJILskA
         y2ew==
X-Forwarded-Encrypted: i=1; AJvYcCVtUEvp2HC5ZwkT/Ftf+BA9Ro4mPdoNcVifkm80sodljI77kpJeKG3fZdSHuw8EcaBadNgciaqvH6d8MzU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwN1SgLlPxjP3pmrUuVKdKxiMgHvxBj2DasSVQXWGV14YGo7+g0
	Dihvkef4kvAz4QP/Ry6L58ItqQH8xSrqvhX/Q7IjTd3umOkQGWJwD2sRQdznHri8FbWvuVwHAYL
	z5y1SGiSlMEUf7bqPhOfKJuEirLZaeskbg2asNvbrGrq7GVPe7fLTmB6GL/4C5Tk+6aZTIJidOC
	/9nDmXnq8eB5OjsyWd0zEyBXRtf8aG3GenMqti
X-Gm-Gg: ASbGncvk0afIOkO+B/DEqsTkla1cNz6A6t1ZEuICcv/qQsvZJA5wo16s5dLMhAmCL/H
	IYW44JKwOD7D/yXetame5lCm9Od7g353FnqeNCHK20agKJaRKz/lXzRNRY3tRGtDe8FA=
X-Received: by 2002:a17:902:e88f:b0:223:2aab:462c with SMTP id d9443c01a7336-22bea4ab85fmr71705ad.15.1744312815423;
        Thu, 10 Apr 2025 12:20:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE6DNynR3qAzVJ5oYYe87012HehD64MJOEbZmJ5Zs6nbMEMT14kmxUjgfXc/J/nlg5RXQ5jsTdGAdgJRpiy1tQ=
X-Received: by 2002:a17:902:e88f:b0:223:2aab:462c with SMTP id
 d9443c01a7336-22bea4ab85fmr71525ad.15.1744312815145; Thu, 10 Apr 2025
 12:20:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407182104.716631-1-agruenba@redhat.com> <20250407182104.716631-2-agruenba@redhat.com>
 <Z_eGVWwQ0zCo2aSR@infradead.org>
In-Reply-To: <Z_eGVWwQ0zCo2aSR@infradead.org>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Thu, 10 Apr 2025 21:20:03 +0200
X-Gm-Features: ATxdqUHNINlL-pUTFVGgFjmH-0Yv2T34SdJ_H6wPly98qpm7VaT0OlGqfhHJNig
Message-ID: <CAHc6FU4J6MsEaUFUfp_ZpuYKyXRpZ=FTJE9T=iRQgbByQWZOFA@mail.gmail.com>
Subject: Re: [RFC 1/2] gfs2: replace sd_aspace with sd_inode
To: Christoph Hellwig <hch@infradead.org>
Cc: cgroups@vger.kernel.org, Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>, 
	Jan Kara <jack@suse.cz>, Rafael Aquini <aquini@redhat.com>, gfs2@lists.linux.dev, 
	linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 10, 2025 at 11:01=E2=80=AFAM Christoph Hellwig <hch@infradead.o=
rg> wrote:
> On Mon, Apr 07, 2025 at 08:21:01PM +0200, Andreas Gruenbacher wrote:
> > Use a dummy inode as mapping->host of the address spaces for global as
> > well as per-inode metadata.  The global metadata address space is now
> > accessed as gfs2_aspace(sdp) instead of sdp->sd_aspace.  The per-inode
> > metadata address spaces are still accessed as
> > gfs2_glock2aspace(GFS2_I(inode)->i_gl).
> >
> > Based on a previous version from Bob Peterson from several years ago.
>
> Please explain why you are doing this, not just what.

Right, I have this description now:

    Currently, sdp->sd_aspace and the per-inode metadata address spaces use
    sb->s_bdev->bd_mapping->host as their ->host.  Folios in those address
    spaces will thus appear to be on "bdev" rather than on "gfs2"
    filesystems.  Those "bdev" filesystems will have the SB_I_CGROUPWB flag
    set to indicate cgroup writeback support.  In fact, gfs2 doesn't suppor=
t
    cgroup writeback, though.

    To fix that, use a "dummy" gfs2 inode as ->host of those address spaces
    instead.  This will then allow functions like inode_to_wb() to determin=
e
    that the folio belongs to a a filesystem without cgroup writeback
    support.


Thanks,
Andreas

