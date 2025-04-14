Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FAC41FDA89
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 23:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744672970; cv=none; b=mw7mBFrJlj2tyOZ43RMFbakvsHJjB5SQ04f5tgnCPrUkqFyeYf+Sairrv/0WZO/xS796FNzBUP+fqQ9DrXsUZLj2GS1VO/NRAw14lp+QZwkqoDwE/aIxUKIfNHCK7uJLK0SWxZSf5VeyreIQw05kMDzdWS0NeuVckcyEeVApQrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744672970; c=relaxed/simple;
	bh=4DnMfpFmbLxGeVz6jjMyOFFoUcbKIrrGS/xuWDmkbAk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uLES6iLgGsjVupdKubdzaz1v4bAXIrEDLG6xT6ytpwSAPr4UTGFYNps4afIsKHt1J6PwPJ/5+I073sQiJq0bZRHuYjIZbxXJmnqokGC8gQwujEIX5cCSzeDZzsEAKdZCoeGY469Db2cxwHupqjFl3dGP5ceUQ6GcfxGz8oCKId0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JJqBs7PS; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JJqBs7PS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744672965;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fTqOfhVMO3oX7s5hEfhf7N6UJGTux5HLcHvFLo78+oQ=;
	b=JJqBs7PSrBmiufQah1P44eStGPSNhhLSorTcTqmPkl5LzyFnPzvX1XvtCwjWEAr1EfIgF7
	uUprQ3Pj/CSPRhkybySu5rR0aOukDct0u+ovODA17fX8Jb/jSD86YtkjknRSUbGwOmG5Zg
	i4J50Hlkj0+d11gB9Xdvor6kAvPTnqE=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-269-yj4tU8dlMoaos9VIbHrIuQ-1; Mon, 14 Apr 2025 19:22:44 -0400
X-MC-Unique: yj4tU8dlMoaos9VIbHrIuQ-1
X-Mimecast-MFC-AGG-ID: yj4tU8dlMoaos9VIbHrIuQ_1744672961
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-225429696a9so62518595ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 16:22:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744672961; x=1745277761;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fTqOfhVMO3oX7s5hEfhf7N6UJGTux5HLcHvFLo78+oQ=;
        b=c+LA/Uv3r0GINuSkPwHV1FgqGugrQk1/ZlJK8EQfg7KwxJ86vLRQDzjZg1zEDBtXTB
         hooga83CCBwBmG42U0osWOD8uZYWgp6IZwOKMuNmvXU4N8r+hO6V9zMsRDnpMUIe/Btz
         Zss7nnv1b/gil713VJ8FraQINn6GI9N7PkqjjqBQ5LEVCdj6K/qCOwt6buRh8CMdYBOQ
         8Cv0ZSYLXAaCE2gO8D5voDDQKHW0FKI8QwNCPbeYsUoDd3GnrWYwFW5p5575A0wd2wfW
         UzcaBBTsSA6JoFIBPyyR/jVmbVB/vavrWakuq/3py0vWO6kt6O05fo9CFyAifwEReOkz
         c4JA==
X-Forwarded-Encrypted: i=1; AJvYcCVSii7Pb3fn6dxDJOHhljaqXLbL/Pt6v58VVRn1tQWE+6KozdPR6FFQRb0lWn33QTKsU3swKZ0OC1eEZ5Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJ/UBSU7aCBy7YGh8Nk1AoKaEINM1BMSlLGvEP8XccjhDkCYCl
	R07uF3ILHL8CqM2VGMehNb7f35BGTWB+1aLTxKPCMV6g4RdIHT09pnbV6r2AC/fZl4DMjTOtVcE
	A8vbwc8r43+qcnzM5rpNqKhioQhUCrNYi501bQjt2V4dWiGUxhD5hvb0xs4TuEZzcWiyKvnAn4t
	hT8v6m/sgt3IcepSqAOvly/CCh4OsspKf5h8LL
X-Gm-Gg: ASbGncvouWuaAqb9vfyI1wBKaEfoZFE94A3ZijnDYAN9Y+BZXQ+nKdYIC2vkxPpa+I3
	M/gFGhAg1Ks51FzlT6TRip9ogBkY4RWox+ji/5gTf6eKDu9FODm+sKLzYRTQPFCU03Po=
X-Received: by 2002:a17:902:ea10:b0:21f:1202:f2f5 with SMTP id d9443c01a7336-22bea4a1e41mr165046165ad.8.1744672960903;
        Mon, 14 Apr 2025 16:22:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG1AHsKSZHKc3ZG9l2EOP9IVYFBrGDAU7Mxy/wvMCYvA1yfGQ8huWiBkzCVojnxML9vlgqyT86Cp7v0R0BshkY=
X-Received: by 2002:a17:902:ea10:b0:21f:1202:f2f5 with SMTP id
 d9443c01a7336-22bea4a1e41mr165046005ad.8.1744672960646; Mon, 14 Apr 2025
 16:22:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250412163914.3773459-1-agruenba@redhat.com> <20250412163914.3773459-3-agruenba@redhat.com>
 <20250414145120.6051e4f77024660b43b72c8a@linux-foundation.org>
In-Reply-To: <20250414145120.6051e4f77024660b43b72c8a@linux-foundation.org>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Tue, 15 Apr 2025 01:22:29 +0200
X-Gm-Features: ATxdqUGev3hKkKP_xReo0nZ3C7cPj6MnUdmVFecbVAT6bl5u52ieWp2nkeKtLgg
Message-ID: <CAHc6FU4CAzrNO24izcwYXFt-K0WFUdM6y0bAzmW6nb1CS0sexg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] writeback: Fix false warning in inode_to_wb()
To: Andrew Morton <akpm@linux-foundation.org>
Cc: cgroups@vger.kernel.org, Jan Kara <jack@suse.cz>, 
	Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>, Rafael Aquini <aquini@redhat.com>, 
	gfs2@lists.linux.dev, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 14, 2025 at 11:51=E2=80=AFPM Andrew Morton
<akpm@linux-foundation.org> wrote:
> On Sat, 12 Apr 2025 18:39:12 +0200 Andreas Gruenbacher <agruenba@redhat.c=
om> wrote:
>
> > inode_to_wb() is used also for filesystems that don't support cgroup
> > writeback. For these filesystems inode->i_wb is stable during the
> > lifetime of the inode (it points to bdi->wb) and there's no need to hol=
d
> > locks protecting the inode->i_wb dereference. Improve the warning in
> > inode_to_wb() to not trigger for these filesystems.
> >
> > Signed-off-by: Jan Kara <jack@suse.cz>
> > Reviewed-by: Andreas Gruenbacher <agruenba@redhat.com>
>
> Yoo were on the patch delivery path so there should be a
> signed-off-by:Andreas somewhere.  I made that change to the mm.git copy
> of this patch.

I guess that's fine as long as Jan is credited as the author.

Thanks,
Andreas

