Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E19E3E499
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 06:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738218891; cv=none; b=k5rZewzy8E7IMBXFcQChYIUdx2yCdDIHmsKpF80sKBN6XnbauNeKYEwjIvDhcA+eNPLcFwdODcuiG/xDSYZDpmGcujdxxdRPqTgxKw2UogR0eIloBXypuLDot9vX7GTR15Em74Wzkq4GXeMB8WbxJ858cFBMuCr1GDVOdbSQ/O4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738218891; c=relaxed/simple;
	bh=umRxmcln1w6W8rYCiqgOGzzG2nNKHePWU9MqDbfY8nY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hJt3hjGQJDOuGCbqEeJ+uBxS1kqiI4WlmlvYYCir4H2pGX0fdt26KaGzeoHJVMZAPCwFhqbjKIWzZT8WAjbJCQSXK2F6XazZEj4dI3+x+ra+OYKo/akQTKsHVwVIjy1a1lZbdD91LRMAVRB65FkRwuPeWm5fC4NXVFTu0VVUYQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=hYBuRiqO; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="hYBuRiqO"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=czfNIJighRgPBN4L+mxleultyMVnf90bvPaqpcLlcXw=; b=hYBuRiqOcKp0mi9zcKtFxu5fYh
	fmvg1nrKx80u0V78v+BPYaVJypu9IZPFQNQPwHwLpFeGHFNMxSqOwET1qbB4MsQ7v2++iPPDWY7U/
	KSAFid1bNnvEUh28oSmpWj9PG0FAApTQdvrZr3apowfuKwdCrOJBMy/dbvvHFaxfDP6OIsXFl6mHJ
	ewl/knwPsNnoyv77uPSzsL+3x/Q3yVjKlQfNP/fPXF5mqxoz3mueKkKGJ69cS6qt3ioXgsmAma94h
	5bSOEENPo5RDnAzSKrVclVyOvVcWaYzzb7+OhlFf6Bi49HXWQJ+IMIg7MD5nX/K9vOXCLMexDkRi5
	uqhvvlug==;
Received: from [58.29.143.236] (helo=[192.168.1.6])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1tdO8L-000v3j-QI; Thu, 30 Jan 2025 07:34:43 +0100
Message-ID: <8f428b6e-9c12-4f9c-aa72-99dcee03cd9b@igalia.com>
Date: Thu, 30 Jan 2025 15:34:37 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/11] sched_ext: Add an event, BYPASS_ACTIVATE
To: Tejun Heo <tj@kernel.org>
Cc: void@manifault.com, arighi@nvidia.com, kernel-dev@igalia.com,
 linux-kernel@vger.kernel.org
References: <20250126101614.232388-1-changwoo@igalia.com>
 <20250126101614.232388-8-changwoo@igalia.com>
 <Z5fmibPhbIM0oD_N@slm.duckdns.org>
From: Changwoo Min <changwoo@igalia.com>
Content-Language: en-US, ko-KR, en-US-large, ko
In-Reply-To: <Z5fmibPhbIM0oD_N@slm.duckdns.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

On 25. 1. 28. 05:03, Tejun Heo wrote:
> On Sun, Jan 26, 2025 at 07:16:10PM +0900, Changwoo Min wrote:
> ...
>> @@ -3707,6 +3712,7 @@ static int select_task_rq_scx(struct task_struct *p, int prev_cpu, int wake_flag
>>   			p->scx.slice = SCX_SLICE_DFL;
>>   			p->scx.ddsp_dsq_id = SCX_DSQ_LOCAL;
>>   		}
>> +
>>   		return cpu;
>>   	}
>>   }
> 
> Stray change?

My bad. Will fix it.

Regards,
Changwoo Min

