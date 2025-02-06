Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com [91.218.175.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F17A6155757
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 20:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738874277; cv=none; b=dpphDt9RHKK/EOMCMKitxOvNirnk7Ca0GI+AppiHTJincWPuBFPY7uMn6r5HnGoP+UrYdTgIxb0DmTDZZu6Im1iKOxM5auEDE9N8Lay1NG98nxbjzfJMquuhgP3d1mf7ocwIxyr/ocsEYcPOLbrPvuOfEPyy0EGrsaeYbrrpELg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738874277; c=relaxed/simple;
	bh=d2S6LVuw5wM6nf1bhAaUGVYLS5mNaLkwan2nlfc8Qs8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aLLJITIotPBrykMreCIcAz2VYCRTYUEk9oYVlCIlC3vEco/fdtsRffe0edcRmv92jNgSYJnHldeqDz16VTC8MrwLyGn7O3XrZyZdkfNZwTnucsU2UYjFV+q0AJ6Oy9L0P91bbfYMQ+ANl9ElaHLFGgtLxE1zyPp157nSfEzPm3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=pBG5+4mV; arc=none smtp.client-ip=91.218.175.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="pBG5+4mV"
Message-ID: <c10a8643-6f6f-4428-91a7-e7f5c92a3f58@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738874272;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/WyK6vRoG5SvaOVIStlOKOP4rX2lqtxKCb+Y8Y6C15k=;
	b=pBG5+4mVjB1wCwVfamE6jbu2Sp4OgvrtK4kKPXsOUOYbYZ47J0onJi1xzn5vqNhXDlyRAY
	rqs93SbLUS5C4BHgrpb7jrGORPH9aeagOaEDLkJ78/XP+gcJHXMaqfjexUnQQd6QPBd0gy
	39hovJ3GT+kdg0GIvNOQlePzERbQnXU=
Date: Thu, 6 Feb 2025 15:37:48 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] drm: zynqmp_dp: Use scope-based mutex helpers
To: Bart Van Assche <bvanassche@acm.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 "open list:DRM DRIVERS FOR XILINX" <dri-devel@lists.freedesktop.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 "moderated list:ARM/ZYNQ ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>, David Airlie <airlied@gmail.com>,
 Dan Carpenter <dan.carpenter@linaro.org>, Michal Simek
 <michal.simek@amd.com>, Maxime Ripard <mripard@kernel.org>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
References: <20250206194117.1496245-1-sean.anderson@linux.dev>
 <20250206194117.1496245-3-sean.anderson@linux.dev>
 <373d62da-810f-492c-af2f-53b32cc90b33@acm.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <373d62da-810f-492c-af2f-53b32cc90b33@acm.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 2/6/25 15:31, Bart Van Assche wrote:
> On 2/6/25 11:41 AM, Sean Anderson wrote:
>>   static int zynqmp_dp_enhanced_set(void *data, u64 val)
>>   {
>>       struct zynqmp_dp *dp = data;
>> -    int ret = 0;
>>   -    mutex_lock(&dp->lock);
>> +    guard(mutex)(&dp->lock);
>>       dp->test.enhanced = val;
>>       if (dp->test.active)
>> -        ret = zynqmp_dp_test_setup(dp);
>> -    mutex_unlock(&dp->lock);
>> +        return zynqmp_dp_test_setup(dp);
>>   -    return ret;
>> +    return 0;
>>   }
> 
> Has it been considered to combine the two return statements into one
> with the ternary operator (?:)?

I didn't consider it, but the line is short enough that I can add it.

>> @@ -2053,7 +2039,8 @@ static ssize_t zynqmp_dp_custom_read(struct file *file, char __user *user_buf,
>>           return ret;
>>         mutex_lock(&dp->lock);
>> -    ret = simple_read_from_buffer(user_buf, count, ppos, &dp->test.custom,
>> +    ret = simple_read_from_buffer(user_buf, count, ppos,
>> +                      &dp->test.custom,
>>                         sizeof(dp->test.custom));
> 
> This change has not been mentioned in the patch description and is not
> related to the other changes in this patch?

I think I made this change while refactoring, but it turned out not to
be necessary. I will remove it for the next revision.

--Sean
