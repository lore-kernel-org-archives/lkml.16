Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 081C128033F
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 02:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746500024; cv=none; b=Av4YV+ka/CKFFWBRLUMJ+NGhRO8sHl5wpQLpj4C8jWbDlBO0xSoSOW4u/HhiU5ex5xFcvo1GIivwPktIHqbgBsPCDn/S7R/dblK8Mz+QZBKtFSC90QydtbKxcGh8mDSvsq0b+DqsIn7CSYR0Mysmj0xJyqkgppJYUrBtT80XJZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746500024; c=relaxed/simple;
	bh=G70iaAf67I0fVy6Ne5IGZ1U6+i+Badhe5dvPxOfehnw=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=DhzBHYoCqou8xg+/EWzFX8cBu3O7LGh+0dEqtT04kn2YjCjiSlPkk1ICx6AwfQ1vUTqDXOe2CL9rvmPhQKnvzW1b3NTqkcGfFi/+q9xHNcBQTXXq4d+kKS45PhOL3k9DNFnmQ8eH0Rf6/H20cCvOLdO3/RO2N/tLzjdH0Bf8Rjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TpscIeyc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TpscIeyc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96820C4CEE4;
	Tue,  6 May 2025 02:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746500022;
	bh=G70iaAf67I0fVy6Ne5IGZ1U6+i+Badhe5dvPxOfehnw=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=TpscIeycIQ2bWOXm/8mPMlmH8FWe8/LOZJyhuGGHDW+9RlTjjFm0vM76SyqPK9bn1
	 suOyi8yEyBcfuDnNTPth9MxL9oAuDPaudtIelNaIaVkzZSiBHltflYUiySuv8EEuyj
	 p2sxz9JKoC70iN2leH5lumytcWwlkzESTnGbxgbOrqfl8wydi5JI0uHmmBfNbO378Y
	 eI2pvvNbBO73QsVS6/uMVj9DpCl4TsPqcJXpetdW6fZcofJBuhbsjFS3s57EcQGkEA
	 Q9a3WUEHpjQa1Rqp7HV8fMgpnTyyvJ35zBcxNXUdjyEl+BVePj2bBcmGwp/8SmvyII
	 m5tWeTZ31tsuA==
Message-ID: <96b206b2-4808-4cbb-960c-016b07dec3bf@kernel.org>
Date: Tue, 6 May 2025 10:53:37 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, hsiangkao@linux.alibaba.com, kernel-team@android.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] erofs: lazily initialize per-CPU workers and CPU
 hotplug hooks
To: Sandeep Dhavale <dhavale@google.com>, linux-erofs@lists.ozlabs.org,
 Gao Xiang <xiang@kernel.org>, Yue Hu <zbestahu@gmail.com>,
 Jeffle Xu <jefflexu@linux.alibaba.com>
References: <20250501183003.1125531-1-dhavale@google.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20250501183003.1125531-1-dhavale@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2025/5/2 2:30, Sandeep Dhavale wrote:
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

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,
