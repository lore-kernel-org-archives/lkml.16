Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 037C42EAE3
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 17:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751303069; cv=none; b=Ldtg2dPShvvUmQ9Yl3437iHl296mzD2oUfpRlQn8WRsZ8Z+4oOeRll8Ve8uK4Ur+wRxBwJhBJcnNRZm/V7x0zHHVv14BTlPlZ802HuIcWP0Bpu1dtTZASlUCaOaYiW+1/EqNJQCesJ9x60COfC/MwpWQNW15qOp/pu8S+1KZVGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751303069; c=relaxed/simple;
	bh=We43/0KPfqwPcLUKy/jKM2ep2ZUA5ubx6xSYTEP512M=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=OU0fwty5jBAYMA/kcZKFnuYouhmADc5gmrGMLogD+FhOlUeqyw4Jr58V1hmVhEmRYgNO9j/kqj81bSpaClxCP+q1q0I4jfF3HGB7So5BLAF2m5vJ6KJu/WIJTflpQUA0VqGsTiEDWSMYGoNfvgg8DMCmRc3SGiXNXllyRiQEv94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SxdClnK8; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SxdClnK8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751303067;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tqvdx1P7+YmwhsJueQlz06Ejlaz8UB28IsL3WhNH/P4=;
	b=SxdClnK8hZIyaSyZGS6b1d6xseJ1OjWgiQnGx5jHo++1mgXgvk+VAKYyyFZo34Jcvb3pCW
	ZfC3XgiizdarRfrotJGvKdh+3heBPuOqDmOpTub9QAUiCItGumLywi347rE9gLOdpoI2Zj
	sZzpm3weBhwj2Y0qW1yXicFHP96+HxU=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-556-fjGN8pFHPm-z4hK_OkKiIA-1; Mon, 30 Jun 2025 13:04:25 -0400
X-MC-Unique: fjGN8pFHPm-z4hK_OkKiIA-1
X-Mimecast-MFC-AGG-ID: fjGN8pFHPm-z4hK_OkKiIA_1751303065
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-72bc266dc24so3919698a34.2
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 10:04:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751303064; x=1751907864;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tqvdx1P7+YmwhsJueQlz06Ejlaz8UB28IsL3WhNH/P4=;
        b=lhKadszrcZpGkvJ+CUYdnxR3U/1ZQl+PPIv/nsLfcArED3o0JZgU0ZuvAsUj8P77Zp
         /fO1BT0WMysxxlqud3gEbMez/wUhpLFZC03TV5N6auE7hNYqDRrUpzHe0C5OLckwJwpH
         UHBlDVtFROHEWGWQNLziFysJSluuYzcgjrFAGU4vXxmEA0EmISqyvgYGXvjPq2JawS5d
         9IjWGrlq4/rU0qpNyYP3ZK2mr5PCr4+OAv58zs6m4EwfOGssTLxTKT9DbcWDhK2XKcSV
         9PphN1rQJ8byS1QmbEJBEr01qFrHTNw8tu0BsaxvE07S6t/PUvbUHD29n268i1F29fX+
         +rRA==
X-Forwarded-Encrypted: i=1; AJvYcCUGeI19P417npouCMZRIxnoXIIyPoUMSr6QUT5l73KeDQLmtVczcqGHGWwEWACo/A6N2Qq5709TvEz61x4=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywn19FPC9eaz0VmqobWD1ZLnKH9f0ZrEYgFws5BtblCDai5xTCh
	w2kJMHdac7yyCO1mLfe44VuNhHkYUjBOLR++BoO3Kd62gMZIRuessdljDtSr6YwAca84j2u9mmD
	CwNQM72UXjggPXbOVYO+nhUydTBhuD+fLMyTNfh3Y/oB9b+wzRkKnsfz9rFIN0nOfdw==
X-Gm-Gg: ASbGncszLtrWhhUoJF2G6sRAv0Cdxy+WwfoL14zVeNk9gSfOZz+dtEmvnow0MZEcn20
	ULuI3FRCpF3efew1x4jIsh1S151Rah6NqtRrY+ljapcQK4WUJC2W5uIMxfz7XM29Ghy0pigyBmv
	WNKkc+rT65yIh6TeJsv4PkbLbqNESSV9aSdcMJ2filctMX+9+a//GdzfbnITrrdNDvNcd40uHPk
	w83mWsA8bo9uY/fq1Ui+rsXPphfOqXh6pAIv59OvZgrfpAJJW8DasaXjx5TIr4O9SF+oDq5nfE6
	JJnfFAS/dalsGkPhpcfgm606SQMbj2pIECXm8Ykt4S/OXYAiMHGXkgl4N8TdWjMXHlsq
X-Received: by 2002:a05:6830:2d81:b0:72b:a712:4b72 with SMTP id 46e09a7af769-73afc42b65bmr9273419a34.9.1751303064701;
        Mon, 30 Jun 2025 10:04:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFy3ZGkYJ3a9NiocU4yf46CpHZer8ELFOYumSMYtaA+amgjtOm7wPytlOi3pwdPSu+jvfZg3A==
X-Received: by 2002:a05:6830:2d81:b0:72b:a712:4b72 with SMTP id 46e09a7af769-73afc42b65bmr9273400a34.9.1751303064396;
        Mon, 30 Jun 2025 10:04:24 -0700 (PDT)
Received: from ?IPV6:2601:600:947f:f020:85dc:d2b2:c5ee:e3c4? ([2601:600:947f:f020:85dc:d2b2:c5ee:e3c4])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73afafee51bsm1722599a34.10.2025.06.30.10.04.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 10:04:23 -0700 (PDT)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <495e2880-db0c-45d5-9cbc-e9299ba8a6b8@redhat.com>
Date: Mon, 30 Jun 2025 13:04:21 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] sched/deadline: Initialize dl_servers after SMP
To: Juri Lelli <juri.lelli@redhat.com>, Waiman Long <llong@redhat.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 linux-kernel@vger.kernel.org,
 Marcel Ziswiler <marcel.ziswiler@codethink.co.uk>,
 Luca Abeni <luca.abeni@santannapisa.it>
References: <20250627115118.438797-1-juri.lelli@redhat.com>
 <20250627115118.438797-2-juri.lelli@redhat.com>
 <1e39c473-d161-4ad0-bfdc-8a306f57135f@redhat.com>
 <aGJlDGR1Wud0LOG5@jlelli-thinkpadt14gen4.remote.csb>
Content-Language: en-US
In-Reply-To: <aGJlDGR1Wud0LOG5@jlelli-thinkpadt14gen4.remote.csb>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/30/25 6:21 AM, Juri Lelli wrote:
> On 29/06/25 18:48, Waiman Long wrote:
>> On 6/27/25 7:51 AM, Juri Lelli wrote:
> ...
>
>>> @@ -1652,6 +1664,8 @@ int dl_server_apply_params(struct sched_dl_entity *dl_se, u64 runtime, u64 perio
>>>    	int retval = 0;
>>>    	int cpus;
>>> +	guard(rcu)();
>>> +
>> Your patch doesn't explain why a RCU guard is needed here?
>> sched_init_dl_servers() is the changed caller, but it is called with
>> rq_lock_irq held which should implies a RCU read critical section as IRQ is
>> disabled.
> Yeah, looks like it's not required. Will remove. Thanks for spotting it!

Other than this minor nit, the patch series look good to me with my 
limited understanding about the DL scheduler.

Acked-by: Waiman Long <longman@redhat.com>

