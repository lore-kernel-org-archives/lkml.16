Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E50A6F30F
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 14:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743602977; cv=none; b=GD0alyBAxmB+8CN8L05W9ZzXtizqkifSbLCNg101I0wUkqpP1LvtC2CRyDaMoaHLAnWy8SbUCIKH8bmpH4/TvCwfHGYale+iqrd9orrbSHhffFPicWXIpPl4vmfsqmWy3HmwzgvL3IGxW9JJP2HnsolDXcE67oNlR2gTdpIwRPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743602977; c=relaxed/simple;
	bh=yxeS5vuxfHHZC7mwsEdulTkke91TEjFDWl6MrJEt6Q0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DkJu4lh6UQBMPagZ/OM16vixOVcPsNQMKtWU9Q+Vuc8KfWTfCddFhrDb8d/lEKp9ia4VNn9V2Nqp4B4eOeM0ZOU1CKZTo+yXkKDIKh/ZDKTiK0XFAlqj5zkS9N3RUevZn75mRO6VmAk/JI7GlIYT3roFKPCq/UA2mgGbMir8VVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 83A231007;
	Wed,  2 Apr 2025 07:09:37 -0700 (PDT)
Received: from [10.57.40.234] (unknown [10.57.40.234])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3B7233F63F;
	Wed,  2 Apr 2025 07:09:33 -0700 (PDT)
Message-ID: <24180e03-b608-4fb0-9215-b2bf1ea22bf0@arm.com>
Date: Wed, 2 Apr 2025 15:09:31 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] sched/topology: Fix sched_is_eas_possible() prints
To: linux-kernel@vger.kernel.org, peterz@infradead.org, mingo@redhat.com
Cc: juri.lelli@redhat.com, dietmar.eggemann@arm.com,
 vincent.guittot@linaro.org
References: <20250319131324.224228-1-christian.loehle@arm.com>
Content-Language: en-US
From: Christian Loehle <christian.loehle@arm.com>
In-Reply-To: <20250319131324.224228-1-christian.loehle@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/19/25 13:13, Christian Loehle wrote:
> Fix two EAS abort condition prints by adding the missing newline
> 
> v2:
> Split series for backports, Cc stable and add fixes tags.
> 
> Christian Loehle (2):
>   sched/topology: Fix EAS cpufreq check print
>   sched/topology: Fix EAS freq-invariance print
> 
>  kernel/sched/topology.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> --
> 2.34.1
> 

Peter, Ingo,
Could someone pick these up pretty please?
