Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666522D77FE
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 17:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751477982; cv=none; b=MdrmSJ986IVOFILL75g395hd7IZ8p46UOG/J2Q5REvRXU81dwO3U0MqR6jJuCcHrc29Fy8BIdLzj28h5leCvLYPSynBOkSDIs40bqM8N9kJNOb6plz+gPKJs+D5iDRH8G5KB+fbgYZmrVKX5rOKqWM6kNpF03BrgpWwTZRAOgNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751477982; c=relaxed/simple;
	bh=xC3trem29ncFpuycDPOC2wg+V9X41tPuhVqtAoFYkYE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cLTcUo/IHKkQI4buhWd1QAjF++2Y3L/ZqUj/eNl0/sM2n6gtKxPrcl1N3CB5SpBAlUkdXVNf2R60H7ji3RV74zRllAg3aYULP3mfSGfLA7xsAwkanJ5/K9vwJ8+qv6BDBQcIfXQQ/4i/p8XOm9quolxl41B0ENKjQ5mXUvbfx5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u+ntSw21; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u+ntSw21"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4728FC4CEEE;
	Wed,  2 Jul 2025 17:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751477982;
	bh=xC3trem29ncFpuycDPOC2wg+V9X41tPuhVqtAoFYkYE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u+ntSw21v6rPldOShijw2I+MeAYUVSV88G0JQn/QT9BfNjbjzF4oenOkjWVlpzTVw
	 Vbb+QywarWTsx+IVZcVfITHm3dvrGVFVej6QeH1XLpJgjVeUE4ycFdGqanPylKuS//
	 KvYw33vFlrIZeMtynP0AxtsseOspnKIK60lu9MQhzkjSsRy+ovaov5PymFyNZN62zY
	 66VUPIURWcBkEmZqnCBxD0e+SskBux43MOobTVHNsk25v94Ehpjo2PY5qybyyci0bv
	 GOOEi10XLNJ/8qwqanhnAjrtv5p30Vf2K6if9Hwu/RNd8czKbWX18agwMVhnOd1l5Y
	 1E+kZD2amJtJA==
Date: Wed, 2 Jul 2025 20:39:32 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Nikita Kalyazin <kalyazin@amazon.com>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Peter Xu <peterx@redhat.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, Vlastimil Babka <vbabka@suse.cz>,
	Muchun Song <muchun.song@linux.dev>,
	Hugh Dickins <hughd@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	James Houghton <jthoughton@google.com>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Michal Hocko <mhocko@suse.com>,
	David Hildenbrand <david@redhat.com>,
	Andrea Arcangeli <aarcange@redhat.com>,
	Oscar Salvador <osalvador@suse.de>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Ujwal Kundur <ujwal.kundur@gmail.com>
Subject: Re: [PATCH v2 1/4] mm: Introduce vm_uffd_ops API
Message-ID: <aGVu1Isy-R9RszxW@kernel.org>
References: <20250627154655.2085903-1-peterx@redhat.com>
 <20250627154655.2085903-2-peterx@redhat.com>
 <aaaca9d4-b8df-45b8-a3a4-a431c99f26c7@lucifer.local>
 <CAJuCfpHN6vpDx+UNPEzJgZ_qD9USTJZ_+yZzQg2BpF_aRpufYw@mail.gmail.com>
 <982f4f94-f0bf-45dd-9003-081b76e57027@lucifer.local>
 <cda7c46b-c474-48f4-b703-e2f988470f3b@amazon.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cda7c46b-c474-48f4-b703-e2f988470f3b@amazon.com>

On Wed, Jul 02, 2025 at 06:08:44PM +0100, Nikita Kalyazin wrote:
> 
> 
> On 02/07/2025 16:56, Lorenzo Stoakes wrote:
> > On Tue, Jul 01, 2025 at 10:04:28AM -0700, Suren Baghdasaryan wrote:
> > > On Mon, Jun 30, 2025 at 3:16 AM Lorenzo Stoakes
> > > <lorenzo.stoakes@oracle.com> wrote:
> > > > This feels like you're trying to put mm functionality outside of mm?
> > > 
> > > To second that, two things stick out for me here:
> > > 1. uffd_copy and uffd_get_folio seem to be at different abstraction
> > > levels. uffd_copy is almost the entire copy operation for VM_SHARED
> > > VMAs while uffd_get_folio is a small part of the continue operation.
> > > 2. shmem_mfill_atomic_pte which becomes uffd_copy for shmem in the
> > > last patch is quite a complex function which itself calls some IMO
> > > pretty internal functions like mfill_atomic_install_pte(). Expecting
> > > modules to implement such functionality seems like a stretch to me but
> > > maybe this is for some specialized modules which are written by mm
> > > experts only?
> > 
> > To echo what Liam said - I don't think we can truly rely on expertise here
> > (we make enough mistakes in core mm for that to be a dubious proposition
> > even tere :) and even if experts were involved, having core mm
> > functionality outside of core mm carries significant risk - we are
> > constantly changing things, including assumptions around sensitive topics
> > such as locking (think VMA locking) - having code elsewhere significantly
> > increases the risk of missing things.
> > 
> > I am also absolutely, to be frank, not going to accept us EXPORT()'ing
> > anything core.
> > 
> > Page table manipulation really must rely in core mm and arch code only, it
> > is easily some of the most subtle, confusing and dangerous code in mm (I
> > have spent subtantial hours banging my head against it recently), and again
> > - subject to constant change.
> > 
> > But to come back to Liam's comments and to reiterate what I was referring
> > to earlier, even permitting drivers to have access to VMAs is _highly_
> > problematic and has resulted in very real bugs and subtle issues that took
> > many hours, much stress + gnashing of teeth to adress.
> 
> The main target of this change is the implementation of UFFD for
> KVM/guest_memfd (examples: [1], [2]) to avoid bringing KVM-specific code
> into the mm codebase.  We usually mean KVM by the "drivers" in this context,
> and it is already somewhat "knowledgeable" of the mm.  I don't think there
> are existing use cases for other drivers to implement this at the moment.
> 
> Although I can't see new exports in this series, there is now a way to limit
> exports to particular modules [3].  Would it help if we only do it for KVM
> initially (if/when actually needed)?

There were talks about pulling out guest_memfd core into mm, but I don't
remember patches about it. If parts of guest_memfd were already in mm/ that
would make easier to export uffd ops to it.
 
> [1]
> https://lore.kernel.org/all/114133f5-0282-463d-9d65-3143aa658806@amazon.com/
> [2]
> https://lore.kernel.org/all/7666ee96-6f09-4dc1-8cb2-002a2d2a29cf@amazon.com/
> [3] https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git/commit/?h=kbuild&id=707f853d7fa3ce323a6875487890c213e34d81a0
> 
> Thanks,
> Nikita
> 
> > 
> > The very thing of:
> > 
> > xxx
> > <hand off sensitive mutable state X, Y, Z to driver>
> > yyy
> > 
> > Means that between xxx and yyy we can make literally no assumptions about
> > what just happened to all handed off state. A single instance of this has
> > caused mayhem, if we did this in such a way as to affect the _many_ uffd
> > hooks we could have a realy serious problem.
> > 
> > So - what seems really positive about this series is the _generalisation_
> > and _abstraction_ of uffd functionality.
> > 
> > That is something I appreciate and I think uffd sorely needs, in fact if we
> > could find a way to not need to do:
> > 
> > if (some_uffd_predicate())
> >          some_uffd_specific_fn();
> > 
> > That'd be incredible.
> > 
> > So I think the answer here is to do something like this, and to keep all
> > the mm-specific code in core mm.
> > 
> > Thanks, Lorenzo
> 

-- 
Sincerely yours,
Mike.
