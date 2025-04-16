Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 530E01BC9E2
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 10:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744800020; cv=none; b=S8IECOePiW+4Gs6YnQnm9ZVfK8c8DiCrL4MjgO5jzZNimi0Tuu4FwBz1zJhl70gBAaxV0PssLCMTbMbJL7s+k3pO+nhoMEYzYbc9r9KZcKo2fq2fuo3CLOAk47oTi6wj58FUThvGA0cOhttKrbD2bweFjqich1BTTNmNdUI0+uQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744800020; c=relaxed/simple;
	bh=AW7LAXhV4M8nrRRBsTVlNww4j59JMk/7529JME2B/rc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YZe7rAENE6mgz94giu6Y6WDLDxmrZKQlbDioXn+APcNSyZlgBdSoYh5oGLf4XWO96XhFA16ei28mIuKmJ9oBIVbA+cMl80CMdUarBeqjwNowjR5lXARHd+UaPu0Wh+tc/8o+tmB/y3SlhGlAFHGHuWT1vvYkZg/l215KF+BKvpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JD+HC2/K; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JD+HC2/K"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-736e52948ebso7448693b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 03:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744800018; x=1745404818; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ttWNacvPGMYQA86vkqzo9EZOaHGhJM4Jor7D4v7bz+0=;
        b=JD+HC2/KLl5Kw1IwDPOQX1FlAefqYt5X4wCei0hd2eRydlFAvDFGe5D872rawwIKpb
         tp5hIEPbOxZdeMzAsYCu9B7HUXtxXErxMBAqaCtE6NpMOP+epDQIx6bTe8VSaQThnFvX
         YNgbTWwtKQ258NojH3FFi+DYLcIWIeEXFTReA9k89RMiOV7csOOHBkWMXGtY0slfGQ7f
         lLTOKdoPwDdrSTTXLhqagSTfbp0wr70b+A9Dk0vj+SlqbFNJX9rGdHKAKeEXg549PWp1
         Y2Vb4Ta8yi3b66F6coUD0kfIMJXDTOpBbnqaoRL50Lv1YM+3yMCPYV8oCmCh7KZQsRYZ
         hnyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744800018; x=1745404818;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ttWNacvPGMYQA86vkqzo9EZOaHGhJM4Jor7D4v7bz+0=;
        b=CgJZk4qX0gedoj60xTEhlyBZ9fjxxLlrm+/RdyCsFCK8zhPFBX1eUAi/i+1BHjLOGZ
         eWugaEt4e3EWEYDjEbihusX2Tf4100pIKTJGd6Fp1IUXJtfjAY5zXHM41/4psKNyw/WV
         DaKsP8YiAxDp6dn5vuxmw/Xr0mYW+abfgxoRqXIKEwb5LoSmCzE/OYvVN1SJJmaQ1n89
         C2w8ZIOwmeOJ31YK8Ezjr4c0L4bwNxEsW9zzVaogdoaDCOpGXNxR7Kk00jHbpxVhwEI+
         uU7ngHgIRjNd0PUi/lyovBizcMRSFz7UW+XM2WyswKiQfYCTzRdQzn0fJMfdQh+kLVve
         rnFw==
X-Forwarded-Encrypted: i=1; AJvYcCV+8WNit0iAvk/28HJ4Cr86R0t/9QHHlR2bLJBh9G4NSWquU3fp30jXjTXE8qwqmc+4/nLo5Vl2mWnVJTA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQZ38HDQLV2JQa3rApLlS78Rq6kCdQre1mel5d50I7n1anEgJW
	NVG99Wdq206CRgqH/JPYDgq5Tqs4dUUCwnm5xxjI7ZW4a8i4NTPHS82uiXCVFkE=
X-Gm-Gg: ASbGnctAUJ3OBDcp42B+XGHeZbMV1cajvRLoRUUTa1EKULwgAyPPRV3qA6DKpadM5SJ
	bht2T7/B725AdQGR5RA+qnxBJ0P69PXE1ep7aSbaS8BEnOlaDdS6uBsvFdYbAdzeXAJeV/DN1Rm
	5x1m1laUEu7a+9YsnHbk7hSZtuhiZv0z7AXRhefBpIJz12u5u6frCRu/PaKke6tt04iuwe6YzWi
	8V4szPL/ZHG0QmU71BXD4zYnwkv/MMYYNTwkXt1U4VNk0LRVtCa/el3zbGVK4IsHauQj4wC49ZM
	jRhmjClLkfQ5odmS0cLF6Ptcgxs63WsAyjKQsReF4g==
X-Google-Smtp-Source: AGHT+IGwBbJAub8B5aJaGw+Dq2HNzt5OaEsdk5WiMT3ZEcrD7+h/HrHX+IN/nBZbxfI2sbK6SePbFw==
X-Received: by 2002:a05:6a20:9c8a:b0:1f5:8eb1:d5d2 with SMTP id adf61e73a8af0-203b3e90173mr1985396637.13.1744800018636;
        Wed, 16 Apr 2025 03:40:18 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b0b2221e78csm808883a12.73.2025.04.16.03.40.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 03:40:18 -0700 (PDT)
Date: Wed, 16 Apr 2025 16:10:16 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Danilo Krummrich <dakr@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@redhat.com>,
	Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
	Stephen Boyd <sboyd@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	rust-for-linux@vger.kernel.org,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Joakim Bech <joakim.bech@linaro.org>, Rob Herring <robh@kernel.org>,
	Yury Norov <yury.norov@gmail.com>, Burak Emir <bqe@google.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Russell King <linux@armlinux.org.uk>, linux-clk@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V10 14/15] rust: opp: Extend OPP abstractions with
 cpufreq support
Message-ID: <20250416104016.mkzyitdm4moz4qts@vireshk-i7>
References: <cover.1744783509.git.viresh.kumar@linaro.org>
 <a940d1b1a02d99fdc80ba8d0526c35a776854cb3.1744783509.git.viresh.kumar@linaro.org>
 <Z_9v24SghlIhT62r@pollux>
 <20250416095943.f3jxy55bamekscst@vireshk-i7>
 <CANiq72=MQmUop5UzeeN-r7gAE0ep8Z+EUaLuA6exeazhZCHqLw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72=MQmUop5UzeeN-r7gAE0ep8Z+EUaLuA6exeazhZCHqLw@mail.gmail.com>

On 16-04-25, 12:31, Miguel Ojeda wrote:
> On Wed, Apr 16, 2025 at 11:59 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> >
> > +// Frequency table implementation.
> 
> ///
> 
> > +        // Returns a reference to the underlying [`cpufreq::Table`].
> 
> Ditto.

Hmm, I did not use /// as the comments were added to private
definitions.

Sorry for the dumb question, but why should we use /// in such cases ?
They will never show up in documentation anyway, right ?

-- 
viresh
