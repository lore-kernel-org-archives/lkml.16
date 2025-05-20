Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1702822DA1A
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 13:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747749109; cv=none; b=WwPsyTsMwnq1WKKLZIoZk4o0evmyxfUN20TmPk6v505wcX68rXMiCvAJtYx71tR8W3mFXssUwIFBb16Qxf0EvrOvS/xrl5b4qABjbhVStEdyCK3ifR8pUb9QqtuFEUTQWK9pEpVZZms/S77uDI1fBjGgVZ7ow6UV6H1GD7s15P4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747749109; c=relaxed/simple;
	bh=TVCkMz1PSDe4S7yhc/tithH5AzRFmuvDZGLQ5LkjNBs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R4NWQAtuT5wmnExWcGXEzbL91RoIigfNuQ4EAbbAOIXK2ajaJ2tER2OW+xHDdtJNgNHRQsbhNfkpTgaoi1ylqNMZKO+mcb25a4454ZSroNIeF1rCHyvyLGm5w5CzsV2hOur1VrExKOdDPE2T7PJfkncXzvdQHi1YVLtkwo7Jlwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAB5AC4CEE9;
	Tue, 20 May 2025 13:51:47 +0000 (UTC)
Date: Tue, 20 May 2025 14:51:45 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Jared Kangas <jkangas@redhat.com>, willy@infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] radix tree: fix kmemleak false positive in
 radix_tree_shrink()
Message-ID: <aCyI8T2sWlPLEYZ_@arm.com>
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

On Wed, May 14, 2025 at 03:16:05PM -0700, Andrew Morton wrote:
> On Wed, 14 May 2025 11:01:37 -0700 Jared Kangas <jkangas@redhat.com> wrote:
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

The other user is iova_depot_pop() where a struct iova_magazine object
is temporarily unreachable. But you have a point, we could try to change
the heuristics a bit to reduce such false positives. The only way to
guarantee is to use stop_machine() during scanning but that can take
minutes, so not really feasible.

We do have some heuristics as the checksum calculation that works well
for doubly-linked lists. However, when the reference to an object is
moved from one location to another while the object itself is not
updated, this won't be caught.

That said, the current logic updates the checksum when it was found
unreferenced (potential leak). If the object was referenced in
subsequent scans, the checksum remains intact, so minutes later it may
be seen again as a transient leak. Something like below should reduce
the transient leak reports (though not eliminate):

diff --git a/mm/kmemleak.c b/mm/kmemleak.c
index c12cef3eeb32..b1460c64f4b1 100644
--- a/mm/kmemleak.c
+++ b/mm/kmemleak.c
@@ -1408,6 +1408,12 @@ static void update_refs(struct kmemleak_object *object)
 		/* put_object() called when removing from gray_list */
 		WARN_ON(!get_object(object));
 		list_add_tail(&object->gray_list, &gray_list);
+		/*
+		 * Reset the checksum; the object must be unchanged between
+		 * two consecutive scans where it was unreferenced
+		 * (color_white()) in order to be reported as a leak.
+		 */
+		object->checksum = 0;
 	}
 }
 

-- 
Catalin
