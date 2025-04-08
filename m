Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A1871DF25D
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 15:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744126459; cv=none; b=t83iitU0TTVOySAD3y6mI8ZPojd/GBtBQ98VcfyzTAzX4CyMtZai9w59+XJlrRPc1AuB02IqzZguNGyXpawc8HnTE1dH1mPPhWpWDkYcSUbhO2GoqZKJg8vQRxSdssblR3wBFVypPS3ftJGLikunYqAVvct1aQQcAPRCgVDoL18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744126459; c=relaxed/simple;
	bh=WQftzQO++oPoj/m65/7HbOAr97ECatUT7IUw/jtlkoU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jn9daYlUS1i3WmaQ8U5i3WksrG3NU9cI8DyjtmxKogaCFsVhmLJh4WbcVpQaEKg4OJFqu+GhrDnovT/7E1HgRKlmPMkxWeUutgo4fk2s2G5lPeF5i90o4v6kyyS+1PeIgvngEeOGbg27hEG/WPohWN/AUTSuufmHMaBwVA8yuww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NexMqlTX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NexMqlTX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8651C4CEE5;
	Tue,  8 Apr 2025 15:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744126458;
	bh=WQftzQO++oPoj/m65/7HbOAr97ECatUT7IUw/jtlkoU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NexMqlTXfGxWJCHOpLBOQoheYIDIr3/P4EbuJrPmMusoL4QXiYv0AYdkuOCJGfqGW
	 qM8P+Gs/DAStvJ9Nc0W/xEtb0MYTMjjFAbWkPZjXmFeCefpUJmZAJb4NeKFlJ162dQ
	 3HN4FQT0my2oZ+1WJSa/noN2KLHLQPnku0RkXz90CJ4YgyW+Pd4QjuA3R4uhcfZTdF
	 td/X5EQHYPzH9KXhnYSTFuVG1ufMiH1IEdD9OtQVkRj0wZWDUqjxFdPiCxVg2SY3sU
	 P/d3/dcVHvwingfQZvbQDqNCeXGRSSAGnsi0rf4W9t1jLfIG16tcnOJIIRX6tpWDHx
	 u63n1qXXlz0Aw==
From: Maxime Ripard <mripard@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maxime Ripard <mripard@kernel.org>
Cc: Philipp Stanner <phasta@mailbox.org>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] drm/tests: Fix drm_display_mode memory leaks
Date: Tue,  8 Apr 2025 17:34:13 +0200
Message-ID: <174412644317.1850669.11850198768886971879.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250408-drm-kunit-drm-display-mode-memleak-v1-0-996305a2e75a@kernel.org>
References: <20250408-drm-kunit-drm-display-mode-memleak-v1-0-996305a2e75a@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Tue, 08 Apr 2025 09:34:06 +0200, Maxime Ripard wrote:
> Here's a series that fixes some memory leaks in our kunit tests that
> eventually show up in kmemleak.
> 
> Let me know what you think,
> Maxime
> 
> 
> [...]

Applied to misc/kernel.git (drm-misc-fixes).

Thanks!
Maxime
