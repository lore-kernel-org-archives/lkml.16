Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5914315E
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 06:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739083230; cv=none; b=dEplIoNk+pxYOuuXzJGkGDSwDDWkm06vvJk7CrG778VEpKC9A+Z/UHdb9/v1T36FwmnrqUvd/eVdYXcnVcAKcwqGP/rBLf5wOvO/XY3hqkAH8uETJIewRY+VpvLJ7CWu0MQSsBeT2gQjLEa1POhqTZ0xAwBhPbRnWhSLS5JNQIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739083230; c=relaxed/simple;
	bh=Vnju5PnlfIADtWZq5s3oxWaMPmwG11fixNnfiMBFv1k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Aex4s7NmexdGgTqkgTux9w+YQlzD47mXEd3len0AMpSgQec2X+/PBoynd7TFHDi9HFxCWpSmdHyWEwZxihidD8vQB2R2l3tCW/9FdAmas2uXfsfx+jxD4cNSbIFx3AeKZ2RuRYpsPA2cCJzJlBUS0kS0/kQj64XnD1v+EPXuab4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N2pxX2oc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N2pxX2oc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1117BC4CEDF;
	Sun,  9 Feb 2025 06:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739083230;
	bh=Vnju5PnlfIADtWZq5s3oxWaMPmwG11fixNnfiMBFv1k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N2pxX2ocLN/vziq/+N+g3mKZmUEyYMeLbKR/QSGroY+3cRQ2j5yp0pYmwFDw6zxhe
	 gQIbhWQFWbnaFbeeuWSal59ZfqfqWmVBJal7l435awL8nMCwa+QwbCB59XrXAndh5f
	 YuvdW3+VpKKl+eMkIvlshL6l/ZU8M/d9ZWzCFsfH5GgfKt2Gtir/IAGLyh1+Ngqa6q
	 Z4A3OlT3X9Nkri/wOejAvNC5FfxipzeDbrlsxEcgMjDkjaQWJWuGx6/mDfC/AXZeTc
	 YdFyMzoAlSpiQ6CEh5YKLkqvYlbuR82xpFw/rdA0bl4st81ZJcoIgY4x3ytpce0+Id
	 G0nxoD/GSjHuQ==
Date: Sat, 8 Feb 2025 20:40:29 -1000
From: Tejun Heo <tj@kernel.org>
To: void@manifault.com, arighi@nvidia.com, multics69@gmail.com
Cc: linux-kernel@vger.kernel.org, sched-ext@meta.com
Subject: Re: [PATCHSET sched_ext/for-6.15] sched_ext: Event counter updates
Message-ID: <Z6hN3bmSMTQVB9gI@slm.duckdns.org>
References: <20250208084229.1274399-1-tj@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250208084229.1274399-1-tj@kernel.org>

On Fri, Feb 07, 2025 at 10:42:14PM -1000, Tejun Heo wrote:
> Hello,
> 
> This patchset contains the following three event counter updates:
> 
>  0001-tool-sched_ext-Event-counter-dumping-updates.patch
>  0002-sched_ext-Count-SCX_EV_DISPATCH_LOCAL_DSQ_OFFLINE-in.patch
>  0003-sched_ext-Add-SCX_EV_ENQ_SKIP_MIGRATION_DISABLED.patch

Applied to sched_ext/for-6.15.

Thanks.

-- 
tejun
