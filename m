Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4015843AA9
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 22:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743458484; cv=none; b=b3Yfwi1l30EJjyG2dhJSge+ie7nlqnvEEaUVfyTc1r7qACM27U2N0dcj9xx8BZ7IdaaJ5JQJxvip/InPmSjSdckNBPdQiKzRGYcI1MNt8EWCFRn4V1zy6ksQWTEWq1AcK7nhvG+EizEgaDMX3oFI4m+nLNFpE3Ez5l2+z3TIdH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743458484; c=relaxed/simple;
	bh=GTwl32R2r5EAGxm/OQ/nUz1pHfEDYK9ibCNrTwxu0bU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vC7P7dsebKgtZBstnILoBblo5YlpPQzS5UGzEU8vDcWbjRaRwLMrUVPU/9sSLYRUjPujH85DqYfUmPxZWIu3Z4qW9JUkJcxlxXC44uqqQFbn5/i8TqMqJUxki58XfZ904aMKmDB8ElTebg49C1Ijb2zYi5UCogHMvwyLkm23j4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h4Zdi6c2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h4Zdi6c2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93B73C4CEE3;
	Mon, 31 Mar 2025 22:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743458483;
	bh=GTwl32R2r5EAGxm/OQ/nUz1pHfEDYK9ibCNrTwxu0bU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h4Zdi6c2NuYgEfxXGdbF3hOG+1HzgXCg4KbAcDQk+zd590zhOankvdTlZWx57/uiL
	 VyIInidzq1G5VvNEM6Bb6aQUhtwPGa7/CKqHdYAYblxrWwqz0sNwYgMbQ/zsj93P7+
	 payNIQYLHoe+YvWNvXTv+GFKNZqTbxMVnB6+nQdmCloy7mMPT2ofW1rlVRQnN1Q1uq
	 6DvDWruP3dMWXpjMeB1R0dEg3rQqHL4bwqfoyhqO4BiwmVNzpwE5GcYfDytGs3XMmz
	 v9Fa7qE+/42mCDd7/A0/n6lLjtsObEtPoelv5Bk4DZ0I4wtRLs8k6PgH7xgIhp3Tv3
	 CrPd3sQPewJ6Q==
Date: Mon, 31 Mar 2025 12:01:22 -1000
From: Tejun Heo <tj@kernel.org>
To: Andrea Righi <arighi@nvidia.com>
Cc: David Vernet <void@manifault.com>, Changwoo Min <changwoo@igalia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/6] sched_ext: idle: Deprecate scx_bpf_select_cpu_dfl()
Message-ID: <Z-sQsqt6kKLqJfJf@slm.duckdns.org>
References: <20250321221454.298202-1-arighi@nvidia.com>
 <20250321221454.298202-7-arighi@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250321221454.298202-7-arighi@nvidia.com>

Hello,

On Fri, Mar 21, 2025 at 11:10:52PM +0100, Andrea Righi wrote:
> With the introduction of scx_bpf_select_cpu_and(), we can deprecate
> scx_bpf_select_cpu_dfl(), as it offers only a subset of features and
> it's also more consistent with other idle-related APIs (returning a
> negative value when no idle CPU is found).
> 
> Therefore, mark scx_bpf_select_cpu_dfl() as deprecated (printing a
> warning when it's used), update all the scheduler examples and
> kselftests to adopt the new API, and ensure backward (source and binary)
> compatibility by providing the necessary macros and hooks.
> 
> Support for scx_bpf_select_cpu_dfl() can be maintained until v6.17.

Do we need to deprecate it?

...
> @@ -43,10 +39,13 @@ s32 BPF_STRUCT_OPS(select_cpu_dfl_nodispatch_select_cpu, struct task_struct *p,
>  		return -ESRCH;
>  	}
>  
> -	cpu = scx_bpf_select_cpu_dfl(p, prev_cpu, wake_flags,
> -				     &tctx->force_local);
> +	cpu = scx_bpf_select_cpu_and(p, prev_cpu, wake_flags, p->cpus_ptr, 0);
> +	if (cpu >= 0) {
> +		tctx->force_local = true;
> +		return cpu;
> +	}
>  
> -	return cpu;
> +	return prev_cpu;
>  }

scx_bpf_select_cpu_dfl() is simpler for simple cases. I don't see a pressing
need to convert everybody to _and().

Thanks.

-- 
tejun
