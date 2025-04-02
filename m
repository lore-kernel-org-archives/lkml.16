Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31E811EFFB8
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 20:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743624416; cv=none; b=PUfjjBnNaqJ2bPbGVOXPVzfe/LFhZogktQrHu2TDk91r0YuAdpeJUURxeHlUQ4BhfE23Fwn9H9g7b1p2En4tSN4CkG2kqUbrJyG/hrbFFU2Cjr6qFU2fpu9moObX7+j6m5//9ZMjPC1OjQQY27/a5WiRktXuxy+el4ma8/y39Jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743624416; c=relaxed/simple;
	bh=p73LCpHyBrpzAB0TulDmZtS18EAqYiS+JFxO487Otm8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LkW+vWgkvZLR6gmKde61+CmyllEKilvTg1pD2DqzmGo5Un6ee/PeX2ibvHGQ8dOksIRZCFrAPhbhHJzk32k9Ry/Q37oihuBHS75dOWB/58uiyzrIg96nnt0TiNXsfynzSGoSmEtWfuRFQG1+kxtUPnwqsIqEAgOkxmNke29qZxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jHHTC4MP; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jHHTC4MP"
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e549b0f8d57so164147276.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 13:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743624414; x=1744229214; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ovp/3q2Ql4SNo8orFSiM0VLKdTHZcpZiyaTbFpXtnKU=;
        b=jHHTC4MPTDKIIYibMxqKrlB4I5Fn1Es2BoOU4GL332/X0tyn9B0JXa5mi1ZuIoEZ5G
         KUdGlP4mIx/riYs4nIx2GqVj/D9r0bpJtLkBhflZ7/vCi51X26nSiEakVXCJrivZoaYm
         FXgUR9wfO8hJboZAczaAluRLwRcwK1lg9Xx7Ebbfb0Jd/fMNjLkVeAFYT5BvkKpA3W1z
         vikY49D+kaj5Q5RF/CI2yVihM8tc7na9mu04GxUpRFloKS1xvFaLgth5Ss7yDWORtJpX
         Itb9Ejnl3g00njEsSGBoXOnomVh6ia3KUS6tB6UhmVsTk8lIV0YLUGbRZu1/hVbdCU0w
         WjdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743624414; x=1744229214;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ovp/3q2Ql4SNo8orFSiM0VLKdTHZcpZiyaTbFpXtnKU=;
        b=cvAAMoFi2NdfKsy7u0DDPQYtMrTeYxR41WmC+vQxpfAa+TjobeVsgtop1SKyyNJTAd
         WO/3/+tqmqtCByQULtDSPuUCl5N/4lEQNNjwewP9k1IRETroVXV2llziLZ3sMaGBBJMU
         7KNcDMb5bNC+ptBCJsPPEDZRkr6mZUwNr70Z/dcfV2n0alcghxhWTqouRVEMy2oaVSuL
         hYFYknMHynq2Absw/T3WvCkyAH+GZglOGnbHkWT5kl7JEY0uvv5WfWF6KvW/SLPGxJx6
         21GHz7NSUGF5VS23OUeNB8ymI/fsZGbUN2HTM9o9RN1a83hO9CIZfU+GfL+lUyZoc/ym
         u60w==
X-Forwarded-Encrypted: i=1; AJvYcCU63t5YdMhm26psAYAsg9K2+dD0kFnAgxhjyOCon/xBd6og+BrjUqQCgtrWugR0jkv2Z2E1nK+tFiPyGBw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyssYfGs2UoqdTyvYwov6czNmltvyeqWYH6FdONYLsm4ieuj2ci
	EsjdpdDc8WviGfk4/DOskOhf39n0CXkxDhKEVTM5htx/V6eDQrKD
X-Gm-Gg: ASbGncur0OsjYkwxRgaUX+TWweckw7tLoGKVwar0IAccfQDuCsblp4HEfWEHkHj9rnK
	YtgPX4/1Ui9mbm9u1pSAssYEkW5eO3K9nDg9LkItP3JICXSGNniC3AD/PIV2j9fX4EM4lUGuJKc
	kMzJPV/X7Gw/MlSDXAFV3U90v86VRP560aiHyhs/842LYkkdvGUdVAaikBMD+s9wOlZkSCJM9bW
	6pYYaVICsfMzkaIpJ0Srfv1HxMcZ8fMpRIS25p9g5vcEDiA7vkUyjWzYQME8lMoZeQe+zoNSAO3
	ht0rWrTY6m7ljkoTMVL69ZRn3SF0t6toIYKcFrgBeN5p
X-Google-Smtp-Source: AGHT+IENa3JuIhpq8gLK1UO7q0UVxsVc37TtBAYFggpxhZ9V2d0HIgX4uMiKRlW+XpWaKKf0qKtdug==
X-Received: by 2002:a05:6902:1b04:b0:e69:1efc:9855 with SMTP id 3f1490d57ef6-e6b83aaafb8mr25705751276.38.1743624413896;
        Wed, 02 Apr 2025 13:06:53 -0700 (PDT)
Received: from localhost ([2a03:2880:25ff:72::])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e6df6a4b667sm452073276.57.2025.04.02.13.06.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 13:06:53 -0700 (PDT)
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: Yosry Ahmed <yosryahmed@google.com>
Cc: Nhat Pham <nphamcs@gmail.com>,
	akpm@linux-foundation.org,
	hannes@cmpxchg.org,
	cerasuolodomenico@gmail.com,
	sjenning@redhat.com,
	ddstreet@ieee.org,
	vitaly.wool@konsulko.com,
	hughd@google.com,
	corbet@lwn.net,
	konrad.wilk@oracle.com,
	senozhatsky@chromium.org,
	rppt@kernel.org,
	linux-mm@kvack.org,
	kernel-team@meta.com,
	linux-kernel@vger.kernel.org,
	david@ixit.cz
Subject: Re: [PATCH 0/2] minimize swapping on zswap store failure
Date: Wed,  2 Apr 2025 13:06:49 -0700
Message-ID: <20250402200651.1224617-1-joshua.hahnjy@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <CAJD7tka6XRyzYndRNEFZmi0Zj4DD2KnVzt=vMGhfF4iN2B4VKw@mail.gmail.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Mon, 16 Oct 2023 17:57:31 -0700 Yosry Ahmed <yosryahmed@google.com> wrote:

> On Mon, Oct 16, 2023 at 5:35 PM Nhat Pham <nphamcs@gmail.com> wrote:

> I thought before about having a special list_head that allows us to
> use the lower bits of the pointers as markers, similar to the xarray.
> The markers can be used to place different objects on the same list.
> We can have a list that is a mixture of struct page and struct
> zswap_entry. I never pursued this idea, and I am sure someone will
> scream at me for suggesting it. Maybe there is a less convoluted way
> to keep the LRU ordering intact without allocating memory on the
> reclaim path.

Hi Yosry,

Apologies for reviving an old thread, but I wasn't sure whether opening an
entirely new thread was a better choice : -)

So I've implemented your idea, using the lower 2 bits of the list_head's prev
pointer (last bit indicates whether the list_head belongs to a page or a
zswap_entry, and the second to last bit was repurposed for the second chance
algorithm).

For a very high level overview what I did in the patch:
- When a page fails to compress, I remove the page mapping and tag both the
  xarray entry (tag == set lowest bit to 1) and the page's list_head prev ptr,
  then store the page directly into the zswap LRU.
- In zswap_load, we take the entry out of the xarray and check if it's tagged.
  - If it is tagged, then instead of decompressing, we just copy the page's
    contents to the newly allocated page. 
- (More details about how to teach vmscan / page_io / list iterators how to
  handle this, but we can gloss over those details for now)

I have a working version, but have been holding off because I have only been
seeing regressions. I wasn't really sure where they were coming from, but
after going through some perf traces with Nhat, found out that the regressions
come from the associated page faults that come from initially unmapping the
page, and then re-allocating it for every load. This causes (1) more memcg
flushing, and (2) extra allocations ==> more pressure ==> more reclaim, even
though we only temporarily keep the extra page.

Just wanted to put this here in case you were still thinking about this idea.
What do you think? Ideally, there would be a way to keep the page around in
the zswap LRU, but do not have to re-allocate a new page on a fault, but this
seems like a bigger task.

Ultimately the goal is to prevent an incompressible page from hoarding the
compression algorithm on multiple reclaim attempts, but if we are spending
more time by allocating new pages... maybe this isn't the correct approach :(

Please let me know if you have any thoughts on this : -)
Have a great day!
Joshua

Sent using hkml (https://github.com/sjp38/hackermail)

