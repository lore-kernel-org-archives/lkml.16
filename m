Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7382D21ABC3
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 12:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748868955; cv=none; b=c7wD+RtNcajfr0De4Op+kLyuaYNM263iysqujiSTz9Rw1u5Lbc3ZODi/JpKVHJd2q5iK6LOH9HOmLOe2CPNyxhv0wnfhaX1pY3EBRUmwUINNiaDPDjW+NDqxxPGoEsTl1Hsk2xcfh9ZBSqTz0qVimsxBl04XxfIVMAog0SAvxcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748868955; c=relaxed/simple;
	bh=LebBu5otgWHbzSZx27+nOtzxv93PTCMXYvWP2OJh0E0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MlK/9n0IQ1vVEkY7GFlspSWQ9xQiQ0/Ox9rSdCaNLAguJRMeU/QLKPPWRU7G5KnRxgwi2bIvAIuvJUlkUoBaGpoJuTu5uSbHyKP+8EpnqfcIMSQnpWtrbRfYXZ4Mp5gc2gzO8Cl8WuEP+M+cL8qC7V40q0Lb4tYwtFwMH9YNIeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 38A6812FC;
	Mon,  2 Jun 2025 05:55:35 -0700 (PDT)
Received: from [10.57.64.248] (unknown [10.57.64.248])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 824CB3F59E;
	Mon,  2 Jun 2025 05:55:49 -0700 (PDT)
Message-ID: <6b6d9e84-0c18-4133-99dc-fe07cf5e563e@arm.com>
Date: Mon, 2 Jun 2025 13:55:47 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] drm/panfrost: Add BO labelling to Panfrost
To: =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
 Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com,
 Rob Herring <robh@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
References: <20250520174634.353267-1-adrian.larumbe@collabora.com>
 <20250520174634.353267-2-adrian.larumbe@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20250520174634.353267-2-adrian.larumbe@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20/05/2025 18:43, Adrián Larumbe wrote:
> Functions for labelling UM-exposed an internal BOs are provided. An
> example of the latter would be the Perfcnt sample buffer.
> 
> This commit is done in preparation of a following one that will allow
> UM to set BO labels through a new ioctl().
> 
> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> Reviewed-by: Steven Price <steven.price@arm.com>

All 5 patches pushed to drm-misc.

Thanks,
Steve

