Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E54229117B
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 22:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746483441; cv=none; b=EvXEqJ1vftePSZs5T87iiT2+f3kzd7vMp7G1qN5m0IYgJTjX668kBXzDBh+RyrWGEex5cjSSbe5cAHYl7iqCcvm5QrDGsY/a4f9lV4AhK7HViyrkOpKlxHcsa3X03SXtva/QrViOiUa0q+Yep8Org12E22bibBwm4zh/BxzCSTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746483441; c=relaxed/simple;
	bh=e+x5rAREwkTIbErn1FtZKoq2Pz1fycajN7srH/QekG0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lnoud/pipaO5ZyqFZNNTot3WRCjVZPxCMxgaTz3FGNOZPsbiPuoOsowHOWAWHQMxJfovnFVhcZBso5Bs4dx8kt0qJMTM3Dn3JMWPw9+ABDvKWK8qyNnt/FlrawHnuYpAfZWQwM9na5m0nVCjDuamQfnAeFOI2qPGey70ljPPJgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fromorbit.com; spf=pass smtp.mailfrom=fromorbit.com; dkim=pass (2048-bit key) header.d=fromorbit-com.20230601.gappssmtp.com header.i=@fromorbit-com.20230601.gappssmtp.com header.b=qV3SXqIG; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fromorbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fromorbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fromorbit-com.20230601.gappssmtp.com header.i=@fromorbit-com.20230601.gappssmtp.com header.b="qV3SXqIG"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-736b350a22cso4129345b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 15:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fromorbit-com.20230601.gappssmtp.com; s=20230601; t=1746483439; x=1747088239; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MERLGTHs/RrtUtLm0v7jU2OTI0wGhvJkJK+5yu5RY+8=;
        b=qV3SXqIG8LOTyNh8LMsmf6TL1js4N26rFfID3fboiAPaafDbrKKC7wU9AJmA8muXm9
         6JIap6KwzRdUT2qL5WCrY5KYBfo8+VRMsg/R8vYBN6W/323+dvqa8YT7wwWtgTbYIUIr
         dKIvv9VbMvZczuE+mvCr4o22HPbEZV7OXr8aUJvwS7dcnp/cjXe8MS8GsXptml/9+hB5
         6Rr0jJvhirFAF5d0+B6CsOCCOBsnJYXIqfUWN+8ace1TdyRaf9jzZrwH0QDGsXUP1dDy
         ISDTVS5x5srVWybXqqKMFdPvGI2ZIclJjTm/MkwGIfvoD+GrLp0AQ19Eh+nXWE2fFkXL
         6zGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746483439; x=1747088239;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MERLGTHs/RrtUtLm0v7jU2OTI0wGhvJkJK+5yu5RY+8=;
        b=KUDwHBpavlHRLO+KUHJDjvEfPf1mJl1467TGr5zzieFUHY2pvfM+SzAD58MapRyGMe
         SSpg323dMr6eQ+SrGVfph5/SDE+q4KDx37o1AUpNB//FeGNJFhNxksGKYaLE038MbomP
         aS6Z7tLUpyOZOpSyz2ywvnm3eZtUNkFMZZ0+eG8loYp0Tvsc4Gxcn7TwHbv0kQNfyAPS
         SXnCgOarME6J5dJYBytHwmZmei5xtraB1bqA+5lBOC1+J+P/Qe4k9SaVURNAST/avBhp
         xSg4E1vNhzpTny2lI0xyNQCYR8dHRqujnzX54JaWmtN5rBqeJsgVMdVDwnPfgEGu/mFZ
         mYiQ==
X-Forwarded-Encrypted: i=1; AJvYcCWbGFrR5qMW75P9pN7WNziaBlG74tPCMsi1ecnXVb7KO9l53aNu+KXL5vNnw6ttghA0xkWV0EiPykASOIA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyeQ4BvW6UIFURf9r/U3LblwMxNm5j2pyCgJ9U3hfsQvaPbKY3p
	aU0DHp1GhtSOu3sImYNjLZeT+NNFLIyO9+d0A87Cy7zijkQ0FhVJFub2ToPvr3Y=
X-Gm-Gg: ASbGncvsRS2MuTOqFaSFBDYVv/2z9i9cVzsuJpvkotvluayyftXR3v9qFZeJxkq3hN0
	+QQcqitScJlSPnHUW3zF9k0R+QNtqLDL8cHJ5G9GXal74nCJQK0FDC9cZh8tVncwFhcq/7iEY3t
	g9Muq5d2w2UmWBW9FCHdIhtsqAYThPpNRJ2Lk/5Dpjl8iN8BzSXoSoV26qbO7wqrJnQ57RISuZC
	8iPNnlazSKqDq4RwZdkhu7LdcLj7o+qD5K07N1eHKCil1O3GIx2L3FHWDhpPJIfvJ+l5f1KIInz
	WBT3ILxstQGDIgISby7hvmLODeQz7+lWEGOl4y5zF2xR/liQoYo+6uJaHKA3VjvnCw7Sg+ZcOf4
	3fysonAuOgtniA1QJVQNU6Qs3
X-Google-Smtp-Source: AGHT+IHrvwwqSoSlfObVoPWp8AjVunSDrM2JhYnGT2PWGcNQNPXU+yqDU5LcnUBQQVLLeR5E/xxEgw==
X-Received: by 2002:a17:90b:5824:b0:309:eb44:2a58 with SMTP id 98e67ed59e1d1-30a4e623cb7mr18675373a91.22.1746483439392;
        Mon, 05 May 2025 15:17:19 -0700 (PDT)
Received: from dread.disaster.area (pa49-181-60-96.pa.nsw.optusnet.com.au. [49.181.60.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a47625aeasm9535767a91.36.2025.05.05.15.17.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 15:17:18 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.98.2)
	(envelope-from <david@fromorbit.com>)
	id 1uC47g-0000000HSCB-0wDj;
	Tue, 06 May 2025 08:17:16 +1000
Date: Tue, 6 May 2025 08:17:16 +1000
From: Dave Chinner <david@fromorbit.com>
To: Charalampos Mitrodimas <charmitro@posteo.net>
Cc: Carlos Maiolino <cem@kernel.org>, linux-xfs@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] xfs: Verify DA node btree hash order
Message-ID: <aBk47Oqsy63jSBJY@dread.disaster.area>
References: <20250505-xfs-hash-check-v2-1-226d44b59e95@posteo.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250505-xfs-hash-check-v2-1-226d44b59e95@posteo.net>

On Mon, May 05, 2025 at 08:06:39AM +0000, Charalampos Mitrodimas wrote:
> The xfs_da3_node_verify() function checks the integrity of directory
> and attribute B-tree node blocks. However, it was missing a check to
> ensure that the hash values of the btree entries within the node are
> non-decreasing hash values (allowing equality).
> 
> Add a loop to iterate through the btree entries and verify that each
> entry's hash value is greater than the previous one. If an
> out-of-order hash value is detected, return failure to indicate
> corruption.

Ok, the code is fine, but....

> This addresses the "XXX: hash order check?" comment and improves
> corruption detection for DA node blocks.

.... it doesn't address that comment.

That comment was posed as a question for good reasons.

Ask yourself this question and then do the math: what is the
overhead of doing this hash order check on a 64kB directory node
block? How many times does this loop iterate, and how much extra CPU
does that burn when you are processing tens of thousands of these
blocks every second?

IOWs, that comment is posed as a question because the hash order
check is trivial to implement but we've assumed that it is -too
expensive to actually implement-. It has never been clear that the
additional runtime expense is worth the potential gain in corruption
detection coverage.

In terms of performance and scalability, we have to consider what
impact this has on directory lookup performance when
there are millions of entries in a directory. What about when
there are billions of directory entries in the filesystem? What
impact does this have on directory modification and writeback speed
(verifiers are also run prior to writeback, not just on read)?
What impact does it have on overall directory scalability? etc.

Now consider the other side of the coin: what is the risk of
undetected corruptions slipping through because we don't verify the
hash order? Do we have any other protections against OOO hash
entries in place? What is the severity of the failure scenarios
associated with an out-of-order hash entry - can it oops the
machine, cause a security issue, etc? Have we ever seen an out of
order hash entry in the wild?

Hence we also need to quantify the risk we are assuming by not
checking the hash order exhaustively and how it changes by adding
such checking. What holes in the order checking still exist even
with the new checks added (e.g. do we check hash orders across
sibling blocks?).

Are there any other protections on node blocks that already inform
us of potential ordering issues without needing expensive,
exhaustive tests?  If not, are there new, lower cost checks we can
add that will give us the same detection capabilty without the
IO-time verification overhead? (e.g. in the hash entry binary search
lookup path.)

i.e. What is the risk profile associated with the status quo of the
past 30 years (i.e. no hash order verification at IO time) and how
much does that improve by adding some form of hash order
verification?

Hence as a first step before we add such hash order checking, we
need performance and scalability regression testing (especially on
directories containing millions of entries) to determine the runtime
hit we will take from adding the check. Once the additional runtime
overhead has been measured, quantified and analysed, then we can
balance that against the risk profile improvement and make an
informed decision on this verification...

-Dave.
-- 
Dave Chinner
david@fromorbit.com
