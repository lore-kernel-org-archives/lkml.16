Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 721242451CC;
	Thu,  6 Feb 2025 14:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738852104; cv=none; b=GlDLn9ViI8HPW4qcn6TmhZVLTC7s8wNjyZEzCnHhkcaRoUfywZD8Mgl+loYWe7pB8BNqNX+iR8WjDQsUkti8+dbTbeIewjTtp7G5deh6BtRkTcHVTUd/v3cupqxfyvCaNLhBFaOmRXMiwxcp6VUL8CDS3u8qg4L6CF4KBgCWbmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738852104; c=relaxed/simple;
	bh=5dHO2uISmLAPd95UXY1NrF8hFc9+Lsizkm6WGbhVDx4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yo1zfHslxLhaTrC8pglKS7bGC4N1/UKdwKPZt9/9IpwEnjVNWAw3nNtG5btzUkQov/49LBWyC5Sghr7UxAshgrkx9lkZgZEF5A5vkC+f2QUrtqdyS0gC7qFhr3A0ptyJzgDH3K1vlnmxY/+7ZxihdAOfqC7GKwFzOP6t2VL2jGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Nyx8VuQR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Nyx8VuQR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80CFEC4CEDD;
	Thu,  6 Feb 2025 14:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1738852103;
	bh=5dHO2uISmLAPd95UXY1NrF8hFc9+Lsizkm6WGbhVDx4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Nyx8VuQRBWEsjJ/Wm0m5/6l13EV47gprP4AGvVWi9RRvLoUtyq7dHQCBzvI/m6aTZ
	 DTWNyaazH2PUPoYMagTdo2ucO07VwbtqDZYLrl3bFhuNg4fRJA6qOLE3Rcz6BdQpeR
	 VWU8zcmdNqFmjxJtHlBlPAV2TsBHr3dPmDt+XdBQ=
Date: Thu, 6 Feb 2025 06:50:40 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: WangYuli <wangyuli@uniontech.com>
Cc: stern@rowland.harvard.edu, linux-usb@vger.kernel.org,
	usb-storage@lists.one-eyed-alien.net, linux-kernel@vger.kernel.org,
	zhanjun@uniontech.com, guanwentao@uniontech.com,
	chenlinxuan@uniontech.com, Xinwei Zhou <zhouxinwei@uniontech.com>,
	Xu Rao <raoxu@uniontech.com>,
	Yujing Ming <mingyujing@uniontech.com>
Subject: Re: [PATCH] usb-storage: Bypass certain SCSI commands on disks with
 "use_192_bytes_for_3f" attribute
Message-ID: <2025020649-say-maturing-c061@gregkh>
References: <AC1BB7F0327EFB9C+20250206054107.9085-1-wangyuli@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AC1BB7F0327EFB9C+20250206054107.9085-1-wangyuli@uniontech.com>

On Thu, Feb 06, 2025 at 01:41:07PM +0800, WangYuli wrote:
> @@ -369,6 +370,13 @@ static int queuecommand_lck(struct scsi_cmnd *srb)
>  		return SCSI_MLQUEUE_HOST_BUSY;
>  	}
>  
> +	if (srb->cmnd[0] == MODE_SENSE && sdev->use_192_bytes_for_3f == 1 &&
> +		srb->cmnd[2] == 0x3f && srb->cmnd[4] != 192) {
> +	   srb->result = DID_ABORT << 16;
> +	   done(srb);
> +	   return 0;
> +	}
> +

Please always run scripts/checkpatch.pl on your changes before sending
them out so you don't get a grumpy maintainer asking why you didn't run
scripts/checkpatch.pl on your patch :(

thanks,

greg k-h
