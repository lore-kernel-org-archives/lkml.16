Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F3023C8DE
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 16:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738946007; cv=none; b=DzPq8bES6WvovLuqDVXfslmKlpCgkPf2I6FpQ1FJtXvosVnVc9PXPZfI08yA5W3l1peMD32jsLmIkeyDv0MNKapUNipliJYdN/lDa2PEN9vh60KqYrtdCG8UhQzcs04nH3LyiVWE/FkdhHRMKnsxGZ34iI6xpzdm8rOzZ2KpP3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738946007; c=relaxed/simple;
	bh=N2uS9yWPLD4E6ZHEuCHhrIKMkX02v4Rz8ruwE/3Kq40=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rCH39pXt1e1Fnm4Fahrt+LeCdC3T+2qcBJfjgPuWeW8Puo/WPIZOFkl98tEJ1pftRyajekQh0IjwOaqCJF0xaizlHaDi8PY8CjrJzJaz2K7MYwpIl7gB44M28FmYH45Dpno7v49X5ELQ3zOHhZ2JbsLG3etWljalmid7uVCtq2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=qs3BCIO9; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qs3BCIO9"
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 436442BA;
	Fri,  7 Feb 2025 17:32:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1738945929;
	bh=N2uS9yWPLD4E6ZHEuCHhrIKMkX02v4Rz8ruwE/3Kq40=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qs3BCIO9noT5nVvOJY1+N8hSoVlybPDgYi+8fhLhLTLdudUtUI9LGIaNlkX0IfTGI
	 nQE9OAUWaj2ccAfl6PV6vBnjK4pqeYLt4XtjtVj0uTEkrGbhFaCxKP1hNNWUF9mKAM
	 RnQKXWodw5LuGpOKWkH3ffHekxGcesVWrYcf58bQ=
Date: Fri, 7 Feb 2025 18:33:17 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sean Anderson <sean.anderson@linux.dev>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	"open list:DRM DRIVERS FOR XILINX" <dri-devel@lists.freedesktop.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Michal Simek <michal.simek@amd.com>,
	Maxime Ripard <mripard@kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Bart Van Assche <bvanassche@acm.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	"moderated list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 1/2] drm: zynqmp_dp: Fix a deadlock in
 zynqmp_dp_ignore_hpd_set()
Message-ID: <20250207163317.GA5869@pendragon.ideasonboard.com>
References: <20250207162528.1651426-1-sean.anderson@linux.dev>
 <20250207162528.1651426-2-sean.anderson@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250207162528.1651426-2-sean.anderson@linux.dev>

Hi Sean, Bart,

Thank you for the patch.

On Fri, Feb 07, 2025 at 11:25:27AM -0500, Sean Anderson wrote:
> From: Bart Van Assche <bvanassche@acm.org>
> 
> Instead of attempting the same mutex twice, lock and unlock it.
> 
> This bug has been detected by the Clang thread-safety analyzer.
> 
> Cc: Sean Anderson <sean.anderson@linux.dev>
> Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> Fixes: 28edaacb821c ("drm: zynqmp_dp: Add debugfs interface for compliance testing")
> Signed-off-by: Bart Van Assche <bvanassche@acm.org>
> Reviewed-by: Sean Anderson <sean.anderson@linux.dev>
> Signed-off-by: Sean Anderson <sean.anderson@linux.dev>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> 
> (no changes since v1)
> 
>  drivers/gpu/drm/xlnx/zynqmp_dp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> index 979f6d3239ba..189a08cdc73c 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> @@ -2295,7 +2295,7 @@ static int zynqmp_dp_ignore_hpd_set(void *data, u64 val)
>  
>  	mutex_lock(&dp->lock);
>  	dp->ignore_hpd = val;
> -	mutex_lock(&dp->lock);
> +	mutex_unlock(&dp->lock);
>  	return 0;
>  }
>  

-- 
Regards,

Laurent Pinchart
