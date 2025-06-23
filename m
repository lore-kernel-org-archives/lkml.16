Received: from r3-25.sinamail.sina.com.cn (r3-25.sinamail.sina.com.cn [202.108.3.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4370B23315A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 23:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750722586; cv=none; b=e84LYYtQjJnrvfTOl0yPE5iHmR3JG4zHIpb2w591RodF6WwmwJqRm5ipqE1awVZ6MdS9vVOsq5GoNzDZNsFaKwC9cxyGLX1s8lGIEgUUYlh3x2tRatuQ5Nu4WzKIwO3dWu0f+SaW7+dm1JpU/FrAogM8WHgfxbK8r1qYM5QhNWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750722586; c=relaxed/simple;
	bh=zYYNL9ZNBTW71CWEJ+bmm+yGMH+6jAUFzhqfzIy/SGY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J0S/ZmO7pdXnnNWxLu2PML8bGS3InFmRVwTYRO5Sy1gxFWdfBsXHBBk3p7t2FDbJvHzrR5kwS0FRMqqamEnKaCbLaU2MqsaqhRr8rRgifRe1G6SCyexMK3Zh7hJpVz1xMuvQ6ZNMsaG3xZIIYC2HbDku2cPRKRtIIi1whwGt8n0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; arc=none smtp.client-ip=202.108.3.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([114.249.58.236])
	by sina.com (10.54.253.31) with ESMTP
	id 6859E80A0000487F; Mon, 24 Jun 2025 07:49:32 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 4108076816599
X-SMAIL-UIID: 2E0F3B67F8E34F5C99B00B8BEA120525-20250624-074932-1
From: Hillf Danton <hdanton@sina.com>
To: Marco Crivellari <marco.crivellari@suse.com>
Cc: linux-kernel@vger.kernel.org,
	Tejun Heo <tj@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Michal Hocko <mhocko@suse.com>
Subject: Re: [PATCH v5 1/3] Workqueue: add system_percpu_wq and system_dfl_wq
Date: Tue, 24 Jun 2025 07:49:19 +0800
Message-ID: <20250623234920.1531-1-hdanton@sina.com>
In-Reply-To: <20250614133531.76742-2-marco.crivellari@suse.com>
References: <20250614133531.76742-1-marco.crivellari@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, 14 Jun 2025 15:35:29 +0200 Marco Crivellari wrote:
> @@ -7829,10 +7833,11 @@ void __init workqueue_init_early(void)
>  	}
>  
>  	system_wq = alloc_workqueue("events", 0, 0);
> +	system_percpu_wq = alloc_workqueue("events", 0, 0);

Different workqueue names are prefered until system_wq is cut off.

>  	system_highpri_wq = alloc_workqueue("events_highpri", WQ_HIGHPRI, 0);
>  	system_long_wq = alloc_workqueue("events_long", 0, 0);
> -	system_unbound_wq = alloc_workqueue("events_unbound", WQ_UNBOUND,
> -					    WQ_MAX_ACTIVE);
> +	system_unbound_wq = alloc_workqueue("events_unbound", WQ_UNBOUND, WQ_MAX_ACTIVE);
> +	system_dfl_wq = alloc_workqueue("events_unbound", WQ_UNBOUND, WQ_MAX_ACTIVE);

Ditto
