Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48B042D05E
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 07:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743494032; cv=none; b=WQPTDmQedZq8Cwu1uBHgfGHuue3brrDlP4ctY+l5nFt/vWzZXCtPiMKwT2FBWvSCFR7+x8N37We6XWkj3gIIfxlIlI/QbL+KDuV9SUWdyVAs2n8dN3oeV2arlSk7qrEPbUKXvcEPbHtzNhPjo8wYwiBpXE8IAhBLq4k5dWDpO3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743494032; c=relaxed/simple;
	bh=HCEFYwh9m7hmPPqIb8SX2sunnNwMfn2DohlZBDBQQB8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ii06OfRgRqzxmItgzLAfASsD8OlCWGoILcPSKPbPXpH1YEXokfiIBgB5u04TPwOLnLn2WourBqTnsjw4bBhZDOJMPbQ7cvTZ33mlRoZiDkOUIO4gT+/EOzWowMqAqRhUzeRgl6h/vIo/IPl5MA/bsuPkrNqkJYQYvMojj78H460=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=dxOwidK0; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="dxOwidK0"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43948f77f1aso36342315e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 00:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1743494027; x=1744098827; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aVezXcmNjFvGeePsLEgaeOZHIg/Ype94xcgrgvPHBWQ=;
        b=dxOwidK0G7Zfsp9REUR9or/xsoQD9okJy+J5WVWExkAwgJkpuniEvB/pfxYSRdeENu
         VqbjmuIF8vgibHQQf/K7wIP5N9JJkpSnx2w4ynyyoW7Vcrlhl19FmrbjDsY0gb8hWyoX
         wlBehcmyarmyrbs5cjvc6JZyp2PG/jXe0OYs5/oJa2GyyWVKbuLSX5GhCzILW1REsJpc
         1483kzbC2TtjihoPu+RX0uDSsEWbYY9ac98cmHiNA244gxFNgGXHwgeJDMK53yAUy2Kr
         9swYcTLtG5a7u0r3qLwrXf9BUVMtQGGcwKD9oXHiXoYEeP6XM6fAMwQ9UOZ1O6PxxdyB
         xSGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743494027; x=1744098827;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aVezXcmNjFvGeePsLEgaeOZHIg/Ype94xcgrgvPHBWQ=;
        b=Q1bkafg/fcdITjBjLgxhjF+XYq3ACBbHfpEE+HRjms4Vl6ioR3TGICeQM9fLuwo+Sf
         axrAghmert+G05wmvHrj5dOZuVZ6fokfjLsTaDeWi/gZt3UWQXSGTRSOC7EEosU2m77V
         d+HUKlweRe43lDf3m49KyONh8TyzFNpuxfrgNBQ7jcrFkotOwX1gc/JoPaZMZcYcOiyE
         fjIjCMXDjeV2mBTJN0BJhvKdxHpCb0cInHbN6axcppoX+Yeo3XgqU+RAwtfsVF5/beAk
         SxVbf+SeKu7vQIYFQhR5fUVj2jdz8Mu4rZHIksqmVgnJ36ObywE/tNd81L7B4EGBa0G+
         /j/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVV2T2j4Hff7Ol8zaTAt61DloKAIXtP8X9mJXb/ip9j2/I5MHQG4JN3vHnxPSXmVdftQGZNa6ilkM5KZ7A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxe9Tv2owq/z2Od2x3KjQciVyE/IF3DRaLS9Oi+Yav8HL+R62V3
	xi9hD7crsVgwQtVrF2qzYtvgaXtqbDA6MYdz4LyZ7v56zdKvNkLqE9cybtzy0Eg=
X-Gm-Gg: ASbGncuRf6gcQT2soaI2v/9BJ7b4D0v7Lpxzbw//oJvriOAuTVQ5Ueg6VS8H5BC1IN3
	AJId/Zt9Np2JKCVv0C2CBRCu4I3cB6NQ5j/qcyOhrldyNd6yrDX3y0Bp3/IDujCTsI22qpNpAc2
	H+bqdCXhXknRTntO3rVcZdxJrgkOv8MvEqPClFke3XqjfYKAYIsn8fA+fXaH1korAlrI1G3+VcN
	EnLfE+CTQAQBp+nWgtUUtWg2fbbIJiMwTyPMKx1yLlshtsJklAALZAGKj5XJqcZGLMvWAIWMwL8
	5K0jKF7j1TZJzgkG2KLjiFtENTlp9ytWRr1CsO8qZkKbaUF96JO9qtOstLFizqM5HhHPJA5HMkD
	8Ia06o7LTSHtjZckW
X-Google-Smtp-Source: AGHT+IFCND4u4ER45buQyky5h/GbyTChDOldIH58BGtyz/UpO8YtBkFCcjfe/V7hEIN/QlaCchOJmQ==
X-Received: by 2002:a05:6000:40cd:b0:390:e7c1:59d3 with SMTP id ffacd0b85a97d-39c120cb878mr8447965f8f.2.1743494027213;
        Tue, 01 Apr 2025 00:53:47 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:355:6b90:e24f:43ff:fee6:750f? ([2a01:e0a:355:6b90:e24f:43ff:fee6:750f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b66d56csm13573413f8f.59.2025.04.01.00.53.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Apr 2025 00:53:46 -0700 (PDT)
Message-ID: <ffddb84a-e1ca-4a8a-81c6-448688b1c531@baylibre.com>
Date: Tue, 1 Apr 2025 09:53:45 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] binder: do not crash on bad transaction in
 binder_thread_release()
To: Carlos Llamas <cmllamas@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?UTF-8?Q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
 Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>,
 Joel Fernandes <joel@joelfernandes.org>,
 Christian Brauner <brauner@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Frode Isaksen <frode@meta.com>,
 linux-kernel@vger.kernel.org
References: <20250331152515.113421-1-fisaksen@baylibre.com>
 <Z-tXhrdTtV5t_P5p@google.com>
Content-Language: en-US
From: Frode Isaksen <fisaksen@baylibre.com>
In-Reply-To: <Z-tXhrdTtV5t_P5p@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/1/25 5:03 AM, Carlos Llamas wrote:
> On Mon, Mar 31, 2025 at 05:24:14PM +0200, Frode Isaksen wrote:
>> From: Frode Isaksen <frode@meta.com>
>>
>> Instead of calling BUG(), set the binder_thread to NULL,
> Yeap, not crashing the kernel is a good idea.
>
>> as is done in other parts of the code.
>> Log if it is a bad transaction (other than in or out).
>> The BUG in binder_thread_release() was preceded by
>> these warning logs:
>> binder: 1198:1217 got reply transaction with bad transaction stack,
>>   transaction 49693 has target 1198:0
> So tid 1217 is sending a reply to an incoming sync transaction. However,
> its transaction_stack shows that t->to_thread is NULL. I have no idea
> how can this be possible. When the transaction was picked up by 1217,
> its info was recorded in its transaction_stack as such:
>
> 	if (cmd != BR_REPLY && !(t->flags & TF_ONE_WAY)) {
> 		binder_inner_proc_lock(thread->proc);
> 		t->to_parent = thread->transaction_stack;
> 		t->to_thread = thread;            <----- HERE
> 		thread->transaction_stack = t;
> 		binder_inner_proc_unlock(thread->proc);
> 	}
>
> I don't understand how 't->to_thread' later becomes NULL, maybe memory
> corruption?
>
>> binder: 1198:1217 transaction failed 29201/-71, size 4-0 line 3065
>> ...
>> binder: release 954:1333 transaction 49693 out, still active
>> ...
>> binder: release 1198:1217 transaction 49693 out, still active
>> kernel BUG at drivers/android/binder.c:5070!
>>
>> Signed-off-by: Frode Isaksen <frode@meta.com>
>> ---
>> This bug was discovered, tested and fixed (no more crashes seen) on Meta Quest 3 device.
> Do you have a way to reproduce this? It sounds like there is something
> else going wrong before and we probably want to fix that.

I was never able to reproduce this locally and it happens very seldom.

As you can see in the log, there was a "bad transaction" 17 secs before 
the crash.
<6>[   13.664167] binder: 1198:1217 got reply transaction with bad 
transaction stack, transaction 49693 has target 1198:0
<6>[   13.664174] binder: 1198:1217 transaction failed 29201/-71, size 
4-0 line 3065
...
<6>[   40.793299] binder: release 954:1333 transaction 49693 out, still 
active
...
<6>[   41.624171] binder: release 1198:1217 transaction 49693 out, still 
active
<6>[   41.624197] ------------[ cut here ]------------
<2>[   41.624198] kernel BUG at drivers/android/binder.c:5070!

>
>>   drivers/android/binder.c | 5 +++--
>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/android/binder.c b/drivers/android/binder.c
>> index 76052006bd87..c21d7806e42b 100644
>> --- a/drivers/android/binder.c
>> +++ b/drivers/android/binder.c
>> @@ -5302,7 +5302,8 @@ static int binder_thread_release(struct binder_proc *proc,
>>   			     "release %d:%d transaction %d %s, still active\n",
>>   			      proc->pid, thread->pid,
>>   			     t->debug_id,
>> -			     (t->to_thread == thread) ? "in" : "out");
>> +			     (t->to_thread == thread) ? "in" :
>> +			     (t->from == thread) ? "out" : "bad");
>>   
>>   		if (t->to_thread == thread) {
>>   			thread->proc->outstanding_txns--;
>> @@ -5317,7 +5318,7 @@ static int binder_thread_release(struct binder_proc *proc,
>>   			t->from = NULL;
>>   			t = t->from_parent;
>>   		} else
>> -			BUG();
>> +			t = NULL;
> Dropping BUG() is nice but this could use en error message.

The binder_debug() will log it as "bad" transaction instead of "out", so 
there will be a trace of this happening.

Thanks,

Frode

>
>>   		spin_unlock(&last_t->lock);
>>   		if (t)
>>   			spin_lock(&t->lock);
>> -- 
>> 2.49.0
>>
> Regards,
> --
> Carlos Llamas


