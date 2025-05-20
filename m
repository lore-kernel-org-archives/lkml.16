Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40ACA1CAA6E
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 11:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747740883; cv=none; b=q/jTCXU+djlFGvhOt/aObmyfZIcoQ1e3aXCAHDPE40Y1CnwzC6scs7dLpKA9/R2vIF/igiDdNTfzw66qsCfISRlNJ1Zjf+tJpg4V4jqDZgZ4poOLEcs5D6U79zjAjYWtV6hNID4x7GRyo7tJqmxTkOa9YZn6jLOu52Qv5g/b6Qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747740883; c=relaxed/simple;
	bh=EkXs9kllUtyiIe4/tIDzXqlqHj+uy599lCN7ToTAycs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HtYEL/i7yKAuwgW5rSZaSoliF8mvp0f+s/EhVKgmQdIKS1vBqCtr6WxMrxjORRsHEq91rWyK8xyiy75lb1etnm8AwmebYCOnQM5iX2sgFH2ZOCKYh3HuaWYweZhUCal8juvTUOmY+WuRTDpf/oSx/JVaojMJWcEwMghdzfzy8rI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FGc7YjAl; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FGc7YjAl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747740881;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=EkXs9kllUtyiIe4/tIDzXqlqHj+uy599lCN7ToTAycs=;
	b=FGc7YjAlp2eZCRhST0of/q5n9rsBiaeeHRno4YdIMkwoohQt6jsQL23aiNSTxG9/Th4DOc
	FkXh6sXO/+4snzxzB/os1yQDGVnKgcFlPGXPHqtJ2ymveRTfhWuJok+eOScKBpW4HmqQNA
	Qm6sLFvY+b/46/suoNPWvm67BYxwcmI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-296-fvfe79yhPmWxUpOBTOK6ZQ-1; Tue, 20 May 2025 07:34:37 -0400
X-MC-Unique: fvfe79yhPmWxUpOBTOK6ZQ-1
X-Mimecast-MFC-AGG-ID: fvfe79yhPmWxUpOBTOK6ZQ_1747740877
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43ea256f039so43377145e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 04:34:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747740876; x=1748345676;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EkXs9kllUtyiIe4/tIDzXqlqHj+uy599lCN7ToTAycs=;
        b=poaiTTjUUKY7qqxg8OkOBGCUApg9oykckJAMLAOE0WridukP6J1cecr0Hlfpp58gkl
         GVHvovNP4Gi4Q0sx6VOE+OGxGNAb58XzxKVU0J9ig5o51MmkeEvieIwjMtCzBfU1HkUD
         cBf77JEvGUD2dkhmcDfnkeL+GB+hqGimuuRlP7sLoj1I+ZupSY1xuEYjhJ3efQKYFa9Y
         7rn1CbsO9pMhTxXrF7S9IDcuAUJ1PExE+FjvyTyKYJW3juPx8XoQ+oMC4UrOdY1qimtt
         QWmsHUdblCgr3PBkerUyNgtYy2JBI723lLiBK5vOfKNrjI9seM+KA/KVM3ist5YV/rd4
         eGQQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0VovX+jOmhmtJXZ9YGKUz0R3nQcxTsIzWZxYxu/f7CRVSf9YmPKVfM75fhlBQ2IocPGrtp5zq9mTpGzg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyN0c5VQ9YtQGQm9yOBGAi2d+AfvSGBByMd9Z4IuYEah8huax1m
	sKmIVzffsOjPLEGJ9rddarTFS+ZGodT0RiAmBtYxLYgEDu6p8zf9PrBCWBOuyDx1r7AzoJ+wcO8
	uwGmnKH/TO+mYKlupSYAmOOeug7kMIvo5FDB/hu7huFFwKi6981+ld1ipCvwC1A8nXg==
X-Gm-Gg: ASbGncuu/qKEk0VCK4eZNulP5R1wWNfRKsSW6PmaW3DuTlp8F6wk7cce2LqeqpWw8oA
	czwdBTkO5VAZDB3PTaCaVB2tQnMSxbYZbQXjATBZt9CIp1k7TW4uchWFxFccuncrpo28eLu/LvQ
	qJxidRoIzybf8fF3OPzmYg+js9duLCaf9QmuxOj5VHOIBegdzn7yjILDU0eiEPKSHNVr10If5mp
	ooi8Zh8EQGX1q+aYEzRPNKjn/L4U+Ue12b6f2ec300HSSgdbXqhL4xE/QyQbYso3bsiiVpQZgtN
	+hDrk17PBrzrN+aDq+elZ5VTWULt6Bwl/zVi+A==
X-Received: by 2002:a05:600c:5008:b0:43c:ef55:f1e8 with SMTP id 5b1f17b1804b1-442fd622ce5mr166698455e9.13.1747740876586;
        Tue, 20 May 2025 04:34:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH/z2ghlTr/iPWqzNsGzmZf8ZP6FGDdos+yqghRZUz3NrAWfNYkCtHnuBhNRMtpRsix4gas3g==
X-Received: by 2002:a05:600c:5008:b0:43c:ef55:f1e8 with SMTP id 5b1f17b1804b1-442fd622ce5mr166698215e9.13.1747740876222;
        Tue, 20 May 2025 04:34:36 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([185.107.56.30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447eee9d8desm29187465e9.0.2025.05.20.04.34.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 04:34:35 -0700 (PDT)
Message-ID: <a1256a49992f1feabdcf36b286b6bd6dac94075d.camel@redhat.com>
Subject: Re: [PATCH v13 2/3] sched: Move task_mm_cid_work to mm work_struct
From: Gabriele Monaco <gmonaco@redhat.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.org>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	linux-kernel@vger.kernel.org
Date: Tue, 20 May 2025 13:34:34 +0200
In-Reply-To: <e53ac875-da6a-42ce-8714-d74f77775279@efficios.com>
References: <20250414123630.177385-5-gmonaco@redhat.com>
	 <20250414123630.177385-7-gmonaco@redhat.com>
	 <e53ac875-da6a-42ce-8714-d74f77775279@efficios.com>
Autocrypt: addr=gmonaco@redhat.com; prefer-encrypt=mutual;
 keydata=mDMEZuK5YxYJKwYBBAHaRw8BAQdAmJ3dM9Sz6/Hodu33Qrf8QH2bNeNbOikqYtxWFLVm0
 1a0JEdhYnJpZWxlIE1vbmFjbyA8Z21vbmFjb0ByZWRoYXQuY29tPoiZBBMWCgBBFiEEysoR+AuB3R
 Zwp6j270psSVh4TfIFAmbiuWMCGwMFCQWjmoAFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgk
 Q70psSVh4TfJzZgD/TXjnqCyqaZH/Y2w+YVbvm93WX2eqBqiVZ6VEjTuGNs8A/iPrKbzdWC7AicnK
 xyhmqeUWOzFx5P43S1E1dhsrLWgP
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 (3.56.1-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0



On Mon, 2025-04-14 at 11:28 -0400, Mathieu Desnoyers wrote:
> On 2025-04-14 08:36, Gabriele Monaco wrote:
> > Currently, the task_mm_cid_work function is called in a task work
> > triggered by a scheduler tick to frequently compact the mm_cids of
> > each
> > process. This can delay the execution of the corresponding thread
> > for
> > the entire duration of the function, negatively affecting the
> > response
> > in case of real time tasks. In practice, we observe
> > task_mm_cid_work
> > increasing the latency of 30-35us on a 128 cores system, this order
> > of
> > magnitude is meaningful under PREEMPT_RT.
> >=20
> > Run the task_mm_cid_work in a new work_struct connected to the
> > mm_struct rather than in the task context before returning to
> > userspace.
> >=20
> > This work_struct is initialised with the mm and disabled before
> > freeing
> > it. The queuing of the work happens while returning to userspace in
> > __rseq_handle_notify_resume, maintaining the checks to avoid
> > running
> > more frequently than MM_CID_SCAN_DELAY.
> > To make sure this happens predictably also on long running tasks,
> > we
> > trigger a call to __rseq_handle_notify_resume also from the
> > scheduler
> > tick if the runtime exceeded a 100ms threshold.
> >=20
> > The main advantage of this change is that the function can be
> > offloaded
> > to a different CPU and even preempted by RT tasks.
> >=20
> > Moreover, this new behaviour is more predictable with periodic
> > tasks
> > with short runtime, which may rarely run during a scheduler tick.
> > Now, the work is always scheduled when the task returns to
> > userspace.
> >=20
> > The work is disabled during mmdrop, since the function cannot sleep
> > in
> > all kernel configurations, we cannot wait for possibly running work
> > items to terminate. We make sure the mm is valid in case the task
> > is
> > terminating by reserving it with mmgrab/mmdrop, returning
> > prematurely if
> > we are really the last user while the work gets to run.
> > This situation is unlikely since we don't schedule the work for
> > exiting
> > tasks, but we cannot rule it out.
>=20
> The implementation looks good to me. Peter, how does it look from
> your end ?
>=20

Peter, Ingo, this could we bring this series in?

Thanks,
Gabriele

