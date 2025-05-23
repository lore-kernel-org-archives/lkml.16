Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D50296D0D
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 14:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.9.28.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748010320; cv=none; b=Pj7Vhe8WQYiuM72Uf4tCVfsaSIISrp+Ee1/Gy8iX2EH6EJs/Fk6Jb0vAvCIz8QLUdU5YNl2cXgi+DF4KTqhSBdE/bUQYez1+okiNJ10eW/gbLRAzndrA4fywH/7oXdyFqnwFXagKbEbyliaAPUvYibW8B0/l/vioapOwlpjlVYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748010320; c=relaxed/simple;
	bh=Jr92kqhLnQvRNC5L+L0W3yvG7mH4cdCdsfVACqlC638=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ipX9XkESgFXmfNJq83myJpqZGukzoUgMbvdYr7w6puGkYbPFN+IxxaBJhs5NXJtykxye+S8X1cVLCoD8mPZHSpUsb+LmdqsWxsTEaQBWS9nZrH1FwvGO+zh+deaBd4wPwH5RSryEaa1Dp2SvtoGkzdc3q7g+abutvAPU3L99ct8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu; spf=pass smtp.mailfrom=mit.edu; arc=none smtp.client-ip=18.9.28.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mit.edu
Received: from trampoline.thunk.org (pool-173-48-111-173.bstnma.fios.verizon.net [173.48.111.173])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 54NEOnpP028475
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 May 2025 10:24:50 -0400
Received: by trampoline.thunk.org (Postfix, from userid 15806)
	id 81E5F2E00DD; Fri, 23 May 2025 10:24:49 -0400 (EDT)
Date: Fri, 23 May 2025 10:24:49 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: David Laight <david.laight.linux@gmail.com>
Cc: Kees Cook <kees@kernel.org>,
        Ethan Carter Edwards <ethan@ethancedwards.com>,
        Andreas Dilger <adilger.kernel@dilger.ca>, linux-ext4@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2] ext4: replace strcpy() with '.' assignment
Message-ID: <20250523142449.GB1414791@mit.edu>
References: <20250518-ext4-strcpy-v2-1-80d316325046@ethancedwards.com>
 <202505190651.943F729@keescook>
 <20250519145930.GB38098@mit.edu>
 <20250523133100.1b023a6e@pumpkin>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250523133100.1b023a6e@pumpkin>

On Fri, May 23, 2025 at 01:31:00PM +0100, David Laight wrote:
> 
> The compiler (or headers files) can also allow strcpy() of constant
> length strings into arrays (known size). Erroring requests that are too long.
> The strcpy() is then converted to a memcpy() which can then be optimised
> into writes of constants.
> 
> So using strcpy() under those conditions 'isn't all bad' and can generate
> better (and less bug prone) code than trying to hand-optimise it.
> 
> So even through strcpy() is usually a bad idea, there is not need to
> remove the calls that the compiler can validate as safe.

I assume that what the hardening folks want to do is to assert that
strcpy is always evil(tm) so they can detect potential security bugs
by doing "git grep strcpy".

						- Ted
