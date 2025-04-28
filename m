Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F034526A0F8;
	Mon, 28 Apr 2025 13:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745846505; cv=none; b=GrPnw4WCHcWcBjF/wM0clT9sE8pEYyCAR+QF4ncf6JMO03FWmbUDkk3NIdUXT2LCrfzHQFcKwCoozvkWhFffc1KPVyMto4K4A7+DziBeA11UEIOz1ejVcczA31KaZyrqJe8Cb2xaDXIh1eAMA6JYbxP/Dtzpdc6MmnjFWYKv3GY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745846505; c=relaxed/simple;
	bh=Iwk/V72KJjPlUhVkDR+gh/HtiPiCbHuuonOziHgeuWI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ChWe12pt+tXskSIjcbzow4r7tRM/eOC1/noGfE8jyHpHmnA70iB2btOhSqkRmbDXf3m/N6vhMSsn0NSORcqNAo0gAvuawzcFkK6G3CAI2VLbXxUgDj2vOmZm1jI0t2OBpW5V/VX/ruYpl/v1J6d+veQMPSYE8SN9uoe0qgvOQnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V3p4zbn7; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V3p4zbn7"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-736c062b1f5so3940816b3a.0;
        Mon, 28 Apr 2025 06:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745846503; x=1746451303; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Uo+OVR5gNb3M4bxwFw5fjMkuNkzRB/QXTwOVVFcFS1k=;
        b=V3p4zbn7ntmbif3dwG0ZdpJR/0hWlxW6NmI53C6kRYAhFUjsAUM6rVKSgLfbzoAtzS
         uOqf5nw+1smmnJtZYxXd5V0V61T/jBJun4NP1v5zxDA4orrSamfZGMRHXDG9fV+7uJkV
         2cH+yn6mLVIfM4zHmVYucWC+eFJubYOsh5rgrfL7a8h3FkoIkpoHTuI7xnQphImgFlHU
         FyAmx35L9wOen8LNWOa4J+KjsXp9lT9XQI68+AWd2Mp6x9MZi0E66wyEBMtdwt07gSXt
         z+B9zRglKGHvObjPrbQ66L3XG6UKhxXDF+imVOVPDrkjsQ25PfdlC0NuPkjel1m6c9E5
         +Wag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745846503; x=1746451303;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uo+OVR5gNb3M4bxwFw5fjMkuNkzRB/QXTwOVVFcFS1k=;
        b=QlwNoFlwmkvWSBUDVbEchb54mlTQ7PVhIS0F9ITUzCDmeoGoWqeJbrxjW1ys+sr6oF
         zfbw4szuJOXUSDhOAZ9YnUB4kMeyCHP3S8eQntBB6BOILzXgeNT3FBI5cOtRjduK94/l
         9y9F/OIKAY0sB2Cymq9VugLyXUal/25Y/hrC5/VbGSrbsZSUsFC6qPFkE++1j4TibXWp
         7q0QQP3X7kJWQOhqBXGdxAEhfDEz1Z9MeoRF/coRMYCkIW4oMAixB48ozEvcmFbOQEYN
         RU4qjZ9YydTJWXp0KkTnXIexBe5mbxCWPsjmqYp34tlvlLC0OfKvloYyZvMsVTTJtwwC
         mX9w==
X-Forwarded-Encrypted: i=1; AJvYcCVf6fwINthys9BlTGN5d7DzUSZEOy/upqpd3JrfI6C/uOCB96EJno5ZmFMl3IJZCKNZIxyZCo5fIkM4QRw8d6o=@vger.kernel.org, AJvYcCX61rxpOED8GXksE0VfbNSHw+RqCzVfsL1/Rc0WV2V07K09lpYql9o8qdMTTdPy03Z4ATUOYvngCa6uz4k=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYnJCgHy3GNr6yEi0mGJencBKUKw85e9TWCNQle0TG6LbpTFkW
	XcWHxDXyjVlpNHL5h47iyyXFLbeqpDkygoLnE2LpMY+AZL3zrEBB
X-Gm-Gg: ASbGncu1JvGhAtQKKuGoervldvdMXT7ymGathuwVHF3f70tx8gDQFo6aCl0B2GwOIN8
	SpqeqR0WRfz8BjJP1vAmnVD00As6RcRhtUVnBGb1dxnL9CBXv+U7oc+OkX0YqpQTqzDVzBIW3Fz
	DVdT9qac7cThKSSxe75uKiyKDDAiWIg5NX/Zqg4XhPrz3EXIkoAtNAxBsxuqiw/A8WymQhxH3vf
	XVtk7Uqt82r77OvpzlsVjfRUeD9nybCq+qDWNZj+20wyRKv7TCKV3akJhAuFZXVS3FTlbuZA67O
	DONJXPP2+pXkvWCPYXCY3YZKJ5dz0k2SmbC/oi77
X-Google-Smtp-Source: AGHT+IFAnL1TYjzsmT0s1ApIsmTStAceBR5fCU2o/evdSc2z6KesSKaISIoJmuvDfVUbIR6LuK4Gaw==
X-Received: by 2002:a05:6a00:4fca:b0:72f:590f:2859 with SMTP id d2e1a72fcca58-73fd73c847fmr15118376b3a.13.1745846503023;
        Mon, 28 Apr 2025 06:21:43 -0700 (PDT)
Received: from localhost ([216.228.127.130])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25a6ab48sm8206675b3a.91.2025.04.28.06.21.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 06:21:42 -0700 (PDT)
Date: Mon, 28 Apr 2025 09:21:40 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Burak Emir <bqe@google.com>, Boqun Feng <boqun.feng@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, Rong Xu <xur@google.com>
Subject: Re: [PATCH v7 4/5] rust: add find_bit_benchmark_rust module.
Message-ID: <aA-A5ERYLP7r5zK7@yury>
References: <20250423134344.3888205-2-bqe@google.com>
 <20250423134344.3888205-6-bqe@google.com>
 <aAkbw0jEp_IGzvgB@yury>
 <CACQBu=XaOohewMnLj9PvgR5rYBxzYSXf2OAjCzUY=GFTJ9L=+Q@mail.gmail.com>
 <680a6b54.d40a0220.27afd9.5e84@mx.google.com>
 <680abbce.050a0220.144721.78ac@mx.google.com>
 <CACQBu=VEATxHmFvt0TKbb+Hx5jeEGO8SL733=0m8LNnX6S+ZKw@mail.gmail.com>
 <aAuR_0om4FI5Pb_F@Mac.home>
 <CACQBu=VkFT5yDuDz098L+S+tGvtGHMvm4FaZ6p3sr9VCp88jww@mail.gmail.com>
 <aA9MDH8RjOH9hQ2E@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aA9MDH8RjOH9hQ2E@google.com>

> By the way, if you add assert_eq!(bitmap.len(), BITMAP_LEN) before the
> loop you may get the bounds checks optimized out.

That sounds cheating, isn't?

I think nobody will reject this series because of +15% in performance
test, neither +25%, or whatever reasonable number.

Let's just measure fair numbers and deliver clear maintainable code. 
There's a single user for bitmaps in rust so far, and it's you. So
you're to call if performance is bad for you, not me. I just want
to make sure that your numbers are withing the sane boundaries.

Thanks,
Yury
