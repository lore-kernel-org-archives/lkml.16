Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 586E5286885
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 12:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746622482; cv=none; b=DAjla6iFJ1vQA77G92ynKbdilipKhvbo1zAObelsTQfAwIlKu3wq7B1hRR/Z+IW0j5pB2AMwEWD27uO35tNV5SzSNeMfQYUU1r1vAr39a2zFL7ls2SrdhqOuTXHHIAGPCZw4aPQN+bH9w1MK6MfX8jG/73p0XAylQKeBRANjwMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746622482; c=relaxed/simple;
	bh=rlYkutOJbTy9t4vetbaK1MFW9+WsC8kSGvqRmbg4uTo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dn95KbHjTBi6YjNj0lbuHXx4L4xdtD/y2hoIrfWcTxt0aWw4iH2NpyQdLWK3VbBdl1AwEZUSbQPGbM1yjoxiRfvyqo59YTcc1WvmyGQL6yeXcxRWGjzhli0jLZiMURAqnOOlXXQBzX1bBUDk+Kv6EVlQkkp1wlbN7FQmscO8Sjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=bQgEfzl9; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="bQgEfzl9"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5e5e8274a74so10536734a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 05:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1746622478; x=1747227278; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ypa3PBqDtPswGp9XxxvAriQxh6M+XVug4d/DpMvuJqc=;
        b=bQgEfzl9HbV8Ufg4s3XJVQe96sNXP7OOsBMso7IeTpJK4VOET69YYJ7wptPA1gA8eT
         hyO2wPLd9NNQ9HSUjdgA34EoT5aAx5KDPbmW9s+C8Ke555bjUvd6sZ0/QOxpM/q0br9S
         PAW0e2+pDYwW8NWIqmmyRM3t5BRFt01Nm0tXBo+LMwByHGRN8BaZHxC8o5iKDbvkJC4E
         QHLBhrEJ0XLqWnVsFYUPizrj/K01Fa6hjsj3H3ubi3FHqIl9v2E6JwcWsCtyrt/CGwZF
         mKO6U/3Ysm0+0GGZXPgJKGq8Q87Rd55yLH8z/AdEAyaoVfXUn/gUhP5TwHUi7tAcqDtq
         Wreg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746622478; x=1747227278;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ypa3PBqDtPswGp9XxxvAriQxh6M+XVug4d/DpMvuJqc=;
        b=P38xgN6PPGW1+utlsdD5oTq8fsSwT4RkG2XlH3uIGzBNA8l2WECCTubdhoZnajXEWh
         GLFcvJ0xETd3Req46OO8/Zj2WE0ilzChnZYQD/Qrq27bEDN6JHdtt8mcv1wrRaCX/J/r
         F2jkdhfbiL9cffbfGicCdvvVDcPbAWhvDoIovYUDI7BpnyW5pjVxLac84K9Gzdt0H3Oy
         BHNGIbdhkh1+nGUJKdlTFpDsw/zMRTqE1Y2t3ikRCA5gdjTSkjjRSMoDvS5SfdwAc8vJ
         OfkiUXpV8MTNO0FU7bObbXAi3IFCR76CDTAbcL2N8QGMG3YBpmMdS7XAS70ptTFtfnXw
         T1Yw==
X-Forwarded-Encrypted: i=1; AJvYcCVk3wGn4wE/G/Kl952ezBS6nZEjWCPnxQS01TkF25PMxlqrenrFDbyRdwiPIyvF6W2FK7yFwWrXbMleU2U=@vger.kernel.org
X-Gm-Message-State: AOJu0YwH5ks2zG9r8/hj9orsmzMf/4TxTWUK452DcqHM/yaXyB/F3RIf
	QDkmn6vLrTxk7fyMxlmJB4BpWSU7uWQrG8OhembT37ju+4hu14E4J1svGO+Xs+Y=
X-Gm-Gg: ASbGncuT2XxVlXe2gnP0z5n2HIiw+cT8FqmQxw442cAYorkeHQ1vylCDorCiXL+Rl5v
	Q2ggv+KL6S4tbt7vSJI74F/9b7EFKZRmOjwMAugOA8JhQB4lSgBF/qKzZUG/QSq5KWXEfAWgRaT
	Vr2pQaffHKdDfho219YWiuU43xY2JSSx5Fg4iV+KYlhcmOePsPDoLlg9MVWZO3Bf4EC+ElPT8jv
	G9sRXFnYYKyOFv7xLSX8WIH0I6Fd4wN1PSDoWIrOTYeVLgdyBzvE0J5IsZQfdZHmMw6aHHz3XXT
	hdq9ln2VePJR9TUsSih2XRzXhcmNgXM9+R2kE9RKsHJxQIahjF8=
X-Google-Smtp-Source: AGHT+IEEHI/oSTREUk8HTc9X/nZpZu+JH0JNL8Ix0W8ZxxBaMoWEfgZFH93pE+NmBTNHIMjXerli4Q==
X-Received: by 2002:a05:6402:2547:b0:5f6:252b:f361 with SMTP id 4fb4d7f45d1cf-5fbe9dbbe1amr2731807a12.11.1746622478474;
        Wed, 07 May 2025 05:54:38 -0700 (PDT)
Received: from pathway.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fa77b914b4sm9354161a12.51.2025.05.07.05.54.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 05:54:38 -0700 (PDT)
Date: Wed, 7 May 2025 14:54:36 +0200
From: Petr Mladek <pmladek@suse.com>
To: Bhupesh <bhupesh@igalia.com>
Cc: akpm@linux-foundation.org, kernel-dev@igalia.com,
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
	linux-perf-users@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org, oliver.sang@intel.com, lkp@intel.com,
	laoar.shao@gmail.com, rostedt@goodmis.org,
	mathieu.desnoyers@efficios.com, arnaldo.melo@gmail.com,
	alexei.starovoitov@gmail.com, andrii.nakryiko@gmail.com,
	mirq-linux@rere.qmqm.pl, peterz@infradead.org, willy@infradead.org,
	david@redhat.com, viro@zeniv.linux.org.uk, keescook@chromium.org,
	ebiederm@xmission.com, brauner@kernel.org, jack@suse.cz,
	mingo@redhat.com, juri.lelli@redhat.com, bsegall@google.com,
	mgorman@suse.de, vschneid@redhat.com
Subject: Re: [PATCH v3 3/3] exec: Add support for 64 byte 'tsk->real_comm'
Message-ID: <aBtYDGOAVbLHeTHF@pathway.suse.cz>
References: <20250507110444.963779-1-bhupesh@igalia.com>
 <20250507110444.963779-4-bhupesh@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507110444.963779-4-bhupesh@igalia.com>

On Wed 2025-05-07 16:34:44, Bhupesh wrote:
> Historically due to the 16-byte length of TASK_COMM_LEN, the
> users of 'tsk->comm' are restricted to use a fixed-size target
> buffer also of TASK_COMM_LEN for 'memcpy()' like use-cases.
> 
> To fix the same, Linus suggested in [1] that we can add the
> following union inside 'task_struct':
>        union {
>                char    comm[TASK_COMM_LEN];
>                char    real_comm[REAL_TASK_COMM_LEN];
>        };

Nit: IMHO, the prefix "real_" is misleading. The buffer size is still
      limited and the name might be shrinked. I would suggest
      something like:

	char    comm_ext[TASK_COMM_EXT_LEN];
or
	char    comm_64[TASK_COMM_64_LEN]

> and then modify '__set_task_comm()' to pass 'tsk->real_comm'
> to the existing users.

Best Regards,
Petr
