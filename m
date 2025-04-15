Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D20E6FC3
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 18:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744740811; cv=none; b=nRYFvdC9FgB270xmtrEHKYj6+lS5jvP8ZY9GWQejZYMnYZ9cU/c5T119+tE7nW4irz9mRb0A+VZz2igoYD8QP9QUFN8/3F/86qAbX014VTDm3f3bJGc8hL3qF0QxQpdBz8HpzAeaqCU6y+unFm/MCU8vecSg5VdRzAjGNt1c87A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744740811; c=relaxed/simple;
	bh=a9/PSkZ3KEbGHpV5jnD0zQ7/FrYpU6mlkSwYXAem8XQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uPK3xc/rXQRYiX/46jySNTynwC1anR6bcTerkR457p0TQ1AUWvpwssk8qceW7IPBqZ1dDgmn+7vvXpjuwe93SWeWx6COhL6WDxY5P/MubY4pAzLdvyTbWlBCPxR9Ni/jbRhSMX7te1vWryUqGVuDO3rTdQaRvKHURhHrMeWcjaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=falJPyQC; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="falJPyQC"
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53FCCTEe003551;
	Tue, 15 Apr 2025 18:13:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=wnPclS
	6pzxrQ4eSFbqLv52masd5WQ7xGyv+DXujng9c=; b=falJPyQC134q6RcqS1EWY/
	p6o//TYx6lzrmjf0YEoMXK3cA3xKQgrFJm/knBGmZapMI4XibCNFibLaEP8PDDNc
	bTu3Fb83pvpIkfCtG7nVQi/IpmWdIH9C42t990fml5VJPz+Z6XNR6ZK7A9D1GGPc
	5F9Y/wNOcsHxZ5IqNpigjsdBJvKbPpAaJN6dKaYJjbDoJleXHg8JOUK2PxMaGOm4
	4a6RGdGZpIyPxWuzYLPa637AZmRzTsvJUTzqdKraPqMtv10q34gtEme0+4DcoZWl
	HThQlvWEPbE4PW/dDftQwjkjipai/EAccJ4/GEBNdxPhtWofPEpFkDSI8UVzKwFA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 461cax4qfn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Apr 2025 18:13:15 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53FICJHx027518;
	Tue, 15 Apr 2025 18:13:14 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 461cax4qfk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Apr 2025 18:13:14 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53FHnOoV030943;
	Tue, 15 Apr 2025 18:13:14 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4603gnmews-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Apr 2025 18:13:14 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53FIDCK245941178
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 15 Apr 2025 18:13:12 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 12A252004F;
	Tue, 15 Apr 2025 18:13:12 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C960220040;
	Tue, 15 Apr 2025 18:13:09 +0000 (GMT)
Received: from [9.124.210.83] (unknown [9.124.210.83])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 15 Apr 2025 18:13:09 +0000 (GMT)
Message-ID: <f9f8144c-7666-4675-a17b-b31bed2db6c5@linux.ibm.com>
Date: Tue, 15 Apr 2025 23:43:08 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] sched/wait: Use guard() for wq_head->lock
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
        Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
        Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
        Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-kernel@vger.kernel.org
References: <20250402183843.15540-1-kprateek.nayak@amd.com>
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <20250402183843.15540-1-kprateek.nayak@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: XU8_DUnfPbVoAk9Px8ZySzHMrMI0sw-j
X-Proofpoint-GUID: Avm_cIeUeLHzCXvC7xtUc5tM_P8jnqve
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_07,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 mlxscore=0
 bulkscore=0 clxscore=1015 spamscore=0 adultscore=0 mlxlogscore=999
 phishscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502280000 definitions=main-2504150126



On 4/3/25 00:08, K Prateek Nayak wrote:
> Using guard(spinlock_irqsave) for "wq_head->lock" helps eliminate the
> local "flags" variable, the local "ret" variable in some cases, and
> helps simplify the flow in prepare_to_wait_event().
> 

flags variable becomes implicit now, only ret is eliminated in some cases.

> Signed-off-by: K Prateek Nayak <kprateek.nayak@amd.com>
> ---
>   kernel/sched/wait.c | 69 ++++++++++++++++-----------------------------
>   1 file changed, 25 insertions(+), 44 deletions(-)
> 
> diff --git a/kernel/sched/wait.c b/kernel/sched/wait.c
> index 51e38f5f4701..2cf7687e00e0 100644
> --- a/kernel/sched/wait.c
> +++ b/kernel/sched/wait.c
> @@ -16,44 +16,35 @@ EXPORT_SYMBOL(__init_waitqueue_head);
>   
>   void add_wait_queue(struct wait_queue_head *wq_head, struct wait_queue_entry *wq_entry)
>   {
> -	unsigned long flags;
> -
>   	wq_entry->flags &= ~WQ_FLAG_EXCLUSIVE;
> -	spin_lock_irqsave(&wq_head->lock, flags);
> +
> +	guard(spinlock_irqsave)(&wq_head->lock);
>   	__add_wait_queue(wq_head, wq_entry);
> -	spin_unlock_irqrestore(&wq_head->lock, flags);
>   }
>   EXPORT_SYMBOL(add_wait_queue);
>   
>   void add_wait_queue_exclusive(struct wait_queue_head *wq_head, struct wait_queue_entry *wq_entry)
>   {
> -	unsigned long flags;
> -
>   	wq_entry->flags |= WQ_FLAG_EXCLUSIVE;
> -	spin_lock_irqsave(&wq_head->lock, flags);
> +
> +	guard(spinlock_irqsave)(&wq_head->lock);
>   	__add_wait_queue_entry_tail(wq_head, wq_entry);
> -	spin_unlock_irqrestore(&wq_head->lock, flags);
>   }
>   EXPORT_SYMBOL(add_wait_queue_exclusive);
>   
>   void add_wait_queue_priority(struct wait_queue_head *wq_head, struct wait_queue_entry *wq_entry)
>   {
> -	unsigned long flags;
> -
>   	wq_entry->flags |= WQ_FLAG_EXCLUSIVE | WQ_FLAG_PRIORITY;
> -	spin_lock_irqsave(&wq_head->lock, flags);
> +
> +	guard(spinlock_irqsave)(&wq_head->lock);
>   	__add_wait_queue(wq_head, wq_entry);
> -	spin_unlock_irqrestore(&wq_head->lock, flags);
>   }
>   EXPORT_SYMBOL_GPL(add_wait_queue_priority);
>   
>   void remove_wait_queue(struct wait_queue_head *wq_head, struct wait_queue_entry *wq_entry)
>   {
> -	unsigned long flags;
> -
> -	spin_lock_irqsave(&wq_head->lock, flags);
> +	guard(spinlock_irqsave)(&wq_head->lock);
>   	__remove_wait_queue(wq_head, wq_entry);
> -	spin_unlock_irqrestore(&wq_head->lock, flags);
>   }
>   EXPORT_SYMBOL(remove_wait_queue);
>   
> @@ -99,13 +90,11 @@ static int __wake_up_common(struct wait_queue_head *wq_head, unsigned int mode,
>   static int __wake_up_common_lock(struct wait_queue_head *wq_head, unsigned int mode,
>   			int nr_exclusive, int wake_flags, void *key)
>   {
> -	unsigned long flags;
>   	int remaining;
>   
> -	spin_lock_irqsave(&wq_head->lock, flags);
> +	guard(spinlock_irqsave)(&wq_head->lock);
>   	remaining = __wake_up_common(wq_head, mode, nr_exclusive, wake_flags,
>   			key);
> -	spin_unlock_irqrestore(&wq_head->lock, flags);
>   
>   	return nr_exclusive - remaining;
>   }
> @@ -228,14 +217,12 @@ void __wake_up_pollfree(struct wait_queue_head *wq_head)
>   void
>   prepare_to_wait(struct wait_queue_head *wq_head, struct wait_queue_entry *wq_entry, int state)
>   {
> -	unsigned long flags;
> -
>   	wq_entry->flags &= ~WQ_FLAG_EXCLUSIVE;
> -	spin_lock_irqsave(&wq_head->lock, flags);
> +
> +	guard(spinlock_irqsave)(&wq_head->lock);
>   	if (list_empty(&wq_entry->entry))
>   		__add_wait_queue(wq_head, wq_entry);
>   	set_current_state(state);
> -	spin_unlock_irqrestore(&wq_head->lock, flags);
>   }
>   EXPORT_SYMBOL(prepare_to_wait);
>   
> @@ -243,17 +230,17 @@ EXPORT_SYMBOL(prepare_to_wait);
>   bool
>   prepare_to_wait_exclusive(struct wait_queue_head *wq_head, struct wait_queue_entry *wq_entry, int state)
>   {
> -	unsigned long flags;
>   	bool was_empty = false;
>   
>   	wq_entry->flags |= WQ_FLAG_EXCLUSIVE;
> -	spin_lock_irqsave(&wq_head->lock, flags);
> +
> +	guard(spinlock_irqsave)(&wq_head->lock);
>   	if (list_empty(&wq_entry->entry)) {
>   		was_empty = list_empty(&wq_head->head);
>   		__add_wait_queue_entry_tail(wq_head, wq_entry);
>   	}
>   	set_current_state(state);
> -	spin_unlock_irqrestore(&wq_head->lock, flags);
> +
>   	return was_empty;
>   }
>   EXPORT_SYMBOL(prepare_to_wait_exclusive);
> @@ -269,10 +256,8 @@ EXPORT_SYMBOL(init_wait_entry);
>   
>   long prepare_to_wait_event(struct wait_queue_head *wq_head, struct wait_queue_entry *wq_entry, int state)
>   {
> -	unsigned long flags;
> -	long ret = 0;
> +	guard(spinlock_irqsave)(&wq_head->lock);
>   
> -	spin_lock_irqsave(&wq_head->lock, flags);
>   	if (signal_pending_state(state, current)) {
>   		/*
>   		 * Exclusive waiter must not fail if it was selected by wakeup,
> @@ -287,19 +272,18 @@ long prepare_to_wait_event(struct wait_queue_head *wq_head, struct wait_queue_en
>   		 * we fail.
>   		 */
>   		list_del_init(&wq_entry->entry);
> -		ret = -ERESTARTSYS;
> -	} else {
> -		if (list_empty(&wq_entry->entry)) {
> -			if (wq_entry->flags & WQ_FLAG_EXCLUSIVE)
> -				__add_wait_queue_entry_tail(wq_head, wq_entry);
> -			else
> -				__add_wait_queue(wq_head, wq_entry);
> -		}
> -		set_current_state(state);
> +		return -ERESTARTSYS;
>   	}
> -	spin_unlock_irqrestore(&wq_head->lock, flags);
>   
> -	return ret;
> +	if (list_empty(&wq_entry->entry)) {
> +		if (wq_entry->flags & WQ_FLAG_EXCLUSIVE)
> +			__add_wait_queue_entry_tail(wq_head, wq_entry);
> +		else
> +			__add_wait_queue(wq_head, wq_entry);
> +	}
> +	set_current_state(state);
> +
> +	return 0;
>   }
>   EXPORT_SYMBOL(prepare_to_wait_event);
>   
> @@ -355,8 +339,6 @@ EXPORT_SYMBOL(do_wait_intr_irq);
>    */
>   void finish_wait(struct wait_queue_head *wq_head, struct wait_queue_entry *wq_entry)
>   {
> -	unsigned long flags;
> -
>   	__set_current_state(TASK_RUNNING);
>   	/*
>   	 * We can check for list emptiness outside the lock
> @@ -372,9 +354,8 @@ void finish_wait(struct wait_queue_head *wq_head, struct wait_queue_entry *wq_en
>   	 *    the list).
>   	 */
>   	if (!list_empty_careful(&wq_entry->entry)) {
> -		spin_lock_irqsave(&wq_head->lock, flags);
> +		guard(spinlock_irqsave)(&wq_head->lock);
>   		list_del_init(&wq_entry->entry);
> -		spin_unlock_irqrestore(&wq_head->lock, flags);
>   	}
>   }
>   EXPORT_SYMBOL(finish_wait);
> 
> base-commit: 328802738e1cd091d04076317f3c2174125c5916

Reviewed-by: Shrikanth Hegde <sshegde@linux.ibm.com>

