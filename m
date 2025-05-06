Received: from out30-111.freemail.mail.aliyun.com (out30-111.freemail.mail.aliyun.com [115.124.30.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86866218ACA
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 23:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746575815; cv=none; b=g0dTyyVhR43F9yC8usAtyZskal7BVLKh2Cms6x3KbSEVscFmCVBz4ssE5nxc9/ywY/XQPoRnQ2anKJQ4jj4qFDheYo22+o1GldWs1Cq5XtRu4jWPVNh+EljU8b58Ki6rVcbWW1iqmiYENbtRTM60MXdLJdLcSMskci3ZzqDmAiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746575815; c=relaxed/simple;
	bh=tE5KUmCmnO9j9SleZpFn0iTrxLzesk5GJoV5vyoxOBk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kQSNCTZELPVsv85MifrbxUXLNGxyf0oyrWV7/nn/DAvLzimVdiCzz+KCVDbBSJM18WPS9g8CqyEBpOyXODwbPd9uhYmMDFR8/0PQSqyHZz/J10VbChW66jsirCR4AMqDC81vkMnQJQ/RpvNz8M2CO6SXo8rHP+N6+9eKwwOihPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=gxkROy//; arc=none smtp.client-ip=115.124.30.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="gxkROy//"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1746575803; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=obgOiUEY30Q4J8mYbgYf9xP5X544tH9xAhY2id3aTXg=;
	b=gxkROy//UL1xZqQWoj2FdexWGdXsdlt1k8Op8N9vFbrQ33uCV/da9I7otsfvGf52Ge51vE7fahpCYVaJ4aLevMAZsbDFDY/I1foAGrp6yNLLEac/f2QjEiDpKVvXpsOSJCmfVb13V4Y1U+RaEnJOPe8nv1ArVOMvR4CecQQNrcU=
Received: from 30.134.100.0(mailfrom:hsiangkao@linux.alibaba.com fp:SMTPD_---0WZfyYNB_1746575485 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 07 May 2025 07:51:26 +0800
Message-ID: <251b2875-6082-4d0e-a20e-201048ce7c4e@linux.alibaba.com>
Date: Wed, 7 May 2025 07:51:22 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] erofs: lazily initialize per-CPU workers and CPU
 hotplug hooks
To: Sandeep Dhavale <dhavale@google.com>, linux-erofs@lists.ozlabs.org,
 Gao Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>,
 Yue Hu <zbestahu@gmail.com>, Jeffle Xu <jefflexu@linux.alibaba.com>
Cc: kernel-team@android.com, linux-kernel@vger.kernel.org
References: <20250506225743.308517-1-dhavale@google.com>
From: Gao Xiang <hsiangkao@linux.alibaba.com>
In-Reply-To: <20250506225743.308517-1-dhavale@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2025/5/7 06:57, Sandeep Dhavale wrote:
> Currently, when EROFS is built with per-CPU workers, the workers are
> started and CPU hotplug hooks are registered during module initialization.
> This leads to unnecessary worker start/stop cycles during CPU hotplug
> events, particularly on Android devices that frequently suspend and resume.
> 
> This change defers the initialization of per-CPU workers and the
> registration of CPU hotplug hooks until the first EROFS mount. This
> ensures that these resources are only allocated and managed when EROFS is
> actually in use.
> 
> The tear down of per-CPU workers and unregistration of CPU hotplug hooks
> still occurs during z_erofs_exit_subsystem(), but only if they were
> initialized.
> 
> Signed-off-by: Sandeep Dhavale <dhavale@google.com>

Thanks, it looks good to me,
Reviewed-by: Gao Xiang <hsiangkao@linux.alibaba.com>

I will apply this later.

Thanks,
Gao Xiang
