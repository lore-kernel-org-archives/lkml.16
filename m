Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 773B0298CCF
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 13:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747144205; cv=none; b=noRtbzXsrBuJtuy6GQBOVk5T2tjhWACfn0JSvV8VFBfx7Bj8XECpWnxrW7ZxIbRv6q3+az8UcC8lSBnQYOweL/wZ+EZgxbZpogfxzwJ6eaWx3l4KLTZliJYKE7scCjI5I5jHT1u1jnAH2zJDpPClReNnaBjPNovwRqz/+QVxoaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747144205; c=relaxed/simple;
	bh=DOIjY6fFpbE95CM/j9yHxC7tRYy5BEyUaDAQBe9HJVc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BomX7QVEAYXe+RMsXc5I5LF59jHjYux7GdsjhgbkMD1mWajsucPBJi50P3UEEGoKhcMjKP49mCJeT40kNifxKWM/xl5CvCZlxwPZW32XlTB4EIMzot5M6ULl8Xq/3iJAXo2WFtKP0E/Cvl8Qg1p0gD0QoLreLbNICqewwcrXLUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YVflbIDP; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YVflbIDP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747144202;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BRJWWcDi335/6emxoMHlLpNhiFKBt6kQvU2GZV5NCuc=;
	b=YVflbIDPFg7zSJzDbaT9iACRJF69TqHz+e9GTM+bmeDIWWbEvN1562VOrLH4PaoFl67Ivi
	ZGsoTrwreea47udqeCLDiOTdjRHkYX4wfsIMqbxGSIaexoHiwqwz5uIw2gSZhMmXlkpTX/
	nnZprL8yXFUR3xwI0g7IcvEDN0mBHpg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-488-jMZWAMYPNKmwvL-jOhSr2g-1; Tue, 13 May 2025 09:50:01 -0400
X-MC-Unique: jMZWAMYPNKmwvL-jOhSr2g-1
X-Mimecast-MFC-AGG-ID: jMZWAMYPNKmwvL-jOhSr2g_1747144200
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a0b9bbfb0fso3116231f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 06:50:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747144200; x=1747749000;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BRJWWcDi335/6emxoMHlLpNhiFKBt6kQvU2GZV5NCuc=;
        b=kU5+RmqAmtdDIXGMnrVT/nGgy0DGY3nXzEjojefx4ibuDzXJvei41Hx4OymHiMOZYa
         TQtYzNPJk8FpssDGR957KOVAEgx/KWZqb0nWv+DCkOIjthgxxwiUVzSnR6L6qCrdnXCZ
         L04M40SpyRV1TcJx2vQeLGevknJXfahrG1lnmGMO9A0mu+SeTwk8n9OPUvrTIs/FWv/G
         J+5EL+xtOxSSz2sqY/pdAfMnDwonphaB2Lkz3YD2CskOsGZs7KHK7b/c5CgdMQtVrRql
         euCUDIPStARxzNqsC0YJG5tsx43XzU8w9L8C4HKA00OpFHe1CacAiHGuDZxr+YVyOESF
         tO3g==
X-Forwarded-Encrypted: i=1; AJvYcCUjReyZ7mfc/4gIE7QKqISsrIQ6GktGbqoHnQWrNfPH2oDNUJSgDIxUg8JNjJhYvz9YqwlUs/d03jOhvVc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yws1xfWRngGvg0yA3fVv1pOAt+eEwfCKSAgZp+YgohGiETsWpLG
	tLOasheH/iBHjK2sLWxrY4GsXThzkugokRSDnUgHSO8tfVcuwr4oXrnTLr8faewGQj4cN16eXhu
	2uUGIoFQytVCHVP3EodWf7a4KeOkLJVkQAvV9MnU2gtX3yeeNp9fnAxOR82C3Fg==
X-Gm-Gg: ASbGncst3j1OfofHThCaLmxzIYhc8ZZluvfDFseFauZZEF0ntfCa/KpKtTzIwc9qBHy
	/iaDm9jymyQQpAhBPfxwsEYxxDVdXqkf59MyjESGhwJbNp0ELd+4no+qJbjLn+pEZBvyJGB0XNy
	/Rhy/Xha55FwzYnSQj4QXKeGWR1dX3z5FPB+Ov2UX1RwdhMUJul4ETyOTBR74Kf/KiwsjFn+BSd
	ZuXVFpPjrutONab7DQsAT3+FU7FMTl3kqm7tgjoF0D2bx5IEKkjPZtWdbDJ9tQ5cPAa4yRvowF1
	EInX7II1Aq388Ew=
X-Received: by 2002:a5d:64c4:0:b0:3a1:fdfd:8f9f with SMTP id ffacd0b85a97d-3a1fdfd9039mr11285635f8f.1.1747144199774;
        Tue, 13 May 2025 06:49:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEqs1aod1h//wk1qXe7kfyq+Liu2mtjZ/6io3a96s7Mn7jyQrUj9pR6kY5xZUjML6dt37F9jw==
X-Received: by 2002:a5d:64c4:0:b0:3a1:fdfd:8f9f with SMTP id ffacd0b85a97d-3a1fdfd9039mr11285598f8f.1.1747144199249;
        Tue, 13 May 2025 06:49:59 -0700 (PDT)
Received: from sgarzare-redhat ([193.207.148.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a2d2e9sm16213702f8f.75.2025.05.13.06.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 06:49:58 -0700 (PDT)
Date: Tue, 13 May 2025 15:49:52 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	virtualization@lists.linux.dev
Subject: Re: [PATCH net-next 2/2] vsock/test: check also expected errno on
 sigpipe test
Message-ID: <pjobj2gw4632k7sxhbekcms4klneqr3boik7gbnx5vvsqvdm72@c3ifhmjjkiwi>
References: <20250508142005.135857-1-sgarzare@redhat.com>
 <20250508142005.135857-3-sgarzare@redhat.com>
 <8d1206d1-1b62-48a4-a304-23e13c1316a3@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <8d1206d1-1b62-48a4-a304-23e13c1316a3@redhat.com>

On Tue, May 13, 2025 at 12:41:17PM +0200, Paolo Abeni wrote:
>On 5/8/25 4:20 PM, Stefano Garzarella wrote:
>> diff --git a/tools/testing/vsock/vsock_test.c b/tools/testing/vsock/vsock_test.c
>> index 7de870dee1cf..533d9463a297 100644
>> --- a/tools/testing/vsock/vsock_test.c
>> +++ b/tools/testing/vsock/vsock_test.c
>> @@ -1074,9 +1074,13 @@ static void test_stream_check_sigpipe(int fd)
>>  	do {
>>  		res = send(fd, "A", 1, 0);
>>  		timeout_check("send");
>> -	} while (res != -1);
>> +	} while (res != -1 && errno == EINTR);
>
>I'm low on coffee, but should the above condition be:
>
>		res != -1 || errno == EINTR
>
>instead?

Ooops, copy & paste where we waited successful send().

>
>Same thing below.

I'll fix both!

Thanks,
Stefano

