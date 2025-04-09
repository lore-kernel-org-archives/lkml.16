Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C95A11D54F7
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 16:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744214946; cv=none; b=oD604/JLQRV832nGKbEqzUzyt9Z9nCKJ20dPkCdwhlOuYcU/G0/77gkT+kJrmUfyU5oLDW8TNOUH1Yq0JN2menuU4okrvMnepzziCMOJN6w8SGBRtcfZTE/nRTD+OLyTpvmnjkojj4to/fjVf4fkL/pkEDDe8kbXAaKBjyVTVyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744214946; c=relaxed/simple;
	bh=OmUCUuBlmfaYCRI+35suQ8O6IFTakFO4F0FI9+UZMTA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r8u4X934P7LDrbyiFSVoilRtpLasd7xJXImk4czP27i9ApV7LwM1AXOTU+LQsxwvwo2KxJz+itzy/2c6lQkQ8NbUMTM4VqzTx/i+O7VMdIhJQ1tBO1ggmu8RQD9yryx/mZJvqDZhNbVuDAG4zHcBMOvZNpvQKFq3qtFU0OJ01c8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YmoWkR7B; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YmoWkR7B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744214943;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A/gwbs8iUTadHjheIXDz5biM7bJ/ozoAzELzVwioeRI=;
	b=YmoWkR7B/h57Ww2V81slHUESkKaMNa06a+FlmAsRXkrkbVYYcquvlJpkVWEqrSMGD84VHb
	zCvfFbIEg2C+ErvKONBGjeshGWtQ4RDrPV65xagOABMepNQ7BDv5ieZIPCaI9KYss3QguJ
	++RC1SMGvtFdCJTb0OLWoWM0+SE6n6o=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-511-6kESREA5N0m209EdL0obFg-1; Wed, 09 Apr 2025 12:08:59 -0400
X-MC-Unique: 6kESREA5N0m209EdL0obFg-1
X-Mimecast-MFC-AGG-ID: 6kESREA5N0m209EdL0obFg_1744214937
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6f0e2d30ab4so6023836d6.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 09:08:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744214937; x=1744819737;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A/gwbs8iUTadHjheIXDz5biM7bJ/ozoAzELzVwioeRI=;
        b=pbTfk18Kg126jPNCaNtQhVs+T+1TY5zKoWLOOC2t1TL2dVkxxXtIRLnjpNXhgeqqkH
         cKd1dO5J3hb2YbJfudZogU3ZkrZ3zy4HQFckTLNPy73dkKPoelD86EL55vsci+dDjd0F
         yEWLcVWxb1hBbtQ+eOLHlURLZJDlWxFinPkvsjipJ2x8LkYwlO2/sKl/EDAWM2jguMve
         lhklIYIy738hkpT3gW8nD/QbC30yMt7em5I0KY6HgJE5CoqVrpVkdqP47Aivw5tAID5s
         hDN8BSo9Lv81yKxmDyZQbYlAwJ5irZZnDNHtT64gbQol9OECPzGOhSZh94vSkXB2AZTH
         32MA==
X-Forwarded-Encrypted: i=1; AJvYcCVZ9AOT6nYRoDu05tPug84BtbfHNRrnL8r/GJV6m3xcpQ6Z0IRp89+FdpK7b+YaUrZk0M8Rl0sEa8b3RYQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOYAm7vP8RqS4/ssIY4l4kEtn7PyOYw1Ibt6wvDSxXrxDXGs8x
	nIOQ7S9tGN6QTu1R6kbnmJzFIwtpE9WhqgvrZ5sZ6gM3uDcnwGwLzMSIo9MSImzNYBgyc9YuUpq
	pxa/JFffAxIiCGGWXFmnD1n3BOqzevUBPREViQXjGiyIzDxUq0OTlEBQthyzc+A==
X-Gm-Gg: ASbGncvMDAMMr87Itrm1XPSpBAND+8DvUKtLhKzg/LCNk5YcIBr5tE3CGzaNdQJHBgw
	eNsEu/b61ElJExcKUWtD/Ui/XJv72bVpCPjds9dRfOEc6Iis76lpKTBmTgfZtrhuRDM4YsoXsZP
	J3z+a2CaaZ/9qGF5fUAhA7NdWaaDgtqqi3fuwkV2yIiaYugz4ovMV25VX83tfPofOl8Q6Z+eZsd
	OaCvUTiqsp3Kxnmasf8IE9Sp42tPabG6OzcmTCIgYDMW/FWx7kdnnkHD6PJfAHTE3JvnjAM4pIC
	vOWIOUBsGW1vWSdcpwspNcnxFyFPVgkk2eO5Z+EQsiDgiE9J3vSaMAY=
X-Received: by 2002:a05:6214:1250:b0:6e8:fa33:2969 with SMTP id 6a1803df08f44-6f0dbba3a2bmr68845496d6.10.1744214937610;
        Wed, 09 Apr 2025 09:08:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJ+xnnM6qqj7Voq8qG/1yO7IWAsw62DaLYrNEIYUDQkqDqWtsb21w6aHDcGJ+1yll6H0wd0g==
X-Received: by 2002:a05:6214:1250:b0:6e8:fa33:2969 with SMTP id 6a1803df08f44-6f0dbba3a2bmr68844966d6.10.1744214937222;
        Wed, 09 Apr 2025 09:08:57 -0700 (PDT)
Received: from localhost (pool-100-17-21-114.bstnma.fios.verizon.net. [100.17.21.114])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f0dea107a3sm8853496d6.114.2025.04.09.09.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 09:08:56 -0700 (PDT)
Date: Wed, 9 Apr 2025 12:08:55 -0400
From: Eric Chanudet <echanude@redhat.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Mateusz Guzik <mjguzik@gmail.com>, 
	Christian Brauner <brauner@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Jan Kara <jack@suse.cz>, Clark Williams <clrkwllms@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Ian Kent <ikent@redhat.com>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
	Alexander Larsson <alexl@redhat.com>, Lucas Karpinski <lkarpins@redhat.com>
Subject: Re: [PATCH v4] fs/namespace: defer RCU sync for MNT_DETACH umount
Message-ID: <43hey3rnt7ytbuu4rapcr2p7wlww7x2jtafnm45ihazkrylmij@n4p4tdy3x2de>
References: <20250408210350.749901-12-echanude@redhat.com>
 <20250409-egalisieren-halbbitter-23bc252d3a38@brauner>
 <20250409131444.9K2lwziT@linutronix.de>
 <4qyflnhrml2gvnvtguj5ee7ewrz3ejhgdb2lfihifzjscc5orh@6ah6qxppgk5n>
 <20250409142510.PIlMaZhX@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250409142510.PIlMaZhX@linutronix.de>

> > > On Wed, Apr 09, 2025 at 12:37:06PM +0200, Christian Brauner wrote:
> > > > On Tue, Apr 08, 2025 at 04:58:34PM -0400, Eric Chanudet wrote:
> > > > > Attempt to re-spin this series based on the feedback received in v3 that
> > > > > pointed out the need to wait the grace-period in namespace_unlock()
> > > > > before calling the deferred mntput().
> > > > 
> > > > I still hate this with a passion because it adds another special-sauce
> > > > path into the unlock path. I've folded the following diff into it so it
> > > > at least doesn't start passing that pointless boolean and doesn't
> > > > introduce __namespace_unlock(). Just use a global variable and pick the
> > > > value off of it just as we do with the lists. Testing this now:

My apologies, I went with the feedback from v3[1] and failed to parse
the context surrounding it.

[1] https://lore.kernel.org/all/Znx-WGU5Wx6RaJyD@casper.infradead.org/

> > > > @@ -2094,7 +2088,7 @@ static int do_umount(struct mount *mnt, int flags)
> > > >         }
> > > >  out:
> > > >         unlock_mount_hash();
> > > > -       __namespace_unlock(flags & MNT_DETACH);
> > > > +       namespace_unlock();
> > > >         return retval;
> > > >  }
> > > > 
> > > > 

I believe you skipped setting unmounted_lazily in this hunk?

With this, I have applied your patch for the following discussion and
down thread. Happy to send a v5, should this patch be deemed worth
pursuing.

On Wed, Apr 09, 2025 at 04:25:10PM +0200, Sebastian Andrzej Siewior wrote:
> On 2025-04-09 16:02:29 [+0200], Mateusz Guzik wrote:
> > On Wed, Apr 09, 2025 at 03:14:44PM +0200, Sebastian Andrzej Siewior wrote:
> > > One question: Do we need this lazy/ MNT_DETACH case? Couldn't we handle
> > > them all via queue_rcu_work()?
> > > If so, couldn't we have make deferred_free_mounts global and have two
> > > release_list, say release_list and release_list_next_gp? The first one
> > > will be used if queue_rcu_work() returns true, otherwise the second.
> > > Then once defer_free_mounts() is done and release_list_next_gp not
> > > empty, it would move release_list_next_gp -> release_list and invoke
> > > queue_rcu_work().
> > > This would avoid the kmalloc, synchronize_rcu_expedited() and the
> > > special-sauce.
> > > 
> > 
> > To my understanding it was preferred for non-lazy unmount consumers to
> > wait until the mntput before returning.

Unless I misunderstand the statement, and from the previous thread[2],
this is a requirement of the user API.

[2] https://lore.kernel.org/all/Y8m+M%2FffIEEWbfmv@ZenIV/

> > On Wed, Apr 09, 2025 at 03:14:44PM +0200, Sebastian Andrzej Siewior wrote:
> > > On 2025-04-09 12:37:06 [+0200], Christian Brauner wrote:
> > > > diff --git a/fs/namespace.c b/fs/namespace.c
> > > > index e5b0b920dd97..25599428706c 100644
> > > > --- a/fs/namespace.c
> > > > +++ b/fs/namespace.c
> > > > @@ -1840,29 +1842,21 @@ static void __namespace_unlock(bool lazy)
> > > …
> > > > +               d = kmalloc(sizeof(struct deferred_free_mounts), GFP_KERNEL);
> > > > +               if (d) {
> > > > +                       hlist_move_list(&head, &d->release_list);
> > > > +                       INIT_RCU_WORK(&d->rwork, defer_free_mounts);
> > > > +                       queue_rcu_work(system_wq, &d->rwork);
> > > 
> > > Couldn't we do system_unbound_wq?

I think we can, afaict we don't need locality? I'll run some tests with
system_unbound_wq.

Thanks,

-- 
Eric Chanudet

