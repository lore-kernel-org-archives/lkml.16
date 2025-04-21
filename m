Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D3B13CF9C
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 19:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745262299; cv=none; b=Fce86oYFmeHb5PPJiJ/Ded0Qz6AIiv0AlaHb3wxsqkusk1Ab3vqAs73iwAZYUdDFcDzlqr6teMJWxkcvvRp8I7RRUhOjsOR6X+VJO1EHS7KBUYOLF8RvcYaFL5ZNfEGQhRHV/xli5SWfIIz9LdUstwGOIFDEitZv34/r5f/FmfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745262299; c=relaxed/simple;
	bh=YQOvjGxViptjkOYRZOkERM0awnro/+UboBc49TjEKsQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Svr1HAYG9OpjvJ16uXOHz3cUr/QeAeZPGzhByvjeiI66JeSjlY9yPQmAIesvgLSgjlMyJUdISlqxuPeJ5UbkfmNwv/9+nJefmDE7xOXKwc4jdIuCZ0OK3DHZh5prVF2XDVWtev1fteqKmscIGeZCGlQEk8O9qla5QLPeCIS8gqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bb7SI/wT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bb7SI/wT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0A5FC4CEE4;
	Mon, 21 Apr 2025 19:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745262299;
	bh=YQOvjGxViptjkOYRZOkERM0awnro/+UboBc49TjEKsQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Bb7SI/wTcFZs7IvHmM0m3Ctf3pmQCgwGx9u2k5rtz3W4AypUpuG+jKzm7e7qrNbuI
	 zMmtZNimT33RWpHegHBfam44xPYoOvG0G37YLgYtvFfaVkplW1ZsHNvlfNmj3RiQJB
	 9DBrMJofFttess8S+J69wORvH2EYy09CQRyjE4fUgS0TNjNs2I/ZStMSMZ03+AE/h4
	 lFRasqmiX8Nb/aAigETv4vA1NmH3e33ACZnGRJGOW1nDcVpbIL3qXKb2XAIdrY5Cne
	 TrYZPU2lq642jcXAZjjp4LoVBG2PtoaG6eU9OvSh7oGzpVsmnU9ASo018gL2tgaAcJ
	 44dvXv2tMtuRQ==
Date: Mon, 21 Apr 2025 09:04:58 -1000
From: Tejun Heo <tj@kernel.org>
To: Changwoo Min <changwoo@igalia.com>
Cc: Andrea Righi <arighi@nvidia.com>, David Vernet <void@manifault.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] sched_ext: Fix missing rq lock in
 scx_bpf_cpuperf_set()
Message-ID: <aAaW2qQDg4KXUWwl@slm.duckdns.org>
References: <20250420193106.42533-1-arighi@nvidia.com>
 <20250420193106.42533-3-arighi@nvidia.com>
 <32e5c7cb-5b41-4e02-81d4-5bbed981ab03@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <32e5c7cb-5b41-4e02-81d4-5bbed981ab03@igalia.com>

On Mon, Apr 21, 2025 at 04:44:02PM +0900, Changwoo Min wrote:
> Considering almost all chext_ext ops hold an rq lock, the actual ops
> where scx_bpf_cpuperf_set() for a remote CPU is possible will be very
> limited. When there are more use cases for remote CPU kfuncs calls, I
> think we need to come up with some mechanism, for example, extending
> schedule_deferred() to cover more actions.

Oh yeah, the deferring mechanism was designed to host things like this. It
shouldn't be too difficult to expand to cover it.

Thanks.

-- 
tejun
