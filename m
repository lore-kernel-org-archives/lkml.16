Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FCDA2857F3
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 14:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.9.28.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744296949; cv=none; b=PmCtZ2ANcvFxKoZjI9dULA/PeoxsOPCKL+pRsMByAJ1bOPhjvo5GqCHTDe+heRAs4a6IssCaXp1e0B5ZlN7sVf2+7BhGO2JRugNf8pXRKvHbVXOaPldTlhDuOE1tgFbGILVKPgO5bG09OYyxgpf9vOWYJgpQHAXdTTskfJ+6G0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744296949; c=relaxed/simple;
	bh=OBcyd7UqWXZ4ps/4EYJDmB6P/bKOk7nyXS0LA5Zv/yE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZSuqRhTCk9S4K+fKCe3T47NyP6Vwvozm7Z/bghii84DE/PV+t0+GzIt5CFoGMB/xmjY7qZS7uv4qsCrHtycyLKvuCg4GTxM6x5IZ2wH7mMI9ZzcKFZzxOa7fFI2uQQ1CNa//cNwGrKx8gBOT2oNtpVfNutE+6LYVQaFniEdB56Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu; spf=pass smtp.mailfrom=mit.edu; arc=none smtp.client-ip=18.9.28.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mit.edu
Received: from trampoline.thunk.org (pool-173-48-82-137.bstnma.fios.verizon.net [173.48.82.137])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 53AEtbrc023234
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Apr 2025 10:55:38 -0400
Received: by trampoline.thunk.org (Postfix, from userid 15806)
	id 892212E00E9; Thu, 10 Apr 2025 10:55:37 -0400 (EDT)
Date: Thu, 10 Apr 2025 10:55:37 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Jan Kara <jack@suse.cz>
Cc: Jann Horn <jannh@google.com>, Andreas Dilger <adilger.kernel@dilger.ca>,
        linux-ext4@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC] ext4: don't treat fhandle lookup of ea_inode as FS
 corruption
Message-ID: <20250410145537.GD13132@mit.edu>
References: <20241129-ext4-ignore-ea-fhandle-v1-1-e532c0d1cee0@google.com>
 <auitbbb56g2mpb52irzcfh3qfob3qjot3326qpigdvhw7wyw6b@p624krjopkc7>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <auitbbb56g2mpb52irzcfh3qfob3qjot3326qpigdvhw7wyw6b@p624krjopkc7>

On Thu, Mar 27, 2025 at 12:04:38PM +0100, Jan Kara wrote:
> Hi Ted!
> 
> was this fix missed?

Yes, oops.   I've applied it now.

					- Ted
