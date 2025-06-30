Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0EC428CF58
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 14:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751294687; cv=none; b=fzOm8tUNziXLvPxVWp9DxN/FyHnvfgKodbl1Masw0XaZlhOf4ukfW/3p+kb2aGJ3p/1u7H4qBvdVBkE/vqmvJw99+YCW5sIy0iNpYwm0WxjkQrgSOXibN4eLLKrY1BuExrTQ9wssRVzAkRgaa6Q4HwbBat7DgXsVSOojtA9+THI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751294687; c=relaxed/simple;
	bh=ap/Vm0hYAdUXiirW96C0YiEeTbMgX/cr/ya8hhJoDwc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eQhRLvi/6KI5URXKQv4fEdIGF+jxuECLgmLjpMKoOWbMhI4h/bk+X8tynL5+bcFilg5p8P3RaZcxEhfx1dQ0D4AweA1ZYEU9KiWtIfdMwBHNVWW2pGYDMjutHeLUHbogiVtKtJkj8OYb5tbYIA5ya1INwbyPPuSUiGoCsZoFdPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=TE605Ovg; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="TE605Ovg"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-70109af5f70so2457276d6.0
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 07:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1751294685; x=1751899485; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UQ2IOsiMdP1IuJhsvJEX3s5TfXtkiU/6UeXHloIPvLw=;
        b=TE605OvgjiX6814tNxQ1aZBX29+GZ/aT+DBXM63NhSJoXieyywFsEKMLVEdGFPLijv
         x2oWp/t179lVtTdqfqWKrmng0tmIrW179A7To63cWIjnwCvPY7j8ylrpIKLMl7KVoes6
         QIbdn6noCMkT/8DCLFVXilb/ecw20x5eGAvekLfciEbG5CCH+0NuIQqT3hfVdQXZAR6l
         EzNkRBevGXzCjfrU7b1w6hUPsWUAQayn2VqY1fhML7RGidM/ZM1pKKwIwCL3LCM2Weei
         XDuA3mejweOAUgRjHVA+MOG0ciJK+esy+TPlsEFyLYQbt/HDUUq6XR5Be+j049pADMlM
         lHAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751294685; x=1751899485;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UQ2IOsiMdP1IuJhsvJEX3s5TfXtkiU/6UeXHloIPvLw=;
        b=CWUf/tkVoBjQA61aAdeRP6gchvCkPoPaHgaq4b/Z/jGI3qRb8etEnNSB8VG7ks+E5l
         EAldlefYiJtExmpWIj41RzR3xKRKHo6UO30FEeEPC0JR4+C+CrtK6+Bd24tDBO7yIbpe
         q9SUWEPYdmn6gN9sJjU/melhvi8sMSnAfHjTtBsN13V6mTKKiY2uu6q8Z2aqkXEVF0dj
         ngZoZ5WBBVLvaT5nDGDq7xjam63zi1ByKGzcJGHC7VgvGR1vHWJYZYibyQOUWfxEQC/J
         /epfSxDoDWg73EPpaqR7eRL5k0CM8xcgHxfOIXJ/LyI6MlTqpT3iWKpt7wXYcJJzVGdy
         CRaQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFWUZQJTt/Ml8/h26KxZg/N6QCf3KmiDFQwSiuchZdXX/hR7naOIMFpsL4r6ZeeAPPihp0MRriP8Ffpow=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1xiBf9HSZeZb8W64oLXnaaSdh8+OD6fpxDqHd2prRsMZkfE2a
	8+DuauEU2uAg3innRPF6EPX8x7uHll5LayTEaOtYtkIEuDKYwts/8ZUL/WoRs/3o+A==
X-Gm-Gg: ASbGncuMdB4IXFVMptvtPwFPcSwdjst63qoxQLq8F5GcidS1NJy+2uecInPlvu+Nc8U
	XfnhvYropA078CfsLOpxP0D0BnLT9ym46cIibU5CVspTtR88fwRRmXolkKMO2/Jn2Z5uCLFElzy
	mAKeBpYHMJn9vdlOIs7evAKdh8ySbW3Bw0S4OBGf3UEAmlXZB4aKUdQIDHNu3Tv/ZNsI7maeDn2
	+6epYhrmbBa0AogdM4lNWY0Y7H+J4WHUm3KYPQYX2WE+IbQwl5tcI+7Y3ZyD9v4OtOHNVcfrgED
	7xHUi9sBJNf6foOBqzVdhAVM66dAC1DQm/9uySUi/QwuNgvhxToNCKBwiE3lyHonCS7w/dQC4e4
	9FXUi
X-Google-Smtp-Source: AGHT+IHF16aEg/qn8BZbxpWd2q+vfCazqVYFFAdUoh25jEnDHU8nkqKpn5FdbuttMK7eAlC+ciyVMA==
X-Received: by 2002:a05:6214:caf:b0:6fd:7508:9c04 with SMTP id 6a1803df08f44-70002ee7e20mr190732136d6.20.1751294684428;
        Mon, 30 Jun 2025 07:44:44 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd7718d327sm68783646d6.22.2025.06.30.07.44.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 07:44:43 -0700 (PDT)
Date: Mon, 30 Jun 2025 10:44:41 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org, lkmm@lists.linux.dev,
	linux-arch@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Lyude Paul <lyude@redhat.com>, Ingo Molnar <mingo@kernel.org>,
	Mitchell Levy <levymitchell0@gmail.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v5 04/10] rust: sync: atomic: Add generic atomics
Message-ID: <7eea6ee3-4a9e-4eb5-b412-2ece02b33c6c@rowland.harvard.edu>
References: <20250618164934.19817-1-boqun.feng@gmail.com>
 <8ISRnKRw28Na4so9GDfdv0gd40nmTGOwD7hFx507xGgJ64p9s8qECsOkboryQH02IQJ4ObvqAwcLUZCKt1QwZQ==@protonmail.internalid>
 <20250618164934.19817-5-boqun.feng@gmail.com>
 <8734bm1yxk.fsf@kernel.org>
 <jJqJwkURyr0NjkFdJaF6oYbPGY4LEzZs_sfY9jlmqoK1B9iE8VjqbfINHilEHxKfmpc9co7DmsS142ZWsBQ8tw==@protonmail.internalid>
 <aF6yRIixTPx5YZbA@Mac.home>
 <87jz4tzhcs.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87jz4tzhcs.fsf@kernel.org>

On Mon, Jun 30, 2025 at 11:52:35AM +0200, Andreas Hindborg wrote:
> "Boqun Feng" <boqun.feng@gmail.com> writes:
> > Well, a non-atomic read vs an atomic read is not a data race (for both
> > Rust memory model and LKMM), so your proposal is overly restricted.
> 
> OK, my mistake then. I thought mixing marked and plain accesses would be
> considered a race. I got hat from
> `tools/memory-model/Documentation/explanation.txt`:
> 
>     A "data race"
>     occurs when there are two memory accesses such that:
> 
>     1.	they access the same location,
> 
>     2.	at least one of them is a store,
> 
>     3.	at least one of them is plain,
> 
>     4.	they occur on different CPUs (or in different threads on the
>       same CPU), and
> 
>     5.	they execute concurrently.
> 
> I did not study all that documentation, so I might be missing a point or
> two.

You missed point 2 above: at least one of the accesses has to be a 
store.  When you're looking at a non-atomic read vs. an atomic read, 
both of them are loads and so it isn't a data race.

Alan
