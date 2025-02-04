Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7E092046B1
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 20:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738701466; cv=none; b=ZNg2X9fLux2t0uV/24qgbZRTerldXDNMcHQd/lZ7v2wNdo0bUsP1jhvYhpxn0Cw8SBPnJ/67sn1mqsrWzrqwZosIl7DtpCEiAcPci3te4YbSYHfZx0l/uOV/x6vz8cIhPU9mfOIUrAKZK8Err+gqQVgGKaSuM8IQxzo/tK/+BXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738701466; c=relaxed/simple;
	bh=1vycal/o4sUbxj63kLdz2Ru60z0St1D/p7HBnKZLqaM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m/pI+Rfb9F1pSCbgcFPmhOmuG9iTnrcx1FdzgHaUocJhcZzmmJa0Jc+tPiPApfl3GA0eP6dozw7atsQ+uNw0bP3TyXyEtO+o6iHEMXI6Ph9sRXyjxn7mWPJvZNvDfzm/yDY6wh11Y8KooH3y7vpt+QW5sITr8tztC4rWvLyCc58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mASZHBr8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mASZHBr8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17D3CC4CEDF;
	Tue,  4 Feb 2025 20:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738701465;
	bh=1vycal/o4sUbxj63kLdz2Ru60z0St1D/p7HBnKZLqaM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mASZHBr8paWBoNNBdIWKKrKr9+cw/L+8UjYHdqZP3ihLzjsAbRympZTBIgZ5qvUrC
	 W2/oupcaGEzMJ/v0rbKpwa4vmwoVo9z7W5LSvwtGlWeZ9qxv1rfU/1SFx5kf8LlxwY
	 2au7lIZMe9mc0VKFt0rXsX8Uk9awFecnV9nPL/Wj+Fv9O1/heVTPjGmtS/aLDnoR/p
	 mBboSdGmK6Ys775gpFHa18J+r2cNU8Ww3a8DXRa7k5g6LjqbA3DZsZ12nWWyauG83Q
	 bwLNrmM8cIsNGlxzPvOan9dUoF6zZglbEGwwbfBnFaPjn6y4PZRWz1aMWmM7CwI8/2
	 0FHND3tyRvRBg==
Date: Tue, 4 Feb 2025 10:37:44 -1000
From: Tejun Heo <tj@kernel.org>
To: Changwoo Min <changwoo@igalia.com>
Cc: void@manifault.com, arighi@nvidia.com, kernel-dev@igalia.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/7] sched_ext: Implement core event counters
Message-ID: <Z6J6mJW8vU9XJPV8@slm.duckdns.org>
References: <20250204052057.67776-1-changwoo@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250204052057.67776-1-changwoo@igalia.com>

On Tue, Feb 04, 2025 at 02:20:50PM +0900, Changwoo Min wrote:
> The sched_ext core often has to override the BPF scheduler decisions,
> and some events could be interesting but not easily visible.

Applied to sched_ext/for-6.15.

Thanks.

-- 
tejun
