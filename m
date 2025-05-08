Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DCC0EAF6
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 09:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746695447; cv=none; b=UGywDGl52z/NDKbx3eAPy8zi8Mmhx0/SZ4FxcYqCc9jiqeAqT5xltaJw3i3wHYB4AwvaIS+X6UyuR7vD3QOY9GX/k25trGvxts2t4gL0pUy2k+ENyf3/LwgRSTUiIHizGyfcuX4JmyzSorB9LrIpNCAfG5SGTUMK9zG1V94NnPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746695447; c=relaxed/simple;
	bh=LmiasClNLNII0WBPSAYz+34LkkofdgOSbO+b2cSkmPc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IAbCZsQIo/GmdAgtDIffECRu/DPYhoragLf+u+3i0H1myXo2ToV/zZIK0Ojol0egKa0m4ro6bwTwLHtXhks69tOqR7w9lh4qQe8y6U7W/S4LBp+kosOS259MOnsW9AWbAOCIrALpMn5b814RawLNsK6rD7Kwvaxu7OTHA+cUkPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sFK+q5dj; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sFK+q5dj"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43d04dc73b7so7808365e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 02:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746695444; x=1747300244; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=l6UyUXCpgr0WUFmw2sPhx8dNtCUTskL7HDMmKzVGhcM=;
        b=sFK+q5djlikeabvFI+26YAZQzYv5WckqBBd+NxMUItMZWf5wWVisjbwLiNL2Nnknxy
         8ENfruXKpFg157StfSF6fVhhmVHFiyaxeylGITBpNsrB3IkB3eW1FOyq6uHa0tZ5PIGH
         hu7ZJa0P5R188QyDfdklXqZXIkfUg3crmcQVoZY7/55HGbwjU/JhjZQQP8HOLgtzaCXU
         x5iWv1N3WBh+sMyZdux78SAu2h+GkmMj5cJwSCty1IrEwK3fcEhZ7mxLUlzs7O6z20u7
         StKeNUcgT77qc2kXITsha0s1uynZzUmpE/VpDUjTLjBxrG4L2asI2TqJ9+kIgdqJCTOo
         AoEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746695444; x=1747300244;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l6UyUXCpgr0WUFmw2sPhx8dNtCUTskL7HDMmKzVGhcM=;
        b=gBHVXVgaM393YHOl9ETqFxWHxQfYCEYZ34Hop8cNg6m8YX89rb1H5MwIC1qlW1VoS4
         f9FgcsyFGdi/NMewevpxCyat9vCdCxRYminfqtAezxMHpcZhmQinTe8TUrSWhtDUoSRV
         VJi6IgME1HVYSvJFT2leQBx4xb+6uPN+9cZMSo1SjXF8UCDtQxXAFlhleZulPE1yPp+O
         2f3JGYNQ/DoPCVuJpAS0UCNwYpIo3xrLqSyw2z1qwuiG6nHijgHx6nYipHMK2rRt40K5
         B6PZo761ebf+clAJj/A2msgsmSePAiBFg7PYYnHm1vV9kQ4XvFRfjNcxGHdAFT9Mv9P3
         YmjA==
X-Forwarded-Encrypted: i=1; AJvYcCVIQzZHy+yjGDL+06a742JU/Vre/SMACeAIcTs8fNT7T39bIpese/8g9ELNJTAQNFU3AxqI3zUUe+goVR4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCBHzM5jUYgcRceVHScVCOzcdhpZQy9h7dggRLVak0iGRBBu14
	HuUVoDKi1b5Z5yQCuVb8q+uoXUyoQ6XvlEo1TKxCv6HKIRWuCb6pEzoFyuNYkQ==
X-Gm-Gg: ASbGncs+Lz03NYdaLSatnbvxc5CODcej0/0Uq/KSDcWqtNSw1i+f6H87LynoGbUkL6F
	Z2K3DBEz0ijHmV76zBe0vHkDHL3w6cTKtumDyPbZhnyIzmewq1dNUAt7WsDKwNwvxRHlw1bV8Z4
	JnqzYzkYbGdsgV35Ap7HhufqgpRngv16VdcD40JTGpFxSuLAdHza+i5Y4+eqFKPbeA4m+sRCMS7
	mKcmeqogQChl4FAsTXHUv+DeNLpREYEuUlxMC9l/VyGnSPzXzlurUigvO8Vhbzvwzn/fuVeHVn2
	Z5PYOWIjLGT1bkidewWcPPUPcaHjR+mO4ovFWKOqpPvh8gyUmuxknCwxgiD/mmy0i0AjgmNt85G
	Pc/kBHPeIQu9ovzDT
X-Google-Smtp-Source: AGHT+IFE0UJOTPADB0ayGWYTFGEaXRl7J0a4Js+PxgbBt0NVKKxXiHCD9XRls03Gxp9z/i+BfiucLQ==
X-Received: by 2002:a05:600c:cca:b0:43c:f5fe:5c26 with SMTP id 5b1f17b1804b1-442d02e284emr25519055e9.4.1746695444305;
        Thu, 08 May 2025 02:10:44 -0700 (PDT)
Received: from google.com (24.204.140.34.bc.googleusercontent.com. [34.140.204.24])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd3af15bsm30152975e9.30.2025.05.08.02.10.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 02:10:43 -0700 (PDT)
Date: Thu, 8 May 2025 10:10:40 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: mhiramat@kernel.org, mathieu.desnoyers@efficios.com,
	linux-trace-kernel@vger.kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, jstultz@google.com,
	qperret@google.com, will@kernel.org, kernel-team@android.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 01/24] ring-buffer: Introduce ring-buffer remotes
Message-ID: <aBx1EBa6QFH7dmqs@google.com>
References: <20250506164820.515876-1-vdonnefort@google.com>
 <20250506164820.515876-2-vdonnefort@google.com>
 <20250507194722.263a8d1e@gandalf.local.home>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507194722.263a8d1e@gandalf.local.home>

On Wed, May 07, 2025 at 07:47:22PM -0400, Steven Rostedt wrote:
> On Tue,  6 May 2025 17:47:57 +0100
> Vincent Donnefort <vdonnefort@google.com> wrote:
> 
> 
> > diff --git a/include/linux/ring_buffer.h b/include/linux/ring_buffer.h
> > index 56e27263acf8..c0c7f8a0dcb3 100644
> > --- a/include/linux/ring_buffer.h
> > +++ b/include/linux/ring_buffer.h
> > @@ -248,4 +248,67 @@ int ring_buffer_map(struct trace_buffer *buffer, int cpu,
> >  		    struct vm_area_struct *vma);
> >  int ring_buffer_unmap(struct trace_buffer *buffer, int cpu);
> >  int ring_buffer_map_get_reader(struct trace_buffer *buffer, int cpu);
> > +
> > +#define meta_pages_lost(__meta) \
> > +	((__meta)->Reserved1)
> > +#define meta_pages_touched(__meta) \
> > +	((__meta)->Reserved2)
> 
> Hmm, I wonder if this would be worth adding to the user interface?

Would trace-cmd have any use for those fields? That said, even if it does not at
the moment, it would mean the meta-page has a single version between
kern/user-space and hyp/kern which is probably better?

I can add an additional patch in this series to extend the meta-page.

[...]
