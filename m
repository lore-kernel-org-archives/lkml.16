Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F021D52B
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 02:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738203327; cv=none; b=nNUguHkr2kZ1sqfA9OKnCzl0Rs1rRW3sgpXuKY2/S59HaXVR1MaqrG3gxAn0rFylhdjeyXzsKIqmjpdBZ5gLJvu/aZvdoUkh1/RYCOmun2quh+5/DsKdCZ1wMbNVp1W0jBhhP3nGffzUuEImBM0Oa+r4dtHWiJtVlZ7TnM/Qun4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738203327; c=relaxed/simple;
	bh=orZla9O2A+E4DJv6OiX5psoqxdTYbHyT5BwavlcaGG0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PMapkwyE0hsZWeR9kaaQJd8P1jbYhDZl/5ditPY4d2JvF5KAV9k6LiEpilAb6FaWdCRxzVomFgYwlTpQXYNaPVoRMtFYLtov3lkiyi7zz8xaEkWcbqc77vV6TSFSb4c7FsnKFNfmMhYBufpZDgpAp31ScBD8oKUxiQVRqAtvdiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BfNww3rh; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BfNww3rh"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-215740b7fb8so70715ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 18:15:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738203325; x=1738808125; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zL2bVoQzvTlTDBwGlrT2Hn0lIShKB5FFgTt+rq/GXUE=;
        b=BfNww3rhe9D6YW5M0coUHWN6svgvOxl73iKKcANftmERO7j2prqEXZ3PsNPVkRZk5X
         cGnDPBGPdDHE8/WS3C8TQI9feGAeyHaImf6iomFugmkXky98/RW/CKcdVQ4Y4w+91H8D
         d993eotiXptRV9os8lm0rNNdEEoq3xDmJ4J7LkfwFp53Y/JfWTCm8cnq/P7Ml8Q+F/U6
         rUl0fXlBC5Hrq6Oe1UbbOYz0iz+CbXz91TbHieWWqvs989OvWx3AZtv1Zhnlbp7ZUyG/
         PjrtYTw2E1HRKtQ6hCEehf4D8nnSDJj/C06IUhG6OE+M43quUq0TLzEzHgY6peHXZZ2v
         lICw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738203325; x=1738808125;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zL2bVoQzvTlTDBwGlrT2Hn0lIShKB5FFgTt+rq/GXUE=;
        b=XHExpyTSHOdI3x5AcBaOpKqwXhrPCZpoySA/znw6vINSFr0HitOnh3Pgk6srkXR7cL
         pYwG/OiOf/kDkkSgro0ucRUdTcS0hSuLkhE0EKVGnHj0mRj5i2kwr3u7V8KGISYFcZUu
         r0m7W/SP9fZkKXeRyk84XoAGfp+i7xLL80IOhnlIJKzaJjj6nzPdACFN+chVOv0165uc
         gVinb24fk8t/ESKIxzu7wN3ZmPY+a6ew0KsUoKDoHEpysXyyXLtzQ//pvT3E2Is8jJuQ
         1C5cWEZmD9yDrnD4obNNVKKF4YBDXZYkqD0LjYNmM7tfQIFPVNxHX+RuWC523Q2EJjH4
         KPkQ==
X-Forwarded-Encrypted: i=1; AJvYcCXeDcuHgbrJg1+uN0eSQTQ2czjLWxTTi+kuWXcqLqCBEzJctzNR+QSmMwlpxrDY1vk7FTr/iovDEFxvGiY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0VVJXxtaY+RbWqWetIGiRFIfqznawEeQtG4/1PTnEEJehLrW9
	YJVQsIpf6E1LdylTtnVIEu0YzCcYF9ZmUnHnS6BNBsL/qndNriEZ5xJXuLrdzTjr9dYgWEPorY2
	VJbhpcVRGoto5tccGw2vsiCKFdalyFNqJpjEp
X-Gm-Gg: ASbGncvSXW45b9LDa93nkUIz6Ny8wRFoU4eDNleQsPaBAPGBp2Gg5kZGpVHidaQo8Ax
	wkTBu+KwIDiEPYQktT5HhXiCwO3XYnQyFmaqNUw+PKMGI9E5kRKOGubEkoFaqTTjKy0Z8AswQaD
	H5kbPO6X25kh87KXm4GlvYq0NB5w==
X-Google-Smtp-Source: AGHT+IHiw/l5Uly3TxfT60Bv+QsNpJ//IE32/Ma11U6wfwDQu474zQr3xgWxbyPKTz1IoSdCOksR8RL+mMMOIfQlrUY=
X-Received: by 2002:a17:902:6b01:b0:215:7ced:9d67 with SMTP id
 d9443c01a7336-21de2479655mr1342275ad.24.1738203324959; Wed, 29 Jan 2025
 18:15:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250101222039.74565-1-sj@kernel.org> <Z4XUoWlU-UgRik18@gourry-fedora-PF4VCD3F>
In-Reply-To: <Z4XUoWlU-UgRik18@gourry-fedora-PF4VCD3F>
From: Yuanchu Xie <yuanchu@google.com>
Date: Wed, 29 Jan 2025 18:15:08 -0800
X-Gm-Features: AWEUYZmwbhWtFQt8BXt48jdRBHbwVMypC1AoImNfsGOiL3MKq8A1xAi_a-yZ7Ek
Message-ID: <CAJj2-QF1y1XNRYy9sT5c5=pi20+67Duf9B2Amatnu01HLmw06Q@mail.gmail.com>
Subject: Re: [LSF/MM/BPF TOPIC] DAMON Requirements for Access-aware MM of Future
To: Gregory Price <gourry@gourry.net>
Cc: SeongJae Park <sj@kernel.org>, lsf-pc@lists.linux-foundation.org, damon@lists.linux.dev, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com, 
	Raghavendra K T <raghavendra.kt@amd.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
	Kaiyang Zhao <kaiyang2@cs.cmu.edu>, Jiaming Yan <jiamingy@amazon.com>, 
	Honggyu Kim <honggyu.kim@sk.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 13, 2025 at 7:06=E2=80=AFPM Gregory Price <gourry@gourry.net> w=
rote:
> 5) Scarce resources
>
>    We need to be careful not to consume excessive amounts of resources
>    in an attempt to track all these identifying mechanisms.  Even 1 byte
>    per folio is 256MB on a 1TB machine.  This gets out of hand quick.
>
>    With task-work, I was able to add no additional resource consumption,
>    but deferring to a fully async scenario and needing to track things
>    like last-accessing CPU, timestamps, and etc.
>
>    We'll need to examine this closely if we decide to aggregate either
>    of these mechanisms.
My concern with physical address space monitoring is fragmentation. I
ran some numbers on a few prod machines. Grouping by regions with the
same memcg and ignoring any unmapped memory to be generous, machines
with higher utilization can have a region/total pages ratio of ~40%,
and even those with lower utilization (<50%) can also reach 20%.
Accurately tracking these regions would require quite the region
metadata, on the order of GBs.
