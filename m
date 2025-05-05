Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FCB5198833
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 16:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746463039; cv=none; b=bS5CGg04Qy4ne5pizuuN2yV6bDkUIRriesFcUcKJkTb/r2RfAebrPaqMv8P082vRI3a8OwENWs4ox6nLdXCjk4BPgP4Z/ATF3OCwye7zKVE9ZMBJK4scafKxc3+fXElczXsw2kPxJ0ZrahpuC9F503qcQiqKyCCCMtLcJXV7uh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746463039; c=relaxed/simple;
	bh=DYVG8FHPEwJMjW4hwHccNZPPUKc3Wmzb9dipMGOCitc=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=clipTZK3YrjE8XqQopRgTFSAVrXsWsdE1gLh11YJmgjwXE5GXm4q13rJKp0B/3tCmJdDGxVxktJA81QLaCwjfWSNoZ+nhAy07SV578zuVTIQJhj9wXquhH1KeGcZjcB4YSLmnxb+jXopsPD6OapFupXgyE9aen3Mwp1F8p9uHEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylehuey.com; spf=pass smtp.mailfrom=kylehuey.com; dkim=pass (2048-bit key) header.d=kylehuey.com header.i=@kylehuey.com header.b=Dk1+jdg5; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylehuey.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylehuey.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kylehuey.com header.i=@kylehuey.com header.b="Dk1+jdg5"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-30bf7d0c15eso48109101fa.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 09:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kylehuey.com; s=google; t=1746463034; x=1747067834; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DYVG8FHPEwJMjW4hwHccNZPPUKc3Wmzb9dipMGOCitc=;
        b=Dk1+jdg5Np4SJrA/eeNPF2x2QMTDqxCez5zT95NGx8rpqJaYrGo5KDUcblHqsoCP1l
         WpG5mmcrWqCD5TZv/C8J5MrEmb0TUvQwoAtkFANhxPSud6pDbTrkkxtLLvMNTgPNKBML
         vC4w3Oe4Q3YkXR24beZrZc1TRlKDwEFU79JUKcU4rfq/BqxZcFOZanXy8VbmwR0ze/pD
         Vgoi/U1fqB5q1osxmT5+5OhBEbHD6RalC+mUpQlfPo3zll9aZhRmcNrQCw/PEBdrESFO
         krHNvjynOeeFrFG1OZYlW2WSShwcZvgK6EQ0+gUMSD9enHhWe5rAbOjv7tKZRX+jcnVh
         qYHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746463034; x=1747067834;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DYVG8FHPEwJMjW4hwHccNZPPUKc3Wmzb9dipMGOCitc=;
        b=v86h2vpNIwcMoe0hzur2DS+TM3/xeOsGcp7tbT8kKLls3Flf9cuMBqHCWn3vATGQZP
         16VswnQRUksv4/EZoEUgnp0HmcU5EZFTkAEQd4JTYAJvPf3F81hR+tDhNAs76HV8djSQ
         Va5gaygm5xGO1ez+m8y+8J1M4O26ydCzaokHhl1cGc/3l5u5oPW1XzuCoz19YNwoQ4ET
         1M7JlL8J17IGyk8xDPOLj1dIbYlalqYwOUuUW7xGdNFmFJQ9IzBK5gC/KG6tNJVoZqj0
         7oY27/ZJkOv8xboIWYTigxlZtWvcCH8/yhPI8dmfoIUfD3qdRPvr68GhZRuNIVBUoM/g
         QjCg==
X-Gm-Message-State: AOJu0Yy4IW125cw7ON0WLT6r35OD8R4ns2unnNB3O79uloitqi/8g9Av
	lzHJbrIM23dnJtN7vmVS7y01mW5Vey37qUDQjz+hX5okTLt4HonI2upqlSqKFdYTT3nL2t/+t09
	xcHLy5lYjufhAIxPZz0SORfAvr/LGxDA76Bvc
X-Gm-Gg: ASbGncsuY2MaO+knKlWKCRIRmGn50PJuYXvpqjbvTM0DIN51S+x+7nBQ6uT4DFlQrO9
	DMqwL1xvsfQLX3aE4XX6ohtKNv1D0f7lSHOETmB7pPN5yhHEZTsY0QxkbRzGxSuwoM5sDTiHNMx
	hVCZh+OsleAt/5RPP/y480vQu2HkaVt4mD
X-Google-Smtp-Source: AGHT+IEf041WQMZsEB6ApJMZB+Xxx8JHQfvRRsLBSqzHkQpZbZMtYWqmoWb/v7skUZcL3dTPnjTDniBrEIOLE/Z180E=
X-Received: by 2002:a2e:a812:0:b0:31f:8659:dc23 with SMTP id
 38308e7fff4ca-32352503df1mr32065821fa.33.1746463033960; Mon, 05 May 2025
 09:37:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Kyle Huey <me@kylehuey.com>
Date: Mon, 5 May 2025 09:37:01 -0700
X-Gm-Features: ATxdqUEwA7iSnVgV7ajfnBVATpF9QSTCIL6wXi_qBYuQWjWHd4nepvj6iJ4LJmk
Message-ID: <CAP045Ap3e6x52TvB8WyBHBjJ8HYtAmnKnGgj_fog3P+F5igP-A@mail.gmail.com>
Subject: Suppress pte soft-dirty bit with UFFDIO_COPY?
To: Andrew Morton <akpm@linux-foundation.org>, Peter Xu <peterx@redhat.com>
Cc: open list <linux-kernel@vger.kernel.org>, linux-mm@kvack.org, criu@lists.linux.dev, 
	"Robert O'Callahan" <robert@ocallahan.org>
Content-Type: text/plain; charset="UTF-8"

tl;dr I'd like to add UFFDIO_COPY_MODE_DONTSOFTDIRTY that does not add
the _PAGE_SOFT_DIRTY bit to the relevant pte flags. Any
thoughts/objections?

The kernel has a "soft-dirty" bit on ptes which tracks if they've been
written to since the last time /proc/pid/clear_refs was used to clear
the soft-dirty bit. CRIU uses this to track which pages have been
modified since a previous checkpoint and reduce the size of the
checkpoints taken. I would like to use this in my debugger[0] to track
which pages a program function dirties when that function is invoked
from the debugger.

However, the runtime environment for this function is rather unusual.
In my debugger, the process being debugged doesn't actually exist
while it's being debugged. Instead, we have a database of all program
state (including registers and memory values) from when the process
was executed. It's in some sense a giant core dump that spans multiple
points in time. To execute a program function from the debugger we
rematerialize the program state at the desired point in time from our
database.

For performance reasons, we fill in the memory lazily[1] via
userfaultfd. This makes it difficult to use the soft-dirty bit to
track the writes the function triggers, because UFFDIO_COPY (and
friends) mark every page they touch as soft-dirty. Because we have the
canonical source of truth for the pages we materialize via UFFDIO_COPY
we're only interested in what happens after the userfaultfd operation.

Clearing the soft-dirty bit is complicated by two things:
1. There's no way to clear the soft-dirty bit on a single pte, so
instead we have to clear the soft-dirty bits for the entire process.
That requires us to process all the soft-dirty bits on every other pte
immediately to avoid data loss.
2. We need to clear the soft-dirty bits after the userfaultfd
operation, but in order to avoid racing with the task that triggered
the page fault we have to do a non-waking copy, then clear the bits,
and then separately wake up the task.

To work around all of this, we currently have a 4 step process:
1. Read /proc/pid/pagemap and note all ptes that are soft-dirty.
2. Do the UFFDIO_COPY with UFFDIO_COPY_MODE_DONTWAKE.
3. Write to /proc/pid/clear_refs to clear soft-dirty bits across the process.
4. Do a UFFDIO_WAKE.

The overhead of all of this (particularly step 1) is a millisecond or
two *per page* that we lazily materialize, and while that's not
crippling for our purposes, it is rather undesirable. What I would
like to have instead is a UFFDIO_COPY mode that leaves the soft-dirty
bit unchanged, i.e. a UFFDIO_COPY_MODE_DONTSOFTDIRTY. Since we clear
all the soft-dirty bits once after setting up all the mmaps in the
process the relevant ptes would then "just do the right thing" from
our perspective.

But I do want to get some feedback on this before I spend time writing
any code. Is there a reason not to do this? Or an alternate way to
achieve the same goal?

If this is generally sensible, then a couple questions:
1. Do I need a UFFD_FEATURE flag for this, or is it enough for a
program to be able to detect the existence of a
UFFDIO_COPY_MODE_DONTSOFTDIRTY by whether the ioctl accepts the flag
or returns EINVAL? I would tend to think the latter.
2. Should I add this mode for the other UFFDIO variants (ZEROPAGE,
MOVE, etc) at the same time even if I don't have any use for them?

- Kyle

[0] https://pernos.co/
[1] Conceptually this is similar to CRIU's `restore --lazy-pages`. We
set up all the mappings at the beginning but we don't back them.
Instead we UFFDIO_REGISTER them all and when they're touched for the
first time we go get the pages from our database and then UFFDIO_COPY
them into the address space.
