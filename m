Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0DD01EB18D
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 15:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747840697; cv=none; b=BytsdmkUtPXMokaYgRZW+1buEDwdcGjnzqxMwl3IuKEkT0KFr3RzfDqeBRuSFJsWChFiBK8bDZT6BLZYaArDuDTdRJ0pI7itUcA9WJEsRPy6NsNfr9OkBplt6JU0PdmmAii3tH/R5GNmYvnJboD55mccT1ekNeQi+x5L7Bmurf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747840697; c=relaxed/simple;
	bh=v2m6vAPGB5wp0Q/4PL9Vb957820dDG/Gx1nDbNXQUtM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NkW2994fQ9dkSEk7tSqTAAeOoY40gzB+P63/vPoKCmYp3Ccfr+7S7uNze/E2EqRaoslp3XJukL4ZcAquuQ9ap+iyjYGerTsj5QZbonojo+jjEpH8cN0KbUpypMTR4evQlUE5+imSVpdrNJx5HYVDxEr3OMC2kTgLJhBlhp7TqTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=UiV707An; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="UiV707An"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=CvdYKerDHmNMlOHDfBEif1LCoHW5CK6Ve9E47JRA324=; b=UiV707Anfw4FxyUfIIfSuvfglL
	JSMS9Aus6VK/4DKu9DCBDGzY77I7IpWQTY6mr4faSyyCl46m+5E6rzj4twy8m2pdKy3KsQPvK0QX/
	p/BJWyplWiHjbCHgg2Hby8t4x5qCkbx2hmPVgc5V8v9lv7K4Fe6RBuVuKYMuEshjyjO+t0wXm6oJB
	9zOscoSKevURZBW+VVIR0iLPH1UTLVdLAf5PFPI9B9xuREOHo5I1zM1xMB0nUsDoFx1La2rcu8yq9
	WumBS8h76eo8tetfe9WEVz+MuSwKB2E4I2krFOPI6SnJJVguGCXGEL6lLV8AxjJejMpHFf/3TkxKk
	TpeeXeYg==;
Received: from [191.204.192.64] (helo=[192.168.15.100])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1uHlCg-00BGaE-Qz; Wed, 21 May 2025 17:17:59 +0200
Message-ID: <39acb89b-c376-4e12-aa86-2b78e8842334@igalia.com>
Date: Wed, 21 May 2025 12:17:53 -0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] drm: Create a task info option for wedge events
To: Raag Jadav <raag.jadav@intel.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 siqueira@igalia.com, airlied@gmail.com, simona@ffwll.ch,
 rodrigo.vivi@intel.com, jani.nikula@linux.intel.com,
 Xaver Hugl <xaver.hugl@gmail.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com, amd-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
References: <20250520163243.328746-1-andrealmeid@igalia.com>
 <20250520163243.328746-2-andrealmeid@igalia.com>
 <aC2Yq89IL5tx8MY3@black.fi.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <aC2Yq89IL5tx8MY3@black.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Em 21/05/2025 06:11, Raag Jadav escreveu:
> On Tue, May 20, 2025 at 01:32:41PM -0300, André Almeida wrote:
>> When a device get wedged, it might be caused by a guilty application.
>> For userspace, knowing which task was the cause can be useful for some
>> situations, like for implementing a policy, logs or for giving a chance
>> for the compositor to let the user know what task caused the problem.
>> This is an optional argument, when the task info is not available, the
>> PID and TASK string won't appear in the event string.
>>
>> Sometimes just the PID isn't enough giving that the task might be already
>> dead by the time userspace will try to check what was this PID's name,
>> so to make the life easier also notify what's the task's name in the user
>> event.
> 
> ...
> 
>> -int drm_dev_wedged_event(struct drm_device *dev, unsigned long method)
>> +int drm_dev_wedged_event(struct drm_device *dev, unsigned long method,
>> +			 struct drm_wedge_task_info *info)
>>   {
>>   	const char *recovery = NULL;
>>   	unsigned int len, opt;
>> -	/* Event string length up to 28+ characters with available methods */
>> -	char event_string[32];
>> -	char *envp[] = { event_string, NULL };
>> +	char event_string[WEDGE_STR_LEN], pid_string[PID_LEN] = "", comm_string[TASK_COMM_LEN] = "";
>> +	char *envp[] = { event_string, NULL, NULL, NULL };
>>   
>>   	len = scnprintf(event_string, sizeof(event_string), "%s", "WEDGED=");
>>   
>> @@ -582,6 +586,13 @@ int drm_dev_wedged_event(struct drm_device *dev, unsigned long method)
>>   	drm_info(dev, "device wedged, %s\n", method == DRM_WEDGE_RECOVERY_NONE ?
>>   		 "but recovered through reset" : "needs recovery");
>>   
>> +	if (info && ((info->comm && info->comm[0] != '\0'))) {
> 
> Thanks for adding this. Should we check if pid > 0?
> 

Ack, added this for the v6.

> Also, I was wondering what if the driver only has info on one of the
> given members? Should we allow it to be flagged independently?

I think we can allow it, but for now I would say that we can wait for a 
driver that works like that to settle that.

> 
>> +		snprintf(pid_string, sizeof(pid_string), "PID=%u", info->pid);
>> +		snprintf(comm_string, sizeof(comm_string), "TASK=%s", info->comm);
>> +		envp[1] = pid_string;
>> +		envp[2] = comm_string;
>> +	}
>> +
>>   	return kobject_uevent_env(&dev->primary->kdev->kobj, KOBJ_CHANGE, envp);
>>   }
>>   EXPORT_SYMBOL(drm_dev_wedged_event);
> 
> ...
> 
>> diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
>> index e2f894f1b90a..c13fe85210f2 100644
>> --- a/include/drm/drm_device.h
>> +++ b/include/drm/drm_device.h
>> @@ -30,6 +30,14 @@ struct pci_controller;
>>   #define DRM_WEDGE_RECOVERY_REBIND	BIT(1)	/* unbind + bind driver */
>>   #define DRM_WEDGE_RECOVERY_BUS_RESET	BIT(2)	/* unbind + reset bus device + bind */
>>   
>> +/**
>> + * struct drm_wedge_task_info - information about the guilty app of a wedge dev
> 
> s/app/task, missed an instance ;)
> 
>> + */
>> +struct drm_wedge_task_info {
>> +	pid_t pid;
>> +	char *comm;
>> +};
> 
> Raag
> _______________________________________________
> Kernel-dev mailing list -- kernel-dev@igalia.com
> To unsubscribe send an email to kernel-dev-leave@igalia.com

