Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9BF5285412
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 15:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747668851; cv=none; b=gN17SK53mJiQ9ObOHl3hcQOEGNTvYnaL10Th+CRdWbaozmVKTRzE3NwyMv9Mlg2nGqSt4ZtqXfnvW0gpIs6tLTD/TBCPkikSojfqYAqCPaZuRgt8UxjC6P14JCjLyHJHyqvM3iSesZ5XEiYbmgSKdb3Ar/WNnOQl4ZrYTeApQRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747668851; c=relaxed/simple;
	bh=DCOXc0NI85IirLGyEljEzY9WQiSNKDiEnqVOnUu/m3s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kkKWT1kApSHlx06EnKsoOVvXYFxOORSDyO1cLLPrReu+Ke4e76ud+DpMA2OUDqt2vhu7Mu5jDq4PwtDIdxM8iMrkH81583jaWQ0tR1zP8bLWz6f1aSZveNPKGHo5PpxnAgm3x8k1QcAhr2OOeYJq+j4nJApxfDJxnAYZsNIoWfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b3RV5Eel; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b3RV5Eel"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E39CBC4CEE9;
	Mon, 19 May 2025 15:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747668850;
	bh=DCOXc0NI85IirLGyEljEzY9WQiSNKDiEnqVOnUu/m3s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b3RV5Eel0fRFAkNCz4y4TnLwMba2dLb2Z9V3fdlQQ01oIS0ksDvAylw8NW9GKVl2a
	 O2/79xLZk9kPlrqpXdMvAQu91DNczO9c6ec2UIldFeR/xZSGngnGR229ZJhegd3qy2
	 55INKOWUdP2EJAhpMWpfot6Vw06zEI773hwPviEC6K62wAlcpho/DeZRdW3YVcuB72
	 S5KlrSck15l398iSRn1fFOR6lgjYo9tbSABI2YeXzC2JS1PWSeZIk8RF44OxXMiIlQ
	 0fMxCx62syEtDCT065nvjIYn3U/yz82gCbcSfKzSJhwUuR945JSnkkHHv7vVXVzcK7
	 sAROn48AzFrtQ==
Date: Mon, 19 May 2025 17:34:05 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Cc: Matthew Brost <matthew.brost@intel.com>,
	Philipp Stanner <phasta@kernel.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 03/10] drm/sched: add device name to the
 drm_sched_process_job event
Message-ID: <aCtPbUaah-bmcEMk@pollux>
References: <20250424083834.15518-1-pierre-eric.pelloux-prayer@amd.com>
 <20250424083834.15518-4-pierre-eric.pelloux-prayer@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424083834.15518-4-pierre-eric.pelloux-prayer@amd.com>

On Thu, Apr 24, 2025 at 10:38:15AM +0200, Pierre-Eric Pelloux-Prayer wrote:
> diff --git a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> index f56e77e7f6d0..713df3516a17 100644
> --- a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> +++ b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> @@ -42,6 +42,7 @@ DECLARE_EVENT_CLASS(drm_sched_job,
>  			     __field(uint64_t, id)
>  			     __field(u32, job_count)
>  			     __field(int, hw_job_count)
> +			     __string(dev, dev_name(sched_job->sched->dev))

Using the sched_job->sched pointer here and in other trace events implies that
the trace event must not be called before the sched_job->sched has been set,
i.e. in drm_sched_job_arm().

Please document this for the corresponding trace events.
