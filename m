Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE43235079
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 07:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747812707; cv=none; b=Vy3vBrBaxmjMRQrqR6lbvwQmV/BBSqaOf9a7J7y9WdmTYmegJ9Kqkoto55Rm7zCklYWt+Fatq3XjfK8Fy5t7aiE1Go22Zs4ZxcrbFYWahs2ZUCMRp9+tKwJsRQhBYulMzzkrjxPBOLJmIEJzICGj8ZJzVPGmKDwfGRPznPgVfbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747812707; c=relaxed/simple;
	bh=NdTKxcv1vD64Pr8/re2lgvW6IDQ19JvzxWTfPQRBHKk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lm2pMupxxvYxB4CGiDwOIYYqjtcud78lK2ieVhbEnvZhg1PHLmhYpzDDTjhVLP7uEcDl9LgDpLfY5e1BeSKbKs6qmOuMGqvnKX5BaaqedQ4fI1G31uAqlXWn22VtnNEzYgELayLMe8GzOEyN6HWeZwLwhw99+kiIeE/tp/6CcRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=R+lKzrFM; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="R+lKzrFM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747812704;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=NdTKxcv1vD64Pr8/re2lgvW6IDQ19JvzxWTfPQRBHKk=;
	b=R+lKzrFMMRW5dZM8jsur1LSBYUFwkVR9hOVNYEWvLaZpHaxO6JnFQq9nGYtF9ctg5m9RmX
	QgTxOnDrEaORvJ152IiTpXbByzPEiKIKJbUWeyWyCs/k0kTaBMIuI8A+QIaQ6u9CjJJBpP
	eKi7mRWq2GZipZdSN9ps0reprdm0OSk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-411-oO71zm5HOHKLmtM161Qqzg-1; Wed, 21 May 2025 03:31:42 -0400
X-MC-Unique: oO71zm5HOHKLmtM161Qqzg-1
X-Mimecast-MFC-AGG-ID: oO71zm5HOHKLmtM161Qqzg_1747812701
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a3696a0d3aso1513389f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 00:31:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747812701; x=1748417501;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NdTKxcv1vD64Pr8/re2lgvW6IDQ19JvzxWTfPQRBHKk=;
        b=UamaN3TD4soUrv6mt9jf/NnX5j/TVA0Sm863gSXqTMVaR9fwDhNXy+evtLzW0bs2RU
         WqY1a5tezNN5oIQrGEt9P+eyORWHiOsxJkD6r5neeRckfofUGN5LUEN1HZtp5E0USoFF
         W5HYIB8F5/CDYx6Lw0n1fPMyPO26SO3MTwifO2XiKP+vGNNiJYz8tGKVlDK37bQwlQmq
         PWtpRwXzUIiYBFIuaRSYy0D1v3jYUjjQAtJgVxFkRtd+qMVkQlE7eP3bIKEab8sqjCga
         5eoAw4siRz2rOSezO82J/rG1o8sdeCpLICoHeDWQHyB1brBFhC3zYktNtITE8TH6N2y3
         giPg==
X-Gm-Message-State: AOJu0Ywg74DudYXbCRHX7Tr+hF6JzWbe7zldZ7dCOO6asucDGmEU68ci
	S+m6fe/7csPjGK47YOxeF22yZI935h2XD333mdEH8NrItW2LWZmLN1oIVmiZBK+dIdaIY1u+kmL
	AonGBd1OPGUiXNEtMB3pJKgf1+derUbaJw5zOBnJv55Aq/WKpUriGWP20T7lc36jMm9sc6x0h8y
	qI
X-Gm-Gg: ASbGncvRmSM1NjpqhcN7UZ1jX3FCA6n7YAIV7kUPwCQgqOin1+LgSOklo1CQiT3wXBY
	tC00PjhR3rzBIUgdwjjUPJxcS4nFJym3wbWnPFOnJAyoa6lHFxuZ06W64+K79J0FkKouFLoocg+
	RgOePCNKToALht/P8LFRLHbaUuiCiVlXUdfTZcD3Smq4S3ZSk6N/vF+m+UW8LLPVdin57iu1s0C
	GX9wBEZKuFPKS/2hHw7QRd3/GFWJK3MepPQraGvShXVhnjaTMFcaNbrB/B6Y9Sw8Lq02XqLDyI3
	hFvHkRfFTstP/Ono6wd97r4rjv3RTD8JuYUalg==
X-Received: by 2002:a5d:58fa:0:b0:3a3:655e:d46f with SMTP id ffacd0b85a97d-3a3655ed53emr10895340f8f.24.1747812701298;
        Wed, 21 May 2025 00:31:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGTTlj08KZTLZ1NBPiy60wlg87W/RcmVGKMhdM1NK/y/GpYLkYPZciyBPXeQ4ADHPBWIUT5wQ==
X-Received: by 2002:a5d:58fa:0:b0:3a3:655e:d46f with SMTP id ffacd0b85a97d-3a3655ed53emr10895313f8f.24.1747812700924;
        Wed, 21 May 2025 00:31:40 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([185.107.56.30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f78aeb8csm57862205e9.28.2025.05.21.00.31.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 00:31:40 -0700 (PDT)
Message-ID: <719b183dbf2dadac8d5359cd68ff4b51769752de.camel@redhat.com>
Subject: Re: [RFC PATCH v2 00/12] rv: Add monitors to validate task switch
From: Gabriele Monaco <gmonaco@redhat.com>
To: Nam Cao <namcao@linutronix.de>
Cc: linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, Peter
 Zijlstra <peterz@infradead.org>, Steven Rostedt <rostedt@goodmis.org>,
 Tomas Glozar	 <tglozar@redhat.com>, Juri Lelli <jlelli@redhat.com>
Date: Wed, 21 May 2025 09:31:38 +0200
In-Reply-To: <20250521071544.1adrW9ry@linutronix.de>
References: <20250514084314.57976-1-gmonaco@redhat.com>
	 <20250521071544.1adrW9ry@linutronix.de>
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



On Wed, 2025-05-21 at 09:15 +0200, Nam Cao wrote:
> On Wed, May 14, 2025 at 10:43:02AM +0200, Gabriele Monaco wrote:
> > I'm keeping this as RFC as I'm planning to make it ready after
> > merging
> > the LTL series [1]
> >=20
> > This series adds three monitors to the sched collection, extends
> > and
> > replaces previously existing monitors:
>=20
> What is your base? I cannot apply the series (maybe because I'm
> illiterate
> on git...)
>=20
> $ b4 am 20250514084314.57976-1-gmonaco@redhat.com
> ...
> $ git am -3
> ./v2_20250514_gmonaco_rv_add_monitors_to_validate_task_switch.mbx
> Applying: tools/rv: Do not skip idle in trace
> Applying: tools/rv: Stop gracefully also on SIGTERM
> Applying: rv: Add da_handle_start_run_event_ to per-task monitors
> Applying: rv: Remove trailing whitespace from tracepoint string
> Applying: rv: Return init error when registering monitors
> Applying: sched: Adapt sched tracepoints for RV task model
> error: sha1 information is lacking or useless
> (include/linux/sched.h).
> error: could not build fake ancestor
> Patch failed at 0006 sched: Adapt sched tracepoints for RV task model
> hint: Use 'git am --show-current-patch=3Ddiff' to see the failed patch
> hint: When you have resolved this problem, run "git am --continue".
> hint: If you prefer to skip this patch, run "git am --skip" instead.
> hint: To restore the original branch and stop patching, run "git am -
> -abort".
> hint: Disable this message with "git config set advice.mergeConflict
> false"

Mmh, it /was/ linux-next, I'm not sure if that gets rebased and breaks
stuff, but it shouldn't.

I think it should apply cleanly on any up-to-date tree provided you
also apply
https://lore.kernel.org/lkml/174413914101.31282.6876925851363406689.tip-bot=
2@tip-bot2
(which is on next, so it's not required if that's your tree).

If that doesn't help, my base was
aa94665adc28f3fdc3de2979ac1e98bae961d6ca (tag: next-20250513), I
included it in 00/12 but I'm not sure what kind of tool reads that.
I guess next time I should add Peter's patch to the series too to save
people some headache though..

