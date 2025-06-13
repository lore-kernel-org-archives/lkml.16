Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FAEA2E406;
	Fri, 13 Jun 2025 14:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749826717; cv=none; b=VpDR8VA4+VLh2HZIfYyxq8HtqaPayX+YguLpQ/eBeTN9qvSEDqF60cOQ76pmCEBEbLZhCh+pyVPeU5lLIe5skSGf2t+Vh7nDlj1pLVyppIWguT59qQw2qK8s4ZJsgXBKzVTKA+WwN+/qqhGoXFs1BdFWHUVJ5x0m59K0XPT9RwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749826717; c=relaxed/simple;
	bh=iB17qoOb8HlU/gXIO+LtqUhl3ctgMUcVmL/kKRQHq+w=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=F9wgeEGk9usAP2ONRtfSqYQuSHeBgifZ4DJy0kZ8s0uFUZelZkuXY6yBVhtkj55L0zkzoDuAyTCIKPBqe4RJkusRZrqDFHxv9SY91XO+R0+3WGXOa3znOnCreKbKKLSVdnL1jrjIzfH8NsnyKa0EfsD8qszGngvN/nZi83CT9Mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZtLOza4k; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZtLOza4k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 198CFC4CEE3;
	Fri, 13 Jun 2025 14:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749826716;
	bh=iB17qoOb8HlU/gXIO+LtqUhl3ctgMUcVmL/kKRQHq+w=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ZtLOza4kFt33ZPiPPvZkUgKUFAaVPI2F6rZSPV7N0hMGTWjezapJgshD9Sttg4i8m
	 l5k0K0vhi8JwswN72Z+VXR7wuyng4VrG619zkgMDH+ascjJJL6zuIrF1wGF/z6d6Vc
	 lHeiF3Cmo5CwIZhBbf0AfngBPM8b5JlPSnQCUVIHFrvCg4APYyFjwnMe62M1E6MzEl
	 /xPI2F9K+8uFKgLHuD8fKgbmnoo+/fSPZ0+HZlds4VrKVFxG8QcjcATIb40v4Lj6gB
	 rkVA9NyNpRnRMY4k+2JJLiIJM2cnns5QfIVkF9oGS4hfyUXbiswq6VBHnoNrf57D17
	 9nk3vU67O1/dQ==
From: Pratyush Yadav <pratyush@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: Pratyush Yadav <pratyush@kernel.org>,  jasonmiu@google.com,
  graf@amazon.com,  changyuanl@google.com,  rppt@kernel.org,
  dmatlack@google.com,  rientjes@google.com,  corbet@lwn.net,
  rdunlap@infradead.org,  ilpo.jarvinen@linux.intel.com,
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
In-Reply-To: <CA+CK2bA7eAB4PvF0RXtt2DJ+FQ4DVV3x1OZrVo4q3EvgowhvJg@mail.gmail.com>
References: <20250515182322.117840-1-pasha.tatashin@soleen.com>
	<20250515182322.117840-6-pasha.tatashin@soleen.com>
	<mafs0sekfts2i.fsf@kernel.org>
	<CA+CK2bA7eAB4PvF0RXtt2DJ+FQ4DVV3x1OZrVo4q3EvgowhvJg@mail.gmail.com>
Date: Fri, 13 Jun 2025 16:58:27 +0200
Message-ID: <mafs0sek3n0x8.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Sat, Jun 07 2025, Pasha Tatashin wrote:
[...]
>>
>> This weirdness happens because luo_prepare() and luo_cancel() control
>> the KHO state machine, but then also get controlled by it via the
>> notifier callbacks. So the relationship between then is not clear.
>> __luo_prepare() at least needs access to struct kho_serialization, so it
>> needs to come from the callback. So I don't have a clear way to clean
>> this all up off the top of my head.
>
> On production machine, without KHO_DEBUGFS, only LUO can control KHO
> state, but if debugfs is enabled, KHO can be finalized manually, and
> in this case LUO transitions to prepared state. In both cases, the
> path is identical. The KHO debugfs path is only for
> developers/debugging purposes.

What I meant is that even without KHO_DEBUGFS, LUO drives KHO, but then
KHO calls into LUO from the notifier, which makes the control flow
somewhat convoluted. If LUO is supposed to be the only thing that
interacts directly with KHO, maybe we should get rid of the notifier and
only let LUO drive things.

This can be done later though; it doesn't have to be in the initial
revision.

>
>> >  static int __init luo_startup(void)
>> >  {
>> > -     __luo_set_state(LIVEUPDATE_STATE_NORMAL);
>> > +     phys_addr_t fdt_phys;
>> > +     int ret;
>> > +
>> > +     if (!kho_is_enabled()) {
>> > +             if (luo_enabled)
>> > +                     pr_warn("Disabling liveupdate because KHO is disabled\n");
>> > +             luo_enabled = false;
>> > +             return 0;
>> > +     }
>> > +
>> > +     ret = register_kho_notifier(&luo_kho_notifier_nb);
>> > +     if (ret) {
>> > +             luo_enabled = false;
>>
>> You set luo_enabled to false here, but none of the LUO entry points like
>> luo_prepare() or luo_freeze() actually check it. So LUO will appear work
>> just fine even when it hasn't initialized properly.
>
> luo_enabled check was missing from luo_ioctl.c, as we should not
> create a device if LUO is not enabled. This is fixed.
>
>>
>> > +             pr_warn("Failed to register with KHO [%d]\n", ret);
>>
>> I guess you don't return here so a previous liveupdate can still be
>> recovered, even though we won't be able to make the next one. If so, a
>> comment would be nice to point this out.
>
> This is correct, but this is not going to work. Because, with the
> current change I am disabling "/dev/liveupdate" iff luo_enable ==
> false. Let's just return here, failing to register with KHO should not
> really happen, it usually means that there is another notifier with
> the same name has already registered.

Okay, fair enough.

-- 
Regards,
Pratyush Yadav
