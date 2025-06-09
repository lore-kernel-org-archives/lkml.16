Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 781CF28F3
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 11:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749467844; cv=none; b=LeRQyUxrb1EXOC+t2BOap/vw02AdSbjPkShsjhjKd6R7RhroanpEh3XWSm0OLpcns8LjBa/Z4F7ypYWTRKV4kSv5Cn+o1Hpw4WkaqA22MZO896BcrkZ2uEeiCDb4WGCT4VTDZMaU+HdwJzvh9MCA/hVYhZBn0YRX6qlTuAPHSOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749467844; c=relaxed/simple;
	bh=1rf4k3D4qfLQox3AK7UIIbUKUE/1gntkD5UCAGbx2u0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H+LAJJ4iLDwySyNAmbd2L38/8iBOGA8AD3yO65Nb2dSM4IOuhVDAZ6JH+TI1AcatIOV2aLQaj48k0M6AMKQE2VtKbpwwmyfwdV0Zf8x5QA1rMIvsc2IqQ3en/FwYSn0qMO08Cl2Hf40nAWuZq/mI+ccVO7nypbgDlCickKk+aPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fMQeG99z; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fMQeG99z"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-747c2cc3419so2813364b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 04:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749467842; x=1750072642; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3jmcmYhpSc0FqNNEiRx4dLKTU/hJsjGZ9t0Q+PDFigY=;
        b=fMQeG99z3RP37VErZF4qBvYuv9ljrKs2oiihvq5I1j84xL+Tysuymn6ATaf0v4QIq8
         +5JD/ztWl/3cw5P+hupm7OsL17/YV/wsBmvxpv+ogZqDTAW06RFt7qcc+ghs0yCR6trj
         cDuY+ZDIkWqHhcPiJeoZ1Q18D+/+xzXdQQ3wbw34REQtXuPoMiSHQy4x9ggDK+aWnyVq
         W5tytAMTXKKVdVvJyHOTYnHN2uug4fW4Ux6Dj9IAMCwYs/8sDI59KMSIlQNileuHgYw1
         eX3f15cXxybID/eFKvhzMSO1p2bfZ7grLQs/BNA0LsfJDdjKaELDbjvk+2Kgu+PTTTIS
         TN6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749467842; x=1750072642;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3jmcmYhpSc0FqNNEiRx4dLKTU/hJsjGZ9t0Q+PDFigY=;
        b=XYLxBMANVu+9TnNz/zCylTmftFlkxfyGC7QC0vHHyirxCmljZ0bc5PfTfVFoBIi4sn
         LYBZQ+tjK4Jx9bizQVZ0D06jVdRWelYXlOIRZoU0MUTB51O4EUVKA4SPuO+HsmyiXnd5
         zvr3jrjw7zkm9YdxNIP+ftlBPs2HVrQv2BX/vUz3vVzVXRlqpuLMAe9wZGvX2Ztmrq2/
         uv0Vph3JXOSwVF9pC1asvjSej9qHDFXIR49OSEqXMJbXNBn19NxeFpwlNurRP9sOWmaC
         fyZAbEDOTcb2cJt0NVC8H7l8zviAm9AVu32hlDQ0HGQLcubL03XLSBy3Q4Afyp1c0RJB
         2sYw==
X-Forwarded-Encrypted: i=1; AJvYcCWEcfMuyAXMaXKjheejjBU5nANpH1T1v+vO8xFp3y3JTiQ6ZwiuXJVnhytc6zBiqOqQxFu6X5BBAd1YD7E=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFbxW8KD96nkZX9+pCPpgXQvIUfPrbV7gu+LQfkDUwgxiBw5up
	8TsuqjwF0gUuBB74APw3PiMq4fKby8QG5VQGcc56IX9T0mTjBVCBcfLm3IYj7IJgT/Q=
X-Gm-Gg: ASbGncvA+ZvCA36eQSjOi87OubJ41597UHlp3EeaFCjuYHdDx5/yJuZlXAenu6CYxS4
	LbEdJz8yQKf805u4r/D0mSPY8zmbBjGYxwFUQv7/Vb0JkqaZLA6SfA+UHZTH9VCpPsK68kbB0lr
	5xO64/u6wtCQq9aUMLwO2FtQJFI5G/cAMoKkZnz0Jz9PiSgDGC9YbZVu/UWFibJG5GJ0LmwDht1
	CKa3Lu9+qFuEbdpN6q3cS7ikEpzf4eADgDqRrspaijqnKZZgFSzd1oy8/LDg7tU+WfTpvQd7aCN
	bY4UNQ3zvObXS5fiQwcuHK25I1l80a15g/yAy+n+6KU1/cOQ1WBQ
X-Google-Smtp-Source: AGHT+IEWqD5LrlH9rkiU0S5rSFvCTOABuN2T34dBr5ro8m9I229gWJ2E8+H+/Lj8DYJDHkqAZ13+KA==
X-Received: by 2002:a05:6a20:12c5:b0:1f5:9016:3594 with SMTP id adf61e73a8af0-21ee255c80cmr20215648637.18.1749467841762;
        Mon, 09 Jun 2025 04:17:21 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482b08571dsm5502621b3a.84.2025.06.09.04.17.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 04:17:21 -0700 (PDT)
Date: Mon, 9 Jun 2025 16:47:19 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Yury Norov <yury.norov@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] rust: cpumask: Validate CPU number in set() and clear()
Message-ID: <20250609111719.gne4mhchivobyv3y@vireshk-i7>
References: <8b5fc7889a7aacbd9f1f7412c99f02c736bde190.1749183428.git.viresh.kumar@linaro.org>
 <aEJwm16HSwCyt7aB@Mac.home>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aEJwm16HSwCyt7aB@Mac.home>

On 05-06-25, 21:37, Boqun Feng wrote:
> While this can fix the current problem, but it's not a good solution for
> the long run. Because outside a test, we should never use an arbitrary
> i32 as a cpu number (we usually get it from smp_processor_id(), or
> something else). So the `< nr_cpu_ids` testing is not necessary in
> normal use cases.

Thanks for the feedback Boqun.

I have sent a new version and hopefully took care of all the review
comments:

https://lore.kernel.org/all/cover.1749463570.git.viresh.kumar@linaro.org/

-- 
viresh
