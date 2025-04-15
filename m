Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4110B250BF2
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 21:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744751240; cv=none; b=MIqNBa/RvZoL90JMxWbLuIZvyyHffLfKITuetmVkq694Q6TGrJV0mgAX1Ubi0vEuDLcFs7ItdyxhxFf2jLrH4mzAE66YMBGzbXagGjrFdaKXNJQvVKCKxSoH3QZhy3IbOcEjGY3/wUzWWuvAAzDU6c2j1jyLvpjtAAsMx1wTryI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744751240; c=relaxed/simple;
	bh=mWjc7CsBy4qU1jiphVFtbi1dfNG83XTXTEQUinJUmng=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kevBZP91S9Th/e2IdprmnNgeoxN33iATY+k/HLg7ONsDPXb7OFvwDuOoG0SRrtApovBTOqkPOSfijbR8xPmCfETlVArBPX9YWzSMuAynaquEEAxS6aGIe9d1/XFOS8mfG1XIB2jxGHlAgGYS7jOSrR80S+xl1Qg76sz6R5NHGHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3995ff6b066so3347813f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 14:07:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744751236; x=1745356036;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tUzxPqWx0OOTz55UfOXXztdPyW6VLPLxKhv6Fi6iz/U=;
        b=UNTOS71MjqkZC5MeVFRAsFlfqKqfTVRGtncTz7tZbNhZjZM6jxNG5bNHswFqVcEmVr
         rw8u6v5eTQF2m3J9F5uux6Uz2r27c0RDNvlmYWLXlwZ1f+BSD6Cd2k+7dfLvGp7F59+u
         8UvFvkw4+79YBmWKTnUw1ACL3Y2xnMqDEZZP9tNzRsdS86AegcWtZ6X23nos71ZFlJFm
         H5UpX9Vw/87nX++/PmOpxMeK27kQk7bPkDecYT2IEsdmoYXMciWjnKjLFwVkW7UZ8KPA
         efX0Ruz1hnMHkHHDN/hk0kj75wBGWDDOId4S7Xeqvh36t6Tn7n5L4YNjLYhsc1srtrPh
         eOOg==
X-Forwarded-Encrypted: i=1; AJvYcCXjppDOKLuTmMIEjiv2mVLYQ8ZdSQjk71QntNf8eeOoYNoDgGpaFn8/xm7ufp+rCKXZFVwuMUGIQqJIgHo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqK9GSjE5Vc2MLQroEr2nZNp2A1wnmkPLhD7WG6VgZBnjyJyJb
	ZpGd0pekreGWJqKB513hFU5EeDqKUA+nUtVug94c9/E83hyGbTqJ
X-Gm-Gg: ASbGncsnmRzR17iSmGkQBNhwUrI3jitIu8XOiO8J3q0O8zAEA4mLKMf3wApGeybVDd7
	dF8pHQaos6pGbpcZSeNegJ4cCQ0e92hVK4eNk0H2iSjc2kuUCjuwd18JssqJ4GN0aYHAPZbABmX
	uoL+8MLfFpU/L7zKF8rMVsbVKV7IiE85IpADNshXyUJiBJIJ2nUxIKZIpl8Ofb+ckTxypZEKOsZ
	QCoOQ6VrL+hUPsBtq9yvE2jkgq4tFGjf1NlNomUeVUJMIPNh0NkfSGAQolpGHXDyw4Ojve9CaaM
	clk0o7N/29G99ob31djvzzXN7Y1+zt5dZxd2aYw29rKUOmMW1TcPUkWe1VVmQWeZeSJdS+AZUVk
	BBksVFcg=
X-Google-Smtp-Source: AGHT+IGoKlGczBMcbZ0B4XbTxPXNN0vZ0EndsqEbPuWObfbAvZUHWL3mEdgRaulf37waq5U9OOdBGA==
X-Received: by 2002:a05:6000:2913:b0:39a:cd84:a77a with SMTP id ffacd0b85a97d-39ee2761f11mr719736f8f.37.1744751236294;
        Tue, 15 Apr 2025 14:07:16 -0700 (PDT)
Received: from [10.10.9.121] (u-1j-178-175-199.4bone.mynet.it. [178.175.199.47])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae96403dsm15022191f8f.4.2025.04.15.14.07.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 14:07:15 -0700 (PDT)
Message-ID: <4c334216-74d7-4a30-add1-67b6e023d8d2@grimberg.me>
Date: Wed, 16 Apr 2025 00:07:14 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 3/3] nvme: delay failover by command quiesce timeout
To: Daniel Wagner <dwagner@suse.de>
Cc: Mohamed Khalfella <mkhalfella@purestorage.com>,
 Daniel Wagner <wagi@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Keith Busch <kbusch@kernel.org>, Hannes Reinecke <hare@suse.de>,
 John Meneghini <jmeneghi@redhat.com>, randyj@purestorage.com,
 linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250324-tp4129-v1-0-95a747b4c33b@kernel.org>
 <20250324-tp4129-v1-3-95a747b4c33b@kernel.org>
 <20250410085137.GE1868505-mkhalfella@purestorage.com>
 <738a41ca-3e4a-48df-9424-2950e6efc082@grimberg.me>
 <4cd2cbb4-95ff-4f3b-b33b-9c066147d12b@flourine.local>
Content-Language: en-US
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <4cd2cbb4-95ff-4f3b-b33b-9c066147d12b@flourine.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 15/04/2025 15:11, Daniel Wagner wrote:
> On Tue, Apr 15, 2025 at 01:28:15AM +0300, Sagi Grimberg wrote:
>>>> +void nvme_schedule_failover(struct nvme_ctrl *ctrl)
>>>> +{
>>>> +	unsigned long delay;
>>>> +
>>>> +	if (ctrl->cqt)
>>>> +		delay = msecs_to_jiffies(ctrl->cqt);
>>>> +	else
>>>> +		delay = ctrl->kato * HZ;
>>> I thought that delay = m * ctrl->kato + ctrl->cqt
>>> where m = ctrl->ctratt & NVME_CTRL_ATTR_TBKAS ? 3 : 2
>>> no?
>> This was said before, but if we are going to always start waiting for kato
>> for failover purposes,
>> we first need a patch that prevent kato from being arbitrarily long.
> That should be addressed with the cross controller reset (CCR).

CCR is a better solution as it is explicit, and faster.

>   The KATO*n
> + CQT is the upper limit for the target recovery. As soon we have CCR,
> the recovery delay is reduced to the time the CCR exchange takes.

What I meant was that the user can no longer set kato to be arbitrarily 
long when we
now introduce failover dependency on it.

We need to set a sane maximum value that will failover in a reasonable 
timeframe.
In other words, kato cannot be allowed to be set by the user to 60 
minutes. While we didn't
care about it before, now it means that failover may take 60+ minutes.

Hence, my request to set kato to a max absolute value of seconds. My 
vote was 10 (2x of the default),
but we can also go with 30.
