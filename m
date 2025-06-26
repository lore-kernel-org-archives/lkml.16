Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8023B2E764B
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 13:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750945726; cv=none; b=HAOO8ZJ11pHoodTvA5FSbfmmS5b6Pp69lejKC+Qe4HdBaoInPkgydn10ziMSIRDP+AS0Rtgx0YEzZDqJphAQXcFqLOX3Avo0hUjyeQszY34xp9IGZtOOM8mjctDzxuUJtyAVwRxHoMYT9GIHOzf2WxZySbb7kyv92KTwkRa1rkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750945726; c=relaxed/simple;
	bh=jAU0aOHceKYNcCYExz5XRGz1x3hYT4dCXMxeIfFPfBg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M/d+Lc8eBFY68pAbsn4/q4N5y4T0Hff7O27VmxHBLggyfuAkMd+pkuVMqD+GC4dv2igxRn0l5VJZjqFQM5Yc3doroXNNBvhFBHj+u9I1QEiG8d1wmmRlZjN5hE8jul85E7kt73LsjdbmSMIqKuMq7jU0vdFuqN25iG1EC9FQ2/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=I93Fnaph; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="I93Fnaph"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2363616a1a6so9905405ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 06:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1750945724; x=1751550524; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aJtqONCBTd1Gv0wLO+PNarwx+koXGlu1bl6aoxfQ5Ag=;
        b=I93Fnaphw9eN9hWdDLAP264CaWU4stPzjHjAyuKrx1Nnhq6SKOhUo4zsha1HYwh6Fz
         0TbpR1+U/czOEEE5mAqRlVvSHHrraZsmUd9s5uQc3p6qQ+GrKWCzwmXVF8rt5702OikQ
         QmVjjCaKsul0vRW18kpG78IWu6BaTEMHuF5n+VFiDk8zfFllqHe38RunWWg3uPJOALw7
         hT8eOgkjiynEuRkButeNW9arXdg7V6tSkcnjoWnJ7f4INDy2QaKSuDeXfP3ifLcZqnYI
         3OI4nVZEhO00TZ4l3QTZoPB9seWXvzZjH7Sytx4xTF00fF9gFb5Xs2je40FyeHss83Y4
         lU2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750945724; x=1751550524;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aJtqONCBTd1Gv0wLO+PNarwx+koXGlu1bl6aoxfQ5Ag=;
        b=dho2YsyXfSwYrNK6inoGgtsMJQ7/s9030RY9aoOQme5ommQwT4x7nL5bUzrYn3sqA4
         /YV+u5hXASq84oWMNCbAdRzA1IGy4SYimfqaQ8cRaTWnmyuAOVpffMgsFZ7BL74bhHze
         hKp3t0YIZF20y4GnjpfqSa+wiBVUlEPlGFkMCbbpukZmpkHOjldEOtu3+FKeAlKF9t5q
         9ZGsEzIIM6cMIf1iJ0yzeJmpF8zPqjE8VmoMa8RI4cKNQViZulv6DXhcBqE8mavStFql
         VpcYYI6mo83JhmbB4kPi/PlxQNx39+q/Mf9fEUKCGCx7yyh1D+bGKgQ625jRGlJXrVQg
         dkdw==
X-Forwarded-Encrypted: i=1; AJvYcCWMX3udsOQOqjbVGMUV/wZoZxAc3aQIe/HvDjll9/KNyNd/302ViT2sEy2XqtDxx+I+qChAcw0cL7/vXLI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlqC9ie1+Lwrhb00nFOz7lnhMMzSAM+mtbhmDSM4nS66kI+Wqi
	GGZJMxdxIQvJaVH/vPcPPQUEnMlIZCfo5GSQQwb+lsseuHYgsnec9zs2d+LkncPC+6s=
X-Gm-Gg: ASbGncvQcVdwRHEyCX/Lqo/03I2dPc6OzUEHsxU/YRLoVAO6zzUT5Lpw/qtW7okZ6eS
	0VIl23Z8V3bURQaJuhltdsU6kgUDuBmWiFsb4XE0gaKo5oXLaC2gFumArAyeXBVHle2wqQdbTBq
	LicCe03tN06a4GwkOqZ+w8VQq4PhhtG7Vw1zDBWGAefwiOB9sW0/RNq6gZdlpHmx1IBFwylN1ek
	jJiAWxlNDtyZCK7KYby+xyAmrqVigz9Ge1Ah9Ahjj2YAOdHQFZ1/GGrwwarzeKpIP2qxeQbr/lB
	INr9vZT/a7zf428mD1Qh5G8XHQaXRgiXr+KxsXCfijT8+U7ME6gW7pOu2b69bwze+8qr
X-Google-Smtp-Source: AGHT+IHaZxlWF+YhElFCAwxYF4cK8J7XWLEsDwhwcGid+kpLovDJu4Tpxovjl6eB2F21LeYzhc7jVw==
X-Received: by 2002:a17:903:1a8d:b0:235:f70:fd37 with SMTP id d9443c01a7336-23823fdfe7cmr116316585ad.19.1750945723795;
        Thu, 26 Jun 2025 06:48:43 -0700 (PDT)
Received: from [172.20.0.228] ([12.48.65.201])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237eec29a77sm117429145ad.165.2025.06.26.06.48.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 06:48:43 -0700 (PDT)
Message-ID: <a3b456f2-deeb-45c9-b509-23bbe5e96cfd@kernel.dk>
Date: Thu, 26 Jun 2025 07:48:40 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 03/11] perf: Use current->flags & PF_KTHREAD instead
 of current->mm == NULL
To: Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, bpf@vger.kernel.org, x86@kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Andrii Nakryiko <andrii@kernel.org>, Indu Bhagat <indu.bhagat@oracle.com>,
 "Jose E. Marchesi" <jemarch@gnu.org>,
 Beau Belgrave <beaub@linux.microsoft.com>, Jens Remus
 <jremus@linux.ibm.com>, Linus Torvalds <torvalds@linux-foundation.org>,
 Andrew Morton <akpm@linux-foundation.org>
References: <20250625231541.584226205@goodmis.org>
 <20250625231622.172100822@goodmis.org>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20250625231622.172100822@goodmis.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/25/25 5:15 PM, Steven Rostedt wrote:
> From: Steven Rostedt <rostedt@goodmis.org>
> 
> To determine if a task is a kernel thread or not, it is more reliable to
> use (current->flags & PF_KTHREAD) than to rely on current->mm being NULL.
> That is because some kernel tasks (io_uring helpers) may have a mm field.

This commit message is very odd, imho, and wrong. To check if it's a
kernel thread yes you should use PF_KTHREAD, but that has nothing to do
with PF_USER_WORKER. In fact, as mentioned in a previous reply,
current->mm may be non-NULL for a kthread as well, if it's done
kthread_use_mm().

If the current check for "is kernel thread" was using ->mm to gauge
then, then the current check was just wrong, period.

-- 
Jens Axboe
