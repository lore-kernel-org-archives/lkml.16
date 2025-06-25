Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B73F13074B2
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 15:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750864840; cv=none; b=AtQvDEgcqiWb5pmKWI4TwNgF/Zyatv9KVtLW8gycSyNz4ilxEBZhKi32xnYMvA82kwiAIQFzPvhxYML5THJ9y8/7zznKL4Qq6Tg2DI78wkTZD7ZnGTJEr93ulvydIW2oYI6wK4WUUkcdY6q+nhpEZyyrWmQmSYSbEfGBFguKUVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750864840; c=relaxed/simple;
	bh=I3VMeM3ROOebuGmLfBamVIQdry0me/Db5bPJT6IVBiU=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hG+tOBsQ04wROcB6XWXaPze4AObVGCPWSnUx/1FMBeo1W1agKfYdFgv0fvPUcBkZKNle5XL+u6cVvrUJLCM5EYQOClsc3coAGKjO2RsB/RQ7pY95IUwetzr3hRExhj7QI6NSfYPahIY3j9kqONZA8804AatCVFfss8iF/8GjLoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Y0IWnLvX; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y0IWnLvX"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-73adf1a0c48so496605a34.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 08:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750864838; x=1751469638; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=N8J0ohQkucXBpYPSUPUSvYWk0PHTE1+Gl4bdfegEge0=;
        b=Y0IWnLvXsc3fEcGsQFavcKXEFpMdeXANtpCDE4i6UnW/kwQHGCVVi1o2YKuJF/Q8U9
         EMo06gzMVI/LrvQpjflqBfjAHTek6qWhOmYrHrEwcFCR1j96hbbiNbxCB6hNVXx3UEZp
         lnLXEe/BmJFvRmfqf/wf/pzYcYDCCWJXRU2Cppf7dbn1/Y/H1MQWBkeu8GzfcJuhSZ7I
         IZ8pU+yOtFEBPmJtOUTNKw3gC54Fyf+1SrWXB4GHkPYl61RQSwSfNezKw38j+pvJxA5e
         3Faitaxz9FYuOTRpfHg+q2AcjaCgGit/XdL9cxxNiqk7QzKGLZr/Iq/cI8vS1j8TFRKj
         2/nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750864838; x=1751469638;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N8J0ohQkucXBpYPSUPUSvYWk0PHTE1+Gl4bdfegEge0=;
        b=tHJiffs2JzbMcc4dh4TNVw2F6WKxYJIK9ZfsWvVQ5kFyg1K5ocdzRfXxJMU6D7XmDN
         e2/O8M+kqdFPlzMdjNY3eGt3th/v8jphLdFEcofQFdD+O3bLXyNadpzMGmT8PKOBsYGs
         gaq42IPLcdRkon4cxMMKxBzdNu7ozXAMIwdQ2Ns9EV6C3NBwkGNNLZ9vUDrUzM1+oPTF
         LXI8+QaLYaEJb0xZduk0U07u4tV5hCSsZVtJgSQbajEoJueVYooL350TZsytjwe2iY66
         We8rJ4LnGREu/vq8QPi/BicplSbqL81uDOiyxU+/5D36PWudpgiV2eElroiuP1jzeWhn
         o21Q==
X-Forwarded-Encrypted: i=1; AJvYcCVY1N7FiGYXLoEhhwXMt+9+eoXA989WN/kIpsljSmnWL4Xfs0VsgTVemH1jYCaTEn6KexgzYzL1OGsbTGk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8+EgrxbigXKEOSnZbsMNtYsl3V5St2Vu+ZnFL77XB9mQzMqxy
	ikFJ7JBic9GFnbaOzcprpK/p5dSTugJE+lzwyiQVmEAtTFfMHIwzsp5ESXwDlKYi2dI=
X-Gm-Gg: ASbGncu6dHLlV9GoXkwSEnYmGB8PjC6Dk2IHqc3zMTN78La+0LsKRhNxPNr52nLYhKQ
	NJjxMw6DYA6EBVKVim3rTA+iG83/kS73gmGwl8OTHRfMLrJRgWSGlsWQ9U2Ri4jXr+2ZsmgHgwt
	JTLMSTSG6op4CvRvkSxVG5YZDPgXyAls6fTwZjM2ZyKitTMcGf1v9LrHA9zDo+f38vo18IFijsk
	orkJsVplbmMR9zQmNJRQ4acrHUKynxl0Q03ojodADYILn3gSsGti92puCmxLWD+zlGgPZZlFCku
	P1YivWGIlsx/wEVt1hOnLb1ZGWdINRct4yFqjF3zBFQdTVk7AkgkJJVeDDnHmj1u2qt2Vw==
X-Google-Smtp-Source: AGHT+IHN+Igzxn2usZkb70KRzmmATFBMBOaapKjVxLI0arjq0Ex2N8xDeTWjV+sIuuSwiIxu3jHu/g==
X-Received: by 2002:a05:6830:8419:b0:72a:47ec:12c6 with SMTP id 46e09a7af769-73adc5099e7mr1611593a34.2.1750864837773;
        Wed, 25 Jun 2025 08:20:37 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:1fca:a60b:12ab:43a3])
        by smtp.gmail.com with UTF8SMTPSA id 46e09a7af769-73a90b337cfsm2275280a34.28.2025.06.25.08.20.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 08:20:37 -0700 (PDT)
Message-ID: <685c13c5.050a0220.38a39d.dcf8@mx.google.com>
X-Google-Original-Message-ID: <@sabinyo.mountain>
Date: Wed, 25 Jun 2025 10:20:36 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: gregkh@linuxfoundation.org, Benjamin.Cheatham@amd.com,
	Jonathan.Cameron@huawei.com, dakr@kernel.org,
	dan.j.williams@intel.com, linux-acpi@vger.kernel.org,
	linux-cxl@vger.kernel.org, linux-kernel@vger.kernel.org,
	marc.herbert@linux.intel.com, rafael.j.wysocki@intel.com,
	rafael@kernel.org, sudeep.holla@arm.com,
	Kees Cook <kees@kernel.org>
Subject: Re: [PATCH] driver core: faux: fix Undefined Behavior in
 faux_device_destroy()
References: <2025061313-theater-surrender-944c@gregkh>
 <20250614105037.1441029-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250614105037.1441029-1-ojeda@kernel.org>

On Sat, Jun 14, 2025 at 12:50:37PM +0200, Miguel Ojeda wrote:
> On Fri, 13 Jun 2025 20:33:42 -0400 Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > Great writeup, but as Miguel says, this isn't needed at all, the kernel
> > relies on the compiler to be sane :)
> 
> We may still want to clean them up, e.g. for tooling -- Kees/Dan: do we?
> e.g. I see a similar case with discussion at:
> 
>     https://lore.kernel.org/lkml/3f1e7aaa-501a-44f1-8122-28e9efa0a33c@web.de/
> 
> Which in the end was picked up as commit 2df2c0caaecf ("fbdev: au1100fb:
> Move a variable assignment behind a null pointer check").

Putting the declarations at the top was always just a style preference.
Putting declarations at the top causes issues for __cleanup magic and
also bcachefs puts the declarations where ever it wants, but otherwise
people generally still put the declarations at the stop.

regards,
dan carpenter

