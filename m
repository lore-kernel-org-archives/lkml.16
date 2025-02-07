Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F87194C6A
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 21:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738963546; cv=none; b=Y4e4i/0m9EnfB0Ms+pfywJWWRD/kCR5JV5Amhq/qH9Vgt/AxdcQ3obDMR+p6YpTtffD5Iru8C2XnReFf9gT37SQOjeABpy1WXcfRegvgQu8vnQQYtBZJxaM/o+tsFZRZ2UBt7cb8JdBSSSysYWTe24f4BzGWkOmtZe5mlcL326k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738963546; c=relaxed/simple;
	bh=vQM1Py/91M0XCJASWSyYlpUDg6ikEo3pi+yxTuJED00=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bbe0wEkw7lIvvM7RgQrUgfpPg1Z0kq0zZzzwgEX1u6qKjkZnRDFd6OXtPqda94MFAniodo0bG0yfa/jwqsbmgOzOnwzLHC/cdhWpcOY8Id/pD90JpQWcVaNyqDteWnnGsRjjEHHyLMQURC2LyfdTuE47yxpemfILHKdb8rqNJMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MAfBwJdR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MAfBwJdR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A073DC4CED1;
	Fri,  7 Feb 2025 21:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738963545;
	bh=vQM1Py/91M0XCJASWSyYlpUDg6ikEo3pi+yxTuJED00=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MAfBwJdRTziXQZ1MpTCAvXijccxdpPavm7B12IvhdamG0labZ2eQyda9YwZKbqJ/K
	 t7vxhk/yzZ5vK2Z/XXg3l2J3EzkrzLv/OW4Y8CBLqlOODWNUDRX68SatQqEIWGHXDZ
	 4X1D7uiUUaHU/Sr7THikQtu8VfI5OJpZqFZtIVq5uyV3zz/MbLJKkBjREIUek5bA0d
	 OD/HlCb7PKvxAyo2k+gvp+S2Svf5UqImDAJfnpDceTtZKZSV9IGUYa8mrRSi7WOqL9
	 zN3aXxP6qg+k4kSvUNG7ehZzrlhTXBzfYjzI1/XnvnJY+ucwH+ddkpgQmpRpT3Mpig
	 qSdRToysX2xgw==
Date: Fri, 7 Feb 2025 11:25:44 -1000
From: Tejun Heo <tj@kernel.org>
To: Changwoo Min <changwoo@igalia.com>
Cc: void@manifault.com, arighi@nvidia.com, kernel-dev@igalia.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] sched_ext: Add a core event and update scx
 schedulers
Message-ID: <Z6Z6WGLjArpPE9GO@slm.duckdns.org>
References: <20250207064052.399227-1-changwoo@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250207064052.399227-1-changwoo@igalia.com>

On Fri, Feb 07, 2025 at 03:40:50PM +0900, Changwoo Min wrote:
> This patchset introduces a new event, SCX_EV_ENQ_SLICE_DFL, and updates
> two scx schedulers -- scx_qmap and scx_central -- to print out the new
> event.
> 
> SCX_EV_ENQ_SLICE_DFL counts how many times the tasks' time slice is set
> to the default value (SCX_SLICE_DFL) by the sched_ext core in the enqueue
> and pick_next paths.
> 
> Scheduling a task with SCX_SLICE_DFL unintentionally would be a source
> of latency spikes because SCX_SLICE_DFL is relatively long (20 msec).
> Thus, soaring the SCX_EV_ENQ_SLICE_DFL value would be a sign of BPF
> scheduler bugs, causing latency spikes.

Applied to sched_ext/for-6.15.

Thanks.

-- 
tejun
