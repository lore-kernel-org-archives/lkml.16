Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 648831AA1D2
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 19:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738870667; cv=none; b=LYDCqNxH3eWZZtn0UkOyPhoZW0Wo3cwzUMB5DoaAerepWueF+ZDvyftsrWtB019yQinSzvc6L1MRjaJfC0iaB6Jkx9Ncksg+QwU9NXlhBkXByuSGM8LRxsxohO262KKCsuQRovkwSlg/flIsmY64bpTbGqkzzbU02bxU+km/ylE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738870667; c=relaxed/simple;
	bh=1fOBSotabUbiNEkU1i3ahpn3iJT7kDj6sw5tfKLVTW0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aeD+LbO4wVUy/KEvxNPhqEZtMQmSfA5FGq1XWwbM/T7sp26lqtRuZmraambc306rauh9S+ynTxxaoxZ5hiBtAAh6qP2BUwsFHVUAq2NT3w3RRpeAo8CDFPSXRa+q4LLP1c1lEnUPeX/CdEozh5v24KFX+CNVYzoCt1azNAci5Oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=C/S9dsBx; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="C/S9dsBx"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4679b5c66d0so40761cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 11:37:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738870663; x=1739475463; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1fOBSotabUbiNEkU1i3ahpn3iJT7kDj6sw5tfKLVTW0=;
        b=C/S9dsBxmtIWEuUWpGZ/SiOQO/VLZd62IK5XyOVsR5YjNVVHmnMDy9YFSc54ayDHbc
         pNo6xFaz6PjpSMlZ780pbdvSMCxrC1FfzgNVsBWPh4uBvyxcF6i4myNc1E0OfXEs9gSy
         Z9aLgqva0foSkAPWciHZe2LJ2+DxxYpxdM7jeIiQzddObKu4zJyaI0YApuRGRfk9yY86
         EXyNXh2pAApMxuP1RZ+CWZuwO5I5i9XfH8jdwRLvtSxVQPtBaJz9IuqHO2h6UFaCo8jc
         8r9qIm7HnBZKOQFpioQTXBxFXyxTOjnnYSZ2BIo+N0EsfPTm+skUTf1wUgiO9EasSgrH
         m8ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738870663; x=1739475463;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1fOBSotabUbiNEkU1i3ahpn3iJT7kDj6sw5tfKLVTW0=;
        b=Iyc2yNqoy9Zv1ZCgWeVm7fRZJtSAwaNcRHvGVGkpO3INgAHTZevjcprBXJD9jJYM4h
         Ufs2Mc1jWAvt4QXWCE3M1oe8viyKBpNjJZKqBX4oNehkH2p5i2bdGuFTLAkKxlluDuEt
         tRhOFfsW1Ij+hMSk/xLYOWGxGWvsvjQf+cYjG4USCaQeeFvHPAoWiD9FWs2AqgS2SyaR
         SMmS7slzMQCvpOJPh8TDfL4MwuFKzeKDzQ0NTJBPcVEhxl1J5bioGsHyOnXqWiRy+BBL
         HDR65NYeFnnNlZ4+jxBDGuoByLFavuwyWk3lYyWjBz7h+H02dwIEKpT3UzDBhXJcaGbR
         ZrIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUja0fCNQzvhU+ecyqtmyT8UrC1RyUiLa/YTrTanVR5CDJvG5hqRN57nQUvGicgUxR46hJ1XSROsHPb7rw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxp4/2+jh4+xyZ4mD8rS9la0LbFGAwrXK/El/QSD4RqUzuAGKau
	h9dnSzVir2vvPXpqYIDz4vpqPREZix5ZOvOdS6KHxw/sgZiqDZh2uHp6+kCi7n42UDasl4UgESu
	hvKYz2JjA+JvKIwHmv58mlWbdK/t71LYUfib/
X-Gm-Gg: ASbGncsTDz/sWhzq6PqtDaxp0JpeAe7k8XZ5aD8lYbdjRtJOSVj4S4rD+GDgFUIt2CO
	vOCaGxlk7elBaf8myHhJtHRVUUHj2MswdpdON/Bs6Vj67J26SYteI2JKZxAjyuE6gUXM2toKo7T
	WcT9nCVczWP1lYbSvYMuuDdT0H/b0=
X-Google-Smtp-Source: AGHT+IF5gcj7RwLxoY9dHuLAsZYeyd8PzDxP/5Bhyd910Q/jlsEYsY1jhfG9vSf69IxjLgvuxW1YntQdA6bHBpDIkHg=
X-Received: by 2002:ac8:6d10:0:b0:466:861a:f633 with SMTP id
 d75a77b69052e-47168810975mr122421cf.5.1738870663117; Thu, 06 Feb 2025
 11:37:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250205222029.2979048-1-shakeel.butt@linux.dev>
 <mshcu3puv5zjsnendao73nxnvb2yiprml7aqgndc37d7k4f2em@vqq2l6dj7pxh> <ctuqkowzqhxvpgij762dcuf24i57exuhjjhuh243qhngxi5ymg@lazsczjvy4yd>
In-Reply-To: <ctuqkowzqhxvpgij762dcuf24i57exuhjjhuh243qhngxi5ymg@lazsczjvy4yd>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Thu, 6 Feb 2025 11:37:31 -0800
X-Gm-Features: AWEUYZnlJFAzlgtpxwDOLgRzF9l_JBXAaDX14-ukU7OJ52CaWgfL_jvK_ty4s9Q
Message-ID: <CABdmKX2SnGytEHOr7-2V11hczZALy0joOD8uMDBqJZWviXPTTw@mail.gmail.com>
Subject: Re: [PATCH] memcg: add hierarchical effective limits for v2
To: Shakeel Butt <shakeel.butt@linux.dev>
Cc: =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Muchun Song <muchun.song@linux.dev>, linux-mm@kvack.org, 
	cgroups@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Meta kernel team <kernel-team@meta.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 6, 2025 at 11:09=E2=80=AFAM Shakeel Butt <shakeel.butt@linux.de=
v> wrote:
>
> On Thu, Feb 06, 2025 at 04:57:39PM +0100, Michal Koutn=C3=BD wrote:
> > Hello Shakeel.
> >
> > On Wed, Feb 05, 2025 at 02:20:29PM -0800, Shakeel Butt <shakeel.butt@li=
nux.dev> wrote:
> > > Memcg-v1 exposes hierarchical_[memory|memsw]_limit counters in its
> > > memory.stat file which applications can use to get their effective li=
mit
> > > which is the minimum of limits of itself and all of its ancestors.
> >
> > I was fan of equal idea too [1]. The referenced series also tackles
> > change notifications (to make this complete for apps that really want t=
o
> > scale based on the actual limit). I ceased to like it when I realized
> > there can be hierarchies when the effective value cannot be effectively
> > :) determined [2].
> >
> > > This is pretty useful in environments where cgroup namespace is used
> > > and the application does not have access to the full view of the
> > > cgroup hierarchy. Let's expose effective limits for memcg v2 as well.
> >
> > Also, the case for this exposition was never strongly built.
> > Why isn't PSI enough in your case?
> >
>
> Hi Michal,
>
> Oh I totally forgot about your series. In my use-case, it is not about
> dynamically knowning how much they can expand and adjust themselves but
> rather knowing statically upfront what resources they have been given.
> More concretely, these are workloads which used to completely occupy a
> single machine, though within containers but without limits. These
> workloads used to look at machine level metrics at startup on how much
> resources are available.
>
> Now these workloads are being moved to multi-tenant environment but
> still the machine is partitioned statically between the workloads. So,
> these workloads need to know upfront how much resources are allocated to
> them upfront and the way the cgroup hierarchy is setup, that information
> is a bit above the tree.
>
> I hope this clarifies the motivation behind this change i.e. the target
> is not dynamic load balancing but rather upfront static knowledge.
>
> thanks,
> Shakeel
>

We've been thinking of using memcg to both protect (memory.min) and
limit (via memcg OOM) memory hungry apps (games), while informing such
apps of their upper limit so they know how much they can allocate
before risking being killed. Visibility of the cgroup hierarchy isn't
an issue, but having a single file to read instead of walking up the
tree with multiple reads to calculate an effective limit would be
nice. Partial memcg activation in the hierarchy *is* an issue, but
walking up to the closest ancestor with memcg activated is better than
reading all the way up.
