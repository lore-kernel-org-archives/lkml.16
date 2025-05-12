Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38ADF1D8A10
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 07:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747036537; cv=none; b=Lk7gvuNYl0utLSLGt+Uig1rTNPWgSdg3PqFFGAwKizgS06OXES8SoliVoeo5Y/tdZL3pUrlVnTsAW4l48Z6m5lJZhtblpeZ5OGsW+0qrbgsDmwiKJt137OxYR6ucTcKw5A7gw8evNHbAZgJi3UY1HfGoPrkTNbTRNGa5X/DbE8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747036537; c=relaxed/simple;
	bh=7GONjaD7jFf6DraAUB8mWndfQEMMogoPdAMOxswMWYM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=me83gvN6c4YbOAxjOkasCh6Z6mrgl7Q9jfSqdIP4p3DjSTgLtHihMVy9gWIPofaDAKZZfzKi6pfyQxQCBwTRErNQS6BToRZ1d59xHKyOy/kOx2iR9W/xOJYKt4v7XEkYG31GoqFYIOGDUybt+W8nFkYv8aVs1AHWVDKahrSACsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eaUrtNBt; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eaUrtNBt"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a1d8c0966fso2401602f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 00:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747036534; x=1747641334; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JVmeoRs8wht6ScX85zDxCRxMqcg4xq84fv5EF0eHPpo=;
        b=eaUrtNBtAlkGznj3QUjgs82ayC9haBffhtS0lQhAfxWuDrzuOSOsqgDup6eTvmKNsf
         pKE1L9++VvCAl7SjAaZaxPSZBJh7l9KvDdhGxm8fMcm4IVE58oXAExMfDYJeLxiTfpOv
         PoaZB7g2KpAEy7+6xyFaGstD6+3QOnBTDJ7uCqZi27Yz5UnmLtWW8E9SfrXEyMrS8KVz
         Eu3x/nqzzYMeI/0237a3pKIJHxeTrZyguff67cu3O3OmzT0GjxePTB8E5o1jb1teyi8L
         h7bC+je84/PxyJQC2xbi5ZiJBc/qHXj66Nc9s4QcpR9iyJ8e8QIVaRaj3fApKn2cKEU2
         v/4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747036534; x=1747641334;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JVmeoRs8wht6ScX85zDxCRxMqcg4xq84fv5EF0eHPpo=;
        b=R65xvV+xMt/2DA6F30RAH8f8/StsYjtLxV0BB+ck/3ZOi3dKSf+TbYRZRewK6nRmLl
         x217JkxffNM7Uylv5QBJflAxJAUTXIqDMQFzMZFmfRe85feNe1zdCYt5Q+RD17gIv8T2
         AEzYRKgAxn4r5DRjTkySfGINEmP5ZErJ7duJNFibUu2XvDOGbMx2w9SuL3nlfJRM0jwz
         ED5JN0KET0otW3zYjf3QC4VCJmMsiQhR0wskIKhe3eEqpMREgfTn4Od2opdRklXqSQbR
         gbO570jsxhu5BWXEkCfKVOrW3BUAL3hpiGgKSpkRwopNjoa7zzRZJq8Yyj6AO1hdAVEM
         Qaxw==
X-Forwarded-Encrypted: i=1; AJvYcCVRfq5HY7LBYsubwsY1TvDSy9xVoofCMhj6g36UAXE2fN5gV5jE3bvtWSCwFPHxG4W4ZJrI2YC7whgdl9c=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCPmxQVFF0Fg2pG8onCKgV46uWrqJUj7FszFirbhC9eGNNFI4j
	7EU2CB0shc1Ns8UcFQhwO4RWXnnLjUpuxOY5f0OO0T7mydM/N8EHKfWNlNbrRQ==
X-Gm-Gg: ASbGncvGkQq+7TW7rfJbCz3m7Ur0aY+KYY1l4l9MpaEUi+OjdBl+v1uZYK/xkaRnXkT
	0ms9orGVjuA6iSqLDfLs49SC/x2hbuki0xi7pfVbf4+NgHLF3YZA4gYCaZEs+U7zHfd0f8lcYsR
	Krqcv9XwYr7iaybP8Qm7uH2Sid7vP9kTIySA0xFngxnvir7c1i6oxP42rR3PFfFyM3V3ExO92Hh
	rHTRbBZUa5NTDXo0tUhJB2EirzZxHnwVeIApHdPIH7NcMU2kESdTon7iwS1nsqvKgPg0A9mxA0r
	PzXcd1g/RnagX/n6ZleFJoZiO6+tvsQnq6XoXz8gg864mekpW7IDcXCbhsstsxY5TlVVI4gtakd
	w9Q4RRHkuHxlJQUgp6ZkECr5FfU8=
X-Google-Smtp-Source: AGHT+IHRngy7dyfSblPZg3kx1M0V69ixjtLKeGbM3AJ71FSYb+70+rHci10V2fws5C9DeqNnhr+dvQ==
X-Received: by 2002:adf:e612:0:b0:3a1:f724:eb15 with SMTP id ffacd0b85a97d-3a1f724eb66mr7737749f8f.2.1747036534388;
        Mon, 12 May 2025 00:55:34 -0700 (PDT)
Received: from google.com (218.131.22.34.bc.googleusercontent.com. [34.22.131.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58f2f65sm11745987f8f.55.2025.05.12.00.55.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 00:55:34 -0700 (PDT)
Date: Mon, 12 May 2025 08:55:30 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: mhiramat@kernel.org, mathieu.desnoyers@efficios.com,
	linux-trace-kernel@vger.kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, jstultz@google.com,
	qperret@google.com, will@kernel.org, kernel-team@android.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 05/24] tracing: Add events to trace remotes
Message-ID: <aCGpchGnvyFpWk2y@google.com>
References: <20250506164820.515876-1-vdonnefort@google.com>
 <20250506164820.515876-6-vdonnefort@google.com>
 <20250509154735.530d4a37@gandalf.local.home>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250509154735.530d4a37@gandalf.local.home>

On Fri, May 09, 2025 at 03:47:35PM -0400, Steven Rostedt wrote:
> On Tue,  6 May 2025 17:48:01 +0100
> Vincent Donnefort <vdonnefort@google.com> wrote:
> 
> > diff --git a/include/linux/trace_remote_event.h b/include/linux/trace_remote_event.h
> > new file mode 100644
> > index 000000000000..621c5dff0664
> > --- /dev/null
> > +++ b/include/linux/trace_remote_event.h
> > @@ -0,0 +1,23 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +
> > +#ifndef _LINUX_TRACE_REMOTE_EVENTS_H
> > +#define _LINUX_TRACE_REMOTE_EVENTS_H
> > +
> > +struct trace_remote;
> > +struct trace_event_fields;
> > +
> > +struct remote_event_hdr {
> > +	unsigned short	id;
> > +};
> > +
> > +#define REMOTE_EVENT_NAME_MAX 29
> 
> 29 is a particularly strange number. It's not even divisible by
> sizeof(short). This will leave a hole in the remote_event structure.
> 
> Should it be "30" to plug up that one byte space between name and "id"?

Ha yes 30 is what it should be!

> 
> -- Steve
> 
> > +struct remote_event {
> > +	char				name[REMOTE_EVENT_NAME_MAX];
> > +	unsigned short			id;
> > +	bool				enabled;
> > +	struct trace_remote		*remote;
> > +	struct trace_event_fields	*fields;
> > +	char				*print_fmt;
> > +	void				(*print)(void *evt, struct trace_seq *seq);
> > +};
