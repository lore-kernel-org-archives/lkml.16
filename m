Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E404370830
	for <linux-kernel@vger.kernel.org>; Sun,  8 Jun 2025 16:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749401281; cv=none; b=c+tOzBC6q+bk8xjOaW2f2OqO2D4WoQ+0mkldiz0vZDahYneKnTopjiaf2+NOWzi3CPacdgJF55+2rsd0NkYtldd9/wijjP843nrIgRWb7AjPQZTf4powpBxhb38gc5O7HWg2jdWq0n3yogci4l6CfK89VRZw3vfy2FpWS7P3Wd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749401281; c=relaxed/simple;
	bh=pcc00lKL07ldGo8PyyfZ8jInejYQP/wQpM8Kg9OlyoY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k7KsO1xe4UekznEexvd3K8nZ9d8a8JEdwrd1yngTG9tHIYJtdCGFOoQdbGfzFrtLMP066dHRMmoHtKPDsY41OZmO3+xsA/vjvpCXqS4jdQwCwrwQ0YwBM+IqkhYqWmBEukf0OKRUxyLfYcfxd+QmyEn58xuf1xoeiKa4IiWSghQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=NTJCV3zq; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="NTJCV3zq"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7d20f79a00dso489248885a.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Jun 2025 09:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1749401278; x=1750006078; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z4mLD6ZBDCacy+5KKbwWASUNAXTCWi/82rv4+F3m5es=;
        b=NTJCV3zqRJKBcPQsaMocIBN4yZC5locd1ZresRihskMaqluYi/0f5AHHacc9LrNB1V
         x1oBrJBUNMNk5n5TXVc2lEzwjVgRwsPcs6FED17V5Z7GTHmR0SgxtxQGZ0dBFZeGtWSP
         Lnr8ASqBvxVOwWj455Fm9Ruvq0CaO98Ng6S++xllKRSQr+V8t6XAxOQijpW24210YbpT
         IVMRKB8iPSVW0a7t6yZni6ExptvWraMnJnPmRT+0NxuG5p3hKZBWhpP8+l1HEjDHmMhh
         kK+55n51dFfOk9UmcgPwnOhg3OzrrRZyboqawL4TNZMFqbX1qyXUqiChtPRXNjccXoCN
         izEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749401278; x=1750006078;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z4mLD6ZBDCacy+5KKbwWASUNAXTCWi/82rv4+F3m5es=;
        b=AHj2P4XBKpPsayEvBfwPeD0kiGnA53GIFSYU1HaKo10KVKVOBOJPvdbzz+cCsLSw7X
         wvsTO2v3Wl35bnWdlkYzFsdERpE6Y2mMa2ddxxSYHTmYMNS0jxldwWe4BXw/1BwXVz5p
         dyAAnqgRn/WBxXaFID7vxl2NjaIUF/XE5HC3lD80iC+434jUoNKYVisK7Y2m8KQpp2AC
         Z236KfkQaEVrmNDuE145zhAw2RSjYbpCAE7MOi2vBren8TWkemIPvGmLSOcuHxdK+fgG
         6kDzlaHvuTWezNveMxmHLu7yLCbwpA3ltyq6Agzbn4MkvSpZ2MSo9NchFPO0f2fKYCaj
         GS2w==
X-Forwarded-Encrypted: i=1; AJvYcCV8SPfmK45TN3mqzRVQbyztIQPTnORCAECkVEjJ1bvspFh/MbavdXnIMdkcqGq4cPP7FLTCMFVSt2AMcFQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBIMrd1gZTKDiuAnYgJERKfkEB8gLkr9FXoviu/vHrstdcBPSI
	e17YNnwN6F52zuHfLddKY71bTzpJDI521TUDBLs/eh5LLsTvWnsJkBsIWrVP8P+n9mj92ols+/q
	ISKzuhnuDnjiyweNPDrFO0L1/dvipz1PkPgghLetoPQ==
X-Gm-Gg: ASbGnctS9mLyK6hGjCghk6G9GDfx2/lJdOv4HQUneH00yr3KnJRPVfeO9givJH+R2Ca
	+os5Viw7maGUJcYyWDaWk0YCBbunlqJ+RuUklxGsQWFajGnluPAKQKf0swZIfBArSgaSyFfBT/h
	o2FZ58If493IY8xb3lCcWq2NlUP7jjAWl/O9hwdWYT
X-Google-Smtp-Source: AGHT+IEs/C9sBlNWz2wXNsGbPqskhgwVgo/QLWX02D5Sf9R590oESJfie1k8PTRBskdNsn7eCrILFqcX6T3swqr/wZA=
X-Received: by 2002:a05:622a:260b:b0:48e:9e05:cede with SMTP id
 d75a77b69052e-4a5b9dc4512mr199150681cf.52.1749401277864; Sun, 08 Jun 2025
 09:47:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250515182322.117840-1-pasha.tatashin@soleen.com>
 <20250515182322.117840-14-pasha.tatashin@soleen.com> <aDQr1E31Gw-x-XTE@kernel.org>
In-Reply-To: <aDQr1E31Gw-x-XTE@kernel.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Sun, 8 Jun 2025 12:47:21 -0400
X-Gm-Features: AX0GCFtdRr0JczX7XZvcuUGFk7aKkG5txkDs_LzBQs6_5QSoVZeflqKUSwLoHnM
Message-ID: <CA+CK2bDTjnumpYjaEor=2-bG--4YtbuJuei2bc-Af-hCguO+4A@mail.gmail.com>
Subject: Re: [RFC v2 13/16] luo: add selftests for subsystems un/registration
To: Mike Rapoport <rppt@kernel.org>
Cc: pratyush@kernel.org, jasonmiu@google.com, graf@amazon.com, 
	changyuanl@google.com, dmatlack@google.com, rientjes@google.com, 
	corbet@lwn.net, rdunlap@infradead.org, ilpo.jarvinen@linux.intel.com, 
	kanie@linux.alibaba.com, ojeda@kernel.org, aliceryhl@google.com, 
	masahiroy@kernel.org, akpm@linux-foundation.org, tj@kernel.org, 
	yoann.congal@smile.fr, mmaurer@google.com, roman.gushchin@linux.dev, 
	chenridong@huawei.com, axboe@kernel.dk, mark.rutland@arm.com, 
	jannh@google.com, vincent.guittot@linaro.org, hannes@cmpxchg.org, 
	dan.j.williams@intel.com, david@redhat.com, joel.granados@kernel.org, 
	rostedt@goodmis.org, anna.schumaker@oracle.com, song@kernel.org, 
	zhangguopeng@kylinos.cn, linux@weissschuh.net, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, gregkh@linuxfoundation.org, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, rafael@kernel.org, 
	dakr@kernel.org, bartosz.golaszewski@linaro.org, cw00.choi@samsung.com, 
	myungjoo.ham@samsung.com, yesanishhere@gmail.com, Jonathan.Cameron@huawei.com, 
	quic_zijuhu@quicinc.com, aleksander.lobakin@intel.com, ira.weiny@intel.com, 
	andriy.shevchenko@linux.intel.com, leon@kernel.org, lukas@wunner.de, 
	bhelgaas@google.com, wagi@kernel.org, djeffery@redhat.com, 
	stuart.w.hayes@gmail.com, ptyadav@amazon.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 26, 2025 at 4:52=E2=80=AFAM Mike Rapoport <rppt@kernel.org> wro=
te:
>
> On Thu, May 15, 2025 at 06:23:17PM +0000, Pasha Tatashin wrote:
> > Introduce a self-test mechanism for the LUO to allow verification of
> > core subsystem management functionality. This is primarily intended
> > for developers and system integrators validating the live update
> > feature.
> >
> > The tests are enabled via the new Kconfig option
> > CONFIG_LIVEUPDATE_SELFTESTS (default 'n') and are triggered through
> > a new ioctl command, LIVEUPDATE_IOCTL_SELFTESTS, added to the
> > /dev/liveupdate device node.
> >
> > This ioctl accepts commands defined in luo_selftests.h to:
> > - LUO_CMD_SUBSYSTEM_REGISTER: Creates and registers a dummy LUO
> >   subsystem using the liveupdate_register_subsystem() function. It
> >   allocates a data page and copies initial data from userspace.
> > - LUO_CMD_SUBSYSTEM_UNREGISTER: Unregisters the specified dummy
> >   subsystem using the liveupdate_unregister_subsystem() function and
> >   cleans up associated test resources.
> > - LUO_CMD_SUBSYSTEM_GETDATA: Copies the data page associated with a
> >   registered test subsystem back to userspace, allowing verification of
> >   data potentially modified or preserved by test callbacks.
> > This provides a way to test the fundamental registration and
> > unregistration flows within the LUO framework from userspace without
> > requiring a full live update sequence.
>
> I don't think ioctl for selftest is a good idea.
> Can't we test register/unregister and state machine transitions with kuni=
t?
>
> And have a separate test module that registers as a subsystem, preserves
> it's state and then verifies the state after the reboot. This will requir=
e
> running qemu and qemu usage in tools/testing is a mess right now, but
> still.

Normally, I would agree with you, but LUO is special as it has two
parts: user states and kernel states, and it is already driven through
ioctl() interface to do state transitions, and preservation
management. So, in this particular case having an extended IOCTLs to
configure a specific kernel state, and then use normal IOCTLs to drive
tests is very useful. In the future, I plan to add support to QEMU,
but we need more work for that to happen.

Pasha
