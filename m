Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA7832EB5B4;
	Thu, 26 Jun 2025 15:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750952558; cv=none; b=NbzyCUmDyio1V1NXYViOqStyoEdwcKXw1D2q7+OIUfpvpy2gUmvRHLc7CUmqa/vN/MXHaHb79+mANAlA2rRBpfB7ls9Mz8eDPYOpm4sJRFWq9+MEZoiC4SbPpcKdWK6zbRPi5nRoiG7Thl4DGuLuQbF6Rrwz2UptJpHMXVaudng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750952558; c=relaxed/simple;
	bh=3TAh0qJGYwqeLbV+COJZVeEiUfRjOi8apLCamoQYQHs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=cnjIPTxoE/NFQTjnA6WqDazSEKcPx06KlOSlekf6UXdX9CpfU8SizVrTVJD8iB2LC8YQdnMbxDx4Kxxow79q5sKqatO8L9pamRkGvmscwj/nwnfhdbZAjqXEwWyCDSJrhBGRfFHc4vyM0DkMrLV4zjeJk0BbZdHtQj4QtW4Ej40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OnoLLPmw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OnoLLPmw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F0B2C4CEEB;
	Thu, 26 Jun 2025 15:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750952557;
	bh=3TAh0qJGYwqeLbV+COJZVeEiUfRjOi8apLCamoQYQHs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=OnoLLPmwA7gpqaMXkgi3zAZfib7OyqHmJb05vPN8Ptid/fbUfprknp/7TnNzXIB5s
	 BbcScnAExjrEM+M3kmF3ecdDfCuqeTUXcUOBnOXrD6zcs4VRes6p1P2WDZO2VwH4ez
	 JL8QD94C7orAmEofd8XlCFDqyIv25fPepmiXJEDq3JJL4iTTnuYGU1LhgJGYtI7yk9
	 7EhAOOuS/V6lvH3EbnGrRLc/XmdEyRlkz/5XFthhmxty9bhS4tp8MbkTsi73OkmCxn
	 decWvyl7JdC1NkNkLfRys7WCo1VPP7XcM+TCD0KmV6Mmzl8vDhTuM0n1BIN0OdzArQ
	 wHW2hjze+yAPA==
From: Pratyush Yadav <pratyush@kernel.org>
To: David Matlack <dmatlack@google.com>
Cc: Christian Brauner <brauner@kernel.org>,  Pasha Tatashin
 <pasha.tatashin@soleen.com>,  pratyush@kernel.org,  jasonmiu@google.com,
  graf@amazon.com,  changyuanl@google.com,  rppt@kernel.org,
  rientjes@google.com,  corbet@lwn.net,  rdunlap@infradead.org,
  ilpo.jarvinen@linux.intel.com,  kanie@linux.alibaba.com,
  ojeda@kernel.org,  aliceryhl@google.com,  masahiroy@kernel.org,
  akpm@linux-foundation.org,  tj@kernel.org,  yoann.congal@smile.fr,
  mmaurer@google.com,  roman.gushchin@linux.dev,  chenridong@huawei.com,
  axboe@kernel.dk,  mark.rutland@arm.com,  jannh@google.com,
  vincent.guittot@linaro.org,  hannes@cmpxchg.org,
  dan.j.williams@intel.com,  david@redhat.com,  joel.granados@kernel.org,
  rostedt@goodmis.org,  anna.schumaker@oracle.com,  song@kernel.org,
  zhangguopeng@kylinos.cn,  linux@weissschuh.net,
  linux-kernel@vger.kernel.org,  linux-doc@vger.kernel.org,
  linux-mm@kvack.org,  gregkh@linuxfoundation.org,  tglx@linutronix.de,
  mingo@redhat.com,  bp@alien8.de,  dave.hansen@linux.intel.com,
  x86@kernel.org,  hpa@zytor.com,  rafael@kernel.org,  dakr@kernel.org,
  bartosz.golaszewski@linaro.org,  cw00.choi@samsung.com,
  myungjoo.ham@samsung.com,  yesanishhere@gmail.com,
  Jonathan.Cameron@huawei.com,  quic_zijuhu@quicinc.com,
  aleksander.lobakin@intel.com,  ira.weiny@intel.com,
  andriy.shevchenko@linux.intel.com,  leon@kernel.org,  lukas@wunner.de,
  bhelgaas@google.com,  wagi@kernel.org,  djeffery@redhat.com,
  stuart.w.hayes@gmail.com
Subject: Re: [RFC v2 10/16] luo: luo_ioctl: add ioctl interface
In-Reply-To: <CALzav=d+XgS1bUs-v7+ws5nYU9y=4uc1c8oVLHrJ16qLpnUi9Q@mail.gmail.com>
References: <20250515182322.117840-1-pasha.tatashin@soleen.com>
	<20250515182322.117840-11-pasha.tatashin@soleen.com>
	<20250624-akzeptabel-angreifbar-9095f4717ca4@brauner>
	<CA+CK2bBu4ex9O5kPcR7++DVg3RM8ZWg3BCpcc6CboJ=aG8mVmQ@mail.gmail.com>
	<20250625-akrobatisch-libellen-352997eb08ef@brauner>
	<CALzav=d+XgS1bUs-v7+ws5nYU9y=4uc1c8oVLHrJ16qLpnUi9Q@mail.gmail.com>
Date: Thu, 26 Jun 2025 17:42:28 +0200
Message-ID: <mafs0sejmse57.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 25 2025, David Matlack wrote:

> On Wed, Jun 25, 2025 at 2:36=E2=80=AFAM Christian Brauner <brauner@kernel=
.org> wrote:
>> >
>> > While I agree that a filesystem offers superior introspection and
>> > integration with standard tools, building this complex, stateful
>> > orchestration logic on top of VFS seemed to be forcing a square peg
>> > into a round hole. The ioctl interface, while more opaque, provides a
>> > direct and explicit way to command the state machine and manage these
>> > complex lifecycle and dependency rules.
>>
>> I'm not going to argue that you have to switch to this kexecfs idea
>> but...
>>
>> You're using a character device that's tied to devmptfs. In other words,
>> you're already using a filesystem interface. Literally the whole code
>> here is built on top of filesystem APIs. So this argument is just very
>> wrong imho. If you can built it on top of a character device using VFS
>> interfaces you can do it as a minimal filesystem.
>>
>> You're free to define the filesystem interface any way you like it. We
>> have a ton of examples there. All your ioctls would just be tied to the
>> fileystem instance instead of the /dev/somethingsomething character
>> device. The state machine could just be implemented the same way.
>>
>> One of my points is that with an fs interface you can have easy state
>> seralization on a per-service level. IOW, you have a bunch of virtual
>> machines running as services or some networking services or whatever.
>> You could just bind-mount an instance of kexecfs into the service and
>> the service can persist state into the instance and easily recover it
>> after kexec.
>
> This approach sounds worth exploring more. It would avoid the need for
> a centralized daemon to mediate the preservation and restoration of
> all file descriptors.

One of the jobs of the centralized daemon is to decide the _policy_ of
who gets to preserve things and more importantly, make sure the right
party unpreserves the right FDs after a kexec. I don't see how this
interface fixes this problem. You would still need a way to identify
which kexecfs instance belongs to who and enforce that. The kernel
probably shouldn't be the one doing this kind of policy so you still
need some userspace component to make those decisions.

>
> I'm not sure that we can get rid of the machine-wide state machine
> though, as there is some kernel state that will necessarily cross
> these kexecfs domains (e.g. IOMMU driver state). So we still might
> need /dev/liveupdate for that.

Generally speaking, I think both VFS-based and IOCTL-based interfaces
are more or less equally expressive/powerful. Most of the ioctl
operations can be translated to a VFS operation and vice versa.

For example, the fsopen() call is similar to open("/dev/liveupdate") --
both would create a live update session which auto closes when the FD is
closed or FS unmounted. Similarly, each ioctl can be replaced with a
file in the FS. For example, LIVEUPDATE_IOCTL_FD_PRESERVE can be
replaced with a fd_preserve file where you write() the FD number.
LIVEUPDATE_IOCTL_GET_STATE or LIVEUPDATE_IOCTL_PREPARE, etc. can be
replaced by a "state" file where you can read() or write() the state.

I think the main benefit of the VFS-based interface is ease of use.
There already exist a bunch of utilites and libraries that we can use to
interact with files. When we have ioctls, we would need to write
everything ourselves. For example, instead of
LIVEUPDATE_IOCTL_GET_STATE, you can do "cat state", which is a bit
easier to do.

As for downsides, I think we might end up with a bit more boilerplate
code, but beyond that I am not sure.

--=20
Regards,
Pratyush Yadav
