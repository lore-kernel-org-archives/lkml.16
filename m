Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E005200A3
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 03:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746588052; cv=none; b=f0bcpZZRdi0QmiREK0xbKvp17DUXcRAhBM8Dj9JCcPURglhf6hakoGnvZC2EOoBhwshVeB7rs5iC+Nyl7LHNTmK8sucTw4O9qPOU5rHtw3A2RCGl2SFQQVwrz+E2R0TSc5Oit1JFjLOV6cz9kacE6gtByS3KWcOU32r+HNuN9/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746588052; c=relaxed/simple;
	bh=gcMNJz9YPaS5D5JY2/OC6sEBas2990lNVCdQwzme6Jw=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=QjHF+rT0/qFhOYelpJlUA8CPLb55gMe7H16lNtev7oWBalXvDsw3b6YdQ+Jy/fiWkkRIuXlflaje9pwjzBMbVKBI3mCcpRyia9iV+k0wyTPhxiUZbz9OlttsG0szCpxYmx2pv/u8AQ2UZaE3M8+nhbouCRZQu0GMSk2L1Bwn8oY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tkhVW8Tc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tkhVW8Tc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E24C6C4CEE4;
	Wed,  7 May 2025 03:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746588052;
	bh=gcMNJz9YPaS5D5JY2/OC6sEBas2990lNVCdQwzme6Jw=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=tkhVW8TcblEVlJt9mjbkdcqGRsh/C5EjgOiw6tDn1fSvr/1usm+b8gImlgB9zX1cR
	 QuxDT4aOCLleN5nMNf3dSfKAkhJEhD/CYpKygJaYIhQRtrj9kndw4OOfdeX48CkCZ4
	 AGecGy8ABi/qirfz4EvhShvMbvGVZrRtq0vRC5SaE3EC+w82OnsNG1/kpmpXX4LBNi
	 uZY2rQWnyNxPLYDGvdTynDqXgU1zzs8P+DUEjEnfkmn+xZC1Dt01wKpJpa4hJwrJ0F
	 UFhir0xlM0bhPzs9l6+NRGGuUPFXdFnw5skP4RBO+/D7ygUSjvvXtikC4FC8Zh3jI4
	 FXWFM2ssvs9VA==
Message-ID: <4a70799a-ebca-44a4-bf8e-c47e54717dd7@kernel.org>
Date: Wed, 7 May 2025 11:20:47 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, hsiangkao@linux.alibaba.com, kernel-team@android.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6] erofs: lazily initialize per-CPU workers and CPU
 hotplug hooks
To: Sandeep Dhavale <dhavale@google.com>, linux-erofs@lists.ozlabs.org,
 Gao Xiang <xiang@kernel.org>, Yue Hu <zbestahu@gmail.com>,
 Jeffle Xu <jefflexu@linux.alibaba.com>
References: <20250506225743.308517-1-dhavale@google.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20250506225743.308517-1-dhavale@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/7/25 06:57, Sandeep Dhavale wrote:
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
