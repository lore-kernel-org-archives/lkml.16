Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98F57288C36
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 18:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750098934; cv=none; b=GBsACiWCc9qfU4qlLzxoi9ShBmMnxFgYNk5BzRJ5RJT7gJsUtobz+TIGQzSWkmqd7EE0O56NghC5Gg6Q9fZ7b1i1olrsZ/B1mkUBTyGh2W8rvG83N+uMQJufSHFdU0gGy4B7N5Aw5kc8qRnHfaix41iUN+zQNZycWUwShkPsrQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750098934; c=relaxed/simple;
	bh=+IMnTTyPqcmFB/4AWE+7GY8tKKmVnFEnHuSZqGVz/Rg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W5mnaVcQYXAGy00/fz2LvT+j1MQmDHmGD0MHayQVyITSIkITi2cKxSpSprGiE/jZ9hambq+XUn2BPymo5KPUUjZLIcQpygAP8We49mWVDEmQcRIkH+AZBo49P5pQahZiFjTUVqDuw38Rr8DIjjzFdZcUmgFGPSKfe+iY5tCVBLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rsWk679q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rsWk679q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02EDCC4CEEA;
	Mon, 16 Jun 2025 18:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750098934;
	bh=+IMnTTyPqcmFB/4AWE+7GY8tKKmVnFEnHuSZqGVz/Rg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rsWk679qSKHDL58PF/BCU3O4aSFL+90ymX1Z/ivHnz9kfF6tKkVQbZBggR7iDj9E+
	 9rVC6CsAmU0qr7AtdipqrKn5EA/TjG5px/CsjEai0gCzbM0weP93UDULLPDuqxlclw
	 74Tiv1ucWMRSLtT71WTFZTMrMVRXOFc6x97lxLghnF7+XCCZ1nPHuuxjgXJjgW0ORb
	 691EqCPDHUr8iN0Ssc3uT9/zIPACuAf5FQ/yk4/n8KAF7sWqnPJx8zjIL9zspyuYuB
	 BQPZQlx0mPmGkFa8icc0S/+3J2HCRq+OV1vdKFx/rH3Lr59oOedMDee2Vxp2Yf2Fvn
	 ee7/Q9qIKVj5Q==
Date: Mon, 16 Jun 2025 08:35:32 -1000
From: Tejun Heo <tj@kernel.org>
To: Marco Crivellari <marco.crivellari@suse.com>
Cc: linux-kernel@vger.kernel.org, Lai Jiangshan <jiangshanlai@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Michal Hocko <mhocko@suse.com>
Subject: Re: [PATCH v5 0/3] Workqueue: add WQ_PERCPU, system_dfl_wq and
 system_percpu_wq
Message-ID: <aFBj9PXQiw-7O6yQ@slm.duckdns.org>
References: <20250614133531.76742-1-marco.crivellari@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250614133531.76742-1-marco.crivellari@suse.com>

On Sat, Jun 14, 2025 at 03:35:28PM +0200, Marco Crivellari wrote:
> Marco Crivellari (3):
>   Workqueue: add system_percpu_wq and system_dfl_wq
>   Workqueue: add new WQ_PERCPU flag
>   [Doc] Workqueue: add WQ_PERCPU

Applied 1-3 to wq/for-6.17. I applied as-is but the third patch didn't need
to be separate. Maybe something to consider for future.

Thanks.

-- 
tejun
