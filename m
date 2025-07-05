Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED2981A3142
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 09:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751707670; cv=none; b=mZQtGDCDOhLD4+YyjvMPCyIaIJw5BGuDV3JhPIj7bNAvfgXALV/jiRYV4fUIZK56r/F4GJjnn4i9cF81NI0IlbdNNcdrv/iGUffqfioNJuBHgZv5BgoaGwnwey8sy+IgEz8SOEDX9YWZ5QUobjL3ynvHlbaE7nAOkYGJ5LkjgSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751707670; c=relaxed/simple;
	bh=+S677AhOefcSqJs5yrwnv1yg868QHmWn7NVnUUe7H+Q=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=BSq8LJQIZaAXx5c3PZ4KBllxjX/j5nOPxc1DljqY4DRSj/ZBpDDZQ9f4K23PlynLXo9Z2zqBgj2d5lw2g9SqXU7W9+2JWBqaJjE+WKH0jO7p5kAybq7RFpxKeVx8qiXZDemtKmAtbW5bI/qWyQ2N0mKUDabx+PyqTZ+HcyW3iic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-86cf0364dd2so278352639f.0
        for <linux-kernel@vger.kernel.org>; Sat, 05 Jul 2025 02:27:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751707668; x=1752312468;
        h=cc:to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+fY3a8I8+COUPqjAARrlRnUdwmTXHzUtWTquSqGNZ9U=;
        b=cEpufD019+nY58LRdNZ5BPumk2M3uMsMIlFwsulVeDK96SeBednlQDnAYu1qb0XZhb
         +ZUW3hAN8o673caGosbZlySvBQy6hJg9t3r58paz6NvRiqmHyIWpxL5FzjoqLw1iIR4B
         WiLR5h22XCte1EI6wb40jwLVoJZCc+I430y1hsxYvbl0JWj6j/SDun6CRWKsUjyfvddK
         m9AVrtV8kDWaDN4Uioh1lpNqwzrGtiGgU5RDaGG1p0ECwLLGdjA1p7O6jljcPnVaou+1
         Pdk9cnR6LDXUZFvB4+XNbOoXKodVPKOkCyzQW09OtlPa6hv9I5/geNwn9fjAZAZ7KfnK
         biAg==
X-Gm-Message-State: AOJu0YxqVHl1D817sZqrk6V3i/k5sQZdPWS2JPk2AR58JFBbaKBCOaaF
	5B+rsozt8Ofurm5+XknZhVRSKEz23MIGYQd71+W7Wo/yQVePZwRJprxYOS7qwaJPCIZOygNovOp
	mms5GClGyvJQvbUD+PyKlCv54YXCQHW+vnbPMuB4SNCf8n1xTuLr+s9aEgmI=
X-Google-Smtp-Source: AGHT+IHWWa5WzcHB8KtthAt0+HcVoZkbbdMoupQ3aDOeAtPXRH649h9x7ObZMyubVG6MqVxkVmvBBiytYcd+n6949l0BoKFYWNc6
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1d86:b0:3dd:b808:be68 with SMTP id
 e9e14a558f8ab-3e13ef146f7mr14083045ab.16.1751707668129; Sat, 05 Jul 2025
 02:27:48 -0700 (PDT)
Date: Sat, 05 Jul 2025 02:27:48 -0700
In-Reply-To: <20250705092739.28018-1-takamitz@amazon.co.jp>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6868f014.a00a0220.c7b3.0033.GAE@google.com>
Subject: Re: [syzbot] [net?] WARNING in taprio_get_start_time (2)
From: syzbot <syzbot+398e1ee4ca2cac05fddb@syzkaller.appspotmail.com>
To: takamitz@amazon.co.jp
Cc: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com, 
	takamitz@amazon.co.jp, takamitz@amazon.com
Content-Type: text/plain; charset="UTF-8"

> I found validation does not work properly when link speed is large.
> picos_per_byte becomes too small when link speed is large, and
> length_to_duration(q, ETH_ZLEN) becomes zero. This results in failing
> validation in fill_sched_entry() and parse_taprio_schedule(), and any
> entry->interval and cycle_time are permitted.
>
> picos_per_byte should be larger than 16 because ETH_ZLEN (60) *
> &q->picos_per_byte should be larger than PSEC_PER_NSEC=1000.
>
> This report seems to be related this, so let me check the following patch
> resolve the issue.
>
> #syz test

This crash does not have a reproducer. I cannot test it.

>
> diff --git a/net/sched/sch_taprio.c b/net/sched/sch_taprio.c
> index 2b14c81a87e5..b0a5bd1c9995 100644
> --- a/net/sched/sch_taprio.c
> +++ b/net/sched/sch_taprio.c
> @@ -43,6 +43,11 @@ static struct static_key_false taprio_have_working_mqprio;
>  #define TAPRIO_SUPPORTED_FLAGS \
>  	(TCA_TAPRIO_ATTR_FLAG_TXTIME_ASSIST | TCA_TAPRIO_ATTR_FLAG_FULL_OFFLOAD)
>  #define TAPRIO_FLAGS_INVALID U32_MAX
> +/* picos_per_byte should be larger than 16 since duration for minimum ethernet
> + * frame should not be zero.
> + */
> +#define TAPRIO_PICOS_PER_BYTE_MIN 17
> +
>  
>  struct sched_entry {
>  	/* Durations between this GCL entry and the GCL entry where the
> @@ -1299,7 +1304,7 @@ static void taprio_set_picos_per_byte(struct net_device *dev,
>  		speed = ecmd.base.speed;
>  
>  skip:
> -	picos_per_byte = (USEC_PER_SEC * 8) / speed;
> +	picos_per_byte = max((USEC_PER_SEC * 8) / speed, TAPRIO_PICOS_PER_BYTE_MIN);
>  
>  	atomic64_set(&q->picos_per_byte, picos_per_byte);
>  	netdev_dbg(dev, "taprio: set %s's picos_per_byte to: %lld, linkspeed: %d\n",
