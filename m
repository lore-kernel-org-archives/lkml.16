Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B453207E1D
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 23:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749340729; cv=none; b=JWWblDMI/AQ8UeOp9AwUIUATbKwX/oMkHzJcp64uQZ2aqRhluV4i+5ock27kJUd/oYrDE87/LXR9p6lhaDnaFjTNaY1P0D1KALM3MSdLNzuIPA7BQEv+iaCUHJInTSsI96vqNVcYDrJWePPRkmB0WfFd+A0/iPAGjOQ91g1aolg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749340729; c=relaxed/simple;
	bh=zktDSaYXBb4SQwR6FYYnNsk19oya6DAnWYfYGvtkKQE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bucQKl6FfQC4dH7nUwt/TEL0mOk2HnNjl9OII/I+lZy9wLxXXAYsJKQx55CEvezharsEUANJOe2nAjoXztTsyegn3EhXUSHttc5aJhIf0I1Lv+OeMNZfPo5LW4nUDxN4+xZPoeFcwQA3+U1TrDabfdPUvFXN3BQ3GnUws0+AgDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=TSA3XRTn; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="TSA3XRTn"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4a58ba6c945so52766811cf.2
        for <linux-kernel@vger.kernel.org>; Sat, 07 Jun 2025 16:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1749340727; x=1749945527; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SZb0yQu3bW7FIgr5rV6Gh9DpSUWQW7LKM4W2HiNGYQg=;
        b=TSA3XRTnZVV3OYW2vQ45ouvU72g+7zjPWtGYuFpdeBwPKIWEeIUWp0eTJmRs6nEcMb
         9KuhRbzTlwQLOVGZ2oAu7J+a+gv7gCVMu2FfkPHVBPk0FxUGbxz2MsWSWy5/g4NUnw38
         71lHLFJ2sIWmgrU0IXg/3k6VuX0zf4rfMBhQ1fKUisbaM3SBJQO0/A6amWSwoMz/oX9D
         Q58diwYajwayY+97sOlZky9WEo2BSuSKL2ZKLBHDo2D42uvgqDo0OYcOMFEJ2edQhMNJ
         5EFZkl65UnpPg3Z7WuxKXChzCuWIndXHONkWehebmTLdxYQys0/Tji3aTL3OzeUmgBH3
         FdXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749340727; x=1749945527;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SZb0yQu3bW7FIgr5rV6Gh9DpSUWQW7LKM4W2HiNGYQg=;
        b=t79YR2wOpXSNxWaJ3VQcfdycdi9rW/q15hI712VKRXoVdfFIBnSmnjHZWdmVypYu5m
         l7odu4qPhUGXRqP/tg57/PUcYpV83hWXqDLdUJVfRGQCxybM1taVv26d9yha3jODn3cr
         jdlYECSFk9C+xqfR8RZqp1oMmlKTfWW+02iBfnAvQu6JS0KtdiwvxP9gEIAAwsKo6H1A
         y8UEZyHs+Q+9/GTvQiLCvlzz09srPY1z3KO+4saL9FANjkZiJX0VMIM/oQvT/vQ881s2
         cUjcXtBccDX31r8jWQefKK+gOJBmuNAWbP/kxAEDGK4nyVsBswKA80XkgPq9HWqWj7y8
         GibA==
X-Forwarded-Encrypted: i=1; AJvYcCVW+DClg/Zj8zvfPgsCM5vJ92K2YTC4dQ/c+zn2plYMIkZHsQpDIfphElkFMsiluMU/wmoA74PTMff7/kE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIpwH6xM0HFlUn4i3Dy+hDv0X/MKYRg3q8llTnSoebBmQ38M4c
	yxfKZ01gjCTnDHn0YBfsnc5ZYUhYJfK/1acj5PRcYKpWk3cbHJ7qCkUydGHmRm44tIRjFXqdMwV
	jn0Qk35OnTuMgnm3ytHzr7JVHGquXedZofmE7G9zREw==
X-Gm-Gg: ASbGnct2cw6rfsAVbizSBClXwrXJHpRaVqo1xvzZFk4SK1Q9dHApMu7s64NOAOcIGyW
	mDP5gUaBPHPNZoOMJSvhJL9yZQGAjDLt4kTXi5Afp0fHSAeswcJdPrkhnJTUXeCMOsbOr/bAGuK
	TXhrZvnMfZVb7LV7TeTj2o7ku4v+kXhBpdL3cdbWPd
X-Google-Smtp-Source: AGHT+IEB97RE71KtJwLfGv6pP8Smnjv6c4dtCN8qnbdxkUOKkq++jlKJyn0l2dku3FDr9koONk+VDXarqF/XGOS6QJM=
X-Received: by 2002:a05:622a:1a0e:b0:4a4:3c3e:5754 with SMTP id
 d75a77b69052e-4a5b9d8de25mr154274911cf.32.1749340727206; Sat, 07 Jun 2025
 16:58:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250515182322.117840-1-pasha.tatashin@soleen.com>
 <20250515182322.117840-7-pasha.tatashin@soleen.com> <CALzav=dzvVgmwxhh9ic6mTjQL32srzAOH-wXgkksXTa2rd=TNw@mail.gmail.com>
In-Reply-To: <CALzav=dzvVgmwxhh9ic6mTjQL32srzAOH-wXgkksXTa2rd=TNw@mail.gmail.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Sat, 7 Jun 2025 19:58:10 -0400
X-Gm-Features: AX0GCFul3L2zzvlJ2GXtOx9lQ9B5uuJgCwhDk6D1c4MrC7_egkKEFjQyvbKOx48
Message-ID: <CA+CK2bA7kN1sYN2P4eZ7=7fzB--nRwM53Gy=9dEVzRiyt-q+9w@mail.gmail.com>
Subject: Re: [RFC v2 06/16] luo: luo_subsystems: add subsystem registration
To: David Matlack <dmatlack@google.com>
Cc: pratyush@kernel.org, jasonmiu@google.com, graf@amazon.com, 
	changyuanl@google.com, rppt@kernel.org, rientjes@google.com, corbet@lwn.net, 
	rdunlap@infradead.org, ilpo.jarvinen@linux.intel.com, kanie@linux.alibaba.com, 
	ojeda@kernel.org, aliceryhl@google.com, masahiroy@kernel.org, 
	akpm@linux-foundation.org, tj@kernel.org, yoann.congal@smile.fr, 
	mmaurer@google.com, roman.gushchin@linux.dev, chenridong@huawei.com, 
	axboe@kernel.dk, mark.rutland@arm.com, jannh@google.com, 
	vincent.guittot@linaro.org, hannes@cmpxchg.org, dan.j.williams@intel.com, 
	david@redhat.com, joel.granados@kernel.org, rostedt@goodmis.org, 
	anna.schumaker@oracle.com, song@kernel.org, zhangguopeng@kylinos.cn, 
	linux@weissschuh.net, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org, gregkh@linuxfoundation.org, tglx@linutronix.de, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, 
	hpa@zytor.com, rafael@kernel.org, dakr@kernel.org, 
	bartosz.golaszewski@linaro.org, cw00.choi@samsung.com, 
	myungjoo.ham@samsung.com, yesanishhere@gmail.com, Jonathan.Cameron@huawei.com, 
	quic_zijuhu@quicinc.com, aleksander.lobakin@intel.com, ira.weiny@intel.com, 
	andriy.shevchenko@linux.intel.com, leon@kernel.org, lukas@wunner.de, 
	bhelgaas@google.com, wagi@kernel.org, djeffery@redhat.com, 
	stuart.w.hayes@gmail.com, ptyadav@amazon.de
Content-Type: text/plain; charset="UTF-8"

> Suggest using guard()() and scoped_guard() throughout this series
> instead of manual lock/unlock and up/down. That will simplify the code
> and reduce the chance of silly bugs where a code path misses an
> unlock/down.

This is an interesting suggestion. I have not really considered using
guard()/scoped_guard(). I personally prefer regular lock/unlock/goto
error, IMO the code is more readable this way, but I may revisit this
in the future. Also, at least in mm guards are not used, i.e.  `git
grep scoped_guard mm` returns no results.
