Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49815186E26
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 01:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745890072; cv=none; b=m7jadIzjcx3SXdrBoNJFj68Rh8cK6LxZQXBZL+seNguhkERAJsME7qcpc/BJyoA1X9U9e0hML3U1D4mx5KRI0ZgnTFtCtG+2Mgd8LK2HPO0KBbH5uh+Wlq/hemso2X++8eIUtj3TXY6q96eJsjZM4HnirMZaskmwrdHHnavQM58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745890072; c=relaxed/simple;
	bh=Wdc7U/I2YgkMhrQkcltvESOGiohlOnxfjYdjR4EysHA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ksc/xWAUcIBCE/1NnBuOKyxCknEMswE8lYMCq55SNQzGwmYYUUcktiwyeg25IG4GX9x1ewf+8mR8cj46+iT6OT11F/GsSsHdZiC1l3dv1UgdhuiZo6ykevrYWeONmlOD3GyajDVuD90SYbz5yst8BQozENcbnEFGpH9MRE5VDO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=VwfqTW2W; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="VwfqTW2W"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=q4vIhzHs1SRyzkikHqODeVd19zvNNQZ+8QsLhYkAxJg=; b=VwfqTW2W+BX0C/dNn1WdVL5aEX
	lz1w66yzgGrUJqovA/1Ht0zET3Lt58edzZv5sNtNZE0c6sXI0kscoD0TDJ+4ilsy/rdsHbzEWYIeP
	ETZa9tswXPfoYX/384u8zZrWWM0lTyCO2lVatBN5cUtfDlSUxEY4TcDESFmOWapMe7bfUpg8Z1+X3
	amKBjgRaq4h6hA8dPzLtYr3vQxFqMap8gQBsbd64WiuR9DTg7VDNf9DjFF0XTte+3xaEz98m93/xz
	A32FNY5loFJ8i4vwjQk5fkJAgctHbw5CciUbWkfI/Bj0FhLJAqmUGy4Fc1pU7+fiseXkzl0cMq8Hh
	+w46LWhA==;
Received: from [58.29.143.236] (helo=[192.168.1.6])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1u9YOv-000209-Qz; Tue, 29 Apr 2025 02:00:41 +0200
Message-ID: <f613ec9f-d793-46af-9218-70671960b309@igalia.com>
Date: Tue, 29 Apr 2025 09:00:33 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] sched_ext: Fix rq lock state in hotplug ops
To: Andrea Righi <arighi@nvidia.com>, Tejun Heo <tj@kernel.org>,
 David Vernet <void@manifault.com>
Cc: linux-kernel@vger.kernel.org
References: <20250428214320.137576-1-arighi@nvidia.com>
From: Changwoo Min <changwoo@igalia.com>
Content-Language: en-US, ko-KR, en-US-large, ko
In-Reply-To: <20250428214320.137576-1-arighi@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Andrea,

Thanks for the fix. Now it cleanly passes the hotplug selftest.

Tested-by: Changwoo Min <changwoo@igalia.com>

On 4/29/25 06:43, Andrea Righi wrote:
> The ops.cpu_online() and ops.cpu_offline() callbacks incorrectly assume
> that the rq involved in the operation is locked, which is not the case
> during hotplug, triggering the following warning:
> 
>    WARNING: CPU: 1 PID: 20 at kernel/sched/sched.h:1504 handle_hotplug+0x280/0x340
> 
> Fix by not tracking the target rq as locked in the context of
> ops.cpu_online() and ops.cpu_offline().
> 
> Fixes: 18853ba782bef ("sched_ext: Track currently locked rq")
> Reported-by: Tejun Heo <tj@kernel.org>
> Signed-off-by: Andrea Righi <arighi@nvidia.com>
> ---
>   kernel/sched/ext.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
> index ac79067dc87e6..d0f40fd258752 100644
> --- a/kernel/sched/ext.c
> +++ b/kernel/sched/ext.c
> @@ -3477,9 +3477,9 @@ static void handle_hotplug(struct rq *rq, bool online)
>   		scx_idle_update_selcpu_topology(&scx_ops);
>   
>   	if (online && SCX_HAS_OP(cpu_online))
> -		SCX_CALL_OP(SCX_KF_UNLOCKED, cpu_online, rq, cpu);
> +		SCX_CALL_OP(SCX_KF_UNLOCKED, cpu_online, NULL, cpu);
>   	else if (!online && SCX_HAS_OP(cpu_offline))
> -		SCX_CALL_OP(SCX_KF_UNLOCKED, cpu_offline, rq, cpu);
> +		SCX_CALL_OP(SCX_KF_UNLOCKED, cpu_offline, NULL, cpu);
>   	else
>   		scx_ops_exit(SCX_ECODE_ACT_RESTART | SCX_ECODE_RSN_HOTPLUG,
>   			     "cpu %d going %s, exiting scheduler", cpu,

