Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 987FB2222B2
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 15:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751556280; cv=none; b=FZT6TdkXeJ5L+hIPhmsDOWzNNgOpj0aslprFOGeMWLHznbVoJ43wfk+pEne4DTK6drim2QB4vDmGXNusKzNyIeJuVa89UjlPpTscOkq9j+VzuUY6BYPK8QBD4WtPe9KUDuyl4TWGkfua4ziXMNTu+d5aMMPfz9hyjep7bNwfXf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751556280; c=relaxed/simple;
	bh=2gBwArNGoR2l+zzof1UP/e59hmtMMmB/luiq3FZ9DMk=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qYwZC67aPLrqA0eoGWAj8oNdxYdTj58yvL37Imf0m8ucRuDAzCe6DhFjsQ+pxD0cpW5lixp24cGTs24O3bRSvetvkcPjhWRIBIhEhcWqZAJCapT6A3EZnYZ0Iq6jXFsDaHxYFcaA5SDBgd2fddMvTj2qHWdWs+E0xi38D6Odok4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IhW2gA9Y; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IhW2gA9Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751556268;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sG+S5CSkLmIudzihd+SRDW9SuS3QIem5KNDkhUYKvpo=;
	b=IhW2gA9YDWyBQUrng+P+DuiRhKF3uSaH2b8RP0lMDcdfjjhFPjvQ4PyL0G0fxOHAriICb9
	xYHeelT8O1kj6jmk3OjRQiX6IO5od6vUR7j+LWv4Gr7BoGYqDpnQ+b0K5mcSk/dVdDrMaB
	T7q02lzU+5Pb/M+ITk8YwS4WA0TcmRw=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-615-H_N4DeV4PiO-5KbT-0SXkw-1; Thu, 03 Jul 2025 11:24:27 -0400
X-MC-Unique: H_N4DeV4PiO-5KbT-0SXkw-1
X-Mimecast-MFC-AGG-ID: H_N4DeV4PiO-5KbT-0SXkw_1751556267
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4a98d1ed40aso16548961cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 08:24:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751556267; x=1752161067;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sG+S5CSkLmIudzihd+SRDW9SuS3QIem5KNDkhUYKvpo=;
        b=cCDrFUU8myZRosajc5blXgRLAcvTI1nnu0rm5WqLvl9S1EwzEO8EzbYNKUOs/i9XIM
         Vcpg9rAiSKxFjta7lAjCkcO1YGRIDaDh2fVItikw6pK4OpO0aYQX92e6Bz64Je+HbaCw
         ygu2l2z7QNU1hJwi0H2e/39cPWgKIWhXeLWhMZiqYZX36W1dfJRqud6IyxM5uL/8AfjE
         W+Gh6hgOuHEsZ8sU8F079JPFUTpLTuxzggRPEeRxWgD14k3b6NzjZ/kLk7tCHNKmtw0P
         DG8xwQ+v0ug23ZJ1Fngn+m1DAq0hmehpdECFeasDOvHPWFGQhLAZOBBNdi6C1tcxG6Ks
         mcEQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVAP3C57ooAtQyuF2nWT9blPFo1t7vNYTPs2KuUZCYbPcagCwRHa7CPAqMQVbXdOJA4zSpsOnf4T+K2jw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwJ3xpX2kkcCl1A/UT/Mmdv6BfNIlQDO2bsQeF3z2jcW1DbhFK
	HD6o8cMlPzpGqhd4aq75vIRjSjCui2f42by+BJDi51CV5jq1Cx19wRlE/nql6C7y0CAJ6+ARULr
	U/cAig4EXlhBiVED4EH3WowqDaBRgD5qYnzGRcCHAOgpMkkTmYCQugl40XDDYsV8hJg==
X-Gm-Gg: ASbGncuYF9YJRIRKXme+mDNdAVsoVPuxK+dsnOhXMEH3TXK6l9dzRmpACIQ+w3bovLL
	Va21KzuvEwoBBAUH6cfnd+4LjLDbM2MQwfIULRtK+wAT7oITRBXgKfyjyNKXh6fv0qn1NslhwmR
	1Th1aCvsu5i/dVKj4yk1C+l1kmpnlCkewYm37ZFTIv6QCjoBhslW4v7T82TlQGnYmsrsyWbgwaX
	UpcGgQB31uDGAyranpuB4MvGD13EQLY2uklmHiDxI6vf9/Snje1iuSrbAudeE6gFfrUTKiS5VuY
	YP1kQt76T8vAlw==
X-Received: by 2002:a05:622a:58cd:b0:4a9:93f0:e228 with SMTP id d75a77b69052e-4a993f0e39emr2794981cf.1.1751556266647;
        Thu, 03 Jul 2025 08:24:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEoEPaUfOTaN/I05EUqi6Tk8jbCeSg8Qi/pxZDiVrMvwj9PP62dpWGRAqEqp70a+FQIaeAPSQ==
X-Received: by 2002:a05:622a:58cd:b0:4a9:93f0:e228 with SMTP id d75a77b69052e-4a993f0e39emr2794331cf.1.1751556266189;
        Thu, 03 Jul 2025 08:24:26 -0700 (PDT)
Received: from x1.local ([85.131.185.92])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a7fc55c396sm109754811cf.50.2025.07.03.08.24.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 08:24:25 -0700 (PDT)
Date: Thu, 3 Jul 2025 11:24:21 -0400
From: Peter Xu <peterx@redhat.com>
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Nikita Kalyazin <kalyazin@amazon.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Suren Baghdasaryan <surenb@google.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, Vlastimil Babka <vbabka@suse.cz>,
	Muchun Song <muchun.song@linux.dev>,
	Mike Rapoport <rppt@kernel.org>, Hugh Dickins <hughd@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	James Houghton <jthoughton@google.com>,
	Michal Hocko <mhocko@suse.com>,
	David Hildenbrand <david@redhat.com>,
	Andrea Arcangeli <aarcange@redhat.com>,
	Oscar Salvador <osalvador@suse.de>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Ujwal Kundur <ujwal.kundur@gmail.com>
Subject: Re: [PATCH v2 1/4] mm: Introduce vm_uffd_ops API
Message-ID: <aGagpUkNogTxS7dk@x1.local>
References: <20250627154655.2085903-1-peterx@redhat.com>
 <20250627154655.2085903-2-peterx@redhat.com>
 <aaaca9d4-b8df-45b8-a3a4-a431c99f26c7@lucifer.local>
 <CAJuCfpHN6vpDx+UNPEzJgZ_qD9USTJZ_+yZzQg2BpF_aRpufYw@mail.gmail.com>
 <982f4f94-f0bf-45dd-9003-081b76e57027@lucifer.local>
 <cda7c46b-c474-48f4-b703-e2f988470f3b@amazon.com>
 <rsumpavnbe63jvfz7w63batked4obgnzmz4boeee6q3wiv7smi@rkok2a4vug72>
 <aGWmZKwcpLMfAN2O@x1.local>
 <htdtwazk66dcrfkpwh5fgtk5ruzzo2zy54i5w6kbg45lqtyect@tt22z7hcdfnx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <htdtwazk66dcrfkpwh5fgtk5ruzzo2zy54i5w6kbg45lqtyect@tt22z7hcdfnx>

On Wed, Jul 02, 2025 at 10:00:51PM -0400, Liam R. Howlett wrote:
> * Peter Xu <peterx@redhat.com> [250702 17:36]:
> > On Wed, Jul 02, 2025 at 05:24:02PM -0400, Liam R. Howlett wrote:
> > > That's because the entry point is from a function pointer, so [3] won't
> > > help at all.
> > > 
> > > It is recreating the situation that existed for the vma through the
> > > vm_ops in mmap, but for uffd.  And at a lower level (page tables).  I do not
> > > want to relive that experience.
> > > 
> > > We are not doing this.  It is for the benefit of everyone that we are
> > > not doing this.
> > 
> > Is the vma issue about "allowing vma->vm_flags to be modified anywhere"
> > issue?  Or is there a pointer to the issue being discussed if not?
> 
> The issue is passing pointers of structs that are protected by locks or
> ref counters into modules to do what they please.
> 
> vma->vm_flags was an example of where we learned how wrong this can go.
> 
> There is also the concern of the state of the folio on return from the
> callback.  The error handling gets messy quick.
> 
> Now, imagine we have something that gets a folio, but then we find a
> solution for contention of a lock or ref count (whatever is next), but
> it doesn't work because the mm code has been bleeding into random
> modules and we have no clue what that module is supposed to be doing, or
> we can't make the necessary change because this module will break
> userspace, or cause a performance decrease, or any other random thing
> that we cannot work around without rewriting (probably suboptimally)
> something we don't maintain.
> 
> Again, these are examples of how this can go bad but not an exhaustive
> list by any means.
> 
> So the issue is with allowing modules to play with the folio and page
> tables on their own.

I understand the concern, however IMHO that's really why mm can be hard and
important at the same time..

We definitely have driver code manipulating pgtables.  We also have folios
or pages that can be directly accessible from drivers.

After all mm is the core function provider for those and there needs to be
some API accessing them from outside.

I agree some protection would be nice, like what Suren did with the
vm_flags using __private, even though it's unfortunate it only works with
sparse not a warn/error when compiling, as vm_flags is not a pointer.
OTOH, forbid exposing anything might be an overkill, IMHO.  It stops mm
from growing in healthy ways.

> 
> If this is outside the mm, we probably won't even be Cc'ed on modules
> that use it.
> 
> And do we want to be Cc'ed on modules that want to use it?

For this specific case, I'm happy to be copied if guest-memfd will start to
support userfaultfd, because obviously I also work with the kvm community.
It'll be the same if not, as I'm list as an userfaultfd reviewer.

But when it's in the modules, it should really be the modules job.  It's ok
too when it's an API then mm people do not get copied.  It looks fine to me.

> 
> We will most likely be Cc'ed or emailed directly on the resulting memory
> leak/security issue that results in what should be mm code.  It'll be a
> Saturday because it always is.. :)

True, it's just unavoidable IMHO, and after triaged then the module owner
needs to figure out how to fix it, not a mm developer, if the bug only
happens with the module.

It's the same when a module allocated a folio/page and randomly update its
flags.  It may also crash core mm later.  We can have more protections all
over the places but I don't see an easy way to completely separate core mm
from modules.

> 
> Even the example use code had a potential ref leak that you found [1].

That's totally ok.  I appreciate Nikita's help completely and never thought
it as an issue.  IMHO the leak is not a big deal in verifying the API.

> 
> > > 
> > > We need to find another way.
> > 
> > Could you suggest something?  The minimum goal is to allow guest-memfd
> > support minor faults.
> 
> Mike brought up another idea, that seems worth looking into.

I replied to Mike already before we extended this thread.  Feel free to
chime in with any suggestions on top.  So far this series is still almost
the best I can think of.

Thanks,

-- 
Peter Xu

