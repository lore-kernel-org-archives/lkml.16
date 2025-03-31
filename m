Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C10CF1D5160
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 15:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743433394; cv=none; b=cL/eNMfEXuv1DEkVnFk7NLFcSZGb9DSpVXgNBthLXmTNvkJjF7KgFRajujbAVMrOnqPsblmsxLwh9kJmOlAvksRUol9HxnGIiUDE+N/XDf9xx82cUajh0A4F/ktaCyXrxfvt/Q0SLmTYSEx+8ESRzpHlbBxpCnWAwPnKUm0wJBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743433394; c=relaxed/simple;
	bh=qbx82Y2/6IQ2gEQKBF1QXMQQkYu0QqCxMvkhutduH1c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aHqVyTRVeyIDGSmupMONnUFNQI9Jr+NfIhezG8IP8HArbPsnKWCqeUVbjNJAzu4sf1HhsD2/Jtx4BMmnpJM3SW79XMTm3/R5G3PwW5sDtFTOL51etHhV7FExAcxtnZCD/xNoIJqFpqNo7QANX7iKPKt/rlOOjt+F5EL+OofTcTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rcYfRvYe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rcYfRvYe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6305C4CEE3;
	Mon, 31 Mar 2025 15:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743433394;
	bh=qbx82Y2/6IQ2gEQKBF1QXMQQkYu0QqCxMvkhutduH1c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rcYfRvYeVQO9zwe5S+WKsp/sYS4C92zi4cL5VbSbXMSPwg8QDBdlJpniRIPDhjbSt
	 7BDFnxUXXjHhvzQRgzRflIBG2n1oYMhmJtdvHHLqyYEIpGi1WCUu/H/QhNn+UDE8lF
	 7ehXX6r/p9BWMdGkc5uI19vF0R3do6Xqyxxc8Wuh7KEa8mR6lten05KBo7upyKifsu
	 iXweFZhXUHFQZQD41luMJ7Nz2oNEHTsA0CSrsGHrGYJ9txrFVwKQbGz+DtAnkbs0JT
	 RQ4iBqcmwTrWDebGGOBz1yF8dgsnRrg5v6dSi8BnzbylsVwVpIUkZ5CoA11a+hWJrN
	 Jh3P3RHzt7QyQ==
Date: Mon, 31 Mar 2025 09:03:11 -0600
From: Keith Busch <kbusch@kernel.org>
To: Kamaljit Singh <kamaljit.singh1@wdc.com>
Cc: axboe@kernel.dk, hch@lst.de, sagi@grimberg.me,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
	niklas.cassel@wdc.com, damien.lemoal@wdc.com
Subject: Re: [PATCH v1 1/1] nvme: add admin controller support. prohibit ioq
 creation for admin & disco ctrlrs
Message-ID: <Z-qur5YnK2ZtiRR3@kbusch-mbp.dhcp.thefacebook.com>
References: <20250328213640.798910-1-kamaljit.singh1@wdc.com>
 <20250328213640.798910-2-kamaljit.singh1@wdc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250328213640.798910-2-kamaljit.singh1@wdc.com>

On Fri, Mar 28, 2025 at 02:36:40PM -0700, Kamaljit Singh wrote:
> -static inline bool nvme_discovery_ctrl(struct nvme_ctrl *ctrl)
> -{
> -	return ctrl->opts && ctrl->opts->discovery_nqn;
> -}
> -

I suppose it's fine to rename this function with an nvmf_ prefix, but
it's not really related to the rest of the patch and makes the diff
larger than necessary.

> +	/* An admin or discovery controller has one admin queue, but no I/O queues */
> +	if (nvme_admin_ctrl(&ctrl->ctrl) || nvmf_discovery_ctrl(&ctrl->ctrl)) {
> +		ctrl->ctrl.queue_count = 1;
> +	} else if (ctrl->ctrl.queue_count < 2) {
> +		/* I/O controller with no I/O queues is not allowed */
> +		ret = -EOPNOTSUPP;
> +		dev_err(ctrl->ctrl.device,
> +			"I/O controller doesn't allow zero I/O queues!\n");
> +		goto destroy_admin;
> +	}

The queue_count comes from the user. If the user provides a bad value
for an IO controller, you're erroring. If they provide a bad value for a
discovery or admin controller, you override the value. Why the different
behavior?
