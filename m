Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4397E25487E
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 09:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746695665; cv=none; b=ckG53Bsa9HiwEk3K8jm1/R8Y1phriRPRHbBWtA/QUVou/dLmUdalJFnhljXAGEDdJkoIUb49L1vx82cIvLCucqbe6La0LROspwA6m/Dd2UgGac4SZedCJ7yW8W7aAyrSwzKXZG2PrboZXRYgsjyuMt1K/Zprpacfp5M6IxqFEgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746695665; c=relaxed/simple;
	bh=2LdP/A4VnpSZ8Arqppmfa4jFk7aBo9TTHIHZC8kq8fc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j+aI5ZnfpHCFyqjpuL0CLe9U1+kNX+Tk+WVWbxcgTRgbmDzaJrRC5fLVpXfLImIO82PHK4bipuyGSJXG1X6YWnUbYINrvH2YsRMhE2qxEuawOyNrIgtjXju9uq9cK9PPtljwPfhGPb7KY7aZCFoi2qpTyHEF/98gYdc1xUIXK60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CIGqmhx5; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CIGqmhx5"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43d0618746bso5497565e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 02:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746695662; x=1747300462; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jtD1t5SqwVfSCPyTjNxq3c+2H14P2VPj1wlw+YRYZjE=;
        b=CIGqmhx5vL5fqu1yATZFv0VZ58N3X9p2mnpm+RxoOfE2E/sKWC3SimKxPjDQSNOy78
         kuW4q1OZWYz/54l0ZkWvyPA+AkJOKR2LJCJu91rImNHryJm5U86bJXhHiaXo4rI/5Pfy
         qXhLWufic3L967jB3PV9NbQZDnEKJRdko6eIg6bF0pZuARSKDPk+AZ+6WgO5j8mwEfdS
         U3GE6T484/kem3qM6y5Rj7280Ph3DgU0fY/TIcXloJfIpfZ0JufH9aB4GboZqCJ0SpC9
         doSywFvyZVU4VDEpyG4C67moons+UdqbQ0WIETw/tsxY0tSq+shtyPhgUB6wQNc5zkSK
         0kTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746695662; x=1747300462;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jtD1t5SqwVfSCPyTjNxq3c+2H14P2VPj1wlw+YRYZjE=;
        b=WYKf2VPWxsnvZcguapBUO0k/bEEcCAcMEvDhObkNqeVndwZaqR4wUH0N7EJFxQpcVu
         HH6qF+dDsCCvi8quVQeictYqi3iImS36+Y5dYx3WrMydR+iGgorXFwqVc4XXRcvHd9pb
         uKm+JusecmRd+5illjd+9f/DV1xPVof/eAZudyPSFBFs6YII67/0Xl/pjf45vvQeb+XK
         krZ+zPKOsPMqhxjtPw/4yZeSI7fXkegUk5WH/ckGdWcL84z1tKdqzXCT3H13ZhClfsRs
         PywNBIJPrNhDtF04F3c4NrIjKp6EAG2QFiqrfwsZAei7RbDJnvcB8OzhxKjtXnoUPKAO
         b71g==
X-Forwarded-Encrypted: i=1; AJvYcCUSc84rDum9J868womZQya82w+IyQ3Vq7hnHb7MWG7kjRXsR0msdRYkobUxc10nWcmm87uoAz9lqlt0CdA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzq2hso/icoUCVc39gMT59RRk2xDYQNVHupWtQr2ynYHCWlid81
	fUfs86V2qa5Ovf8bCFU3nqLj143FhTzdZHeIvs4flMF7p7GIk2SY+UaTQ2ONsg==
X-Gm-Gg: ASbGncsx8QgjgfzoZH6+XBQMXwDZCz0W//ewVfdnupiYXko4gqeeJzquC+Mam+QA8nh
	/oHtC5xyrEA55nnE50JF15wAPxY81Z2okTBZwNpMBJ1Qrp1qzMpT+3CTnmWl0k2+bvHpxLn8p3E
	ep61mAiVM/yDOkk0qTdS8+9uFzW8qFh23FCHL5uKXtc3yD/BWMdzKo1CIptKxZ6k4X7HfVnkd+l
	kq3SteG7OtGKd+MDUBfknjLiWib1DJeurrGPRTftExWU9IhWOk1sW4Wrd7jEAYLkkTiPhSJOuK3
	Vsx1iVwcbFl49RuI0+y2nTNqyiOT9xdTUCL5oNjPzmr/lxZRAlAdI73OAN/x9vtNmE7ir5qlij/
	5BqzXKg==
X-Google-Smtp-Source: AGHT+IF9SUYOnKs3lJu1vUeKHxmfYUfp4eeX4TzwT3TxRpgJ2RHbyMATX+EQtKICG97KoSCFK8KYGg==
X-Received: by 2002:a05:600c:3e84:b0:43c:eeee:b70a with SMTP id 5b1f17b1804b1-441d44dd23dmr51647125e9.22.1746695662495;
        Thu, 08 May 2025 02:14:22 -0700 (PDT)
Received: from google.com (24.204.140.34.bc.googleusercontent.com. [34.140.204.24])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd333326sm29694785e9.16.2025.05.08.02.14.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 02:14:22 -0700 (PDT)
Date: Thu, 8 May 2025 10:14:18 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: mhiramat@kernel.org, mathieu.desnoyers@efficios.com,
	linux-trace-kernel@vger.kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, jstultz@google.com,
	qperret@google.com, will@kernel.org, kernel-team@android.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 02/24] tracing: Introduce trace remotes
Message-ID: <aBx16qth045MwQJV@google.com>
References: <20250506164820.515876-1-vdonnefort@google.com>
 <20250506164820.515876-3-vdonnefort@google.com>
 <20250507202444.43963c84@gandalf.local.home>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507202444.43963c84@gandalf.local.home>

[...]
> > +		remote->cbs->unload_trace_buffer(remote->trace_buffer_desc, remote->priv);
> > +		return -ENOMEM;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static void trace_remote_unload(struct trace_remote *remote)
> > +{
> > +	lockdep_assert_held(&remote->lock);
> > +
> > +	if (!trace_remote_loaded(remote) || trace_remote_busy(remote))
> > +		return;
> 
> Can this cause leaks? Should trace_remote_unload() return an error value to
> let the caller know it wasn't unloaded?

No risk of leak here. This acts a like a refcount to make sure the buffer is
unloaded only when no one is reading and tracing_on=0.


[...]
