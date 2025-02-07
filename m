Received: from out-176.mta0.migadu.com (out-176.mta0.migadu.com [91.218.175.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4572C1922E1
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 17:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738947998; cv=none; b=TVDeEBuOiEmI7rzfYATVOhm+FKkYY0nL6yyzK50wVtQkvQLQMrn+bfJyJu2B4figTQ5EkPMQJqg20kwwOqkx+TW1Fz+cD7DvW2s1l4k1YUcX515kcInUQKbejfnB/e7AUxHgw6Odb0WWs7eSTa110aBRP4kMPWKheY4b4+JQxF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738947998; c=relaxed/simple;
	bh=Bxs5SzkEtmQf8TPctGJb+f4Z2yMYWkgKeXx0Sq6oEvA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mpj36+/VHbkZZnuiC1l1vZu1Tln2D3QoQ7f+IweHU3qzak9oXLOjCW8+T+O0otba43wVcbKaDbdI154QSy5pIveAlSsg8RZJH5AHObOvW0pwZ6PoDImiSSWNkRwDxuTZie6STSBsZ5d4B3nYq/plJlWDTcjoZNEi0izcHuPULHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=sVzyMsw+; arc=none smtp.client-ip=91.218.175.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="sVzyMsw+"
Message-ID: <5f05d772-5d25-4b94-8759-95db3e283a6f@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738947989;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pLksYmtV/LGt/QTVyUj/Eiqdx1WVJtDb2zhhPRveb5w=;
	b=sVzyMsw+PCLFyI241R6uxQ3C1W6cBpXLiQUfQFbDCzlMAi4VjyoHKX/YOL5/cMk4dM9GA5
	8a4QS7E4snoI1vvGguhgu14FD7fjN9KNLFEAvL1Cds7x+k2hj2FKrcDt6BhCqOARffRXQZ
	JtmxmwZ4DbHEGjiPY8B7/plBkC4rUIE=
Date: Fri, 7 Feb 2025 12:06:25 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 2/2] drm: zynqmp_dp: Use scope-based mutex helpers
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 "open list:DRM DRIVERS FOR XILINX" <dri-devel@lists.freedesktop.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Michal Simek <michal.simek@amd.com>, Maxime Ripard <mripard@kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Bart Van Assche
 <bvanassche@acm.org>, Dan Carpenter <dan.carpenter@linaro.org>,
 "moderated list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
References: <20250207162528.1651426-1-sean.anderson@linux.dev>
 <20250207162528.1651426-3-sean.anderson@linux.dev>
 <20250207164446.GB24886@pendragon.ideasonboard.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <20250207164446.GB24886@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 2/7/25 11:44, Laurent Pinchart wrote:
> Hi Sean,
> 
> Thank you for the patch.
> 
> On Fri, Feb 07, 2025 at 11:25:28AM -0500, Sean Anderson wrote:
>> Convert most mutex_(un)lock calls to use (scoped_)guard instead. This
>> generally reduces line count and prevents bugs like forgetting to unlock
>> the mutex. I've left traditional calls in a few places where scoped
>> helpers would be more verbose. This mostly happens where
>> debugfs_file_put needs to be called regardless. I looked into defining a
>> CLASS for debugfs_file, but it seems like more effort than it's worth
>> since debugfs_file_get can fail.
>> 
>> Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
>> ---
>> 
>> Changes in v2:
>> - Convert some conditional return statements to returns of ternary
>>   expressions.
>> - Remove unnecessary whitespace change
>> 
>>  drivers/gpu/drm/xlnx/zynqmp_dp.c | 147 +++++++++++--------------------
>>  1 file changed, 50 insertions(+), 97 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
>> index 189a08cdc73c..63842f657836 100644
>> --- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
>> +++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
>> @@ -1534,10 +1534,10 @@ zynqmp_dp_bridge_mode_valid(struct drm_bridge *bridge,
>>  	}
>>  
>>  	/* Check with link rate and lane count */
>> -	mutex_lock(&dp->lock);
>> -	rate = zynqmp_dp_max_rate(dp->link_config.max_rate,
>> -				  dp->link_config.max_lanes, dp->config.bpp);
>> -	mutex_unlock(&dp->lock);
>> +	scoped_guard(mutex, &dp->lock)
>> +		rate = zynqmp_dp_max_rate(dp->link_config.max_rate,
>> +					  dp->link_config.max_lanes,
>> +					  dp->config.bpp);
> 
> Could we use curly braces even for single-statement scopes ?
> 
> 	scoped_guard(mutex, &dp->lock) {
> 		rate = zynqmp_dp_max_rate(dp->link_config.max_rate,
> 					  dp->link_config.max_lanes,
> 					  dp->config.bpp);
> 	}
> 
> I think this would make the scope clearer.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

FWIW around 25% of existing scoped_guards use this style, and it seems
to be idiomatic for short scopes:

$ git grep scoped_guard | wc -l
523
$ git grep 'scoped_guard[^{]*$' | wc -l
156
$ git grep -A2 'scoped_guard.*{' | grep } | wc -l
25

--Sean
