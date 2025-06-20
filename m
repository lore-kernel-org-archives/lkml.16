Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B7E72D8DC9;
	Fri, 20 Jun 2025 15:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750433322; cv=none; b=NRafKBaDYCIsrVV2KyfLBVVUa45NNwuRkg1DQWleYtKokN/bOuTBxuSRCX8e9kwQ3I2Ptvp8zyaCHa510lziPMffnzruk8Mv2JsB97U1jdnZ7U33iX+q4lJg8AdkHiaHvibSoxyideyE0A4/CqNhoIo8+FILXS46WZE7HIkhMfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750433322; c=relaxed/simple;
	bh=s48sv8cQZxsP+ITyE0jtnLWoulZ7jFl//mGYqYmUOIg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=WNSBrJy3X+M7spsJhd6N4LS9jPyxfrOvUfTLcRzvSNy0TqumU0LS1ZXMffqJIlJFZyH4bQT4DQUblqiMeChBYGgo167w+ScXLmhIK/J3vMFBXeAV1vxMQ5VK9JZpVp3F9iomEpC6oidpvT2reyeZX2aRWppyRnVcyOMyUob9QlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T/yh1qX0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T/yh1qX0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C94AC4CEE3;
	Fri, 20 Jun 2025 15:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750433321;
	bh=s48sv8cQZxsP+ITyE0jtnLWoulZ7jFl//mGYqYmUOIg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=T/yh1qX0eOHqOk94aDuQCH2s/qyRkQqpZOboUNJPj1MkPrHAk+mivll/EFLYhzA7f
	 51EJzq8JQEYwojbFGTMMqW12eR1/0K7+g2HmvP53X7MKTLUHGOAfrHaV8iilcThtc6
	 sVv0v8ZjR6dqxfG5qCP6CtkkmrWdn9BZmEtYHvEj0z/5M5TmBF07beiIaXyekd/2iE
	 +KnXqSCm582ZUC5wd1mGmLvlP/Wa3MTNzDL3rka4g6wU4pEz3QQ+oFF3MB1sV03xP7
	 QeCrWMn1J+rjPifsv0xMED4VVllS/gk9xNPfbErfrnQipu0Ej/NbYCJe5LTZkG9wpg
	 rz1b+ci1aoT6Q==
From: Pratyush Yadav <pratyush@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: Mike Rapoport <rppt@kernel.org>,  Pratyush Yadav <pratyush@kernel.org>,
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
In-Reply-To: <CA+CK2bDqO4SkUpiFahfUx2MUiE8oae9HmuaghPAnCwaJZpoTwQ@mail.gmail.com>
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
Date: Fri, 20 Jun 2025 17:28:31 +0200
Message-ID: <mafs0ikkqv3ds.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hi Pasha,

On Thu, Jun 19 2025, Pasha Tatashin wrote:

[...]
>> And it has to be done before kexec load, at least until we resolve this.
>
> The before kexec load constrained has been fixed. The only
> "finalization" constraint we have is it should be before
> reboot(LINUX_REBOOT_CMD_KEXEC) and only because memory allocations
> during kernel shutdown are undesirable. Once KHO moves away from a
> monolithic state machine this constraint disappears. Kernel components
> could preserve their resources at appropriate times, not necessarily
> tied to a shutdown-time. For live update scenarios, LUO already
> orchestrates this timing.
>
>> Currently this is triggered either by KHO debugfs or by LUO ioctls. If we
>> completely drop KHO debugfs and notifiers, we still need something that
>> would trigger the magic.
>
> An external "magic trigger" for KHO (like the current finalize
> notifier or debugfs command) is necessary for scenarios like live
> update, where userspace resources are being preserved in a coordinated
> fashion just before kexec.
>
> For kernel-internal resources that are unrelated to such a
> userspace-driven live update flow, the respective kernel components
> should directly use KHO's primitive preservation APIs
> (kho_preserve_folio, etc.) when they need to mark their resources for
> handover. No separate, state machine or external trigger should be
> required for these individual, self-contained preservation acts.

For kernel-internal components, I think this makes a lot of sense,
especially now that we don't need to get everything done by kexec load
time. I suppose the liveupdate_reboot() call at reboot time to prepare
final things can be useful, but subsystems can just as well register
reboot notifiers to get the same notification.

>
>> I'm not saying we should keep KHO debugfs and notifiers, I'm saying that if
>> we make LUO the only thing driving KHO, liveupdate is not an appropriate
>> name.
>
> LUO drives KHO specifically for the purpose of live updates. If a
> different userspace use-case emerges that needs another distinct
> purpose (e.g., not to preserve a FD a or a device across kernel reboot
> (i.e. something for which LUO does not provide uAPI)), then that would
> probably need a separate from LUO uAPI instead of extending the LUO
> uAPI.

Outside of hypervisor live update, I have a very clear use case in mind:
userspace memory handover (on guest side). Say a guest running an
in-memory cache like memcached with many gigabytes of cache wants to
reboot. It can just shove the cache into a memfd, give it to LUO, and
restore it after reboot. Some services that suffer from long reboots are
looking into using this to reduce downtime. Since it pretty much
overlaps with the hypervisor work for now, I haven't been talking about
it as much.

Would you also call this use case "live update"? Does it also fit with
your vision of where LUO should go?

If not, why do you think we should have a parallel set of uAPIs that do
similar work? Why can't we accommodate other use cases under one API,
especially as long as they don't have conflicting goals? In practice,
outside of s/luo/khoctl/g, I don't think much would change as of now.
The state machine and APIs will stay the same.

When those use cases start to diverge from the liveupdate, or conflict
with it, we can then decide to have a separate interface for them, but
when going the other way round, we won't end up with a somewhat
confusing name for a more widely applicable technology.

I've been thinking about the naming since the start, but I didn't want
to bikeshed on it too much. But if we are also talking about the scope
of LUO, then I think this is a conversation worth having.

PS: I don't have real data, but I have a feeling that after luo/khoctl
    mature, more use cases will come out of the woodwork to optimize
    reboots.

-- 
Regards,
Pratyush Yadav
