Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B78C22116EE
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 19:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747684730; cv=none; b=GIGuxA+xvUc6yMGsRRL+7qAdpG47T8MRUEaKqnWfA1HpPSNfIQPFOleXbV5LWZqC88hDcUTonECwIKBg2ZinGQt0q4pjgck/vc6INRBxmypnMEU7DQpKgUS9QAVLzuiUgF9at5UWQFdFA4tFmLZxqGFEgIeievFVmW47kIyCf3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747684730; c=relaxed/simple;
	bh=1ItMlTSBt/ShO1E43j0VuSmsnzkNYsBrJyS/xfbv5Ro=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JT7amYK5EAOY5hoSM7bHJOONDfGv7+EtU+Mcg3E0u9uVLIVbYYmCyccXj8NuksYFXfk/GDoIIY4JSZCotACz09qtFxDXdmaNpJk5LgB8ofEcPHGqyAmLxxHyWU1+OOHQ3XKRK5gKMwDeVijinJ9OI6+X52fkMOB/NadcRkKleyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JCiTwCZy; arc=none smtp.client-ip=209.85.166.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JCiTwCZy"
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-3d96836c1c2so575945ab.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 12:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747684728; x=1748289528; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u+wsf+LBeaNM/2tu3T6ki2N6cQiKsksKjUDwoakXyHI=;
        b=JCiTwCZykWGLgUMO/MoKN4W2k1Rp9vCcY+E322IvUubspclP1GWyi0qEaBLDBMqqi0
         4/UMIezgygW5m3kUdHkCsZj3kp705sYHoIrOhdZFR6qulPGsbiUHoHNV9Rmqo+aRtmdK
         WjvohUpLfTCRdapEdSZXPzGYe8iTCBx+4yvGfoO2NW3whkPJ3GoUTDJc45XkMxGGfDi2
         i+gsOiRy+C6Si8ZHah1Q7hdcsPnerL4xJahuFeubViNlFf7HNLNyYIGsZyf6RxTs4M5O
         KBPHHSJbtBZXK9I/oGlx5B6aFKqYfOyMcm2voBMZpnO19keYHo6rXuj7vcge3d0TzyKm
         oD7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747684728; x=1748289528;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u+wsf+LBeaNM/2tu3T6ki2N6cQiKsksKjUDwoakXyHI=;
        b=gETGUNRnggXApW6QVelkEIhWES5rxDY602a3ezaoJ6+3mNDYYnQjx84KOU6DDGE53B
         T2u5JjJ0A8WQeTD29wAxq0ZIvMmDSSF0qjVX3FXpPEso1nW9XwfnHjGyxVnxg1CVKeZR
         7vRS99wRUtaB+aXDMqgtCX/JQ5Swei7H1AimcGzPolGcIMHaRzSpy/Bq5IwE2+Ycps3E
         rRRpCs8RfnlYuxe6bCkDaD5Cs/i9JHG+RWG+e0DXSucyBgwWXMHVSg3fQJw8VAVkEoju
         jRSwdSzAeKCEfG1IHel2vfzfof0VSXydNdVdkdHOD1RLHkYYDNGSzfFlPSaIkCL/vni/
         qvDg==
X-Forwarded-Encrypted: i=1; AJvYcCXjVBMch01ZyWXQ1OXleGgA0luaNAQCgqhGaajggZHfgCftFz/2piIebBBh3ngHqfNjfBVdpk22XiDJSaU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyO604XVEqB3oH3RiJDExEmNqXw3AfHvknQ7ak1HZpvrbByrQdj
	OmARGFimze+Y2YT2nbsYORia3G7VW/Xi4BPKoopEb+QV9lWswhtDCK+cJQ0dsw2yjaC21UtPA8k
	ntZ8PvW+NaWZtQf14xXisNhgp9XcDRVeCziWvCI4r
X-Gm-Gg: ASbGnct5SZdtL9TJehGurd2CFGshTXQebTbLtb688/aOv1BMdrJXJJ40iWSQX+IkAap
	a36ZvRVN4bVLsImyqgrilw72SbS+dySQBa9AxonCZJ9TU6ZWHVpjeBVMNDzZzTwfllHMc3+ZbQF
	EXeRyumR4qSKVPwhuFMrxfnD6IUddtkFqvbzzP+R5RmpfsItMxtjHbLFnjpHtgXQ90gxZa0hL1
X-Google-Smtp-Source: AGHT+IF3NG4riWCj70W1ip8g722W/OSv9N5vCb4lgszsMb+3aFb9ORFS8jrS9y+V6o+naREGvwl20DU7tMCXOWpayuQ=
X-Received: by 2002:a05:6e02:2184:b0:3db:8537:e450 with SMTP id
 e9e14a558f8ab-3dc5d6164acmr7320835ab.20.1747684727399; Mon, 19 May 2025
 12:58:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250518190957.58932-1-howardchu95@gmail.com> <CAP-5=fUs9ZVa3z54w1GyKrR=D0YF5GmSZEQ4dh=cKehTPD_w1g@mail.gmail.com>
 <CAH0uvog3kt=QR1T6uXMBmecDWsh-8UWKXukJ-rRk3in7fud4Eg@mail.gmail.com>
 <CAP-5=fU_UUKmu0gTmODXCG5JUK6MRFOTFU+LCJTfA5yTP+aomA@mail.gmail.com> <CAH0uvogRdA15hhyq=9SmJiHWwoARBEBdAh3PA9pOXVbBBo5ODg@mail.gmail.com>
In-Reply-To: <CAH0uvogRdA15hhyq=9SmJiHWwoARBEBdAh3PA9pOXVbBBo5ODg@mail.gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 19 May 2025 12:58:34 -0700
X-Gm-Features: AX0GCFuEBhgUMS6lypmTs7xxRmttSCOq9w7q1VtwxoyFkY97QYVR1ycJy_Ib5vY
Message-ID: <CAP-5=fWX7m-3j31pNAXqkNmtr0i3rxAHPC96h=sQ5q31WyNDLg@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] perf test trace: Reduce test failures and make
 error messages verbose
To: Howard Chu <howardchu95@gmail.com>
Cc: acme@kernel.org, mingo@redhat.com, namhyung@kernel.org, 
	mark.rutland@arm.com, alexander.shishkin@linux.intel.com, jolsa@kernel.org, 
	adrian.hunter@intel.com, peterz@infradead.org, kan.liang@linux.intel.com, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 19, 2025 at 12:28=E2=80=AFPM Howard Chu <howardchu95@gmail.com>=
 wrote:
>
> Hello Ian,
>
> On Mon, May 19, 2025 at 10:00=E2=80=AFAM Ian Rogers <irogers@google.com> =
wrote:
> >
>
> <SNIP>
>
> > ```
> > --- start ---
> > test child forked, pid 279547
> > Checking if vmlinux BTF exists
> > Testing perf trace's string augmentation
> > Testing perf trace's buffer augmentation
> > Testing perf trace's struct augmentation
> > BTF struct augmentation test failed, output:
> > sleep/279619 clock_nanosleep(0, 0, {1,1,}, 0x7ffcd47b6450) =3D 0
>
> Thank you so much for testing it :)
>
> My bad, I have just realized this is because of the data in the
> timespec, nothing to do with libbpf... The tv_nsec has a value of 1. I
> think the 'sleep' on your machine has a different implementation. On
> my machine, the second member has a value of 0, see below:
> ~~~
> $ sudo /tmp/perf/perf trace -e clock_nanosleep -- sleep 1
>      0.000 (1000.196 ms): sleep/54261 clock_nanosleep(rqtp: { .tv_sec:
> 1, .tv_nsec: 0 }, rmtp: 0x7ffe13529550) =3D 0
>
> $ strace -e clock_nanosleep -- sleep 1
> clock_nanosleep(CLOCK_REALTIME, 0, {tv_sec=3D1, tv_nsec=3D0}, 0x7fff85936=
5a0) =3D 0
> +++ exited with 0 +++
> ~~~
>
> Can you please run any of the commands above and see what
> happens(please change the perf executable path)? If you get 'rqtp: {
> .tv_sec: 1, .tv_nsec: 1 }' then I will just make the regex less
> strict, because it differs between different 'sleep' implementations
> instead of having anything to do with perf itself.

Ack. Here is the output:
```
$ sudo /tmp/perf/perf trace -e clock_nanosleep -- sleep 1
    0.000 (1000.208 ms): sleep/1710732 clock_nanosleep(rqtp: {
.tv_sec: 1, .tv_nsec: 1 }, rmtp: 0x7ffc091f4090) =3D 0
$ strace -e clock_nanosleep -- sleep 1
clock_nanosleep(CLOCK_REALTIME, 0, {tv_sec=3D1, tv_nsec=3D1}, 0x7ffe51f3cd0=
0) =3D 0
+++ exited with 0 +++
```

Thanks,
Ian

>
> Thanks,
> Howard
