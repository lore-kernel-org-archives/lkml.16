Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 030A92877EF
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 09:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751621079; cv=none; b=ZOjeodXKEXSKoMVnoZbffJ28Olp24cLOXkceJSYOd/OQk7Y7L+QVCF5k/7Q0qDsn/b96LPyPKZMdEGm6JvcXWtY95X7UElJJZ1KzRi8Mv8L73d+CGLrb488H8zazCzxHFfNtqKBQuWE3csHV2h7XDfRMgcnVJmPAGU1lZGyOVW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751621079; c=relaxed/simple;
	bh=IWnv8wuvxjSLZu6TYH7AvRedSfu4EGdi6dGZhG1R0X0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kW4+zw2po6HpcMcTp8K5dSXv/Tg378voIF6WLl/7YabnguJ9bMakyOKArJbNl6k+qbHWar4IEghcjfiCJ+w9O1U6Rd6TIbtfFKE571/x2qMfPGORISJjjT+YCwFkVbwWBGQ2ahcUNbJvzKIvZQyedVHLEI0dHJ87wDbmCzth2jE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X5ugVTKi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X5ugVTKi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2AC6C4CEE3;
	Fri,  4 Jul 2025 09:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751621078;
	bh=IWnv8wuvxjSLZu6TYH7AvRedSfu4EGdi6dGZhG1R0X0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=X5ugVTKihbzZa05OkMV/cLal/5bAimpvswCAOaRNZj2wFXjeCAtUPiTSbRN5KcPDM
	 0aJOA8mGqUHzTaNb7fB+25+rCgwfzL5aIEpbfHZ71H64mj6yG+ChTohvKgykLB90a0
	 y+fd/KjPfDuwC8xKuhe8YQuJrM5dE0h0bzoW80m3k/RABq595aM+8cMGxqGaPODGQo
	 gfLKri2qmEbE4zK4Hj/2cwK9AJtmaQoPaqh9HN2xGIk0OKMHMH89GLJjssZTToXzD5
	 md4WRvpObwhWoivkrCYj6VykBRuKaR/gcQNiQlTNIKF02uBnYY4m+2tUao7IAJCY2O
	 R/aJDUm+M4MHw==
Message-ID: <f202f889-2f20-4b5a-94b9-89b61147777e@kernel.org>
Date: Fri, 4 Jul 2025 11:24:33 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/80] drm/nouveau: Remove redundant
 pm_runtime_mark_last_busy() calls
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Ben Skeggs <bskeggs@nvidia.com>,
 Dave Airlie <airlied@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jani Nikula <jani.nikula@intel.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>, Suraj Kandpal
 <suraj.kandpal@intel.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
 <20250704075410.3217943-1-sakari.ailus@linux.intel.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20250704075410.3217943-1-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/4/25 9:54 AM, Sakari Ailus wrote:
> pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
> pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
> to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
> pm_runtime_mark_last_busy().
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Acked-by: Danilo Krummrich <dakr@kernel.org>

