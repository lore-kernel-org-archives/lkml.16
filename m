Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C04B130A7D
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 01:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738891742; cv=none; b=WXHNNmuyu6u0Ra3F099FvUWNrWQdT6uCfbNGSf7cSmEjBuG9RmLGuzYf8k6fI8T8ms0rjpOcQQ4/d/OWjLpwb1k09Jkr9VWIPItk3/YAjOshUdNyoYXDccRryK94NES4NAM/vB567jJOFjWjRqwn+kQHXJY4p5M8xEbZsv5CqDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738891742; c=relaxed/simple;
	bh=eFJX4s4D89MGtn2vvvBPckM/BVnh3lF4ZgDrmAI+YLM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UdtlH7SX1/UW+m2h6zsoPx5j0JLf/eqqobyuqLcYPdJRu6+cD4zf/VyXd/JaimeINZrbjKTaaJxks91yNwA/JyOcN/uF1yWKGY1dJvaazqETOSi3hV+A1JsW9E8hBpz82V4mDG28PT19MbP4Uq43Xni7UeQSteiVlOZ5sUjfDsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=R9P58BEs; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="R9P58BEs"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-46788c32a69so20946491cf.2
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 17:28:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1738891739; x=1739496539; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E/B6rKXoRP9BkkuR2mn1tTK5oITIELKG2LYs8WqA/Z0=;
        b=R9P58BEsug7wDF8FGn4PfOpstoVAam00NOL8xLdtlsznu8kWYR6WrxY6mF3E19m9zf
         7I0g8M3RfglvciDp04mvJ37mf5X9+5NDy8WUN1S7u8Gf4GyxTPEf+q2V17HBjPoxSjMi
         aVvhwqYPtG8JiORyN1qKtJcb5p9HLXA7wn1Rnmqtx+YduifZ86AAKCSprKji8ql0YUF+
         Y8ybbTqfoyRzJXkwlc1wTG+UZX9ykj1khK6CAFR5I+rawKi+thVFKk5TPgZOJRpZmhmy
         e9lsR+dY8j0hCXADTumAYxHo8UQBkNgGzMBN59pU85wwAoIRuKgzgEOyeFHXXVsknEfI
         o5wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738891739; x=1739496539;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E/B6rKXoRP9BkkuR2mn1tTK5oITIELKG2LYs8WqA/Z0=;
        b=LJ1LMfn2E227+q65zVD+F50bVAqvcuSbMAq2vt28LRfyTCJ1D708yJ92m53s9zwrqW
         VTs2y68dG1lGFDcq7GAAr+TDtwaSuNhVOivzHucjink5MSF1EsyX6e3m7AplG0qUiQo5
         NfmpgtM11vWIT7A0l3QKgFcQgoRByhhJ+LbKX2Gtw+S1Yhwqhh9kgAjmvhk0fSd/uy/t
         VBipHY9vQ6ME73n2pm/+gA9Exf9OsrUxPu6+cZSQ+RBH4ZydGg0YpZeIGkWBTwpcfuCP
         B0srx/GPzyYzUb9zwO+szUOXMk/vICG5pL2lW+GqhfElMxByq8iaFAv4tVQ410EPvDoF
         XvYg==
X-Forwarded-Encrypted: i=1; AJvYcCUcO/PMXGngxisXjwqibMVdt1rMBGy9IMXEVk1iA+F3C7pnC7Q+i4mdnXNLfmT/AL6BbiIRLpR6Ft2Isxg=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywgx3oxg7vxMOLZ+3PIstQZRrgJIpfsT+sCorq+BkeY8CtjtXnN
	4DL7NAt/1ifP1d9wH9/twxj2vR4RYNaPtexTpVG0ZiMnL62ZXsh/9gALMLkpu6sbZdjcDxInhFY
	JjgNos/Ef13aKAYlqYVIklJGqFbB4JMQQQpz7JA==
X-Gm-Gg: ASbGncu7gm4OqeJ/km+IvoQ8nh4wzq95tyCdwaXh9Uu4+IEdbfSxYCBtB+ELY/TP5Wq
	/aamu3wcqNtKHlRqsfuRivuoodmoTD38YnGBCLhiOPU+Yydrdz/OAzxVlY0V/xgW+QnAjlA==
X-Google-Smtp-Source: AGHT+IG/qU+DQGRbIVpasPJX4dEgRbGI1bwsgyRQgH7sLyexv6ztYzz7dd87jk6gdrjtGjTpHMmepc+RecJuVSIbOWM=
X-Received: by 2002:a05:622a:30f:b0:46e:24b1:dcd1 with SMTP id
 d75a77b69052e-47167ae2a56mr22008491cf.32.1738891738868; Thu, 06 Feb 2025
 17:28:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250206132754.2596694-1-rppt@kernel.org> <20250206162939.a1f86fb835f1eeb7ed73ff1c@linux-foundation.org>
In-Reply-To: <20250206162939.a1f86fb835f1eeb7ed73ff1c@linux-foundation.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Thu, 6 Feb 2025 20:28:21 -0500
X-Gm-Features: AWEUYZl6iTKJpq_CKya0Z3uq2I-kaX8PhW2bxqIFxSemVzQfHVc82dvbk7pP-8Y
Message-ID: <CA+CK2bD6204AKWGOgzLMiMsnVZ=tk+DGc+VWgi3RVt2byaLJJA@mail.gmail.com>
Subject: Re: [PATCH v4 00/14] kexec: introduce Kexec HandOver (KHO)
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Mike Rapoport <rppt@kernel.org>, linux-kernel@vger.kernel.org, 
	Alexander Graf <graf@amazon.com>, Andy Lutomirski <luto@kernel.org>, 
	Anthony Yznaga <anthony.yznaga@oracle.com>, Arnd Bergmann <arnd@arndb.de>, 
	Ashish Kalra <ashish.kalra@amd.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
	Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, David Woodhouse <dwmw2@infradead.org>, 
	Eric Biederman <ebiederm@xmission.com>, Ingo Molnar <mingo@redhat.com>, 
	James Gowans <jgowans@amazon.com>, Jonathan Corbet <corbet@lwn.net>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Peter Zijlstra <peterz@infradead.org>, Pratyush Yadav <ptyadav@amazon.de>, 
	Rob Herring <robh+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, 
	Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Usama Arif <usama.arif@bytedance.com>, Will Deacon <will@kernel.org>, devicetree@vger.kernel.org, 
	kexec@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org, 
	changyuanl@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 6, 2025 at 7:29=E2=80=AFPM Andrew Morton <akpm@linux-foundation=
.org> wrote:
>
> On Thu,  6 Feb 2025 15:27:40 +0200 Mike Rapoport <rppt@kernel.org> wrote:
>
> > This a next version of Alex's "kexec: Allow preservation of ftrace buff=
ers"
> > series (https://lore.kernel.org/all/20240117144704.602-1-graf@amazon.co=
m),
> > just to make things simpler instead of ftrace we decided to preserve
> > "reserve_mem" regions.
> >
> > The patches are also available in git:
> > https://git.kernel.org/rppt/h/kho/v4
> >
> >
> > Kexec today considers itself purely a boot loader: When we enter the ne=
w
> > kernel, any state the previous kernel left behind is irrelevant and the
> > new kernel reinitializes the system.
>
> I tossed this into mm.git for some testing and exposure.
>
> What merge path are you anticipating?
>
> Review activity seems pretty thin thus far?

KHO is going to be discussed at the upcoming lsfmm, we are also
planning to send v5 of this patch series (discussed with Mike
Rapoport) in a couple of weeks. It will include enhancements needed
for the hypervisor live update scenario:

1. Allow nodes to be added to the KHO tree at any time
2. Remove "activate" (I will also send a live update framework that
provides the activate functionality).
3. Allow serialization during shutdown.
4. Decouple KHO from kexec_file_load(), as kexec_file_load() should
not be used during live update blackout time.
5. Enable multithreaded serialization by using hash-table as an
intermediate step before conversion to FDT.

Pasha
