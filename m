Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 396B5DDC5
	for <linux-kernel@vger.kernel.org>; Sun,  4 May 2025 02:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746326828; cv=none; b=KThw2O9HwDrdz3I5ln3SB3m/QR6pfTMkTwAvE0RG/pJ5Md1KYcFSuIJvrB7t2DGtxDBfOI1PrHraEA5bOvoSRk/dYGTTKOxfPfRyAtmCbfgiS75RI7Ak0TIaVFrfb04pjsIuVCGDv8S0sGNpe4gonm2+t97VgKX+75wvma9xRWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746326828; c=relaxed/simple;
	bh=+tb4EU2xeCSRO3c4Utxz10S/ojPi5oloC8rK0bnzl9s=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=iRYUlfeuRT57jJxp3MskrH9Ol1QuefoBU2L4yUREO3US4rIcgJdtgG5shjGb1c3yo9jKrNkTytc2RlgY4oL8y+s+FdvSvkkuG/2ppcYuAsMPqFkr75QSwENDIz0XMGIMNrv+XyHUY2dk6wSsqrPCIAc1m/bOjOhbmd3sbWLL0BE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=jghvY3S9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="jghvY3S9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56137C4CEE3;
	Sun,  4 May 2025 02:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1746326827;
	bh=+tb4EU2xeCSRO3c4Utxz10S/ojPi5oloC8rK0bnzl9s=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=jghvY3S9FY2S2ro9AyDF6CD85vcjLRKFrhrT/2GYNrRcLybuBP2qme1IvQl5SSkmC
	 MBEIaXCwxjENd7tAjT58Z3vXB1KyatHKlZGJOcFzvOleHsbfwTAELJ0JJrHk7mTDJ8
	 IhEyTkZxFvwBly/k8F7o18KK2aYzcCgDsYHgIw6U=
Date: Sat, 3 May 2025 19:47:06 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Max Kellermann <max.kellermann@ionos.com>
Cc: song@kernel.org, joel.granados@kernel.org, dianders@chromium.org,
 cminyard@mvista.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] kernel/watchdog: add
 /sys/kernel/{hard,soft}lockup_count
Message-Id: <20250503194706.d9e775fe8b24ad357cc6db89@linux-foundation.org>
In-Reply-To: <20250502103905.3995477-1-max.kellermann@ionos.com>
References: <20250502103905.3995477-1-max.kellermann@ionos.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri,  2 May 2025 12:39:04 +0200 Max Kellermann <max.kellermann@ionos.com> wrote:

> There is /proc/sys/kernel/hung_task_detect_count,
> /sys/kernel/warn_count and /sys/kernel/oops_count but there is no
> userspace-accessible counter for hard/soft lockups.

Documenation/, please?

>  Having this is useful for monitoring tools.

Useful how?  Use cases?  Examples?

A proposal to permanently extend Linux's userspace API requires better
justification than an unsubstantiated assertion, surely?
