Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0CC61F3D5D
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 23:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744672735; cv=none; b=q1XIEEJgD5fJaiRzlMk90dyxd/gVqEc4vUiLgZibyQfoJRv6cYtRpVQfmfT3h0yeKHu44LaAXNCQVbfErFdd+UTKW6G9ayn8bzgGYtqDaT3IsDGs1r4UHC3B3g5Ra789i4rcxEslKwMbrtTlSwQizMio8GUQdobGWcYqFWox5pE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744672735; c=relaxed/simple;
	bh=Vpzaudbp8Y7zrbb390HW78JJPo4FnSlXlz76ZxNyXGY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I09RjoKrThqR1y99mAhHe7z49lPiDhKRj80Ax41bZ1afeSxnic39laRVp6xqEK8wX/8hukiR1+PsxtP6BezF5c2grSj/JR/OL58av0cU9xGVMz819s4fckB1uaZUrm1cMj5z8lCA8mLAgQbJ2enDpwazwmn20m3PGGM2N/Wa894=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aWCYOHIP; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aWCYOHIP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744672732;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qaoK7poL4lFt0zzKd827Q2KBVOP06dQDJUh2ihDBMGA=;
	b=aWCYOHIP9idtg8DWBhWhbzaCK/LD/4jQxJoMSdhUtm7dMsy7KfPiqWcrvnC6UHT60eH94D
	CpBqMSaYG1Xj2kx518kQ4Pf7La4hJ6xM+1ekFgvAEwXsJbv5j0EKWfSwXAJfKkuCYKmVqy
	Q+ZEc5NwhhBhzzTxb1SQhC9ueT5f1UA=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-580-0VDi90QYM4iYKkKKL9vYDg-1; Mon, 14 Apr 2025 19:18:51 -0400
X-MC-Unique: 0VDi90QYM4iYKkKKL9vYDg-1
X-Mimecast-MFC-AGG-ID: 0VDi90QYM4iYKkKKL9vYDg_1744672730
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2265a09dbfcso70445495ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 16:18:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744672730; x=1745277530;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qaoK7poL4lFt0zzKd827Q2KBVOP06dQDJUh2ihDBMGA=;
        b=hrWbPHkd+HmazGwCkLjbD1taakGZX2YHj3aOCe7Hh0McbtBLUhPf8qkDadPHXZSGZf
         RGzIs7B11I6yVrMDAuuD/PERZFdA1xTCL2+GD+BZ5CgcnN83hnNb5/qxhnowSPn+ndI/
         6/VPk9NC1sjJeYaVMJ1ZtjFuSlYUi/5mWYNep/Lyom4+h9pjMS6YLljfxGmm3cW9ce0t
         P7f1RetcPvdW8VjkMOKikz0pEfQkG2p2nOGK2RAHfNnexnRXB89Z5LAYrRc25uszJYPk
         c+D4jADlnPUO2it+veeowrnu/yV02PZObkl9ApFuLWvRZ/Psq5XVhoKQkkvZi1s2INVs
         72oQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhaPI9AXgif5fGdiLl7+IA1YVsrktr+j+HJRn3fFIAR+qUi37rC5mk18YLE+VMRHHAQznvnzNtmCQIBY0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLxh0QI9AMZTCgNWZTBVNZlFpKISZ+0TgApqfsu2r9gkCMlLcf
	uKLv1yCuKeXvnrNx7Origlq9IZ7J6xj0XjqsNkbQAtg3PpkKfxMltkXzPtcRbvzv9BvV8/vohHt
	hkea46mu2gR/rKgQTSaOl5YciiQFzTdp+Igl3sc8ZT2iYX1UDER6lug3sXCAIuHMgzCUv2P9aV4
	TxCMcphH15+rDBn04Oz2EpnL1P1l4hmhHYlmi4
X-Gm-Gg: ASbGncvgS+c/XkY44eBTyxgZGpNrkspKBVdaYJmckcSPYuTZvhRX7FHX8s0W0pE9iwD
	E40F5Qk0FmOz5u2GwRBbkTdCqOIQOIKo1OjxI6gfp2MnhJurYqjmRzM2etp33U/Wmyc8=
X-Received: by 2002:a17:902:d481:b0:220:f59b:6e6 with SMTP id d9443c01a7336-22bea495687mr151860755ad.8.1744672730489;
        Mon, 14 Apr 2025 16:18:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHTkx4rzJcGUvdjR+8IkBuWXjpb03TgR9MDlGC2OL5q8ZwLfz7AdIcQ7zVCufAPTrl8j8sJhif/5Ghk7BA8IQ8=
X-Received: by 2002:a17:902:d481:b0:220:f59b:6e6 with SMTP id
 d9443c01a7336-22bea495687mr151860555ad.8.1744672730227; Mon, 14 Apr 2025
 16:18:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250412163914.3773459-1-agruenba@redhat.com> <20250412163914.3773459-3-agruenba@redhat.com>
 <20250414144741.56f7e4162c5faa9f3fb5c2a6@linux-foundation.org>
In-Reply-To: <20250414144741.56f7e4162c5faa9f3fb5c2a6@linux-foundation.org>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Tue, 15 Apr 2025 01:18:38 +0200
X-Gm-Features: ATxdqUHmoD9wBQhxdgcyUd4MlED8R-VRCkPirnQXdbKIxEeeDfOLknsoCdUpMs4
Message-ID: <CAHc6FU5EMw_S4FHyBLRinTdDc-jh9WPOnabSdvHuVF_MPWQkMw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] writeback: Fix false warning in inode_to_wb()
To: Andrew Morton <akpm@linux-foundation.org>
Cc: cgroups@vger.kernel.org, Jan Kara <jack@suse.cz>, 
	Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>, Rafael Aquini <aquini@redhat.com>, 
	gfs2 <gfs2@lists.linux.dev>, Linux-MM <linux-mm@kvack.org>, 
	linux-fsdevel <linux-fsdevel@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 14, 2025 at 11:47=E2=80=AFPM Andrew Morton
<akpm@linux-foundation.org> wrote:
> On Sat, 12 Apr 2025 18:39:12 +0200 Andreas Gruenbacher <agruenba@redhat.c=
om> wrote:
> > From: Jan Kara <jack@suse.cz>
> >
> > inode_to_wb() is used also for filesystems that don't support cgroup
> > writeback. For these filesystems inode->i_wb is stable during the
> > lifetime of the inode (it points to bdi->wb) and there's no need to hol=
d
> > locks protecting the inode->i_wb dereference. Improve the warning in
> > inode_to_wb() to not trigger for these filesystems.
> >
> > ...
> >
> > --- a/include/linux/backing-dev.h
> > +++ b/include/linux/backing-dev.h
> > @@ -249,6 +249,7 @@ static inline struct bdi_writeback *inode_to_wb(con=
st struct inode *inode)
> >  {
> >  #ifdef CONFIG_LOCKDEP
> >       WARN_ON_ONCE(debug_locks &&
> > +                  (inode->i_sb->s_iflags & SB_I_CGROUPWB) &&
> >                    (!lockdep_is_held(&inode->i_lock) &&
> >                     !lockdep_is_held(&inode->i_mapping->i_pages.xa_lock=
) &&
> >                     !lockdep_is_held(&inode->i_wb->list_lock)));
>
> Is this a does-nothing now GFS2 has been altered?
>
> Otherwise, a bogus WARN is something we'll want to eliminate from
> -stable kernels also.  Are we able to identify a Fixes: for this?

The excess warnings started with commit:

  Fixes: aaa2cacf8184 ("writeback: add lockdep annotation to inode_to_wb()"=
)

Getting rid of them requires this change, together with "gfs2: replace
sd_aspace with sd_inode" from gfs2 for-next:

  https://web.git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git/c=
ommit/?h=3D
    a5fb828aba730d08aa6dec6bce3839f25e1f7a9d

Thanks,
Andreas

