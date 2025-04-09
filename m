Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E519276035
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 17:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744219656; cv=none; b=e9Fz1IKMPNgM5R5WZJYaXq7+gFMDeLb53ziUfmkrYpJsW+JgIPNFGmK6McJMFP/GpeeiPorrKi99SO3IVpzEiOugi0jC4Y9D/X5Jr/hVh9+1N8ucZ1V/T//VefNPEB68WSNMC3FcF+SVKfPSR8CwtqILksyhXRxvWdLgi46pJoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744219656; c=relaxed/simple;
	bh=Gae69hSQbEfQJTFgFzjXgJ+f+y88cnFmX8AZfshU5F4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nJbqjJWVIejvLGSDvflWj3mzeAYE1onmQkZimMbDh788r1X051M61M9FdPzFVDtekGLSPq4exMkRHdrgzJEAVI5MP4VGVm/J8i8Ttf69FOstchU+iStieId2yswxSs0wpM6cayDAvsbmVh1yWO7bPTLwf2xAH6x8g3oe43p/ywM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=PFE3f/Wi; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="PFE3f/Wi"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5edc07c777eso9105729a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 10:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1744219651; x=1744824451; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pK2SJRHEMGZQKPPhXQK2rlcnL3fUmvPRMjfdbeZZl1I=;
        b=PFE3f/Wi0V80YTAN66ECJ7FD81hSWob+6ft4l6Z7+NScbqQ5nlQXV7v8BlLgcyp38B
         ZJm08yWO3N8mxBIbbqrsSt+rcc9K3bu7t6mZ+HQwJah+W3RXcsnSwEfdIHkFH/MCs2gR
         hZyIsod39CRLJCIolG7AlHnX7hrTNt7WAMsq8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744219651; x=1744824451;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pK2SJRHEMGZQKPPhXQK2rlcnL3fUmvPRMjfdbeZZl1I=;
        b=Rub3e9Tgu67sBiclQ8Z0yk8Oi21wBfNQ51//j3eZa7MA+MyIdE1P1fmPmUDumR8oi9
         0zuZadQOeu7gnpJEGhzxswjG62giWgGfCL9DLAUbLcugK5y0DOIANm6EjM8VQ+hBBoiG
         +DidhsyEA+rY8KcCvMU6MfDudfhZHjReh5HWk6SIfvvmNQfqjVfM9/3LKmW2kZifgBKP
         GiLAcMdNL8WJ/yN0Zh81LfPlCTrw/lcJmBXUyCBuVjSEz/disr+GiZGTY71vXMua5YX2
         NnzR5wrpRV4hM85HjvP79IYNrDxf/klkU6a+5pfMEnhuzkgcvCyMqgcX92a/w1HfzRaM
         B3Ng==
X-Forwarded-Encrypted: i=1; AJvYcCXExHdUFjJc8qLIO8n00XMI5HFSwVXnEMHNU+YK0Tm0R9dRAWvgOSmprxceMN4ZyAPf8mNwhoB/X7fY3Ow=@vger.kernel.org
X-Gm-Message-State: AOJu0YzltRKE5CvF1UgAbnULuOhY3c4tyYfrBovxSpVEncVRCW/nHbRS
	BC0NbNHMHeRJSs3XXiP2akjyqqw9gPJ6ew4HoS0Rh8tQeBNkKp/GWf1QRiTTKYH8VJ77gL+/jM4
	WgrM=
X-Gm-Gg: ASbGncu2RYub8HZosjSlbbUUT0J0tYQIzg4mUdMlJF2tURKAK3Zeln7BdyFLLCT3kSh
	NYrO/YVap2sgw5tW+XE/Z/N2VQC3ef9t/8wjgkxzIOolUVFhXhFZ6LyotwqHRB+6w0d7OKjlKfr
	cIL0QhJeGQ5aCfoX+QJqBO8O0gPluyOCJNnVcN0TMAGRVWUhmUs7CebC27CgeaEi1H2POm9Wl4U
	dhyX6zA/+jU/L47SPCYFkVt6wFXJ+Sl+je0KQzmQQf0FSXS8A+dJ4G2sopKwut4YfAFaqYUZmg3
	zH35CFti6vaF4PUStwdAgngY35wY5qrgzFTmOgOC9jjt7xhls6cigMivFo5g57pblB6Q3R1HzeQ
	ziSs68gGhQoqLYZ4=
X-Google-Smtp-Source: AGHT+IHTI9q1Vw4Sgd0nJEzgYDs4TvMdQQGMY7LvtEThpd3R5DYk8A1s9LKoemRrVhfxz0XCnYTdkQ==
X-Received: by 2002:a05:6402:42d5:b0:5e7:5b30:3c4f with SMTP id 4fb4d7f45d1cf-5f2f76c8b17mr3169587a12.14.1744219651514;
        Wed, 09 Apr 2025 10:27:31 -0700 (PDT)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com. [209.85.208.42])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f2fbc2d6b0sm1113736a12.45.2025.04.09.10.27.30
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 10:27:30 -0700 (PDT)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5e5b6f3025dso10017775a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 10:27:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWpmO7wwwfd7GLYauKdVctTgro/oUcIYU/L8fnABidlxZTXbOPnQrxzI3PUKDJeGcCbj8t0vZcdhPm8jSs=@vger.kernel.org
X-Received: by 2002:a17:907:3e8c:b0:ac7:c59e:fc3e with SMTP id
 a640c23a62f3a-aca9b67684bmr382920066b.25.1744219649909; Wed, 09 Apr 2025
 10:27:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250408091755.10074-1-arefev@swemel.ru> <e6ccef21-3ca5-4b5a-b18a-3ba45859569c@amd.com>
 <bmdour3gw4tuwqgvvw764p4ot3nnltqm4e7n3edlbtpfazvp5c@cqe5dwgc66uy>
 <f8810b13-01d1-4615-b6e2-2e791c48b466@amd.com> <qc72y52kt7vuwox4lhk42zligy5bslttselfoexse42mywtpps@ebqijs2tap2t>
 <edc08eb4-63dd-402c-82df-af6898d499a9@amd.com> <pmby7iowvxuomsbuxebttosz245j7ngw5enbl72dq675nrgvve@ugkvzeihbtut>
 <CAHk-=whLixL8-iYt1qH0-YvEnVsYtryZaN5Da0qoBBhKsBnumw@mail.gmail.com> <437e12e2-ac0d-4a97-bd55-39ee03979526@amd.com>
In-Reply-To: <437e12e2-ac0d-4a97-bd55-39ee03979526@amd.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 9 Apr 2025 10:27:13 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjLQzkTTDwJ+ZdVdgNKMg958petkdsu-+m7s9UL6PVCRg@mail.gmail.com>
X-Gm-Features: ATxdqUGsb92LP0ScG527vuGNoNqzICJmAsHs4dqdA5fj_-LSDqiGYUn4VgwYYwc
Message-ID: <CAHk-=wjLQzkTTDwJ+ZdVdgNKMg958petkdsu-+m7s9UL6PVCRg@mail.gmail.com>
Subject: Re: [lvc-project] [PATCH] drm/amdgpu: check a user-provided number of
 BOs in list
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Fedor Pchelkin <pchelkin@ispras.ru>, Denis Arefev <arefev@swemel.ru>, 
	Alex Deucher <alexander.deucher@amd.com>, Simona Vetter <simona@ffwll.ch>, 
	lvc-project@linuxtesting.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
	David Airlie <airlied@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 9 Apr 2025 at 00:29, Christian K=C3=B6nig <christian.koenig@amd.com=
> wrote:
>
> I mean open coding the limit checks everywhere certainly works, but as fa=
r as I can see it would be more defensive if we do that inside kvmalloc_arr=
ay().

No.

If we add some limit to kvmalloc_array(), I guarantee that people will
just then call it with ~0UL.

Making it all entirely pointless.

So thus the "kvmalloc_array() warns about unreasonable uses
unconditionally, at a limit that is high enough to be useful, and low
enough that the automated code randomization tools will hopefully
trigger it and find bad code that doesn't validate kernel input".

> BTW we have been running into the kvmalloc() check on valid use cases as =
well.

*IF* you do proper validation, you can just use the raw vmalloc()
interfaces by hand and avoid it all.

The VM layer allows larger allocations. But the "this is a simple
allocation, choose kmalloc or vmalloc automatically based on size"
helper says "you are being simple, I'm going to check your arguments
are actually sane".

So the drm code can easily have a function that validates the input
for your specific cases, and then you (a) don't need the helper
function that does the overflow protection and (b) don't want it.

But it should actually validate arguments for real sanity at that
point. Not just open-code kvmalloc() without the sanity check.

             Linus
