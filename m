Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4907E25B696
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 23:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739229066; cv=none; b=SlyqoI0/6kVwJFYdkYKv0SEQC0Pdj4n9TFMajFO59xKElehxgPB1dTki8LHSAf4Ax1f9MDY8/4C/qXvrHOeV/sF//CRHBgKWZxMWhgkrHahlvCuaGKYSHMBG823PX96Yf9t2xALuCzc3DMuDP/nLDA1q7O7aWH7cHz1Ga9L9Bzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739229066; c=relaxed/simple;
	bh=I85yiPeGxjB3pHp4BZM6Tvv0YClNTRfIZsY3+9214ek=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bfb+xUlC1qNWYpieyZAt5uS8p8szsDcUAdJ/k0n3RbvgyiI6oEZgbgMAFn+qwoLFXbnox2Fbje3D4Ugj1UeapLjLMKQPHpk8AV/ddSpKegJzNRcD1ZWFsigmJHZmSxia1ERtwlGmA44UT0RzDtYI/c5w1Ya0boYnZ4e40He+ZsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iP2gNYK6; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iP2gNYK6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739229063;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x6ZHTPoBjg/uWcJFr6X1NHVKDtKY1RU4PIMNX3aAG8g=;
	b=iP2gNYK6yWtRhqEbehe3UzJpIKKMFSzoQU3UG5btejGqwguD+EHlcM6tr4km9TNm1PPlOe
	jqg/DYqXWvpiY3aY78y2Q4REaPK0DzluzvSRmoOEWDMH6x8S83qqv5fs3rL0EchX0TFEEB
	0AiIWxJfJXBsZeWr2pmLcIqN9Y1Qg6A=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-207-yYmCX20FP1yyG3D4pWN8Lg-1; Mon, 10 Feb 2025 18:10:59 -0500
X-MC-Unique: yYmCX20FP1yyG3D4pWN8Lg-1
X-Mimecast-MFC-AGG-ID: yYmCX20FP1yyG3D4pWN8Lg
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-6f2b386136aso73383497b3.1
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 15:10:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739229059; x=1739833859;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x6ZHTPoBjg/uWcJFr6X1NHVKDtKY1RU4PIMNX3aAG8g=;
        b=p+7gg5LXjb2qVwiWXq1jn7KCGyd5XNmetuFFgb0lwlU/vgOHYg8NkS6PmK2UKcRobp
         WGidrsQWP83bAZUQJopMAnsO7a2cS39miMnKQDKMLjXqxEYnXl1mqK6IKl4U2M5oVJjZ
         b6C207s3t256GRH2rar6tuLcV5J5grNDVZZjYvSQhy2qZfbvJOIE4z9qieclBTUozUBB
         4pgkXisYGuSj6xj65mbyhgGMbP1UK5Q2VWfgXqTYlcKTIhRmO9xGreEnjYdmV3P4uXlb
         0wai0YsKNQlYKjH0sXK3P62c9RApa6rZWa3L25jaQH69aMEWeLnii6/pK0AVmX9CB/EJ
         BoLw==
X-Forwarded-Encrypted: i=1; AJvYcCUdU3l/57HWtiEj7b/A5kZas7SjySpY4RnAU99Gmf5HshpSuZ6D0A4RSsBf9pJKf8+pgs6tr6M33rvQ0Nw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxE95TcCqCdcxgJr2TWXRO/IiT5VZMqxmC/xBd6Bo4gzrkWALTP
	4t+pE7hJAU7oLam8zbO40005JHqYoZMm65MPuSph1NkO7cN4cP3AtXIS1fXox9MK6oFfJwf7gPl
	X6Df6TSaVKEAeA6eXQtkgFSFi/4MqxQweqrT20zu3RTj/TcMkGNOSsR7O0zC2tzKoK0ZRYoUrMl
	vQmL2sjY50Na0CpF2HrKA354LmK4Q8wbNJmOgB
X-Gm-Gg: ASbGncuWnFwUQok0ohkJzXn7Srj7ObkLd3QxsQm9ndLUdmLP35ZMIskb8wPsgjGz242
	E0ea/AyGkCE/NqqUWRQFLMgsOmnaHkL5dGhTVUDepnUX7A4R9Z9Np7gEv9l9+4wiAgxClBpv0bM
	Y=
X-Received: by 2002:a05:6902:1707:b0:e5b:21e4:d887 with SMTP id 3f1490d57ef6-e5b4619f375mr13712175276.19.1739229059276;
        Mon, 10 Feb 2025 15:10:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG+uFDoQgt7ClLP9YRwsvG8gLINyPnKkvfjeiO8adNvnnks4vYT/H56Z3CUg+P5cCKTbi1EKyjELPBxs6+aa0U=
X-Received: by 2002:a05:6902:1707:b0:e5b:21e4:d887 with SMTP id
 3f1490d57ef6-e5b4619f375mr13712146276.19.1739229058920; Mon, 10 Feb 2025
 15:10:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250207-bitmap-kunit-convert-v1-0-c520675343b6@gmail.com>
 <Z6eaDuXnT_rjVSNS@thinkpad> <CAMuHMdUsq_39kgBa8oanXeTzv44HuhS1e5MK7K2jxkVXQ7uWdw@mail.gmail.com>
 <bd71c705-5f57-4067-b200-fd80b98ddbc9@nvidia.com> <8b4bb4f0-37fc-4215-a3a9-3771394f065f@redhat.com>
In-Reply-To: <8b4bb4f0-37fc-4215-a3a9-3771394f065f@redhat.com>
From: Nico Pache <npache@redhat.com>
Date: Mon, 10 Feb 2025 16:10:33 -0700
X-Gm-Features: AWEUYZnj374O6r-fMAMQWzYmUj3jVBsErlGEBDI0ezwDzb8h1N0CVNAmtj-2QQw
Message-ID: <CAA1CXcDXs7VRp=sfyDNTr6fR7MQ+pvb+w-o+gp-N6yTgdpMBRw@mail.gmail.com>
Subject: Re: distro support for CONFIG_KUNIT: [PATCH 0/3] bitmap: convert
 self-test to KUnit
To: David Hildenbrand <david@redhat.com>, John Hubbard <jhubbard@nvidia.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Yury Norov <yury.norov@gmail.com>
Cc: Tamir Duberstein <tamird@gmail.com>, David Gow <davidgow@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Shuah Khan <shuah@kernel.org>, Kees Cook <kees@kernel.org>, 
	Muhammad Usama Anjum <usama.anjum@collabora.com>, linux-kernel@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linuxppc-dev@lists.ozlabs.org, 
	linux-kselftest@vger.kernel.org, Brad Figg <bfigg@nvidia.com>, 
	Michal Hocko <mhocko@suse.com>, Jason Gunthorpe <jgg@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 10, 2025 at 12:46=E2=80=AFPM David Hildenbrand <david@redhat.co=
m> wrote:
>
> On 10.02.25 20:35, John Hubbard wrote:
> > On 2/9/25 11:54 PM, Geert Uytterhoeven wrote:
> >> On Sat, 8 Feb 2025 at 18:53, Yury Norov <yury.norov@gmail.com> wrote:
> >>> On Fri, Feb 07, 2025 at 03:14:01PM -0500, Tamir Duberstein wrote:
> >>>> On 7/27/24 12:35 AM, Shuah Khan wrote:
> > ...
> >>>> The crux of the argument seems to be that the config help text is ta=
ken
> >>>> to describe the author's intent with the fragment "at boot". I think
> >>
> >> IMO, "at boot" is a misnomer, as most tests can be either builtin
> >> or modular.
> >
> > Right.
> >
> >>
> >>> KUNIT is disabled in defconfig, at least on x86_64. It is also disabl=
ed
> >>> on my Ubuntu 24.04 machine. If I take your patches, I'll be unable to
> >
> > OK so I just bought a shiny new test machine, and installed one of the
> > big name distros on it, hoping they've moved ahead and bought into the =
kunit
> > story...
> >
> > $ grep KUNIT /boot/config-6.8.0-52-generic
> > # CONFIG_KUNIT is not set
> >
> > ...gagghh! No such luck. One more data point, in support of Yuri's comp=
laint. :)
> >
> >>
> >> I think distros should start setting CONFIG_KUNIT=3Dm.
> >
> > Yes they should! kunit really does have important advantages for many u=
se
> > cases, including bitmaps here, and "CONFIG_KUNIT is not set" is the mai=
n
> > obstacle.
>  > > Let me add a few people to Cc who might be able to influence some
> distros.
> >
> > thanks,
>
>
> Fedora has it.
>
> CS-10 has it (-> RHEL-10):
> redhat/configs/common/generic/CONFIG_KUNIT:CONFIG_KUNIT=3Dm
>
> https://gitlab.com/redhat/centos-stream/src/kernel/centos-stream-10/-/blo=
b/main/redhat/configs/common/generic/CONFIG_KUNIT?ref_type=3Dheads
>
> CS-9 has it (-> RHEL-9):
> redhat/configs/common/generic/CONFIG_KUNIT:CONFIG_KUNIT=3Dm
>
> https://gitlab.com/redhat/centos-stream/src/kernel/centos-stream-9/-/blob=
/main/redhat/configs/common/generic/CONFIG_KUNIT?ref_type=3Dheads
>
> So I think from the RH side everything is properly set?
>
> Let me CC Nico, he did some KUNIT work in the past.

Yeah that is correct! I enabled KUNIT in our environments a few years
ago. We enable it as a module and use our own wrapper to exercise the
code. For RHEL and Centos these kunit modules are only shipped
internally for testing; However fedora-rawhide makes these modules
available in the kernel-modules-internal package.

To test this you can follow this to install rawhide-vm:
https://developer.fedoraproject.org/tools/virt-builder/about.html
then inside the vm:
    yum install kernel-modules-internal
    add the kunit.enable=3D1 to the cmdline
    reboot vm
    modprobe kunit
    modprobe <test_name>

Hopefully that helps!
-- Nico



>
>
> --
> Cheers,
>
> David / dhildenb
>

