Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31B2425EF82
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 18:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750702066; cv=none; b=ir3r3WruWTb6JXIKdDxegmjw8I7m1jV+ZSGCXvKAsMHS2tYAZmGqt4UqVeQrjXFWymT6WHHdc+UforcR3VmVDyuhuc1k2Jtm28twTMJ77zN7eLLhVBWGyMkZTAe26xjKDdTKE1d/Ybz3Ubkl2Mk4DlkXBkFh+3+VWdbVzQfSMU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750702066; c=relaxed/simple;
	bh=vH13dxUiypkPKx3lr4bU8O8t/dbtw8dCsUwWHqi8MXE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n21h+eDDtZ2/2jl8d3Z0wF+KW+LEaTgBl0aA6BzIxBG97RjN/Wq7cfQWxFziF7W2B7ydW2KykI8bavTh5QrLasFv/N2xEizBzfwe1vU5OlwIZ7Qq/zEupeJiukR+j+OhsyEGBRE7GBHtgAtqIe+Ie+YIB75Fjvo4lMTxguuu048=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mbKo89SG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mbKo89SG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFBEBC4CEEA;
	Mon, 23 Jun 2025 18:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750702066;
	bh=vH13dxUiypkPKx3lr4bU8O8t/dbtw8dCsUwWHqi8MXE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mbKo89SGI1L0Rwsi/cyusmWco0En0pD7v80d5tsxWqWMl6FWvSNpv5MerBjhjRG9D
	 8KtmnrAV7SX7vUox5F1kQgYjzSRGh/0a+ES/+WjyEnrO3nZPzvTrzLECny4kkLIj3h
	 xlBg/eI5ezKX0Cwzl6z3Nl6JQl35Hv9ta1nL/pfoyjhd2Uz2uGEcwoE1fQA3iWV2QI
	 mwHuuaIIYkPjYcxMEx+LASLu1c4azNoYtr7MosvXr+DhA0mc1P9+fJv1VGTlOlZwKo
	 Lm/8ZJMsr/4Ut6a6JpuvwcOYlOyfvZsAYaRFLt8tgyhkowsfM/2uguy4Om/x1SoKp0
	 DGt/R64GjVd9g==
Date: Mon, 23 Jun 2025 08:07:45 -1000
From: Tejun Heo <tj@kernel.org>
To: linux@treblig.org
Cc: jiangshanlai@gmail.com, ebiggers@google.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] workqueue: Remove unused work_on_cpu_safe
Message-ID: <aFmX8VOdwcF3E1ZG@slm.duckdns.org>
References: <20250623003049.349200-1-linux@treblig.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250623003049.349200-1-linux@treblig.org>

On Mon, Jun 23, 2025 at 01:30:49AM +0100, linux@treblig.org wrote:
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
> 
> The last use of the work_on_cpu_safe() macro was removed recently by
> commit 9cda46babdfe ("crypto: n2 - remove Niagara2 SPU driver")
> 
> Remove it, and the work_on_cpu_safe_key() function it calls.
> 
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>

Applied to wq/for-6.17.

Thanks.

-- 
tejun
