Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1279320B811
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 09:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743066721; cv=none; b=TYkE/MKR+mdG2M1/mbmXHd5xrsDuFyFRRPO0vNdmqe3AUG1+SjjZYvV0Z6D6AVnY5lMeZt5a4Aabo4VPXVCMopbGE+RmQ5VM/7nYi8/y4E33LCDeTwqpizzdo42+3RQeiynuMBaivmn/PlfGUvYVTDKn/67hBlF5bUUGCOGqqkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743066721; c=relaxed/simple;
	bh=97fP1qZfJrEtmKbwyo4ydQSZwvCzpq2F7825aCxbZtY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DpFE1z1x1rMz2UyP7LPEEWJ8G+e57dIHv8xbgRqngNx7VYeavqSvIXhnvd4JkKJi4RvZzLRMEmH+7H6ynDiXt2zoma9cJTP5J7crzRAz9pRXSX+Z1YNPLL/WcAtj6ldKRjwu7iP3Umbb6xpOsAMGQA751LWganAuoSeaRaF4iqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uhjzrCbR; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uhjzrCbR"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-477282401b3so8322081cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 02:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743066719; x=1743671519; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+b6l40FNhgRVfbAF6laWpTMxO9IIW1hJJ+UtCtzYu04=;
        b=uhjzrCbRxZqOIeLIBho2egn2JFwr+PqHB+g11UCkEwFYcLmKt3ncmIWCy19M0uVlF4
         kBo7rdNdTIZSksLq6s3HbRvJBrNm3vk6mFxLfvVixQ5Y9bgBWJV5tRE2WMOdglXROZ/F
         yd5if0Pip9M7erzCrrbV4JbGngmOIUbSgYhEkVVoW5m0eNjRRqPSYqj11MrYbgYk1JJr
         J0iMi8AU2ntxmBENusY4/idQo4wvSJ/kW6WtOD6TKT6L87sqEFYrEZflYMpgXTjKdpPy
         m95QXn1C+mvl2raSNOoDo19ZdzXymALw684CgjCCT8TeqB7n9psLmdd7+1FAPXRUKm/y
         U5yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743066719; x=1743671519;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+b6l40FNhgRVfbAF6laWpTMxO9IIW1hJJ+UtCtzYu04=;
        b=U+l+r+0itBW0QGSM2HfW74fDRBIPtoi41TMKBQg/YIAOAqrmby1CYAG9074VTFnSe7
         Jh6E3XoPAllrP+fjS9hxxECIMDvv/jEYDyD8Tb/aISUU6BfGUlYtk/55OwzUO7YMcINl
         hquyFhs7J8BIsz4Sat4rvj3kaBNYAmTSzQ3wZ6jiAxdIYWend00JhUz/qRDlfPF6bcAl
         g5YHB83pzVCwVqGdTvXTuijLQ+P4/r2o8IVh+at/09N3fx8JzbtErRMn5lM8WgqeSg/0
         T+dXR05U1yzan+2bIYsYkOI1IZHeq8IiOY2dRMVQHWAi/srUClnMUbxis6ncCgKOurjZ
         e5Gg==
X-Forwarded-Encrypted: i=1; AJvYcCXqxcJELaktcURRu8BFsz7SSf7G1gl17+AyQzKBGAJO/8Y2oxFvc5cQLFXX+IMI8ZZQXvVAdx/5DGdFP+g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/N0UXgf9nBJxku4e2Mv1lh6XYpJJWaLjTfI45VLtV9eE5HAg/
	uMBbVIoDVYtvqCaijjsMSlO9tLJHQi0HyHsYQGSNqgkJBP146TK+ui0GibjSFkSD/V8QYFn1yM4
	cymsNvNnLEBZKDn7zuzZH/OvL5IzEUuS38X4B
X-Gm-Gg: ASbGncv5WFnFvdZusMlTdrO76DWKBkU+rhsDJDnMZw03kYhhjA4EhgRou0fgAmhaq9b
	OkV4WUZ17a0qJQRThWERUw2nwZyPT1VrbtgkoFEVzOQ/eFlW/hV/oKRXsXATmQKgshvz27qMgv8
	bXi+McWBu9g3GDCa9oS76wZMUHsdc=
X-Google-Smtp-Source: AGHT+IGq3aLRbE61liibJ18xlXemuiMGmGhTJiZQWBje+7JPnjbbgDMma2RLDDWKs8QX50o9E11tAljMqxUcNwkTpE8=
X-Received: by 2002:ac8:6906:0:b0:476:8a27:6b01 with SMTP id
 d75a77b69052e-4776e20ba52mr37064611cf.47.1743066718528; Thu, 27 Mar 2025
 02:11:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202503241406.5c9cb80a-lkp@intel.com> <87pli4z02w.ffs@tglx>
 <6sn76aya225pqikijue5uv5h3lyqk262hc6ru3vemn7xofdftd@sw7gith52xh7>
 <CANn89iKjCgmxtiLeVAiXODHbbR7=gYYi5cfAS1hS5qn+z=-o1Q@mail.gmail.com>
 <877c4azyez.ffs@tglx> <CANn89iKAkio9wm73RNi9+KngNaS+Au2oaf0Tz9xOd+QEhFSkyw@mail.gmail.com>
In-Reply-To: <CANn89iKAkio9wm73RNi9+KngNaS+Au2oaf0Tz9xOd+QEhFSkyw@mail.gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Thu, 27 Mar 2025 10:11:47 +0100
X-Gm-Features: AQ5f1JrvFSfU0cznx95FVC7fEJsPk5YA71f3DBhzv0nVjY72RKACuxNOLZvssF4
Message-ID: <CANn89i+nAN+p-qRypKxB4ESohXkKVPmHuV_m86j3DPv6_+C=oQ@mail.gmail.com>
Subject: Re: [tip:timers/core] [posix] 1535cb8028: stress-ng.epoll.ops_per_sec
 36.2% regression
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Mateusz Guzik <mjguzik@gmail.com>, kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev, 
	lkp@intel.com, linux-kernel@vger.kernel.org, x86@kernel.org, 
	Benjamin Segall <bsegall@google.com>, Frederic Weisbecker <frederic@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 27, 2025 at 9:26=E2=80=AFAM Eric Dumazet <edumazet@google.com> =
wrote:

> We could place all these atomic fields in separate cache lines,
> to keep read-only fields shared as much as possible.
>

Following one-liner seems good enough to separate the 4 atomics used
to control/limit

UCOUNT_RLIMIT_NPROC, UCOUNT_RLIMIT_MSGQUEUE, UCOUNT_RLIMIT_SIGPENDING,
UCOUNT_RLIMIT_MEMLOCK,


diff --git a/include/linux/user_namespace.h b/include/linux/user_namespace.=
h
index 7183e5aca282..6cc3fbec3632 100644
--- a/include/linux/user_namespace.h
+++ b/include/linux/user_namespace.h
@@ -120,7 +120,7 @@ struct ucounts {
        kuid_t uid;
        atomic_t count;
        atomic_long_t ucount[UCOUNT_COUNTS];
-       atomic_long_t rlimit[UCOUNT_RLIMIT_COUNTS];
+       atomic_long_t ____cacheline_aligned_in_smp rlimit[UCOUNT_RLIMIT_COU=
NTS];
 };

 extern struct user_namespace init_user_ns;
