Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F6B223338
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 20:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749675452; cv=none; b=kiZyiQJxG7XPEsTF47Zck18zH8XrWAuVaNXebq8NeuNGuDOOtZwCP/YFz8Dkx/LIx1+N6c6etLNgXMN0vznk3AbyyTCZVUPqVBFkt6JwqFB+kSPaQ4xD45aICgmIYWk+CllT63XUSUFh1oc/Q+MnZRCD7XCaFrJJbXUdVvHf1/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749675452; c=relaxed/simple;
	bh=0SYKc89+ujYfKWoibjSuje0HzopRlgfCFwPiSciF2jA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HjTnJu3R2NqYt1JxYJ1uwX2oGCkYgfg8PQWuNCzKLR9LAQfg7hXm3tXv48HCvjVfhIaIYBRnx8hM9Ti3iC/AUORM1UpXe50blDMihg4oWzXq/XORcNLWfMHHzWBEjp6v/iR7zq0HAsU2MGs5zogZHVMvsVa33r1GaaunhCuFtPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P2O7EgIw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P2O7EgIw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA99FC4CEE3;
	Wed, 11 Jun 2025 20:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749675451;
	bh=0SYKc89+ujYfKWoibjSuje0HzopRlgfCFwPiSciF2jA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P2O7EgIwwQF/zJb1mAYQ8rOdHOVfKcLacTYOtWQ4wGgOE+Op+wwoKYwogW0PxRD0l
	 qPFm9T1QordD04KzTDEYQs9KZ8S0F796L31/3cKYyECdY011/CKuMzZCwcN9h+JWjh
	 cbAFWn4//56kOOCtgWnuNELjUkQj7l3I1d93gwoKR3nKOK/OD64Yy/IVLmr+3wIWu1
	 qRQK89qt4S+Qr+uVvwr0fdsWicdNdaV07tP2EGVXdsMb7kO0yV7TmR+YpiOzxvoqip
	 F643jmLN852q7VkK58FesQw5OFQJ98PS2UpN+i6GQ+SJ4Py7wvS/jReVArjRZNt3cU
	 KBZz9xFz7Ushw==
Date: Wed, 11 Jun 2025 10:57:29 -1000
From: Tejun Heo <tj@kernel.org>
To: Marco Crivellari <marco.crivellari@suse.com>
Cc: linux-kernel@vger.kernel.org, Lai Jiangshan <jiangshanlai@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Michal Hocko <mhocko@suse.com>
Subject: Re: [PATCH v3 1/9] Workqueue: add system_percpu_wq and system_dfl_wq
Message-ID: <aEntuUxOGU1DA7Fu@slm.duckdns.org>
References: <20250611131438.651493-1-marco.crivellari@suse.com>
 <20250611131438.651493-2-marco.crivellari@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250611131438.651493-2-marco.crivellari@suse.com>

On Wed, Jun 11, 2025 at 03:14:30PM +0200, Marco Crivellari wrote:
> -extern struct workqueue_struct *system_wq;
> +extern struct workqueue_struct *system_wq; /* use system_percpu_wq, this will be removed */
> +extern struct workqueue_struct *system_percpu_wq;
>  extern struct workqueue_struct *system_highpri_wq;
>  extern struct workqueue_struct *system_long_wq;
>  extern struct workqueue_struct *system_unbound_wq;
> +extern struct workqueue_struct *system_dfl_wq;

This patch is just adding the extern decls. Shouldn't these be created?

Thanks.

-- 
tejun
