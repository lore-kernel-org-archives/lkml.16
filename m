Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93ABD19F43A
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 21:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751576579; cv=none; b=Xt0wYqQAqDgBKN3z0wg7VyrhjQhzzWYvzvYVfsrdnvIzkx9r8TZn3YGOkggZQ1JZIZCIKfxm580snXVtcJhmt7eC1njLkSkuHfDfQD+mZkwFaOGT6kmgO3jGsaCDkOMyu6vNsnE13Is2sOz40KZV4VOQ7HDUGS0MAZ0Vv0c1OUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751576579; c=relaxed/simple;
	bh=7b7hqvr7EkwfaZqRMejuBUVtedc1L2nVgXoTo0R1Zzs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WjkywdBUHoj3xRs4Yz2V3hmlkBHRYZ3ixUmZIU3AFVWAaXUYnzPO6mR5Abxyo76pDoiOznRC9e547ZPWHRzISTYf7sLM18Izejgo3+VtYyEJU2ldK3+3b2fmPmO662E64qbgRPONPmFzZeQo2N24b5+UXbYvv0kSLSQqeXc5cmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ejdq2ZTO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ejdq2ZTO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58AA4C4CEE3;
	Thu,  3 Jul 2025 21:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751576579;
	bh=7b7hqvr7EkwfaZqRMejuBUVtedc1L2nVgXoTo0R1Zzs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ejdq2ZTOFm5fL7nxl9fCsWQLRsYAt6UpXS4AUnX5W3AN3CK/NtF3aSnyov0qrlFvb
	 HjG+91AOeJKLWszNYZW6MwxiIqHbayl0raNPV5mhm12DWtv2rERHr6v/rvJE40KN1t
	 aWjfX0W31XD0bPSOPZuYtYOHKjLLEpRrHJvQCsui3r/HyU15+4vfdp2mdvenVIRymA
	 yXtkpRv5BuODJw8/D3j+Bjlaly2/kfnSEiekJLEB11jpGtR6WgVkezMcHSkppTDa6p
	 3TwbVR4NGxBre++XRhQlYACbf5Lmvt15ekENxB62a4Est2cHVwmt5G/JVZ9aFoyK5t
	 hqdV7BkOJyw7A==
Message-ID: <a2b6a13c-4f64-43b2-8299-df9b785ba023@kernel.org>
Date: Thu, 3 Jul 2025 23:02:53 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/7] drm/panthor: support repeated mappings
To: Caterina Shablia <caterina.shablia@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Asahi Lina <lina@asahilina.net>
References: <20250703205308.19419-1-caterina.shablia@collabora.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20250703205308.19419-1-caterina.shablia@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/3/25 10:52 PM, Caterina Shablia wrote:
> This patch series adds OP_MAP_REPEAT flag, which lets the user map a BO
> region over an address range repeatedly with just one map operation.

Thanks for resending, will take a look soon!
