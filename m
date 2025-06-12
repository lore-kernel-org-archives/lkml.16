Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20FDF19BBC
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 01:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749692273; cv=none; b=rki0QAq3fzkCrYASvS/GVEl0KcBm4kzT95uQhekL/bUjrr8hPHAvihLby/bPh+3ymZG9S15NAuOBBKs0XexluvnzojHxEByAuj7lSaPz6ut1tyhiq8ZQ47GYCS/cZ822I0QKqwQuGIJpH5/mIOj5kdUH8gKE/54ALMU40xPjzZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749692273; c=relaxed/simple;
	bh=EmgxiCslSolMNCzBUoL4OQg87GsLep/G3Phn9Wkt9NY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SmAyJH5+Kkpx+ISqg4IIVph7FWN7q+Qn1BzTHSVFhIYh6j/aKsXmu9w0bTe8b8clp+/029JESfXvvUhuU781mU/jvmDSOmYQGmcCgmTY1kKRHChrgqjDt/5mV5qHQwyHe7rChK06kT4TAgaTU0K3Qg4bK+B2HcnRQcSOuR1jT18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oJAampAh; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oJAampAh"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-742caef5896so486040b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 18:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749692271; x=1750297071; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=acl3HM/gy65MT7QW59o4rGkPJzPE8ycfLTpRSNc4cWU=;
        b=oJAampAhEhpA5cLdKflyLUxnNCqwBAg8wUsGafqBw8d+YGc1yhVYqM6FyrLl7bLTOJ
         VyEQEtnZaDYwsuGtYqegu9ln278lZUhJqeTE+jNhjouFSKht7RcxtaTEZo3v084MtRi9
         SNp/ujiepiAhJ1QFsCgtPUPJcSo+eZdKDDqp41b0UNkWAtB4Wt5zgVItMYWeSkbFlYH1
         aovtexlvaeiMQ8sz3XZYMWcOZyTdwtz/rJovSBEYIX5W19VeOcZgd1Z1/6wC3WAi7ZMt
         jDAaTRek7jOC+HVs84xyqHHHqdWFU01t9o8kIXvpMsqdrq2dHKlZm9sxtf9uxahvx5tn
         kxag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749692271; x=1750297071;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=acl3HM/gy65MT7QW59o4rGkPJzPE8ycfLTpRSNc4cWU=;
        b=TjaBqal2k/VUUnW9Qj1pMtHHT4ot8jVAPTXDdeQwbxlpeNKRnVZn0XQU9BVidwo7bb
         O/8TFwvFlG4MH/o9GrLYgHGC+XKuev8k3IZHhEQ0Lv44vH1xrtlnCNjMmPIumku9RaLi
         dlWfB4fWAqho5BDPBURXIfNAMMYiKQF1wRg6q7Qeihysop+QY+ojbS4cP7XPr5htjCj7
         3ehfB6xUDwCvQLsCcDvUbJ1pfjbYywJdz+M/l3+SYCoXxlSApfqzgYlwszLYpdUT3Nwn
         OgtkZNTADrOxaDEV3D3xsAgQAh9mqMdYFpCoKwyyM7iDVXETXldMnsVzDJi/+uSH6BhA
         N7tw==
X-Forwarded-Encrypted: i=1; AJvYcCXKanLJDvu1ZPpMg1m9QmGfn1zB4g1v4fKoKxcdqQgtEk0Z/wav/4/lnXoI98i5tYyaT/ugW73BWmYdyCA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPMu04ywZL24H9OUURKvLZQNijeZyScihEfOvH3QXJJsQ2I0t2
	WnB8k6XXSDB4nxqhswSscI9Uev+L+H/UEWfiL3kYgOhTks6Miejt+zZhFMFt5E87Aek=
X-Gm-Gg: ASbGnculajDLxsIdAvKWq+NHnz5TBav3x2ozkaI8//ONNH13JpTj+BlJ7VX9aKXP/FO
	5icAdE52IYLXAi422i3VYo2cz+TcTlzA7FvQkJjuOZJA7PHF9GRR4qi1d5Qr0k/4EBjB6l5EeAn
	TNTzECFIqCi9EgznWXegiCSptDghPHv2DvavST0Sp5eMDNzliO7QoP5CG09WVjF6kQ9I74Q116s
	8gXqojEmaa7F2liOT0wP+rAwOPARdkAUAOOezPnIEhfsXlbbOxK7MdeFGIm2CC7E0BSdL1AO7dO
	GW8OWVi8EzQlAPho6pGsnzKwXxmVxDU2VSIUerPgzL2X4ueOEbVQgZZUGJTiX9k=
X-Google-Smtp-Source: AGHT+IGQb69oSvUbCWxUQ9pS4E1eHVQjsTTq/cBES45AIlrmrVW+OEfUjBX2qBwDqZa2fbH9zp5fXA==
X-Received: by 2002:a05:6300:6b0d:b0:21f:97f3:d4c2 with SMTP id adf61e73a8af0-21f97f3d6f9mr1549747637.16.1749692271459;
        Wed, 11 Jun 2025 18:37:51 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2fd611e4dbsm261228a12.12.2025.06.11.18.37.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 18:37:50 -0700 (PDT)
Date: Thu, 12 Jun 2025 07:07:46 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	linux-pm@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] cpufreq: Convert `/// SAFETY` lines to `# Safety`
 sections
Message-ID: <20250612013746.psicbrobklub6xvy@vireshk-i7>
References: <4823a58093c6dfa20df62b5c18da613621b9716e.1749554599.git.viresh.kumar@linaro.org>
 <CANiq72mP7tGzZM_f2gRSVcBw5a5Y7vMM3eOSvuAOK=yJeEmFBg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72mP7tGzZM_f2gRSVcBw5a5Y7vMM3eOSvuAOK=yJeEmFBg@mail.gmail.com>

On 11-06-25, 13:46, Miguel Ojeda wrote:
> On Tue, Jun 10, 2025 at 1:23 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> >
> > Replace `/// SAFETY` comments in doc comments with proper `# Safety`
> > sections, as per rustdoc conventions.
> >
> > Also mark the C FFI callbacks as `unsafe` to correctly reflect their
> > safety requirements.
> 
> +1 I guess the Clippy lint triggered when writing the section, right?

Yes.

-- 
viresh
