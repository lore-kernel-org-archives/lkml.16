Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1032951AE
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 13:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747057276; cv=none; b=qy0/SPyL+PMksGGtlelTZiXxKybyWuzNkoRNoY+ZMA0WN0NK4vhoien/+yp+gC8+S8HsOjwqX/JW5UPZDzbK3vdhoiIR4x5ysnl2QlHeiaYR1DJydsrKLMmRuJVMrDMTIZOXc/1UK3ojUnbktFaVnkmyTSMF7N/OYg+Am/eQMYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747057276; c=relaxed/simple;
	bh=Fj1YnEmAnUyJ38wHvYld2l/KQQX9tZNAVl2z+GqAxso=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Djj6rabhHVGeRIAgn32E2G7em4zuRlviVe9y4KaHQ+DSIYCRV311/mAwaqQWCUfnlmP6LER5hXZVVJc921k4N8gLOUW38YffnoZ1nGDHRUWwfmLOA8k1hdGgvr7CTim3G1OH8Nf6Dq0sVrGF6PyqwbV4BrJVcEjGb4229kMRVWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=FzO9mzHc; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="FzO9mzHc"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=kj0xD8FPYRcjZw2mQNJ4IqSPTRwkMeeQixKqAC0S9kk=; b=FzO9mzHc2pYWwR3HJIdsbAr7wo
	cJsZXLJWlMd82Z4n7H+UBE733uHKnv9t/O9hdsqGoY/8jgwvyWata8IchIoiMIklT1Bpb4WbSMSQK
	TpfYKZ2JUnm2aImBdwzkiLVAQ2hc7NHz0jbXXmBozwe4aiQxEogkjd0NCQaGNi0CGeQVPckBP8WJr
	jfDtuQ91m6EbErL83pk6E833LWDzkJ3qkPvbHA+Au18zvMVnr85MbyK+Xed8jVtDyQ1Wm3VX8mwio
	pPhlMcMdw9NDZk0757/B7llu8F1lYaCWnsVc+H3U5EHJ5lhcoJkpPaiI49vRnEM4Y6m7KjMwXc14b
	M0iMsWIA==;
Received: from [191.204.192.64] (helo=[192.168.15.100])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1uETJb-0076X9-K9; Mon, 12 May 2025 15:40:52 +0200
Message-ID: <bd1bfb32-1da3-4680-94f8-44e8008a80f9@igalia.com>
Date: Mon, 12 May 2025 10:40:46 -0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] drm: Create an app info option for wedge events
To: Krzysztof Karas <krzysztof.karas@intel.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 siqueira@igalia.com, airlied@gmail.com, simona@ffwll.ch,
 Raag Jadav <raag.jadav@intel.com>, rodrigo.vivi@intel.com,
 jani.nikula@linux.intel.com, Xaver Hugl <xaver.hugl@gmail.com>,
 "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com, amd-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
References: <20250511224745.834446-1-andrealmeid@igalia.com>
 <20250511224745.834446-2-andrealmeid@igalia.com>
 <x3ep3offdy5on6hckumvpsvnlfnmjdfqjlcyv7hojitzsn5u3k@opnou6grp7ad>
Content-Language: en-US
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <x3ep3offdy5on6hckumvpsvnlfnmjdfqjlcyv7hojitzsn5u3k@opnou6grp7ad>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Krzysztof,

Thanks for the feedback.

Em 12/05/2025 03:08, Krzysztof Karas escreveu:
> Hi André,
> 
> [...]
> 
>> @@ -582,6 +584,14 @@ int drm_dev_wedged_event(struct drm_device *dev, unsigned long method)
>>   	drm_info(dev, "device wedged, %s\n", method == DRM_WEDGE_RECOVERY_NONE ?
>>   		 "but recovered through reset" : "needs recovery");
>>   
>> +	if (info) {
>> +		snprintf(pid_string, sizeof(pid_string), "PID=%u", info->pid);
>> +		snprintf(comm_string, sizeof(comm_string), "APP=%s", info->comm);
>> +	} else {
>> +		snprintf(pid_string, sizeof(pid_string), "%s", "PID=-1");
>> +		snprintf(comm_string, sizeof(comm_string), "%s", "APP=none");
> 
> I think using PID=-1 and APP=none might be misleading, because
> something did cause the wedge if we landed here. You could use
> "PID=unknown" and "APP=unknown" or ensure these arrays are
> zeroed and fill them only if "info" is available:
> 
> -     char *envp[] = { event_string, NULL };
> +     char pid_string[15] = {}, comm_string[TASK_COMM_LEN] = {};
> +     char *envp[] = { event_string, pid_string, comm_string, NULL };
> 
> [...]
> 
> +     if (info) {
> +             snprintf(pid_string, sizeof(pid_string), "PID=%u", info->pid);
> +             snprintf(comm_string, sizeof(comm_string), "APP=%s", info->comm);
> +     }
> 
> Then, when printing the logs later you could check if they have
> a value and only use them if they do (or handle that however
> you would see fit :) ).
> 

That works for me, I will address this in my v3.
Thanks!

> Best Regards,
> Krzysztof

