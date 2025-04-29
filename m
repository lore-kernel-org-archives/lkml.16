Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED866254857
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 17:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745949251; cv=none; b=R60jGvOB4LMbfJWQiaDxRrXom7g4Y+8SVbOAS7161TdaVzp8RpDDq0NUHZuAZu78LmR65LXZua0L6IKXBe9oP4goK/WoCKxhkzU3PDr9VzQd436ZrNAs1CHylAkA/cIrnIkIZ/+WiUSLxdh1YIL/oXV4yrH37gvFPpSGR+qXNZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745949251; c=relaxed/simple;
	bh=F0ylr18M3PB4jxzjybEJTtYecusyCt4iHA5PzXkBzuc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k0DiKcJQhJZK1U/hap9PLM1RUgaYNDUyFsd7toK6I62LPgg3aZOsIN+HGay89IChUGOacL7KICpn+R/I+horHnqUTLCE48e1dnQUfwZUmyseZ7omxUoDdTv6FY/9sw8wJDx4S5t+EP7y0FtqZitebA2r/lhlvQoJPQQTytDzorw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id BED961F391;
	Tue, 29 Apr 2025 17:54:06 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5E8011340C;
	Tue, 29 Apr 2025 17:54:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id bCabFT4SEWiINwAAD6G6ig
	(envelope-from <hare@suse.de>); Tue, 29 Apr 2025 17:54:06 +0000
Message-ID: <f0329c90-56d6-455a-8cbb-a4c28cb85057@suse.de>
Date: Tue, 29 Apr 2025 19:54:05 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] nvme: only allow entering LIVE from CONNECTING state
To: Daniel Wagner <dwagner@suse.de>
Cc: Guenter Roeck <linux@roeck-us.net>, Daniel Wagner <wagi@kernel.org>,
 Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
 James Smart <james.smart@broadcom.com>,
 Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>,
 linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250214-nvme-fc-fixes-v1-0-7a05d557d5cc@kernel.org>
 <20250214-nvme-fc-fixes-v1-1-7a05d557d5cc@kernel.org>
 <0134ea15-8d5f-41f7-9e9a-d7e6d82accaa@roeck-us.net>
 <cb46aa83-8033-4d64-a3c7-420172c3f3f5@flourine.local>
 <9763c4cf-8ca5-45d4-b723-270548ca1001@suse.de>
 <6894c914-a734-4a7b-97cb-e9a344fa5560@flourine.local>
Content-Language: en-US
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <6894c914-a734-4a7b-97cb-e9a344fa5560@flourine.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU]
X-Spam-Score: -4.00
X-Spam-Flag: NO
X-Rspamd-Queue-Id: BED961F391
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org

On 4/29/25 15:55, Daniel Wagner wrote:
> On Mon, Apr 28, 2025 at 03:21:18PM +0200, Hannes Reinecke wrote:
>> On 4/28/25 14:44, Daniel Wagner wrote:
>>> diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
>>> index b502ac07483b..d3c4eacf607f 100644
>>> --- a/drivers/nvme/host/core.c
>>> +++ b/drivers/nvme/host/core.c
>>> @@ -4493,7 +4493,8 @@ static void nvme_fw_act_work(struct work_struct *work)
>>>                   msleep(100);
>>>           }
>>>
>>> -       if (!nvme_change_ctrl_state(ctrl, NVME_CTRL_LIVE))
>>> +       if (!nvme_change_ctrl_state(ctrl, NVME_CTRL_CONNECTING) ||
>>> +           !nvme_change_ctrl_state(ctrl, NVME_CTRL_LIVE))
>>>                   return;
>>>
>>>           nvme_unquiesce_io_queues(ctrl);
>>
>> I would rather have a separate state for firmware activation.
>> (Ab-)using the 'RESETTING' state here has direct implications
>> with the error handler, as for the error handler 'RESETTING'
>> means that the error handler has been scheduled.
>> Which is not true for firmware activation.
> 
> Okay, so something like this here (untested, working on it)?
> 
> 
> diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
> index b502ac07483b..32482712d0f2 100644
> --- a/drivers/nvme/host/core.c
> +++ b/drivers/nvme/host/core.c
> @@ -565,6 +565,7 @@ bool nvme_change_ctrl_state(struct nvme_ctrl *ctrl,
>   	case NVME_CTRL_LIVE:
>   		switch (old_state) {
>   		case NVME_CTRL_CONNECTING:
> +		case NVME_CTRL_FW_ACTIVATION:
>   			changed = true;
>   			fallthrough;
>   		default:
> @@ -575,6 +576,7 @@ bool nvme_change_ctrl_state(struct nvme_ctrl *ctrl,
>   		switch (old_state) {
>   		case NVME_CTRL_NEW:
>   		case NVME_CTRL_LIVE:
> +		case NVME_CTRL_FW_ACTIVATION:
>   			changed = true;
>   			fallthrough;
>   		default:
> @@ -596,6 +598,7 @@ bool nvme_change_ctrl_state(struct nvme_ctrl *ctrl,
>   		case NVME_CTRL_LIVE:
>   		case NVME_CTRL_RESETTING:
>   		case NVME_CTRL_CONNECTING:
> +		case NVME_CTRL_FW_ACTIVATION:
>   			changed = true;
>   			fallthrough;
>   		default:
> @@ -621,6 +624,15 @@ bool nvme_change_ctrl_state(struct nvme_ctrl *ctrl,
>   			break;
>   		}
>   		break;
> +	case NVME_CTRL_FW_ACTIVATION:
> +		switch (old_state) {
> +		case NVME_CTRL_LIVE:
> +			changed = true;
> +			fallthrough;
> +		default:
> +			break;
> +		}
> +		break;
>   	default:
>   		break;
>   	}
> @@ -4529,7 +4541,7 @@ static bool nvme_handle_aen_notice(struct nvme_ctrl *ctrl, u32 result)
>   		 * recovery actions from interfering with the controller's
>   		 * firmware activation.
>   		 */
> -		if (nvme_change_ctrl_state(ctrl, NVME_CTRL_RESETTING)) {
> +		if (nvme_change_ctrl_state(ctrl, NVME_CTRL_FW_ACTIVATION)) {
>   			requeue = false;
>   			queue_work(nvme_wq, &ctrl->fw_act_work);
>   		}
> diff --git a/drivers/nvme/host/nvme.h b/drivers/nvme/host/nvme.h
> index 51e078642127..3a383225afed 100644
> --- a/drivers/nvme/host/nvme.h
> +++ b/drivers/nvme/host/nvme.h
> @@ -247,6 +247,7 @@ static inline u16 nvme_req_qid(struct request *req)
>    *				shutdown or removal. In this case we forcibly
>    *				kill all inflight I/O as they have no chance to
>    *				complete
> + * @NVME_CTRL_FW_ACTIVATION:	Controller is in firmware activation state.
>    */
>   enum nvme_ctrl_state {
>   	NVME_CTRL_NEW,
> @@ -256,6 +257,7 @@ enum nvme_ctrl_state {
>   	NVME_CTRL_DELETING,
>   	NVME_CTRL_DELETING_NOIO,
>   	NVME_CTRL_DEAD,
> +	NVME_CTRL_FW_ACTIVATION,
>   };
> 
>   struct nvme_fault_inject {
> 
Indeed, something like it.

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                  Kernel Storage Architect
hare@suse.de                                +49 911 74053 688
SUSE Software Solutions GmbH, Frankenstr. 146, 90461 Nürnberg
HRB 36809 (AG Nürnberg), GF: I. Totev, A. McDonald, W. Knoblich
