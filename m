Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 484BC72637
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 20:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746564693; cv=none; b=B5BNGSuP/uCpHRTgGL1YWrcmc2JvkyXgcnWN/SOjoCMZszFnyUxdu7+JM2vADTyu3UkXTh8j415TNWYWPwfk1Pk5HrpFOAi7aDOC6PtVtlSBhZaGu99XgqvrvowsVyjeGjtRlycKw61+ZCebaagykXIUpSD+y/xgwyKbTztG9AU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746564693; c=relaxed/simple;
	bh=7mMS2yJelq5QA8tcBDYUwoki+2oUhqtcxsnYj5KYXpE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i3kWs5vRJccxwN5SfYKXNEF1srCtvu8PWuMm4UApRzoBIM6LYoyLeOrQbvDt/+u28yvtt0onP9c/d4mNUYJW2MqXw2dj3dAqVO6Zx7bRuX0QkcKet0mM1+tOfeeOLGbny1TBbRlTlO14Qi7ey76ofUR08kB4drKQpCIiRgFkI3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=P402uOUe; arc=none smtp.client-ip=209.85.166.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="P402uOUe"
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-3d44cb27ef4so7575ab.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 13:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746564690; x=1747169490; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fUPv9bCntwuSWSGgezKVl0DfrzoizhTecNOmZ/JksA4=;
        b=P402uOUedbZSIpRS6SPhs6TyR8b4wsaScervhBTrR9N4lOdN+A5GPcFdN/fjs8mYyv
         WnbVYdj8F3UMjEy6nVgfkwJGKpCiyllRSJazhvq9/Czsh0Ve01AM3AUUMi+hrb1t1lSE
         hDiMZk3EW/CVBRr7FHfwSZVb+T0RPKJPaK0c+G7vxdiPNPMCuj8eaVwLcxkuvftTeZje
         +Al6UfpogmhRic/Goqz4bZsSHYMs6rWHZSR9UghVX6NPR9t8IhSU1IuDLmVoTmwk1q+v
         XW/lmniuWxhZKEITrPLyCUJx7K7DYClR86HMRKpVtIywB5jr4oWMY0KdbCU2yLoqGlOz
         30XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746564690; x=1747169490;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fUPv9bCntwuSWSGgezKVl0DfrzoizhTecNOmZ/JksA4=;
        b=mJQEB6mpCF/3MqRlmVkkAUerbUcAz2ojh3IXVNJwz/BWp+QtxBpyYiOxC+D5/vspJN
         4KWJzxdCxNlV1GgkTxT403XdhwliILXOu5eOQDJFZrXvznUJwzim63mQbsZ2YODBF2ZG
         JlVNRbuErAimqBSCX/43HP3p2d96JeBj3Zla42L2DozvcOI7TIt/VcVlgErM40ZJcHkj
         6DCenOKlF0Pklumtv9hO8WOn58zk3r9AqnKcsWXG9jc7gWD+DATP9BY+0ngHyPiqXWPn
         I4qgykQZqu4Se4n3HjHhQLxZ0+NvWJQhrYLBshyShaTGICIrDOEMCznqgGVtaQ7U1+kT
         +UNg==
X-Forwarded-Encrypted: i=1; AJvYcCVusOZ4ktmC5JJ907ABHkbz7sQf/4Q5E1sdTqbhOjEGLFXGkzv5zFVjwbZWyOLkYhA1C8SP1WVtZKdGnb4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlRTUlP1T/zsZ/guswlOiyuE+n9CSMHVStt3u9FrZQuEiBndMx
	ygP+egIzhuFTTWicUrQf3HWsmxZdxIEPjFAoTqVvOVmZKOhPJY+JHY5pV6iR18SBnjuYmMkMot6
	poy6A40zqhMxxkHqRB2UBIEdK77zW3rh4mWl9
X-Gm-Gg: ASbGncuassiTxppuxCx/6KySh5SDUC2MfQl7pXhsISyLz11YEvfxbgVA6pQvDNV3HPM
	vqrwQUYQMp5UqJZC5VDeSJSXFVcDNr8//iyqVSgqqWXdINnhyKXzSWhQIhuSsbcSIti9c5K7nxT
	tS5XBCYMt0vUwMmF3pH3ROd57bC45zbV2mRzSskKklsBZwRSNXM4U=
X-Google-Smtp-Source: AGHT+IGOCkEUQUGsoFLVPGo6sLVzHWCDwX9AdpvPly0JQhN/zJbqbAKQDhLtjEeDicAomjADjWwTttq3FWsvzxjxmH0=
X-Received: by 2002:a05:6e02:17c6:b0:3d3:d954:d3f with SMTP id
 e9e14a558f8ab-3da7390f965mr627845ab.26.1746564690006; Tue, 06 May 2025
 13:51:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250501022809.449767-1-howardchu95@gmail.com>
 <aBjfrUqFe444h_CF@x1> <CAP-5=fXMwyGm5KUecSS4pUhgBB_py=R_c0LqEYfnjyRrf4bcMQ@mail.gmail.com>
 <CA+JHD93FaugH5ny6+bBkciwoWzLN5RKCbtBq77V2bi8Rs15-UQ@mail.gmail.com>
In-Reply-To: <CA+JHD93FaugH5ny6+bBkciwoWzLN5RKCbtBq77V2bi8Rs15-UQ@mail.gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 6 May 2025 13:51:18 -0700
X-Gm-Features: ATxdqUFcRR5ams1QhaXJE29xzzghsFa5RYuxRCjI1U40XWPkZVAdID5LjEIol90
Message-ID: <CAP-5=fX8+nyvisxybD6gWBhJd=GpuMiBkSA+CqnLuUc7Mx2KHw@mail.gmail.com>
Subject: Re: [PATCH v16 00/10] perf record --off-cpu: Dump off-cpu samples directly
To: Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Howard Chu <howardchu95@gmail.com>, 
	Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Peter Zijlstra <peterz@infradead.org>, 
	Kan Liang <kan.liang@linux.intel.com>, 
	linux-perf-users <linux-perf-users@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, gautam@linux.ibm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 6, 2025 at 1:03=E2=80=AFPM Arnaldo Carvalho de Melo
<arnaldo.melo@gmail.com> wrote:
>
>
>
> On Tue, May 6, 2025, 4:48=E2=80=AFPM Ian Rogers <irogers@google.com> wrot=
e:
>>
>> On Mon, May 5, 2025 at 8:56=E2=80=AFAM Arnaldo Carvalho de Melo <acme@ke=
rnel.org> wrote:
>> >
>> > On Wed, Apr 30, 2025 at 07:27:58PM -0700, Howard Chu wrote:
>> > > Changes in v16:
>> > >  - Add Tested-by from Gautam and Acked-by from Namhyung.
>> > >  - Rebase on the perf-tools-next branch.
>> > >  - Edit the commit message of patch 10.
>> > >  - Fix a bug caused by the type change of struct perf_cpu.
>> > >  - Rename test_offcpu_over_thresh() to test_offcpu_above_thresh().
>> >
>> > Please take a look at the tmp.perf-tools-next branch at:
>> >
>> > https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.g=
it
>> >
>> > I added some Committer testing with some extra steps to describe how t=
o
>> > reproduce the results and there is one point that I have to retest,
>> > where there is a FIXME in the Committer testing notes, perhaps I made =
a
>> > mistake or that fix should be moved to after or before some patch,
>> > unsure.
>>
>>
>> Hi Arnaldo,
>>
>> so I tried out the tree, perf tests pass as usual, etc. I tried to dig
>> into your FIXME issue. Initially I thought I had a reproduction but
>> now I think it was a user error.
>
>
>
> It was a misunderstanding, I already pushed everything to perf-tools-next=
 an removed that FIXME, that was here:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git/=
commit/?h=3Dperf-tools-next&id=3D7f8f56475d58511729429b2e52787606c4062ad0
>
> Next thing I plan to look is that DRM PMU (IIRC) from you.

Great thanks! Looking back over the last few months we also have
(somewhat priority sorted - probably best to fix crashes ahead of the
new DRM work :-) ):
* The second patch of Wshorten changes to help Leo:
https://lore.kernel.org/lkml/20250430175036.184610-1-irogers@google.com/
* segv in PMU fix (acked-by Namhyung):
https://lore.kernel.org/lkml/20250402211301.4153441-1-irogers@google.com/
* memory leak in perf trace (reviewed-by Howard):
https://lore.kernel.org/lkml/20250401202715.3493567-1-irogers@google.com/
* event parsing NMI watchdog/debug improvements (reviewed-by Kan) :
https://lore.kernel.org/lkml/18c2fb33-2b3a-4ebe-ab26-8cebe0b6b94c@linux.int=
el.com/
* Rust demangling (no tags):
https://lore.kernel.org/lkml/20250430004128.474388-1-irogers@google.com/
* Speed ups in PMU/metric code but particularly for testing (tested-by
Namhyung): https://lore.kernel.org/lkml/Z_dp7E2wtSek-KHo@z2/
* Stat testing improvements (no tags):
https://lore.kernel.org/lkml/20250412004704.2297939-1-irogers@google.com/
* Cpu term (tested-by Kan):
https://lore.kernel.org/lkml/c21d05c6-d71c-47e3-b4a2-e275d9d487f2@linux.int=
el.com/
* Uniquification fixes/clean-up (no tags by CT/me):
https://lore.kernel.org/lkml/20250327225651.642965-1-ctshao@google.com/
* Branch stack test hardening (no tags):
https://lore.kernel.org/lkml/20250318161639.34446-1-irogers@google.com/

Perhaps more controversial:
* Uid filtering with BPF:
https://lore.kernel.org/lkml/20250425214008.176100-1-irogers@google.com/
* dlopen/dlsym for capstone and libllvm:
https://lore.kernel.org/lkml/20250417230740.86048-1-irogers@google.com/
* BuildID mmaps as default:
https://lore.kernel.org/lkml/20250428213409.1417584-1-irogers@google.com/
* Sysfs/json event priority consistency:
https://lore.kernel.org/lkml/20250416045117.876775-1-irogers@google.com/
* Build with Wunreachable-code:
https://lore.kernel.org/lkml/20250410202647.1899125-1-irogers@google.com/

Thanks,
Ian

> Thanks for doing the extra tests and reporting your results,
>
> - Arnaldo
>
> Sent from smartphone, doing some routine med checks
>
>
>> So I wrote a little script where
>> we're setting the off CPU threshold to 10 seconds and then looking for
>> off CPU events that took less than than:
>> ```
>> for i in $(seq 1 100)
>> do
>>   echo -n "Iteration $i of 100 "
>>   sudo /tmp/perf/perf record --off-cpu --off-cpu-thresh 10000 -a sleep
>> 11 2> /dev/null
>>   if sudo /tmp/perf/perf script -D |grep -P '.* [0-9]{1,10} offcpu.*'
>>   then
>>     echo "BAD"
>>   else
>>     echo "GOOD"
>>   fi
>> done
>> ```
>> To remove the BPF map generated events I added:
>> ```
>> diff --git a/tools/perf/builtin-record.c b/tools/perf/builtin-record.c
>> index 8898357325cf..6c23b2cf8b66 100644
>> --- a/tools/perf/builtin-record.c
>> +++ b/tools/perf/builtin-record.c
>> @@ -2841,7 +2841,7 @@ static int __cmd_record(struct record *rec, int
>> argc, const char **argv)
>>        } else
>>                status =3D err;
>>
>> -       if (rec->off_cpu)
>> +       if (rec->off_cpu && false)
>>                rec->bytes_written +=3D off_cpu_write(rec->session);
>>
>>        record__read_lost_samples(rec);
>> ```
>> Anyway, running the script for nearly 20 minutes, I couldn't get a
>> sample below the threshold. Hand testing things also look correct.
>>
>> Thanks,
>> Ian
