Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BDDF1A0BDB
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 14:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.9.28.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747232618; cv=none; b=kXtW4SRVhbdwOl2wpIYJovUHaotFmDhBA1iURRhEZLauaR+TWDWOV2L4pm7Z8nu1/Ju5Mo+pk20Y5umk2vkJJNbTFW13cdJvCgKzBFT4ilX8SjKMr2u4q54PjoNoUPVYrTqHrq8FYi/eoNpnrxfWgJXEzBFMDNJKgXAhY4xfWao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747232618; c=relaxed/simple;
	bh=5auqVGAKfTqA/9jQlYowusqm55mq7bSh6BCPZuslLA0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TfOEtAkQWKjN9xuoECE7MLpFAco4ZOjQ9RhG0N8D0IkIlLW7i/7iuYilc2sHuVnmiAN9hd7y5bQTJUY0LpCtIpNNb2K6fYsQ+mTQwbSv+qzFpZq9h2iU9yVoOiPQkzaf/CPJIRanbF/+kQ7OWrP2z/GWSM4uHtx4rjU+JOVlFpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu; spf=pass smtp.mailfrom=mit.edu; arc=none smtp.client-ip=18.9.28.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mit.edu
Received: from trampoline.thunk.org (pool-173-48-112-151.bstnma.fios.verizon.net [173.48.112.151])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 54EENGYW025919
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 May 2025 10:23:17 -0400
Received: by trampoline.thunk.org (Postfix, from userid 15806)
	id 7F1132E00DC; Wed, 14 May 2025 10:23:16 -0400 (EDT)
Date: Wed, 14 May 2025 10:23:16 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Matthew Wilcox <willy@infradead.org>
Cc: =?utf-8?B?6ZmI5rab5rab?= Taotao Chen <chentaotao@didiglobal.com>,
        "adilger.kernel@dilger.ca" <adilger.kernel@dilger.ca>,
        "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
        "linux-ext4@vger.kernel.org" <linux-ext4@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
        "linux-mm@kvack.org" <linux-mm@kvack.org>
Subject: Re: [PATCH 1/3] mm/filemap: initialize fsdata with iocb->ki_flags
Message-ID: <20250514142316.GF9943@mit.edu>
References: <20250421105026.19577-1-chentaotao@didiglobal.com>
 <20250421105026.19577-2-chentaotao@didiglobal.com>
 <20250514035125.GB178093@mit.edu>
 <aCScvepl2qxyU40P@casper.infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aCScvepl2qxyU40P@casper.infradead.org>

On Wed, May 14, 2025 at 02:38:05PM +0100, Matthew Wilcox wrote:
> On Tue, May 13, 2025 at 11:51:25PM -0400, Theodore Ts'o wrote:
> > I understand that it would be a lot more inconvenient change the
> > function signature of write_begin() to pass through iocb->ki_fags via
> > a new parameter.  But I think that probably is the best way to go.
> 
> I'd suggest that passing in iocb rather than file is the way to go.
> Most callers of ->write_begin already pass NULL as the first argument so
> would not need to change.  i915/gem passes a non-NULL file, but it only
> operates on shmem and shmem does not use the file argument, so they can
> pass NULL instead.  fs/buffer.c simply passes through the file passed
> to write_begin and can be changed to pass through the iocb passed in.
> exfat_extend_valid_size() has an iocb in its caller and can pass in the
> iocb instead.  generic_perform_write() has an iocb.

Mmm, nice!  I agree, that's probably the way to go.

There might be some callers if write_begin() that might require some
restructing because they don't have an iocb.  For example,
shmem_pwrite() in drivers/gpu/i915/gem/i915_gem_shmem.c came up when I
did a quick grep.

     	      	     	    	     	     - Ted
					     
