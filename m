Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 194E4298CA7
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 09:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751534571; cv=none; b=dB1bCCFQ4KwxbedGuVS46SfFJ5wF9FweRAT0+w6TCJp+qpCaJBnn+6XV/uTn2nRfZTN2/cv9O/REmSW0Iu6ERYBZVqgbo3tIp1g1r/ihqGnOTRTZnlzF+ZCTuaHRmw5Nke7wlkW5aCh3gK1cAR0PNAzm56KZP+jviYE91SwOStY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751534571; c=relaxed/simple;
	bh=8hOmrqrmcVp1mjbkravsgakNOc/ZAcn51imohsyancM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZdVdyJhtd0jKChNi5P0bzQ/eLOTZr8D5CtOJWwR3FgJJ4NxR2rwvTNE8JDZ03PvVupfMGjgQKEDi+8DSVcMPopELbHOzb2+JyjG8iWZYaR6ZSCJm54Evv0y12ZFFdPzIVzxm4YAK0lpd2QiPHqvkTdyNcKZ5xhTh0z78ARKKATA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ACCDD12FC;
	Thu,  3 Jul 2025 02:22:33 -0700 (PDT)
Received: from [10.1.37.73] (unknown [10.1.37.73])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1084E3F58B;
	Thu,  3 Jul 2025 02:22:43 -0700 (PDT)
Message-ID: <675563a5-8f1d-4249-9828-9fb353dd7dd1@arm.com>
Date: Thu, 3 Jul 2025 10:22:41 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] sched/uclamp: Exclude kernel threads from uclamp logic
To: Zihuan Zhang <zhangzihuan@kylinos.cn>, xuewen.yan@unisoc.com,
 vincent.guittot@linaro.org, mingo@redhat.com, peterz@infradead.org,
 juri.lelli@redhat.com
Cc: rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
 vschneid@redhat.com, hongyan.xia2@arm.com, linux-kernel@vger.kernel.org,
 ke.wang@unisoc.com, di.shen@unisoc.com, xuewen.yan94@gmail.com,
 kprateek.nayak@amd.com, kuyo.chang@mediatek.com, juju.sung@mediatek.com,
 qyousef@layalina.io
References: <20250703091437.79861-1-zhangzihuan@kylinos.cn>
Content-Language: en-US
From: Christian Loehle <christian.loehle@arm.com>
In-Reply-To: <20250703091437.79861-1-zhangzihuan@kylinos.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/3/25 10:14, Zihuan Zhang wrote:
> Kernel threads (PF_KTHREAD) are not subject to user-defined utilization
> clamping. They do not represent user workloads and should not participate
> in any uclamp logic, including:

Why not?

> [snip]
