Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44A2F22ACD3
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 10:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738838425; cv=none; b=FROUbNoXTic79Ib+GAgZ4IRmvIF/NhVviMZ7uFZ022FiFEmlT4ewYcL4nxs0fgE0AriuWIIARK6rLHVGnK1v2s+e4A98ihfEG6DN1iTiztjiQtBp9HWk1uPmNKodFjb+IZQZClV49ueeTMEjn+K9LiXIfKCtkE5DUVBYWWJXn8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738838425; c=relaxed/simple;
	bh=8+oWvRnLl/BloxMfzylmfeSwP95E2qJF+2cAaIFDswE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SY0X8Zz5K9ew61uu49KNeRNaW/3d3a9r0CrEfui+io9Mi5o7CfbeUr+Y5p6yOq6a44TvvlHMxl1wa8YeAwVH5QEPZRBCJRRF+1AMjjOGF4J0FTLIBQYYHT45FcOea+P3+OsK7NysVkbibxWWE4Cc9fQFptqjqKI85ZKF4O9mMjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CCc0u3Br; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CCc0u3Br"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3354C4CEE4;
	Thu,  6 Feb 2025 10:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738838424;
	bh=8+oWvRnLl/BloxMfzylmfeSwP95E2qJF+2cAaIFDswE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CCc0u3BrufwBUYlCC2VPvQFv0wo9hnkGVu6ecBgwz1S9i61AHm9sl/qLknvt3aEyh
	 SRiL4SzDjE8ZhItvVh0AIBiEKPBBl1INX7z6xdmt069mWbfE8OOjpc4VY7o/DEA3JK
	 OTaQ7y5Oapex9fzEetePkHCdSIhUSSymm74zLu63qWfTnNZ/ApNwWnH9fjQTYow/dx
	 YjPWZ6Bwg90UU4g2n7DkSP2Mtf/hkaCQpe1g9/lH+2H2UijXQqL8oR2Y7bVj8phJtO
	 CemLlYiEHWI+4/AKuu1JJUqI1Aiz01RWwHS7VUbKFnTqtVFl7qEaxFx2CIjz5RSovA
	 cwxLLkW7dapQg==
Date: Thu, 6 Feb 2025 11:40:19 +0100
From: Christian Brauner <brauner@kernel.org>
To: Oleg Nesterov <oleg@redhat.com>
Cc: Mateusz Guzik <mjguzik@gmail.com>, ebiederm@xmission.com, 
	akpm@linux-foundation.org, Liam.Howlett@oracle.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/5] exit: perform add_device_randomness() without
 tasklist_lock
Message-ID: <20250206-pfirsich-fortbestand-fd0fa94edde8@brauner>
References: <20250205200929.406568-1-mjguzik@gmail.com>
 <20250205200929.406568-2-mjguzik@gmail.com>
 <20250205205655.GD8754@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250205205655.GD8754@redhat.com>

On Wed, Feb 05, 2025 at 09:56:56PM +0100, Oleg Nesterov wrote:
> On 02/05, Mateusz Guzik wrote:
> >
> > Parallel calls to add_device_randomness() contend on their own.
> ...
> > +	add_device_randomness(&p->se.sum_exec_runtime,
> > +			      sizeof(p->se.sum_exec_runtime));
> 
> OK, but
> 
> > +	free_pids(post.pids);
> 
> wait... free_pids() comes later in 4/5 ?

Yes, that seems to be an accidental leftover. A

git rebase -S -i v6.14-rc1 -x "make -j7 O=build.v1/ kernel/"

caught this right away. Removed.
