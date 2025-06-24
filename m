Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D83F83074AD;
	Tue, 24 Jun 2025 16:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750781543; cv=none; b=QJFjWrFN7a6a0PszBeP58B10DB0WvhQnWHcnkv+HrIFzjAvLeFDbqFw6UZi8+sDBXHk2yf16SZXAllZudJMCqBeHfrZp3pEc+QFBBeEkQdzmOSKqssNMqmiCvh/fQh+h8YqyoBH7ajgqYItSkExiwrFQ6P5EvevABVZMx+OMWsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750781543; c=relaxed/simple;
	bh=JOL6WKmjohXqSHITngQz/Wj/wlzmJdN8Xapymilc6Y8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=eJYblAK4vk48EpYTlORXrMhO/pDZp2KcX35doO50ZH5lFV2MYzHMX+2Bs2cxSkmKETsS77wAShSZbpK2smQZ9p802RKDOWSaYE7elgYuvOoGwZI4Rr7Yw8QQ+IHut1hbsaaOK29442/4+1NIpg7pJNwIJGZ3AKWiDmHLghTYxjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tvC6j7Vj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tvC6j7Vj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C4F1C4CEF0;
	Tue, 24 Jun 2025 16:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750781543;
	bh=JOL6WKmjohXqSHITngQz/Wj/wlzmJdN8Xapymilc6Y8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=tvC6j7VjREp+BGJeKqV/caHXrqwb4fickgxYpsMh815a0NMBs4DoXS6bY7T759l14
	 d4pYdByP6Z3FuzrRhGV3WQbAIT/uo5MFTUQCpU0gzaYrM0B1K/DydHhwW/LyybW/Y0
	 I1fS81yhqfSUTQlvsFShyaqIFi7hr/S6m2KmuK7Cc32Cs0pyXp6Cy/7KmtUsqE++F9
	 XEcsqlFLfO5CcaHpDNJWJk7dvE/tlgRgZPrmyRP8vFkXZqR8CAMVCZrmmV68TxP8nw
	 VQaNl7gpgX+WCuAGpB1dWUrF5D400I99Xx5EdS6b5vtqShAl26IVInzPqE+NEWPm2w
	 pUXslySxKqqVQ==
From: Pratyush Yadav <pratyush@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Mike Rapoport <rppt@kernel.org>,
  Jason Gunthorpe <jgg@ziepe.ca>,  jasonmiu@google.com,  graf@amazon.com,
  changyuanl@google.com,  dmatlack@google.com,  rientjes@google.com,
  corbet@lwn.net,  rdunlap@infradead.org,  ilpo.jarvinen@linux.intel.com,
  kanie@linux.alibaba.com,  ojeda@kernel.org,  aliceryhl@google.com,
  masahiroy@kernel.org,  akpm@linux-foundation.org,  tj@kernel.org,
  yoann.congal@smile.fr,  mmaurer@google.com,  roman.gushchin@linux.dev,
  chenridong@huawei.com,  axboe@kernel.dk,  mark.rutland@arm.com,
  jannh@google.com,  vincent.guittot@linaro.org,  hannes@cmpxchg.org,
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
Subject: Re: [RFC v2 05/16] luo: luo_core: integrate with KHO
In-Reply-To: <CA+CK2bCA_ggpvbY+MQPaAHsN7MOzV7D3=MYvfAP4cFwhThJpPw@mail.gmail.com>
References: <mafs0sekfts2i.fsf@kernel.org>
	<CA+CK2bA7eAB4PvF0RXtt2DJ+FQ4DVV3x1OZrVo4q3EvgowhvJg@mail.gmail.com>
	<mafs0sek3n0x8.fsf@kernel.org> <20250617152357.GB1376515@ziepe.ca>
	<CA+CK2bAtO7BA5iptRfA_oa=5sUz_t-0F3Lu8oae1STnijXrPPQ@mail.gmail.com>
	<mafs05xgtw5wn.fsf@kernel.org>
	<CA+CK2bDWAPSmTdnD7vw4G00nPsM8R_Zefs_G+9zvSqTJqPb9Lg@mail.gmail.com>
	<aFLr7RDKraQk8Gvt@kernel.org>
	<CA+CK2bAnCRu+k=Q78eA4kcAebxA9NgOorhwRqu-WxC913YBsBw@mail.gmail.com>
	<CA+CK2bB3P1vX658ErkP4_-L6WZSOCcenEwUdX1qS=poDjs=i+A@mail.gmail.com>
	<aFP7wwCviqxujKDg@kernel.org>
	<CA+CK2bDqO4SkUpiFahfUx2MUiE8oae9HmuaghPAnCwaJZpoTwQ@mail.gmail.com>
	<mafs0ikkqv3ds.fsf@kernel.org>
	<CA+CK2bCA_ggpvbY+MQPaAHsN7MOzV7D3=MYvfAP4cFwhThJpPw@mail.gmail.com>
Date: Tue, 24 Jun 2025 18:12:14 +0200
Message-ID: <mafs0frfpt8yp.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 20 2025, Pasha Tatashin wrote:

> On Fri, Jun 20, 2025 at 11:28=E2=80=AFAM Pratyush Yadav <pratyush@kernel.=
org> wrote:
>> On Thu, Jun 19 2025, Pasha Tatashin wrote:
[...]
>> Outside of hypervisor live update, I have a very clear use case in mind:
>> userspace memory handover (on guest side). Say a guest running an
>> in-memory cache like memcached with many gigabytes of cache wants to
>> reboot. It can just shove the cache into a memfd, give it to LUO, and
>> restore it after reboot. Some services that suffer from long reboots are
>> looking into using this to reduce downtime. Since it pretty much
>> overlaps with the hypervisor work for now, I haven't been talking about
>> it as much.
>>
>> Would you also call this use case "live update"? Does it also fit with
>> your vision of where LUO should go?
>
> Yes, absolutely. The use case you described (preserving a memcached
> instance via memfd) is a perfect fit for LUO's vision.
>
> While the primary use case driving this work is supporting the
> preservation of virtual machines on a hypervisor, the framework itself
> is not restricted to that scenario. We define "live update" as the
> process of updating the kernel from one version to another while
> preserving FD-based resources and keeping selected devices
> operational. The machine itself can be running storage, database,
> networking, containers, or anything else.
>
> A good parallel is Kernel Live Patching: we don't distinguish what
> workload is running on a machine when applying a security patch; we
> simply patch the running kernel. In the same way, Live Update is
> designed to be workload-agnostic. Whether the system is running an
> in-memory database, containers, or VMs, its primary goal is to enable
> a full kernel update while preserving the userspace-requested state.

Okay, then we are on the same page and I can live with whatever name we
go with :-)

BTW, I think it would be useful to make this clarification on the LUO
docs as well so the intended use case/audience of the API is clear.
Currently the doc string in luo_core.c only talks about hypervisors and
VMs.

--=20
Regards,
Pratyush Yadav
