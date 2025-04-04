Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF7958F40
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 09:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743760545; cv=none; b=kVfWSuW54TeXJIvk/vW+PxUeSY0JiEXAr0kYgxWBCG4/gmAlFbgwQHvfyVHgxFUZiwldpgEpLeLS/i4X92PWY+Vz0DrUIZTUsAaRn9FvFKh2yKKIrX5r/otfpM+7WaqQ8cA5QjZkUUGqSPnBveeZwOVUgy7GHKP9t403FZaZ7zA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743760545; c=relaxed/simple;
	bh=2diFDxf3AXTAw5IP5hkMq0aUQbnGwY+dSZexd8FPd2k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KcOW8uMZrjpNaqJhl/ZCK3Hzqqq2qf3+CMgNdEbLyrp4ywJ43z9l6/CjSPqtfnruQXgE5Ha2tIN+1pbLRI7tCcs816gOlsmwHt7ho8oJe7DDUpn1OPXx5GhvF+rtEG3OF0TBP8+WxdgZjbLbOAYjKDn5LUjcHyvYLquhteIlCcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OZRzyz78; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OZRzyz78"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E34FC4CEE5;
	Fri,  4 Apr 2025 09:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743760544;
	bh=2diFDxf3AXTAw5IP5hkMq0aUQbnGwY+dSZexd8FPd2k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OZRzyz78oa2/RXfUihgjhBeFhS7mjXapd4vqC93MkCav218VZxatiM42OZ2GflhAX
	 2n12/NkEH7JTIpkLi9OAynIV3hOT4xdc9GykNM56WDxT9zuxakaC0yfnvOtyeliANY
	 vd3+X2FAVXqd3FWbIxi25k1mlbeuUm/fu1mI8bGTBnmdcZjQjI4u9FS5hh/qM4VeFq
	 LkHAYAIkDRwrvXj/XqjGYMdO1u1uEKN6ZbDn50U27hrnpFgj6zPZrKJK2rBZ7GswU6
	 KFCfJaZWzepQTsOBGtPFnULbIMNRnd6EZT8BNuxuOGxNkyhzPDh2R1lHsIP0aoGsFj
	 X+XHzJeYqCb5A==
Date: Fri, 4 Apr 2025 11:55:40 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Nikolay Borisov <nik.borisov@suse.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] x86/alternatives: Make smp_text_poke_batch_process
 subsume smp_text_poke_batch_finish
Message-ID: <Z--snCDhK2u_m4lP@gmail.com>
References: <20250403153956.1913607-1-nik.borisov@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250403153956.1913607-1-nik.borisov@suse.com>


* Nikolay Borisov <nik.borisov@suse.com> wrote:

> Simplify the alternatives interface some more by moving the
> poke_batch_finish check into poke_batch_process and renaming the latter.
> The net effect is one less function name to consider when reading the
> code.
> 
> Signed-off-by: Nikolay Borisov <nik.borisov@suse.com>
> ---
>  arch/x86/kernel/alternative.c | 20 +++++++++-----------
>  1 file changed, 9 insertions(+), 11 deletions(-)

Applied, thanks!

	Ingo
