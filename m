Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FBAE1F153C
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 21:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747344219; cv=none; b=NJHJaE/XjUUizCXUhx/3Z2lDYzpN1mtSj4VNET6eXYWV4GWYwUPgjcSDEQXZuFzP6ych54twaCj3Lp3L4Abs/JnMuQc5juFAApGfuQ5MG8lnJqAf/6LZx+0o9fMQgfvSk46WAOhWQRP1bou5qE5yuFNyWFz/QcToMJxC5GfnHN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747344219; c=relaxed/simple;
	bh=xc0H7+YitLw06WQkPCov15qGZg4eTZD18ABgVNdRwck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vGVzdhNxjSZVFfNc02fvl3CYM3hPMYb3icfhbVm4EPYeE0uOON407KQjo8qKMSVIxaFSTlme1XdnC+YkDq6/h1PnZVdgoi6uhWBbiRpqLgJweoKyDHyiTUGh+Y7p7CKiyAoYUIeQnv3pLXcOLfzYv8zR3h0r2raF8uuNoDTVUtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LrWdKsPZ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LrWdKsPZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747344216;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xhoYdRHOw/DAgF56UmU2UQGCpyQP8HIsL6pMqFK4YkA=;
	b=LrWdKsPZrQBtHPu5tQp4VcKBtwmWhMXj+u96pzaQrZC69ZibMUVkxoweL28AAHO2NfMh6V
	Q/EwnPZ96GBG9sRvf6tmxab02hheOtxL/ZUL5KgoeNW5gX15a1YhsaXIBx1TYMsH+nDiJO
	4/Qeq0L63ytI/MxC3pxZOpvLRzEerY4=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-508-TDGsZ2QQN8GALLrlzvB3ng-1; Thu, 15 May 2025 17:23:35 -0400
X-MC-Unique: TDGsZ2QQN8GALLrlzvB3ng-1
X-Mimecast-MFC-AGG-ID: TDGsZ2QQN8GALLrlzvB3ng_1747344214
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-22e76805fecso26682145ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 14:23:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747344214; x=1747949014;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xhoYdRHOw/DAgF56UmU2UQGCpyQP8HIsL6pMqFK4YkA=;
        b=KjVIEqqaKX/97KvKSCq+jgyuh7oKXp3GliK0VNLhIBQu8KhOt6sCyk6vOWlIl1EaAI
         hYPgnjDFQNGtGdrgu4itFvqntjmpc+3YwCKaAIRw63QXFJxi3f5wrkhXxGqvHlYjegZP
         dkVM35HSnETOnA8OGpUKEPkQP67jKqx7bLaRt9+DzIyL3UvOkU0lez9NUmvSQ+cLbsvV
         sZNQK/fvNdTVRWT6P2U+ZoHwJ/sVJuCmrLhWXdpqON5yMHu1x+j/tSrUGCSsADmjKdtM
         bERm43qJDbqK/ouIm+oXd/0I6kuPIUvGd4em9h/wrQImmnVw9uzIVgwyy+PpU1aN5tSE
         HmBg==
X-Forwarded-Encrypted: i=1; AJvYcCVtTixoU5ztK4QRdhW4ykK6xsMl4BeKoccp+YhCav/AwDxnB7zOqSt8TlKFst5Zm39cJ9ukwI14WyG5zjU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4s319ASjg9pN9ek25fQd3gQAtonf4duH+G/h6433dWSPA5oqO
	fbG0IT3lVHLzLCi4du2GmQAm9wwIBcjp9lCqWWjq8OtgaCvvJV2SMRU8/SgI0nmJcq7aHLthAhl
	gSzzZ2tA5MJMQenhRu1Nd6S/RsWy675A2aLkSmjPfw3FwlFb/lSNzAS6fRI7FNXzMjQ==
X-Gm-Gg: ASbGnctqS6JOKUaelbUX4rKN3mkPG2JLRxRJpjHmP76h6QyaMXDcEHrpPjETySuznU3
	04K/wshhxD0Np0fYhaBmqL2JKkRX8Pyp47CfUsm7Ai8ph6xqarE5fYNHfwS5mju+GXACdAqnLq3
	0da6TYy+ODJMn4JlBKYGQvzYd6o3LeMY9fiIiCbgOUx+yX2cmribR8AICSxNOvtHsC8xXsUOQBD
	r28+RwhP307ZXRAzbtuJaycB8BWu1e2MQvxhwVQx9ue5TfaY3rUhts/WFlst1WODqD84p79A876
	sm5FLlow8345zD04bSj4oC4Iyqxbo/6JE6Xm7WWkvak=
X-Received: by 2002:a17:902:ea12:b0:231:c6d0:f784 with SMTP id d9443c01a7336-231de37623amr802175ad.28.1747344214279;
        Thu, 15 May 2025 14:23:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHr9w7zQDNlfZfipRAcMlpxln2q3MngshwyeAQ3v5ovu/ApwTkb9eF8fiZ55jCN+s8sZveYcg==
X-Received: by 2002:a17:902:ea12:b0:231:c6d0:f784 with SMTP id d9443c01a7336-231de37623amr802065ad.28.1747344213955;
        Thu, 15 May 2025 14:23:33 -0700 (PDT)
Received: from jkangas-thinkpadp1gen3.rmtuswa.csb ([2601:1c2:4301:5e20:98fe:4ecb:4f14:576b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ed1946sm2178145ad.217.2025.05.15.14.23.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 14:23:33 -0700 (PDT)
Date: Thu, 15 May 2025 14:23:31 -0700
From: Jared Kangas <jkangas@redhat.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: willy@infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] radix tree: fix kmemleak false positive in
 radix_tree_shrink()
Message-ID: <aCZbU41LoIqm4FBU@jkangas-thinkpadp1gen3.rmtuswa.csb>
References: <20250514180137.363929-1-jkangas@redhat.com>
 <20250514151605.9a07943954737f52e2895b05@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514151605.9a07943954737f52e2895b05@linux-foundation.org>

Hi Andrew,

On Wed, May 14, 2025 at 03:16:05PM -0700, Andrew Morton wrote:
> On Wed, 14 May 2025 11:01:37 -0700 Jared Kangas <jkangas@redhat.com> wrote:
> 
> > Kmemleak periodically produces a false positive report that resembles
> > the following:
> > 
> > unreferenced object 0xffff00000db613b8 (size 576):
> >   comm "systemd", pid 1, jiffies 4294987015
> >   hex dump (first 32 bytes):
> >     00 22 01 00 00 00 00 00 28 1c d5 c5 00 00 ff ff  ."......(.......
> >     10 e4 6c c0 00 00 ff ff d0 13 b6 0d 00 00 ff ff  ..l.............
> >   backtrace (crc 520d6e1c):
> >     kmemleak_alloc+0xb4/0xc4
> >     kmem_cache_alloc+0x288/0x2b0
> >     radix_tree_node_alloc.constprop.0+0x214/0x364
> >     idr_get_free+0x3d0/0x690
> >     idr_alloc_u32+0x120/0x280
> >     idr_alloc_cyclic+0xe8/0x1b4
> >     __kernfs_new_node+0x118/0x5a0
> >     kernfs_create_dir_ns+0x8c/0x1fc
> >     cgroup_create+0x1cc/0x8a0
> >     cgroup_mkdir+0x13c/0x90c
> >     kernfs_iop_mkdir+0x108/0x184
> >     vfs_mkdir+0x3c8/0x5f0
> >     do_mkdirat+0x218/0x290
> >     __arm64_sys_mkdirat+0xe0/0x140
> >     invoke_syscall.constprop.0+0x74/0x1e4
> >     do_el0_svc+0xd0/0x1dc
> > 
> > This is a transient leak that can be traced to radix_tree_shrink(): when
> > root->xa_head is set, kmemleak may have already started traversing the
> > radix tree. If this has happened, but kmemleak fails to scan the new
> > xa_head before it moves, kmemleak will see it as a leak until the radix
> > tree is scanned again.
> > 
> > Mark the new xa_head as a transient leak to prevent this false positive
> > report.
> > 
> > ...
> >
> > --- a/lib/radix-tree.c
> > +++ b/lib/radix-tree.c
> > @@ -509,6 +509,14 @@ static inline bool radix_tree_shrink(struct radix_tree_root *root)
> >  		if (is_idr(root) && !tag_get(node, IDR_FREE, 0))
> >  			root_tag_clear(root, IDR_FREE);
> >  
> > +		/*
> > +		 * Kmemleak might report a false positive if it traverses the
> > +		 * tree while we're shrinking it, since the reference moves
> > +		 * from node->slots[0] to root->xa_head.
> > +		 */
> > +		if (radix_tree_is_internal_node(child))
> > +			kmemleak_transient_leak(entry_to_node(child));
> > +
> 
> There is only one other caller of kmemleak_transient_leak().  Makes me
> think that perhaps a more fundamental fix is needed.
> 
> So I'll queue it for testing for now, but I won't proceed further until
> some further examination has occured.  Thanks.
> 

This patch actually breaks xarray and vma userland test compilation in
the same way Lorenzo pointed out in [1], and probably should be dropped
as well. If it sounds reasonable for v2, I can group this in with the
patch from [1] and the test compilation fix to keep the discussion in
one place. (In hindsight I should have sent them in the same series to
begin with.)

Sorry for the inconvenience caused by my oversight here.

[1]: https://lore.kernel.org/all/053ad5f9-3eee-486e-ac29-3104517b674a@lucifer.local/

