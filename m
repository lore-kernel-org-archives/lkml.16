Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AB451804A
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 16:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747844333; cv=none; b=S/hDUL5miAShNbyaTfoI4imMdeOgNfmqJzpwV2h6zLUqZ6aDX7v14Cot7osO80AVrRdqFkvCndu6CSzOo9C0ToDfZtzrk08UeqfzBMpYztFFSG2M6LZGKMx0nWgs6MNK9go97N6HmqFWEy+JGerfwvKPjuJ6Ix4hujRW80pfNKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747844333; c=relaxed/simple;
	bh=ML6qqnKubjg+OYw63x2R04A6ibUYv2pqmnXvqBYe+z0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FH3bEHjcFv14xb6WXrxIDjOe3XN9XuLv1LU5pjnatuc0l41dexDKyn76QwNR970NyVnYamNNXE7ZOaD8E9DL9HxVrEv10wmLHjS66NFtcVMj45GxmJDC2uqmRQGJuySV1oE/j0YMy8csVEgh1ZlEyCK924UwmJQeWyVOCujaG5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DjFdNLz2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DjFdNLz2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0D6FC4CEE4;
	Wed, 21 May 2025 16:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747844333;
	bh=ML6qqnKubjg+OYw63x2R04A6ibUYv2pqmnXvqBYe+z0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DjFdNLz2GCwnN7yBUtlf+JTb2z85vUhnElL405bXrY+kzmjtV1MU1JzCHRkK0C7Bi
	 8wHOnCY5hgZhsXgYF9cXORdONMn3EE2SxNiSZpuepk/bni2j4WLnveLdJM4fRt0rbs
	 AiPxLo3KvsTULtAtS4vdwamJSZtX3rMrgmOo3hWzXUULTBJqoIUhygypDs51wBPRWR
	 RvSQmg1KU1sSd9xX+zrRcnQYKvQ7bYT0wSgOsaJNc4a84hwkm2rvp/zbRRsTdscSOC
	 Ne583Sp/XH2U9DzZNS3nFvanKjJy+KBfhEf1tDYYAPzzX2aNr7QHJ53gTfXw0qM0hE
	 gPDgVsdONrItg==
Date: Wed, 21 May 2025 06:18:51 -1000
From: Tejun Heo <tj@kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Max Kellermann <max.kellermann@ionos.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] fs/kernfs: implement STATX_BTIME
Message-ID: <aC386_UJaBxf5WTE@slm.duckdns.org>
References: <20250506164017.249149-1-max.kellermann@ionos.com>
 <2025050600-economist-display-2d25@gregkh>
 <CAKPOu+8c4Z_Biie3R6LP3pz6u-bpzBZjfoWv4XAQ5AreziDccg@mail.gmail.com>
 <2025052100-depravity-founder-6332@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025052100-depravity-founder-6332@gregkh>

On Wed, May 21, 2025 at 01:24:36PM +0200, Greg KH wrote:
...
> > (It's okay if you don't like the patch and it doesn't get merged - as
> > always, I can happily keep it in our private kernel fork. I'm only
> > offering my work to everybody, because I'm a strong believer in open
> > source.)
> 
> I feel like the creation time here is odd, but if others really
> need/want it we could take it.  I would like to see others review it
> though.

Isn't this trivially trackable from userspace with udev?

Thanks.

-- 
tejun
