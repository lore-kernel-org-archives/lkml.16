Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5056982488
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 16:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738341030; cv=none; b=eTEcapUDQMiWA3bAsJprMCTA+2PCf1ZyBt4iuE9KkT1cFkKSTi68MrgescsDwiuurvVcbRU2KvaRiA28m7L5tXO0mViTPyyfFmAD6VLb1t2XO8PPR5UphZKb2nK7flSmcBcv2lZsntyqFoQrcU0sT0GWftcFNs23ClayOGiXw2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738341030; c=relaxed/simple;
	bh=DnWNs2jt2xBVatLffXgilzh5QI1bvhhB2XMLb9Bvh9w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=M/EE9xBnEuUxwqf83l4sZitYMB4A6IMQKmXQEVDKI47gfLhLS4N00MDcXrcTWUQJWcXjGMxhbxf3UdX0N8y9ivWlsix5pJwl0DKwi8wozRBCW/+tOFffZPfBZcatBehMwl5S2t5QVSU1yqmrd2OwHqo9gcAtlPreDhcZ5K1Eu0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qcJV2VWx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qcJV2VWx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FF79C4CED1;
	Fri, 31 Jan 2025 16:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738341029;
	bh=DnWNs2jt2xBVatLffXgilzh5QI1bvhhB2XMLb9Bvh9w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qcJV2VWxEA5xfwjNAwdvqdLJsQBpkKOAV0aZepoTaN++NQXCP1HRRPNg9BdVFeLNC
	 K0P4LvYSjmWCFDLr89R6zIizRBE/UAZtZy5Z3n8eV5hp12H+OF+pNHQoqsh9JuLNNv
	 cTdN3dx2P/eYBJvFPT/LbC2Jg/UDJflNxhRZqb95dvz3ETnHc8PcQ4IszGjiJGqh1Y
	 UI5fSVht1neFopJQJfPxhSSgTNEVzPDBllqLnsGUZ0mTaZEKShEd6sY8+BOj7m2/uX
	 y5sJ25Doy03Ho1pAdh7is7c2EjF3fjQv/u5FYKAws4VTX+F0vRmOWRdiDgc8/4op6j
	 wIl4Ec//RzG3w==
From: SeongJae Park <sj@kernel.org>
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: SeongJae Park <sj@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Vlastimil Babka <vbabka@suse.cz>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [RFC PATCH v2 0/4] mm/madvise: remove redundant mmap_lock operations from process_madvise()
Date: Fri, 31 Jan 2025 08:30:24 -0800
Message-Id: <20250131163024.54001-1-sj@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <yp26taqjxput2k5w6jekhnexbp2isqdksckrv2jjxomxswjh6g@f57mxzd62fyt>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 31 Jan 2025 11:04:51 -0500 "Liam R. Howlett" <Liam.Howlett@oracle.com> wrote:

> * SeongJae Park <sj@kernel.org> [250116 20:31]:
> > process_madvise() calls do_madvise() for each address range.  Then, each
> > do_madvise() invocation holds and releases same mmap_lock.  Optimize the
> > redundant lock operations by splitting do_madvise() internal logics
> > including the mmap_lock operations, and calling the small logics
> > directly from process_madvise() in a sequence that removes the redundant
> > locking.
> > 
> > Changes from RFC v1 (20250111004618.1566-1-sj@kernel.org)
> > - Split out do_madvise() and use those from vector_madvise(), instead of
> >   adding a flag to do_madvise() (Liam R. Howlett)
> 
> I was waiting for a non-RFC to re-examine the series.  It looks like a
> good clean up.

Thank you Liam :)

> 
> Do you think you'll send out a non-RFC version soon?

I'm planning to send it next week.


Thanks,
SJ

> 
> > 
> > SeongJae Park (4):
> >   mm/madvise: split out mmap locking operations for madvise()
> >   mm/madvise: split out madvise input validity check
> >   mm/madvise: split out madvise() behavior execution
> >   mm/madvise: remove redundant mmap_lock operations from
> >     process_madvise()
> > 
> >  mm/madvise.c | 150 +++++++++++++++++++++++++++++++++++----------------
> >  1 file changed, 103 insertions(+), 47 deletions(-)
> > 
> > 
> > base-commit: b43ba6938d01ad4487028592109d4116a28b7afa
> > -- 
> > 2.39.5
