Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18BA423E325
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 18:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744136953; cv=none; b=lohcOC2qZ6BQTrPkY1f2E1FXERDsFIlbA4C0OiB4BSR+NXpUEeaTCa+7xWv2SufZb6pnqU6j9sox/C4ci/nC6eKgKwvk85qdAP/F1Qy+Pk7SEZgfbErM9TNE7T9AEUeYPXWYx2aX8lFwrf9XbuCCDLKxBahzg+hNFxemAxw+oio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744136953; c=relaxed/simple;
	bh=8D+MSSObsvj9zna1p0kHSg3KtREFa9e2SljukZPEjpg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p/RDsS42Re10q/lhoyZhyKj/hCmjAqBMZe8SH7ik/slP9RG6N8ikvF5ngxaoDhdpDkIWA34bewboC/bP6Wnp+0DcA/ZF9ByThjC+lN/KXD0h5hBjjj11aNQiwaGGbXg1UfaM0Eh+3TnTjEX4V1D2ETI+cGFWXgIEHk4gkf4nelo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nI06J89S; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nI06J89S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B192C4CEE5;
	Tue,  8 Apr 2025 18:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744136952;
	bh=8D+MSSObsvj9zna1p0kHSg3KtREFa9e2SljukZPEjpg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nI06J89SkrZv7TSf7gRs4LjM+X8H1e+uP0rgnoL48PQrxo+/dSEinFqzxVfin/dDU
	 gCrcnx0jQ83avt/cKMtm7xvhRLE7H0lge7lEQwlFxVOEX0hytTXyxzHaiD8XWeUdQx
	 KV5qX68+/MJETpBH0phPXRhxarNLyqEDGRkmUCbBxB1Q20hkHsksPf3aHDTfpXuCk2
	 F0L5ZsykExjUkUyX65C/zSBsxNORieJLjJdz45vEy2i08snfdZKi4RbBvsVMvT5GMT
	 fABj11rYMGXp389KJl+2GtBm4oqia1zPlOP6iaHP35g+dOOntHm7iuZ7D9aeWuBy9u
	 1jZ3mOHR8+a+w==
Date: Tue, 8 Apr 2025 08:29:11 -1000
From: Tejun Heo <tj@kernel.org>
To: Andrea Righi <arighi@nvidia.com>
Cc: David Vernet <void@manifault.com>, Changwoo Min <changwoo@igalia.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH sched_ext/for-6.15-fixes] sched_ext: Mark
 SCX_OPS_HAS_CGROUP_WEIGHT for deprecation
Message-ID: <Z_Vq91-BR3dTJG1V@slm.duckdns.org>
References: <Z_RdpDkLCXm140RT@slm.duckdns.org>
 <Z_TXIe2fVpAt-CAg@gpd3>
 <Z_VnKbElcEWWg4CH@slm.duckdns.org>
 <Z_VqwpXcmLMPseOu@gpd3>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_VqwpXcmLMPseOu@gpd3>

On Tue, Apr 08, 2025 at 08:28:18PM +0200, Andrea Righi wrote:
> Hi Tejun,
> 
> On Tue, Apr 08, 2025 at 08:12:57AM -1000, Tejun Heo wrote:
> > SCX_OPS_HAS_CGROUP_WEIGHT was only used to suppress the missing cgroup
> > weight support warnings. Now that the warnings are removed, the flag doesn't
> > do anything. Mark it for deprecation and remove its usage from scx_flatcg.
> 
> Is the removal from scx_flatcg meant to be part of this patch, or is it
> intended as a follow-up? Other than that LGTM.

Oh, sorry about that. Lemme send v2.

Thanks.

-- 
tejun
