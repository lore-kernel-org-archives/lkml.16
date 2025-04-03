Received: from xmbghk7.mail.qq.com (xmbghk7.mail.qq.com [43.163.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB52623F294
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 07:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.163.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743664465; cv=none; b=TTqoyJ9ZdTFfFDU2ziHV6DrzCZS2tVWNGbj2PuKYQL59cHME7kOMNC744h2bheONc3v8HbGfxds8oQdB1QyJP6Rdq4gafqGMXir4RxpxuUpMg3o4FTlwfxgIbd7nC0cOSDTCEpvw0w89mfcNn7oMbNxP6BpAdTgsawrB8P0kxOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743664465; c=relaxed/simple;
	bh=b0cOd9D0x0Kdaz1sApMlHu4zf5BC3nxYkE9+bZD3BT0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f7mmnPqMPYI5s1Y6ypHU1dy8klm6c5AzBWq4EHC+fOtRvJtyG4aA8xdekbAADEwtxpNMktAjcJ48pHw3hP4Bt+qOvmMxGdOQ3tMV5M/SgKhhpu+tS/rxSSapWVEotjeXeO+w9qKwiR272txek/gISTN6tirNVKhv7PVgp3RntlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=Dy3xfI6Z; arc=none smtp.client-ip=43.163.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="Dy3xfI6Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1743664122; bh=GgThBuknXaD3lwbCXtPebulyQHktE8jqziVCkvGpKHg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Dy3xfI6ZXkUloVh53iGY/z/AmxkNZgqQ3G3gmUMTTbaJrnIq8D55iEuWwS0tyVABd
	 teYESDBWtvtvx1q2Ne+bXoMDhUKulMPKddHfuiZREbNL2kwHI/uVD7Rt9ZOA/b/lc2
	 TMdHmTx1hpLTGHjDIJmIEZq+5uc8s41uKNribvX0=
Received: from [10.42.13.21] ([116.128.244.169])
	by newxmesmtplogicsvrsza36-0.qq.com (NewEsmtp) with SMTP
	id 228A7AA3; Thu, 03 Apr 2025 15:08:40 +0800
X-QQ-mid: xmsmtpt1743664120tjvpap32a
Message-ID: <tencent_0B50E848464E942D6467F86F53C9DED88606@qq.com>
X-QQ-XMAILINFO: OZZSS56D9fAjqmL7MHMzvCf4yMzMA6sLrx+XNuJIq/WDFmj19VAC4kGSYB/7QH
	 QggSR3AujGjYwbL52QY+TV+B0Ithj54H3+ktR6TgNoX4DFiogfaRtnRhepCugfhfNXZfCK3TjlU0
	 l+g18J4TBHWTlZUqOUGZ+B42osEFmv8SzZL5P+1umzFlAtEizNuRyux2CFzmQfkFDeA3HFyZuVPK
	 gejinWdMxHKlZ/wPx2VhWqFdX6vis3LMNF0ixPXt2hZvjRZ9fWHAOu4UZMfXoF7aUaWVAEITkEQt
	 DoIYwUjJ3PKXMVa1n0GqWhCSR5bp8KBIEyp8pqezKxGCTdppzRwRzv9QrK2qIXEW8Ha0U46ChP7X
	 YqfqLLoUNtuFlKsWFLWeY77Z6fphU7j/Uq0n/HWI/ap2+d+0uJNCE+xqS9H/IjL7Mxamy6HYd1rU
	 1JS3nrJl2LbLES3uEts+HoCby1O3OgLZJpf30R5w/DNeGINSH+PFhOe0q6uYbt5tQR3TXlVG8meJ
	 dJA3mE5YIBU/yPRMFRWyjKprcR1UXMV3KHvZFQslMloY8zJE/CLdXn9f2bGyeTA9vM6YNqAGJzN8
	 L8JDibWucgHIz+h9ZHMe/at1gq6afzDmVy7WddpvDczM7CsU9+ff5chuAUodROw1muGnM6JgGUJ6
	 rgEBwh1omB03MCmowjaGXQ05KfWVK+PTfOiymz9jOFzTTmGj0yEjqXuyUw2d4Dd8NXiVmZQ7b5ie
	 bUL8lG4Ff8ltbVmDY8DcpXRbvR9GEDDKjSIR7iixz/cRqjnY6qGlqOj/XhYkYBDtcdQreTypRN6R
	 YO2ISJWNUXd9xb5iE0Ic9SRJC5ZTnD7InbDmGPLnvOjGc8lUoOfiCj4lyH1VhrydV1KGEl+UUyks
	 OxnyevVhX3hOKKIXN7G/2hf9GHZLfhWlUDDqrF5RUjusW4QOMr6j4UKuqBgrTT/v9hcAF6WDOceu
	 TIf2Z2J6zESpgxl/7TJKHl1q2DS4g1s8FH3JvXnRc=
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
X-OQ-MSGID: <d7b88e2a-7090-40a0-8bdc-9b60678e204d@qq.com>
Date: Thu, 3 Apr 2025 15:08:40 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] nvme: Add warning for PST table memory allocation
 failure in nvme_configure_apst
To: Christoph Hellwig <hch@lst.de>
Cc: kbusch@kernel.org, axboe@kernel.dk, sagi@grimberg.me,
 chaitanyak@nvidia.com, linux-nvme@lists.infradead.org,
 linux-kernel@vger.kernel.org, Yaxiong Tian <tianyaxiong@kylinos.cn>,
 Chaitanya Kulkarni <kch@nvidia.com>
References: <tencent_4612952C8C5109058CD8E688D81276A2FD0A@qq.com>
 <tencent_A06D513AE17E9D4B4AC66E84F447FE730C09@qq.com>
 <20250403042557.GD22360@lst.de>
Content-Language: en-US
From: Yaxiong Tian <iambestgod@qq.com>
In-Reply-To: <20250403042557.GD22360@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



在 2025/4/3 12:25, Christoph Hellwig 写道:
> On Tue, Apr 01, 2025 at 05:26:52PM +0800, Yaxiong Tian wrote:
>> +		dev_warn(ctrl->device, "Failed to allocate pst table; not using APST\n");
> 
> Please avoid the overly long line:
> 
> 		dev_warn(ctrl->device,
> 			"Failed to allocate pst table; not using APST\n");

Thanks, I Will fix in v4.

