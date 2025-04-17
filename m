Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E3972236EF
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 16:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744906744; cv=none; b=cA8LMTxZCZwbo6L7UwzJe5wtLaJnJQv2bLHJkLWjm14vsfC3lH6aU2/xncnNEANDwJBh9ugbc24L3zvElDduZTAFsAaE5Tj2PM1tQ/EtwEro1LAVwLo5NiFkLdi8C4IyNiQd3d8lBwZluFk0v7nYMkDUhXuvfyWbtWp/HiNfu7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744906744; c=relaxed/simple;
	bh=GbzL5o71nrvlxb63bfFVJesEI/8ZeQT36+CsnxSbH5E=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oP7jrGA8p0oeDylOgX9JDH2AabQ3MbronvKaoOYJqxGFFNtr9Nn1neoX6X8Oa+RZwio4lbzuqaExiZIqr/JTGK/2+QmVZA8pLQwgaV/qonotVa2gJ6xJvm5eorJjausZdm8c/CIe9aftZkJxI5KJ8Kdtn4AyYbsuuTowF+x+Qog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xx2Vo313; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xx2Vo313"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5499c5d9691so1216749e87.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 09:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744906741; x=1745511541; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vPskhcbl5jGXpRpm5GOfbaOmkWsPfCLOp03oVIAJ7es=;
        b=Xx2Vo313Oz8xxM3JFXQ5/P+Y1sWQ/iBPhv53wn8Q38ypv9IuRCfYS5URcrJ13HER5L
         hKGcDGfCzryF4ATRvZ0g/NWpfRkVW7+qMPMrkOcnuw3GVo44W3DaUGQEcpIVC/WQWXt1
         ecxnPCv6+RM8wCHxjZHM5g+dSBlx6D4vlG56Cklro87B/X0usnXLWFweA6D6hHvcTScV
         wxKpGepNnKxrYt9sSzgfSgkFh7h43b/yhZ2ZzB2sECEztiAN8wvAXakfLNpaLekPeifn
         +avorYE885kXY4ChI8RsGZzjIcvoKZ2zZA/8bWXZJffvbWagtQTPGyUhqUQwLzBQteLn
         7E1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744906741; x=1745511541;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vPskhcbl5jGXpRpm5GOfbaOmkWsPfCLOp03oVIAJ7es=;
        b=sdFp5iKhGBpy8QSgtR1qpw9g6DsD4g628N69Oz66Ip0CXwvtFrnjxpN8HXI9UTzPZ5
         aw/o8Ul7n7YR/q6a7oxXlpl6XoUYi/WCEn4fTFb30DLmwxeMRezBmybQQkdwYo85xsNO
         SQkkBtnY24jUgiLHXInISbpmMGEWhLy5HKHrFIj1TuVFetUNVmu22k5TCJYhf2uPAawm
         pM7lY5/DigECR+87y4XT9wuCOxtu0it67lS0Ux3KWRPWgym5n60BToReeLzV4XvK7DE+
         PZXvblKkEHPmdvcz+mh49srG2eqc8X3T7etLnvdJZPt1e+um4W8flG430vXmIBR3s1R2
         j1Cg==
X-Forwarded-Encrypted: i=1; AJvYcCUnTOYel2EBxWcIUdUUxPZhncKM9HkG3jKHAgR4MCVtgIrqc0yPun+ap7ev7VdoGsaMsnNoM6QjIAoTI+g=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZ0pry/m5fRFmNGKU0VdguRIhAibJKarX1Abe2/u607PD+cCrw
	W0W3OQDuFi72+BNS+dpIf0MESpqAheg21FbPMGI5GkMwmGQX3uej
X-Gm-Gg: ASbGncvNUWwn7qcJIGDg7phHfL7ScPJA3xfPhR37z5/lS+c5ThKSO+iipE5vStT8cJl
	IluPD/igj73wDR99isQIrWnL1RyznN5ThGNmsjdm4ZAeEK2InGfJHWNH/sHQ2Xujme7fdsPxS61
	bjSKFMXdNDnW7vH3j2+jo4BwVfmCL7BhIzz9fbSHuHascdeXEGDdwaUX5Z249P849B7Q9C3hLhF
	EnH2ODpeqc7q9XmjcNmMmLm1vzxMFRHmrjIO7ixcPtBL/QN5HuZGmynupwSUfVWkfRMqK2uUUGD
	TKBlUI0C30hNjDR29A1KJeHZYhyy2gv2fnweCBFdiQ3t0zHj9c+zTNsMQRf5307dI6j/
X-Google-Smtp-Source: AGHT+IHkOvyZf2qj6Whva3DMKWIH3m5oml5dy5H2yOOMPZAj11xW+Y1vBMQgJXjGLZrXAoH4U3M4aQ==
X-Received: by 2002:a05:6512:3da3:b0:542:28b4:23ad with SMTP id 2adb3069b0e04-54d64a9c1a5mr2252831e87.16.1744906740308;
        Thu, 17 Apr 2025 09:19:00 -0700 (PDT)
Received: from pc636 (host-90-233-217-52.mobileonline.telia.com. [90.233.217.52])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6dfa2e7csm2210e87.190.2025.04.17.09.18.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 09:18:59 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Thu, 17 Apr 2025 18:18:57 +0200
To: Baoquan He <bhe@redhat.com>
Cc: Uladzislau Rezki <urezki@gmail.com>, linux-mm@kvack.org,
	akpm@linux-foundation.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] mm/vmalloc.c: optimize code in decay_va_pool_node()
 a little bit
Message-ID: <aAEp8R0GcKCXtMwG@pc636>
References: <20250415023952.27850-1-bhe@redhat.com>
 <20250415023952.27850-4-bhe@redhat.com>
 <Z_-1ozajrbaVLq6m@pc636>
 <aABswErLwX7o7OXa@MiWiFi-R3L-srv>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aABswErLwX7o7OXa@MiWiFi-R3L-srv>

On Thu, Apr 17, 2025 at 10:51:44AM +0800, Baoquan He wrote:
> On 04/16/25 at 03:50pm, Uladzislau Rezki wrote:
> > On Tue, Apr 15, 2025 at 10:39:50AM +0800, Baoquan He wrote:
> > > When purge lazily freed vmap areas, VA stored in vn->pool[] will also be
> > > taken away into free vmap tree partially or completely accordingly, that
> > > is done in decay_va_pool_node(). When doing that, for each pool of node,
> > > the whole list is detached from the pool for handling. At this time,
> > > that pool is empty. It's not necessary to update the pool size each time
> > > when one VA is removed and addded into free vmap tree.
> > > 
> > > Here change code to update the pool size when attaching the pool back.
> > > 
> > > Signed-off-by: Baoquan He <bhe@redhat.com>
> > > ---
> > >  mm/vmalloc.c | 23 +++++++++++------------
> > >  1 file changed, 11 insertions(+), 12 deletions(-)
> > > 
> > > diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> > > index 488d69b56765..bf735c890878 100644
> > > --- a/mm/vmalloc.c
> > > +++ b/mm/vmalloc.c
> > > @@ -2150,7 +2150,7 @@ decay_va_pool_node(struct vmap_node *vn, bool full_decay)
> > >  	LIST_HEAD(decay_list);
> > >  	struct rb_root decay_root = RB_ROOT;
> > >  	struct vmap_area *va, *nva;
> > > -	unsigned long n_decay;
> > > +	unsigned long n_decay, len;
> > >  	int i;
> > >  
> > >  	for (i = 0; i < MAX_VA_SIZE_PAGES; i++) {
> > > @@ -2164,22 +2164,20 @@ decay_va_pool_node(struct vmap_node *vn, bool full_decay)
> > >  		list_replace_init(&vn->pool[i].head, &tmp_list);
> > >  		spin_unlock(&vn->pool_lock);
> > >  
> > > -		if (full_decay)
> > > -			WRITE_ONCE(vn->pool[i].len, 0);
> > > +		len = n_decay = vn->pool[i].len;
> > > +		WRITE_ONCE(vn->pool[i].len, 0);
> > >  
> > >  		/* Decay a pool by ~25% out of left objects. */
> > > -		n_decay = vn->pool[i].len >> 2;
> > > +		if (!full_decay)
> > > +			n_decay >>= 2;
> > > +		len -= n_decay;
> > >  
> > >  		list_for_each_entry_safe(va, nva, &tmp_list, list) {
> > > +			if (!n_decay)
> > > +				break;
> > >  			list_del_init(&va->list);
> > >  			merge_or_add_vmap_area(va, &decay_root, &decay_list);
> > > -
> > > -			if (!full_decay) {
> > > -				WRITE_ONCE(vn->pool[i].len, vn->pool[i].len - 1);
> > > -
> > > -				if (!--n_decay)
> > > -					break;
> > > -			}
> > > +			n_decay--;
> > >  		}
> > >  
> > >  		/*
> > > @@ -2188,9 +2186,10 @@ decay_va_pool_node(struct vmap_node *vn, bool full_decay)
> > >  		 * can populate the pool therefore a simple list replace
> > >  		 * operation takes place here.
> > >  		 */
> > > -		if (!full_decay && !list_empty(&tmp_list)) {
> > > +		if (!list_empty(&tmp_list)) {
> > >  			spin_lock(&vn->pool_lock);
> > >  			list_replace_init(&tmp_list, &vn->pool[i].head);
> > > +			vn->pool[i].len = len;
> > >  			spin_unlock(&vn->pool_lock);
> > >  		}
> > >  	}
> > > -- 
> > > 2.41.0
> > > 
> > Which Linux version this patch is based on? I can not apply it.
> 
> I can apply them on the latest mainline kernel, next/master and
> mm-new branch of akpm/mm.git. I checked just now.
> 
Sounds good.

--
Uladzislau Rezki
