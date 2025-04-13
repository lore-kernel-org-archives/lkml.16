Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B561AF0CE
	for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 12:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.9.28.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744548652; cv=none; b=HOUdv4XwNLt20E17WzCXOYiRdQ0V2DAS346UPc2y6Mo5GUVu1YxYM6ksUxHqnv/0/ulCmk/MSTSFNxFgP/JrWtFcXlAX/MlBURTyD/6PVHUzNy6yLO5aXF9ocr6M/YJ1CsLc2MG+qGAx6QsC8R7ke5E8RtNnUof2Vi1nqmF3Gm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744548652; c=relaxed/simple;
	bh=f6hWhAVNRCt1ZlU8kRO/QK8Bf80ASNvP+5hVXVlXR6U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iZB62ATzKPjHaTmPG/hTbXR+APS0+CRAHD59/MNHK/EY8KD0FmkrZsMiHs1ldkpy4rST1nwMMt7YgMRVu0YCXaDs4/0M2BYc+VHmakBdvUprWiXU9UbNOOJfiPl03HxWgAyQ5S1miP+NuexrqxLmMro7LwBShs+FSzPMJPFqGUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu; spf=pass smtp.mailfrom=mit.edu; arc=none smtp.client-ip=18.9.28.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mit.edu
Received: from trampoline.thunk.org (pool-173-48-82-137.bstnma.fios.verizon.net [173.48.82.137])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 53DCoe9B010927
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 13 Apr 2025 08:50:41 -0400
Received: by trampoline.thunk.org (Postfix, from userid 15806)
	id 5A0F12E00E9; Sun, 13 Apr 2025 08:50:40 -0400 (EDT)
Date: Sun, 13 Apr 2025 08:50:40 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Kevin Paul Reddy Janagari <kevinpaul468@gmail.com>
Cc: adilger.kernel@dilger.ca, linux-ext4@vger.kernel.org,
        linux-kernel@vger.kernel.org, skhan@linuxfoundation.org
Subject: Re: [PATCH] ext4: filesystems without casefold feature cannot be
 mounted
Message-ID: <20250413125040.GB1116327@mit.edu>
References: <20250413045718.150126-1-kevinpaul468@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250413045718.150126-1-kevinpaul468@gmail.com>

On Sun, Apr 13, 2025 at 10:27:18AM +0530, Kevin Paul Reddy Janagari wrote:
> commit 985b67cd8639 ("ext4: filesystems without casefold feature cannot be
> mounted with siphash") upstream
> 
> CONFLICT: A condition above this was wrapped in #ifdef making git not
> able to merge them: Merge conflict
> 
> When mounting the ext4 filesystem, if the default hash version is set to
> DX_HASH_SIPHASH but the casefold feature is not set, exit the mounting.
> 
> compile tested
> Signed-off-by: Kevin Paul Reddy Janagari <kevinpaul468@gmail.com>

I believe the problem you are concerned with was fixed by commit
a2187431c395 ("ext4: fix error message when rejecting the default
hash")

And I'm not sure what you meant by your reference to the merge
conflict?  Were you trying to cherry-pick 985b67cd8639 into some other
tree or branch, and that was where you saw the merge conflict?

     		    	     	       - Ted
