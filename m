Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE196263F49
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 09:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746695518; cv=none; b=TTgkjtE4a9sQsOmVNdu75yM4rTsv6wLDKm3saMohddbwkHxLUf27iG/6n2Er1+lbGKG9ZB2ySNVrTzAOZrSpzOraX+D1fhL6ODXBOnjvwmF6d3eMAaQM081f9kFckSOwQC0FmTxdvIreHE/euMYxsiFrG32GEzQHCBGKR7ymUHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746695518; c=relaxed/simple;
	bh=dbtAcCxnljQ9yF7bID9vdWeTOn+WCOhaANG2OrkB+/k=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Sskos90JaMDTrdqMMrOUIMUNkwQZkZ42ZQAMLZnGJBN5Tz1ICKzP34iWX4RJ8K9anr831ocis8txOgQ8OV1L4lkRnSPV0wvzciAO9DHxoDAIl6u2WeAOVOQ9tFgTJOwMVk/PHCxVKzM7qhU+E5lucFF7+ivy5QwpXWQbeVmnBZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VnV7KG3G; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VnV7KG3G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746695515;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=dbtAcCxnljQ9yF7bID9vdWeTOn+WCOhaANG2OrkB+/k=;
	b=VnV7KG3GbfRvB3GQw61sG7R33FEt+1GexkQB0VuaDKBuegT/R6C/vh0LhCysDZMOQNA49k
	tPTct6rdAH0n7kTJywuVcRHc21cBrw3XNc+Ve8KRCT2mY7/tgmpDgRW7ghjbHP1nWwClkx
	6qSkUDzdlBgAOgVVF/fg6rnjG3xvt3U=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-169-oH9pfndYOxCctHmk_ish0g-1; Thu, 08 May 2025 05:11:53 -0400
X-MC-Unique: oH9pfndYOxCctHmk_ish0g-1
X-Mimecast-MFC-AGG-ID: oH9pfndYOxCctHmk_ish0g_1746695512
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43efa869b19so4644195e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 02:11:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746695512; x=1747300312;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dbtAcCxnljQ9yF7bID9vdWeTOn+WCOhaANG2OrkB+/k=;
        b=DUTcbZMRV0ph8T5iY4uyBhxRvgFVSNGoJm2uGABu76bXYpCDtoTcHXpDXK3XqAwFf2
         8LxtEGKsm7lfUPcsjrgW7drGVbvMsKoYwcowBKjnpx9UYWLljDsR2zE8cd/GfhYRJ+fo
         wMM5zkGQLIaqfweVCqP4dYa3gTS8JFw/JJzX9dYgQfSN1kV3v6Ua5LnUI5j9j8zv8nos
         fbDFdbfgqP8ze4P9NEYrNRdTpi482e8H73K7A2DXwmRt2iSq6CBcvMN6lhUl2RW9nvDy
         0rwoCRKUPzao0WmkZBcAUkwCOP2cTi9tCIBTqoEx9UkpNdJgVCFFZGiy8GPAVLngAm4c
         donA==
X-Forwarded-Encrypted: i=1; AJvYcCVhNJB1V5+qETbE+Ndol0CJlhtsQX1Cm/q6wfm0ZErOII2hUIylvQCcyOVlryhWPjPwS/6bAKPeja4H4e8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7MPymZ2WfyaTfTp/aTzLVL1mEsIphTD6t6+BU044s5OfwLVso
	ikx+zQ90CCHHhw4gnqA4Wr/PHgkvWaHxrw4E2+0Dg0qCm6h0V7xR5Y/tbfjI/ssaJCb4LHmlhcV
	kfNWI18Urx9KLj0TKpWkqblOE9jODymup7SC3Rrn3HgXhMrfcvRJBeKgXCIW4QX0AtgjDr5Co
X-Gm-Gg: ASbGncsFyqfsMlRxKJykiutlS+UCVGRYIsBK+D9Eju0vz6Jp0IXOHSHypR1xewIsKL9
	Xjehdh3fha+lky8jeQchIjUCW4EX/Pm+MpDbOEyKz1VJHtAovleZ39egEZGdNqELz05q7dr3jM7
	GPd7ICwv2mcghuaqRXYAnGWVaQIORZh5enSPAzAofWyVtE657+sSWL7LVbnrttA1X9ZrU794gVy
	lC2qp5mjRld6XS5AcoPvlDP6M9kC4HJvI0CJjC2NkpiSAvQ5UkdnQzYbORk5tJCIQdY56pFjtsk
	BiHXr8qywDVe2Tjxqz9fDAWojwDysB6MnQdRZg==
X-Received: by 2002:a05:600c:1c91:b0:43c:fe9f:ab90 with SMTP id 5b1f17b1804b1-441d44e575amr45782345e9.28.1746695512467;
        Thu, 08 May 2025 02:11:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFG77P+A82iyRgKV/DLPPGnZ4i+xcT1z2ghMlR6F5XbnyUxNTVXrQXjUrIZM6eV2ETFWnp+dw==
X-Received: by 2002:a05:600c:1c91:b0:43c:fe9f:ab90 with SMTP id 5b1f17b1804b1-441d44e575amr45782105e9.28.1746695512058;
        Thu, 08 May 2025 02:11:52 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([185.107.56.30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd33336esm29711625e9.13.2025.05.08.02.11.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 02:11:51 -0700 (PDT)
Message-ID: <5ebfd0be3a475583e53eebe2fe8d0a729cbb0343.camel@redhat.com>
Subject: Re: [PATCH v13 2/3] sched: Move task_mm_cid_work to mm work_struct
From: Gabriele Monaco <gmonaco@redhat.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Ingo Molnar
	 <mingo@redhat.org>, linux-kernel@vger.kernel.org
Date: Thu, 08 May 2025 11:11:50 +0200
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
> Thanks,
>=20
> Mathieu
>=20
>=20

Gentle ping.

Peter, did you have some time to have a look at this patch?

Thanks,
Gabriele

