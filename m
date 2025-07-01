Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0059A270548
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 15:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751384424; cv=none; b=npVvYckZXaUhISwGFG6Tml5MP6HMBXoWBQwtWLxj/BKXb7AgTypc6hYdIuEv6bRGFIv+HzBqe4BQzONwpc0NOPYQDrGMgcSRQ5xqcvueN3b53Q861ZenSMNv3kcM4qEi99dVrciT/xEopXF9o54lhWDJpD4TvjEN1r6nVK1ns8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751384424; c=relaxed/simple;
	bh=/7vfJ4ag6ZewhYkEmPZw35EEArCVesg3SRNuB5E6xFk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RVaxNly4/wnYAnUXmJZu4OMY4z/BKTY0mAx12bPpXlqDJmlklAo7vupabtz/3trKNDkhCfzoymy6f9xPsAOtV3yuadL8znuVdBm2dCzBppJFGdjS2QvMW4QOnpxdTF/Y5+LgWVJiO1mAzDhJv/0feWAndxdyr/X/lXFNnJHmQPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DEhQBkXv; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DEhQBkXv"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ae0dffaa8b2so991359166b.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 08:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751384421; x=1751989221; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/7vfJ4ag6ZewhYkEmPZw35EEArCVesg3SRNuB5E6xFk=;
        b=DEhQBkXv/IqGKQXoMjUlCgDLs7Svkb3FbtSie1836jUDqY63JhuK2SKrkpaWv4nLUz
         /Ac5q3egGTI+lj1EO7XU+3+9XkB4mXG+kwsl217sI9OL4yssCaVuBTU+4f8+pBKj9dJn
         0W5J9IcG4maImiHAhvUjYTVs5die8qS4cXeNCWm7wnpWbU639EvcfXtOaNpG0SB4791m
         Ekp7BJCyjD1br2vNyrM4WeH7+yuuZxeg446iZr14r54wtlNaNC1iuPKEmV7P1VhFS1G+
         HbOE/NtwpOFHAktpRmla96etEhh5hr7pTBX6ud8Gq8g2oCUfH55W6nFLjr/uCzdLmpn7
         NRBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751384421; x=1751989221;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/7vfJ4ag6ZewhYkEmPZw35EEArCVesg3SRNuB5E6xFk=;
        b=ZlYkbZbcJZWfWfZ0aROQsphM1DjFRwNxcMANl1OTxoV8c2OmecgieD/oelsW0G7N+F
         li/S61reW5YOu6QLK5Bt3OfbubruZwKF/LV+dIKZNEw2Mz4qkk3dgEpg91HeXR2KhuLV
         u51yxqe36TWqhwC5dHrA1ANX9/nRPv/G9dFr4Vy9LO2hExX1RIoYcNJTQm3rn8tZ+Alq
         Zn9UTL4UGgEOhzOUYOFFvZMkeGbEX2DHBz3I+Mix5Y7Bi+UEeS04oMEVl9cUvwptL9Oc
         gqGQu/cfODFtvwuBQendDAa7VQ0jpHdRQttGNQnf8XPkZmCbLhJWQ51erQz6H830DLCs
         1iIw==
X-Forwarded-Encrypted: i=1; AJvYcCWIWYFDs7mcKmQhQ3Mcs3bBhC5dyZO+CiI38S2yYFJQuGoDaCP13cIXUTEGlkpEwaVLuZRjZZqRMwKiuvc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxcdkj5YD99fCjmlYMQ3bTV5Ov8v6xUhbX0/wKZN5B3tObKHHnL
	G27y/eMN7GC+Sz8HIy+o4LSBPOnwcYTl/CU9kxFqqM9mPdy8eeD2JYqpV8gpIK/T58YuilKITge
	tMQYKn0+JypNe/Pt4dcwx6c33M+jSk3o=
X-Gm-Gg: ASbGnctsYz8bVgHZ+tiHqMVNoc7Ix+NA1W9p8h4vc/mo72TVIv9LFdmGS4+7kkyDWLO
	fzXUmXj98pqICuA0S9HQJ0b2Wsslr6faE3shgNn3GUZ5Fms3l2JmqYYjg83th1olxTf6odL6YvL
	Rzh+0nSiigb3WQainu3dF+gqAqVfVvbp6Ix0SYr0M=
X-Google-Smtp-Source: AGHT+IEeSarDYRbMce0QhHKbDHu/z47KA58d+tnKdcjgX34ocx6jVrPQA6V7BqorwKG+TvgDjiYRcVPrvLbIxErM0aM=
X-Received: by 2002:a17:907:d24:b0:ae0:a1c2:262e with SMTP id
 a640c23a62f3a-ae35018f138mr1612284866b.50.1751384420936; Tue, 01 Jul 2025
 08:40:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <4990838b-660d-46a2-b21c-67adcba61ff9@lucifer.local>
 <19714cae-6b73-43ec-af7a-1455196561d1@arm.com> <3ee2e7fea6f263aa884e3e715632b09f@kenip.in>
 <d8ffe547-5516-43e5-9f33-56b2698a0b4f@arm.com> <ba2c89bd-88de-48f8-abd0-b62d8b1d50b3@lucifer.local>
 <5816677a-705e-4a8f-b598-d74ff6198a02@arm.com> <ee92d6a9-529a-4ac5-b3d0-0ff4e9085786@lucifer.local>
 <e7152150-2f3e-4ad7-a6c5-f4b77e5c0e05@arm.com> <f746d3aa-17e7-4b42-9e08-97cdb2cad89b@lucifer.local>
 <80b849d4-faf3-47a9-8b8c-e8053299cfb2@arm.com> <2e99712b-8dac-4762-9fc5-fe3ef569b65e@lucifer.local>
 <afe95bb0-185b-4c4a-ae41-e02457422cc3@arm.com> <787639a1e6a27c0f3b0e3ae658e1b8e7@kenip.in>
In-Reply-To: <787639a1e6a27c0f3b0e3ae658e1b8e7@kenip.in>
From: Yang Shi <shy828301@gmail.com>
Date: Tue, 1 Jul 2025 08:40:09 -0700
X-Gm-Features: Ac12FXypL29YHg7f5sZW2FS0OrnA3vIxjvc47EWIlo06o3rh-Y54uGzeWKKVbTg
Message-ID: <CAHbLzkp-Nj3vmAWqJw_GZZ6oMmH5Bwv5eObvF+a3VHWa6p=q8w@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_=5BPATCH=5D_mm=3A_limit_THP_alignment_=E2=80=93_performance_?=
	=?UTF-8?Q?gain_observed_in_AI_inference_workloads?=
To: siddhartha@kenip.in
Cc: Dev Jain <dev.jain@arm.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, mgorman@suse.de, 
	Vlastimil Babka <vbabka@suse.cz>, Rik van Riel <riel@surriel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

>
> =F0=9F=A4=96 3. How does this impact AI workloads like Hugging Face Trans=
formers?
> Tokenization and dynamic batching create non-deterministic memory
> allocation patterns:
>
> Models like BERT and T5 dynamically allocate intermediate buffers per
> token-length, batch size, and attention window.
>
> Hugging Face + ONNX Runtime uses multiple small-ish anonymous mmap()s,
> often 512KB=E2=80=931.8MB.

If I remember correctly, Rik's patch should just force PMD alignment
when the allocation size is greater than PMD size. Such VMA
fragmentation should be caused by allocations greater than 2M but not
PMD aligned, so they create 2M PMD + a bunch of 4K PTEs. Less than 2M
allocations should be right next to each other and mergeable. Did I
miss something?

Thanks,
Yang


>
> These allocations come in bursts =E2=80=94 but due to forced alignment, t=
he
> kernel was placing them with artificial gaps, defeating THP eligibility
> entirely.
>
